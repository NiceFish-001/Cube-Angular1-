import { Component } from '@angular/core';
import { ModalController,NavController,NavParams,ViewController } from 'ionic-angular';
import {HttpClient,HttpParams} from "@angular/common/http";//引入http服务
import{ReplyPage}from'../reply/reply';
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  public UserID:string=localStorage.getItem(localStorage.key(0));
  public listData: any;
  constructor(public modalCtrl: ModalController,public navCtrl: NavController,public navParams:NavParams,
    public viewCtrl: ViewController,public http:HttpClient,) {
    this.MainArticleCenter()
  }
   
  private encodeHttpParams(params: any): any {//定义方法对参数进行处理
    if (!params) return null;
    return new HttpParams({fromObject: params});
  }

  Reply(index:any){
 
    console.log(this.listData[index].Article_ID)
    let data:object={
      Article:this.listData[index].Article_ID
    }
    console.log(data);
    let profileModal = this.modalCtrl.create(ReplyPage,data);
    profileModal.present();
    //this.navCtrl.push(ReplyPage)
  }

  Collection(index:any){
    var FollowArticledata={
      Users_LikeID:this.UserID,
      Users_LikeArticleID:this.listData[index].Article_ID
    }
    let url: string = 'http://localhost:54882/API/Main/FollowArticle.ashx';
      this.http.post(url,this.encodeHttpParams(FollowArticledata) )
    .subscribe(res => {
      console.log(res)
    }, error => {
      console.log("什么也没有")
    });

  }

  MainArticleCenter(){
   var Users_IDnumber= localStorage.getItem(localStorage.key(0))
    var fromdata={
      Users_ID:Users_IDnumber
    }
    console.log(fromdata)
    let url: string = 'http://localhost:54882/API/Main/PhoneMainArticle.ashx';
      this.http.post(url,this.encodeHttpParams(fromdata) )
    .subscribe(res => {
      console.log(res)
     this.listData=res;
    }, error => {
      console.log("什么也没有")
    });
  }

}
