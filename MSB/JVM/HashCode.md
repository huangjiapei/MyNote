# HashCode

### 1、含义

```
对象的hashCode，一般是通过将该对象的内部地址转换成一个整数来实现的
```



### 2、产生HashCode

```
调用object.hashCode() 或者 调用System.identityHashCode(object)
```



### 3、hashCode()与identityHashCode()产生的hashCode区别？

```
1：当一个类没有重写Object类的hashCode()方法时，它的hashCode和identityHashCode是一致的
2：当一个类重写了Object类的hashCode()方法时，它的hashCode则有重写的实现逻辑决定，此时的hashCode值一般就不再和对象本身的内部地址有相应的哈希关系了
```



### 4、存储位置

```
调用hashCode的时候，才会把HashCode存储到MarkWord中
```



# equal()与==

```
==：基本数据类型比较的是数值是否相等；引用数据类型比较的是地址是否相等。
equals：是一个方法，如果对应的类没有重写Object类的equals()方法，则和==是一样的作用
```



# hashCode与==关系

```
1、hashCode相等时使用==比较，不一定是true
2、identityHashCode相等时使用==比较，一定是true
3、hashCode相等时使用equals比较，也不一定是true（通常可认为是true，我们自己可以随便定义的）
```

