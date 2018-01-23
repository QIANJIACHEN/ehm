$(function(){
   var tips = $('.tips');
   if(!$.support.style){
       tips.show();
       tips.click(function(){
            $(this).parent().find("input").focus();
       });
       tips.parent().find("input").each(function(){
          $(this).keyup(function(){
              if($(this).val() != ""){
                  $(this).parent().find(".tips").hide();
              }else{
                  $(this).parent().find(".tips").show();
              }
          });
       });
   }
});