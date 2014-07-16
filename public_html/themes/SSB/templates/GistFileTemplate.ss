<div class="field text" id="FileName{$count}">
	<label for="AddSnippetForm_AddSnippetForm_FileName{$count}" class="left">File Name</label>
	<div class="middleColumn">
		<input type="text" id="AddSnippetForm_AddSnippetForm_FileName{$count}" class="text" name="FileName{$count}">
	</div>
</div>
	
<div class="field dropdown" id="FileType{$count}">
	<label for="AddSnippetForm_AddSnippetForm_FileType{$count}" class="left">File Type</label>
	<div class="middleColumn">
		<select id="AddSnippetForm_AddSnippetForm_FileType{$count}" class="dropdown" name="FileType{$count}">
			<option value=".php">.php</option>
			<option value=".ss">.ss</option>
			<option value=".js">.js</option>
			<option value=".css">.css</option>
			<option value=".html">.html</option>
		</select>
	</div>
</div>

		
<div class="field textarea" id="FileContent{$count}">
	<label for="AddSnippetForm_AddSnippetForm_FileContent{$count}" class="left">File Content</label>
	<div class="middleColumn">
		<textarea cols="20" rows="5" id="AddSnippetForm_AddSnippetForm_FileContent{$count}" class="textarea" name="FileContent{$count}"></textarea>
	</div>
</div>