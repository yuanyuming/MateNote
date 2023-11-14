/*

![[0. Attach/0.4 Picture/7c3494c75f147da245e57eab81682b24_MD5.jpg]]

Download this file and save to your Obsidian Vault including the first line, or open it in "Raw" and copy the entire contents to Obsidian.

![[0. Attach/0.4 Picture/7d9b086ef4bcc036a1b2e23bc1f4d991_MD5.jpg]]

The script will prompt you for a filename, then create a new markdown document with the file name provided, open the new markdown document in an adjacent pane, and embed the markdown document into the active Excalidraw drawing.

See documentation for more details:
https://zsviczian.github.io/obsidian-excalidraw-plugin/ExcalidrawScriptsEngine.html

```javascript
*/
let folder = ea.targetView.file.path;
folder = folder.lastIndexOf("/")===-1?"":folder.substring(0,folder.lastIndexOf("/"))+"/";
const fname = await utils.inputPrompt("Filename for new file","Filename",folder);
const file = await app.fileManager.createAndOpenMarkdownFile(fname,true);
await ea.addImage(0,0,file);
ea.addElementsToView(true,true);
