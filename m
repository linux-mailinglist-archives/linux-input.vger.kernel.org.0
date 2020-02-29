Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E54CF174606
	for <lists+linux-input@lfdr.de>; Sat, 29 Feb 2020 11:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgB2KGI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Feb 2020 05:06:08 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:22245
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726671AbgB2KGH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Feb 2020 05:06:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In2FjCUDxC0fwNsVipQOHQ3Y5MTw1ba+aueAzZk3o0NJkSFF8biBpCtSUZLddkPeRNxRRZOAA2QtwvFHABfFDFgq6zEhW9xIkZejs19xuGm5Cs0tZMVtztUZCeqqIgnUEZMERO/xBpFivzliL5wVMGf16nbPuBFPaakx1r6GhrvaMwczrHV4WiriS4aLKMdQOu4kZm4WeEvTs4/OCY3J7BJdB+nIv4vPWAxszwA6Y4Ph+bDlhlLoVyfHVYaxA7vLWHPXMvmivJNg42eSZ1guPt9oE+j0GhMwlMS2Y1MCwoTIshpzAJZNvjjtuA/7OqassZRD0RQbehPxqlSj/e9KcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Sjj24lln6SpAnJtssR0IKE4VaigrM/pQ/xe3Ef8W2Q=;
 b=Bh14TKrySwyhM90a+bNAOsJXpS8F+lrGuK1qggKKaAiIN6TLIVlhpHsKUC10LkXp545OgVVVHlwP+yGLYYOeZsDSZ8EO7J+emHPSBhDtLfQDpQXcRuzGgsA257FfLCdIn9MCAhRktSUsT1fiqOZ4mRV2frQoHzAZPrMjotLbL11xGZtUJvggtj/qI9vQ1q5YNnMZXEIWP3wwyI6o7wIWxOY7i9Naqzg1HzkVZ61N3xDBmFWhIaGtsWWNxsveLBxO4z4ztAVhSf6xr5NgUI3xIWxMl/y9oyACWRz5TDGKFPWep85FeGqfB1l3GrGWuPUgzEUMMsW+Lr+8mp/UJtVJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Sjj24lln6SpAnJtssR0IKE4VaigrM/pQ/xe3Ef8W2Q=;
 b=HFS58xlp3IZS8SOJLrne0qaIG/VfVcsT7HY5jqJXRJNdBVkZW8drqVUB9vfjIHA5pJOE1g8gBpDgmHmN56gbqVZof6k7pSmWd+yTLqA0GwtTLM8ojgtEp4zFlQbmukf2XpgempqGgT56I2cXUseM8ROiQmj2pjaVwLbRxFH3pbg=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.232.15) by
 VE1PR04MB6527.eurprd04.prod.outlook.com (20.179.233.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Sat, 29 Feb 2020 10:05:59 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31%6]) with mapi id 15.20.2772.018; Sat, 29 Feb 2020
 10:05:58 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>
CC:     Horia Geanta <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
Thread-Topic: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
Thread-Index: AQHV6/ZVtFBmLLNhAkqJunTqxVUTUqgsqtgAgAEQHYCAArI9kA==
Date:   Sat, 29 Feb 2020 10:05:58 +0000
Message-ID: <VE1PR04MB66385D4CA35122C3D043B86789E90@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200225161201.1975-1-git@andred.net>
         <20200225161201.1975-6-git@andred.net>
         <VE1PR04MB66385DDED7C654AE2181E08E89EA0@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <f3c4f7791c86235683541a3d51ed02631b784bf6.camel@andred.net>
