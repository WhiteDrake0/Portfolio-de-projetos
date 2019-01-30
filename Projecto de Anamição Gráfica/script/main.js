
// variaveis glubais
var posição = 0;
var colisão = false;
var pontuação = 0;
var stop = false;
var click = false;
var audio = new Audio();
var audioEnd = new Audio();
var dificulty = 0;


window.onload = function () {

    // background audio
    function iniciarAudio() {
        audio.src = "audio/Ruined Street.mp3";
        audioEnd.src = "audio/gameover2.mp3";
        audio.loop = true;
        audio.volume = 0.5;
        audio.play();

    }

    // para voltar para o menu
    document.addEventListener('keydown', function (e) {

        if (e.keyCode === 27) {
            audio.pause();
            window.location = "\menu.html";
        }
    });

    iniciarAudio();

    // variaveis do canvas
    const c = document.getElementById('myCanvas');
    c.width = 1024;
    c.height = 504;
    const ctx = c.getContext('2d');


    // objectos
    const environment = new Environment(c, ctx);
    const runner = new Runner(200, 352, ctx);





    // obstaculos a ser adicionadas há array
    const obstaculos = [];
    let obstaculoSet = gerarObstaculosAleatorios(ctx, c.width);
    obstaculos.push(obstaculoSet);

    setInterval(function () {
        if (colisão === false) {

            let obstaculoSet = gerarObstaculosAleatorios(ctx, c.width);
            obstaculos.push(obstaculoSet);

            // aumentando a dificuldade em função da pontuação
            if (pontuação % 100 == 0 && pontuação != 0 && dificulty < 4.5) {
                dificulty += 0.25;

                environment.stSpeed += 0.25;
            }


        }

    }, 4200 - dificulty * 100)


    gameLoop();

    ctx.fillStyle = "#FFFFFF"


    /* 
    Loop do jogo 
    */
    function gameLoop() {

        // apagar canvas
        ctx.fillRect(0, 0, c.width, c.height);

        // desenho e update do background
        if (colisão === false)
            environment.update();
        environment.render();

        // update e desenho dos obstaculos
        obstaculos.forEach(function (obstaculo1) {

            if (colisão === false)
                obstaculo1.update(4.5 + dificulty);
            obstaculo1.render();


        });

        // update e desenho da personagem controlada pelo jogador
        if (colisão === false) {

            runner.update();
            runner.render();
        }

        // interações quando se perde
        if (colisão) {
            audio.pause();
        }
        if (colisão) {

            audioEnd.play();
            if (runner.spriteIndexd < 11 || runner.spriteIndexjd < 10 || runner.spriteIndexsd < 10) {

                runner.update2();
                runner.death();

            }
            else {
                stop = true;
            }

            // quando o jogador perde e é escrito isto no canvas
            const gameEnd = new GameOver(ctx, pontuação);
            gameEnd.update();
            gameEnd.draw();


        }
        else {


            ctx.font = '40px sans-serif';
            pontuação = obstaculos.length * 10 - 10;
            ctx.beginPath();
            ctx.fillText(pontuação + " MP", 60, 60);
            ctx.fill();
            ctx.font = '20px sans-serif';
            ctx.beginPath();
            ctx.fillText("ESC para returnar para menu", c.width - 270, 20);
            ctx.fill();
        }


        // colisão e paragem do jogo
        if (detetordeColisoes(runner, obstaculos, end)) {
            colisão = true;
        }



        if (!stop)
            window.requestAnimationFrame(gameLoop);


    }


};


// Gerador de obstaculos
function gerarObstaculosAleatorios(ctx, canvasWidth) {
    let returnVal;
    posição = Math.random() * 100 + 1;

    if (posição > 50)
        returnVal = new obstaculo(canvasWidth, 287,  ctx);
    else
        returnVal = new obstaculo(canvasWidth, 352,  ctx);

    return returnVal;
}


// Detetor de colisão
function detetordeColisoes(runner, obstaculos, end) {

    for (var i = 0; i < obstaculos.length; i++) {

        // variaveis
        let e = obstaculos[i];
        let hightobstaculo = e.posY <= 287;
        let x0 = e.posX, x1 = e.posX + e.width;

        if (hightobstaculo) {

            // variaveis
            let y0 = e.posY + e.height;
            let alpha = runner.x + runner.width;
            let beta = runner.y + runner.slideHeight;

            // perder por não fazer o slide a tempo
            if (alpha > x0 && alpha < x1 && beta < y0) {


                return true;
            }
        }
        else {

            // variaveis
            let y2 = e.posY;
            let a = runner.x + runner.width;
            let b = runner.y + runner.height;

            // perder por não fazer o salto a tempo
            if (a > x0 && a < x1 && b > y2) {

                return true;
            }

        }
    }

    // estou safo
    return false;
}



