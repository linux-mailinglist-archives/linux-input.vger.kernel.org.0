Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F542C0AC
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 09:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfE1HzR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 03:55:17 -0400
Received: from mail-eopbgr1400047.outbound.protection.outlook.com ([40.107.140.47]:1189
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726789AbfE1HzR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 03:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwSlEOWCNoe45J/dGWouGp0Nf7fTe7uHtmGKi9+R0EU=;
 b=AoJ+Nj6y95EdWe2s1wHavPMKsmTA4Gh9Yc5m2QEO2VQlkTW0xuP6H2bZ62UUaFYVB5K3ydYC3OUhlfS/2mkiiPIt1rlemM6GhoXRJcBD5M2jd28bneTXaQEr8ECH0eFTSNBY0nGbCsJuWXadJLt7o8C2CXg115/9861DAmpGCE0=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB4504.jpnprd01.prod.outlook.com (20.179.184.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 07:55:12 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::b583:e4e6:93db:38cb%4]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:55:12 +0000
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
Thread-Index: AQHVFHDIBpbm29Y830SbHnb/dbnRc6Z+v5aAgAD+tvCAAGPlAIAACjKQ
Date:   Tue, 28 May 2019 07:55:12 +0000
Message-ID: <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
In-Reply-To: <20190528071824.jimhixhtsynzwixe@pali>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 532930c9-4692-45bb-c3a9-08d6e341d044
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4504;
x-ms-traffictypediagnostic: OSBPR01MB4504:
x-microsoft-antispam-prvs: <OSBPR01MB450459396BA34623B5BF9315DA1E0@OSBPR01MB4504.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(39860400002)(396003)(136003)(199004)(189003)(71200400001)(68736007)(52536014)(33656002)(478600001)(446003)(9686003)(6916009)(74316002)(102836004)(55016002)(66946007)(6436002)(66476007)(66556008)(66446008)(64756008)(66066001)(5660300002)(486006)(224303003)(53936002)(76116006)(73956011)(85182001)(7696005)(107886003)(256004)(3846002)(81166006)(76176011)(86362001)(2906002)(11346002)(25786009)(6506007)(7736002)(99286004)(4326008)(6116002)(54906003)(316002)(8936002)(81156014)(476003)(14454004)(26005)(71190400001)(305945005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB4504;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gUn9tEqNG7iHihCF7KFSJTUHIpIJ7gAAfGHYU3eiBfxbTkT64AyU7MQN24kffeuwJl35WL+f1jvfGJo3+ccXEJ0FApOJ10ndXRFFkgKL7AzMolilKuPb6hF+BJDTC581ZDv0HsCF5BIQlLQaUcXYE31UdzDb2lH8+DjXgt6yW+gep63mrhevaW/hBUXLHps94eNX7/vJ3HwDYXPFruVP7Y2ddgPzSMHaWsPc7yqOPZbiFCSbZb9vAz6+B2jS5MbXWsa8EEjADSR5U816HFKOvaBpSQ4gNopPjj06OivPVbuxGxUrAoEU6ZTu/bi5QBAH31ydWHsrmGyak7S+9Q+zXt85ZqITW2SSYB7aGFv8eRyRgKsGnN3IRSt9UNV7F03piPzBS/q/9fvCIW2IJbnGViRvGQv74Nvh6f9tPMKkGiY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532930c9-4692-45bb-c3a9-08d6e341d044
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:55:12.4001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHT1HTSH3197@gl.alps.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4504
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QWRkIEthd2FzZS1zYW4uDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogUGFs
aSBSb2jDoXIgPHBhbGkucm9oYXJAZ21haWwuY29tPiANCuWPkemAgeaXtumXtDogVHVlc2RheSwg
TWF5IDI4LCAyMDE5IDM6MTggUE0NCuaUtuS7tuS6ujog5YqJIOabieabiSBYaWFveGlhbyBMaXUg
PHhpYW94aWFvLmxpdS0xQGNuLmFscHMuY29tPg0K5oqE6YCBOiBYaWFvWGlhbyBMaXUgPHNsaXV1
eGlhb254aWFvQGdtYWlsLmNvbT47IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb207IHBldGVyLmh1
dHRlcmVyQHdoby10Lm5ldDsgaHVpLndhbmdAY2Fub25pY2FsLmNvbTsgbGludXgtaW5wdXRAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyDmm7kg5puJ5bu6IFhp
YW9qaWFuIENhbyA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjsgemhhbmdmcDFAbGVub3ZvLmNv
bTsg5paJ6JekIOebtOaouSBOYW9raSBTYWl0byA8bmFva2kuc2FpdG9AYWxwc2FscGluZS5jb20+
DQrkuLvpopg6IFJlOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6IGFscHMtZml4IHRoZSBpc3N1ZSBh
bHBzIGNzMTkgdHJhY2tzdGljayBkbyBub3Qgd29yay4NCg0KT24gVHVlc2RheSAyOCBNYXkgMjAx
OSAwMTozNzoxNCBYaWFveGlhbyBMaXUgd3JvdGU6DQo+IEFkZCBTYWl0by1zYW4uDQo+IA0KPiBI
aSBIdWksDQo+IERvZXMgaXQgbWVhbiB0aGF0IHlvdXIgZGV2aWNlIChyZXBvcnRlZCB0byBrZXJu
ZWwpIHNlbmRzIG9ubHkgdHJhY2tzdGljayBwYWNrZXRzIGFuZCBub3QgdG91Y2hwYWQ/DQo+ICAg
IAktPiBZZXMuDQoNCk9rLCBJIHRoaW5rIHRoaXMgYW5zd2VycyBhbGwgcXVlc3Rpb25zLg0KDQpT
byB5b3VyIHBhdGNoIGlzIG5vdCBjb3JyZWN0IGFzIGl0IHJlZ2lzdGVycyAiZmFrZSIgdG91Y2hw
YWQgZGV2aWNlIGV2ZW4gdGhlcmUgaXMgbm8gdG91Y2hwYWQgYXQgYWxsLg0KDQpZb3Ugc2hvdWxk
IGZpeCB5b3VyIHBhdGNoIHRvIG5vdCByZWdpc3RlciB0b3VjaHBhZCBpbnB1dCBkZXZpY2UsIGlu
IHlvdXIgY2FzZSBpdCBzaG91bGQgcmVnaXN0ZXIgb25seSB0cmFja3N0aWNrIGRldmljZS4gSSBz
dWdnZXN0IHRvIGFkZCBzb21lIGZsYWcgd2hpY2ggd291bGQgaW5kaWNhdGUgc3VjaCBkZXZpY2Ug
KGUuZy4gQUxQU19PTkxZX1RSQUNLU1RJQ0spLg0KDQpBbHNvIGN1cnJlbnRseSBrZXJuZWwgZXhw
b3J0cyBmb2xsb3dpbmcgbmFtZXMgd2hlbiBkZXZpY2UgaGFzIGJvdGggdHJhY2tzdGljayBhbmQg
dG91Y2hwYWQ6ICJEdWFsUG9pbnQgU3RpY2siIGFuZCAiRHVhbFBvaW50IFRvdWNoUGFkIi4NCkFu
ZCBpdCBleHBvcnRzIG5hbWUgIkdsaWRlUG9pbnQiIGZvciB0b3VjaHBhZC1vbmx5IGRldmljZS4g
U28gdG8gYmUgY29uc2lzdGVudCB5b3UgbmVlZCB0byBhbHNvIG1vZGlmeSB0aGlzIGNvZGUgZm9y
IHRyYWNrc3RpY2stb25seSBkZXZpY2UuDQoNCi0tDQpQYWxpIFJvaMOhcg0KcGFsaS5yb2hhckBn
bWFpbC5jb20NCg==
