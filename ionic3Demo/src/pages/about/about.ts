import { Component } from '@angular/core';
import {ModalController, NavController} from 'ionic-angular';
import {HttpClient,HttpParams} from "@angular/common/http";
import{ReplyPage}from'../reply/reply';
import { ChangeDetectorRef } from "@angular/core"

@Component({//装饰器
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {
  public listData: any=[];
  public UserID:string=localStorage.getItem(localStorage.key(0));//加载出用户ID
   constructor(public cd:ChangeDetectorRef,public modalCtrl: ModalController,public navCtrl: NavController,public http:HttpClient) {
    this.MainArticleCenter();
   }

   private encodeHttpParams(params: any): any {//定义方法对参数进行处理
    if (!params) return null;
    return new HttpParams({fromObject: params});
  }

  Reply(index:any){
    
    let data:object={
      Article:this.listData[index].Article_ID
    }
    let profileModal = this.modalCtrl.create(ReplyPage, data);
    profileModal.present();
    //this.navCtrl.push(ReplyPage)
  }

  RemoveMyArticle(index:any)
  {
    
    var Removefromdata={
      Users_ID:this.UserID,
      Article_ID:this.listData[index].Article_ID
    }
    let url: string = 'http://localhost:54882/API/Main/RemoveMyArticle.ashx';


    this.http.post(url,this.encodeHttpParams(Removefromdata) )
  .subscribe(res=>{
    alert("删除成功")
    this.cd.detectChanges();
    this.listData.splice(index,1);
  }, error => {
    console.log("什么也没有")
  });

  }


   MainArticleCenter(){
    var fromdata={
      Users_ID:this.UserID
    }
    console.log(fromdata)
    let url: string = 'http://localhost:54882/API/Main/MyArticleCenter.ashx';
      this.http.post(url,this.encodeHttpParams(fromdata) )
    .subscribe(res => {
      console.log(res)
     this.listData=res;
    }, error => {
      console.log("什么也没有")
    });
  }



}
