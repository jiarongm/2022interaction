
function setup() {
    initializeFields();
    createCanvas(500, 500);
    background(color(0xCC, 0xD0, 0xE8));
    stroke(color(0xFF, 0x05, 0x22));
}

function draw() {
    if (mouseIsPressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
}

function keyPressed() {
    if (key == '1')
        stroke(color(0xFF, 0x05, 0x22));
    if (key == '2')
        stroke(color(0xFF, 0x76, 0x05));
    if (key == '3')
        stroke(color(0xFF, 0xEB, 0x05));
    if (key == '4')
        stroke(color(0x05, 0xFF, 0x24));
    if (key == '5')
        stroke(color(0x05, 0x0B, 0xFF));
    if (key == '6')
        stroke(color(0xCF, 0x75, 0xD6));
    if (key == '7')
        stroke(color(0x74, 0x0A, 0xCB));
}

function initializeFields() {
}
