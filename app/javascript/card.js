const pay = () => {
  Payjp.setPublicKey("pk_test_179d033e42d50dadd1af279f"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("mailing_address_order_history[number]"),
      cvc: formData.get("mailing_address_order_history[cvc]"),
      exp_month: formData.get("mailing_address_order_history[exp_month]"),
      exp_year: `20${formData.get("mailing_address_order_history[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
      
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);