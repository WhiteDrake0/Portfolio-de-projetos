//#Ship
function LoadShip() {
    // Load model
    var loader = new THREE.MTLLoader();
    loader.load('models/SpaceShip.mtl', handle_load);

    function handle_load(material) {

        material.preload();
        var objLoader = new THREE.OBJLoader();
        objLoader.setMaterials(material);
        objLoader.load('models/SpaceShip.obj', function (obj) {
            ship = obj;

            var boxgeomettry = new THREE.BoxGeometry(7, 2, 7);
            var boxmaterial = new THREE.MeshPhongMaterial({ color: 0x008800, wireframe: true, transparent: true, opacity: 0 });
            box = new THREE.Mesh(boxgeomettry, boxmaterial);
            ship.add(box);
            scene.add(ship);
            box.position.z = 2.2;
            ship.rotation.y = THREE.Math.degToRad(180);

            // adiconar colidor
            box.geometry.computeBoundingBox();




        })
    }
}