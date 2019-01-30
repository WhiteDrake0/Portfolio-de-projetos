
// variaveis para as animações
var jump = false;
var down = false;
var slide = false;
var sound = new Audio();
var i = 0;

class Runner {
    constructor(x, y, ctx) {
        this.x = x;
        this.y = y;
        this.ctx = ctx;
        this.width = 60;
        this.height = 80;
        this.endJp = false;
        this.endSl = false;
        this.slideHeight = 0;

        // sprits de animação de corrida
        this.sprites = [document.getElementById('run1'),
        document.getElementById('run2'),
        document.getElementById('run3'),
        document.getElementById('run4'),
        document.getElementById('run5'),
        document.getElementById('run6'),
        document.getElementById('run7'),
        document.getElementById('run8'),
        document.getElementById('run9'),
        document.getElementById('run10')];

        // sprits de animação de jump
        this.sprJump = [document.getElementById('jum1'),
        document.getElementById('jum2'),
        document.getElementById('jum3'),
        document.getElementById('jum4'),
        document.getElementById('jum5')];

        // sprits de animação de slide
        this.sprSlide = [document.getElementById('slid1'),
        document.getElementById('slid2'),
        document.getElementById('slid3')];

        // sprits para um fim de jogo por bater 
        this.sprDeath = [document.getElementById('end1'),
        document.getElementById('end2'),
        document.getElementById('end3'),
        document.getElementById('end4'),
        document.getElementById('end5'),
        document.getElementById('end6'),
        document.getElementById('end7'),
        document.getElementById('end8'),
        document.getElementById('end9'),
        document.getElementById('end10'),
        document.getElementById('end11'),
        document.getElementById('end12')];

        // sprits para um fim de jogo por saltar
        this.sprJumpDeath = [document.getElementById('end2'),
        document.getElementById('end3'),
        document.getElementById('end4'),
        document.getElementById('end5'),
        document.getElementById('end6'),
        document.getElementById('end7'),
        document.getElementById('end8'),
        document.getElementById('end9'),
        document.getElementById('end10'),
        document.getElementById('end11'),
        document.getElementById('end12')];

        // sprits para a morte por falhar o slide
        this.sprSlDeath = [document.getElementById('slEnd1'),
        document.getElementById('slEnd2'),
        document.getElementById('slEnd3'),
        document.getElementById('slEnd4'),
        document.getElementById('slEnd5'),
        document.getElementById('slEnd6'),
        document.getElementById('slEnd7'),
        document.getElementById('slEnd8'),
        document.getElementById('slEnd9'),
        document.getElementById('slEnd10'),
        document.getElementById('slEnd11')];

        // temporizador 
        this.ticks = 0;

        this.spriteIndex = 0;
        this.spriteIndexj = 0;
        this.spriteIndexs = 0;
        this.spriteIndexd = 0;
        this.spriteIndexjd = 0;
        this.spriteIndexsd = 0;

        var self = this;
        document.addEventListener('keydown', function (e) {
            // controlos de salto
            if (e.keyCode === 38 && jump === false) {

                jump = true;
                sound.src = "audio/jump.mp3";
                sound.volume = 0.2;
                sound.play();
            }

            // controlos de slide
            if (e.keyCode === 40 && slide === false && jump === false) {

                slide = true;
                sound.src = "audio/slide.mp3";
                sound.volume = 1;
                sound.play();
            }
        });

        this.update = function () {
            this.ticks++; // temporisador 

            // mudança de animações
            if (jump === true) {
                if (this.ticks % 10 === 0 && this.spriteIndexj != 4) this.spriteIndexj = (this.spriteIndexj + 1) % this.sprJump.length;
                this.endJp = true;
            }
            else
                if (slide === true && jump === false) {

                    // variaveis
                    i++;
                    this.slideHeight = 16;
                    this.endSl = true;

                    if (i % 5 === 0 && this.spriteIndexs === 0) {
                        this.spriteIndexs = 1;
                        this.y = 364;

                    }
                    else
                        if (i % 50 === 0 && this.spriteIndexs === 1) {
                            this.spriteIndexs = 2;

                        }

                }
                else {
                    if (this.ticks % 5 === 0) this.spriteIndex = (this.spriteIndex + 1) % this.sprites.length;
                    this.end = true;
                }

            // O salto do sprit
            if (jump === true) {
                if (down === false) {
                    this.y -= 3;
                    if (this.y <= 200) {
                        down = true;
                        sound.pause();
                    }
                }
                else
                    if (down === true) {
                        this.y += 3;
                        this.spriteIndexj = 4;
                        if (this.y >= 352) {
                            this.y = 352
                            jump = false;
                            this.endJp = true;
                            down = false;
                            this.spriteIndexj = 0;
                        }
                    }
            }


            // O slide do sprit
            if (this.spriteIndexs === 2) {
                slide = false;
                this.endSl = false;
                sound.pause();
                this.y = 352;
                this.slideHeight = 0;
                this.spriteIndexs = 0;
            }
        }

        this.update2 = function () {

            this.ticks++;

            
            // mudança de animações
            if (jump === true) {
                if (this.ticks % 10 === 0 && this.spriteIndexjd < this.sprJumpDeath.length - 1) this.spriteIndexjd = (this.spriteIndexjd + 1) % this.sprJumpDeath.length;
                if (this.spriteIndexjd >= this.sprJumpDeath.length - 2) {

                    this.spriteIndexd = 11;
                    this.spriteIndexsd = this.sprSlDeath.length - 1;
                    this.spriteIndexjd = this.sprJumpDeath.length - 1;
                }
            }
            else
                if (slide === true && jump === false) {

                    if (this.ticks % 10 === 0 && this.spriteIndexsd < this.sprSlDeath.length - 1) this.spriteIndexsd = (this.spriteIndexsd + 1) % this.sprSlDeath.length;
                    if (this.spriteIndexsd >= this.sprSlDeath.length - 2) {

                        this.spriteIndexd = 11;
                        this.spriteIndexsd = this.sprSlDeath.length - 1;
                        this.spriteIndexjd = this.sprJumpDeath.length - 1;
                    }
                }
                else {
                    if (this.ticks % 10 === 0 && this.spriteIndexd < 11) this.spriteIndexd = (this.spriteIndexd + 1) % this.sprDeath.length;
                    if (this.spriteIndexd >= 10) {

                        this.spriteIndexd = 11;
                        this.spriteIndexsd = this.sprSlDeath.length - 1;
                        this.spriteIndexjd = this.sprJumpDeath.length - 1;
                    }
                }

        }
    }
}


// animação
Runner.prototype.render = function () {
    let renderX = this.x - this.width / 2;
    let renderY = this.y - this.height / 2;

    if (jump === true) {
        this.ctx.drawImage(this.sprJump[this.spriteIndexj], renderX, renderY);
    }
    else
        if (slide === true && jump === false) {
            this.ctx.drawImage(this.sprSlide[this.spriteIndexs], renderX, renderY);
        }
        else {
            if (this.spriteIndex >= 10) {
                this.spriteIndex = 0;
            }
            this.ctx.drawImage(this.sprites[this.spriteIndex], renderX, renderY);
        }

};


Runner.prototype.death = function () {
    let renderX = this.x - this.width / 2;
    let renderY = this.y - this.height / 2;

    if (jump === true) {
        this.ctx.drawImage(this.sprJumpDeath[this.spriteIndexjd], renderX, renderY);
    }
    else
        if (slide === true && jump === false) {
            this.ctx.drawImage(this.sprSlDeath[this.spriteIndexsd], renderX, renderY);
        }
        else {

            this.ctx.drawImage(this.sprDeath[this.spriteIndexd], renderX, renderY);
        }
}