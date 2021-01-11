saveProfile  = async()=>{
  
    const Fname = document.querySelector("#Fname").value;
    const Lname = document.querySelector("#Lname").value;
    const phone = document.querySelector("#phone").value;
    const address = document.querySelector("#address").value;
    const birthdate = document.querySelector("#birthdate").value;
    
    const description = document.querySelector("#description").value;
    const logo = document.querySelector("#logo").value;
    const coverPicture = document.querySelector("#coverPicture").value;

    developers.push({UserName : user, role : userRole})
    

    const res = await fetch('/addProject', {
      method: 'POST',
      body: JSON.stringify({ Fname, Lname, phone, address, birthdate, description, logo, coverPicture,
                             working, degrees, category, links}),
      headers: { 'Content-Type': 'application/json' }
});