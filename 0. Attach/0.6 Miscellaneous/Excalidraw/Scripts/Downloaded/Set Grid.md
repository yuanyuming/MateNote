/*
![[0. Attach/0.4 Picture/f359fdcc061a560f838cea276f7fd3e8_MD5.jpg]]

The default grid size in Excalidraw is 20. Currently there is no way to change the grid size via the user interface. This script offers a way to bridge this gap.

See documentation for more details:
https://zsviczian.github.io/obsidian-excalidraw-plugin/ExcalidrawScriptsEngine.html

```javascript
*/
const grid = parseInt(await utils.inputPrompt("Grid size?",null,"20"));
if(isNaN(grid)) return; //this is to avoid passing an illegal value to Excalidraw
const api = ea.getExcalidrawAPI();
let appState = api.getAppState();
appState.gridSize = grid;
api.updateScene({
  appState,
  commitToHistory:false
});