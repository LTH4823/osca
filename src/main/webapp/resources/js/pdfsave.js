document.querySelector(".pdfSaveBtn").addEventListener(
    "click",
    (e) => {
        html2canvas(document.querySelector("html")).then((canvas) => {
            // base64 url 로 변환
            var imgData = canvas.toDataURL("image/jpeg");
            console.log(imgData);

            var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
            var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
            var imgHeight = (canvas.height * imgWidth) / canvas.width;
            var heightLeft = imgHeight;
            var margin = 0;

            var doc = new jsPDF("p", "mm", "a4");
            var position = 0;

            // 첫 페이지 출력
            doc.addImage(imgData, "jpeg", margin, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;

            // 한 페이지 이상일 경우 루프 돌면서 출력
            while (heightLeft >= 20) {
                position = heightLeft - imgHeight;
                doc.addPage();
                doc.addImage(imgData, "jpeg", margin, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
            }

            // 파일 저장
            doc.save("contract.pdf");
        });
    },
    false
);
