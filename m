Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A249025BF9
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 04:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbfEVCx0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 22:53:26 -0400
Received: from mail-eopbgr1400073.outbound.protection.outlook.com ([40.107.140.73]:55779
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfEVCx0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 22:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6IQcRqbWIBGdBRtPTIEUaNMXRJeexbKw56BHSmoN50=;
 b=YoxdBiyn4obd7AaWg63HQI4Gb0T6L/ACdS/kOAW6u8UwsDwzwz+c+A4hbfE7hSI/DTFaRTSQHy1oYfJVZ2BbEn/EVwo27YIYp27HonIcmgU+H2y5HgPpIliNa+chXUEbxHCrN8pIA3WCiCvLauy2DfzD1g4iDO5B5yAHUo05dBg=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB5094.jpnprd01.prod.outlook.com (20.179.183.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Wed, 22 May 2019 02:53:18 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 02:53:18 +0000
From:   Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
To:     =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>,
        Hui Wang <hui.wang@canonical.com>
CC:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6IGFscHMtZml4IHRoZSBp?=
 =?utf-8?Q?ssue_the_special_alps_trackpoint_do_not_work.?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUgdGhl?=
 =?utf-8?Q?_special_alps_trackpoint_do_not_work.?=
Thread-Index: AQHVDvtxe2iJHKzC10imt2bM9M4jiKZ0xAKQgAAXToCAAHrRAIABD1UQ
Date:   Wed, 22 May 2019 02:53:18 +0000
Message-ID: <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
In-Reply-To: <20190521094622.syeub6tcqhbyc7sg@pali>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6295f758-5240-42ed-746d-08d6de60a50d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5094;
x-ms-traffictypediagnostic: OSBPR01MB5094:
x-microsoft-antispam-prvs: <OSBPR01MB5094C2B56AA5EEA6CB2840E6DA000@OSBPR01MB5094.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(366004)(376002)(39860400002)(199004)(189003)(33656002)(85182001)(7736002)(99286004)(305945005)(76176011)(7696005)(256004)(14444005)(68736007)(9686003)(6436002)(55016002)(66476007)(66946007)(73956011)(66446008)(316002)(76116006)(64756008)(6506007)(66556008)(102836004)(224303003)(25786009)(66066001)(71200400001)(71190400001)(53936002)(8936002)(74316002)(14454004)(4326008)(81166006)(81156014)(11346002)(52536014)(478600001)(486006)(66574012)(476003)(3846002)(6116002)(2906002)(186003)(54906003)(5660300002)(26005)(110136005)(446003)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB5094;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /5wFVc9b+5dXRhyKCYmWkBoQTf1tzqsgWRG+Uv8FWaeR1cMjaRHLrNcVHenx5sRmpi1bWTVXIlvqiyVBy57G9NG6+tw5kifjRDzuWSQWfvg7L2V45mMNmeUX2L62LesZqFq22EEVBg3Ugb/r8gZdDFDdDDMA5RZxq3rdGRbUTxkJ8RbgNJM3gzqWoPM5cMGEU+mn/a1Mh8qc1XqH0FvScp6P0Bl7B4XmVeLKcKq3A5tCKMUdkdK2QB0s5t+cTEy0GW6xZatdFfT6z+r6G/Y4zxJ8rmSCZEq7zlUcq952l+0PG9Z+1alTYLNt5PIb57rz7YopuVpvZ/P+2Tmo/RVZAs48sgXYwHVyMERLNYl7lf6X1FAAqgVjH9TGfbjakYeDG54iFyYKhWZI287FnCi8uj4oezOaKK8DZJkRocaQNC0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6295f758-5240-42ed-746d-08d6de60a50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 02:53:18.4734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5094
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgUGFsaSwNCg0KV2h5IGl0IGRvZXMgbm90IHJlcG9ydCBpbnB1dCBkYXRhPw0KLS0+IFRoZSBh
bHBzIGRldmljZXMgd2hpY2ggZGV0ZWN0ZWQgdG8gdXNlIHRoZSBBTFBTX1BST1RPX1Y4ICBjb250
YWlucyBBTFBTIHRvdWNocGFkIGFuZCBBTFBTIHRyYWNrIHBvaW50LiANCiAgICAgQnV0IHRoZSBB
TFBTX1BST1RPX1Y4IGRvIG5vdCBzdXBwb3J0IHRoZSB0cmFjayBwb2ludCBkZXZpY2UgcHJvY2Vz
cy4gDQogICAgIFdoZW4gdGhlIHRyYWNrIHBvaW50IHdhcyBkZXRlY3RlZCB0byB1c2UgQUxQU19Q
Uk9UT19WOCAsdGhlIHY4IHByb2Nlc3NfcGFja2V0IG1ldGhvZCAgYWxwc19wcm9jZXNzX3BhY2tl
dF9zczRfdjIgd2lsbCByZWplY3QgdG8gcmVwb3J0IHRoZSBkYXRhIGJlY2F1c2UgdGhlIHY4IGRl
dmljZSBpcyAgICAgIG5vdCBzZXQgdGhlIEFMUFNfRFVBTFBPSU5UIGZsYWcuIA0KICAgICBZb3Ug
Y2FuIHJlZmVyIGJlbG93IGNvZGUuDQoNCgkvKiBSZXBvcnQgdHJhY2tzdGljayAqLw0KCWlmIChh
bHBzX2dldF9wa3RfaWRfc3M0X3YyKHBhY2tldCkgPT0gU1M0X1BBQ0tFVF9JRF9TVElDSykgew0K
CQlpZiAoIShwcml2LT5mbGFncyAmIEFMUFNfRFVBTFBPSU5UKSkgew0KCQkJcHNtb3VzZV93YXJu
KHBzbW91c2UsDQoJCQkJICAgICAiUmVqZWN0ZWQgdHJhY2tzdGljayBwYWNrZXQgZnJvbSBub24g
RHVhbFBvaW50IGRldmljZSIpOw0KCQkJcmV0dXJuOw0KCQl9DQoJCS4uLg0KCQlyZXR1cm47DQoJ
fQ0KDQp3aHkgaXMgZm9yIG5vbi1BTFBTIHRyYWNrcG9pbnRzIHVzZWQgQUxQUyBkcml2ZXI/DQot
LT4gdGhlIG5vbi1BbHBzIHRyYWNrIHBvaW50IGlzIHRoZSBBTFBTIHRvdWNocGFkLCBpdCBpcyBy
aWdodCB0byB1c2UgdGhlIEFMUFMgZHJpdmVyIGZvciBBTFBTIHRvdWNocGFkLg0KDQpUaGUgdjgg
cHJvdG9jb2wgY29uZGl0aW9uIG1heSBtb2RpZmllZCAgYXMgYmVsb3csIGl0IHdpbGwgYmUgbW9y
ZSBlYXNpZXIgdG8gdW5kZXJzdGFuZC4NCg0KCSBpZiAoZTdbMF0gPT0gMHg3MyAmJiBlN1sxXSA9
PSAweDAzICYmIChlN1syXSA9PSAweDE0IHx8IGU3WzJdID09IDB4MjgpICYmICAoYWxwc19jaGVj
a19pc190cmFja3BvaW50KHBzbW91c2UpICE9IDApICApIHsNCiAJCXByb3RvY29sID0gJmFscHNf
djhfcHJvdG9jb2xfZGF0YTsNCgl9DQoNCkJlc3QgUmVnYXJkcw0KWGlhb1hpYW8gTGl1DQpzbGl1
dXhpYW9ueGlhb0BnbWFpbC5jb20NCnhpYW94aWFvLmxpdS0xQGNuLmFscHMuY29tDQoNCi0tLS0t
6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogUGFsaSBSb2jDoXIgPHBhbGkucm9oYXJAZ21h
aWwuY29tPiANCuWPkemAgeaXtumXtDogVHVlc2RheSwgTWF5IDIxLCAyMDE5IDU6NDYgUE0NCuaU
tuS7tuS6ujogSHVpIFdhbmcgPGh1aS53YW5nQGNhbm9uaWNhbC5jb20+DQrmioTpgIE6IOWKiSDm
m4nmm4kgWGlhb3hpYW8gTGl1IDx4aWFveGlhby5saXUtMUBjbi5hbHBzLmNvbT47IFhpYW9YaWFv
IExpdSA8c2xpdXV4aWFvbnhpYW9AZ21haWwuY29tPjsgZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNv
bTsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyDmm7kg5puJ5bu6IFhpYW9qaWFuIENhbyA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjsg
emhhbmdmcDFAbGVub3ZvLmNvbQ0K5Li76aKYOiBSZTog562U5aSNOiBbUEFUQ0hdIGlucHV0OiBh
bHBzLWZpeCB0aGUgaXNzdWUgdGhlIHNwZWNpYWwgYWxwcyB0cmFja3BvaW50IGRvIG5vdCB3b3Jr
Lg0KDQpIZWxsbyENCg0KT24gVHVlc2RheSAyMSBNYXkgMjAxOSAxMDoyNjo0NyBIdWkgV2FuZyB3
cm90ZToNCj4gVGVzdGVkLWJ5OiBIdWkgV2FuZyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT4NCj4g
DQo+IE9uIDIwMTkvNS8yMSDkuIrljYg5OjA3LCBYaWFveGlhbyBMaXUgd3JvdGU6DQo+ID4gQWRk
IFBhbGkgUm9ow6FyLg0KPiA+IA0KPiA+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCj4gPiDlj5Hk
u7bkuro6IFhpYW9YaWFvIExpdSA8c2xpdXV4aWFvbnhpYW9AZ21haWwuY29tPg0KPiA+IOWPkemA
geaXtumXtDogTW9uZGF5LCBNYXkgMjAsIDIwMTkgNzowMiBQTQ0KPiA+IOaUtuS7tuS6ujogZG1p
dHJ5LnRvcm9raG92QGdtYWlsLmNvbQ0KPiA+IOaKhOmAgTogbGludXgtaW5wdXRAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyANCj4gPiBodWkud2FuZ0BjYW5v
bmljYWwuY29tOyDmm7kg5puJ5bu6IFhpYW9qaWFuIENhbyANCj4gPiA8eGlhb2ppYW4uY2FvQGNu
LmFscHMuY29tPjsgemhhbmdmcDFAbGVub3ZvLmNvbTsg5YqJIOabieabiSBYaWFveGlhbyBMaXUg
DQo+ID4gPHhpYW94aWFvLmxpdS0xQGNuLmFscHMuY29tPjsgWGlhb1hpYW8gTGl1IA0KPiA+IDxz
bGl1dXhpYW9ueGlhb0BnbWFpbC5jb20+DQo+ID4g5Li76aKYOiBbUEFUQ0hdIGlucHV0OiBhbHBz
LWZpeCB0aGUgaXNzdWUgdGhlIHNwZWNpYWwgYWxwcyB0cmFja3BvaW50IGRvIG5vdCB3b3JrLg0K
PiA+IA0KPiA+IHdoZW4gdGhlIGFscHMgdHJhY2twb2ludCBpcyBkZXRlY3RlZCBhbmQgdXNpbmcg
dGhlIA0KPiA+IGFscHNfdjhfcHJvdG9jb2xfZGF0YSBwcm9jb3RvbCwgdGhlIGFscHMgZHJpdmVy
IHdpbGwgbm90IHJlcG9ydCB0aGUgaW5wdXQgZGF0YS4NCg0KV2h5IGl0IGRvZXMgbm90IHJlcG9y
dCBpbnB1dCBkYXRhPw0KDQo+ID4gc29sdXRpb246IHVzZSBzdGFuZGFyZCBtb3VzZSBkcml2ZXIg
aW5zdGVhZCBvZiBhbHBzIGRyaXZlciB3aGVuIHRoZSBzcGVjYWlsIHRyYWNrcG9pbnQgd2FzIGRl
dGVjdGVkLg0KDQpUaGlzIGxvb2tzIGxpa2UgYW4gKHVuZG9jdW1lbnRlZCkgaGFjayBvciB3b3Jr
YXJvdW5kLiBOb3QgYSBzb2x1dGlvbi4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW9YaWFvIExp
dSA8c2xpdXV4aWFvbnhpYW9AZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9pbnB1
dC9tb3VzZS9hbHBzLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9tb3VzZS9hbHBzLmMgYi9kcml2ZXJzL2lucHV0L21vdXNl
L2FscHMuYyANCj4gPiBpbmRleCAwYTZmN2NhODgzZTcuLjUxNmFlMWQwZWIxNyAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2lucHV0L21vdXNlL2FscHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaW5w
dXQvbW91c2UvYWxwcy5jDQo+ID4gQEAgLTI0LDcgKzI0LDcgQEANCj4gPiAgICNpbmNsdWRlICJw
c21vdXNlLmgiDQo+ID4gICAjaW5jbHVkZSAiYWxwcy5oIg0KPiA+IC0NCj4gPiArI2luY2x1ZGUg
InRyYWNrcG9pbnQuaCINCj4gPiAgIC8qDQo+ID4gICAgKiBEZWZpbml0aW9ucyBmb3IgQUxQUyB2
ZXJzaW9uIDMgYW5kIDQgY29tbWFuZCBtb2RlIHByb3RvY29sDQo+ID4gICAgKi8NCj4gPiBAQCAt
Mjg2NCw2ICsyODY0LDIyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWxwc19wcm90b2NvbF9pbmZv
ICphbHBzX21hdGNoX3RhYmxlKHVuc2lnbmVkIGNoYXIgKmU3LA0KPiA+ICAgCXJldHVybiBOVUxM
Ow0KPiA+ICAgfQ0KPiA+ICtpbnQgYWxwc19jaGVja19pc190cmFja3BvaW50KHN0cnVjdCBwc21v
dXNlICpwc21vdXNlKSB7DQo+ID4gKwl1OCBwYXJhbVsyXSA9IHsgMCB9Ow0KPiA+ICsJaW50IGVy
cm9yOw0KPiA+ICsNCj4gPiArCWVycm9yID0gcHMyX2NvbW1hbmQoJnBzbW91c2UtPnBzMmRldiwN
Cj4gPiArCQkJICAgIHBhcmFtLCBNQUtFX1BTMl9DTUQoMCwgMiwgVFBfUkVBRF9JRCkpOw0KPiA+
ICsJaWYgKGVycm9yKQ0KPiA+ICsJCXJldHVybiBlcnJvcjsNCj4gPiArDQo+ID4gKwlpZiAocGFy
YW1bMF0gPT0gVFBfVkFSSUFOVF9BTFBTKQ0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsJcHNtb3Vz
ZV93YXJuKHBzbW91c2UsICJJdCBpcyBub3QgYWxwcyB0cmFja3BvaW50LlxuIik7DQo+ID4gKwly
ZXR1cm4gLUVOT0RFVjsNCj4gPiArfQ0KDQpTbywgdGhpcyBmdW5jdGlvbiByZXR1cm5zIDAgd2hl
biBkZXRlY3RlZCBBTFBTIHRyYWNrcG9pbnQgYW5kIC1FTk9ERVYgd2hlbiBub3QuDQoNCj4gPiAr
DQo+ID4gICBzdGF0aWMgaW50IGFscHNfaWRlbnRpZnkoc3RydWN0IHBzbW91c2UgKnBzbW91c2Us
IHN0cnVjdCBhbHBzX2RhdGEgKnByaXYpICB7DQo+ID4gICAJY29uc3Qgc3RydWN0IGFscHNfcHJv
dG9jb2xfaW5mbyAqcHJvdG9jb2w7IEBAIC0yOTEyLDYgKzI5MjgsMTEgQEAgc3RhdGljIGludCBh
bHBzX2lkZW50aWZ5KHN0cnVjdCBwc21vdXNlICpwc21vdXNlLCBzdHJ1Y3QgYWxwc19kYXRhICpw
cml2KQ0KPiA+ICAgCQkJcHJvdG9jb2wgPSAmYWxwc192M19wcm90b2NvbF9kYXRhOw0KPiA+ICAg
CQl9IGVsc2UgaWYgKGU3WzBdID09IDB4NzMgJiYgZTdbMV0gPT0gMHgwMyAmJg0KPiA+ICAgCQkJ
ICAgKGU3WzJdID09IDB4MTQgfHwgZTdbMl0gPT0gMHgyOCkpIHsNCj4gPiArCQkJCWlmIChhbHBz
X2NoZWNrX2lzX3RyYWNrcG9pbnQocHNtb3VzZSkgPT0gMCkgew0KPiA+ICsJCQkJCXBzbW91c2Vf
d2Fybihwc21vdXNlLA0KPiA+ICsJCQkJCSJJdCBpcyBhbHBzIHRyYWNrcG9pbnQsIHVzZSB0aGUg
c3RhbmRhcmQgbW91c2UgZHJpdmVyLlxuIik7DQo+ID4gKwkJCQkJcmV0dXJuIC1FSU5WQUw7DQoN
CkFuZCBoZXJlIEknbSBsb3N0LiBJZiB3ZSBoYXZlICpub3QqIGRldGVjdGVkIEFMUFMgdHJhY2tw
b2ludCB0aGVuIGlmIGJsb2NrIGlzIG5vdCBjYWxsZWQgd2hpY2ggbWVhbnMgdGhhdCBBTFBTIGRy
aXZlciBpcyB1c2VkLg0KDQpTbyB3aHkgaXMgZm9yIG5vbi1BTFBTIHRyYWNrcG9pbnRzIHVzZWQg
QUxQUyBkcml2ZXI/IFRoaXMgZG9lcyBub3Qgc2VlbSBsaWtlIGEgY29ycmVjdC4uLg0KDQpBbmQg
d2hlbiB3ZSBoYXZlIGRldGVjdGVkIEFMUFMgdHJhY2twb2ludCAocmV0dXJuIHZhbHVlIDApIHRo
ZW4gc3RhbmRhcmQgbW91c2UgZHJpdmVyIGlzIHVzZWQgYW5kIHJldHVybmVkIC1FSU5WQUwuIFRo
aXMgc2VlbXMgc3RyYW5nZSB0b28uDQoNClNvIGVpdGhlciB0aGlzIGNvZGUgaXMgd3Jvbmcgb3Ig
dGhlcmUgYXJlIG1pc3NpbmcgbW9yZSBkZXRhaWxzIGZvciBleHBsYWluaW5nIHRoaXMgc3RyYW5n
ZSBsb2dpYy4gQnV0IHN0aWxsIHRoaXMgbG9va3MgbGlrZSBhIGhhY2sgbm90IGEgcHJvcGVyIGZp
eC9zb2x1dGlvbi4NCg0KPiA+ICsJCQkJfQ0KPiA+ICAgCQkJcHJvdG9jb2wgPSAmYWxwc192OF9w
cm90b2NvbF9kYXRhOw0KPiA+ICAgCQl9IGVsc2UgaWYgKGU3WzBdID09IDB4NzMgJiYgZTdbMV0g
PT0gMHgwMyAmJiBlN1syXSA9PSAweGM4KSB7DQo+ID4gICAJCQlwcm90b2NvbCA9ICZhbHBzX3Y5
X3Byb3RvY29sX2RhdGE7DQo+ID4gLS0NCj4gPiAyLjIwLjENCj4gPiANCg0KLS0NClBhbGkgUm9o
w6FyDQpwYWxpLnJvaGFyQGdtYWlsLmNvbQ0K
