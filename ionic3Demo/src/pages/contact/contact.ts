import { Component } from '@angular/core';
import {ModalController, NavController } from 'ionic-angular';
import {HttpClient,HttpParams} from "@angular/common/http";
import{ReplyPage}from'../reply/reply';

@Component({
  selector: 'page-contact',
  templateUrl: 'contact.html'
})
export class ContactPage {
  public listData: any;
  public UserID:string=localStorage.getItem(localStorage.key(0));//加载出用户ID
  constructor(public modalCtrl: ModalController,public navCtrl: NavController,public http:HttpClient) {
   this.MainArticleCenter();
  }
  

  private encodeHttpParams(params: any): any {//定义方法对参数进行处理
    if (!params) return null;
    return new HttpParams({fromObject: params});
  }



  RemoveArticle(index:any){
    var Removefromdata={
      Users_LikeID:this.UserID,
      Users_LikeArticleID:this.listData[index].Article_ID
    }
    let url: string = 'http://localhost:54882/API/Main/RemoveMyFollow.ashx';
    this.listData.splice(index,1);
    this.http.post(url,this.encodeHttpParams(Removefromdata) )
  .subscribe(res => {
    alert("删除成功")
  }, error => {
    console.log("什么也没有")
  });

  }



  Reply(index:any){
    
    let data:object={
      Article:this.listData[index].Article_ID
    }
    let profileModal = this.modalCtrl.create(ReplyPage, data);
    profileModal.present();
    //this.navCtrl.push(ReplyPage)
  }

  MainArticleCenter(){
 
     var fromdata={
       Users_ID:this.UserID
     }
     console.log(fromdata)
     let url: string = 'http://localhost:54882/API/Main/FollowArticleCenter.ashx';
       this.http.post(url,this.encodeHttpParams(fromdata) )
     .subscribe(res => {
       console.log(res)
      this.listData=res;
     }, error => {
       console.log("什么也没有")
     });
   }

}
