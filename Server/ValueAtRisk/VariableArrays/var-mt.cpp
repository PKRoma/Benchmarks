#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <pthread.h>
#include <vector>

#define NS 10
#define CORES 8

uint32_t initialSeed( size_t index )
{
  uint32_t seed = 1;
  uint32_t mult = 300773;
  size_t mask = 1;
  while ( mask != 0 )
  {
    if ( index & mask )
      seed = (seed * mult) % 1073741824;
    mult = (mult * mult) % 1073741824;
    mask <<= 1;
  }
  return seed;
}

inline double nextUniform01( uint32_t &seed )
{
  seed = (seed * 300773) % 1073741824;
  //printf( "%u\n", (unsigned)seed );
  return double(seed) / double(1073741824.0);
}

inline double randomNormal( uint32_t &seed )
{
  double x1, x2, w;
  do
  {
    x1 = 2.0 * nextUniform01( seed ) - 1.0;
    x2 = 2.0 * nextUniform01( seed ) - 1.0;
    w = x1 * x1 + x2 * x2;
  } while ( w >= 1.0 );
  w = sqrt( (-2.0 * log(w)) / w );
  return x1 * w;
}

typedef std::vector<double> Vec;

inline void randomNormalVec( size_t length, Vec &vec, uint32_t &seed )
{
  vec.resize(length);
  for ( size_t i=0; i<NS; ++i )
    vec[i] = randomNormal( seed );
}

typedef std::vector<Vec> Mat;

inline void multMatVec( Mat const &mat, Vec const &vec, Vec &res )
{
  size_t length = vec.size();
  res.resize(length);
  for ( size_t i=0; i<length; ++i )
  {
    res[i] = 0.0;
    for ( size_t j=0; j<length; ++j )
      res[i] += mat[i][j] * vec[j];
  }
}

inline double runTrial(
  size_t index,
  size_t numTradingDays,
  double dt,
  double sqrtDT,
  Mat const &choleskyTrans,
  Vec const &drifts
  )
{
  size_t length = drifts.size();

  uint32_t seed = initialSeed( 4096 * (1+index) );

  Vec amounts;
  amounts.resize(length);
  for ( size_t i=0; i<NS; ++i )
    amounts[i] = 100.0;

  Vec Z, X;
  for ( size_t day=0; day<numTradingDays; ++day )
  {
    randomNormalVec( length, Z, seed );
    multMatVec( choleskyTrans, Z, X );
    for ( size_t i=0; i<NS; ++i )
      amounts[i] *= exp(drifts[i]*dt + X[i]*sqrtDT);
  }

  double value = 0.0;
  for ( size_t i=0; i<length; ++i )
    value += amounts[i];
  return value;
}

struct FixedArgs
{
  size_t numTradingDays;
  double dt;
  double sqrtDT;
  Mat choleskyTrans;
  Vec drifts;
};

struct Args
{
  FixedArgs *fixedArgs;
  size_t startIndex;
  size_t endIndex;
  double *trialResults;
};

void *threadEntry( void *_args )
{
  Args const *args = (Args const *)_args;
  for ( size_t index = args->startIndex;
    index != args->endIndex; ++index )
  {
    args->trialResults[index] = runTrial(
      index,
      args->fixedArgs->numTradingDays,
      args->fixedArgs->dt,
      args->fixedArgs->sqrtDT,
      args->fixedArgs->choleskyTrans,
      args->fixedArgs->drifts
    );
  }
  return 0;
}

void trans( Mat const &A, Mat &B )
{
  size_t length = A.size();
  B.resize(length);
  for ( size_t i=0; i<length; ++i )
  {
    B[i].resize(length);
    for ( size_t j=0; j<length; ++j )
    {
      B[i][j] = A[j][i];
    }
  }
}

void multMatMat( Mat const &A, Mat const &B, Mat &R )
{
  size_t length = A.size();
  R.resize(length);
  for ( size_t i=0; i<length; ++i )
  {
    R[i].resize(length);
    for ( size_t j=0; j<length; ++j )
    {
      R[i][j] = 0.0;
      for ( size_t k=0; k<length; ++k )
        R[i][j] += A[i][k] * B[k][j];
    }
  }
}

