FROM sjdy521/mojo-weixin:latest
RUN yum install qrencode-devel -y
RUN cpanm Term::QRCode
ADD init.pl .
# CMD perl -MMojo::Weixin -e 'Mojo::Weixin->new(log_encoding=>"utf8")->load(["ShowMsg","UploadQRcode"])->load("Openwx",data=>{listen=>[{port=>$ENV{MOJO_WEIXIN_PLUGIN_OPENWX_PORT}//3000}],post_api=>$ENV{MOJO_WEIXIN_PLUGIN_OPENWX_POST_API}})->run'
CMD perl init.pl
