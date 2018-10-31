const cellAt = function(r, c, world) {
  var row = world[r];
  if (row == undefined || row[c] == undefined) {
    return 0;
  }
  return world[r][c];
}
 
const neighbours = function(r, c, world) {
  return [
    cellAt(r-1, c-1, world), cellAt(r-1, c  , world), cellAt(r-1, c+1, world), 
    cellAt(r,   c-1, world),                          cellAt(r,   c+1, world), 
    cellAt(r+1, c-1, world), cellAt(r+1, c  , world), cellAt(r+1, c+1, world)  
  ];
}
 
const isAlive = cell => cell != 0;
const isUnderPopulated = liveNeighbours => liveNeighbours < 2;
const canSurvive = liveNeighbours => liveNeighbours == 2 || liveNeighbours == 3;
const isOverCrowded = liveNeighbours => liveNeighbours > 3;
const canReproduce = liveNeighbours => liveNeighbours == 3;
 
const newCell = function(cell, neighbours) {
  const liveNeighbours = neighbours.reduce((a, b) => a + b);
  if (isAlive(cell) && (isUnderPopulated(liveNeighbours) || isOverCrowded(liveNeighbours))) {
    return 0;
  }
  if (isAlive(cell) && canSurvive(liveNeighbours)) {
    return 1;
  }
  if (!isAlive(cell) && canReproduce(liveNeighbours)) {
    return 1;
  }
  return 0;
}
 
const newWorld = 
  oldWorld => oldWorld.map((row, r) => 
    row.map((oldCell, c) => 
      newCell(oldCell, neighbours(r, c, oldWorld))));

const oscillatorBlinker = [
  [0, 1, 0],
  [0, 1, 0],
  [0, 1, 0]
];

const spaceshipGlider = [
  [0, 1, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
];

const gliderGun = [
  [1, 1, 1, 0, 1],
  [1, 0, 0, 0, 0],
  [0, 0, 0, 1, 1],
  [0, 1, 1, 0, 1],
  [1, 0, 1, 0, 1]
];

const oscillatingPulsar = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
];

const oscillatingToad = [
  [0, 0, 0, 0],
  [0, 1, 1, 1],
  [1, 1, 1, 0],
  [0, 0, 0, 0]
];

const render = world => world.join("\n").replace(/,/g, "").concat("\n");

Rx = require("./javascript_lib/rx/rx.lite.js");
Rx.Observable.interval(500)
  .take(5)
  .scan((oldWorld, n) => newWorld(oldWorld), oscillatorBlinker)
  .subscribe(
     w => console.info(render(w)),
     e => console.info(e.message),
    () => console.info("*** Complete ***")
  );