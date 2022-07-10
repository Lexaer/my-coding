#include <iostream>
#include<string>
#define max 1000
using namespace std;

struct person {
	string name;
	int sex;
	int age;
	string phone;
	string addr;





};

struct addrbooks {
	struct person peronarr[max];
	int size;

};

void addperson(addrbooks*abs)
{
	if (abs->size>= max)
	{
		cout << "通讯录已满 无法添加" << endl;
		return;
	}
	else {
		string name;
		cout << "请输入姓名" << endl;
		cin >> name;
		abs->peronarr[abs->size].name = name;
		cout << "请输入性别" << endl;
		cout << "1--男" << endl;
		cout << "2--女" << endl;
		int sex = 0;
		while (true) {
			cin >> sex;
			if (sex == 1 || sex == 2)
			{
				abs->peronarr[abs->size].sex = sex; break;
			}
			cout << "输入有误，请重新输入" << endl;
		}
		cout << "请输入年龄" << endl;
		int age = 0;
		while (true) {
			cin >> age;
			if (age < 0 || age>100) {
				cout<< "输入有误，请重新输入" << endl;
			}
			abs->peronarr[abs->size].age = age; break;
		}
		cout << "请输入联系电话" << endl;
		string phone; 
		cin >> phone;
		abs->peronarr[abs->size].phone = phone;
		cout << "请输入家庭住址" << endl;
		string addr;
		cin >> addr;
		abs->peronarr[abs->size].addr = addr;
		abs->size++;
		cout << "添加成功" << endl;
		system("pause");
		system("cls");
	}


}



void showmenu()
{   
	cout<<"**************************" << endl;
	cout<< "*****  1、添加联系人 ***** " << endl;
	cout<< "*****  2、显示联系人 ***** " << endl;
	cout<< "*****  3、删除联系人 ***** " << endl;
	cout<< "*****  4、查找联系人 ***** " << endl;
	cout<< "*****  5、修改联系人 ***** " << endl;
	cout<< "*****  6、清空联系人 ***** " << endl;
	cout<< "*****  0、退出通讯录 ***** " << endl;
	cout<<"**************************" << endl;
}

int main()
{
	addrbooks abs1;
	abs1.size = 0; 
	int select = 0;
	while (true) {
		showmenu();
		cin >> select;
		switch (select)
		{
		case 1: addperson(&abs1); break;

		case 2: break;
		case 3: break;
		case 4: break;
		case 5: break;
		case 6: break;
		case 0:  cout << "欢迎下次使用" << endl;
			system("pause");
			return 0;
		default: break;

		}
	}
	system("pause");
		return 0;


}