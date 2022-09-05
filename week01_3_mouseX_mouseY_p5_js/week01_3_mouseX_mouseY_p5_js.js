
function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0xF7, 0xDE, 0xCA));
    fill(color(0x6B, 0x7B, 0xD3));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}

function initializeFields() {
}
