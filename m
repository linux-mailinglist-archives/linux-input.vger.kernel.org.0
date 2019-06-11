Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E94763C178
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 05:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390856AbfFKDFV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 23:05:21 -0400
Received: from mail-eopbgr1400042.outbound.protection.outlook.com ([40.107.140.42]:35363
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390817AbfFKDFV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 23:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbQQWGnEyr9jjITUxvH9Gkklbz6TKHQJMSJhsn0dq4o=;
 b=qGmKCv0oKL67BglKhvcepjFo37FEb2iudONXN/nCXDdxjzXteZAyTaIXnPAB9RZkgjVL6JDmxSid1paz/wQJSZGDowyP+6jGU2NCLKcH2MXhG5frwPOb8CVblmjQG9tt5VfCtRX9KiJ7QMicoePMabArXyBKVN4pZIf8mf6mwFo=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB4696.jpnprd01.prod.outlook.com (20.179.183.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Tue, 11 Jun 2019 03:05:17 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 03:05:16 +0000
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
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIXSBpbnB1dDogYWxwcy1m?=
 =?utf-8?Q?ix_the_issue_alps_cs19_trackstick_do_not_work.?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6IGFscHMtZml4IHRoZSBp?=
 =?utf-8?Q?ssue_alps_cs19_trackstick_do_not_work.?=
Thread-Index: AQHVFHDIBpbm29Y830SbHnb/dbnRc6Z+v5aAgAD+tvCAAGPlAIAACjKQgBSAfaCAABHEQIAACxEAgAEIgSA=
Date:   Tue, 11 Jun 2019 03:05:16 +0000
Message-ID: <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190610104310.qa5snt7jpcljodfv@pali>
In-Reply-To: <20190610104310.qa5snt7jpcljodfv@pali>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f689e6f9-620d-4a6d-48a2-08d6ee19a172
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4696;
x-ms-traffictypediagnostic: OSBPR01MB4696:
x-microsoft-antispam-prvs: <OSBPR01MB46969B67CCE70B5937A44168DAED0@OSBPR01MB4696.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(66446008)(66556008)(73956011)(66946007)(76116006)(33656002)(64756008)(26005)(85182001)(99286004)(316002)(68736007)(66476007)(256004)(7736002)(305945005)(224303003)(52536014)(81156014)(8936002)(81166006)(54906003)(6506007)(14444005)(4326008)(102836004)(71190400001)(14454004)(478600001)(71200400001)(86362001)(2906002)(107886003)(446003)(11346002)(53936002)(25786009)(6116002)(6436002)(66574012)(3846002)(74316002)(486006)(476003)(6916009)(9686003)(186003)(7696005)(5660300002)(76176011)(66066001)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB4696;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dKLatEaEPSja0xLs6X9XsJfbGUxlRvjFpPWptQZmZuMkcI4Dbg0Fhr10Yi3y2Py8AGsDk2dkfJFX3bwyCPGVsweWvxHVxdh/tLDNonyXK1hIIjI3AtvKezg6fYCNoB81rRu5gnFQtJPF/f2rVospgTI4E8dwu6TDPOR14fF4IAQSSWukzRA6gSDL1DA1MduDAc0K9GzAjFb7cvN1rObMRINApc14Le9TNpjnqox5Tv73YrZzMnZPjjah4zoSQwxAtq2IahvD/NxFgEY4gli6CamXgmPZbZxfLXPRD6oNxsmlhVG4hvh6jH3Xsoo3H46MPz44UG3+F2mD/5HFuPx3C4poL011em42KQ3f0fYzCwxHf/EYax+gbqh/TpA2UIsflN1LxEWAXHdcst54gkXzIwuWcQyn24/BxiNMw1wR2fM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f689e6f9-620d-4a6d-48a2-08d6ee19a172
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 03:05:16.7839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHT1HTSH3197@gl.alps.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4696
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgUGFsaSwNCg0KSSBkaXNjdXNzZWQgd2l0aCBvdXIgRlcgdGVhbSBhYm91dCB0aGlzIHByb2Js
ZW0uDQpXZSB0aGluayB0aGUgVjggbWV0aG9kIG1lYW5zIGEgdG91Y2hwYWQgZmVhdHVyZSAgYW5k
IGRvZXMgbm90IGZpdCB0aGUgQ1MxOSB0cmFja3BvaW50IGRldmljZS4gDQpDUzE5IFRyYWNrUG9p
bnQgbmVlZG4ndCAgdXNlIGFueSBBYnNvbHV0ZSAoUmF3KSBtb2RlIGFuZCBpcyB1c3VhbGx5IHVz
ZSBzdGFuZGFyZCBtb3VzZSBkYXRhLg0KQ1MxOSBUcmFja1BvaW50IGRldmljZSBpcyBhIGNvbXBs
ZXRlbHkgZGlmZmVyZW50IGRldmljZSB3aXRoIER1YWxQb2ludCBkZXZpY2Ugb2YgRGVsbC9IUC4N
CkNTMTkgVHJhY2tQb2ludCBkZXZpY2UgaXMgaW5kZXBlbmRlbnQgIG9mIFRvdWNocGFkLiAoVG91
Y2hwYWQgaXMgY29ubmVjdGluZyBieSBJMkMsIFRyYWNrUG9pbnQgaXMgZGlyZWN0bHkgY29ubmVj
dGluZyB3aXRoIFBTMiBwb3J0LikNCkFuZCBpdCBoYXMgY29tcGxldGVseSBhbm90aGVyIEZXLiAN
Cg0KU28gd2UgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIHVzZSB0aGUgbW91c2UgbW9kZSBmb3IgQ1Mx
OSB0cmFja3BvaW50Lg0KDQpCZXN0IFJlZ2FyZHMNClNob25hDQotLS0tLemCruS7tuWOn+S7ti0t
LS0tDQrlj5Hku7bkuro6IFBhbGkgUm9ow6FyIDxwYWxpLnJvaGFyQGdtYWlsLmNvbT4gDQrlj5Hp
gIHml7bpl7Q6IE1vbmRheSwgSnVuZSAxMCwgMjAxOSA2OjQzIFBNDQrmlLbku7bkuro6IOWKiSDm
m4nmm4kgWGlhb3hpYW8gTGl1IDx4aWFveGlhby5saXUtMUBjbi5hbHBzLmNvbT4NCuaKhOmAgTog
WGlhb1hpYW8gTGl1IDxzbGl1dXhpYW9ueGlhb0BnbWFpbC5jb20+OyBkbWl0cnkudG9yb2tob3ZA
Z21haWwuY29tOyBwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ7IGh1aS53YW5nQGNhbm9uaWNhbC5j
b207IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsg5pu5IOabieW7uiBYaWFvamlhbiBDYW8gPHhpYW9qaWFuLmNhb0Bjbi5hbHBzLmNvbT47
IHpoYW5nZnAxQGxlbm92by5jb207IOaWieiXpCDnm7TmqLkgTmFva2kgU2FpdG8gPG5hb2tpLnNh
aXRvQGFscHNhbHBpbmUuY29tPjsg5bed54CsIOiLseWkqyBIaWRlbyBLYXdhc2UgPGhpZGVvLmth
d2FzZUBhbHBzYWxwaW5lLmNvbT4NCuS4u+mimDogUmU6IOetlOWkjTog562U5aSNOiBbUEFUQ0hd
IGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgYWxwcyBjczE5IHRyYWNrc3RpY2sgZG8gbm90IHdv
cmsuDQoNCk9uIE1vbmRheSAxMCBKdW5lIDIwMTkgMTA6MDM6NTEgWGlhb3hpYW8gTGl1IHdyb3Rl
Og0KPiBIaSBQYWxpLA0KDQpIaSENCg0KPiBXZSByZWdpc3RlciBvdXIgQ1MxOSBkZXZpY2UgYXMg
QUxQU19PTkxZX1RSQUNLU1RJQ0sgZGV2aWNlLg0KPiBBbmQgbGV0IHRoZSBWOCBwcm90b2NvbCBm
dW5jdGlvbiBzdXBwb3J0IHRoZSBwcm9jZXNzIG9mIEFMUFNfT05MWV9UUkFDS1NUSUNLIGRldmlj
ZS4gDQo+IA0KPiBJIHdhbnQgdG8gY29uZmlybSBpZiB0aGlzIHNvbHV0aW9uIE9LPw0KDQpZZXMs
IGl0IGlzIGZpbmUuIEp1c3QgbWFrZSBzdXJlIHRoYXQgdG91Y2hhcGFkIGlucHV0IGRldmljZSBp
cyBub3QgcmVnaXN0ZXJlZCB3aGVuIHRoaXMgQUxQU19PTkxZX1RSQUNLU1RJQ0sgZmxhZyBpcyBz
ZXQuIFNvIHVzZXJzcGFjZSB3b3VsZCBub3Qgc2VlIGFueSBmYWtlL3VuYXZhaWxhYmxlIHRvdWNo
cGFkIGlucHV0IGRldmljZS4NCg0KPiBYaWFveGlhby5MaXUNCg0KLS0NClBhbGkgUm9ow6FyDQpw
YWxpLnJvaGFyQGdtYWlsLmNvbQ0K
