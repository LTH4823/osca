const canvasPdf = document.querySelector(".canvasPdf");
const pdfBtn = document.querySelector(".pdfBtn");

const doc = new jsPDF("p", "mm", "a4", "true");

console.log(canvasPdf);
console.log(pdfBtn);
console.log(doc);

pdfBtn.addEventListener(
    "click",
    (e) => {
        // let _fonts = "";  //해당 내용이 엄청 길어서..따로 분리하여 사용하세요!
        // let doc = new jsPDF("p", "mm", "a4");
        // const myImg = document.querySelector(".myImg")

        // // doc.addFileToVFS('malgun.ttf',);  //_fonts 변수는 Base64 형태로 변환된 내용입니다.
        // // doc.addFont('malgun.ttf','malgun', 'normal');
        // // doc.setFont('malgun');

        // // doc.line(15, 19, 195, 19); // 선그리기(시작x, 시작y, 종료x, 종료y)
        // // doc.text(15, 40, 'hello'); // 글씨입력(시작x, 시작y, 내용)

        const doc = new jsPDF({
            //orientation: "landscape",
            orientation: "portrait",
            //format: "a4"
            format: [400, 200],
        });
        console.log(doc)
        doc.addHTML(document.body, function () {

            doc.save("html.pdf");
        });
    },
    false
);