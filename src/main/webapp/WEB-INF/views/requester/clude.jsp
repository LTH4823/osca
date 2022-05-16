
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../../resources/css/clude.css">
  <title>Document</title>
</head>
<body>
<canvas class="canvasPdf" style="width: 40vw; height: 50vh; background-color: cornsilk;">
  <p style="color: red;">dfdf</p>
</canvas>

<h1>계약서 Sign 페이지</h1>
<!-- <iframe class="customPDF canvasPdf" src="../asset/02.pdf" frameborder="0"></iframe> -->

<div class="cludeContractSignArea signArea">
  <div>
    <canvas class="cludeSignRequester customSign jsCanvas"></canvas>
  </div>

  <div>
    <canvas class="cludeSignContractor customSign jsCanvas"></canvas>
  </div>
</div>
<div class="customBtns">
  <button class="signSave">signSave</button>
  <button class=" pdfBtn">save</button>
  <button class="signClear">signClear</button>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<script src="../../../resources/js/signPDF.js"></script>
<script src="../../../resources/js/pdfStroe.js"></script>


</body>
</html>