void randomCorrelation( size_t length, Mat &R, uint32_t &seed )
{
  Mat T;
  T.resize(length); 
  for ( size_t i=0; i<NS; ++i )
  {
    T[i].resize(length);
    for ( size_t j=0; j<length; ++j )
    {
      T[i][j] = randomNormal( seed );
    }
  }

  for ( size_t j=0; j<length; ++j )
  {
    double sqSum = 0.0;
    for ( size_t i=0; i<length; ++i )
    {
      sqSum += T[i][j] * T[i][j];
    }
    double norm = sqrt( sqSum );
    for ( size_t i=0; i<length; ++i )
      T[i][j] /= norm;
  }

  Mat TTrans;
  trans( T, TTrans );

  multMatMat( TTrans, T, R );
}

void computeCholeskyTrans( Mat const &A, Mat &B )
{
  size_t length = A.size();

  B.resize(length);
  for ( size_t i=0; i<length; ++i )
  {
    B[i].resize(length);
    for ( size_t j=0; j<length; ++j )
      B[i][j] = 0.0;
  }

  for ( size_t i=0; i<length; ++i )
  {
    for ( size_t j=0; j<i+1; ++j )
    {
      double s = 0.0;
      for ( size_t k=0; k<j; ++k )
        s += B[i][k] * B[j][k];
      if ( i == j )
        B[i][i] = sqrt( A[i][i] - s );
      else
        B[i][j] = 1.0 / B[j][j] * (A[i][j] - s);
    }
  }
}

int doubleCompare( void const *_lhs, void const *_rhs )
{
  double lhs = *(double const *)_lhs;
  double rhs = *(double const *)_rhs;
  if ( lhs < rhs )
    return -1;
  else if ( lhs > rhs )
    return 1;
  else return 0;
}

int main( int argc, char **argv )
{
  static const size_t numStocks = 10;

  //size_t const numTrials = 65536;
  size_t const numTrials = 1048576;
  double *trialResults = new double[numTrials];

  FixedArgs fixedArgs;
  fixedArgs.numTradingDays = 252;
  fixedArgs.dt = 1.0 / fixedArgs.numTradingDays;
  fixedArgs.sqrtDT = sqrt( fixedArgs.dt );

  Vec priceMeans;
  priceMeans.resize(numStocks);
  for ( size_t i=0; i<NS; ++i )
    priceMeans[i] = 25.0/fixedArgs.numTradingDays;

  Vec priceDevs;
  priceDevs.resize(numStocks);
  for ( size_t i=0; i<NS; ++i )
    priceDevs[i] = 25.0/fixedArgs.numTradingDays;

  uint32_t seed = initialSeed(0);

  Mat priceCorrelations;
  randomCorrelation( numStocks, priceCorrelations, seed );

  Mat priceCovariance;
  priceCovariance.resize(numStocks);
  for ( size_t i=0; i<numStocks; ++i )
  {
    priceCovariance[i].resize(numStocks);
    for ( size_t j=0; j<numStocks; ++j )
    {
      priceCovariance[i][j] = priceDevs[i] * priceDevs[j] * priceCorrelations[i][j];
    }
  }

  computeCholeskyTrans( priceCovariance, fixedArgs.choleskyTrans );

  fixedArgs.drifts.resize(numStocks);
  for ( size_t i=0; i<numStocks; ++i )
    fixedArgs.drifts[i] = priceMeans[i] - priceCovariance[i][i]/2.0;

  Args args[CORES];
  pthread_t threads[CORES-1];
  for ( size_t core=0; core<CORES; ++core )
  {
    if ( core == 0 )
      args[core].startIndex = 0;
    else
      args[core].startIndex = args[core-1].endIndex;
    if ( core+1 == CORES )
      args[core].endIndex = numTrials;
    else
      args[core].endIndex = args[core].startIndex + numTrials/CORES;
    args[core].fixedArgs = &fixedArgs;
    args[core].trialResults = trialResults;
    if ( core+1 == CORES )
      threadEntry( &args[core] );
    else
      pthread_create( &threads[core], 0, &threadEntry, &args[core] );
  }

  for ( size_t core=0; core<CORES-1; ++core )
    pthread_join( threads[core], 0 );

  qsort( trialResults, numTrials, sizeof(double), doubleCompare );

  printf( "VaR = %.16f\n", 100.0*NS - trialResults[(size_t)floor( 0.05 * numTrials )] );

  delete [] trialResults;

  return 0;
}
