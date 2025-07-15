const validarCamposLogin = () => {
    let mensagem = "";
    let erro = false;

    if (document.form1.email.value.trim() === "") {
        mensage += "<b>Preencher o campo E-mail<br></b>";
        erro = true;
    }

    if (document.form1.senha.value.trim() === "") {
        mensagem += "<b>Preencher o campo Senha<br></b>";
        erro = true;
    }

    if (erro) {
        document.getElementById("mensagem").innerHTML = mensagem;
        return false;
    }

    return true;
}
