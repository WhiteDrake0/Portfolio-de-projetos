var audio = new Audio();

window.onload = function () {

    // music
   function iniciarAudio () {
        audio.src = "audio/Déjà Vu 8Bit.mp3";
        audio.play();
        audio.loop = true;
        audio.volume = 0.3;
    }

    iniciarAudio ();
}

document.addEventListener('keydown', function (e) {

    if (e.keyCode === 13) {
        audio.pause();
        window.location = "\main.html";

    }
});