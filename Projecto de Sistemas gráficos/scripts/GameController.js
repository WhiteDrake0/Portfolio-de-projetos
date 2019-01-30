// Isto foi retirado https://codepen.io/Xanmia/pen/DoljI
function gameover(x, y, z) {

    var geometry = new THREE.Geometry();

    for (i = 0; i < 1000; i++) {
        var vertex = new THREE.Vector3();
        vertex.x = x;
        vertex.y = y;
        vertex.z = z;

        geometry.vertices.push(vertex);
        dirs.push({ x: (Math.random() * 8) - (8 / 2), y: (Math.random() * 8) - (8 / 2), z: (Math.random() * 8) - (8 / 2) });
    }
    var material = new THREE.PointsMaterial({ size: 1, color: 0xffffff });
    var particles = new THREE.Points(geometry, material);

    this.object = particles;
    this.status = true;

    this.xDir = (Math.random() * 8) - (8 / 2);
    this.yDir = (Math.random() * 8) - (8 / 2);
    this.zDir = (Math.random() * 8) - (8 / 2);

    scene.add(this.object);

    this.update = function () {
        if (this.status == true) {
            var pCount = 1000;
            while (pCount--) {
                var particle = this.object.geometry.vertices[pCount]
                particle.y += dirs[pCount].y;
                particle.x += dirs[pCount].x;
                particle.z += dirs[pCount].z;
                if (particle.y > 690 || particle.y < -690 || particle.z > 690 || particle.z < -690 || particle.x > 690 || particle.x < -690)
                    scene.remove(this.object);
            }
            this.object.geometry.verticesNeedUpdate = true;
        }
    }


}

// #EndText
var best = 0;
function Endtext() {

    //Referencias html game over7
    var GameOver = document.getElementById("GameOver");
    var pontuacaoAlta = document.getElementById("best");
    var corrente = document.getElementById("corrente");

    //css controlador
    GameOver.style.display = "block";
    var mt = (WIDTH / 2) - 87.5;
    GameOver.style.margin = mt + "px 0px 0px 0px";

    // verificar se existe
    if (localStorage.getItem("bestScore"))
        best = parseInt(localStorage.getItem('bestScore'));

    if (best < pontos) {
        pontuacaoAlta.innerHTML = "Melhor pontuação: " + pontos;
        corrente.innerHTML = "Antiga pontuação: " + best;

        best = pontos;

    }
    else {
        pontuacaoAlta.innerHTML = "Melhor pontuação: " + best;
        corrente.innerHTML = "Pontuação Obtida: " + pontos;
    }

    localStorage.setItem("bestScore", best);

}
