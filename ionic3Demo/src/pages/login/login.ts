import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ModalController } from 'ionic-angular';
import { TabsPage } from "../tabs/tabs";
import {HttpClient,HttpParams} from "@angular/common/http";//引入http服务
import{ RegisterrPage}from"../registerr/registerr"
/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {//声明类

  constructor(public navCtrl: NavController, public navParams: NavParams,
    public http:HttpClient,public modalctrl:ModalController) {//生命构造函数
    
  }
  //定义方法对传递的参数进行处理
  private encodeHttpParams(params: any): any {
    if (!params) return null;
    return new HttpParams({fromObject: params});
  }
  //在外部自定义方法进行调用
  //登陆验证
  logIn(username: HTMLInputElement, password: HTMLInputElement){//定义登陆方法获取输入的账号和密码同时进行验证
    
    var fromdata={
      usename:username.value,
      usepwd:password.value
    }
    let url: string = 'http://localhost:54882/API/login/Login.ashx';
      this.http.post(url,this.encodeHttpParams(fromdata) )
    .subscribe(res => {
      console.log(res[0].Users_ID)
       localStorage.setItem("用户名",res[0].Users_ID);
      this.navCtrl.push(TabsPage)
    }, error => {
      console.log("什么也没有")
    }); 
  }

  register(){//定义登陆方法获取输入的账号和密码同时进行验证
   
    this.navCtrl.push(RegisterrPage)
  }

}
