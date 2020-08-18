# ArrayList源码总结

## 1、底层**基于数组**实现

## 2、创建ArrayList如果不指定大小，会先创建一个大小为0的Object[ ]数组 ，
第一次添加数据时，会扩容成ArrayList的 默认大小**default_capacity：10**；

## 3、创建时如果指定大小，直接创建指定大小的Object[ ]数组

## 4、add（）
* 对 **size+1**，去判断数组是否满了，如果满了就**调用 grow（）方法扩容**，扩容大小为，

原数组大小 + 原数组大小**右移一位**。也就是扩容到原来的**1.5倍**

* 然后把老数组拷贝到新数组里
  
  elementData = Arrays.copyOf(elementData, newCapacity);

* 最后 **elementData[ size++ ] = e**，对数组赋值，（并且size+1）

## 5、add（index，e）

* 首先**对index做数组越界检查rangeCheck(index);** 如果越界了，抛数组越界异常

* 如果没越界，还是对 **size + 1，判断是否需要扩容**，如果需要扩容，调用**grow**方法

* 如果需要扩容，调用 **System.arraycopy（1,2,3,4,5）**方法。参数解释1：原来的数组，2：从哪里开始复制。3：复制的目标数组。4：目标数组的第几位开始复制。5：一共复制几个数。

* **System.arraycopy(elementData, index, elementData, index + 1, size - index);**

* 假设把数字6插入到第3位，复制过后的数组是，1 2 3 4 5 -> 1 2 3 3 4 5

* 然后再把目标的位置的值修改，变为 **1 2 6 3 4 5**

* 最后size++；

## 6、set（index，e）

* 首先解释，set这个方法是替换该位置原来的元素，所以不会使数组变大，不会做扩容判断
* 然后对index做数组越界检查，如果越界了，抛数组越界异常
* 把e替换到数组的index位置
* 返回数组index位置的原始值

## 7、remove（index）
* 首先**对index做数组越界检查rangeCheck(index);**，如果越界了，抛数组越界异常
* 然后进行数组拷贝 System.arraycopy(elementData, index+1, elementData, index,size - index - 1);
* 假设把第三位数字删除，**1 2 3 4 5 6 - > 1 2 4 5 6 6**
* **然后 element[size--] = null**;
* 最后返回被删除的值

## 8、get（index）
* 首先对index做数组越界检查rangeCheck(index);，如果越界了，抛数组越界异常
* **return elementData(index);**

## 9、**总结来说，ArrayList的get方法效率非常高，直接返回对应下标值，add方法和remove方法，效率就有点低了，需要考虑数组扩容和数组拷贝的问题。**

## 10、**所以ArrayList比较适用于插入操作较少，不是很频繁插入的场景。**