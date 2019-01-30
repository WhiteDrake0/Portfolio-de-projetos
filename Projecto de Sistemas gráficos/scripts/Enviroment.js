// #Envirement
function LoadEnvirement() {

    // Load texture
    spaceTexture = new THREE.TextureLoader().load('./images/starfield.png');
    spaceTexture.wrapS = THREE.RepeatWrapping;
    spaceTexture.wrapT = THREE.RepeatWrapping;

    //criar objecto
    var SpaceGeometry = new THREE.SphereGeometry(6000, 32, 32);
    var SpaceMaterial = new THREE.MeshBasicMaterial({ map: spaceTexture, side: THREE.BackSide })
    var space = new THREE.Mesh(SpaceGeometry, SpaceMaterial);

    //adicionar Limites
    var geomettry = new THREE.BoxGeometry(690, 690, 690);
    var material = new THREE.MeshPhongMaterial({ color: 0x008800, wireframe: true, transparent: true, opacity: 0 });
    var box2 = new THREE.Mesh(geomettry, material);
    box2.geometry.computeBoundingBox();
    boundry = new THREE.Box3().setFromObject(box2);



    // Change rotation
    space.rotation.z = THREE.Math.degToRad(90);
    space.rotation.y = THREE.Math.degToRad(90);

    scene.add(space);
}