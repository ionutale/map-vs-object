function main() {
  switch (process.env.TYPE) {
    case 'object':
      runObject();
      break;
    case 'map':
      runMap();
      break;
    case 'array':
      runArray();
      break;
    default:
      console.log('Please provide a TYPE env variable with one of the following values: object, map, array');
      break;
  }
}

main();




function runObject() {
  const maxIterations = process.env.ITERATIONS || 100_000;
  console.time(`object ${maxIterations}`);

  let index = 0;
  const myMap = {};

  do {
    const random = Math.random() * maxIterations;
    myMap[index] = random;
    index++;
  } while (index < maxIterations);
  console.timeEnd(`object ${maxIterations}`);

  // const distantIndex = Math.round(0.9 * maxIterations);

  // console.time(`object ${distantIndex} - access`);
  // console.log('found-value: ', myMap[distantIndex]);
  // console.timeEnd(`object ${distantIndex} - access`);
}



function runMap() {
  const maxIterations = process.env.ITERATIONS || 100_000;
  console.time(`map___ ${maxIterations}`);

  let index = 0;
  const myMap = new Map();

  do {
    const random = Math.random() * maxIterations;
    myMap.set(index, random);
    index++;
  } while (index < maxIterations);
  console.timeEnd(`map___ ${maxIterations}`);

  // const distantIndex = Math.round(0.9 * maxIterations);

  // console.time(`map ${distantIndex} - access`);
  // console.log('found-value: ', myMap.get(distantIndex));
  // console.timeEnd(`map ${distantIndex} - access`);
}



function runArray() {
  const maxIterations = process.env.ITERATIONS || 100_000;
  console.time(`array_ ${maxIterations}`);

  let index = 0;
  const myMap = [];

  do {
    const random = Math.random() * maxIterations;
    myMap[index] = random;
    index++;
  } while (index < maxIterations);
  console.timeEnd(`array_ ${maxIterations}`);

  // const distantIndex = Math.round(0.9 * maxIterations);

  // console.time(`array ${distantIndex} - access`);
  // console.log('found-value: ', myMap[distantIndex]);
  // console.timeEnd(`array ${distantIndex} - access`);
}