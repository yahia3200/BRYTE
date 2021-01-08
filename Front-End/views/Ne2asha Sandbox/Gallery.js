document.querySelector("#grid").addEventListener("click",()=>{
    if( document.querySelector("#grid").classList.contains('unclicked'))
    {
        document.getElementById("grid").classList.remove('unclicked');
        document.getElementById("grid").classList.add('clicked');
        document.getElementById("list").classList.remove('clicked');
        document.getElementById("list").classList.add('unclicked');
        
    }
});
document.querySelector("#list").addEventListener("click",()=>{
    if( document.querySelector("#list").classList.contains('unclicked'))
    {
        document.getElementById("list").classList.remove('unclicked');
        document.getElementById("list").classList.add('clicked');
        document.getElementById("grid").classList.remove('clicked');
        document.getElementById("grid").classList.add('unclicked');
        document.querySelector("line").style.stroke="#8F9EB4"
    }
});
document.querySelector('#hide1').addEventListener("click",()=>{
    var style = document.querySelector('#SectionBody1').style;
    var style1 = document.querySelector('#hide1').style
    if(style.display=="none"){
        style.display="block";
        style1.transform= "rotate(0deg)";
    }else{
        style.display="none";
        style1.transform= "rotate(180deg)";
    }

});
document.querySelector('#hide2').addEventListener("click",()=>{
    var style = document.querySelector('#SectionBody2').style;
    var style1 = document.querySelector('#hide2').style
    if(style.display=="none"){
        style.display="block";
        style1.transform= "rotate(0deg)";
    }else{
        style.display="none";
        style1.transform= "rotate(180deg)";
    }
});

document.querySelector("#AI").addEventListener("click",()=>{
    if(document.querySelector("#AI").checked){
        document.querySelector("#AISVG").classList.remove("unchecked")
    }else{
        document.querySelector("#AISVG").classList.add("unchecked")
    }
});