function choosing_figure(index, ctx, xStep, yStep, sz, width, height){
    switch(index)
            {
            case(0):
            {
                figure_star(ctx, xStep, yStep, sz, width, height)
                break;
            }
            case(1):
            {
                figure_ring(ctx, xStep, yStep, sz, width, height)
                break;
            }
            case(2):
            {
                figure_house(ctx, xStep, yStep, sz, width, height)
                break;
            }
            case(3):
                figure_sandclock(ctx, xStep, yStep, sz, width, height)
                break;
            default: //never happens
                console.log(qsTr("404"))
    }
}

function figure_star(ctx, xStep, yStep, sz, width, height) {

    ctx.clearRect(0, 0, width, height);
    ctx.strokeStyle = "black"
    ctx.fillStyle = "red"
    ctx.beginPath()

    ctx.moveTo(xStep, yStep - sz);

    ctx.lineTo(xStep + sz * Math.sin(Math.PI/5), yStep + sz * Math.cos(Math.PI/5))
    ctx.lineTo(xStep + sz * Math.sin(Math.PI/5), yStep + sz * Math.cos(Math.PI/5))
    ctx.lineTo(xStep - sz * Math.cos(Math.PI/10), yStep - sz * Math.sin(Math.PI/10))
    ctx.lineTo(xStep + sz * Math.cos(Math.PI/10), yStep  - sz * Math.sin(Math.PI/10))
    ctx.lineTo(xStep - sz * Math.sin(Math.PI/5), yStep + sz * Math.cos(Math.PI/5))
    ctx.lineTo(xStep, yStep - sz)

    ctx.closePath()
    ctx.lineWidth = 15;
    ctx.stroke();
    ctx.fill()

}

function figure_ring(ctx, cx, cy, radius, width, height){

    ctx.clearRect(0, 0, width, height);
    ctx.strokeStyle = "darkslateblue"
    ctx.beginPath()
    ctx.lineWidth = 50
    ctx.arc(cx, cy ,radius, 0, Math.PI * 2)
    ctx.stroke();
}

function figure_house(ctx, xStep, yStep, sz, width, height) {

    ctx.clearRect(0, 0, width, height);
    ctx.strokeStyle = "midnightblue"
    ctx.fillStyle = "brown"
    ctx.beginPath()

    ctx.lineWidth = 5;

    ctx.strokeRect(xStep - sz * 2, yStep, sz * 4, sz * 2)
    ctx.fillRect(xStep - sz * 2, yStep, sz * 4, sz * 2)


    ctx.moveTo(xStep, yStep - sz);
    ctx.lineTo(xStep - sz * 2.5, yStep + sz/4)

    ctx.moveTo(xStep, yStep - sz);
    ctx.lineTo(xStep + sz * 2.5, yStep + sz/4)

    ctx.fillStyle = "yellow"

    ctx.moveTo(xStep + sz/4, yStep - sz/3)
    ctx.arc(xStep, yStep - sz/3, sz/4, 0,  Math.PI * 2)
    ctx.fill()

    ctx.strokeRect(xStep - sz, yStep + sz/2, sz*2, sz)
    ctx.fillRect(xStep - sz, yStep + sz/2, sz*2, sz)

    ctx.moveTo(xStep - sz, yStep + sz)
    ctx.lineTo(xStep + sz, yStep + sz)

    ctx.moveTo(xStep, yStep + sz)
    ctx.lineTo(xStep, yStep + sz*1.5)

    ctx.stroke();
    ctx.closePath()
}

function figure_sandclock(ctx, cx, cy, sz, width, height) {
    ctx.clearRect(0, 0, width, height);
    ctx.strokeStyle = "darkslateblue"

    ctx.lineWidth = 5
    ctx.beginPath()

    ctx.arc(cx, cy - sz*1.7, sz, 0, Math.PI*0.325)

    ctx.moveTo(cx - sz, cy - sz*1.7)
    ctx.arc(cx, cy - sz*1.7, sz, Math.PI, Math.PI*0.675, true)

    ctx.moveTo(cx + sz, cy + sz*1.7)
    ctx.arc(cx, cy + sz*1.7, sz, 0, Math.PI*1.675, true)

    ctx.moveTo(cx - sz, cy + sz*1.7)
    ctx.arc(cx, cy + sz*1.7, sz, Math.PI, Math.PI*1.325)

    ctx.moveTo(cx - cx*0.01, cy)
    ctx.arc(cx - sz - sz/20, cy, sz, 0, Math.PI*0.325)

    ctx.moveTo(cx - cx*0.015, cy)//
    ctx.arc(cx - sz*1.05, cy, sz, 0, Math.PI*1.658, true)

    ctx.moveTo(cx*1.01 + sz/2, cy + sz*0.85)
    ctx.arc(cx + sz*1.05, cy, sz, Math.PI*0.675, Math.PI*1.325)

    ctx.moveTo(cx - sz, cy - sz*1.7)
    ctx.lineTo(cx + sz, cy - sz*1.7)

    ctx.moveTo(cx + sz, cy + sz*1.7)
    ctx.lineTo(cx - sz, cy + sz*1.7)

    ctx.moveTo(cx - sz*1.1, cy - sz*2)
    ctx.lineTo(cx - sz*1.1, cy + sz*1.5)

    ctx.moveTo(cx + sz*1.1, cy - sz*2)
    ctx.lineTo(cx + sz*1.1, cy + sz*1.5)

    ctx.stroke()

    ctx.fillStyle = ctx.strokeStyle
    ctx.fillRect(cx - sz*1.3, cy - sz*2, sz*2.6, sz/2)
    ctx.fillRect(cx - sz*1.3, cy + sz*1.5, sz*2.6, sz/2)
}
