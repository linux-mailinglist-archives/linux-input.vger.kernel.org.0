Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C372724551
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 03:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfEUBHG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 21:07:06 -0400
Received: from mail-eopbgr1410052.outbound.protection.outlook.com ([40.107.141.52]:46962
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726928AbfEUBHG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 21:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gWWefPYn1Ud17ydVwR/98MdHpRUne1bWBmwBg4MrV4=;
 b=KXYbB/C8Db1dA/aLGF9JEYk5QbfUOhXdKeoseJlwblBTkybunpHstRrd/SLGDu25WoqAzb8qQ3GFwYL+NI++VnL1kMwVqWRLuG/wYJ2NfgGn1uFfVy4HJjwcL1Sq+460ZdHDksddy6kxr09qP8q8WV1vux0RfhU/inZfcUIF+9g=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB3768.jpnprd01.prod.outlook.com (20.178.96.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 01:07:01 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 01:07:01 +0000
From:   Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
To:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "pali.rohar@gmail.com" <pali.rohar@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hui.wang@canonical.com" <hui.wang@canonical.com>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBpbnB1dDogYWxwcy1maXggdGhlIGlzc3VlIHRoZSBz?=
 =?gb2312?Q?pecial_alps_trackpoint_do_not_work.?=
Thread-Topic: [PATCH] input: alps-fix the issue the special alps trackpoint do
 not work.
Thread-Index: AQHVDvtxe2iJHKzC10imt2bM9M4jiKZ0xAKQ
Date:   Tue, 21 May 2019 01:07:01 +0000
Message-ID: <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
In-Reply-To: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0573503c-c1c8-423c-d935-08d6dd88a1a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3768;
x-ms-traffictypediagnostic: OSBPR01MB3768:
x-microsoft-antispam-prvs: <OSBPR01MB37686958CA18821610F7DA81DA070@OSBPR01MB3768.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(76176011)(7696005)(99286004)(52536014)(54906003)(73956011)(66946007)(64756008)(66556008)(66476007)(305945005)(66446008)(76116006)(224303003)(110136005)(7736002)(14454004)(5660300002)(102836004)(6506007)(6116002)(3846002)(25786009)(74316002)(33656002)(2501003)(14444005)(256004)(66574012)(66066001)(71200400001)(68736007)(71190400001)(85182001)(9686003)(4326008)(478600001)(26005)(55016002)(316002)(81166006)(2906002)(53936002)(6436002)(186003)(8936002)(11346002)(81156014)(86362001)(476003)(446003)(486006)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB3768;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OjrXA8IBgNnLHy7X2ED1lIbGxmeHQtqBuRRgfYauk00GqUCwBv8IXkZ+N4zC7P3yM4VMlSzMCcEyMA+k8Lv7w+/0MiKC1OKJYoxvhoUlvhPG4bMFAkCyzPd++BNuc0b9PJwudf1nK1BngZZBzKbkyBK+SLD9+SeDlHgFXK/PXdPA3a1KMKnS/sxAVchepdiQ/d4GuqqJxjmaQbn363rC1RHwOl6zMQ0PL4zAPp7Uky2bSeZQ7d/VYQRhoO1KEgs95OEQh6IirwFBdmVItlbPn2VwXV7c2yG5daCV/ctkyDGdcPW0E0UtCIKAG4dcEovAKG0YvFlIDxLPSiI3FqimZ43i3b/uqSRyZ5WKTVGH0+2hmtryhZEVUm80N0roNr7dcgQKEw/2nn6m0O+z38zdbWf/heqIdeLy3pXnnNYvnRg=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573503c-c1c8-423c-d935-08d6dd88a1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 01:07:01.4828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3768
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QWRkIFBhbGkgUm9oqKJyLg0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogWGlhb1hpYW8g
TGl1IDxzbGl1dXhpYW9ueGlhb0BnbWFpbC5jb20+IA0Kt6LLzcqxvOQ6IE1vbmRheSwgTWF5IDIw
LCAyMDE5IDc6MDIgUE0NCsrVvP7IyzogZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbQ0Ks63LzTog
bGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBodWkud2FuZ0BjYW5vbmljYWwuY29tOyCy3CCV1L2oIFhpYW9qaWFuIENhbyA8eGlhb2ppYW4u
Y2FvQGNuLmFscHMuY29tPjsgemhhbmdmcDFAbGVub3ZvLmNvbTsghKIgldSV1CBYaWFveGlhbyBM
aXUgPHhpYW94aWFvLmxpdS0xQGNuLmFscHMuY29tPjsgWGlhb1hpYW8gTGl1IDxzbGl1dXhpYW9u
eGlhb0BnbWFpbC5jb20+DQrW98ziOiBbUEFUQ0hdIGlucHV0OiBhbHBzLWZpeCB0aGUgaXNzdWUg
dGhlIHNwZWNpYWwgYWxwcyB0cmFja3BvaW50IGRvIG5vdCB3b3JrLg0KDQp3aGVuIHRoZSBhbHBz
IHRyYWNrcG9pbnQgaXMgZGV0ZWN0ZWQgYW5kIHVzaW5nIHRoZSBhbHBzX3Y4X3Byb3RvY29sX2Rh
dGEgcHJvY290b2wsIHRoZSBhbHBzIGRyaXZlciB3aWxsIG5vdCByZXBvcnQgdGhlIGlucHV0IGRh
dGEuDQoNCnNvbHV0aW9uOiB1c2Ugc3RhbmRhcmQgbW91c2UgZHJpdmVyIGluc3RlYWQgb2YgYWxw
cyBkcml2ZXIgd2hlbiB0aGUgc3BlY2FpbCB0cmFja3BvaW50IHdhcyBkZXRlY3RlZC4NCg0KU2ln
bmVkLW9mZi1ieTogWGlhb1hpYW8gTGl1IDxzbGl1dXhpYW9ueGlhb0BnbWFpbC5jb20+DQotLS0N
CiBkcml2ZXJzL2lucHV0L21vdXNlL2FscHMuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKyst
DQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbW91c2UvYWxwcy5jIGIvZHJpdmVycy9pbnB1dC9tb3Vz
ZS9hbHBzLmMgaW5kZXggMGE2ZjdjYTg4M2U3Li41MTZhZTFkMGViMTcgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2lucHV0L21vdXNlL2FscHMuYw0KKysrIGIvZHJpdmVycy9pbnB1dC9tb3VzZS9hbHBz
LmMNCkBAIC0yNCw3ICsyNCw3IEBADQogDQogI2luY2x1ZGUgInBzbW91c2UuaCINCiAjaW5jbHVk
ZSAiYWxwcy5oIg0KLQ0KKyNpbmNsdWRlICJ0cmFja3BvaW50LmgiDQogLyoNCiAgKiBEZWZpbml0
aW9ucyBmb3IgQUxQUyB2ZXJzaW9uIDMgYW5kIDQgY29tbWFuZCBtb2RlIHByb3RvY29sDQogICov
DQpAQCAtMjg2NCw2ICsyODY0LDIyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWxwc19wcm90b2Nv
bF9pbmZvICphbHBzX21hdGNoX3RhYmxlKHVuc2lnbmVkIGNoYXIgKmU3LA0KIAlyZXR1cm4gTlVM
TDsNCiB9DQogDQoraW50IGFscHNfY2hlY2tfaXNfdHJhY2twb2ludChzdHJ1Y3QgcHNtb3VzZSAq
cHNtb3VzZSkgew0KKwl1OCBwYXJhbVsyXSA9IHsgMCB9Ow0KKwlpbnQgZXJyb3I7DQorDQorCWVy
cm9yID0gcHMyX2NvbW1hbmQoJnBzbW91c2UtPnBzMmRldiwNCisJCQkgICAgcGFyYW0sIE1BS0Vf
UFMyX0NNRCgwLCAyLCBUUF9SRUFEX0lEKSk7DQorCWlmIChlcnJvcikNCisJCXJldHVybiBlcnJv
cjsNCisNCisJaWYgKHBhcmFtWzBdID09IFRQX1ZBUklBTlRfQUxQUykNCisJCXJldHVybiAwOw0K
Kwlwc21vdXNlX3dhcm4ocHNtb3VzZSwgIkl0IGlzIG5vdCBhbHBzIHRyYWNrcG9pbnQuXG4iKTsN
CisJcmV0dXJuIC1FTk9ERVY7DQorfQ0KKw0KIHN0YXRpYyBpbnQgYWxwc19pZGVudGlmeShzdHJ1
Y3QgcHNtb3VzZSAqcHNtb3VzZSwgc3RydWN0IGFscHNfZGF0YSAqcHJpdikgIHsNCiAJY29uc3Qg
c3RydWN0IGFscHNfcHJvdG9jb2xfaW5mbyAqcHJvdG9jb2w7IEBAIC0yOTEyLDYgKzI5MjgsMTEg
QEAgc3RhdGljIGludCBhbHBzX2lkZW50aWZ5KHN0cnVjdCBwc21vdXNlICpwc21vdXNlLCBzdHJ1
Y3QgYWxwc19kYXRhICpwcml2KQ0KIAkJCXByb3RvY29sID0gJmFscHNfdjNfcHJvdG9jb2xfZGF0
YTsNCiAJCX0gZWxzZSBpZiAoZTdbMF0gPT0gMHg3MyAmJiBlN1sxXSA9PSAweDAzICYmDQogCQkJ
ICAgKGU3WzJdID09IDB4MTQgfHwgZTdbMl0gPT0gMHgyOCkpIHsNCisJCQkJaWYgKGFscHNfY2hl
Y2tfaXNfdHJhY2twb2ludChwc21vdXNlKSA9PSAwKSB7DQorCQkJCQlwc21vdXNlX3dhcm4ocHNt
b3VzZSwNCisJCQkJCSJJdCBpcyBhbHBzIHRyYWNrcG9pbnQsIHVzZSB0aGUgc3RhbmRhcmQgbW91
c2UgZHJpdmVyLlxuIik7DQorCQkJCQlyZXR1cm4gLUVJTlZBTDsNCisJCQkJfQ0KIAkJCXByb3Rv
Y29sID0gJmFscHNfdjhfcHJvdG9jb2xfZGF0YTsNCiAJCX0gZWxzZSBpZiAoZTdbMF0gPT0gMHg3
MyAmJiBlN1sxXSA9PSAweDAzICYmIGU3WzJdID09IDB4YzgpIHsNCiAJCQlwcm90b2NvbCA9ICZh
bHBzX3Y5X3Byb3RvY29sX2RhdGE7DQotLQ0KMi4yMC4xDQoNCg==
