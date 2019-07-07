import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import {HttpClient,HttpParams} from "@angular/common/http";//引入http服务
/**
 * Generated class for the ReplyPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-reply',
  templateUrl: 'reply.html',
})
export class ReplyPage {
  public modeldata:string;
  public listData: Object;
  public UserID:string=localStorage.getItem(localStorage.key(0));
  Reqlyname:string;
  constructor(public navCtrl: NavController, public navParams: NavParams,public http:HttpClient,) {
  }


  private encodeHttpParams(params: any): any {//定义方法对参数进行处理
    if (!params) return null;
    return new HttpParams({fromObject: params});
  }

  AddReply(index){
    alert(index)
    this.Reqlyname="回复"+this.listData[index].Users_Nickname+":"
    console.log(this.Reqlyname)
  }
  ReleaseReply(){
    alert("触发")
    var Reqlydata={
      Article_ID:this.modeldata,
      Users_ID:this.UserID,
      Replycenter:this.Reqlyname,
    }
    console.log(Reqlydata);
    let url: string = 'http://localhost:54882/API/Main/AddReply.ashx';
   this.http.post(url,this.encodeHttpParams(Reqlydata) )
   .subscribe(res => {
     console.log(res)
   }, error => {
     console.log("什么也没有")
   });
  }

  ionViewDidLoad() {
    this.modeldata =this.navParams.get('Article')
    var fromdata={
      Article_ID:this.modeldata
    }
    console.log(fromdata);
   let url: string = 'http://localhost:54882/API/Main/commentcenter.ashx';
   this.http.post(url,this.encodeHttpParams(fromdata) )
   .subscribe(res => {
     console.log(res)
    this.listData=res;
   }, error => {
     console.log("什么也没有")
   });
  }

}
