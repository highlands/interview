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
      return <div className="col-md-4 product-col" key={index}>
        <div className="card">
          <h5 className="card-header">{response.name}</h5>
          <div className="card-body">
            <p className="card-text">UPC: {response.upc}</p>
            <p className="card-text">Available on: {response.available_on}</p>
            <p className="card-text">Properties:</p>
            <ul className="list-group">
            {
              response.product_properties.map((item, index) => {
                return <li key={index} className="list-group-item">{item.property}: {item.product_property_value}</li>
              })
            }
            </ul>
          </div>
        </div>
      </div>
    })
    
    return (
      <div className="container">
        <div className="row">
          <div className="col-sm-12">
            <div className="form-group">
              <input ref={ (input) => { this.searchBar = input } } value={ this.state.term } onChange={ this.getAutoCompleteResults.bind(this) } type="text" placeholder="Search..." className="form-control" />
            </div>
          </div>
        </div>
        <div className="row">
        { autoCompleteList }
        </div>
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