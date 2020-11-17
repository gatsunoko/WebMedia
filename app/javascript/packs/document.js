import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor';
import Essentials from '@ckeditor/ckeditor5-essentials/src/essentials';
import Autoformat from '@ckeditor/ckeditor5-autoformat/src/autoformat';
import Bold from '@ckeditor/ckeditor5-basic-styles/src/bold';
import Italic from '@ckeditor/ckeditor5-basic-styles/src/italic';
import BlockQuote from '@ckeditor/ckeditor5-block-quote/src/blockquote';
import Heading from '@ckeditor/ckeditor5-heading/src/heading';
import Image from '@ckeditor/ckeditor5-image/src/image';
import Link from '@ckeditor/ckeditor5-link/src/link';
import List from '@ckeditor/ckeditor5-list/src/list';
import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph';

// https://ckeditor.com/docs/ckeditor5/latest/features/markdown.html
import GFMDataProcessor from '@ckeditor/ckeditor5-markdown-gfm/src/gfmdataprocessor';

console.log("aaaa");
// Simple plugin which loads the data processor.
function Markdown(editor) {
  editor.data.processor = new GFMDataProcessor();
}

document.addEventListener('DOMContentLoaded', function() {
  const $textarea = document.getElementById('js-entry-form-content');
  console.log($textarea);
  let content = $textarea.value;
  ClassicEditor
    .create(document.querySelector('#js-editor'), {
      plugins: [
        Markdown,
        Essentials,
        Autoformat,
        Bold,
        Italic,
        BlockQuote,
        Heading,
        Image,
        Link,
        List,
        Paragraph
      ],
      toolbar: [
        'heading',
        '|',
        'alignment',
        'bold',
        'italic',
        'link',
        'bulletedList',
        'numberedList',
        'blockQuote',
        'undo',
        'redo'
      ]
    })
    .then(editor => {
      editor.setData(content);
      editor.model.document.on('change:data', () => {
        $textarea.value = editor.getData();
      })
    })
    .catch(error => {
      console.error(error);
    });
});