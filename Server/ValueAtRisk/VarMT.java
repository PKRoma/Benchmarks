import java.util.Arrays;

import static com.sun.org.apache.xalan.internal.lib.ExsltMath.exp;
import static java.lang.Math.floor;
import static java.lang.Math.log;
import static java.lang.Math.sqrt;

/**
 * Direct Java port of the benchmark from C++
 * <p/>
 * User: sam
 * Date: 11/12/11
 * Time: 1:59 PM
 */
public class VarMT {

  static final int NS = 10;
  static final int CORES = 12;

  static long initialSeed(int index) {
    long seed = 1;
    long mult = 300773;
    long mask = 1;
    while (mask != 0) {
      if ((index & mask) != 0)
        seed = (seed * mult) % 1073741824;
      mult = (mult * mult) % 1073741824;
      mask <<= 1;
    }
    return seed;
  }

  static double nextUniform01(long[] seed) {
    seed[0] = (seed[0] * 300773) % 1073741824;
    //printf( "%u\n", (unsigned)seed );
    return (double) seed[0] / 1073741824.0;
  }

  static double randomNormal(long[] seed) {
    double x1, x2, w;
    do {
      x1 = 2.0 * nextUniform01(seed) - 1.0;
      x2 = 2.0 * nextUniform01(seed) - 1.0;
      w = x1 * x1 + x2 * x2;
    } while (w >= 1.0);
    w = sqrt((-2.0 * log(w)) / w);
    return x1 * w;
  }

  static void randomNormalVec(double[] vec, long[] seed) {
    for (int i = 0; i < NS; ++i)
      vec[i] = randomNormal(seed);
  }

  static void multMatVec(double[][] mat, double[] vec, double[] res) {
    for (int i = 0; i < NS; ++i) {
      res[i] = 0.0;
      for (int j = 0; j < NS; ++j)
        res[i] += mat[i][j] * vec[j];
    }
  }

  static double runTrial(
      int index,
      int numTradingDays,
      double dt,
      double sqrtDT,
      double[][] choleskyTrans,
      double[] drifts
  ) {
    long[] seedp = new long[1];
    seedp[0] = initialSeed(4096 * (1 + index));

    double[] amounts = new double[NS];
    for (int i = 0; i < NS; ++i)
      amounts[i] = 100.0;

    for (int day = 0; day < numTradingDays; ++day) {
      double[] Z = new double[NS];
      randomNormalVec(Z, seedp);
      double[] X = new double[NS];
      multMatVec(choleskyTrans, Z, X);
      for (int i = 0; i < NS; ++i)
        amounts[i] *= exp(drifts[i] * dt + X[i] * sqrtDT);
    }

    double value = 0.0;
    for (int i = 0; i < NS; ++i)
      value += amounts[i];
    return value;
  }

  static class FixedArgs {
    int numTradingDays;
    double dt;
    double sqrtDT;
    double[][] choleskyTrans = new double[NS][NS];
    double[] drifts = new double[NS];
  }

  static class Args {
    FixedArgs fixedArgs;
    int startIndex;
    int endIndex;
    double[] trialResults = new double[1];
  }

  static void threadEntry(Args args) {
    for (int index = args.startIndex;
         index != args.endIndex; ++index) {
      args.trialResults[index] = runTrial(
          index,
          args.fixedArgs.numTradingDays,
          args.fixedArgs.dt,
          args.fixedArgs.sqrtDT,
          args.fixedArgs.choleskyTrans,
          args.fixedArgs.drifts
      );
    }
  }

  static void trans(double[][] A, double[][] B) {
    for (int i = 0; i < NS; ++i) {
      for (int j = 0; j < NS; ++j) {
        B[i][j] = A[j][i];
      }
    }
  }

  static void multMatMat(double[][] A, double[][] B, double[][] R) {
    for (int i = 0; i < NS; ++i) {
      for (int j = 0; j < NS; ++j) {
        R[i][j] = 0.0;
        for (int k = 0; k < NS; ++k)
          R[i][j] += A[i][k] * B[k][j];
      }
    }
  }


