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

Label_ParentlevelID int primary key identity(1,1),--��������ǩID��

Label_Parentlevel varchar(20) not null,--��������ǩ��
)
go
insert into Label values('��ֵ')
insert into Label values('����Ԫ')
insert into Label values('Ӱ��')
insert into Label values('��Ӱ')
insert into Label values('�滭')
insert into Label values('����')
insert into Label values('����')
insert into Label values('���')
insert into Label values('��ױ')
insert into Label values('��ѧ')
insert into Label values('����')
insert into Label values('��ʳ')
insert into Label values('����')
go

create table Users
(

Users_ID int primary key identity(1,1),--���û�ID��

Users_AccountNumber varchar(40) not null,--���û��˺ţ�

Users_Pwd varchar(12) not null,--���û��˺����룩

Users_Nickname varchar(12) not null,--���û��ǳƣ�

Users_Img text,--���û�ͷ��

Users_Daren bit not null,--���˺Ŵ��ˣ�

Users_Emile varchar(30),--���û����䣩

Users_QQ varchar(11),--���û�QQ��

Users_State bit not null,--���û�״̬��

User_introduction nvarchar(1000)--(�û�����)
)
go
insert into Users values('18439453828','145251','XSB',null,0,null,null,0,null)
insert into Users values('15138735163','145251','LHN',null,0,null,null,0,null)
insert into Users values('13083640308','145251','LHJ',null,0,null,null,0,null)
delete Users where Users_ID=5
select * from Users

create table Article
(

Article_ID int primary key identity(1,1),--(����ID)

Article_type nvarchar(20),--1.����2.ͼ��3.ͼƬ��������ţ�4.���֣���һ����5.��Ƶ����һ����--(�������)

Article_img text,--���·���

Article_title nvarchar(20),--���±���

Article_Browsetimes int not null,--���������������

Article_Reprint bit not null,--����������ת�أ�

Article_Good int,--����������

Users_ID int foreign key references Users(Users_ID),--(�û�ID)

Article_State bit,--(����״̬)

ArticleCountent_text text,--(��������)
)
go

insert into Article values('ͼ��',null,'������de����',50,1,50,1,1,'�����������ķ��ֺ��ջ�������۵ģ�����Ҳ�����أ������������Ĳ�����ʳ�������������ֻ���������ͻ���Ļ�����ʹ�ٴ�Ĳ���Ҳֻ��ɰ�ػ��γأ���������С��Ҳ���������ġ� ���� ����˹��')
insert into Article values('ͼ��',null,'������de����',50,1,50,1,1,'����Ҫ�������������������ͼ�顣Ȼ��������֮�������ͨ�����ȵİ�����Գ�ʵͼ������ݣ�ͼ��������������ʵ�����ѡ� ���� ����')
insert into Article values('ͼ��',null,'������de����',50,1,50,1,1,'ʱ����һ�вƸ������ĲƸ��� ���� �°¸���˹��')
insert into Article values('ͼ��',null,'������de����',50,1,50,2,1,'������һ�ɲ���Ķ�����ֻ�С��κ����ﶼ���ڲ��ϱ仯�ġ��������� ���� ˹������')
insert into Article values('ͼ��',null,'������de����',50,1,50,2,1,'���ŵ����������׵���˳ˮ���ۣ�����Ҫ��ʶ�������ѣ�ȴ������졣 ���� �Ͷ�����')
insert into Article values('ͼ��',null,'������de����',50,1,50,2,1,'������Ҫ��û�а��飬�����������л�����ʲô���壡�����һյû�����������ơ� ���� ���')
insert into Article values('ͼ��',null,'������de����',50,1,50,2,1,'�����жȣ��������١� ���� ��ժ')
insert into Article values('ͼ��',null,'������de����',50,1,50,2,1,'�����жȣ��������١� ���� ��ժ')
go
select * from Article

create table Label_user
(
Label_userID int primary key identity(1,1),--��ϲ����ǩID��

UserID int foreign key references Users(Users_ID),--���û���ǩ��

user_interest nvarchar(80),
)

insert into Label_user values(1,'��ʳ')
insert into Label_user values(1,'��Ӱ')
insert into Label_user values(1,'����')


