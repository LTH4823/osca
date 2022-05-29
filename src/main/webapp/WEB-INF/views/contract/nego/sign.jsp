<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../../../resources/css/sign.css">
</head>

<body>


<canvas class="pdfShow">

</canvas>

<iframe src="" ></iframe>

<div class="signArea">
    <div class="memberSignArea">
        <h4>의뢰자(인)</h4>
        <canvas class="memberSign">

        </canvas>
    </div>
    <div class="companySignArea">
        <h4>시공사(인)</h4>
        <canvas class="companySign">

        </canvas>
    </div>
    <div>
        <button class="signClear">지우기</button>
        <button class="signSave">저장</button>
    </div>

</div>

<div id="example1"></div>


<button class="pdfSaveBtn">저장</button>

<!-- jspdf -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<!-- pdfobject -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.2.8/pdfobject.min.js"
        integrity="sha512-MoP2OErV7Mtk4VL893VYBFq8yJHWQtqJxTyIAsCVKzILrvHyKQpAwJf9noILczN6psvXUxTr19T5h+ndywCoVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- html2canvas -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<script src="../../../../resources/js/sign.js"></script>
<script src="../../../../resources/js/pdfsave.js"></script>

<script>
    const memberSign = document.querySelector(".memberSign");
    const companySign = document.querySelector(".companySign");

    signSet(memberSign);
    signSet(companySign);
    PDFObject.embed("/pdf/sample-3pp.pdf", "#example1");
</script>

</body>

</html>