/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.51 : Database - blogsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blogsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blogsystem`;

/*Table structure for table `collect_tab` */

DROP TABLE IF EXISTS `collect_tab`;

CREATE TABLE `collect_tab` (
  `collectId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `essayId` int(11) DEFAULT NULL COMMENT 'essay表id',
  `collectorId` int(11) DEFAULT NULL COMMENT '收藏者id',
  `collectTime` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`collectId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `collect_tab` */

insert  into `collect_tab`(`collectId`,`essayId`,`collectorId`,`collectTime`) values (3,1,2,'2017-07-05 20:56:14'),(4,2,2,'2017-07-05 20:56:28'),(5,5,2,'2017-07-05 21:56:12'),(6,6,3,'2017-07-06 00:08:13'),(8,6,1,'2017-07-06 00:55:13'),(9,5,5,'2017-07-06 00:58:26');

/*Table structure for table `discuss_tab` */

DROP TABLE IF EXISTS `discuss_tab`;

CREATE TABLE `discuss_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长',
  `essayId` int(11) DEFAULT NULL COMMENT '被评论的文章ID',
  `discusserId` int(11) DEFAULT NULL COMMENT '评论者ID',
  `discussContent` text COMMENT '评论内容',
  `discussTime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `discuss_tab` */

insert  into `discuss_tab`(`id`,`essayId`,`discusserId`,`discussContent`,`discussTime`) values (1,2,2,'写得很好','2017-07-03 14:00:05'),(2,6,2,'你好啊','2017-07-05 23:09:08'),(3,6,2,'我又来看你了','2017-07-05 23:15:03'),(5,6,3,'这篇内容很有用，谢谢楼主','2017-07-06 00:08:44'),(8,4,1,'可以','2017-07-06 00:56:29'),(9,6,5,'士大夫','2017-07-06 00:58:04'),(18,4,2,'很厉害额','2017-07-06 21:41:27');

/*Table structure for table `essay_tab` */

DROP TABLE IF EXISTS `essay_tab`;

CREATE TABLE `essay_tab` (
  `essayId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `userId` int(11) DEFAULT NULL COMMENT '发帖人ID',
  `essayTitle` varchar(60) DEFAULT NULL COMMENT '标题',
  `essayContent` text COMMENT '内容文字',
  `essayImage` varchar(225) DEFAULT NULL COMMENT '图片',
  `sendTime` datetime DEFAULT NULL COMMENT '时间',
  `likesAmount` int(11) DEFAULT '0' COMMENT '点赞数',
  `discussAmount` int(11) DEFAULT '0' COMMENT '评论数',
  `collectAmount` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`essayId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `essay_tab` */

insert  into `essay_tab`(`essayId`,`userId`,`essayTitle`,`essayContent`,`essayImage`,`sendTime`,`likesAmount`,`discussAmount`,`collectAmount`) values (1,2,'JSP 简介','什么是Java Server Pages?\r\nJSP全称Java Server Pages，是一种动态网页开发技术。它使用JSP标签在HTML网页中插入Java代码。标签通常以<%开头以%>结束。\r\nJSP是一种Java servlet，主要用于实现Java web应用程序的用户界面部分。网页开发者们通过结合HTML代码、XHTML代码、XML元素以及嵌入JSP操作和命令来编写JSP。\r\nJSP通过网页表单获取用户输入数据、访问数据库及其他数据源，然后动态地创建网页。\r\nJSP标签有多种功能，比如访问数据库、记录用户选择信息、访问JavaBeans组件等，还可以在不同的网页中传递控制信息和共享信息。\r\n为什么使用JSP？\r\nJSP程序与CGI程序有着相似的功能，但和CGI程序相比，JSP程序有如下优势：\r\n性能更加优越，因为JSP可以直接在HTML网页中动态嵌入元素而不需要单独引用CGI文件。\r\n服务器调用的是已经编译好的JSP文件，而不像CGI/Perl那样必须先载入解释器和目标脚本。\r\nJSP 基于Java Servlet API，因此，JSP拥有各种强大的企业级Java API，包括JDBC，JNDI，EJB，JAXP等等。\r\nJSP页面可以与处理业务逻辑的 Servlet 一起使用，这种模式被Java servlet 模板引擎所支持。\r\n最后，JSP是Java EE不可或缺的一部分，是一个完整的企业级应用平台。这意味着JSP可以用最简单的方式来实现最复杂的应用。\r\nJSP的优势\r\n以下列出了使用JSP带来的其他好处：\r\n与ASP相比：JSP有两大优势。首先，动态部分用Java编写，而不是VB或其他MS专用语言，所以更加强大与易用。第二点就是JSP易于移植到非MS平台上。\r\n与纯 Servlet 相比：JSP可以很方便的编写或者修改HTML网页而不用去面对大量的println语句。\r\n与SSI相比：SSI无法使用表单数据、无法进行数据库链接。\r\n与JavaScript相比：虽然JavaScript可以在客户端动态生成HTML，但是很难与服务器交互，因此不能提供复杂的服务，比如访问数据库和图像处理等等。\r\n与静态HTML相比：静态HTML不包含动态信息。','','2017-05-26 17:59:27',0,0,0),(2,2,' 10.1-全栈Java笔记:最全面的IO技术（一）','IO技术\r\n对于任何程序设计语言而言，输入输出(Input/Output)系统都是非常核心的功能。程序运行需要数据，数据的获取往往需要跟外部系统进行通信，外部系统可能是文件、数据库、其他程序、网络、IO设备等等。\r\n外部系统比较复杂多变，那么我们有必要通过某种手段进行抽象、屏蔽外部的差异，从而实现更加便捷的编程。\r\n输入(Input)指的是：可以让程序从外部系统获得数据（核心含义是“读”，读取外部数据）。常见的应用：\r\n1) 读取硬盘上的文件内容到程序。例如：播放器打开一个视频文件、word打开一个doc文件。\r\n2) 读取网络上某个位置内容到程序。例如：浏览器中输入网址后，打开该网址对应的网页内容；下载网络上某个网址的文件。\r\n3) 读取数据库系统的数据到程序。\r\n4) 读取某些硬件系统数据到程序。例如：车载电脑读取雷达扫描信息到程序；温控系统\r\n输出(Output)指的是：程序输出数据给外部系统从而可以操作外部系统（核心含义是“写”，将数据写出到外部系统）。常见的应用有：\r\n5) 将数据写到硬盘中。 例如：我们编辑完一个word文档后，将内容写到硬盘上进行保存。\r\n6) 将数据写到数据库系统中。例如：我们注册一个网站会员，实际就是后台程序向数据库中写入一条记录。\r\n7)将数据写到某些硬件系统中。例如：导弹系统导航程序将新的路径输出到飞控子系统，飞控子系统根据数据修正飞行路径。\r\n \r\nJava.io包为我们提供了相关的API，实现了对所有外部系统的输入输出操作，这就是我们这章所要学习的技术。\r\n基本概念和IO入门\r\n数据源\r\n数据源data source，提供数据的原始媒介。\r\n常见的：数据库、文件、其他程序、内存、网络连接、IO设备。\r\n数据源分为：源设备、目标设备。\r\n源设备：为程序提供数据，一般对应输入流。\r\n目标设备：程序数据的目的地，一般对应输出流。','','2017-06-29 18:00:00',0,0,0),(3,3,'解决jsp页面乱码问题','页面也需要设置转码的：页面：(.jsp)\r\n\r\n<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%>response.setContentType(\"text/html;charset=UTF-8\");\r\n处理文件：（.java）转码的三种方法：\r\n\r\nA 接受参数时进行编码转换String str = new String(request.getParameter(\"something\").getBytes(\"ISO-8859-1\"),\"utf-8\")； 这样的话，每一个参数都必须这样进行转码。很麻烦。但确实可以拿到汉字。\r\n\r\n\r\nB 在请求页面上开始处，执行请求的编码代码， request.setCharacterEncoding(\"UTF-8\")，把提交内容的字符集设为UTF－8。这样的话，接受此参数的页面就不必在转码了。直接使用String str = request.getParameter(\"something\")；即可得到汉字参数。但每页都需要执行这句话。这个方法也就对post提交的有效果，对于get提交和上传文件时的enctype=\"multipart/form-data\"是无效的。稍后下面单独对这个两个的乱码情况再进行说明。\r\n\r\n\r\nC 为了避免每页都要写request.setCharacterEncoding(\"UTF-8\")，建议使用过滤器对所有jsp进行编码处理。 新手可以暂时不考虑过滤器的方法，过滤器一般都会涉及到配置开发，要修改web.xml，还算是比较麻烦的，建议接触java一段时间后再考虑使用过滤器的方法。或者如果应用了struts框架，可以查看struts的转码过滤器配置。',NULL,'2017-07-01 21:48:24',0,0,0),(4,4,'多线程有什么用？','作者：pansz\r\n链接：https://www.zhihu.com/question/19901763/answer/13299543\r\n来源：知乎\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n\r\n这么解释问题吧：1。单进程单线程：一个人在一个桌子上吃菜。2。单进程多线程：多个人在同一个桌子上一起吃菜。3。多进程单线程：多个人每个人在自己的桌子上吃菜。多线程的问题是多个人同时吃一道菜的时候容易发生争抢，例如两个人同时夹一个菜，一个人刚伸出筷子，结果伸到的时候已经被夹走菜了。。。此时就必须等一个人夹一口之后，在还给另外一个人夹菜，也就是说资源共享就会发生冲突争抢。1。对于 Windows 系统来说，【开桌子】的开销很大，因此 Windows 鼓励大家在一个桌子上吃菜。因此 Windows 多线程学习重点是要大量面对资源争抢与同步方面的问题。2。对于 Linux 系统来说，【开桌子】的开销很小，因此 Linux 鼓励大家尽量每个人都开自己的桌子吃菜。这带来新的问题是：坐在两张不同的桌子上，说话不方便。因此，Linux 下的学习重点大家要学习进程间通讯的方法。--补充：有人对这个开桌子的开销很有兴趣。我把这个问题推广说开一下。开桌子的意思是指创建进程。开销这里主要指的是时间开销。可以做个实验：创建一个进程，在进程中往内存写若干数据，然后读出该数据，然后退出。此过程重复 1000 次，相当于创建/销毁进程 1000 次。在我机器上的测试结果是：       UbuntuLinux：耗时 0.8 秒       Windows7：耗时 79.8 秒        两者开销大约相差一百倍。这意味着，在 Windows 中，进程创建的开销不容忽视。换句话说就是，Windows 编程中不建议你创建进程，如果你的程序架构需要大量创建进程，那么最好是切换到 Linux 系统。大量创建进程的典型例子有两个，一个是 gnu autotools 工具链，用于编译很多开源代码的，他们在 Windows 下编译速度会很慢，因此软件开发人员最好是避免使用 Windows。另一个是服务器，某些服务器框架依靠大量创建进程来干活，甚至是对每个用户请求就创建一个进程，这些服务器在 Windows 下运行的效率就会很差。这\"可能\"也是放眼全世界范围，Linux  服务器远远多于 Windows 服务器的原因。--再次补充：如果你是写服务器端应用的，其实在现在的网络服务模型下，开桌子的开销是可以忽略不计的，因为现在一般流行的是按照 CPU 核心数量开进程或者线程，开完之后在数量上一直保持，进程与线程内部使用协程或者异步通信来处理多个并发连接，因而开进程与开线程的开销可以忽略了。另外一种新的开销被提上日程：核心切换开销。现代的体系，一般 CPU 会有多个核心，而多个核心可以同时运行多个不同的线程或者进程。当每个 CPU 核心运行一个进程的时候，由于每个进程的资源都独立，所以 CPU 核心之间切换的时候无需考虑上下文。当每个 CPU 核心运行一个线程的时候，由于每个线程需要共享资源，所以这些资源必须从 CPU 的一个核心被复制到另外一个核心，才能继续运算，这占用了额外的开销。换句话说，在 CPU 为多核的情况下，多线程在性能上不如多进程。因而，当前面向多核的服务器端编程中，需要习惯多进程而非多线程。',NULL,'2017-07-02 21:48:53',0,0,0),(5,5,'我是一个线程','我是一个线程，我一出生就被编了个号： 0x3704，然后被领到一个昏暗的屋子里， 这里我发现了很多和我一模一样的同伴。\r\n　　我身边的同伴0x6900待的时间比较长， 他带着沧桑的口气对我说：\r\n　　“我们线程的宿命就是处理包裹。把包裹处理完以后还得马上回到这里，否则可能永远回不来了。”\r\n　　我一脸懵懂，包裹，什么包裹？\r\n　　“不要着急，马上你就会明白了， 我们这里是不养闲人的。”\r\n　　果然，没多久，屋子的门开了， 一个面貌凶恶的家伙吼道：\r\n　　“0x3704 ,出来！”\r\n　　我一出来就被塞了一个沉甸甸的包裹，上面还有附带着一个写满了操作步骤的纸。\r\n　　“快去，把这个包裹处理了。”\r\n　　“去哪儿处理？”\r\n　　“跟着指示走， 先到就绪车间”\r\n　　果然，地上有指示箭头，跟着它来到了一间明亮的大屋子，这里已经有不少线程了， 大家都很紧张，好像时刻准备着往前冲。\r\n　　我刚一进来，就听见广播说：“0x3704，进入车间”\r\n　　我赶紧往前走， 身后很多人议论说：\r\n　　”他太幸运了， 刚进入就绪状态就能运行”\r\n　　“是不是有关系？”\r\n　　“不是，你看人家的优先级多高啊， 唉~”\r\n　　前边就是车间， 这里简直是太美了， 怪不得老线程总是唠叨着说：要是能一直待在这里就好了。\r\n　　这里空间大，视野好，空气清新，鸟语花香，还有很多从来没见过的人，像服务员一样等着为我服务。\r\n　　他们也都有编号， 更重要的是每个人还有个标签，上面写着：硬盘，数据库，内存，网卡．．．\r\n　　我现在理解不了，看看操作步骤吧：\r\n　　第一步：从包裹中取出参数\r\n　　打开包裹， 里边有个HttpRequest对象，可以取到userName, password两个参数。\r\n　　第二步：执行登录操作\r\n　　奥，原来是有人要登录啊，我把userName/password 交给数据库服务员，他拿着数据， 慢腾腾的走了。\r\n　　他怎么这么慢？不过我是不是正好可以在车间里多待一会儿?　反正也没法执行第三步。\r\n　　就在这时，车间里的广播响了：　\r\n　　“0x3704，我是CPU，记住你正在执行的步骤，马上带包裹离开”\r\n　　我慢腾腾的开始收拾。。。\r\n　　“快点， 别的线程马上就要进来了”\r\n　　离开这个车间， 又来到一个大屋子，这里很多线程慢腾腾的在喝茶，打牌。\r\n　　“哥们，你们没事干了？”\r\n　　“你新来的吧，你不知道我在等数据库服务员给我数据啊，据说他们比我们慢好几十万倍， 在这里好好歇吧”\r\n　　“啊？ 这么慢？ 我这里有人在登录系统， 能等这么长时间吗”\r\n　　“放心，你没听说过人间一天，CPU一年吗， 我们这里是用纳秒，毫秒计时的，人间等待一秒，相当于我们好几天呢，来的及”\r\n　　干脆睡一会吧 ， 不知道过了多久 ，大喇叭又开始广播了：\r\n　　“0x3704， 你的数据来了，快去执行”\r\n　　我转身就往CPU车间跑，发现这里的们只出不进！\r\n　　后面传来阵阵哄笑声：\r\n　　“果然是新人，不知道还得去就绪车间等”\r\n　　于是赶紧到就绪车间，这次没有那么好运了，等了好久才被再次叫进CPU车间。\r\n　　在等待的时候， 我听见有人小声议论：\r\n　　“听说了吗，最近有个线程被kill掉了”\r\n　　“为啥啊？”\r\n　　“这家伙赖在CPU车间不走，把CPU利用率一直搞成100%，后来就被kill掉了”\r\n　　“Kill掉以后弄哪儿去了”\r\n　　“可能被垃圾回收了吧”\r\n　　我心里打了个寒噤 ， 赶紧接着处理，收下的动作块多了，第二步登录成功了。\r\n　　第三步：构建登录成功后的主页\r\n　　这一步有点费时间， 因为有很多HTML需要处理， 不知道代码谁写的，处理起来很烦人。\r\n　　我正在紧张的制作HTM呢， CPU有开始叫了：\r\n　　“0x3704，我是CPU，记住你正在执行的步骤，马上带包裹离开”\r\n　　“为啥啊”\r\n　　“每个线程只能在CPU上运行一段时间，到了时间就得让别人用了，你去就绪车间待着， 等着叫你吧”\r\n　　就这样， 我一直在“就绪-运行”这两个状态，不知道轮转了多少次，终于安装步骤清单把工作做完了。\r\n　　最后顺利的把包含HTML的包裹发了回去。\r\n　　至于登录以后干什么事儿 ，我就不管了。\r\n　　马上就要回到我那昏暗的房间了，真有点舍不得这里。\r\n　　不过相对于有些线程， 我还是幸运的， 他们运行完以后就彻底的销毁了，而我还活着！\r\n　　回到了小黑屋， 老线程0x6900问：\r\n　　“怎么样？第一天有什么感觉？”\r\n　　“我们的世界规则很复杂，首先你不知道什么时候会被挑中执行；第二，在执行的过程中随时可能被打断，让出CPU车间；第三，一旦出现硬盘，数据库这样耗时的操作也得让出CPU，去等待；第四，就是数据来了，你也不一定马上执行，还得等着CPU挑选”\r\n　　“小伙子理解的不错啊”\r\n　　“我不明白为什么很多线程都执行完就死了， 为什么咱们还活着？”\r\n　　“你还不知道，长生不老是我们的特权，我们这里有个正式的名称，叫做线程池！”\r\n　　平淡的日子就这么一天天过去，作为一个线程，我每天的生活都是取包裹，处理包裹，然后回到我们昏暗的家：线程池。\r\n　　有一天我回来的时候，听到有个兄弟说，今天要好好休息下，明天就是最疯狂的一天。\r\n　　我看了一眼日历，明天是 11月11号。\r\n　　果然，零点刚过，不知道那些人类怎么了，疯狂的投递包裹，为了应付蜂拥而至的海量包裹，线程池里没有一个人能闲下来，全部出去处理包裹，CPU车间利用率超高，硬盘在嗡嗡转，网卡疯狂的闪，即便如此，还是处理不完，堆积如山。\r\n　　我们也没有办法，实在是太多太多了，这些包裹中大部分都是浏览页面，下订单，买，买，买。\r\n　　不知道过了多久，包裹山终于慢慢的消失了。\r\n　　终于能够喘口气， 我想我永远都不会忘记这一天。\r\n　　通过这个事件，我明白了我所处的世界：这是一个电子商务的网站！\r\n　　我每天的工作就是处理用户的登录，浏览， 购物车，下单，付款。\r\n　　我问线程池的元老0x6900：“我们要工作到什么时候？”\r\n　　“要一直等到系统重启的那一刻”，0x6900说。\r\n　　“那你经历过系统重启吗？”\r\n　　“怎么可能？系统重启就是我们的死亡时刻， 也就是世界末日，一旦重启，整个线程池全部销毁，时间和空间全部消失，一切从头再来”\r\n　　“那什么时候会重启？”\r\n　　“这就不好说了，好好享受眼前的生活吧.....”\r\n　　其实生活丰富多彩，我最喜欢的包裹是上传图片，由于网络慢，所以能在就绪车间，CPU车间待很长很长时间，可以认识很多好玩的线程。\r\n　　比如说上次认识了memecached线程，他给我说通过他缓存了很多的用户数据， 还是分布式的！ 很多机器上都有！\r\n　　我说怪不得后来的登录操作快了那么多， 原来是不再从数据库取数据了你那里就有啊，哎，对了，你是分布式的，你去过别的机器没有？\r\n　　他说怎么可能，我每次也只能通过网络往那个机器发送一个GET, PUT命令才存取数据而已，别的一概不知。\r\n　　再比如说上次在等待的时候遇到了数据库连接的线程，我才知道它他那里也是一个连接池，和我们线程池几乎一模一样。\r\n　　他说有些包裹太变态了，竟然查看一年的订单数据，简直把我累死了。\r\n　　我说拉倒吧你，你那是纯数据，你把数据传给我以后，我还得组装成HTML，工作量不知道比你大多少倍。\r\n　　他说一定你要和memecached搞好关系，直接从他那儿拿数据，尽量少直接调用数据库，我们JDBC connection也能活的轻松点。\r\n　　我说好啊好啊，关键是你得提前把数据搞到缓存啊，要不然我先问一遍缓存，没有数据，我这不还得找你吗？\r\n　　生活就是这样，如果你自己不找点乐子，还有什么意思？\r\n　　有一天我遇到一个可怕的事情， 差一点死在外边，回不了线程池了......\r\n　　其实这次遇险我应该能够预想到才对， 太大意了。\r\n　　前几天我处理过一些从http发来的存款和取款的包裹，老线程0x6900特意嘱咐我：\r\n　　“处理这些包裹的时候要特别小心，你得一定要先获得一把锁，在对账户存款或者取款的时候一定要把账户给锁住，要不然别的线程就会在你等待的时候趁虚而入，搞破坏，我年轻那会儿很毛糙，就捅了篓子”',NULL,'2017-07-03 21:48:59',0,0,0),(6,3,'在JAVA中线程到底起到什么作用!','这是javaeye上非常经典的关于线程的帖子，写的非常通俗易懂的，适合任何读计算机的同学. 线程同步\r\n我们可以在计算机上运行各种计算机软件程序。每一个运行的程序可能包括多个独立运行的线程（Thread）。 线程（Thread）是一份独立运行的程序，有自己专用的运行栈。线程有可能和其他线程共享一些资源，比如，内存，文件，数据库等。\r\n当多个线程同时读写同一份共享资源的时候，可能会引起冲突。这时候，我们需要引入线程“同步”机制，即各位线程之间要有个先来后到，不能一窝蜂挤上去抢作一团。\r\n同步这个词是从英文synchronize（使同时发生）翻译过来的。我也不明白为什么要用这个很容易引起误解的词。既然大家都这么用，咱们也就只好这么将就。\r\n线程同步的真实意思和字面意思恰好相反。线程同步的真实意思，其实是“排队”：几个线程之间要排队，一个一个对共享资源进行操作，而不是同时进行操作。\r\n因此，关于线程同步，需要牢牢记住的第一点是：线程同步就是线程排队。同步就是排队。线程同步的目的就是避免线程“同步”执行。这可真是个无聊的绕口令。\r\n关于线程同步，需要牢牢记住的第二点是 “共享”这两个字。只有共享资源的读写访问才需要同步。如果不是共享资源，那么就根本没有同步的必要。\r\n关于线程同步，需要牢牢记住的第三点是，只有“变量”才需要同步访问。如果共享的资源是固定不变的，那么就相当于“常量”，线程同时读取常量也不需要同步。至少一个线程修改共享资源，这样的情况下，线程之间就需要同步。\r\n关于线程同步，需要牢牢记住的第四点是：多个线程访问共享资源的代码有可能是同一份代码，也有可能是不同的代码；无论是否执行同一份代码，只要这些线程的代码访问同一份可变的共享资源，这些线程之间就需要同步。\r\n为了加深理解，下面举几个例子\r\n有两个采购员，他们的工作内容是相同的，都是遵循如下的步骤：\r\n（1）到市场上去，寻找并购买有潜力的样品。\r\n（2）回到公司，写报告。\r\n这两个人的工作内容虽然一样，他们都需要购买样品，他们可能买到同样种类的样品，但是他们绝对不会购买到\r\n同一件样品，他们之间没有任何共享资源。所以，他们可以各自进行自己的工作，互不干扰。这两个采购员就相当于两个线程；两个采购员遵循相同的工作步骤，相当于这两个线程执行同一段代码。\r\n下面给这两个采购员增加一个工作步骤。采购员需要根据公司的“布告栏”上面公布的信息，安排自己的工作计划。 这两个采购员有可能同时走到布告栏的前面，同时观看布告栏上的信息。这一点问题都没有。因为布告栏是只读的，这两个采购员谁都不会去修改布告栏上写的信息 下面增加一个角色。一个办公室行政人员这个时候，也走到了布告栏前面，准备修改布告栏上的信息。\r\n如果行政人员先到达布告栏，并且正在修改布告栏的内容。两个采购员这个时候，恰好也到了。这两个采购员就必须等待行政人员完成修改之后，才能观看修改后的信息。\r\n如果行政人员到达的时候，两个采购员已经在观看布告栏了。那么行政人员需要等待两个采购员把当前信息记录下来之后，才能够写上新的信息。\r\n上述这两种情况，行政人员和采购员对布告栏的访问就需要进行同步。因为其中一个线程（行政人员）修改了共享资源（布告栏）。而且我们可以看到，行政人员的工作流程和采购员的工作流程（执行代码）完全不同，但是由于他们访问了同一份可变共享资源（布告栏），所以他们之间需要同步。\r\n同步锁\r\n前面讲了为什么要线程同步，下面我们就来看如何才能线程同步。\r\n线程同步的基本实现思路还是比较容易理解的。我们可以给共享资源加一把锁，这把锁只有一把钥匙。哪个线程获取了这把钥匙，才有权利访问该共享资源。\r\n生活中，我们也可能会遇到这样的例子。一些超市的外面提供了一些自动储物箱。每个储物箱都有一把锁，一把钥匙。人们可以使用那些带有钥匙的储物箱，把东西放到储物箱里面，把储物箱锁上，然后把钥匙拿走。这样，该储物箱就被锁住了，其他人不能再访问这个储物箱。（当然，真实的储物箱钥匙是可以被人拿走复制的，所以不要把贵重物品放在超市的储物箱里面。于是很多超市都采用了电子密码锁。）\r\n线程同步锁这个模型看起来很直观。但是，还有一个严峻的问题没有解决，这个同步锁应该加在哪里？ 当然是加在共享资源上了。反应快的读者一定会抢先回答。\r\n没错，如果可能，我们当然尽量把同步锁加在共享资源上。一些比较完善的共享资源，比如，文件系统，数据库系统等，自身都提供了比较完善的同步锁机制。我们不用另外给这些资源加锁，这些资源自己就有锁。\r\n但是，大部分情况下，我们在代码中访问的共享资源都是比较简单的共享对象。这些对象里面没有地方让我们加锁。\r\n读者可能会提出建议：为什么不在每一个对象内部都增加一个新的区域，专门用来加锁呢？这种设计理论上当然也是可行的。问题在于，线程同步的情况并不是很普遍。如果因为这小概率事件，在所有对象内部都开辟一块锁空间，将会带来极大的空间浪费。得不偿失。\r\n于是，现代的编程语言的设计思路都是把同步锁加在代码段上。确切的说，是把同步锁加在“访问共享资源的代码段”上。这一点一定要记住，同步锁是加在代码段上的。\r\n同步锁加在代码段上，就很好地解决了上述的空间浪费问题。但是却增加了模型的复杂度，也增加了我们的理解难度。\r\n现在我们就来仔细分析“同步锁加在代码段上”的线程同步模型。\r\n首先，我们已经解决了同步锁加在哪里的问题。我们已经确定，同步锁不是加在共享资源上，而是加在访问共享资源的代码段上。\r\n其次，我们要解决的问题是，我们应该在代码段上加什么样的锁。这个问题是重点中的重点。这是我们尤其要注意的问题：访问同一份共享资源的不同代码段，应该加上同一个同步锁；如果加的是不同的同步锁，那么根本就起不到同步的作用，没有任何意义。\r\n这就是说，同步锁本身也一定是多个线程之间的共享对象。\r\nJava语言的synchronized关键字\r\n为了加深理解，举几个代码段同步的例子。\r\n不同语言的同步锁模型都是一样的。只是表达方式有些不同。这里我们以当前最流行的Java语言为例。Java语言里面用synchronized关键字给代码段加锁。整个语法形式表现为\r\nsynchronized(同步锁) {\r\n// 访问共享资源，需要同步的代码段\r\n}\r\n这里尤其要注意的就是，同步锁本身一定要是共享的对象。\r\n… f1() {\r\nObject lock1 = new Object(); // 产生一个同步锁\r\nsynchronized(lock1){\r\n// 代码段 A\r\n// 访问共享资源 resource1\r\n// 需要同步\r\n}\r\n}\r\n上面这段代码没有任何意义。因为那个同步锁是在函数体内部产生的。每个线程调用这段代码的时候，都会产生一个新的同步锁。那么多个线程之间，使用的是不同的同步锁。根本达不到同步的目的。\r\n同步代码一定要写成如下的形式，才有意义。\r\npublic static final Object lock1 = new Object();\r\n… f1() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 A\r\n// 访问共享资源 resource1\r\n// 需要同步\r\n}\r\n你不一定要把同步锁声明为static或者public，但是你一定要保证相关的同步代码之间，一定要使用同一个同步锁。\r\n讲到这里，你一定会好奇，这个同步锁到底是个什么东西。为什么随便声明一个Object对象，就可以作为同步锁？\r\n在Java里面，同步锁的概念就是这样的。任何一个Object Reference都可以作为同步锁。我们可以把Object Reference理解为对象在内存分配系统中的内存地址。因此，要保证同步代码段之间使用的是同一个同步锁，我们就要保证这些同步代码段的synchronized关键字使用的是同一个Object Reference，同一个内存地址。这也是为什么我在前面的代码中声明lock1的时候，使用了final关键字，这就是为了保证lock1的Object Reference在整个系统运行过程中都保持不变。\r\n一些求知欲强的读者可能想要继续深入了解synchronzied(同步锁)的实际运行机制。Java虚拟机规范中（你可以在google用“JVM Spec”等关键字进行搜索），有对synchronized关键字的详细解释。synchronized会编译成 monitor enter, … monitor exit之类的指令对。Monitor就是实际上的同步锁。每一个Object Reference在概念上都对应一个monitor。\r\n这些实现细节问题，并不是理解同步锁模型的关键。我们继续看几个例子，加深对同步锁模型的理解。\r\npublic static final Object lock1 = new Object();\r\n… f1() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 A\r\n// 访问共享资源 resource1\r\n// 需要同步\r\n}\r\n}\r\n… f2() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 B\r\n// 访问共享资源 resource1\r\n// 需要同步\r\n}\r\n}\r\n上述的代码中，代码段A和代码段B就是同步的。因为它们使用的是同一个同步锁lock1。\r\n如果有10个线程同时执行代码段A，同时还有20个线程同时执行代码段B，那么这30个线程之间都是要进行同步的。\r\n这30个线程都要竞争一个同步锁lock1。同一时刻，只有一个线程能够获得lock1的所有权，只有一个线程可以执行代码段A或者代码段B。其他竞争失败的线程只能暂停运行，进入到该同步锁的就绪（Ready）队列。 每一个同步锁下面都挂了几个线程队列，包括就绪（Ready）队列，待召（Waiting）队列等。比如，lock1对应的就绪队列就可以叫做lock1 - ready queue。每个队列里面都可能有多个暂停运行的线程。 注意，竞争同步锁失败的线程进入的是该同步锁的就绪（Ready）队列，而不是后面要讲述的待召队列（Waiting Queue，也可以翻译为等待队列）。就绪队列里面的线程总是时刻准备着竞争同步锁，时刻准备着运行。而待召队列里面的线程则只能一直等待，直到等到某个信号的通知之后，才能够转移到就绪队列中，准备运行。\r\n成功获取同步锁的线程，执行完同步代码段之后，会释放同步锁。该同步锁的就绪队列中的其他线程就继续下一轮同步锁的竞争。成功者就可以继续运行，失败者还是要乖乖地待在就绪队列中。 因此，线程同步是非常耗费资源的一种操作。我们要尽量控制线程同步的代码段范围。同步的代码段范围越小越好。我们用一个名词“同步粒度”来表示同步代码段的范围。\r\n同步粒度\r\n在Java语言里面，我们可以直接把synchronized关键字直接加在函数的定义上。\r\n比如。\r\n… synchronized … f1() {\r\n// f1 代码段\r\n}\r\n这段代码就等价于\r\n… f1() {\r\nsynchronized(this){ // 同步锁就是对象本身\r\n// f1 代码段\r\n}\r\n}\r\n同样的原则适用于静态（static）函数\r\n比如。\r\n… static synchronized … f1() {\r\n// f1 代码段\r\n}\r\n这段代码就等价于\r\n…static … f1() {\r\nsynchronized(Class.forName(…)){ // 同步锁是类定义本\r\n// f1 代码段\r\n}\r\n} 但是，我们要尽量避免这种直接把synchronized加在函数定义上的偷懒做法。因为我们要控制同步粒度。同步的代码段越小越好。synchronized控制的范围越小越好。\r\n我们不仅要在缩小同步代码段的长度上下功夫，我们同时还要注意细分同步锁。\r\n比如，下面的代码\r\npublic static final Object lock1 = new Object();\r\n… f1() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 A\r\n// 访问共享资源 resource1\r\n// 需要同步\r\n}\r\n}\r\n… f2() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 B\r\n// 访问共享资源 resource1\r\n// 需要同步\r\n}\r\n}\r\n… f3() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 C\r\n// 访问共享资源 resource2\r\n// 需要同步\r\n}\r\n}\r\n… f4() {\r\nsynchronized(lock1){ // lock1 是公用同步锁\r\n// 代码段 D\r\n// 访问共享资源 resource2\r\n// 需要同步\r\n}\r\n}\r\n上述的4段同步代码，使用同一个同步锁lock1。所有调用4段代码中任何一段代码的线程，都需要竞争同一个同步锁lock1。\r\n我们仔细分析一下，发现这是没有必要的。\r\n因为f1()的代码段A和f2()的代码段B访问的共享资源是resource1，f3()的代码段C和f4()的代码段D访问的共享资源是resource2，它们没有必要都竞争同一个同步锁lock1。我们可以增加一个同步锁lock2。f3()和f4()的代码可以修改为：\r\npublic static final Object lock2 = new Object();\r\n… f3() {\r\nsynchronized(lock2){ // lock2 是公用同步锁\r\n// 代码段 C\r\n// 访问共享资源 resource2\r\n// 需要同步\r\n}\r\n}\r\n… f4() {\r\nsynchronized(lock2){ // lock2 是公用同步锁\r\n// 代码段 D\r\n// 访问共享资源 resource2\r\n// 需要同步\r\n}\r\n} 这样，f1()和f2()就会竞争lock1，而f3()和f4()就会竞争lock2。这样，分开来分别竞争两个锁，就可以大大较少同步锁竞争的概率，从而减少系统的开销。\r\n信号量\r\n同步锁模型只是最简单的同步模型。同一时刻，只有一个线程能够运行同步代码。\r\n有的时候，我们希望处理更加复杂的同步模型，比如生产者/消费者模型、读写同步模型等。这种情况下，同步锁模型就不够用了。我们需要一个新的模型。这就是我们要讲述的信号量模型。\r\n信号量模型的工作方式如下：线程在运行的过程中，可以主动停下来，等待某个信号量的通知；这时候，该线程就进入到该信号量的待召（Waiting）队列当中；等到通知之后，再继续运行。\r\n很多语言里面，同步锁都由专门的对象表示，对象名通常叫Monitor。\r\n同样，在很多语言中，信号量通常也有专门的对象名来表示，比如，Mutex，Semphore。\r\n信号量模型要比同步锁模型复杂许多。一些系统中，信号量甚至可以跨进程进行同步。另外一些信号量甚至还有计数功能，能够控制同时运行的线程数。\r\n我们没有必要考虑那么复杂的模型。所有那些复杂的模型，都是最基本的模型衍生出来的。只要掌握了最基本的信号量模型——“等待/通知”模型，复杂模型也就迎刃而解了。\r\n我们还是以Java语言为例。Java语言里面的同步锁和信号量概念都非常模糊，没有专门的对象名词来表示同步锁和信号量，只有两个同步锁相关的关键字——volatile和synchronized。\r\n这种模糊虽然导致概念不清，但同时也避免了Monitor、Mutex、Semphore等名词带来的种种误解。我们不必执着于名词之争，可以专注于理解实际的运行原理。\r\n在Java语言里面，任何一个Object Reference都可以作为同步锁。同样的道理，任何一个Object Reference也可以作为信号量。\r\nObject对象的wait()方法就是等待通知，Object对象的notify()方法就是发出通知。 具体调用方法为\r\n（1）等待某个信号量的通知\r\npublic static final Object signal = new Object();\r\n… f1() {\r\nsynchronized(singal) { // 首先我们要获取这个信号量。这个信号量同时也是一个同步锁\r\n// 只有成功获取了signal这个信号量兼同步锁之后，我们才可能进入这段代码\r\nsignal.wait(); // 这里要放弃信号量。本线程要进入signal信号量的待召（Waiting）队列\r\n// 可怜。辛辛苦苦争取到手的信号量，就这么被放弃了\r\n// 等到通知之后，从待召（Waiting）队列转到就绪（Ready）队列里面\r\n// 转到了就绪队列中，离CPU核心近了一步，就有机会继续执行下面的代码了。\r\n// 仍然需要把signal同步锁竞争到手，才能够真正继续执行下面的代码。命苦啊。 … }\r\n}\r\n需要注意的是，上述代码中的signal.wait()的意思。signal.wait()很容易导致误解。signal.wait()的意思并不是说，signal开始wait，而是说，运行这段代码的当前线程开始wait这个signal对象，即进入signal对象的待召（Waiting）队列。\r\n（2）发出某个信号量的通知\r\n… f2() {\r\nsynchronized(singal) { // 首先，我们同样要获取这个信号量。同时也是一个同步锁。\r\n// 只有成功获取了signal这个信号量兼同步锁之后，我们才可能进入这段代码\r\nsignal.notify(); // 这里，我们通知signal的待召队列中的某个线程。\r\n// 如果某个线程等到了这个通知，那个线程就会转到就绪队列中\r\n// 但是本线程仍然继续拥有signal这个同步锁，本线程仍然继续执行\r\n// 嘿嘿，虽然本线程好心通知其他线程，\r\n// 但是，本线程可没有那么高风亮节，放弃到手的同步锁\r\n// 本线程继续执行下面的代码\r\n… } }\r\n需要注意的是，signal.notify()的意思。signal.notify()并不是通知signal这个对象本身。而是通知正在等待signal信号量的其他线程。\r\n以上就是Object的wait()和notify()的基本用法。\r\n实际上，wait()还可以定义等待时间，当线程在某信号量的待召队列中，等到足够长的时间，就会等无可等，无需再等，自己就从待召队列转移到就绪队列中了。\r\n另外，还有一个notifyAll()方法，表示通知待召队列里面的所有线程。\r\n这些细节问题，并不对大局产生影响。\r\n绿色线程\r\n绿色线程（Green Thread）是一个相对于操作系统线程（Native Thread）的概念。\r\n操作系统线程（Native Thread）的意思就是，程序里面的线程会真正映射到操作系统的线程，线程的运行和调度都是由操作系统控制的\r\n绿色线程（Green Thread）的意思是，程序里面的线程不会真正映射到操作系统的线程，而是由语言运行平台自身来调度。\r\n当前版本的Python语言的线程就可以映射到操作系统线程。当前版本的Ruby语言的线程就属于绿色线程，无法映射到操作系统的线程，因此Ruby语言的线程的运行速度比较慢。\r\n难道说，绿色线程要比操作系统线程要慢吗？当然不是这样。事实上，情况可能正好相反。Ruby是一个特殊的例子。线程调度器并不是很成熟。\r\n目前，线程的流行实现模型就是绿色线程。比如，stackless Python，就引入了更加轻量的绿色线程概念。在线程并发编程方面，无论是运行速度还是并发负载上，都优于Python。\r\n另一个更著名的例子就是ErLang（爱立信公司开发的一种开源语言）。\r\nErLang的绿色线程概念非常彻底。ErLang的线程不叫Thread，而是叫做Process。这很容易和进程混淆起来。这里要注意区分一下。\r\nErLang Process之间根本就不需要同步。因为ErLang语言的所有变量都是final的，不允许变量的值发生任何变化。因此根本就不需要同步。\r\nfinal变量的另一个好处就是，对象之间不可能出现交叉引用，不可能构成一种环状的关联，对象之间的关联都是单向的，树状的。因此，内存垃圾回收的算法效率也非常高。这就让ErLang能够达到Soft Real Time（软实时）的效果。这对于一门支持内存垃圾回收的语言来说，可不是一件容易的事情。',NULL,'2017-07-03 21:49:05',0,0,0),(14,2,'AJAX - 向服务器发送请求请求','XMLHttpRequest 对象用于和服务器交换数据。\r\n\r\n向服务器发送请求\r\n如需将请求发送到服务器，我们使用 XMLHttpRequest 对象的 open() 和 send() 方法：\r\nGET 还是 POST？\r\n与 POST 相比，GET 更简单也更快，并且在大部分情况下都能用。\r\n\r\n然而，在以下情况中，请使用 POST 请求：\r\n\r\n无法使用缓存文件（更新服务器上的文件或数据库）\r\n向服务器发送大量数据（POST 没有数据量限制）\r\n发送包含未知字符的用户输入时，POST 比 GET 更稳定也更可靠\r\n',NULL,'2017-07-06 19:20:30',0,0,0);

/*Table structure for table `friends_tab` */

DROP TABLE IF EXISTS `friends_tab`;

CREATE TABLE `friends_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长',
  `hisId` int(11) DEFAULT NULL COMMENT '被关注的人的Id',
  `myId` int(11) DEFAULT NULL COMMENT '关注人的ID',
  `beizhu` varchar(225) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `friends_tab` */

