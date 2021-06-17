import $ from "jquery";
import swal from "sweetalert";
import initSparkline from "./angle/modules/charts/sparkline";
import {
    initFlotSpline,
    initFlotBarStacked,
} from "./angle/modules/charts/flot";
import initEasyPieChart from "./angle/modules/charts/easypiechart";
import initSlimsSroll from "./angle/modules/common/slimscroll";
import initNowTimer from "./angle/modules/common/now";
import initVectorMap from "./angle/modules/maps/vector.map.demo";
import { initCardCollapse } from "./angle/modules/common/card-tools";

function showLoader() {
    $('#loader').show();
}

function hideLoader() {
    $('#loader').hide();
}

$(function() {
    initCardCollapse();
    initSparkline();
    initFlotSpline();
    initEasyPieChart();
    initSlimsSroll();
    initNowTimer();
    initFlotBarStacked();
    initVectorMap();
});

const newSpreadsheetForm = document.getElementById("new_spreadsheet");
const spreadsheetFormFieldset = document.getElementById(
    "new-spreadsheet-form-fieldset"
);
const cablesFormFieldset = document.getElementById("cable-form-fieldset");
const cablesForm = document.getElementById("new_cable");
const quantidadeInput = document.getElementById("quantidade");
const comprimentoInput = document.getElementById("cable_length");
const comprimentoTotalInput = document.getElementById("comprimento-total");
const tipoNumeracaoCabos = document.getElementById("spreadsheet_cable_numbering_type");
const identLabel = document.getElementById("change-cable-code");
const tableBody = document.getElementById("table-body");
const tableBodyInfo = document.getElementById("table-body-info");
const pavimento = document.getElementById("spreadsheet_name");

// new spreadsheet form
newSpreadsheetForm.addEventListener("submit", (e) => {
    /*e.preventDefault();
    const formData = new FormData(newSpreadsheetForm);
    spreadsheetFormFieldset.setAttribute("disabled", "disabled");
    cablesFormFieldset.removeAttribute("disabled");

    // ajax
    console.log(Object.fromEntries(formData));*/
    document.getElementById('loader').style.display = "";
});

// sum quantidade x comprimento
quantidadeInput.onchange = sum;
comprimentoInput.onchange = sum;

function sum() {
    comprimentoTotalInput.value = quantidadeInput.value * comprimentoInput.value;
}

// label change
tipoNumeracaoCabos.onchange = changeLabelText;

function changeLabelText() {
    if (tipoNumeracaoCabos.value === "0") {
        identLabel.innerHTML = "Código para Vários Cabos";
    }
    if (tipoNumeracaoCabos.value === "1") {
        identLabel.innerHTML = "Código Individualizado";
    }
}

// Generate Table
cablesForm.addEventListener("submit", (e) => {
    document.getElementById('loader').style.display = "";
})

function handleGenerateSubmit(e) {
    e.preventDefault();

    if (tableBody.childElementCount > 0) {
        tableBody.innerHTML = "";
    }
    if (tableBodyInfo.childElementCount > 0) {
        tableBodyInfo.innerHTML = "";
    }

    const formData = new FormData(e.target);

    const objectData = {};
    formData.forEach((value, key) => {
        objectData[key] = value;
    });

    // generate table-info
    const arrayInfo = [
        pavimento.value,
        "peso",
        comprimentoTotalInput.value,
        `${(objectData.checkbox === "on" ? 2 : 1) * objectData.quantidade}`,
        `${(objectData.checkbox === "on" ? 0 : 1) * objectData.quantidade}`,
    ];
    const rowInfo = document.createElement("tr");

    arrayInfo.map((item) => {
        const cell = document.createElement("td");
        const cellText = document.createTextNode(item);
        cell.appendChild(cellText);
        rowInfo.appendChild(cell);
    });
    tableBodyInfo.appendChild(rowInfo);

    // generate table
    for (let i = 0; i < objectData.quantidade; i++) {
        const row = document.createElement("tr");

        var ident = objectData.ident;
        if (tipoNumeracaoCabos.value === "1") {
            // Um código para cada cabo
            var num = ident.replace(/^\D+/g, '');
            ident = ident.replace(/[0-9]/g, '') + String((parseInt(num) + i));
        }

        const arrayData = [
            objectData.posicao,
            ident,
            objectData.comprimento,
            `${objectData.checkbox === "on" ? 2 : 1}`,
            `${objectData.checkbox === "on" ? 0 : 1}`,
            objectData.along_prev,
        ];

        arrayData.map((item) => {
            const cell = document.createElement("td");
            const cellText = document.createTextNode(item);
            cell.appendChild(cellText);
            row.appendChild(cell);
        });

        // add the row to the end of the table body
        tableBody.appendChild(row);
    }

    // ajax
    fetch("api_url", {
            method: "POST",
            body: JSON.stringify(objectData), // The data in json
            headers: {
                "Content-type": "application/x-www-form-urlencoded",
            },
        })
        .then((res) => res.json())
        .then((response) => console.log("Success:", JSON.stringify(response)))
        .catch((error) => console.error("Error:", error));
}