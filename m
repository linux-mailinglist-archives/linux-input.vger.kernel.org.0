Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0293B1DA
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 11:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388960AbfFJJUe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 05:20:34 -0400
Received: from mail-eopbgr1410045.outbound.protection.outlook.com ([40.107.141.45]:34713
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388959AbfFJJUe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 05:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+No/3JRgj3riCw6yV9YWRJkYh3QIrXC3mt3Zsz6sqk=;
 b=P4ev+whT8YooD8VG7Ne+HGVoKyURkA2++hdK8BGkaMx5iNsCuJ9oGvQX5vHIT0zRYq+U1QEyBa4a0d1DoLq/+4ril9vkSHQvHdxZpZyNG3RP9yZemC9JmrBfDqBNaq6eORkA4rOgfyRJUyy8SCsWUI0hQSnNGYRBCFRMraS7BOA=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB2279.jpnprd01.prod.outlook.com (52.134.239.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Mon, 10 Jun 2019 09:20:28 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 09:20:28 +0000
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
        Hideo Kawase <hideo.kawase@alpsalpine.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6IGFscHMtZml4IHRoZSBp?=
 =?utf-8?Q?ssue_alps_cs19_trackstick_do_not_work.?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxw?=
 =?utf-8?Q?s_cs19_trackstick_do_not_work.?=
Thread-Index: AQHVFHDIBpbm29Y830SbHnb/dbnRc6Z+v5aAgAD+tvCAAGPlAIAACjKQgBSAfaA=
Date:   Mon, 10 Jun 2019 09:20:28 +0000
Message-ID: <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac447e68-535e-49c3-7a29-08d6ed84e138
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2279;
x-ms-traffictypediagnostic: OSBPR01MB2279:
x-microsoft-antispam-prvs: <OSBPR01MB2279279A48C198A9009DD84DDA130@OSBPR01MB2279.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(366004)(396003)(136003)(189003)(199004)(4326008)(316002)(85182001)(73956011)(14454004)(6916009)(25786009)(74316002)(107886003)(76116006)(26005)(66446008)(186003)(71200400001)(71190400001)(66574012)(446003)(486006)(7696005)(478600001)(2906002)(6436002)(68736007)(76176011)(99286004)(7736002)(11346002)(476003)(86362001)(305945005)(53936002)(54906003)(256004)(6506007)(9686003)(3846002)(81166006)(102836004)(81156014)(224303003)(6116002)(66066001)(5660300002)(64756008)(52536014)(66476007)(55016002)(14444005)(66946007)(33656002)(66556008)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB2279;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0UPDDmV/Bbk/ni36+6yESSn/CVGMKUQhwPmXvErhTr3F0ClGa8MZnG9dnMidingFNJP3s62vo/hsAIMh7XxZaLrdnbScGotNkBTULOyKEgXPj2p265FR1z3jgkbxQDRxx0hP9u3sTHFSvIQREern/CN5ovrhA2zJWLJgA6ElFrOPCxLgJSZPLM8lpwDhZm+mlnLu7A3aSnGpdqa06huLepBjWh7I52doRcTrfGvxzXnctvB5iUtmNxMe2ejacaMbZfY3roO6IoA1+DKiHaLZlfcXr9CswmSqiyEh9XN/n9LGpzfQwEpGJ1LYU3HpUZ+rA2PyrkF6+t66oGZ//tyC6CU+wolWT/UVlwzdro2rtUC2ZhBueAg1HYeXY1Uwqsk+grlpighfnkofjj/K5E59V1RVVmbn8DS11bcoSFYsnk4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac447e68-535e-49c3-7a29-08d6ed84e138
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 09:20:28.6006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHT1HTSH3197@gl.alps.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2279
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgUGFsaSwNCg0KV2UgcmVnaXN0ZXIgb3VyIENTMTkgZGV2aWNlIGFzIEFMUFNfT05MWV9UUkFD
S1NUSUNLIGRldmljZS4NCkFuZCBsZXQgdGhlIFY4IHByb3RvY29sIGZ1bmN0aW9uIHN1cHBvcnQg
dGhlIHByb2Nlc3Mgb2YgQUxQU19PTkxZX1RSQUNLU1RJQ0sgZGV2aWNlLiANCg0KSSB3YW50IHRv
IGNvbmZpcm0gaWYgdGhpcyBzb2x1dGlvbiBPSz8NCg0KWGlhb3hpYW8uTGl1DQotLS0tLemCruS7
tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IOWKiSDmm4nmm4kgWGlhb3hpYW8gTGl1IA0K5Y+R6YCB
5pe26Ze0OiBUdWVzZGF5LCBNYXkgMjgsIDIwMTkgMzo1NSBQTQ0K5pS25Lu25Lq6OiBQYWxpIFJv
aMOhciA8cGFsaS5yb2hhckBnbWFpbC5jb20+DQrmioTpgIE6IFhpYW9YaWFvIExpdSA8c2xpdXV4
aWFvbnhpYW9AZ21haWwuY29tPjsgZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbTsgcGV0ZXIuaHV0
dGVyZXJAd2hvLXQubmV0OyBodWkud2FuZ0BjYW5vbmljYWwuY29tOyBsaW51eC1pbnB1dEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOabuSDmm4nlu7ogWGlh
b2ppYW4gQ2FvIDx4aWFvamlhbi5jYW9AY24uYWxwcy5jb20+OyB6aGFuZ2ZwMUBsZW5vdm8uY29t
OyDmlonol6Qg55u05qi5IE5hb2tpIFNhaXRvIDxuYW9raS5zYWl0b0BhbHBzYWxwaW5lLmNvbT47
IOW3neeArCDoi7HlpKsgSGlkZW8gS2F3YXNlIDxoaWRlby5rYXdhc2VAYWxwc2FscGluZS5jb20+
DQrkuLvpopg6IOetlOWkjTog562U5aSNOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNz
dWUgYWxwcyBjczE5IHRyYWNrc3RpY2sgZG8gbm90IHdvcmsuDQoNCkFkZCBLYXdhc2Utc2FuLg0K
DQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IFBhbGkgUm9ow6FyIDxwYWxpLnJv
aGFyQGdtYWlsLmNvbT4gDQrlj5HpgIHml7bpl7Q6IFR1ZXNkYXksIE1heSAyOCwgMjAxOSAzOjE4
IFBNDQrmlLbku7bkuro6IOWKiSDmm4nmm4kgWGlhb3hpYW8gTGl1IDx4aWFveGlhby5saXUtMUBj
bi5hbHBzLmNvbT4NCuaKhOmAgTogWGlhb1hpYW8gTGl1IDxzbGl1dXhpYW9ueGlhb0BnbWFpbC5j
b20+OyBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOyBwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ7
IGh1aS53YW5nQGNhbm9uaWNhbC5jb207IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg5pu5IOabieW7uiBYaWFvamlhbiBDYW8gPHhpYW9q
aWFuLmNhb0Bjbi5hbHBzLmNvbT47IHpoYW5nZnAxQGxlbm92by5jb207IOaWieiXpCDnm7TmqLkg
TmFva2kgU2FpdG8gPG5hb2tpLnNhaXRvQGFscHNhbHBpbmUuY29tPg0K5Li76aKYOiBSZTog562U
5aSNOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxwcyBjczE5IHRyYWNrc3Rp
Y2sgZG8gbm90IHdvcmsuDQoNCk9uIFR1ZXNkYXkgMjggTWF5IDIwMTkgMDE6Mzc6MTQgWGlhb3hp
YW8gTGl1IHdyb3RlOg0KPiBBZGQgU2FpdG8tc2FuLg0KPiANCj4gSGkgSHVpLA0KPiBEb2VzIGl0
IG1lYW4gdGhhdCB5b3VyIGRldmljZSAocmVwb3J0ZWQgdG8ga2VybmVsKSBzZW5kcyBvbmx5IHRy
YWNrc3RpY2sgcGFja2V0cyBhbmQgbm90IHRvdWNocGFkPw0KPiAgICAJLT4gWWVzLg0KDQpPaywg
SSB0aGluayB0aGlzIGFuc3dlcnMgYWxsIHF1ZXN0aW9ucy4NCg0KU28geW91ciBwYXRjaCBpcyBu
b3QgY29ycmVjdCBhcyBpdCByZWdpc3RlcnMgImZha2UiIHRvdWNocGFkIGRldmljZSBldmVuIHRo
ZXJlIGlzIG5vIHRvdWNocGFkIGF0IGFsbC4NCg0KWW91IHNob3VsZCBmaXggeW91ciBwYXRjaCB0
byBub3QgcmVnaXN0ZXIgdG91Y2hwYWQgaW5wdXQgZGV2aWNlLCBpbiB5b3VyIGNhc2UgaXQgc2hv
dWxkIHJlZ2lzdGVyIG9ubHkgdHJhY2tzdGljayBkZXZpY2UuIEkgc3VnZ2VzdCB0byBhZGQgc29t
ZSBmbGFnIHdoaWNoIHdvdWxkIGluZGljYXRlIHN1Y2ggZGV2aWNlIChlLmcuIEFMUFNfT05MWV9U
UkFDS1NUSUNLKS4NCg0KQWxzbyBjdXJyZW50bHkga2VybmVsIGV4cG9ydHMgZm9sbG93aW5nIG5h
bWVzIHdoZW4gZGV2aWNlIGhhcyBib3RoIHRyYWNrc3RpY2sgYW5kIHRvdWNocGFkOiAiRHVhbFBv
aW50IFN0aWNrIiBhbmQgIkR1YWxQb2ludCBUb3VjaFBhZCIuDQpBbmQgaXQgZXhwb3J0cyBuYW1l
ICJHbGlkZVBvaW50IiBmb3IgdG91Y2hwYWQtb25seSBkZXZpY2UuIFNvIHRvIGJlIGNvbnNpc3Rl
bnQgeW91IG5lZWQgdG8gYWxzbyBtb2RpZnkgdGhpcyBjb2RlIGZvciB0cmFja3N0aWNrLW9ubHkg
ZGV2aWNlLg0KDQotLQ0KUGFsaSBSb2jDoXINCnBhbGkucm9oYXJAZ21haWwuY29tDQo=
