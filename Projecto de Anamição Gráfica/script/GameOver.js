
var end = false;

function GameOver(ctx, pontuacao) {

    this.update = function(){

        // É onde a nova pontuação é guardada se for maior que antiga 
        if (typeof(Storage) !== "undefined")
        {
            if (pontuacao > parseInt(localStorage.getItem('score'))){
                localStorage.removeItem('score');
                localStorage.setItem('score', pontuacao);
    
            }
            else 
            if (pontuacao <= parseInt(localStorage.getItem('score')))
            {
                
            }
            else
            {
                localStorage.setItem('score', pontuacao);
            }
        }
        else{

            // um alerta
            alert("Desculpa, mas o teu browser não suporta web Storage...");
        }

    }
    this.draw = function () {
        
        // O que é escrito no game over 
        ctx.fillStyle = "red";
        ctx.font = '80px sans-serif';
        ctx.lineWidth = 3;

        ctx.beginPath();
        ctx.fillText("Game Over!!!", 280, 252);
        ctx.strokeText("Game Over!!!", 280, 252);

        ctx.lineWidth = 1;
        ctx.font = '30px sans-serif';
        ctx.fillText("Melhor Megapontuação: " + localStorage.getItem('score'), 350, 300);
        ctx.strokeText("Melhor Megapontuação: " + localStorage.getItem('score'), 350, 300);

        ctx.lineWidth = 1;
        ctx.font = '30px sans-serif';
        ctx.fillText("Megapontuação: " + pontuacao, 350, 340);
        ctx.strokeText("Megapontuação: " + pontuacao, 350, 340);

        ctx.lineWidth = 2;
        ctx.font = '30px sans-serif';
        ctx.fillText("Press 'R' to restart.", 400, 390);
        ctx.strokeText("Press 'R' to restart.", 400, 390);
        ctx.fill();
        end = true;

    }
    document.addEventListener('keydown', function (e) {
        if (e.keyCode === 82 && end === true)
            window.location = "\main.html";
            
    });

}