  static void randomCorrelation(double[][] R, long[] seed) {
    double[][] T = new double[NS][NS];
    for (int i = 0; i < NS; ++i) {
      for (int j = 0; j < NS; ++j) {
        T[i][j] = randomNormal(seed);
      }
    }

    for (int j = 0; j < NS; ++j) {
      double sqSum = 0.0;
      for (int i = 0; i < NS; ++i) {
        sqSum += T[i][j] * T[i][j];
      }
      double norm = sqrt(sqSum);
      for (int i = 0; i < NS; ++i)
        T[i][j] /= norm;
    }

    double[][] TTrans = new double[NS][NS];
    trans(T, TTrans);

    multMatMat(TTrans, T, R);
  }

  static void computeCholeskyTrans(double[][] A, double[][] B) {
    for (int i = 0; i < NS; ++i)
      for (int j = 0; j < NS; ++j)
        B[i][j] = 0.0;

    for (int i = 0; i < NS; ++i) {
      for (int j = 0; j < i + 1; ++j) {
        double s = 0.0;
        for (int k = 0; k < j; ++k)
          s += B[i][k] * B[j][k];
        if (i == j)
          B[i][i] = sqrt(A[i][i] - s);
        else
          B[i][j] = 1.0 / B[j][j] * (A[i][j] - s);
      }
    }
  }

  public static void main(String[] a) throws InterruptedException {
    int numTrials = 1048576;
    double[] trialResults = new double[numTrials];

    FixedArgs fixedArgs = new FixedArgs();
    fixedArgs.numTradingDays = 252;
    fixedArgs.dt = 1.0 / fixedArgs.numTradingDays;
    fixedArgs.sqrtDT = sqrt(fixedArgs.dt);

    double[] priceMeans = new double[NS];
    for (int i = 0; i < NS; ++i)
      priceMeans[i] = 25.0 / fixedArgs.numTradingDays;

    double[] priceDevs = new double[NS];
    for (int i = 0; i < NS; ++i)
      priceDevs[i] = 25.0 / fixedArgs.numTradingDays;

    long[] seed = new long[1];
    seed[0] = initialSeed(0);

    double[][] priceCorrelations = new double[NS][NS];
    randomCorrelation(priceCorrelations, seed);

    double[][] priceCovariance = new double[NS][NS];
    for (int i = 0; i < NS; ++i) {
      for (int j = 0; j < NS; ++j) {
        priceCovariance[i][j] = priceDevs[i] * priceDevs[j] * priceCorrelations[i][j];
      }
    }

    computeCholeskyTrans(priceCovariance, fixedArgs.choleskyTrans);

    for (int i = 0; i < NS; ++i)
      fixedArgs.drifts[i] = priceMeans[i] - priceCovariance[i][i] / 2.0;

    final Args[] args = new Args[CORES];
    final Thread[] threads = new Thread[CORES - 1];
    for (int core = 0; core < CORES; ++core) {
      args[core] = new Args();
      if (core == 0)
        args[core].startIndex = 0;
      else
        args[core].startIndex = args[core - 1].endIndex;
      if (core + 1 == CORES)
        args[core].endIndex = numTrials;
      else
        args[core].endIndex = args[core].startIndex + numTrials / CORES;
      args[core].fixedArgs = fixedArgs;
      args[core].trialResults = trialResults;
      if (core + 1 == CORES)
        threadEntry(args[core]);
      else {
        final int finalCore = core;
        threads[core] = new Thread() {
          public void run() {
            threadEntry(args[finalCore]);
          }
        };
        threads[core].start();
      }
    }

    for (int core = 0; core < CORES - 1; ++core)
      threads[core].join();

    Arrays.sort(trialResults);

    System.out.printf("VaR = %.16f\n", 100.0 * NS - trialResults[(int) floor(0.05 * numTrials)]);

  }
}
