fun Fib 0 = 1
  | Fib 1 = 1 
  | Fib(n) = Fib(n-1) + Fib(n-2);

Fib(8);

fun dev 1 = 1 
  |dev 2 = 1 
  |dev n = dev(dev(n-1)) + dev(n-dev(n-1));

dev(3);
dev(7);
