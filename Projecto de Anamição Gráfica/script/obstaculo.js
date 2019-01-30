/*const obstaculo = function (posX, posY, speed, ctx) {
    this.posX = posX;
    this.posY = posY;
    this.width = 60;
    this.height = 80;
    this.ctx = ctx;
    this.speed = speed;
    this.barreira = document.getElementById('barreira');
};

obstaculo.prototype.update = function () {
    this.posX -= this.speed;
};

obstaculo.prototype.render = function () {
    this.ctx.save();
    let renderX = this.posX - this.width / 2;
    let renderY = this.posY - this.height / 2;

    this.ctx.drawImage(this.barreira, renderX, renderY);

    this.ctx.restore();
};*/

const obstaculo = function (posX, posY, ctx) {
    this.posX = posX;
    this.posY = posY;
    this.width = 60;
    this.height = 80;
    this.ctx = ctx;
    this.barreira = document.getElementById('barreira');
};

obstaculo.prototype.update = function (speed) {
    this.posX -= speed;
};

obstaculo.prototype.render = function () {
    this.ctx.save();
    let renderX = this.posX - this.width / 2;
    let renderY = this.posY - this.height / 2;

    this.ctx.drawImage(this.barreira, renderX, renderY);

    this.ctx.restore();
};

