const {app,BrowserWindow,session}=require('electron');
app.whenReady().then(()=>{
  const ok=['midi','midiSysex','media'];
  session.defaultSession.setPermissionRequestHandler((wc,perm,cb)=>cb(ok.includes(perm)));
  session.defaultSession.setPermissionCheckHandler((wc,perm)=>ok.includes(perm));
  const w=new BrowserWindow({width:1100,height:680,backgroundColor:'#0d0f14',autoHideMenuBar:true,title:'electribe'});
  w.loadFile('index.html');
});
app.on('window-all-closed',()=>app.quit());
