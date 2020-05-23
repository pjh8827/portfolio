import React, { Component } from 'react';
import { observer, inject } from 'mobx-react';
import CounterStore from 'stores/counter';
interface Props{
    counter? : CounterStore;
}

// @inject((stores : Props)=>({
    //     number : stores.counter!.number,
    // }))
// Counter는 관찰 대상
@inject('counter')
@observer
class Counter extends Component<Props, {}> {
    render(){
        const { counter } = this.props;
        return(
            <div>
                <h1>{counter!.number}</h1>
                <button onClick={counter!.increase}>+1</button>
                <button onClick={counter!.decrease}>-1</button>
            </div>
        );
    }
}

// decorate(Counter, {
//     number : observable,
//     increase : action,
//     decrease : action
// })

// export default observer(Counter);
export default Counter;