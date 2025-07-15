const validarCampos = () => {
    let mensagem = "";
    let erro = false;

    if (document.form2.nome.value.trim() === "") {
        mensagem += "<b>Preencher o campo Nome Completo<br></b>";
        erro = true;
    }

    if (document.form2.cpf.value.trim() === "") {
        mensagem += "<b>Preencher o campo CPF<br></b>";
        erro = true;
    }

    if (document.form2.email.value.trim() === "") {
        mensagem += "<b>Preencher o campo E-mail<br></b>";
        erro = true;
    }

    if (document.form2.senha.value.trim() === "") {
        mensagem += "<b>Preencher o campo Senha<br></b>";
        erro = true;
    }

    if (
        document.form2.dia.value === "" ||
        document.form2.mes.value === "" ||
        document.form2.ano.value === ""
    ) {
        mensagem += "<b>Selecionar a Data de Nascimento completa<br></b>";
        erro = true;
    }

    const generoSelecionado = 
        document.form2.genero[0].checked || 
        document.form2.genero[1].checked || 
        document.form2.genero[2].checked;

    if (!generoSelecionado) {
        mensagem += "<b>Selecionar o Gênero<br></b>";
        erro = true;
    }

    document.form2.nome.focus(); // foco no primeiro campo

    if (erro) {
        document.getElementById("mensagem").innerHTML = mensagem;
        return false;
    } else {
        return true;
    }
}

const limparCampos = () => {
    document.form2.nome.value = "";
    document.form2.cpf.value = "";
    document.form2.email.value = "";
    document.form2.senha.value = "";
    document.form2.dia.value = "";
    document.form2.mes.value = "";
    document.form2.ano.value = "";

    const radios = document.form2.genero;
    for (let i = 0; i < radios.length; i++) {
        radios[i].checked = false;
    }

    document.getElementById("mensagem").innerText = "";
    document.form2.nome.focus();
}
 
