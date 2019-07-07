use master
go
if exists(select 1 from sys.databases where name='CubeDB')
create database CubeDB
go
create database CubeDB
on(name='CubeDB',filename='F:\MyDB\CubeDB.MDF',size=5)
go
use CubeDB
go

create table Label
(

Label_ParentlevelID int primary key identity(1,1),--（父级标签ID）

Label_Parentlevel varchar(20) not null,--（父级标签）
)
go
insert into Label values('颜值')
insert into Label values('二次元')
insert into Label values('影视')
insert into Label values('摄影')
insert into Label values('绘画')
insert into Label values('技术')
insert into Label values('穿搭')
insert into Label values('设计')
insert into Label values('美妆')
insert into Label values('文学')
insert into Label values('旅游')
insert into Label values('美食')
insert into Label values('娱乐')
go

create table Users
(

Users_ID int primary key identity(1,1),--（用户ID）

Users_AccountNumber varchar(40) not null,--（用户账号）

Users_Pwd varchar(12) not null,--（用户账号密码）

Users_Nickname varchar(12) not null,--（用户昵称）

Users_Img text,--（用户头像）

Users_Daren bit not null,--（账号达人）

Users_Emile varchar(30),--（用户邮箱）

Users_QQ varchar(11),--（用户QQ）

Users_State bit not null,--（用户状态）

User_introduction nvarchar(1000)--(用户介绍)
)
go
insert into Users values('18439453828','145251','XSB',null,0,null,null,0,null)
insert into Users values('15138735163','145251','LHN',null,0,null,null,0,null)
insert into Users values('13083640308','145251','LHJ',null,0,null,null,0,null)
delete Users where Users_ID=5
select * from Users

create table Article
(

Article_ID int primary key identity(1,1),--(文章ID)

Article_type nvarchar(20),--1.文字2.图文3.图片（最多五张）4.音乐（仅一个）5.视频（仅一个）--(文章类别)

Article_img text,--文章封面

Article_title nvarchar(20),--文章标题

Article_Browsetimes int not null,--（文章浏览次数）

Article_Reprint bit not null,--（文章允许转载）

Article_Good int,--（点赞数）

Users_ID int foreign key references Users(Users_ID),--(用户ID)

Article_State bit,--(文章状态)

ArticleCountent_text text,--(文章内容)
)
go

insert into Article values('图文',null,'超级酷de文章',50,1,50,1,1,'土地是以它的肥沃和收获而被估价的；才能也是土地，不过它生产的不是粮食，而是真理。如果只能滋生瞑想和幻想的话，即使再大的才能也只是砂地或盐池，那上面连小草也长不出来的。 —— 别林斯基')
insert into Article values('图文',null,'超级酷de文章',50,1,50,1,1,'我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。 —— 蒙田')
insert into Article values('图文',null,'超级酷de文章',50,1,50,1,1,'时间是一切财富中最宝贵的财富。 —— 德奥弗拉斯多')
insert into Article values('图文',null,'超级酷de文章',50,1,50,2,1,'世界上一成不变的东西，只有“任何事物都是在不断变化的”这条真理。 —— 斯里兰卡')
insert into Article values('图文',null,'超级酷de文章',50,1,50,2,1,'过放荡不羁的生活，容易得像顺水推舟，但是要结识良朋益友，却难如登天。 —— 巴尔扎克')
insert into Article values('图文',null,'超级酷de文章',50,1,50,2,1,'这世界要是没有爱情，它在我们心中还会有什么意义！这就如一盏没有亮光的走马灯。 —— 歌德')
insert into Article values('图文',null,'超级酷de文章',50,1,50,2,1,'生活有度，人生添寿。 —— 书摘')
insert into Article values('图文',null,'超级酷de文章',50,1,50,2,1,'生活有度，人生添寿。 —— 书摘')
go
select * from Article

