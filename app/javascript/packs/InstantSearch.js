// 1. Instantiate the search
const search = instantsearch({
  indexName: 'OTPNfinity-search',
  searchClient: algoliasearch('S5CBUQ3CZ9', 'c06206900246d3ae4d08a140803e36cd'),
});

search.addWidgets([
  // 2. Create an interactive search box
  instantsearch.widgets.searchBox({
    container: '#search-field',
    placeholder: 'Search for products',
  }),

  // 3. Plug the search results into the product container
  instantsearch.widgets.hits({
    container: '#search-index'
  }),

//   // 4. Make the brands refinable … i have no "blands"! 😂
  // instantsearch.widgets.refinementList({
  //   container: '#brand',
  //   attribute: 'brand',
  // }),
]);

// 5. Start the search!
search.start();



function getTemplate(templateName) {
  return document.querySelector('#' + templateName + '-
template').innerHTML;
}
