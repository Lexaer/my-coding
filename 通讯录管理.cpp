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
		cout << "ͨѶ¼���� �޷����" << endl;
		return;
	}
	else {
		string name;
		cout << "����������" << endl;
		cin >> name;
		abs->peronarr[abs->size].name = name;
		cout << "�������Ա�" << endl;
		cout << "1--��" << endl;
		cout << "2--Ů" << endl;
		int sex = 0;
		while (true) {
			cin >> sex;
			if (sex == 1 || sex == 2)
			{
				abs->peronarr[abs->size].sex = sex; break;
			}
			cout << "������������������" << endl;
		}
		cout << "����������" << endl;
		int age = 0;
		while (true) {
			cin >> age;
			if (age < 0 || age>100) {
				cout<< "������������������" << endl;
			}
			abs->peronarr[abs->size].age = age; break;
		}
		cout << "��������ϵ�绰" << endl;
		string phone; 
		cin >> phone;
		abs->peronarr[abs->size].phone = phone;
		cout << "�������ͥסַ" << endl;
		string addr;
		cin >> addr;
		abs->peronarr[abs->size].addr = addr;
		abs->size++;
		cout << "��ӳɹ�" << endl;
		system("pause");
		system("cls");
	}


}



void showmenu()
{   
	cout<<"**************************" << endl;
	cout<< "*****  1�������ϵ�� ***** " << endl;
	cout<< "*****  2����ʾ��ϵ�� ***** " << endl;
	cout<< "*****  3��ɾ����ϵ�� ***** " << endl;
	cout<< "*****  4��������ϵ�� ***** " << endl;
	cout<< "*****  5���޸���ϵ�� ***** " << endl;
	cout<< "*****  6�������ϵ�� ***** " << endl;
	cout<< "*****  0���˳�ͨѶ¼ ***** " << endl;
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
		case 0:  cout << "��ӭ�´�ʹ��" << endl;
			system("pause");
			return 0;
		default: break;

		}
	}
	system("pause");
		return 0;


}