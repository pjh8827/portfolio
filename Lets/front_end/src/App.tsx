import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Counter from "mobx/Counter";
import SuperMarket from "mobx/SuperMarket";

import 'app.scss';

import IntroPage from "pages/intropage/IntroPage";
import MapPage from "pages/mappage/MapPage";

function App() {
  return (
    <div className="App">
      <Router>
        <Switch>
          <Route exact path="/" component={IntroPage} />
          <Route exact path="/map" component={MapPage} />
        </Switch>
      </Router>
      {/* <div className="App">
        <Counter />
        <hr />
        <SuperMarket />
      </div> */}
    </div>
  );
}

export default App;
