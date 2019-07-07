import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import {HttpClient,HttpParams} from "@angular/common/http";//引入http服务
import{LoginPage}from"../login/login"

/**
 * Generated class for the RegisterrPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-registerr',
  templateUrl: 'registerr.html',
})
export class RegisterrPage {
  Verificationtext:string;
  Verificationerror:string;
  showhide:string="2";
  Accounttext:string;
  numb:string;
  Passwordtext:string;
  constructor(public navCtrl: NavController, public navParams: NavParams,public http:HttpClient,) {
  
  }

  private encodeHttpParams(params: any): any {//定义方法对参数进行处理
    if (!params) return null;
    return new HttpParams({fromObject: params});
  }
//18837312920
  Obtain(){
   var Verificationdata={
    usename:this.Accounttext
    }
    console.log(Verificationdata);
    let url: string = 'http://localhost:54882/API/login/VerificationCode.ashx';
    this.http.post(url,this.encodeHttpParams(Verificationdata) )
    .subscribe(res => {
      this.numb=res.toString();
      console.log(res)
    }, error => {
      console.log(this.numb)
    });
  }


  Verification(){
    
    if(this.Verificationtext==this.numb)
    {
      this.showhide="1"
      this.Verificationerror=""

    }
    else{
      this.Verificationerror="验证码错误"
    }
  }

  Register(){
    var Registerdata={
      usename:this.Accounttext,
      usepwd:this.Passwordtext,
      }
      let url: string = 'http://localhost:54882/API/login/register.ashx';
      this.http.post(url,this.encodeHttpParams(Registerdata) )
      .subscribe(res => {
        alert(res)
        alert("返回登录页面登录")
      }, error => {
        console.log("注册失败")
        alert("返回登录页面登录")
      });
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegisterrPage');
  }

}
