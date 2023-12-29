const { syncDB } = require("../../tasks/sync-db");


describe('Pruebas en sync-db', () => {

    test('Debe de ejecutar el proceso 2 veces ', () => { 

        syncDB();
        const times = syncDB();
        // console.log("se llamo: ",times);

        expect(times).toBe(2);

     })
});