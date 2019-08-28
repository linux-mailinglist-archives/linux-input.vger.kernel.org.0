Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E559FACE
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 08:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfH1Gvf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 02:51:35 -0400
Received: from mail-eopbgr1410073.outbound.protection.outlook.com ([40.107.141.73]:49143
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726253AbfH1Gvf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 02:51:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbJGtAkyXzTsmSmTEruOJBfoMb5sC/R42Um5d4+tKG+dWwgDzLj0nBy14PifxzWzDOMJKoqhEin2lijenuKA5/5QLX4o/9uNDEj6+VIGQoq85P+DtE9h56KOcixoJYGPg7S2UXaDlqjfAtMUjnx94cHDsQcSFAUHJc6k3lwdIDeB0Rrj/OvkS4meM+9GxdA3dDgFnEf+0eGfqFGnE1j+cih8QP+bGEVXQsIlyN7b40N9SNf4MvvLTY1ObPWhgNgm4PNNFPIvA5/RFyqRYg1OLHSlY1w1Cr6oVD+oMRWGOXRQURDQjbZlInO+0cSoZRhVUY1DsHY8bEltYbo0tcenOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NHd1Asev9L6OvVGS6q1oE5x++qjzEnBsT57Ej0+Noc=;
 b=oc9JXCa9thpOgmYIB3hwblE+R4VkffKhjABJ+B/WjMCw7eUzofnWWbqJgNCnlPr7dEgMxO/a79osTfOnzIkWODgwlLFeHvxujbQmhyT4rtrS7S1tVreDPLrEpZUgF5EPifUQrBGtqB866E2wW1MWyaGbrjrkKNUPSq4buOiiq4EiT/5Z8rwtimp/icg1A2xqM5I9TWXFAyWvhUDvBPyGqRMELBuENDU9WpAdZ7Wb0cFrvlRuZvYPXMG7VG4rmc7/GXPRnJgRFrjw7oESCFq89Hmgh76xOI9x2K0ThsxjIZZiotb8bq6Nz9MXUnCvy7uV6bqxJGcPKgIOqGwykry0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.alps.com; dmarc=pass action=none header.from=cn.alps.com;
 dkim=pass header.d=cn.alps.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NHd1Asev9L6OvVGS6q1oE5x++qjzEnBsT57Ej0+Noc=;
 b=KQ6Ojwh+WZo+DyRQkncrJ6MXBL+eckMtE7eyjSLQocxFFAgr1AETB3eZtq8e9sRzZ3yU0oO7GXbvh2mn6wNktzVcoIcJHBDG87spXdJplf4+skb8lUWVM9MMMgigKpZQF8FsonhQ1NMuMKXlUWuNdGQR+1hPKcSKP7LXuX9SSGg=
Received: from TYXPR01MB1470.jpnprd01.prod.outlook.com (52.133.166.12) by
 TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.167.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Wed, 28 Aug 2019 06:51:30 +0000
Received: from TYXPR01MB1470.jpnprd01.prod.outlook.com
 ([fe80::197:990c:d09a:b477]) by TYXPR01MB1470.jpnprd01.prod.outlook.com
 ([fe80::197:990c:d09a:b477%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 06:51:30 +0000
From:   Xiaojian Cao <xiaojian.cao@cn.alps.com>
To:     Masaki Ota <masaki.ota@alpsalpine.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
CC:     Mario Limonciello <mario.limonciello@dell.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naoki Saito <naoki.saito@alpsalpine.com>
Subject: RE: Alps touchpad generates IRQ storm after S3
Thread-Topic: Alps touchpad generates IRQ storm after S3
Thread-Index: AQHVXWj4yiA/dCbgb0asvogI8mRWOKcQF8vAgAAHJ9A=
Date:   Wed, 28 Aug 2019 06:51:30 +0000
Message-ID: <TYXPR01MB1470902D804A47EE72013006C8A30@TYXPR01MB1470.jpnprd01.prod.outlook.com>
References: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
 <TYAPR01MB30223CB8A576C7809F6382C1ECA30@TYAPR01MB3022.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB30223CB8A576C7809F6382C1ECA30@TYAPR01MB3022.jpnprd01.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaojian.cao@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a988ff8b-a400-4800-8563-08d72b842865
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1775;
x-ms-traffictypediagnostic: TYXPR01MB1775:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB17752DAAA1DF106D164AD35FC8A30@TYXPR01MB1775.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(13464003)(189003)(199004)(256004)(66556008)(316002)(107886003)(446003)(53936002)(85182001)(76176011)(476003)(11346002)(486006)(54906003)(7696005)(478600001)(110136005)(66066001)(6246003)(52536014)(14444005)(8936002)(81166006)(81156014)(71200400001)(229853002)(71190400001)(5660300002)(8676002)(6116002)(86362001)(4326008)(14454004)(33656002)(3846002)(7736002)(305945005)(186003)(9686003)(55016002)(26005)(2906002)(6436002)(99286004)(66446008)(6506007)(53546011)(64756008)(66476007)(74316002)(76116006)(25786009)(102836004)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:TYXPR01MB1775;H:TYXPR01MB1470.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ntWzmQWnUpBJbs/UYgidh/VOhEowIp8g8dPzmWm0brUc+kl6uAYyDUG2ocUtMbBT2Gk9sHvNLrO4JHMdWc8dVbegK9ONDesYyy4QWEREgfvGbxoeg6FgVGACAjkA0ntXCvvMhKWWGn/TsLclTF8z99YQjhiO+pM9sHhJBlSe0Mq/yimnw//KYI7JQJ2p7C9ZpYN13cS08XKPpPXjl2Mn7+K/3Wxs1SCTrQOTV8HYYTsKuqdtdGn4/FzUI712ZPMtowkciKDO0mQ53hrc7pMd/9tUa0a0gC2zi8htrDjUWZuplAdWeC+jbtRrlC+G5bWn7e/4370uzrCuoVc2zXJKft+lwXsKH5FJd6FecoxSibN4usHpJLca2fbahfGHwqxLxIetgYT61c9YvvVPAkexHloRwHWsnJoINTaYEkGQIxQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a988ff8b-a400-4800-8563-08d72b842865
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 06:51:30.5546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zz/2fskaiyNYEm9qsg0eK6h4ah/LvM8+voymSBloLaycjQdKYDOgqMU08CYSYC6MlKuaqB7SHqcEpQNvy1+43j0RikpjEHNhbjzYmAwXNtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1775
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgT3RhLXNhbiwNCg0KT0ssIHdlIHdpbGwgbG9vayBpbnRvIGl0Lg0KDQoNCkhpIEthaS1IZW5n
LA0KDQpXZSB3aWxsIHRyeSB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZSBmaXJzdCwgY291bGQgeW91
IHBsZWFzZSB0ZWxsIG1lIHRoZSB0YXJnZXQgVWJ1bnR1IHZlcnNpb24/DQoNCkJlc3QgcmVnYXJk
cywgDQpKYXNvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog5aSq55SwIOec
n+WWnCBNYXNha2kgT3RhIDxtYXNha2kub3RhQGFscHNhbHBpbmUuY29tPiANClNlbnQ6IFdlZG5l
c2RheSwgQXVndXN0IDI4LCAyMDE5IDI6MzUgUE0NClRvOiDmm7kg5puJ5bu6IFhpYW9qaWFuIENh
byA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjsgS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVu
Z0BjYW5vbmljYWwuY29tPg0KQ2M6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxs
b0BkZWxsLmNvbT47IG9wZW4gbGlzdDpISUQgQ09SRSBMQVlFUiA8bGludXgtaW5wdXRAdmdlci5r
ZXJuZWwub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz47IOaWieiXpCDnm7TmqLkgTmFva2kgU2FpdG8gPG5hb2tpLnNhaXRvQGFscHNh
bHBpbmUuY29tPg0KU3ViamVjdDogUkU6IEFscHMgdG91Y2hwYWQgZ2VuZXJhdGVzIElSUSBzdG9y
bSBhZnRlciBTMw0KDQpIaSwgS2FpLUhlbmcsDQoNClNvcnJ5LCBJJ20gbm90IGluIGNoYXJnZSBv
ZiBMaW51eCB0YXNrIG5vdy4NCg0KSGksIFhpYW9KaWFuLA0KDQpQbGVhc2UgY2hlY2sgdGhlIGZv
bGxvd2luZyBtYWlsLg0KSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9uLCBwbGVhc2UgYXNrIEthaS1I
ZW5nLg0KDQpCZXN0IFJlZ2FyZHMsDQpNYXNha2kgT3RhDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPiAN
ClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI4LCAyMDE5IDM6MjIgUE0NClRvOiDlpKrnlLAg55yf
5ZacIE1hc2FraSBPdGEgPG1hc2FraS5vdGFAYWxwc2FscGluZS5jb20+DQpDYzogTWFyaW8gTGlt
b25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGRlbGwuY29tPjsgb3BlbiBsaXN0OkhJRCBDT1JF
IExBWUVSIDxsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGlu
ZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KU3ViamVjdDogQWxwcyB0b3Vj
aHBhZCBnZW5lcmF0ZXMgSVJRIHN0b3JtIGFmdGVyIFMzDQoNCkhpIE1hc2FraSwNCg0KVGhlIEFs
cHMgdG91Y2hwYWQgKDA0NEU6MTIyMCkgb24gRGVsbCBQcmVjaXNpb24gNzUzMCBjYXVzZXMgSVJR
IHN0b3JtIGFmdGVyIHN5c3RlbSBzdXNwZW5kIChTMykuDQpDb21taXQgIkhJRDogaTJjLWhpZDog
RG9uJ3QgcmVzZXQgZGV2aWNlIHVwb24gc3lzdGVtIHJlc3VtZeKAnSB3aGljaCBzb2x2ZXMgdGhl
IHNhbWUgaXNzdWUgZm9yIG90aGVyIHZlbmRvcnMsIGNhdXNlIHRoZSBpc3N1ZSBvbiBBbHBzIHRv
dWNocGFkLg0KU28gSeKAmWQgbGlrZSB0byBrbm93IHRoZSBjb3JyZWN0IGNvbW1hbmQgQWxwcyB0
b3VjaHBhZCBleHBlY3RzIGFmdGVyIHN5c3RlbSByZXN1bWUuDQoNCkFsc28gQ2MgTWFyaW8gYmVj
YXVzZSB0aGlzIGNvdWxkIHJlbGF0ZSB0byBCSU9TLg0KDQpLYWktSGVuZw0K