In-Reply-To: <f3c4f7791c86235683541a3d51ed02631b784bf6.camel@andred.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [183.192.236.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4831792f-b984-41a4-84bf-08d7bcfef96e
x-ms-traffictypediagnostic: VE1PR04MB6527:|VE1PR04MB6527:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB652729D60017A2D58032E7CF89E90@VE1PR04MB6527.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03283976A6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(189003)(199004)(316002)(6506007)(71200400001)(2906002)(9686003)(26005)(86362001)(55016002)(186003)(478600001)(52536014)(7696005)(76116006)(6916009)(5660300002)(7416002)(33656002)(66556008)(8676002)(54906003)(66476007)(81156014)(66946007)(4326008)(81166006)(66446008)(8936002)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6527;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9sfSsEBG/bzzpwgo/JGjd+7JITQXdlVoZL1NfxR5QeWP/jn4oVYu1yo+KnVdxfULE73OB+EHcXkp3kSASklYwwdPHxsUHcprFUHoopILkWzIZpAiWy/eaWy905zcpEblScxyY1L1HOO3/1F+Evm087ePI1nN4bXAc6n7pEhi+5VD2N9oFnc9dHMYsvW+idpl4XtjuiyOa0xW4p09OrtFGSKF1WS17wwZb3ahYFSN6gp8tbWvZz23a3Z5kk5lJRFfkYQuhZzWPd3JmetsvFcGxRXwRGC5vwyNS/cuOQ+Prbcf5VnRqhsUW8ovr+42y4RGeu8+iA+925ltZ492MRKDExC9jDG1OacYi0b8s3GuSyB5wihIsgR1dfANkFB0VxE7+S4afBrkDuFM684WFgiwCBDVWLUrD99VrHoWgIWFbI5kOTqut3G4yvKS2MfUJsFt
x-ms-exchange-antispam-messagedata: SM00gFr8L5yjmv24jCH51iRxEb5pm36kfB3oCJSgYTCnIc8v5vxcf16z9zUWXBnJIbTTkBVmz3jh2rabXUGUTTimHhKUoCvg9Ix+RODzbGzHfqGznfAeEYg3IGhe8v8TiJa7uq/D64Q8w8YEfbWflQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4831792f-b984-41a4-84bf-08d7bcfef96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2020 10:05:58.6510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPNbShsl/s6SA8ys5+80HRj3g0Cx8UycSWw3xQovbU6UWZoDz8DLNIrN/E21qk29YlZxinMegtcOQpIKagyS4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6527
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMjAyMC8wMi8yNyBBbmRyw6kgRHJhc3ppayA8Z2l0QGFuZHJlZC5uZXQ+IHdyb3RlOg0KPiBP
biBXZWQsIDIwMjAtMDItMjYgYXQgMDE6MTUgKzAwMDAsIFJvYmluIEdvbmcgd3JvdGU6DQo+ID4g
T24gMjAyMC8wMi8yNiBBbmRyw6kgRHJhc3ppayA8Z2l0QGFuZHJlZC5uZXQ+IHdyb3RlOg0KPiA+
ID4gVGhlIHNudnNfcHdya2V5IHNoYXJlcyB0aGUgU05WUyBMUFNSIHN0YXR1cyByZWdpc3RlciB3
aXRoIHRoZSBzbnZzX3J0Yy4NCj4gPiA+DQo+ID4gPiBUaGlzIGRyaXZlciBoZXJlIHNob3VsZCBv
bmx5IHJldHVybiBJUlFfSEFORExFRCBpZiB0aGUgc3RhdHVzDQo+ID4gPiByZWdpc3RlciBpbmRp
Y2F0ZXMgdGhhdCB0aGUgZXZlbnQgd2UncmUgaGFuZGxpbmcgaW4gdGhlIGlycSBoYW5kbGVyDQo+
ID4gPiB3YXMgZ2VudWluZWx5IGludGVuZGVkIGZvciB0aGlzIGRyaXZlci4gT3RoZXJpd3NlIHRo
ZSBpbnRlcnJ1cHQNCj4gPiA+IHN1YnN5c3RlbSB3aWxsIGFzc3VtZSB0aGUgaW50ZXJydXB0IHdh
cyBoYW5kbGVkIHN1Y2Nlc3NmdWxseSBldmVuIHRob3VnaA0KPiBpdCB3YXNuJ3QgYXQgYWxsLg0K
PiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxnaXRAYW5kcmVkLm5l
dD4NCj4gPiA+IENjOiAiSG9yaWEgR2VhbnTEgyIgPGhvcmlhLmdlYW50YUBueHAuY29tPg0KPiA+
ID4gQ2M6IEF5bWVuIFNnaGFpZXIgPGF5bWVuLnNnaGFpZXJAbnhwLmNvbT4NCj4gPiA+IENjOiBI
ZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+DQo+ID4gPiBDYzogIkRhdmlk
IFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+DQo+ID4gPiBDYzogUm9iIEhlcnJpbmcg
PHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gPiA+IENjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFu
ZEBhcm0uY29tPg0KPiA+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4g
PiA+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiBDYzog
UGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4gPiA+IENj
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+ID4gPiBDYzogTlhQIExpbnV4
IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPg0KPiA+ID4gQ2M6IERtaXRyeSBUb3Jva2hvdiA8ZG1p
dHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gPiA+IENjOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVh
bmdAbnhwLmNvbT4NCj4gPiA+IENjOiBSb2JpbiBHb25nIDx5aWJpbi5nb25nQG54cC5jb20+DQo+
ID4gPiBDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gQ2M6IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+ID4gPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnDQo+ID4gPg0K
PiA+ID4gLS0tDQo+ID4gPiB2MjoNCj4gPiA+ICogbm8gY2hhbmdlcw0KPiA+ID4gLS0tDQo+ID4g
PiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9zbnZzX3B3cmtleS5jIHwgMTIgKysrKysrKy0tLS0t
DQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9zbnZzX3B3
cmtleS5jDQo+ID4gPiBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvc252c19wd3JrZXkuYw0KPiA+
ID4gaW5kZXggMzgyZDJhZTgyYzliLi45ODA4Njc4ODZiMzQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9k
cml2ZXJzL2lucHV0L2tleWJvYXJkL3NudnNfcHdya2V5LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
aW5wdXQva2V5Ym9hcmQvc252c19wd3JrZXkuYw0KPiA+ID4gQEAgLTgyLDcgKzgyLDkgQEAgc3Rh
dGljIGlycXJldHVybl90IGlteF9zbnZzX3B3cmtleV9pbnRlcnJ1cHQoaW50DQo+ID4gPiBpcnEs
IHZvaWQNCj4gPiA+ICpkZXZfaWQpDQo+ID4gPiAgCWNsa19lbmFibGUocGRhdGEtPmNsayk7DQo+
ID4gPg0KPiA+ID4gIAlyZWdtYXBfcmVhZChwZGF0YS0+c252cywgU05WU19MUFNSX1JFRywgJmxw
X3N0YXR1cyk7DQo+ID4gPiAtCWlmIChscF9zdGF0dXMgJiBTTlZTX0xQU1JfU1BPKSB7DQo+ID4g
PiArCWxwX3N0YXR1cyAmPSBTTlZTX0xQU1JfU1BPOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAobHBf
c3RhdHVzKSB7DQo+ID4gPiAgCQlpZiAocGRhdGEtPm1pbm9yX3JldiA9PSAwKSB7DQo+ID4gPiAg
CQkJLyoNCj4gPiA+ICAJCQkgKiBUaGUgZmlyc3QgZ2VuZXJhdGlvbiBpLk1YWzZ8N10gU29DcyBv
bmx5IHNlbmQgYW4gQEANCj4gLTk4LDE0DQo+ID4gPiArMTAwLDE0IEBAIHN0YXRpYyBpcnFyZXR1
cm5fdCBpbXhfc252c19wd3JrZXlfaW50ZXJydXB0KGludCBpcnEsDQo+ID4gPiArdm9pZA0KPiA+
ID4gKmRldl9pZCkNCj4gPiA+ICAJCQltb2RfdGltZXIoJnBkYXRhLT5jaGVja190aW1lciwNCj4g
PiA+ICAJCQkgICAgICAgICAgamlmZmllcyArIG1zZWNzX3RvX2ppZmZpZXMoREVCT1VOQ0VfVElN
RSkpOw0KPiA+ID4gIAkJfQ0KPiA+ID4gLQl9DQo+ID4gPg0KPiA+ID4gLQkvKiBjbGVhciBTUE8g
c3RhdHVzICovDQo+ID4gPiAtCXJlZ21hcF93cml0ZShwZGF0YS0+c252cywgU05WU19MUFNSX1JF
RywgU05WU19MUFNSX1NQTyk7DQo+ID4gPiArCQkvKiBjbGVhciBTUE8gc3RhdHVzICovDQo+ID4g
PiArCQlyZWdtYXBfd3JpdGUocGRhdGEtPnNudnMsIFNOVlNfTFBTUl9SRUcsIFNOVlNfTFBTUl9T
UE8pOw0KPiA+IEJ1dCBpcnEgc3Rvcm0gd2lsbCBjb21lIGluIG9uY2UgdGhlcmUgaXMgb3RoZXIg
aW50ZXJydXB0IHRyaWdnZXJlZCBhcw0KPiA+IHVuZXhwZWN0ZWQsIGFsdGhvdWdoIEkgbmV2ZXIg
bWV0IGl0IGJlZm9yZS4gQ291bGQgd2UgZHJvcCB0aGlzIHBhdGNoIG5vdz8NCj4gT3RoZXJzIGFy
ZSBvayBmb3IgbWUuDQo+IA0KPiBJIGRvbid0IGhhdmUgc3Ryb25nIGZlZWxpbmdzIGFib3V0IHRo
aXMgcGF0Y2gsIGJ1dCB0aGlzIGJpdCBtZXJlbHkgY2hhbmdlcw0KPiBiZWhhdmlvdXIgdG8gY2xl
YXIgU1AwIGlmIFNQMCB3YXMgaW4gZmFjdCAhPSAwIGluIHRoZSBmaXJzdCBwbGFjZSwgd2hlcmVh
cyBiZWZvcmUNCj4gU1AwIHdhcyBhbHdheXMgY2xlYXJlZCwgZXZlbiBpZiBpdCB3YXMgPT0gMCBh
bnl3YXkuIFNlZW1zIG1vcmUgbG9naWNhbCBpbiBteQ0KPiBleWVzLg0KU2VlbXMgd2UgY2FyZSBz
b21ldGhpbmcgbmV2ZXIgaGFwcGVuOikgSSdtIG9rYXkgaWYgeW91IHJlYWxseSB3YW50IHRvIGRv
IHRoYXQuDQo+IA0KPiANCj4gPiBSZXZpZXdlZC1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0Bu
eHA+DQo+ID4gPiArCX0NCj4gPiA+DQo+ID4gPiAgCWNsa19kaXNhYmxlKHBkYXRhLT5jbGspOw0K
PiA+ID4NCj4gPiA+IC0JcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+ID4gKwlyZXR1cm4gbHBfc3Rh
dHVzID8gSVJRX0hBTkRMRUQgOiBJUlFfTk9ORTsNCj4gDQo+IElmIHlvdSdyZSB0YWxraW5nIGFi
b3V0IHRoaXMgcGFydCwgdGhlIHJ0Yy1zbnZzIGRyaXZlciBkb2VzIHRoZSBzYW1lIGluIGl0cw0K
PiBpbnRlcnJ1cHQgaGFuZGxlci4NCj4gSW4gb3RoZXIgd29yZHMsIHRoaXMgZHJpdmVyIGhlcmUg
Y291bGQgcHJldmVudCB0aGUgcnRjLXNudnMgZHJpdmVyIGZyb20gc2VlaW5nIGl0cw0KPiBldmVu
dHMNCkJ1dCBydGMgZHJpdmVyIGhhcyBhbm90aGVyIGludGVycnVwdCBudW1iZXIsIGFuZCBzbnZz
X3B3cmtleSBkcml2ZXIganVzdCB0b3VjaCBTUE8gYml0DQphcyBiZWxvdzoNCnJlZ21hcF93cml0
ZShwZGF0YS0+c252cywgU05WU19MUFNSX1JFRywgU05WU19MUFNSX1NQTyk7DQpTbyBJIGRvbid0
IHRoaW5rIGl0IGNvdWxkIGltcGFjdCBydGMtc252cyBkcml2ZXIuIEJ1dCB5b3UgcmVtaW5kIG1l
IHJ0Yy1zbnZzIGRyaXZlciBtYXkgY2xlYXIgU1BPIHN0YXR1cywgYmVjYXVzZSBscHNyIGlzIHJl
YWQgZnJvbSBTTlZTX0xQU1Igd2hpY2ggbWF5IFNQTyBoYXMgYWxyZWFkeSBiZWVuIHNldC4NCnJl
Z21hcF93cml0ZShkYXRhLT5yZWdtYXAsIGRhdGEtPm9mZnNldCArIFNOVlNfTFBTUiwgbHBzcik7
DQpJJ2xsIHNlbmQgYSBwYXRjaCBmb3IgZml4IHRoYXQgcG90ZW50aWFsIGlzc3VlLiBCZXNpZGVz
LCBpZiB5b3UgcmVhbGx5IHdhbnQgdG8gZm9sbG93IHJ0YyBkcml2ZXIgcGxlYXNlIGluaXRpYWxp
emUgbHBfc3RhdHVzIHdpdGggMC4gIA0KPiANCj4gDQo+IA0KPiBDaGVlcnMsDQo+IEFuZHJlJw0K
PiANCj4gDQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgdm9pZCBpbXhfc252c19wd3Jr
ZXlfYWN0KHZvaWQgKnBkYXRhKQ0KPiA+ID4gLS0NCj4gPiA+IDIuMjMuMC5yYzENCg0K
