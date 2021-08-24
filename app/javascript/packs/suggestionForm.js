const algoliasearch = require('algoliasearch'); // 呼び出す
const autocomplete = require('autocomplete.js'); // 呼び出す
console.log(autocomplete);
const algolia_application_id = 'S5CBUQ3CZ9'; // API KEY
const algolia_search_only_api_key = 'c06206900246d3ae4d08a140803e36cd'; // API KEY

const client = algoliasearch(algolia_application_id, algolia_search_only_api_key);
const index = client.initIndex('Sampler');
autocomplete('#query', {hint: false}, [ // id=queryの inputフォームを対象
  {
    source: autocomplete.sources.hits(index, {hitsPerPage: 5}), // 何件表示するか
    displayKey: function (suggestion) {
      return suggestion.name
    },
    templates: {
      suggestion: function (suggestion) {
        return `${suggestion._highlightResult.name.value} / ${suggestion._highlightResult.name_furi.value}`; // 候補表示する文字列
      },
      empty: '検索キーワードを見直してください' // 検索結果がない時の表示
    }
  }
]).on('autocomplete:selected', function (event, suggestion, dataset, context) {
  console.log(event, suggestion, dataset, context);
  if (context.selectionMethod === 'click') {
    window.location.assign(`/?query=${suggestion.name}`); // 候補をクリックしたときの動作。今回は候補名をもとにGETリクエストを送ります。
    return;
  }
});
