let initialState = {
  fileLoaded: false,
  fileLoading: false,
  fileError: false,
}

const mainPageFromReducer = (state = initialState , action) => {
  switch (action.type) {
    case 'START_LOADING':
      return Object.assign({}, state, {
        fileLoaded: false,
        fileLoading: true,
        fileError: false
      })
    default:
      return state;
  }
}

export default user
