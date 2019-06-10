Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6323B2B1
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 12:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388688AbfFJKD5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 06:03:57 -0400
Received: from mail-eopbgr1400040.outbound.protection.outlook.com ([40.107.140.40]:5647
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388647AbfFJKD4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 06:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb7xbMgOXXUEm2N7Pg/5eJgqz5yiTYSqMo//fzkWwiI=;
 b=IdyYAzKZL/eCjMPY8DkE8amRyuDCdJ3MNSu54fWJIplOkIAzyabwjOOJwSl7nlfaaHwqIp3+tg2/E5OUtPxv2xS92i4sUQ7JRdE7GS8csDv8CQnAU9wQ3grxazaKTI/xlc/qTaJyDdNR9q1JQNIbix9Uz4LTQbhzsNwzKiPFCIE=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB3303.jpnprd01.prod.outlook.com (20.178.96.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 10:03:52 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 10:03:52 +0000
From:   Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
To:     =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>
CC:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "hui.wang@canonical.com" <hui.wang@canonical.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6IGFscHMtZml4IHRoZSBp?=
 =?utf-8?Q?ssue_alps_cs19_trackstick_do_not_work.?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxw?=
 =?utf-8?Q?s_cs19_trackstick_do_not_work.?=
Thread-Index: AQHVFHDIBpbm29Y830SbHnb/dbnRc6Z+v5aAgAD+tvCAAGPlAIAACjKQgBSAfaCAABHEQA==
Date:   Mon, 10 Jun 2019 10:03:51 +0000
Message-ID: <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b902201d-dfcd-4230-2fd7-08d6ed8af0c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3303;
x-ms-traffictypediagnostic: OSBPR01MB3303:
x-microsoft-antispam-prvs: <OSBPR01MB3303D5CA1CF23E3937718995DA130@OSBPR01MB3303.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(55016002)(486006)(66476007)(86362001)(6436002)(5660300002)(186003)(26005)(11346002)(9686003)(476003)(52536014)(25786009)(446003)(85182001)(256004)(4326008)(76116006)(66946007)(14444005)(107886003)(316002)(7736002)(54906003)(6916009)(33656002)(305945005)(74316002)(14454004)(73956011)(478600001)(2940100002)(224303003)(2906002)(66446008)(66574012)(99286004)(66556008)(7696005)(53936002)(76176011)(66066001)(68736007)(102836004)(64756008)(8936002)(71190400001)(6506007)(6116002)(71200400001)(81156014)(81166006)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB3303;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z3LOHMjE92gYhENR5LGXuEguEJF4S4P6GfL4BCdfN0XMW2csPAcdf14QBccRhBYqHkAhpNpYJLyhnTFIaZ7kkBWmcYekjaOrVurBSnpXiJ00oNod5/o62HVmbsdiXfWIeE3vv777Em66LAZ/JjcmyDQRaytlThE99iTgmuahuWQSPHJaQ+SCWKyrDtz2UJuVdQEKjczUDVy+ra9i2yh08CQE8F0bg57LYBGSo/Hccg7ky1Xa4uixCeoM9DTyR4V2aC5E8pa1Sl7ro6KeHghzYiFUfsMacKKm0mNo3u3Dx5aw3fbyBtKIJqom/0c3em2GF5H0c+dDjnMPCoeUaDS2sbw2hGTWuL85VVPuJDXCM36tGhSAxI9IyOlWxIdBwvAOuKZgbdDI5wCQd7JkrHJoiCzXKOliFWjTzqWIqw1V/cM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b902201d-dfcd-4230-2fd7-08d6ed8af0c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 10:03:51.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHT1HTSH3197@gl.alps.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3303
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

KysgU2FpdG8tc2FuLg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IOWKiSDm
m4nmm4kgWGlhb3hpYW8gTGl1IA0K5Y+R6YCB5pe26Ze0OiBNb25kYXksIEp1bmUgMTAsIDIwMTkg
NToyMCBQTQ0K5pS25Lu25Lq6OiBQYWxpIFJvaMOhciA8cGFsaS5yb2hhckBnbWFpbC5jb20+DQrm
ioTpgIE6IFhpYW9YaWFvIExpdSA8c2xpdXV4aWFvbnhpYW9AZ21haWwuY29tPjsgZG1pdHJ5LnRv
cm9raG92QGdtYWlsLmNvbTsgcGV0ZXIuaHV0dGVyZXJAd2hvLXQubmV0OyBodWkud2FuZ0BjYW5v
bmljYWwuY29tOyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IOabuSDmm4nlu7ogWGlhb2ppYW4gQ2FvIDx4aWFvamlhbi5jYW9AY24uYWxw
cy5jb20+OyB6aGFuZ2ZwMUBsZW5vdm8uY29tOyDmlonol6Qg55u05qi5IE5hb2tpIFNhaXRvIDxu
YW9raS5zYWl0b0BhbHBzYWxwaW5lLmNvbT47IOW3neeArCDoi7HlpKsgSGlkZW8gS2F3YXNlIDxo
aWRlby5rYXdhc2VAYWxwc2FscGluZS5jb20+DQrkuLvpopg6IOetlOWkjTog562U5aSNOiBbUEFU
Q0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxwcyBjczE5IHRyYWNrc3RpY2sgZG8gbm90
IHdvcmsuDQoNCkhpIFBhbGksDQoNCldlIHJlZ2lzdGVyIG91ciBDUzE5IGRldmljZSBhcyBBTFBT
X09OTFlfVFJBQ0tTVElDSyBkZXZpY2UuDQpBbmQgbGV0IHRoZSBWOCBwcm90b2NvbCBmdW5jdGlv
biBzdXBwb3J0IHRoZSBwcm9jZXNzIG9mIEFMUFNfT05MWV9UUkFDS1NUSUNLIGRldmljZS4gDQoN
Ckkgd2FudCB0byBjb25maXJtIGlmIHRoaXMgc29sdXRpb24gT0s/DQoNClhpYW94aWFvLkxpdQ0K
LS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiDliokg5puJ5puJIFhpYW94aWFvIExp
dSANCuWPkemAgeaXtumXtDogVHVlc2RheSwgTWF5IDI4LCAyMDE5IDM6NTUgUE0NCuaUtuS7tuS6
ujogUGFsaSBSb2jDoXIgPHBhbGkucm9oYXJAZ21haWwuY29tPg0K5oqE6YCBOiBYaWFvWGlhbyBM
aXUgPHNsaXV1eGlhb254aWFvQGdtYWlsLmNvbT47IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb207
IHBldGVyLmh1dHRlcmVyQHdoby10Lm5ldDsgaHVpLndhbmdAY2Fub25pY2FsLmNvbTsgbGludXgt
aW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyDmm7kg
5puJ5bu6IFhpYW9qaWFuIENhbyA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjsgemhhbmdmcDFA
bGVub3ZvLmNvbTsg5paJ6JekIOebtOaouSBOYW9raSBTYWl0byA8bmFva2kuc2FpdG9AYWxwc2Fs
cGluZS5jb20+OyDlt53ngKwg6Iux5aSrIEhpZGVvIEthd2FzZSA8aGlkZW8ua2F3YXNlQGFscHNh
bHBpbmUuY29tPg0K5Li76aKYOiDnrZTlpI06IOetlOWkjTogW1BBVENIXSBpbnB1dDogYWxwcy1m
aXggdGhlIGlzc3VlIGFscHMgY3MxOSB0cmFja3N0aWNrIGRvIG5vdCB3b3JrLg0KDQpBZGQgS2F3
YXNlLXNhbi4NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBQYWxpIFJvaMOh
ciA8cGFsaS5yb2hhckBnbWFpbC5jb20+IA0K5Y+R6YCB5pe26Ze0OiBUdWVzZGF5LCBNYXkgMjgs
IDIwMTkgMzoxOCBQTQ0K5pS25Lu25Lq6OiDliokg5puJ5puJIFhpYW94aWFvIExpdSA8eGlhb3hp
YW8ubGl1LTFAY24uYWxwcy5jb20+DQrmioTpgIE6IFhpYW9YaWFvIExpdSA8c2xpdXV4aWFvbnhp
YW9AZ21haWwuY29tPjsgZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbTsgcGV0ZXIuaHV0dGVyZXJA
d2hvLXQubmV0OyBodWkud2FuZ0BjYW5vbmljYWwuY29tOyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOabuSDmm4nlu7ogWGlhb2ppYW4g
Q2FvIDx4aWFvamlhbi5jYW9AY24uYWxwcy5jb20+OyB6aGFuZ2ZwMUBsZW5vdm8uY29tOyDmlono
l6Qg55u05qi5IE5hb2tpIFNhaXRvIDxuYW9raS5zYWl0b0BhbHBzYWxwaW5lLmNvbT4NCuS4u+mi
mDogUmU6IOetlOWkjTogW1BBVENIXSBpbnB1dDogYWxwcy1maXggdGhlIGlzc3VlIGFscHMgY3Mx
OSB0cmFja3N0aWNrIGRvIG5vdCB3b3JrLg0KDQpPbiBUdWVzZGF5IDI4IE1heSAyMDE5IDAxOjM3
OjE0IFhpYW94aWFvIExpdSB3cm90ZToNCj4gQWRkIFNhaXRvLXNhbi4NCj4gDQo+IEhpIEh1aSwN
Cj4gRG9lcyBpdCBtZWFuIHRoYXQgeW91ciBkZXZpY2UgKHJlcG9ydGVkIHRvIGtlcm5lbCkgc2Vu
ZHMgb25seSB0cmFja3N0aWNrIHBhY2tldHMgYW5kIG5vdCB0b3VjaHBhZD8NCj4gICAgCS0+IFll
cy4NCg0KT2ssIEkgdGhpbmsgdGhpcyBhbnN3ZXJzIGFsbCBxdWVzdGlvbnMuDQoNClNvIHlvdXIg
cGF0Y2ggaXMgbm90IGNvcnJlY3QgYXMgaXQgcmVnaXN0ZXJzICJmYWtlIiB0b3VjaHBhZCBkZXZp
Y2UgZXZlbiB0aGVyZSBpcyBubyB0b3VjaHBhZCBhdCBhbGwuDQoNCllvdSBzaG91bGQgZml4IHlv
dXIgcGF0Y2ggdG8gbm90IHJlZ2lzdGVyIHRvdWNocGFkIGlucHV0IGRldmljZSwgaW4geW91ciBj
YXNlIGl0IHNob3VsZCByZWdpc3RlciBvbmx5IHRyYWNrc3RpY2sgZGV2aWNlLiBJIHN1Z2dlc3Qg
dG8gYWRkIHNvbWUgZmxhZyB3aGljaCB3b3VsZCBpbmRpY2F0ZSBzdWNoIGRldmljZSAoZS5nLiBB
TFBTX09OTFlfVFJBQ0tTVElDSykuDQoNCkFsc28gY3VycmVudGx5IGtlcm5lbCBleHBvcnRzIGZv
bGxvd2luZyBuYW1lcyB3aGVuIGRldmljZSBoYXMgYm90aCB0cmFja3N0aWNrIGFuZCB0b3VjaHBh
ZDogIkR1YWxQb2ludCBTdGljayIgYW5kICJEdWFsUG9pbnQgVG91Y2hQYWQiLg0KQW5kIGl0IGV4
cG9ydHMgbmFtZSAiR2xpZGVQb2ludCIgZm9yIHRvdWNocGFkLW9ubHkgZGV2aWNlLiBTbyB0byBi
ZSBjb25zaXN0ZW50IHlvdSBuZWVkIHRvIGFsc28gbW9kaWZ5IHRoaXMgY29kZSBmb3IgdHJhY2tz
dGljay1vbmx5IGRldmljZS4NCg0KLS0NClBhbGkgUm9ow6FyDQpwYWxpLnJvaGFyQGdtYWlsLmNv
bQ0K
