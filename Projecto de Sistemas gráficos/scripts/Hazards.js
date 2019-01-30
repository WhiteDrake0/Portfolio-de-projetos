// #Hazards
function CreatHazards() {


    for (let i = 0; i < 10; i++) {
        // Load texture
        var SphereTexture = new THREE.TextureLoader().load('./images/meteor.png');

        // Creat Spheres
        var spheregeometry = new THREE.SphereGeometry(3, 12, 12);
        var spherematerial = new THREE.MeshLambertMaterial({ map: SphereTexture });

        meteor = new THREE.Mesh(spheregeometry, spherematerial);

        var verts = meteor.geometry.vertices;

        for (var j = 0; j < verts.length; j++) {
            var x = -2 + Math.random();
            var y = -2 + Math.random();
            var z = -2 + Math.random();

            verts[j].x += x;
            verts[j].y += y;
            verts[j].z += z;
        }

        meteor.geometry.vertices = verts;

        // add to hazard
        hazards.push(meteor);
        // position
        meteor.position.set(-22 + Math.random() * 44, 0, -90 - i * 18);

        //Rotation
        meteor.rotation.y = Math.random() * 2 * Math.PI;
        meteor.rotation.z = Math.random() * 2 * Math.PI;

        // Shadows
        meteor.receiveShadow = true;
        meteor.castShadow = true;

        //collision box
        meteor.geometry.computeBoundingBox();

        // Add to scene object
        scene.add(meteor)

    }

}