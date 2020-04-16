Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050A11ABC86
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 11:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503666AbgDPJPF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 05:15:05 -0400
Received: from mail-eopbgr1410080.outbound.protection.outlook.com ([40.107.141.80]:31136
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440874AbgDPIKs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 04:10:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGKHJjEEs51EkHBybOoY5bhdOMlAsQo4Die2RtJyX/tkokX+DnPAUtdXrV/DIiAg/Fs0s4iVbAEeDPzIVnS/MpUROzYfqOpRgLSVGwBfcGldbdusKmyMFsr1NwigqqOo9d8mgoAwbi5U8hzNghkaG6b0a9X+KSfBZHORquO0YUQ8qzwD/kpQk0f/1V+pBI8//4067ssg8IF+UYPl8D4IMZ6qVVdXcYn56EW22Zne4XLvf5vZv5URkP/3XfaZa8E4q9OpPB6ikJXEftCSMMeU+XtYEFmO+27ej9pCa+DXVHSjIPCEH5C/OJj8U/IIlRjUjaTmBxsZhfGZ768MhdMUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hCRFqVdfos9yLvg8DZ97Gjnh5LBlBbmpJxasQfKEcw=;
 b=ck592m/H2pAwnAw97cVPiqqLseq75rS4xGmOEj+UIpLmJvZpsS6bPdnIfUw9BT6pCPsBoRvL0RIzoP5OsdXWEjh4pQJivorGWF0qtSCbBERqsvIPbDP0TEK3Ikhw6PXDRkHVdCZGy2sb6TK2P2nRNKcHZS4kHPfKoRpaTwXBFV9J10wU4M0l4WtpmTazBrqE6NCeigVOr9sYFrGE6yOsBnLFdXLxQ3pjH4amzCPYZd4mIYivwDOvxPl4iTEeD60IKyx9+KJ19v3xhnHCntIaa4jYQb6iIz0TbUAUV2gFXBy6E7dZULtJk1eNxoy0bfroaOdKhUEXBGmDkfy+nWBfIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.alps.com; dmarc=pass action=none header.from=cn.alps.com;
 dkim=pass header.d=cn.alps.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hCRFqVdfos9yLvg8DZ97Gjnh5LBlBbmpJxasQfKEcw=;
 b=PMltS0WWqZdrt5FOizuAnOIgdgDHiDz5Aj/EIAedLNVHbyrFTJro6/vqP425gLDTKQSHf9reFdrwwUcLXBBCeZBaFyZ3C3TYKV/r/6p0D4k797fZIS88d0/wNWMm2PKsKw50GeNsfYeEssunG4kZ7h99zldWVG9lagpsSaV4Y4A=
Received: from OSAPR01MB3057.jpnprd01.prod.outlook.com (52.134.248.141) by
 OSAPR01MB3921.jpnprd01.prod.outlook.com (20.178.103.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.24; Thu, 16 Apr 2020 08:10:11 +0000
Received: from OSAPR01MB3057.jpnprd01.prod.outlook.com
 ([fe80::c41b:4bf7:2ad1:6fc7]) by OSAPR01MB3057.jpnprd01.prod.outlook.com
 ([fe80::c41b:4bf7:2ad1:6fc7%3]) with mapi id 15.20.2900.015; Thu, 16 Apr 2020
 08:10:11 +0000
From:   Xiaojian Cao <xiaojian.cao@cn.alps.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     Artem Borisov <dedsa2002@gmail.com>,
        Masaki Ota <masaki.ota@alpsalpine.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tetsuya Nomura <tetsuya.nomura@alpsalpine.com>,
        "vadim@cirque.com" <vadim@cirque.com>,
        "pod.alcht@cn.alps.com" <pod.alcht@cn.alps.com>
Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Topic: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Index: AQHWDr0x2NbbGmh+BEarMrC/TfssrKhxZ8AAgAAQo0CAAA8hsIAADIzggAADu+CAB1VEgIAAlyTwgABrVQCAAADvYIAAPBQAgAE7UnA=
Date:   Thu, 16 Apr 2020 08:10:11 +0000
Message-ID: <OSAPR01MB30570EDCFD88E77818F0A2FCC8D80@OSAPR01MB3057.jpnprd01.prod.outlook.com>
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com>
 <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C2FB967974B98B224610C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <TYAPR01MB387100BC93864B0A93598BFBECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C914C96A8DCC47925502C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxLXT2fMdhmnfj3ZH2Ptc50nvMVU0nAvW-3fw-wAKb9rYQ@mail.gmail.com>
 <OSAPR01MB305753C5B0DD35DE7001436DC8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxKfJBWb45PuA-1t=-ZysyUVZZmXJH=D2bSacoh2akJ0Zw@mail.gmail.com>
 <OSAPR01MB30571BF938FF882F7FB22853C8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <nycvar.YFH.7.76.2004151447330.19713@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2004151447330.19713@cbobk.fhfr.pm>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaojian.cao@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bfc2d774-bffd-4ed1-9684-08d7e1dd9605
x-ms-traffictypediagnostic: OSAPR01MB3921:
x-ld-processed: 57e76998-77bd-4b82-a424-198f46eb2254,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB3921FAB73A60F9A440BC5E66C8D80@OSAPR01MB3921.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3057.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(71200400001)(6506007)(66446008)(7696005)(54906003)(85182001)(64756008)(186003)(316002)(66556008)(2906002)(66946007)(76116006)(4326008)(33656002)(8936002)(107886003)(66476007)(26005)(53546011)(5660300002)(52536014)(9686003)(81156014)(478600001)(8676002)(55016002)(86362001)(6916009);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VvaU5kdZCueWcDsiN9HVaa2+My0gig3nBSntAfkBxEtGL9ZpGGlA/sVjs8hIY4SfCTwIPWHcAevKYk6JJCYYh6u6Z9LkX+mXQar+Y8LHNs0i2M+mZ4Tpl5C9J5YFBv8Ek48a8PDLh0Z2T9dlhHAjIiA/ULsQEc3gNgXiW04aqx4N4kMvPVfWc9ckiHA4LVPD/Yh/R45oMPzKSlHyIRQ0o2j7JzlGlPJqkWGDSKAFY41VelCh24PhjaeFLLM9iLiXPGDWVwA90i0dGvnwE5F7ft8tf88Ho8My4HkAF2uX4Ra6UtBVQow/dmtgerQVbtOlKh5hwfJakUjtMHBDJSvo1aWMAgiGozHRHgW9GOpaiqeK5BQsqpZljIhXxfs1W7FgEkb7Kr8ZR4AeJRw1u8cvlnTRI/xhyqEPlH/6/8bKbsz6b4uTPOKJD+E5b4UELQFN
x-ms-exchange-antispam-messagedata: oVNr5K5ABTLv1+IQCaDTJE+1Q9uSxGyk3vOoYBKwMxvI0Kx506RNicCwbVt+ilPh2CCoFqjCgp6BgKyxWJzx+Q1jzc3pv/QFY5qknrHmJ4fyWnF1hxuUB5pfibS2E15jfthXnfrUl+bobM3JxC7LIw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc2d774-bffd-4ed1-9684-08d7e1dd9605
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 08:10:11.6535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dr77IGmL2R7ZsyId3f7pYvcz9c9etnb1D+DDzFulwforbRSbq8oo/SnuLnx7ZWgo8olJl5H/+o+l6zqychvmdHLMGVocpesVBtRakmfb64M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3921
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgSmlyaSwNCg0KSXQncyBteSBwbGVhc3VyZS4gDQpUaGUgbGF0ZXN0IG1vZGlmaWNhdGlvbiBp
cyBzdWl0YWJsZSBub3cuDQoNCg0KQmVzdCBSZWdhcmRzLA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KSmFzb24gQ2FvKOabueaZk+W7uikNCg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5v
cmc+IA0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyMCA4OjU1IFBNDQpUbzog5pu5IOab
ieW7uiBYaWFvamlhbiBDYW8gPHhpYW9qaWFuLmNhb0Bjbi5hbHBzLmNvbT4NCkNjOiBBcnRlbSBC
b3Jpc292IDxkZWRzYTIwMDJAZ21haWwuY29tPjsg5aSq55SwIOecn+WWnCBNYXNha2kgT3RhIDxt
YXNha2kub3RhQGFscHNhbHBpbmUuY29tPjsgQmVuamFtaW4gVGlzc29pcmVzIDxiZW5qYW1pbi50
aXNzb2lyZXNAcmVkaGF0LmNvbT47IEhlbnJpayBSeWRiZXJnIDxyeWRiZXJnQGJpdG1hdGgub3Jn
PjsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyDph47mnZEg5ZOy5ZOJIFRldHN1eWEgTm9tdXJhIDx0ZXRzdXlhLm5vbXVyYUBhbHBzYWxw
aW5lLmNvbT47IFZhZGltIEtsaXNoa28gPHZhZGltQGNpcnF1ZS5jb20+OyAjQUxDSFRfTUxfUE9E
X0NOIDxwb2QuYWxjaHRAY24uYWxwcy5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIIDIvMl0gSElE
OiBhbHBzOiBSZWZhY3RvciBheGlzIHJlc29sdXRpb24gbG9naWMNCg0KT24gV2VkLCAxNSBBcHIg
MjAyMCwgWGlhb2ppYW4gQ2FvIHdyb3RlOg0KDQo+IFRoYW5rcyBmb3IgeW91ciBjaGVja2luZywg
bXkgZmVlZGJhY2tzIGFyZSBhcyBiZWxvdzoNCj4NCj4gMS5JdCBpcyBhYm91dCB0aGUgY29kaW5n
IHN0eWxlIHRoYXQgd2Ugc2hvdWxkIG5vdCB1c2UgSFdJRCBpbiB0aGUgDQo+IHN0cmluZyAiSElE
X0RFVklDRV9JRF9BTFBTXzE2NTciLCB0aGVyZSBhcmUgYSBsYXJnZSBudW1iZXIgb2YgSFdJRHMg
DQo+IHVzaW5nIHRoaXMgdG91Y2hwYWQuIFdlIHNob3VsZCB1c2UgdGhlIGRldmljZSB0eXBlIGlu
Zm9ybWF0aW9uIGluIHRoaXMgDQo+IHN0cmluZywgc3VjaCBhcyAiVTFfVU5JQ09STl9MRUdBQ1ki
Lg0KDQpPaywgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEJhc2VkIG9uIGl0LCBJIGFtIHF1ZXVp
bmcgdGhlIHBhdGNoIGJlbG93Lg0KDQpISURfREVWSUNFX0lEX0FMUFNfMTY1NyBQSUQgaXMgdG9v
IHNwZWNpZmljLCBhcyB0aGVyZSBhcmUgbWFueSBvdGhlciBBTFBTIGhhcmR3YXJlIElEcyB1c2lu
ZyB0aGlzIHBhcnRpY3VsYXIgdG91Y2hwYWQuDQoNClJlbmFtZSB0aGUgaWRlbnRpZmllciB0byBI
SURfREVWSUNFX0lEX0FMUFNfVTFfVU5JQ09STl9MRUdBQ1kgaW4gb3JkZXIgdG8gZGVzY3JpYmUg
cmVhbGl0eSBiZXR0ZXIuDQoNCkZpeGVzOiA2NDBlNDAzYjFmZDI0ICgiSElEOiBhbHBzOiBBZGQg
QVVJMTY1NyBkZXZpY2UgSUQiKQ0KUmVwb3J0ZWQtYnk6IFhpYW9qaWFuIENhbyA8eGlhb2ppYW4u
Y2FvQGNuLmFscHMuY29tPg0KU2lnbmVkLW9mZi1ieTogSmlyaSBLb3NpbmEgPGprb3NpbmFAc3Vz
ZS5jej4NCi0tLQ0KIGRyaXZlcnMvaGlkL2hpZC1hbHBzLmMgfCAyICstDQogZHJpdmVycy9oaWQv
aGlkLWlkcy5oICB8IDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1hbHBzLmMgYi9kcml2
ZXJzL2hpZC9oaWQtYWxwcy5jIGluZGV4IGMyYTJiZDUyODg5MC4uYjJhZDMxOWE3NGI5IDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFscHMuYw0KKysrIGIvZHJpdmVycy9oaWQvaGlkLWFs
cHMuYw0KQEAgLTgwMiw3ICs4MDIsNyBAQCBzdGF0aWMgaW50IGFscHNfcHJvYmUoc3RydWN0IGhp
ZF9kZXZpY2UgKmhkZXYsIGNvbnN0IHN0cnVjdCBoaWRfZGV2aWNlX2lkICppZCkNCiAJCWJyZWFr
Ow0KIAljYXNlIEhJRF9ERVZJQ0VfSURfQUxQU19VMV9EVUFMOg0KIAljYXNlIEhJRF9ERVZJQ0Vf
SURfQUxQU19VMToNCi0JY2FzZSBISURfREVWSUNFX0lEX0FMUFNfMTY1NzoNCisJY2FzZSBISURf
REVWSUNFX0lEX0FMUFNfVTFfVU5JQ09STl9MRUdBQ1k6DQogCQlkYXRhLT5kZXZfdHlwZSA9IFUx
Ow0KIAkJYnJlYWs7DQogCWRlZmF1bHQ6DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWlk
cy5oIGIvZHJpdmVycy9oaWQvaGlkLWlkcy5oIGluZGV4IGUzZTJmYTY3MzNmYi4uNmViMjViOWU4
NTc1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWlkcy5oDQorKysgYi9kcml2ZXJzL2hp
ZC9oaWQtaWRzLmgNCkBAIC03OSw5ICs3OSw5IEBADQogI2RlZmluZSBISURfREVWSUNFX0lEX0FM
UFNfVTFfRFVBTF9QVFAJMHgxMjFGDQogI2RlZmluZSBISURfREVWSUNFX0lEX0FMUFNfVTFfRFVB
TF8zQlROX1BUUAkweDEyMjANCiAjZGVmaW5lIEhJRF9ERVZJQ0VfSURfQUxQU19VMQkJMHgxMjE1
DQorI2RlZmluZSBISURfREVWSUNFX0lEX0FMUFNfVTFfVU5JQ09STl9MRUdBQ1kgICAgICAgICAw
eDEyMUUNCiAjZGVmaW5lIEhJRF9ERVZJQ0VfSURfQUxQU19UNF9CVE5MRVNTCTB4MTIwQw0KICNk
ZWZpbmUgSElEX0RFVklDRV9JRF9BTFBTXzEyMjIJCTB4MTIyMg0KLSNkZWZpbmUgSElEX0RFVklD
RV9JRF9BTFBTXzE2NTcgICAgICAgICAweDEyMUUNCiANCiAjZGVmaW5lIFVTQl9WRU5ET1JfSURf
QU1JCQkweDA0NmINCiAjZGVmaW5lIFVTQl9ERVZJQ0VfSURfQU1JX1ZJUlRfS0VZQk9BUkRfQU5E
X01PVVNFCTB4ZmYxMA0KDQoNCi0tDQpKaXJpIEtvc2luYQ0KU1VTRSBMYWJzDQoNCg==