insert into Label_user values(2,'Ӱ��')
insert into Label_user values(2,'��Ӱ')
insert into Label_user values(2,'����')
insert into Label_user values(2,'ʱ��')
insert into Label_user values(2,'����')
insert into Label_user values(2,'��ʳ')
insert into Label_user values(2,'����Ԫ')
insert into Label_user values(2,'���')
insert into Label_user values(2,'��Ϸ')
insert into Label_user values(2,'�滭')

insert into Label_user values(3,'Ӱ��')
insert into Label_user values(3,'��Ӱ')
insert into Label_user values(3,'����')

create table Collections
(
Collections_ID int primary key identity(1,1),

Collections_Img text,--���ϼ����棩

Collections_Name varchar(20),--���ϼ����ƣ�

Collections_Introduce varchar(100) not null,--���ϼ���飩

Users_ID int foreign key references Users(Users_ID),--���ϼ��û���

Collections_Label nvarchar(100)--(�ϼ���ر�ǩ) 
)
go


select * from Collections where Users_ID=1

insert into Collections values(null,'�ҵĵ�һ���ϼ�','�����Ҵ����ĵ�һƪ�ϼ�',1)
insert into Collections values(null,'�ҵĵ�һ���ϼ�','�����Ҵ����ĵ�һƪ�ϼ�',2)
insert into Collections values(null,'�ҵĵڶ����ϼ�','�����Ҵ����ĵڶ�ƪ�ϼ�',1)
insert into Collections values(null,'�ҵĵڶ����ϼ�','�����Ҵ����ĵڶ�ƪ�ϼ�',2)
--(�ϼ���ǩ��)




create table Collectionsabout(--�ϼ��ղر�

Collectionsabout_ID int primary key identity(1,1),--�ϼ��ղ�ID

Collections_ID  int foreign key references Collections(Collections_ID),--(�ϼ�ID)

Article_ID int,--(����ID)
)
insert into Collectionsabout values(1,1)
insert into Collectionsabout values(1,1)
insert into Collectionsabout values(1,2)
insert into Collectionsabout values(2,4)
insert into Collectionsabout values(2,6)
go






--�����۱�

create table Comment
(

Comment_ID int primary key identity(1,1),--(����ID)

Article_ID int,--������ID��

Users_ID int foreign key references Users(Users_ID) ,--�����������û���

Comment_Content varchar(200) not null,--���������ݣ�

)
go
insert into Comment values(22,2,'��ƪ���·ǳ���1')
insert into Comment values(22,3,'��ƪ���·ǳ���2')
insert into Comment values(22,1,'��ƪ���·ǳ���3')
insert into Comment values(22,2,'��ƪ���·ǳ���1')
insert into Comment values(22,3,'��ƪ���·ǳ���2')
insert into Comment values(22,1,'��ƪ���·ǳ���3')

insert into Comment values(21,2,'��ƪ���·ǳ���1')
insert into Comment values(21,3,'��ƪ���·ǳ���2')
insert into Comment values(21,1,'��ƪ���·ǳ���3')

insert into Comment values(20,2,'��ƪ���·ǳ���1')
insert into Comment values(20,3,'��ƪ���·ǳ���2')
insert into Comment values(20,1,'��ƪ���·ǳ���3')



--�����¹�ע��
create table FollowArticle
(

FollowArticleID int primary key identity(1,1),--�����¹�עID��

Users_LikeID int ,--����ע�û�ID��

Users_LikeArticleID int foreign key references Article(Article_ID),--����ע�����û�ID��
)
go




create table PrivateLetter
(

PrivateLetter_ID int primary key identity(1,1),--��˽��ID��

PrivateLetter_ReceiveID int ,--�������û�ID��

PrivateLetter_content varchar(800) not null,--��˽�����ݣ�
)
go


--�������
create table Administration
(
--������ID��
Administration_ID int primary key identity(1,1),
--�������˺ţ�
Administration_AccountNumber varchar(20) not null,
--���������룩
Administration_Pwd varchar(20) not null,
)
select * from Users inner join Label_user on Users.Users_ID=Label_user.UserID where Users.Users_ID=1