/*
## requires Excalidraw 1.5.1 or higher
![[0. Attach/0.4 Picture/7c3494c75f147da245e57eab81682b24_MD5.jpg]]

Download this file and save to your Obsidian Vault including the first line, or open it in "Raw" and copy the entire contents to Obsidian.

![[0. Attach/0.4 Picture/7dc967ff0af420855bc9a9d473e7ec73_MD5.jpg]]

Split lines of text into separate text elements for easier reorganization

See documentation for more details:
https://zsviczian.github.io/obsidian-excalidraw-plugin/ExcalidrawScriptsEngine.html

```javascript
*/
elements = ea.getViewSelectedElements().filter((el)=>el.type==="text");
elements.forEach((el)=>{
  ea.style.strokeColor = el.strokeColor;
  ea.style.fontFamily  = el.fontFamily;
  ea.style.fontSize    = el.fontSize;
  const text = el.text.split("\n");
  for(i=0;i<text.length;i++) {
	ea.addText(el.x,el.y+i*el.height/text.length,text[i]);
  }
});
ea.addElementsToView(false,false);
ea.deleteViewElements(elements);