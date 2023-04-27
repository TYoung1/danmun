function chk1(){
    let warn1 = document.getElementById("warnid");
    let id = document.getElementById("user_id").value;
    if(!id){
        warn1.innerHTML="아이디를 입력해주세요"
    }
    else{
        warn1.innerHTML=""
    }
}
function chk2(){
let warn2 = document.getElementById("warnpw");
let pw = document.getElementById("user_pw").value;
    if(!pw){
        warn2.innerHTML="패스워드를 입력해주세요"
    }
    else{
        warn2.innerHTML=""
    }
}