/*
![[0. Attach/0.4 Picture/b17df0f61bf3bf86f74b20786c48e2a8_MD5.jpg]]

iOS scribble helper for better handwriting experience with text elements. If no elements are selected then the script creates a text element at the pointer position and you can use the edit box to modify the text with scribble. If a text element is selected then the script opens the input prompt where you can modify this text with scribble.

```javascript
*/


elements = ea.getViewSelectedElements().filter(el=>el.type==="text");
if(elements.length > 1) {
  new Notice ("Select only 1 or 0 text elements.")
  return;
}

const text = await utils.inputPrompt("Edit text","",(elements.length === 1)?elements[0].rawText:"");
if(!text) return;

if(elements.length === 1) {
	ea.copyViewElementsToEAforEditing(elements);
  ea.getElements()[0].originalText = text;
  ea.getElements()[0].text = text;
  ea.getElements()[0].rawText = text;
  await ea.addElementsToView(false,false);
  return;
}

ea.addText(0,0,text);
await ea.addElementsToView(true, false, true);
