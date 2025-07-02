const sum = require('../index');

if (sum(2, 3) !== 5) {
  console.error("Test failed!");
  process.exit(1);
}

console.log("Test passed!");
