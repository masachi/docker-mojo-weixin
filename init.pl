 #!/usr/bin/env perl
 use Mojo::Weixin;
 # my ($host,$port,$post_api);
 
 # $host = "0.0.0.0"; #发送消息接口监听地址，没有特殊需要请不要修改
 # $port = 10240;      #发送消息接口监听端口，修改为自己希望监听的端口
 #$post_api = 'http://xxxx';  #接收到的消息上报接口，如果不需要接收消息上报，可以删除或注释此行
 
 my $client = Mojo::Weixin->new(log_level=>"info",http_debug=>0);
 # $client->load("ShowMsg");
 # $client->load("Openwx",data=>{listen=>[{host=>$host,port=>$port}], post_api=>$post_api});
 $client->load("MiPush",data=>{
    registration_ids=>[""],
    is_ban_official=>1
 });
 $client->load("PostQRcode",data=>{
    smtp    =>  '', #邮箱的smtp地址
    port    =>  '465', #smtp服务器端口，默认25
    from    =>  '', #发件人
    to      =>  '', #收件人 867303288
    user    =>  '', #smtp登录帐号
    pass    =>  '', #smtp登录密码
    tls     =>  1,      #可选，是否使用SMTPS协议，默认为0                            
                        #在没有设置的情况下，如果使用的端口为465，则该选项会自动被设置为1
});
 $client->run();
