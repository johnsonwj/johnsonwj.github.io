import React from 'react';
import { render } from 'react-dom';
import { Router, Route, browserHistory } from 'react-router';

import '../styles/main.scss';

function Home() {
	return <div id="home">test div please ignore</div>;
}

render((
	<Router history={browserHistory}>
		<Route path="/" component={Home} />
	</Router>
), document.getElementById('app'));