create table Label_user
(
Label_userID int primary key identity(1,1),--（喜欢标签ID）

UserID int foreign key references Users(Users_ID),--（用户标签）

user_interest nvarchar(80),
)

insert into Label_user values(1,'美食')
insert into Label_user values(1,'摄影')
insert into Label_user values(1,'娱乐')


insert into Label_user values(2,'影视')
insert into Label_user values(2,'摄影')
insert into Label_user values(2,'旅游')
insert into Label_user values(2,'时尚')
insert into Label_user values(2,'生活')
insert into Label_user values(2,'美食')
insert into Label_user values(2,'二次元')
insert into Label_user values(2,'设计')
insert into Label_user values(2,'游戏')
insert into Label_user values(2,'绘画')

insert into Label_user values(3,'影视')
insert into Label_user values(3,'摄影')
insert into Label_user values(3,'娱乐')

create table Collections
(
Collections_ID int primary key identity(1,1),

Collections_Img text,--（合集封面）

Collections_Name varchar(20),--（合集名称）

Collections_Introduce varchar(100) not null,--（合集简介）

Users_ID int foreign key references Users(Users_ID),--（合集用户）

Collections_Label nvarchar(100)--(合集相关标签) 
)
go


select * from Collections where Users_ID=1

insert into Collections values(null,'我的第一个合集','这是我创建的第一篇合集',1)
insert into Collections values(null,'我的第一个合集','这是我创建的第一篇合集',2)
insert into Collections values(null,'我的第二个合集','这是我创建的第二篇合集',1)
insert into Collections values(null,'我的第二个合集','这是我创建的第二篇合集',2)
--(合集标签表)




create table Collectionsabout(--合集收藏表

Collectionsabout_ID int primary key identity(1,1),--合集收藏ID

Collections_ID  int foreign key references Collections(Collections_ID),--(合集ID)

Article_ID int,--(文章ID)
)
insert into Collectionsabout values(1,1)
insert into Collectionsabout values(1,1)
insert into Collectionsabout values(1,2)
insert into Collectionsabout values(2,4)
insert into Collectionsabout values(2,6)
go






--（评论表）

create table Comment
(

Comment_ID int primary key identity(1,1),--(评论ID)

Article_ID int,--（文章ID）

Users_ID int foreign key references Users(Users_ID) ,--（发布评论用户）

Comment_Content varchar(200) not null,--（评论内容）

)
go
insert into Comment values(22,2,'这篇文章非常棒1')
insert into Comment values(22,3,'这篇文章非常棒2')
insert into Comment values(22,1,'这篇文章非常棒3')
insert into Comment values(22,2,'这篇文章非常棒1')
insert into Comment values(22,3,'这篇文章非常棒2')
insert into Comment values(22,1,'这篇文章非常棒3')

insert into Comment values(21,2,'这篇文章非常棒1')
insert into Comment values(21,3,'这篇文章非常棒2')
insert into Comment values(21,1,'这篇文章非常棒3')

insert into Comment values(20,2,'这篇文章非常棒1')
insert into Comment values(20,3,'这篇文章非常棒2')
insert into Comment values(20,1,'这篇文章非常棒3')



--（文章关注表）
create table FollowArticle
(

FollowArticleID int primary key identity(1,1),--（文章关注ID）

Users_LikeID int ,--（关注用户ID）

Users_LikeArticleID int foreign key references Article(Article_ID),--（关注文章用户ID）
)
go




create table PrivateLetter
(

PrivateLetter_ID int primary key identity(1,1),--（私信ID）

PrivateLetter_ReceiveID int ,--（接收用户ID）

PrivateLetter_content varchar(800) not null,--（私信内容）
)
go


--（管理表）
create table Administration
(
--（管理ID）
Administration_ID int primary key identity(1,1),
--（管理账号）
Administration_AccountNumber varchar(20) not null,
--（管理密码）
Administration_Pwd varchar(20) not null,
)
select * from Users inner join Label_user on Users.Users_ID=Label_user.UserID where Users.Users_ID=1