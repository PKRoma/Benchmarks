import math
import random

class _Callable:
  def __init__( self, call ):
    self.__call__ = call

def _mul( lhs, rhs ):
  return {
    'lo': (lhs['lo'] * rhs['lo'])&0x7FFF,
    'hi': (
        ((lhs['lo']*rhs['lo'])>>15)
        + lhs['lo'] * rhs['hi']
        + lhs['hi'] * rhs['lo']
        )&0x7FFF
  }

def normal( generator ):
  w = 1.0
  while w >= 1.0:
    x1 = 2.0 * generator.nextUniform01() - 1.0
    x2 = 2.0 * generator.nextUniform01() - 1.0
    w = x1 * x1 + x2 * x2
  w = math.sqrt( (-2.0 * math.log(w)) / w )
  return x1 * w

def normalVec( n, generator ):
  v = []
  for i in range(0, n):
    v.insert(i, normal(generator))
  return v

class Random:
  class BuiltinGenerator():
    def seed( index ):
      pass
    seed = _Callable( seed )
    def nextUniform01():
      return random.random()
    nextUniform01 = _Callable( nextUniform01 )

  class ExpGenerator():
    base = { 'lo': 300773 & 0x7FFF, 'hi': 300773 >> 15 }
    cur = None

    def seed( index ):
      Random.ExpGenerator.cur = { 'lo': 1, 'hi': 0 }
      mask = 1
      mult = { 'lo': Random.ExpGenerator.base['lo'], 'hi': Random.ExpGenerator.base['hi'] }
      for i in range(0, 30):
        if index & mask:
          Random.ExpGenerator.cur = _mul(Random.ExpGenerator.cur, mult)
        mult = _mul(mult, mult)
        mask <<= 1
    seed = _Callable( seed )

    def nextUniform01():
      Random.ExpGenerator.cur = _mul(Random.ExpGenerator.cur, Random.ExpGenerator.base)
      seed = ((Random.ExpGenerator.cur['lo'] + (Random.ExpGenerator.cur['hi']<<15))&0x3FFFFFFF)
      return seed / 1073741824.0
    nextUniform01 = _Callable( nextUniform01 )

class mat:
  def zero( rows, cols ):
    M = []
    for i in range(0, rows):
      M.insert(i, [])
      for j in range(0, cols):
        M[i].insert(j, 0.0)
    return M
  zero = _Callable( zero )

  def mulVec( M, v ):
    r = []
    for i in range(0, len(M)):
      sum = 0.0
      for j in range(0, len(v)):
        sum += M[i][j] * v[j]
      r.insert(i, sum)
    return r
  mulVec = _Callable( mulVec )

  def mul( M, N ):
    R = []
    for i in range(0, len(M)):
      if len(M[i]) != len(N):
        raise Exception( "bad matricies" )
      R.insert(i, [])
      for j in range(0, len(N[0])):
        sum = 0
        for k in range(0, len(N)):
          sum += M[i][k] * N[k][j]
        R[i].insert(j, sum)
    return R
  mul = _Callable( mul )

  def trans( M ):
    R = []
    for i in range(0, len(M[0])):
      R.insert(i, [])
      for j in range(0, len(M)):
        R[i].insert(j, M[j][i])
    return R
  trans = _Callable( trans )

def randomCorrelation( n, prng ):
  T = []

  # Generate n uniform random columns
  for i in range(0, n):
    T.insert(i, [])
    for j in range(0, n):
      T[i].insert(j, Random.normal(prng))

  # Normalize the columns
  for j in range(0, n):
    sqSum = 0
    for i in range(0, n):
      sqSum += T[i][j] * T[i][j]
    norm = math.sqrt(sqSum)
    for i in range(0, n):
      T[i][j] /= norm

  # result is T'*T
  return mat.mul(mat.trans(T), T)

def choleskyTrans( A ):
  n = len(A)
  
  L = mat.zero(n, n)
  for i in range(0, n):
    for j in range(0, i+1):
      s = 0.0
      for k in range(0, j):
        s += L[i][k] * L[j][k]
      if i == j:
        L[i][i] = math.sqrt(A[i][i]-s)
      else:
        L[i][j] = 1.0/L[j][j]*(A[i][j]-s)
  return L

def cholesky( A ):
  return mat.trans(choleskyTrans(A))

