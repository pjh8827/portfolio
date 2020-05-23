import { observable, action } from 'mobx';

export default class CounterStore{
    root : any;
    @observable number = 1;

    // *** root를 받는 constructor 추가
    constructor(root : any = null){
        this.root = root;
    }

    @action increase = () =>{
        this.number++;
    }

    @action decrease = () =>{
        this.number--;
    }
}