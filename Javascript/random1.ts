const naturalNumberCalculator = async ({ accuracy }: { accuracy: number }) => {
  let result = 0;
  let lapTracker = false;

  for (let i = 0; i < accuracy; i++) {
    if (i % 100_000 == 0) {
      lapTracker = !lapTracker;
      console.time("Lap completion");
    }
    result = result + 1 / factorial({ start: i });
    console.log(`Count - ${i}: ${result}`);
    if (lapTracker) {
      console.timeEnd("Lap completion");
      await new Promise((res) => setTimeout(res, 500));
      lapTracker = !lapTracker;
    }
  }

  return result;
};

const factorial = ({ start }: { start: number }) => {
  let result = 1;

  for (let i = start; i > 0; i--) {
    result = result * i;
  }

  return result;
};

console.time("timer1");
naturalNumberCalculator({ accuracy: 216000 }).then((result) => {
  console.log(result);

  console.timeEnd("timer1");
});
