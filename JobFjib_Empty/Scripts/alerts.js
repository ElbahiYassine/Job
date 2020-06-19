


function loginalert() {
    Swal.fire({
        icon: 'error',
        text: 'Email ou mot de passe Incorrect!',
        width: 300,
        height:200
    })
}


function emailExist() {
    Swal.fire({
        icon: 'error',
        text: 'Email déja Existe!',
        width: 300,
        height: 200
    })
}

function ImageInvalide() {
    Swal.fire({
        icon: 'error',
        text: 'Image Invalide',
        width: 300,
        height: 200
    })
}

function CVInvalide() {
    Swal.fire({
        icon: 'error',
        text: 'Format  Invalide !! ',
        width: 300,
        height: 200
    })
}

function PostSuc() {
    Swal.fire({
        icon: 'success',
        text: 'Votre Postulation est bien Envoyez!',
        showConfirmButton: false,
        width: 300,
        height: 200
    })
}