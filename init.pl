 #!/usr/bin/env perl
 use Mojo::Weixin;
 my ($host,$port,$post_api);
 
 $host = "0.0.0.0"; #发送消息接口监听地址，没有特殊需要请不要修改
 $port = 80;      #发送消息接口监听端口，修改为自己希望监听的端口
 #$post_api = 'http://xxxx';  #接收到的消息上报接口，如果不需要接收消息上报，可以删除或注释此行
 
 my $client = Mojo::Weixin->new(log_level=>"info",http_debug=>0);
 $client->load("ShowMsg");
 $client->load("Openwx",data=>{listen=>[{host=>$host,port=>$port}], post_api=>$post_api});
 $client->load("MiPush",data=>{
    registration_ids=>["jnVAPODuZ4TsgpzNy2ftNMs700l0uemnu8DYsrzFnM1HAa9/vVbA+7B/K84gb2iD"],
    allow_group=>[""],
    ban_group=>[],
    is_ban_official=>0
 });
 $client->run();
