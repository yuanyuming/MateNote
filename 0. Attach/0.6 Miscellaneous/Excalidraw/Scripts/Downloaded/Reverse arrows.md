/*
![[0. Attach/0.4 Picture/7c3494c75f147da245e57eab81682b24_MD5.jpg]]

Download this file and save to your Obsidian Vault including the first line, or open it in "Raw" and copy the entire contents to Obsidian.

![[0. Attach/0.4 Picture/06e2cc5a73f322b23adccb52a2cf5239_MD5.jpg]]

Reverse the direction of **arrows** within the scope of selected elements.

See documentation for more details:
https://zsviczian.github.io/obsidian-excalidraw-plugin/ExcalidrawScriptsEngine.html

```javascript
*/
elements = ea.getViewSelectedElements().filter((el)=>el.type==="arrow");
if(!elements || elements.length===0) return;
elements.forEach((el)=>{
	const start = el.startArrowhead;
	el.startArrowhead = el.endArrowhead;
	el.endArrowhead = start;
});
ea.copyViewElementsToEAforEditing(elements);
ea.addElementsToView(false,false);