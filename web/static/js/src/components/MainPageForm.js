import React from 'react';
//import thunkMiddleware  from 'redux-thunk';
//import rootReducer from '../reducers';
//import mainPageFormReducer from '../reducers/mainPageFromReducer';
//import { Provider } from 'react-redux';
//import { createStore, applyMiddleware } from 'redux';


//rootReducer is the combined reducers we created. Remember that Redux has only one Store so we must,
//combine our reducers into one.
//Middleware is for allowing us to send Async actions that can return a function instead of an object
//const store = createStore(
//  rootReducer,
//  applyMiddleware(thunkMiddleware)
//);

export default () => {
  //We use this function whenever we want to redirect the User to the login page in case of failed
  //verification. On the rest of the cases we don't mind if User is logged in so we won't
  //redirect him
  //const requireLogin = () => {
  //  store.dispatch(verifyUserToken("securedRoutes"));
  //}
  //Our routes for this app. IndexRoute is like the home page. Template is the default template for all the pages.
  // The Template component is the perfect place to set the NavBar
  //  return (
  //      <Provider store={store}>
  //        <Router history={hashHistory}>
  //          <Route path="/" component={ Template } >
  //            <IndexRoute component={ Welcome } />
  //            <Route path="/login" component={ Login } />
  //            <Route path="/register" component={ Register } />
  //            <Route path="/rooms" component={ Rooms } onEnter={requireLogin} />
  //            <Route path="/rooms/:room" component={ Room } />
  //            <Route path="/update" component={ Update } onEnter={requireLogin} />
  //            <Route path="/updatepassword" component={ Update_password } onEnter={requireLogin} />
  //          </Route>
  //        </Router>
  //      </Provider>
  //  );
  //
  //
  return (
    <Provider store={store}>
    </Provider>
  );
}
