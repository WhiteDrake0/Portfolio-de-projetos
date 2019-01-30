
class Environment {
    constructor(c, ctx) {
        this.c = c;
        this.ctx = ctx;
        this.stPos = 0;
        this.stSpeed = 4.5;
        this.stWidth = 1024;
        this.stImg = document.getElementById('street');
    }

    update() {

        this.stPos -= this.stSpeed;

        if (this.stPos < -this.stWidth)
            this.stPos = 0;
    }
    render(ctx) {


        for (let i = 0; i <= this.c.width / this.stWidth; i++)
            this.ctx.drawImage(this.stImg, this.stPos + i * this.stWidth, 0);
    }
}

