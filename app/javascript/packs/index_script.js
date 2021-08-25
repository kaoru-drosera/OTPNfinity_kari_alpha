console.log(" 埋め込み蕎麦 ");

var samplerPost_"<%=" + sampler.id  + "%>" = document.getElementById('sampler_"<%=" + sampler.id  + "%>"');

samplerPost_"<%=" + sampler.id  + "%>".addEventListener('click',function(){
  // 音量変更

  console.log(samplerPost_"<%=" + sampler.id  + "%>");
  samplerName.value = "<%=" + sampler.sampler_name  + "%>" ;

  // 上段
  // Q
  volumeQ.value = "<%=" + @seboard_Q.volume  + "%>";
  soundQ.volume = "<%=" + @seboard_Q.volume  + "%>" * 0.01;
  btnColorQ["<%=" + @seboard_Q.btncolor  + "%>" - 1].checked = true;
  btnColorInit(btnColorQ, bg_Q);
  soundQ.src = "<%=" + @seboard_Q.sefile.sedata "%>";

  loopQ.checked = "<%=" + @seboard_Q.loopable  + "%>";
  loopQ.loop = "<%=" + @seboard_Q.loopable  + "%>";
  loopValue_q = "<%=" + @seboard_Q.loopable  + "%>";
  soundQ.loop = "<%=" + @seboard_Q.loopable  + "%>";


  // W
  volumeW.value = "<%=" + @seboard_W.volume  + "%>";
  soundW.volume = "<%=" + @seboard_W.volume  + "%>" * 0.01;
  btnColorW["<%=" + @seboard_W.btncolor  + "%>" - 1].checked = true;
  btnColorInit(btnColorW, bg_W);
  soundW.src = "<%=" + @seboard_W.sefile.sedata + "%>";

  loopW.checked = "<%=" + @seboard_W.loopable  + "%>";
  loopW.loop = "<%=" + @seboard_W.loopable  + "%>";
  loopValue_w = "<%=" + @seboard_W.loopable  + "%>";
  soundW.loop = "<%=" + @seboard_W.loopable  + "%>";





});
