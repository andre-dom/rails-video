let copyToClipboard = function(){
    let copyText = document.getElementById("textToCopy");
    copyText.select();
    copyText.setSelectionRange(0, 99999); /* For mobile devices */
    document.execCommand("copy");
}