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
    }
});