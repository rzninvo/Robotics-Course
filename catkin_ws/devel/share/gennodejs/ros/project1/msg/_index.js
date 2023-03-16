
"use strict";

let controller = require('./controller.js');
let motor1 = require('./motor1.js');
let distance_sensor = require('./distance_sensor.js');
let motor2 = require('./motor2.js');

module.exports = {
  controller: controller,
  motor1: motor1,
  distance_sensor: distance_sensor,
  motor2: motor2,
};
