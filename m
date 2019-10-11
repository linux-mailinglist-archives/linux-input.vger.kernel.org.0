Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67ABDD4A12
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 23:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfJKVrA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 17:47:00 -0400
Received: from mail-eopbgr720064.outbound.protection.outlook.com ([40.107.72.64]:54880
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728719AbfJKVrA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 17:47:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tfh2ZZAaHosjhBD1ca4Sts04qOAZe/DpXKj7WbCzCuFSzrblIJd2skAci2J3riNGXNBkEiRMAhzHZ/9+dq6GlyyThTT873OF69pDcR1Otr8MV48/ZxyvUyMYeOq1daBSghbnD7J/TTABoKCKXj883OCMWABes4pv6+Ixsa0t1jjWHoT+A8dl7WurxvuwdpW0pDvI1wmEwQJApfwII1qouB0mE20EcpLXcmziCYaA9YQEdnWBXpKqwYDjXhLriP9p9/XcIb/A9RNO6IDE1qLJGGzT0tuC0x+4VeCWaSCALvLD3tlET52maFq7AGel7dl/SscD7DKHVwF4qY8oJGQ1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WvV7Cd8IchyIhKpTJ1SvMBP5jdNv/wTi+cX1KBKWeA=;
 b=S//y/tqNrzZbUK3vqd6vanJ+cp6/SwzN1J6+QBbf0PAe+rJTFsxBqhWytoDNRE7z4pYRYkFbBnRJd7t2S+1O1Hj6xRSqAM74o1xuRdY0xTtDih/wCTwJP6ev52wD3KHrCA27byRT7R4k4sqdBJqP31eQLf3MeInjRox3ILEbxvCMsEMJWt6+LPyMMehTcfi6wLIC1K/uXnDL4Xi0njT0Ft9RDPhNtgk8eFm1o9FooO0rR4F10+leRCcczBCN1U66ySs6s39a92hRyooxnSMrgOFx0Ef37pJoRIYsQexYtgKp0+pRCyK/wpmz9mEcsrK1IAfHPgMWqhsFbzdgKFR83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WvV7Cd8IchyIhKpTJ1SvMBP5jdNv/wTi+cX1KBKWeA=;
 b=M/aCGRjt6dQd4kzG2F+a8zgJcz2+ZZmGFetX1nABeWB2X5x41UOHxjdsQv8OzlDrvuZFmd4942WMPymuWFrY5pUXATmE12LnAkT/JBf32FiaEhmRf/EtO3Au9TEeHSqra7xkLDp/gZqGEC5BYVpC3d+v4M13wCnqnUn1swVkilI=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4408.namprd03.prod.outlook.com (20.178.48.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 21:46:56 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 21:46:56 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     Evan Green <evgreen@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Pan Bian <bianpan2016@163.com>,
        Allison Randal <allison@lohutok.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <Cheiny@synaptics.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - Avoid processing unknown IRQs
Thread-Topic: [PATCH] Input: synaptics-rmi4 - Avoid processing unknown IRQs
Thread-Index: AQHVgH1lpvrZFBnT+USeeu8HKqX4tg==
Date:   Fri, 11 Oct 2019 21:46:56 +0000
Message-ID: <a6e517a2-51ca-431a-88f8-8bfa0a867dc6@synaptics.com>
References: <20191008223657.163366-1-evgreen@chromium.org>
In-Reply-To: <20191008223657.163366-1-evgreen@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: BY5PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::41) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8da1a592-73c1-436b-5968-08d74e94890c
x-ms-traffictypediagnostic: BYAPR03MB4408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4408BB1ED3C89BDDA6A84812B2970@BYAPR03MB4408.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39850400004)(136003)(396003)(376002)(346002)(366004)(189003)(199004)(52116002)(446003)(476003)(229853002)(7416002)(7736002)(11346002)(58126008)(305945005)(6486002)(316002)(486006)(66066001)(65956001)(65806001)(99286004)(14454004)(102836004)(6506007)(53546011)(25786009)(478600001)(386003)(110136005)(54906003)(26005)(186003)(76176011)(66476007)(66446008)(64756008)(31686004)(66946007)(31696002)(2616005)(66556008)(256004)(14444005)(86362001)(5660300002)(6116002)(3846002)(4326008)(81166006)(81156014)(8676002)(8936002)(6246003)(107886003)(71200400001)(71190400001)(2906002)(6512007)(36756003)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4408;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VHgXu8MseTsysQhyUcDAJyKDPLmzT4+0kQqDnVnl9YbHuSARmuftSVAOJfVtFxFdIj5bygd6S162sALyuGfA1prnOMQKnA0ax6AC2NC20c2AHTyh/xgk4dQU0DhKGY97zB7Ycs2YJcNxG8s3Q5wk9zizQ/faSUSkQA3aL0nRf3iXNmzh9VFy8gwZMH3CehWv7jCZFpVQBuuY5ZikRvcgPFzBmw5I40js9vRNLjWxlLkW6SPb8sqagra62h6y1x3WLf/tC2DIsbGr2Tyu7knzfxdNq5w0eh5gl5NmbdWyxMXcuy1Ki8fY87lBZNd5VMFBSXBb+LKSczROAJOMIF0TAn1ZjbKtvAcPkiPkpw9XilfUjwhlurbQc4yp1xv+xjNbqXVukyoXmpe1x4PY2g9q6/iQ5LllDvSU1EWwsQACuKI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D82C027DC78BB94798D67336C1E7C48F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da1a592-73c1-436b-5968-08d74e94890c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 21:46:56.0607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tp162yWGAZGV3YqNUuXT8tHtaLyd1OCMjKStUsgD1gmjuNMx/AhgvBD/ela9246h5yuwhP75e9RlmGm7QbFS3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4408
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRXZhbiwNCg0KT24gMTAvOC8xOSAzOjM2IFBNLCBFdmFuIEdyZWVuIHdyb3RlOg0KPiBybWlf
cHJvY2Vzc19pbnRlcnJ1cHRfcmVxdWVzdHMoKSBjYWxscyBoYW5kbGVfbmVzdGVkX2lycSgpIGZv
cg0KPiBlYWNoIGludGVycnVwdCBzdGF0dXMgYml0IGl0IGZpbmRzLiBJZiB0aGUgaXJxIGRvbWFp
biBtYXBwaW5nIGZvcg0KPiB0aGlzIGJpdCBoYWQgbm90IHlldCBiZWVuIHNldCB1cCwgdGhlbiBp
dCBlbmRzIHVwIGNhbGxpbmcNCj4gaGFuZGxlX25lc3RlZF9pcnEoMCksIHdoaWNoIGNhdXNlcyBh
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4NCj4NCj4gVGhlcmUncyBhbHJlYWR5IGNvZGUgdGhh
dCBtYXNrcyB0aGUgaXJxX3N0YXR1cyBiaXRzIGNvbWluZyBvdXQgb2YgdGhlDQo+IGhhcmR3YXJl
IHdpdGggY3VycmVudF9pcnFfbWFzaywgcHJlc3VtYWJseSB0byBhdm9pZCB0aGlzIHNpdHVhdGlv
bi4NCj4gSG93ZXZlciBjdXJyZW50X2lycV9tYXNrIHNlZW1zIHRvIG1vcmUgcmVmbGVjdCB0aGUg
YWN0dWFsIG1hc2sgc2V0DQo+IGluIHRoZSBoYXJkd2FyZSByYXRoZXIgdGhhbiB0aGUgSVJRcyBz
b2Z0d2FyZSBoYXMgc2V0IHVwIGFuZCByZWdpc3RlcmVkDQo+IGZvci4gRm9yIGV4YW1wbGUsIGlu
IHJtaV9kcml2ZXJfcmVzZXRfaGFuZGxlcigpLCB0aGUgY3VycmVudF9pcnFfbWFzaw0KPiBpcyBp
bml0aWFsaXplZCBiYXNlZCBvbiB3aGF0IGlzIHJlYWQgZnJvbSB0aGUgaGFyZHdhcmUuIElmIHRo
ZSByZXNldA0KPiB2YWx1ZSBvZiB0aGlzIG1hc2sgZW5hYmxlcyBJUlFzIHRoYXQgTGludXggaGFz
IG5vdCBzZXQgdXAgeWV0LCB0aGVuDQo+IHdlIGVuZCB1cCBpbiB0aGlzIHNpdHVhdGlvbi4NCj4N
Cj4gVGhlcmUgYXBwZWFycyB0byBiZSBhIHRoaXJkIHVudXNlZCBiaXRtYXNrIHRoYXQgdXNlZCB0
byBzZXJ2ZSB0aGlzDQo+IHB1cnBvc2UsIGZuX2lycV9iaXRzLiBVc2UgdGhhdCBiaXRtYXNrIGlu
c3RlYWQgb2YgY3VycmVudF9pcnFfbWFzaw0KPiB0byBhdm9pZCBjYWxsaW5nIGhhbmRsZV9uZXN0
ZWRfaXJxKCkgb24gSVJRcyB0aGF0IGhhdmUgbm90IHlldCBiZWVuDQo+IHNldCB1cC4NCg0KWWVz
LCBpdCBsb29rcyBsaWtlIHRoZSBjb2RlIHdoaWNoIGVuc3VyZWQgdGhhdCB0aGVyZSB3YXMgYSBm
dW5jdGlvbiANCmhhbmRsZXIgdG8gaGFuZGxlIHRoZSBJUlEgd2FzIHJlbW92ZWQgd2hlbiB0aGUg
ZHJpdmVyIHN3aXRjaGVkIHRvIHVzaW5nIA0KYW4gaXJxIGRvbWFpbi4gU2V0dGluZyB0aGUgZm5f
aXJxX2JpdHMgYW5kIHVzaW5nIHRoZW0gaW5zdGVhZCBvZiANCmN1cnJlbnRfaXJxX21hc2sgaW4g
cm1pX3Byb2Nlc3NfaW50ZXJydXB0X3JlcXVlc3RzKCkgbWFrZXMgc2Vuc2UgdG8gbWUuDQoNCkFu
ZHJldw0KDQo+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2Z3JlZW5AY2hyb21pdW0ub3Jn
Pg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBEdWdnYW4gPGFkdWdnYW5Ac3luYXB0aWNzLmNvbT4NCj4g
LS0tDQo+DQo+ICAgZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9kcml2ZXIuYyB8IDYgKysrKystDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9kcml2ZXIuYyBiL2RyaXZlcnMvaW5w
dXQvcm1pNC9ybWlfZHJpdmVyLmMNCj4gaW5kZXggNzcyNDkzYjFmNjY1Li4xOTBiOTk3NDUyNmIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaW5wdXQvcm1pNC9ybWlfZHJpdmVyLmMNCj4gKysrIGIv
ZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9kcml2ZXIuYw0KPiBAQCAtMTQ2LDcgKzE0Niw3IEBAIHN0
YXRpYyBpbnQgcm1pX3Byb2Nlc3NfaW50ZXJydXB0X3JlcXVlc3RzKHN0cnVjdCBybWlfZGV2aWNl
ICpybWlfZGV2KQ0KPiAgIAl9DQo+ICAgDQo+ICAgCW11dGV4X2xvY2soJmRhdGEtPmlycV9tdXRl
eCk7DQo+IC0JYml0bWFwX2FuZChkYXRhLT5pcnFfc3RhdHVzLCBkYXRhLT5pcnFfc3RhdHVzLCBk
YXRhLT5jdXJyZW50X2lycV9tYXNrLA0KPiArCWJpdG1hcF9hbmQoZGF0YS0+aXJxX3N0YXR1cywg
ZGF0YS0+aXJxX3N0YXR1cywgZGF0YS0+Zm5faXJxX2JpdHMsDQo+ICAgCSAgICAgICBkYXRhLT5p
cnFfY291bnQpOw0KPiAgIAkvKg0KPiAgIAkgKiBBdCB0aGlzIHBvaW50LCBpcnFfc3RhdHVzIGhh
cyBhbGwgYml0cyB0aGF0IGFyZSBzZXQgaW4gdGhlDQo+IEBAIC0zODUsNiArMzg1LDggQEAgc3Rh
dGljIGludCBybWlfZHJpdmVyX3NldF9pcnFfYml0cyhzdHJ1Y3Qgcm1pX2RldmljZSAqcm1pX2Rl
diwNCj4gICAJYml0bWFwX2NvcHkoZGF0YS0+Y3VycmVudF9pcnFfbWFzaywgZGF0YS0+bmV3X2ly
cV9tYXNrLA0KPiAgIAkJICAgIGRhdGEtPm51bV9vZl9pcnFfcmVncyk7DQo+ICAgDQo+ICsJYml0
bWFwX29yKGRhdGEtPmZuX2lycV9iaXRzLCBkYXRhLT5mbl9pcnFfYml0cywgbWFzaywgZGF0YS0+
aXJxX2NvdW50KTsNCj4gKw0KPiAgIGVycm9yX3VubG9jazoNCj4gICAJbXV0ZXhfdW5sb2NrKCZk
YXRhLT5pcnFfbXV0ZXgpOw0KPiAgIAlyZXR1cm4gZXJyb3I7DQo+IEBAIC0zOTgsNiArNDAwLDgg
QEAgc3RhdGljIGludCBybWlfZHJpdmVyX2NsZWFyX2lycV9iaXRzKHN0cnVjdCBybWlfZGV2aWNl
ICpybWlfZGV2LA0KPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcm1pX2Rldi0+ZGV2Ow0KPiAg
IA0KPiAgIAltdXRleF9sb2NrKCZkYXRhLT5pcnFfbXV0ZXgpOw0KPiArCWJpdG1hcF9hbmRub3Qo
ZGF0YS0+Zm5faXJxX2JpdHMsDQo+ICsJCSAgICAgIGRhdGEtPmZuX2lycV9iaXRzLCBtYXNrLCBk
YXRhLT5pcnFfY291bnQpOw0KPiAgIAliaXRtYXBfYW5kbm90KGRhdGEtPm5ld19pcnFfbWFzaywN
Cj4gICAJCSAgZGF0YS0+Y3VycmVudF9pcnFfbWFzaywgbWFzaywgZGF0YS0+aXJxX2NvdW50KTsN
Cj4gICANCg==
