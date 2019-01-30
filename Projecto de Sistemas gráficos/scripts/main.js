
// Variaveis objectos
var renderer = null,
    scene = null,
    camera = null,
    ship = null, box = null, boxCollider = null,
    meteor;

// Variavel textura 
var spaceTexture;

// variaveis de arrays de objectos
var hazards = [];
var lasers = [];
var reserva = [];
var parts = [];
var dirs = [];

// variaveis de controlos 
var PositionPath = null, RotationPath;
var buttonUp = false, buttonDown = false, buttonLeft = false,
    buttonRight = false, ReStart = false;
var end = false;

// variaveis de medida
var HEIGHT;
var WIDTH;

// variveis colisores
var boundry = null;
var hazardsCollideres;
var laserscollider = [];

//UI variaveis
var header = null,
    footer = null;
var text = null;
var energia = null;

// Pontuação
var pontos = 0;

window.onload = function () {

    // Variaveis html
    text = document.getElementById("pontos");
    energia = document.getElementById("energia");
    document.getElementById("GameOver").style.display = "none";


    createScene();


    // Creat lights
    var light = new THREE.AmbientLight(0xffffff);
    scene.add(light);

    var light2 = new THREE.SpotLight(0xffffff);
    light2.position.set(100, 100, 100);
    scene.add(light2);
    LoadEnvirement();
    LoadShip();

    anamite();

    for (let i = 0; i < 10; i++) {
        fireLaser();

    }

    var i = 0;

    // Hazards wayves
    setInterval(function () {

        if (!end) {
            if (hazards.length < 10)
                CreatHazards();
        }

    }, 5000);

    // recarregar laseres
    setInterval(function () {

        if (reserva.length < 10)
            fireLaser();
    }, 3600)

    //#Camera animation
    setInterval(function () {


        if (i <= 1)
            camera.position.set(PositionPath.getPointAt(i).x, PositionPath.getPointAt(i).y, PositionPath.getPointAt(i).z);


        if (i <= 1) {
            camera.rotation.set(RotationPath.getPointAt(i).x, RotationPath.getPointAt(i).y, RotationPath.getPointAt(i).z);
        }

        if (i >= 1) {
            camera.position.set(0, 100, 0);
        }


        i += 0.01;
    }, 40);

}



// #Scene
function createScene() {

    //UI
    header = document.getElementsByClassName("header");
    footer = document.getElementById("footer");

    // medidas
    if (window.innerWidth > window.innerHeight) {
        HEIGHT = (window.innerWidth/2) - ((window.innerWidth/2) - window.innerHeight) - 50;
        WIDTH = window.innerHeight/2;
    } else {
        HEIGHT = window.innerHeight/2;
        WIDTH = window.innerWidth/2;
    }

    //css controlador
    var ml = (window.innerWidth / 2) - (WIDTH/2);
    header[0].style.margin = "0px 0px 0px " + ml + "px";
    var mt = HEIGHT - footer.clientHeight;
    footer.style.margin = mt + "px 0px 0px " + ml + "px";



    // Create the Three.js renderer
    renderer = new THREE.WebGLRenderer({ alpha: true, atialias: true });

    // Set the viewport 
    renderer.setSize(WIDTH, HEIGHT);
    renderer.setClearColor("#AAAAAA");

    // canvas
    var canvas = document.getElementById("gl-canvas");
    canvas.appendChild(renderer.domElement);

    // Create a new Three.js scene
    scene = new THREE.Scene();



    // Add  a camera so we can view the scene
    camera = new THREE.PerspectiveCamera(60, WIDTH / HEIGHT, 0.1, 10000);
    PositionPath = new THREE.LineCurve3(new THREE.Vector3(15, 8, -12), new THREE.Vector3(0, 100, 0));
    RotationPath = new THREE.LineCurve3(new THREE.Vector3(-2.5, 0.8, 2.7), new THREE.Vector3(-1.6, 0, 0));
    scene.add(camera);
}

var t = 0;
var count = 0;

// #Animate
function anamite() {
    spaceTexture.offset.y -= 0.000025;

    if (hazards != 0 || !end) {
        for (let i = 0; i < hazards.length; i++) {
            hazards[i].position.z += 0.9
            hazards[i].rotation.x -= 0.01;

        }
    }

    if (ship) {


        updateShipPosition();



        // Detetor de colisões
        for (let i = 0; i < hazards.length; i++) {

            boxCollider = new THREE.Box3().setFromObject(box);

            var hit = boxCollider.intersectsBox(new THREE.Box3().setFromObject(hazards[i]));
            if (hit && t < 15) {

                var x = ship.position.x
                var y = ship.position.y
                var z = ship.position.z
                scene.remove(ship);
                parts.push(new gameover(x, y, z));
                end = true;
                t++;
            }

            var outOfBounds = boundry.intersectsBox(new THREE.Box3().setFromObject(hazards[i]));
            if (!outOfBounds) {

                scene.remove(hazards[i]);
                hazards.splice(i, 1);

            }


        }

        // Representação do energia do laser
        energia.src = "img/" + reserva.length + ".png";

        // Se laser sair fora do limite
        if (lasers.length > 0) {

            for (let i = 0; i < lasers.length; i++) {

                lasers[i].position.z -= 1;
                var outOfBounds = boundry.intersectsBox(new THREE.Box3().setFromObject(laserscollider[i]));
                if (!outOfBounds) {

                    scene.remove(lasers[i]);
                    lasers.splice(i, 1);
                    laserscollider.splice(i, 1);

                }



            }

            for (let i = 0; i < lasers.length; i++) {

                var collider = new THREE.Box3().setFromObject(laserscollider[i]);


                for (let j = 0; j < hazards.length; j++) {
                    var destroy = collider.intersectsBox(new THREE.Box3().setFromObject(hazards[j]));

                    if (destroy) {

                        scene.remove(hazards[j]);
                        hazards.splice(j, 1);
                        scene.remove(lasers[i]);
                        lasers.splice(i, 1);
                        laserscollider.splice(i, 1);
                        pontos += 10;
                        text.innerHTML = "Pontos: " + pontos;

                    }

                }




            }
        }


    }

    if (end) {

        // alterar html
        document.getElementById("header").style.display = "none";
        document.getElementById("footer").style.display = "none";

        for (let i = 0; i < parts.length; i++) {
            parts[i].update();

        }


        if (hazards.length == 0 && count < 1) {
            Endtext();
            count++;
        }

        if (ReStart && count > 0)
            window.location = "\canvas.html";

    }

    // Render Scene
    renderer.render(scene, camera);
    requestAnimationFrame(anamite);
}


