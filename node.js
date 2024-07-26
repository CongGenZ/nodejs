//bt1
class Person {
  // constructor
  constructor(name, age, address) {
    this.name = name;
    this.age = age;
    this.address = address;
  }
  //introduce()
  introduce() {
    console.log(`Tên:${this.name}, Age:${this.age}, Address: ${this.address}`);
  }
}

const info = new Person("Công", 21, "Nam Định");
info.introduce();

//bt2
class Students extends Person {
  constructor(name, age, address, grade) {
    //super goi laij contructor
    super(name, age, address);
    this.grade = grade;
  }
  introduce1() {
    return `Tên: ${this.name}, Tuổi: ${this.age}, Địa chỉ: ${this.address}, Lớp: ${this.grade}`;
  }
}

const student = new Students("Nguyen Van A", 20, "123 Main St", "10A");
console.log(student.introduce1());

//bt3;
class Student {
  #grade;

  constructor(name, grade) {
    this.name = name;
    this.#grade = grade;
  }

  // Getter để truy cập thuộc tính private grade
  get grade() {
    return this.#grade;
  }

   set grade(value) {
    if (value >= 0 && value <= 10) {
      this.#grade = value;
    } else {
      console.log("Invalid grade. Please enter a value between 0 and 10.");
    }
  }

  introduce3() {
    console.log(
      `Hello, my name is ${this.name} and my grade is ${this.#grade}.`
    );
  }
}

// Tạo đối tượng Student
const student1 = new Student("Cong", 8);

// Sử dụng getter để lấy giá trị grade
// console.log(student1.grade); // 8

// Sử dụng setter để thay đổi giá trị grade
student1.grade = 9;
student1.introduce3();
