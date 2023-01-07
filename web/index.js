$(function () {

   var nomeRisorsa = GetParentResourceName()
   var aperto = false


   function display(bool) {
      if(bool){
         document.getElementsByTagName("body")[0].style.display = "flex"
      } else {
         document.getElementsByTagName("body")[0].style.display = "none"
      }
      setTimeout(() => {
         aperto = bool
      }, 1000);
   }


   window.addEventListener('message', function(event) {
      var data = event.data;
      if (data.event === "open") {
          if (data.status == true) {
              display(true)
          } else {
              display(false)
          }
          
      }


      if(data.playerOn == "numPlayer") {
          document.getElementById('giocatorion').innerHTML = `GIOCATORI ONLINE: ${data.numPlayer}`
      }

      if(data.ping == "myPing") {
          document.getElementById('ping').innerHTML = `PING: ${data.myPing}`
      }
  })

  $("#riprendi").click(function() {
   $.post(`http://${nomeRisorsa}/riprendi`, JSON.stringify({}));
   return
  })

  $("#map").click(function() {
   $.post(`http://${nomeRisorsa}/map`, JSON.stringify({}));
   return
  })

  $("#impostazioni").click(function() {
   $.post(`http://${nomeRisorsa}/impostazioni`, JSON.stringify({}));
   return
  })

  $("#tasti").click(function() {
   $.post(`http://${nomeRisorsa}/tasti`, JSON.stringify({}));
   return
  })

  $("#esci").click(function() {
   $.post(`http://${nomeRisorsa}/esci`, JSON.stringify({}));
   return
  })


  document.onkeyup = function (data) {
   if (data.which == 27 && aperto) {
      $.post(`http://${nomeRisorsa}/close`, JSON.stringify({}));
     return
   }
 }
})