/*Table structure for table `likes_tab` */

DROP TABLE IF EXISTS `likes_tab`;

CREATE TABLE `likes_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长',
  `discussId` int(11) DEFAULT NULL COMMENT '被点赞的评论ID',
  `likeserId` int(11) DEFAULT NULL COMMENT '点赞者ID',
  `likesTime` datetime DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `likes_tab` */

/*Table structure for table `user_tab` */

DROP TABLE IF EXISTS `user_tab`;

CREATE TABLE `user_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长(用户ID)',
  `phone` varchar(225) NOT NULL COMMENT '联系方式(登录账号)',
  `password` varchar(225) DEFAULT NULL COMMENT '密码',
  `name` varchar(225) DEFAULT '未填写' COMMENT '姓名',
  `nickname` varchar(225) DEFAULT '未填写' COMMENT '用户昵称',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `gender` varchar(4) DEFAULT '男' COMMENT '性别:0表示男，1表示女',
  `address` varchar(225) DEFAULT '未填写' COMMENT '联系地址',
  `introduction` text COMMENT '个人简介',
  `type` int(11) DEFAULT '0' COMMENT '用户类型（0表示普通用户，1表示管理员）',
  `profession` varchar(225) DEFAULT NULL COMMENT '职业',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phoneunique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `user_tab` */

insert  into `user_tab`(`id`,`phone`,`password`,`name`,`nickname`,`age`,`gender`,`address`,`introduction`,`type`,`profession`) values (1,'123456','123456','管理员','管理员',22,'男','廉江','大家好，我是管理员。。',1,'管理员'),(2,'18219111625','123456','吴乃福','夜雨',22,'男','广东省江门市五邑大学','我来自五邑大学',0,'学生'),(3,'18219111624','123456','张三','黑旋风',30,'男','江门','大家好，我是嘿嘿的旋风。。。',0,'交通'),(4,'18219111623','123456','李四','孤独的我',25,'男','深圳','大家好，我是孤独的我。。。',0,'学生'),(5,'18219111622','123456','王五','欣喜若狂',33,'男','东莞','大家好，我是欣喜若狂。。。',0,'其他'),(6,'18219111621','123456','妮子','我醉了',45,'女','湛江','我真的没醉',0,'IT'),(7,'18219111620','123456','吴刚','夜',33,'男','江门','来来，十步杀一人，千里不留行。。。。。测试修改',0,'交通');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
