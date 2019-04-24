<!DOCTYPE html> {% set html_class = 'theme-next ' + theme.scheme %} {% if theme.motion.enable %} {% set html_class = html_class + ' use-motion' %} {% endif %}
<html class="{{ html_class | lower }}" lang="{{ config.language }}">

<head>
  <meta name="google-site-verification" content="enOIbDP_rOakODkdpYznnwBnTD_Xh_KWFA2kPbX3sdY">
  <meta name="keywords" content="知与南, 知与南的博客，叩首问路，码梦为生。">
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
  <!-- gitalk评论插件css -->
  <link rel="stylesheet"  href="/js/src/gitalk.css">
  <!-- 看板娘插件css -->
  <link rel="stylesheet" href="/js/live2d/css/live2d.css" />
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
  {% set container_class = "container " %} {% if theme.sidebar.position %} {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %} {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <div class="headband"></div>
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>
    <div id="landlord">
    <div class="message" style="opacity:0"></div>
    <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
    <div class="hide-button">隐藏</div>
</div>
    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
         
          <div id="gitalk-container"></div>
          {% include '_third-party/duoshuo-hot-articles.swig' %} {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %} {% block sidebar %}{% endblock %} {% endif %}
      </div>
    </main>
    <footer id="footer" class="footer">
      <div class="footer-inner">
         {% include '_partials/footer.swig' %} {% include '_third-party/analytics/analytics-with-widget.swig' %} {% block footer %}{% endblock %}
      </div>
    </footer>
    {% if not theme.sidebar.b2t %}
    <div class="back-to-top">
      <i class="fa fa-arrow-up"></i> {% if theme.sidebar.scrollpercent %}
      <span id="scrollpercent"><span>0</span>%</span>
      {% endif %}
    </div>
    {% endif %} {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
    <div id="needsharebutton-float">
      <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
    </div>
    {% endif %}
  </div>
  {% include '_scripts/vendors.swig' %} {% include '_scripts/commons.swig' %} {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %} {% include scheme_script %} {% block script_extra %}{% endblock %} {% include '_scripts/boostrap.swig' %} {% include '_third-party/comments/index.swig' %} {% include '_third-party/search/index.swig' %} {% include '_third-party/analytics/lean-analytics.swig' %} {% include '_third-party/analytics/firestore.swig' %} {% include '_third-party/seo/baidu-push.swig' %} {% include '_third-party/needsharebutton.swig' %} {% include '_third-party/rating.swig' %} {% include '_third-party/mathjax.swig' %} {% include '_third-party/scroll-cookie.swig' %} {% include '_third-party/exturl.swig' %}
  <!-- gitalk评论插件 -->
  <script type="text/javascript" src="/js/src/gitalk.min.js"></script>
  <script src="/js/src/md5.js" type="text/javascript"></script>
  <script>
  let id = location.href
  if(id.indexOf('www') > -1) {
    let str = id.split(".")
    let href = 'http://'
    for(let i = 1,len=str.length;i<len;i++) {
      href+=str[i]
      if(i===1) {
        href+='.'
      }
    }
    id = href
  }
  console.log(id)
  id = hex_md5(id)
  const gitalk = new Gitalk({
    clientID: '871b33fddf76276d91aa',
    clientSecret: '946e58b00919856b957a8b134b18e232b44af6a5',
    repo: 'hexo',
    owner: 'pengqiangsheng',
    admin: ['pengqiangsheng'],
    id: id,      // Ensure uniqueness and length less than 50
    distractionFreeMode: true  // Facebook-like distraction free mode
  })
  gitalk.render('gitalk-container')
  </script>
  <!-- live2d看板娘 -->
  <script type="text/javascript">
    var message_Path = '/js/live2d/'
    var home_Path = 'http://aboutme.ink/'  //此处修改为你的域名，必须带斜杠
  </script>
  <script type="text/javascript" src="/js/live2d/js/live2d.js"></script>
  <script type="text/javascript" src="/js/live2d/js/message.js"></script>
  <script type="text/javascript">
      loadlive2d("live2d", "/js/live2d/model/tia/model.json");
  </script>
  <!-- 页面点击小红心 -->
  <script type="text/javascript" src="/js/src/love.js"></script>
  <script>
    function secondToDate(second) {
    if (!second) {
      return 0;
    }
    var time = new Array(0, 0, 0, 0, 0);
    if (second >= 365 * 24 * 3600) {
      time[0] = parseInt(second / (365 * 24 * 3600));
      second %= 365 * 24 * 3600;
    }
    if (second >= 24 * 3600) {
      time[1] = parseInt(second / (24 * 3600));
      second %= 24 * 3600;
    }
    if (second >= 3600) {
      time[2] = parseInt(second / 3600);
      second %= 3600;
    }
    if (second >= 60) {
      time[3] = parseInt(second / 60);
      second %= 60;
    }
    if (second > 0) {
      time[4] = second;
    }
    return time;
    }
  </script>
  <!-- 统计网站运行时间 -->
  <script type="text/javascript" language="javascript">
    function setTime() {
    // 博客创建时间秒数，时间格式中，月比较特殊，是从 0 开始的，所以想要显示 5 月，得写 4 才行，如下
    var create_time = Math.round(new Date(Date.UTC(2018, 07, 16, 0, 0, 0))
    .getTime() / 1000);
    // 当前时间秒数,增加时区的差异
    var timestamp = Math.round((new Date().getTime() + 8 * 60 * 60 * 1000) / 1000);
    currentTime = secondToDate((timestamp - create_time));
    currentTimeHtml = currentTime[0] + '岁零' + currentTime[1] + '天了';
    // + currentTime[2] + '时' + currentTime[3] + '分' + currentTime[4]
    // + '秒';
    document.getElementById("htmer_time").innerHTML = currentTimeHtml;
    }
    setInterval(setTime, 1000);
  </script>
  <!-- 百度推送脚本 -->
  <script>
  (function(){
              var bp = document.createElement('script');
              var curProtocol = window.location.protocol.split(':')[0];
              if (curProtocol === 'https') {
                  bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
              }
              else {
                  bp.src = 'http://push.zhanzhang.baidu.com/push.js';
              }
              var s = document.getElementsByTagName("script")[0];
              s.parentNode.insertBefore(bp, s);
          })();
  </script>
  <!-- 统计访问量 -->
  <script>
  /**
  * 实现访问量统计和留言
  * @authors pengqiangsheng
  * @date    2018-08-26 09:22:10
  * @version v1.0
  */
  window.onload = function() {
      showSitePv();
      showPagePv();
  }
  // function myMessage() {
  //     let str = "query";
  //     let xmlhttp;
  //     let message = document.getElementById("mymessage");
  //     if (window.XMLHttpRequest) {
  //         // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
  //         xmlhttp = new XMLHttpRequest();
  //     } else {
  //         // IE6, IE5 浏览器执行代码
  //         xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  //     }
  //     xmlhttp.onreadystatechange = function() {
  //         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
  //             message.innerHTML += xmlhttp.responseText;
  //         }
  //     }
  //     xmlhttp.open("GET", "http://aboutme.ink/plug/getMessage.php?q=" + str, true);
  //     xmlhttp.send();
  // }
  function showSitePv() {
      let pageId = 1;
      let xmlhttp;
      let sitePv = document.getElementById("site_pv");
      if (window.XMLHttpRequest) {
          // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
          xmlhttp = new XMLHttpRequest();
      } else {
          // IE6, IE5 浏览器执行代码
          xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      xmlhttp.onreadystatechange = function() {
          if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
              sitePv.innerHTML += xmlhttp.responseText;
              addOnePv(xmlhttp.responseText);
          }
      }
      xmlhttp.open("GET", "http://aboutme.ink/plug/getCount.php?pageId=" + pageId, true);
      xmlhttp.send();
  }
  function showPagePv() {
    let pageId = id
    let xmlhttp;
    let pagePV = document.getElementById("myPagePv");
    if (window.XMLHttpRequest) {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp = new XMLHttpRequest();
    } else {
        // IE6, IE5 浏览器执行代码
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
           if(xmlhttp.responseText=="null result") {
              updatePagePv('1', 'insert');
              pagePV.innerHTML += "本文阅读数1次";
           }else {
              pagePV.innerHTML += "本文阅读数";
              pagePV.innerHTML += xmlhttp.responseText;
              pagePV.innerHTML += "次";
              updatePagePv(xmlhttp.responseText, 'update');
            }
        }
    }
    xmlhttp.open("GET", "http://aboutme.ink/plug/getCount.php?pageId=" + pageId, true);
    xmlhttp.send();
  }
  function updatePagePv(strPv, type) {
    let pageId = id
    let pv = parseInt(strPv) + 1
    let xmlhttp;
    if (window.XMLHttpRequest) {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp = new XMLHttpRequest();
    } else {
        // IE6, IE5 浏览器执行代码
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if(xmlhttp.responseText == 'success') {
              console.log('success')
            }else {
              console.log('fali')
            }
        }
    }
    if (type === "insert") {
      xmlhttp.open("GET", "http://aboutme.ink/plug/addCount.php?pv=" + pv + "&pageId=" + pageId, true);
    }else {
       xmlhttp.open("GET", "http://aboutme.ink/plug/updateCount.php?pv=" + pv + "&pageId=" + pageId, true);
    }
    xmlhttp.send();
  }
  function addOnePv(strPv) {
    let pageId = 1;
    let pv = parseInt(strPv) + 1
    let xmlhttp;
    if (window.XMLHttpRequest) {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp = new XMLHttpRequest();
    } else {
        // IE6, IE5 浏览器执行代码
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if(xmlhttp.responseText == 'success') {
              console.log('success')
            }else {
              console.log('fali')
            }
        }
    }
    xmlhttp.open("GET", "http://aboutme.ink/plug/updateCount.php?pv=" + pv + "&pageId=" + pageId , true);
    xmlhttp.send();
  }
  </script>
</body>

</html>
