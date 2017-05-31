function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase);
}

function fizzBuzz(array) {
  const arr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      arr.push(el);
    }
  });

  return arr;

}

function isPrime(number) {
  if (number < 2) { return false; }
  for (var i = 2; i < number; i++) {
    if (number%i == 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  const sum = 0;
  for (var i = 0; i <= n; i++) {
    if (isPrime(i)) {
      sum += i;
    }
  }
  sum;
}
