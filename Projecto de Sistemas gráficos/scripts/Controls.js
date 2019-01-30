// #Controls
document.addEventListener("keydown", onDocumentKeyDown, false);
document.addEventListener("keyup", onDocumentKeyUp, false);
function onDocumentKeyDown(event) {
    var keyCode = event.which;
    //up
    if (keyCode == 87) {
        buttonUp = true;
        //down
    } else if (keyCode == 83) {
        buttonDown = true;
        //left
    } else if (keyCode == 65) {
        buttonLeft = true;
        //right
    } else if (keyCode == 68) {
        buttonRight = true;

    } else if (keyCode == 82) {
        ReStart = true;
    }
};
function onDocumentKeyUp(event) {
    var keyCode = event.which;
    //up
    if (keyCode == 87) {
        buttonUp = false;
        //down
    } else if (keyCode == 83) {
        buttonDown = false;
        //left
    } else if (keyCode == 65) {
        buttonLeft = false;
        //right
    } else if (keyCode == 68) {
        buttonRight = false;
    } if (keyCode == 82) {
        ReStart = false;
    }

};

document.addEventListener("click", function () {

    if (reserva.length != 0 && !end) {

        lasers.push(reserva[reserva.length - 1]);
        // adicionar colliderBox
        var geometry = new THREE.BoxGeometry(1, 0.1, 0.1);
        var material = new THREE.MeshPhongMaterial({ color: 0x008800, wireframe: true, transparent: true, opacity: 0 });
        var collider = new THREE.Mesh(geometry, material);
        collider.position.x = 0.5;
        lasers[lasers.length - 1].add(collider);
        collider.geometry.computeBoundingBox();

        laserscollider.push(collider);

        lasers[lasers.length - 1].rotation.y = THREE.Math.degToRad(90);

        //Actualizar posição
        lasers[lasers.length - 1].position.x = ship.position.x;
        lasers[lasers.length - 1].position.y = ship.position.y;
        lasers[lasers.length - 1].position.z = ship.position.z;
        scene.add(lasers[lasers.length - 1]);
        reserva.splice(reserva.length - 1, 1);
    }


})

//#firelaser
function fireLaser() {
    //isto foi retirado de https://github.com/jeromeetienne/threex.laser
    var laserBeam = new THREEx.LaserBeam();
    var obj = laserBeam.object3d;
    obj.scale.set(4, 4, 4);
    reserva.push(obj);
}

// Ship movements
function updateShipPosition(){
    // Update ship position
    if (buttonUp) {

        if (ship.position.z >= -24)
            ship.position.z -= 0.5;


    }
    if (buttonDown) {
        if (ship.position.z <= 55) {
            ship.position.z += 0.5;
        }

    }
    if (buttonLeft) {

        if (ship.position.x > -24.5) {
            ship.position.x -= 0.5;

        }
        if (ship.rotation.z <= THREE.Math.degToRad(-30)) {
            ship.rotation.z = THREE.Math.degToRad(-30);
        } else {
            ship.rotation.z += THREE.Math.degToRad(-1);
        }


    } else {
        if (ship.rotation.z <= 0) {
            ship.rotation.z += THREE.Math.degToRad(1);
        }

    }
    if (buttonRight) {

        if (ship.position.x < 24.5) {
            ship.position.x += 0.5;

        }
        if (ship.rotation.z >= THREE.Math.degToRad(30)) {
            ship.rotation.z = THREE.Math.degToRad(30);
        } else {
            ship.rotation.z += THREE.Math.degToRad(1);
        }

    } else {
        if (ship.rotation.z >= 0) {
            ship.rotation.z += THREE.Math.degToRad(-1);
        }

    }
}