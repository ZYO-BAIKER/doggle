//マウスオーバーしたときの色を指定
$(".list-item").on("mouseover",function(){
  $(".list-item").css({
      color: "#4dc0b2",
      backgroundColor: "#ffc042"
  });
});

//マウスアウトしたときに元の色に戻る
$(".list-item").on("mouseout",function(){
  $(".list-item").css({
      color: "",
      backgroundColor: ""
  });
});