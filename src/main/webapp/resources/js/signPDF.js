const canvas = document.querySelector(".jsCanvas");
const ctx = canvas.getContext("2d");
const clearBtn = document.querySelector(".signClear");
const saveBtn = document.querySelector(".signSave");

const cludeSignRequester = document.querySelector(".cludeSignRequester");
const cludeSignContractor = document.querySelector(".cludeSignContractor");

function canvasSet(canvas) {
    // 공용 변수 선언
    const INITIAL_COLOR = "#2c2c2c";
    const CANVAS_SIZE = 200;

    //Pixel Modifier -> 그림 판 영역 자체를 위한 픽셀 영역 선언 (css의 size 선언과는 다름)
    canvas.width = CANVAS_SIZE;
    canvas.height = CANVAS_SIZE;

    const ctx = canvas.getContext("2d");

    //JavaScript 자체의 canvas함수 변형 사용
    ctx.strokeStyle = INITIAL_COLOR;
    ctx.lineWidth = 2;
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);

    //수동적 변화 변수 선언
    let painting = false;
    let filling = false;
    let fillStyle = INITIAL_COLOR;

    //마우스 위치 값 선언 및 cavas 선 그리기 함수 사용
    function onMouseMove(event) {
        const x = event.offsetX;
        const y = event.offsetY;
        if (!painting) {
            ctx.beginPath();
            ctx.moveTo(x, y);
        } else {
            ctx.lineTo(x, y);
            ctx.stroke();
        }
    }

    function startPainting(event) {
        painting = true;
    }

    function stopPainting(event) {
        painting = false;
    }

    function handleModeClick() {
        ctx.fillStyle = "white";
        ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
    }

    function handleCanvasClick() {
        if (filling) {
            ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        }
    }

    function handleCM(event) {
        event.preventDefault();
    }

    function handleSaveClick() {
        let image = canvas.toDataURL();
        console.log(image);

        image.replace("data:image/png;base64,", "");
        console.log(image);

        const link = document.createElement("a");
        link.href = image;
        link.download = "HandSign";
        link.click();
    }

    if (canvas) {
        canvas.addEventListener("mousemove", onMouseMove);
        canvas.addEventListener("mousedown", startPainting);
        canvas.addEventListener("mouseup", stopPainting);
        canvas.addEventListener("mouseleave", stopPainting);
        canvas.addEventListener("click", handleCanvasClick);
        canvas.addEventListener("contextmenu", handleCM);
    }
    clearBtn.addEventListener("click", handleModeClick);
    saveBtn.addEventListener("click", handleSaveClick);
}

canvasSet(cludeSignRequester);
canvasSet(cludeSignContractor);