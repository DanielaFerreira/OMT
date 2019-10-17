$("#filtro").DataTable({
    initComplete: function () {
        this.api().columns().every(function () {
            var column = this;

            column.data().unique().sort().each(function (d, j) {
                select.append('<option value="' + d + '">' + d + '</option>')
            });
        });
    },
    "language": {
        "url": "/OMT/js/addons/datatables-pt-br.json"
    },
    "order": [[0, "asc"]],
    "pagingType": "full_numbers"
});
$(".datatables_length").addClass("bs-select");