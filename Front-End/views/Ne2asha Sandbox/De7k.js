addWholeProject  = async()=>{
  
    const bidName = document.querySelector("#projectName").value;
    const startDate = document.querySelector("#startDate").value;
    const endDate = document.querySelector("#endDate").value;
    const description = document.querySelector("#description").value;
    const logo = document.querySelector("#logo").value;

    const bidFirstImg = document.querySelector("#projectFirstImg").value;
    const bidSecondImg = document.querySelector("#projectSecondImg").value;

    const price = document.querySelector("#price").textContent;

    const res = await fetch('/addBid', {
      method: 'POST',
      body: JSON.stringify({ bidName, startDate, endDate, description, logo,
                             bidFirstImg, bidSecondImg, price, fields}),
      headers: { 'Content-Type': 'application/json' }
    });
  }