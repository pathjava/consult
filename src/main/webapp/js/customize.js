$('.is_mentor').prop('indeterminate', true)

function ValidateSize(file) {
    const FileSize = file.files[0].size / 1024 / 1024; // in MB
    if (FileSize > 1) {
        alert('Размер файла превышает 1 MB');
        // $(file).val(''); //for clearing with Jquery
    } else {

    }
}