/*
![[0. Attach/0.4 Picture/32d2af0cc4e15367fc899f06ea2358e1_MD5.jpg]]

Sets text alignment of text block (cetner, right, left). Useful if you want to set a keyboard shortcut for selecting text alignment.

See documentation for more details:
https://zsviczian.github.io/obsidian-excalidraw-plugin/ExcalidrawScriptsEngine.html

```javascript
*/
elements = ea.getViewSelectedElements().filter((el)=>el.type==="text");
if(elements.length===0) return;
let align = ["left","right","center"];
align = await utils.suggester(align,align);
elements.forEach((el)=>el.textAlign = align);
ea.copyViewElementsToEAforEditing(elements);
ea.addElementsToView(false,false);