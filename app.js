
const cron = require('node-cron');

// Cuanats veces se hace un tick 
let time = 0;

cron.schedule('1-59/5 * * * * *', () => {
    time++;
    console.log('Tick multiplos de 5 : ', time);
})

console.log('Inicio de la aplicacion');