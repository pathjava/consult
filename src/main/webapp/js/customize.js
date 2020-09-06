$('.is_mentor').prop('indeterminate', true)

function ValidateSize(file) {
    const FileSize = file.files[0].size / 1024 / 1024; // in MB
    if (FileSize > 1) {
        alert('Размер файла превышает 1 MB');
        // $(file).val(''); //for clearing with Jquery
    } else {

    }
}

function showFunction() {
    const x = document.getElementById("controlPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

$('input[type="checkbox"]').change(function() {
    $(this).next().next().toggle()
})
