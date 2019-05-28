Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE7DA2BCE6
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 03:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbfE1BhT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 21:37:19 -0400
Received: from mail-eopbgr1400070.outbound.protection.outlook.com ([40.107.140.70]:30563
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727566AbfE1BhT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 21:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXKt+OupvFYDpBYxyX3dNmU+QX8Dbljyh6UvpvS74t0=;
 b=Jb5sqGzxudqf9Kx1ARai1LEINdwGgTvDOtNj6ER6pF5h4V/EOER4tLyAI90bxn6X/aqHum2DneGNA6+HoE/eGn9P8sORbleY8u4IT13kL6KDnL7RmAcFFcK8yc00PRX1Uu2ShrROKZ7knxK0yQQiol5s8QnQL3CBvo9NDamuRkg=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB2392.jpnprd01.prod.outlook.com (52.134.255.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 01:37:14 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 01:37:14 +0000
From:   Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
To:     =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "hui.wang@canonical.com" <hui.wang@canonical.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxw?=
 =?utf-8?Q?s_cs19_trackstick_do_not_work.?=
Thread-Topic: [PATCH] input: alps-fix the issue alps cs19 trackstick do not
 work.
Thread-Index: AQHVFHDIBpbm29Y830SbHnb/dbnRc6Z+v5aAgAD+tvA=
Date:   Tue, 28 May 2019 01:37:14 +0000
Message-ID: <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
In-Reply-To: <20190527100913.sgxrjrmphsjfmcdb@pali>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 454cd30a-ee2e-4f20-14de-08d6e30d0311
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2392;
x-ms-traffictypediagnostic: OSBPR01MB2392:
x-microsoft-antispam-prvs: <OSBPR01MB239255CA702657A3D97649F5DA1E0@OSBPR01MB2392.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(366004)(199004)(189003)(316002)(68736007)(224303003)(478600001)(54906003)(53936002)(7696005)(71190400001)(71200400001)(256004)(74316002)(102836004)(110136005)(14444005)(25786009)(107886003)(6506007)(4326008)(99286004)(81156014)(81166006)(305945005)(33656002)(76176011)(8936002)(7736002)(66066001)(476003)(446003)(486006)(11346002)(86362001)(26005)(5660300002)(52536014)(186003)(3846002)(55016002)(6116002)(76116006)(2906002)(73956011)(85182001)(66446008)(64756008)(66556008)(66476007)(14454004)(6436002)(66946007)(66574012)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB2392;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gFBRKF8r6tiYwnhgdtqIYyASzpxd/H9hBn1qV231vUrKhERQwzso0qq/8lT1D26q6G/2OdDXYfccsYgZcrtmMLEfUMzF/7YE8YAk0Ts+gpoZArk9o/9eFMXb3FmIoR3XVTdeAMAUXXMjJQNB9e3qgU37B7MeJb66F3ZDJ7SEDjLk0qgaYrAZaej9wklDY7pT88k/BfLCWaZP5bvs8rhZj9Z+8CoKUFxXFKrVUCI6K3et2BbQYNUU4T2mstL2LaAiPiNa8DAUZoMdKSit4xquqUXaXHesn+66SdUtboHdL2sLDUA/l4RF0+U6pfYo0/rR2cnCmSTNSf2IjWcHUejN9CG3eA6S9NjQwYJp4rdwQe8losITbHUDKzz6QQfqoWp61y+PsDrrZXwx5dZIymOeUHs6IfjljvFyHyrTMfsnSno=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454cd30a-ee2e-4f20-14de-08d6e30d0311
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 01:37:14.3126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHT1HTSH3197@gl.alps.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2392
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QWRkIFNhaXRvLXNhbi4NCg0KSGkgSHVpLA0KRG9lcyBpdCBtZWFuIHRoYXQgeW91ciBkZXZpY2Ug
KHJlcG9ydGVkIHRvIGtlcm5lbCkgc2VuZHMgb25seSB0cmFja3N0aWNrIHBhY2tldHMgYW5kIG5v
dCB0b3VjaHBhZD8NCiAgIAktPiBZZXMuDQpJIGd1ZXNzIHRoYXQgeW91IHdhbnQgcGFyZW50aGVz
aXMgYXJvdW5kIChwYXJhbVsxXSAmIDB4MjApLiBBbmQgYWxzbyBkZXNjcmliZSB3aGF0IHRoYXQg
MHgyMCBjb25zdGFudCBtZWFucy4NCkl0IGlzIG5vdCBhIHdhcm5pbmcuDQoJLT4gWWVzLCBpdCBz
aG91bGQgYmUgKHBhcmFtWzFdICYgMHgyMCkuIA0KCS0+IDB4MjAgaXMgdXNlZCBmb3IgZGV0ZWN0
IHdoaWNoIHR5cGUgZGV2aWNlIGlzLiBJIHdpbGwgY29ycmVjdCBpdC4NCg0KSG0uLi4gd2h5IHlv
dXIgZGV2aWNlIGRvZXMgbm90IG1hdGNoIHRoZXNlIGNvbnN0YW50cz8NCgktPkkgYW0gbm90IGNs
ZWFyIHdoYXQgdGhlIGFscHNfY29tbWFuZF9tb2RlX3JlYWRfcmVnKHBzbW91c2UsIDB4RDcpIHVz
ZWQgZm9yLg0KICAgICAgICAgICAgICAtPiBCdXQgSSBrbm93IG91ciBkZXZpY2UgZGlkIG5vdCBt
ZWV0IHRoZSBjb25kaXRpb24gaWYgKHJlZ192YWwgPT0gMHgwQyB8fCByZWdfdmFsID09IDB4MUQp
IGZyb20gdGhlICAgICAgICAgICAgICAgIHJ1bm5pbmcgcmVzdWx0Lg0KDQpYaWFveGlhbyBMaXUN
CnhpYW94aWFvLmxpdS0xQGNuLmFscHMuY29tDQpzbGl1dXhpYW9ueGlhb0BnbWFpbC5jb20NCi0t
LS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogUGFsaSBSb2jDoXIgPHBhbGkucm9oYXJA
Z21haWwuY29tPiANCuWPkemAgeaXtumXtDogTW9uZGF5LCBNYXkgMjcsIDIwMTkgNjowOSBQTQ0K
5pS25Lu25Lq6OiBYaWFvWGlhbyBMaXUgPHNsaXV1eGlhb254aWFvQGdtYWlsLmNvbT4NCuaKhOmA
gTogZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbTsgcGV0ZXIuaHV0dGVyZXJAd2hvLXQubmV0OyBo
dWkud2FuZ0BjYW5vbmljYWwuY29tOyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOabuSDmm4nlu7ogWGlhb2ppYW4gQ2FvIDx4aWFvamlh
bi5jYW9AY24uYWxwcy5jb20+OyB6aGFuZ2ZwMUBsZW5vdm8uY29tOyDliokg5puJ5puJIFhpYW94
aWFvIExpdSA8eGlhb3hpYW8ubGl1LTFAY24uYWxwcy5jb20+DQrkuLvpopg6IFJlOiBbUEFUQ0hd
IGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxwcyBjczE5IHRyYWNrc3RpY2sgZG8gbm90IHdv
cmsuDQoNCkhpIQ0KDQpPbiBNb25kYXkgMjcgTWF5IDIwMTkgMDU6NDQ6MjIgWGlhb1hpYW8gTGl1
IHdyb3RlOg0KPiBUaGUgYWxwcyBkZXZpY2VzIHdoaWNoIGRldGVjdGVkIHRvIHVzZSB0aGUgQUxQ
U19QUk9UT19WOCBwcm9jb3RvbCANCj4gY29udGFpbnMgQUxQUyB0b3VjaHBhZCBhbmQgQUxQUyB0
cmFja3N0aWNrLlRoZSBBTFBTX1BST1RPX1Y4IHByb2NvdG9sIA0KPiBkbyBub3Qgc3VwcG9ydCB0
aGUgdHJhY2tzdGljayBkZXZpY2UgcHJvY2VzcyBieSBkZWZhdWx0Lg0KDQpOb3JtYWxseSBQUy8y
IGRldmljZSBoYW5kbGVkIGJ5IGFscHMuYyBpcyB0b3VjaHBhZCBhbmQgaW4gc29tZSBjYXNlcyB0
b3VjaHBhZCBzZW5kcyBhbHNvIHRyYWNrc3RpY2sgZGF0YSBpbiB0aGF0IG9uZSBQUy8yIGNoYW5u
ZWwuDQoNCkRvZXMgaXQgbWVhbiB0aGF0IHlvdXIgZGV2aWNlIChyZXBvcnRlZCB0byBrZXJuZWwp
IHNlbmRzIG9ubHkgdHJhY2tzdGljayBwYWNrZXRzIGFuZCBub3QgdG91Y2hwYWQ/DQoNCj4gV2hl
biB0aGUgdHJhY2tzdGljayB3YXMgZGV0ZWN0ZWQgdG8gdXNlIEFMUFNfUFJPVE9fVjggcHJvY290
b2wsIHRoZSB2OCANCj4gcHJvY2Vzc19wYWNrZXQgbWV0aG9kIGFscHNfcHJvY2Vzc19wYWNrZXRf
c3M0X3YyIHdpbGwgcmVqZWN0IHRvIHJlcG9ydCANCj4gdGhlIGRhdGEgd2hlbiB0aGUgZGV2aWNl
IHVzaW5nIEFMUFNfUFJPVE9fVjggcHJvY290b2wgaXMgbm90IHNldCB0aGUgDQo+IEFMUFNfRFVB
TFBPSU5UIGZsYWcuDQo+IA0KPiBUaGUgYWxwcyBjczE5IHRyYWNrc3RpY2sgaXMgZGV0ZWN0ZWQg
dG8gdXNlIHRoZSBBTFBTX1BST1RPX1Y4IHByb2NvdG9sIA0KPiBidXQgd2l0aG91dCBBTFBTX0RV
QUxQT0lOVCBmbGFnLCB0aGUgYWxwcyBkcml2ZXIgd2lsbCBub3QgcmVwb3J0IHRoZSANCj4gaW5w
dXQgZGF0YS4gc28gdGhlIHRyYWNrc3RpY2sgd2lsbCBub3Qgd29yay4NCj4gDQo+IHNvbHV0aW9u
OiB3aGVuIHRoZSBhbHBzIGNzMTkgZGV2aWNlIGRldGVjdGVkLCBzZXQgdGhlIGRldmljZSANCj4g
QUxQU19EVUFMUE9JTlQgZmxhZyx0aGVuIHRoZSBpbnB1dCBkYXRhIHdpbGwgYmUgcHJvY2Vzc2Vk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGlhb1hpYW8gTGl1IDxzbGl1dXhpYW9ueGlhb0BnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pbnB1dC9tb3VzZS9hbHBzLmMgfCAyNSArKysrKysr
KysrKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L21vdXNlL2Fs
cHMuYyBiL2RyaXZlcnMvaW5wdXQvbW91c2UvYWxwcy5jIA0KPiBpbmRleCAwYTZmN2NhODgzZTcu
LmE1NDY3N2NmNzQ3NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pbnB1dC9tb3VzZS9hbHBzLmMN
Cj4gKysrIGIvZHJpdmVycy9pbnB1dC9tb3VzZS9hbHBzLmMNCj4gQEAgLTI0LDcgKzI0LDcgQEAN
Cj4gIA0KPiAgI2luY2x1ZGUgInBzbW91c2UuaCINCj4gICNpbmNsdWRlICJhbHBzLmgiDQo+IC0N
Cj4gKyNpbmNsdWRlICJ0cmFja3BvaW50LmgiDQo+ICAvKg0KPiAgICogRGVmaW5pdGlvbnMgZm9y
IEFMUFMgdmVyc2lvbiAzIGFuZCA0IGNvbW1hbmQgbW9kZSBwcm90b2NvbA0KPiAgICovDQo+IEBA
IC0yMjAsNiArMjIwLDIzIEBAIHN0YXRpYyBib29sIGFscHNfaXNfdmFsaWRfZmlyc3RfYnl0ZShz
dHJ1Y3QgYWxwc19kYXRhICpwcml2LA0KPiAgCXJldHVybiAoZGF0YSAmIHByaXYtPm1hc2swKSA9
PSBwcml2LT5ieXRlMDsgIH0NCj4gIA0KPiArc3RhdGljIGludCBhbHBzX2NoZWNrX2NzMTlfdHJh
Y2tzdGljayhzdHJ1Y3QgcHNtb3VzZSAqcHNtb3VzZSkgew0KPiArCXU4IHBhcmFtWzJdID0geyAw
IH07DQo+ICsJaW50IGVycm9yOw0KPiArDQo+ICsJZXJyb3IgPSBwczJfY29tbWFuZCgmcHNtb3Vz
ZS0+cHMyZGV2LA0KPiArCQkJICAgIHBhcmFtLCBNQUtFX1BTMl9DTUQoMCwgMiwgVFBfUkVBRF9J
RCkpOw0KPiArCWlmIChlcnJvcikNCj4gKwkJcmV0dXJuIGVycm9yOw0KPiArDQo+ICsJaWYgKHBh
cmFtWzBdID09IFRQX1ZBUklBTlRfQUxQUyAmJiBwYXJhbVsxXSAmIDB4MjApIHsNCg0KSSBndWVz
cyB0aGF0IHlvdSB3YW50IHBhcmVudGhlc2lzIGFyb3VuZCAocGFyYW1bMV0gJiAweDIwKS4gQW5k
IGFsc28gZGVzY3JpYmUgd2hhdCB0aGF0IDB4MjAgY29uc3RhbnQgbWVhbnMuDQoNCj4gKwkJcHNt
b3VzZV93YXJuKHBzbW91c2UsICJJdCBpcyBhbHBzIGNzMTkgdHJhY2tzdGljayIpOw0KDQpJdCBp
cyBub3QgYSB3YXJuaW5nLg0KDQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKwlyZXR1cm4gLTE7
DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGFscHNfcmVwb3J0X2J1dHRvbnMoc3RydWN0IGlu
cHV0X2RldiAqZGV2MSwgc3RydWN0IGlucHV0X2RldiAqZGV2MiwNCj4gIAkJCQlpbnQgbGVmdCwg
aW50IHJpZ2h0LCBpbnQgbWlkZGxlKQ0KPiAgew0KPiBAQCAtMjU2OCw4ICsyNTg1LDEyIEBAIHN0
YXRpYyBpbnQgYWxwc191cGRhdGVfZHVhbF9pbmZvX3NzNF92Mih1bnNpZ25lZCBjaGFyIG90cFtd
WzRdLA0KPiAgCQkJYWxwc19leGl0X2NvbW1hbmRfbW9kZShwc21vdXNlKTsNCj4gIAkJCXBzMl9j
b21tYW5kKHBzMmRldiwgTlVMTCwgUFNNT1VTRV9DTURfRU5BQkxFKTsNCj4gIA0KPiAtCQkJaWYg
KHJlZ192YWwgPT0gMHgwQyB8fCByZWdfdmFsID09IDB4MUQpDQo+ICsJCQlpZiAocmVnX3ZhbCA9
PSAweDBDIHx8IHJlZ192YWwgPT0gMHgxRCkgew0KDQpIbS4uLiB3aHkgeW91ciBkZXZpY2UgZG9l
cyBub3QgbWF0Y2ggdGhlc2UgY29uc3RhbnRzPw0KDQo+ICsJCQkJaXNfZHVhbCA9IHRydWU7DQo+
ICsJCQl9IGVsc2UgaWYgKGFscHNfY2hlY2tfY3MxOV90cmFja3N0aWNrKHBzbW91c2UpID09IDAp
IHsNCj4gKwkJCQkvL0ZvciBzdXBwb3J0IFRoaW5rcGFkIENTMTkgVHJhY2tTdGljaw0KPiAgCQkJ
CWlzX2R1YWwgPSB0cnVlOw0KPiArCQkJfQ0KPiAgCQl9DQo+ICAJfQ0KPiAgDQoNCi0tDQpQYWxp
IFJvaMOhcg0KcGFsaS5yb2hhckBnbWFpbC5jb20NCg==
