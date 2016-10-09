import React from "react";
import $ from "jquery"
import Cookies from "js.cookie"

console.log(Cookies)

export default class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = {count: props.initialCount};
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({count: this.state.count + 1});
  }

  uploadFile() {
    var fd = new FormData();
    fd.append('file', this.refs.file.getDOMNode().files[0]);

    $.ajax({
        url: '/upload/create',
        data: fd,
        processData: false,
        contentType: false,
        type: 'POST',
        beforeSend: function(xhr) {
          xhr.setRequestHeader('x-csrf-token', Cookies.get("_csrf_token").replace(/\s/g, '+'))
        },
        success: function(data){
            alert(data);
        }
    });
  }

  render() {
    return (
        <div>
          <h4> Select file </h4>
          <form ref="uploadForm" className="uploader" encType="multipart/form-data" >
             <input ref="file" type="file" name="file" className="upload-file"/>
             <input type="button" ref="button" value="Upload" onClick={ (e) => this.uploadFile(e) } />
           </form>
        </div>
    );
  }
}

Form.propTypes = { initialCount: React.PropTypes.number };
Form.defaultProps = { initialCount: 0 };



