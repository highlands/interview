// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react'
import ReactDOM from 'react-dom'


class Dashboard extends Component {
  
  constructor(props) {
    super(props);
    
    this.state = {
      term: '',
      autoCompleteResults: [],
      itemSelected: {},
      showItemSelected: false
    };
    
    $.getJSON('/search?q=' + this.state.term)
      .then(response => this.setState({ autoCompleteResults: response.items }))
  }
  
  getAutoCompleteResults(e){
    this.setState({
      term: e.target.value
    }, () => {
      $.getJSON('/search?q=' + this.state.term)
        .then(response => this.setState({ autoCompleteResults: response.items }))
    });
  }
  
  render(){
    
    let autoCompleteList = this.state.autoCompleteResults.map((response, index) => {
      return <div key={index}>
        <h2>{response.name}</h2>
        <p>UPC: {response.upc}</p>
        <p>Available on: {response.available_on}</p>
      </div>
    })
    
    return (
      <div>
        <input ref={ (input) => { this.searchBar = input } } value={ this.state.term } onChange={ this.getAutoCompleteResults.bind(this) } type="text" placeholder="Search..." />
        { autoCompleteList }
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Dashboard />,
    document.body.appendChild(document.createElement('div')),
  )
});