// funcion para sincrinizar el proceso automatico

let times = 0

const syncDB = () => {
    times++;
    console.log('Tick multiplos de 5 : ', times);

    return times;
}

module.exports = {
    syncDB
}