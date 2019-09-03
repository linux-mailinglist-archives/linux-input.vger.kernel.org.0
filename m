Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0358A61BE
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 08:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfICGsv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 02:48:51 -0400
Received: from mail-eopbgr80071.outbound.protection.outlook.com ([40.107.8.71]:48085
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726016AbfICGsv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 02:48:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYrQ9vWMBwly0vq+OZuzCPyL+VoqX/FitzDWr8yikgUHxNaNmS5s4RYO4M7t6GThaoLQWLcHeXavATtqod49rIKnttW2hAesaxWheOztrVUqzPZFwZep2GYLE47Y2cbgoR6hz5lgyT4VxIQMbVjeJRbq4F4/VwzfpuisCFFXKJxxBSLx8f0LXr1gu658kp6DFvCqv1mFJ21ek0U786yoBDYUMQaPAmC9QgBS42xpkKO1T3VFv/y2hpvkwEIYdT0DF7o7raQxr62txPTv10fevAAOEwcd0drk/fmxjllmQNNYGkyPC+A+0N9p/M/HGGFIPYu3Lby34Pscfu4Lbu+dew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8tG+k6Qp/yp8sDOfTFJX8sUpAcp11Sdf3DdxHxOJGY=;
 b=OTvRmolkcDf199uOTGzyj5+FJRzoGEEthsk0OWpxlFiBDN/owknrBLDfK+5JzY8WlDrpN4PD7+o2/C+8y6If2b6xsabs1tsaFY1oxDCSJ6Dm66HUyEB5v1RgnaUJWJiIvEKGS+Mjo27W9kYjtRHL250z56yqK6mH+Ohy945NO3B0buN+NVd2xbh2opMSZHu6m7sqqv7bPsFy9KMc6SoNsZBuAKfrHzPGDQtyUj3YV773Z35eTKmJBnlKKJAapzBcDEEF7RJiMk/UQ9TLdu3lMi8KBogE1DRR7fUAq/XPKDWCJx4bGgctORcHG7EwPoNMPD9E/B3YMgvmEZ1wRO2ePg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8tG+k6Qp/yp8sDOfTFJX8sUpAcp11Sdf3DdxHxOJGY=;
 b=h2sJXFW0qewmh9q6DND5E+KCAxIAV8sR4qkPFqxg94CKbZCkm/FFKESmtFRQr3FyrnRk3y6QnuI3/ub6OuXtw5uWy1IBBMlr3+cIY3bxwVcQVsQf+aef1Bm2IzbHeWmT6Q0TcpLuKXo94n3l7UcgxKycIs75FCBS/LwkuZeO+Vk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3945.eurprd04.prod.outlook.com (52.134.65.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Tue, 3 Sep 2019 06:48:45 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2199.021; Tue, 3 Sep 2019
 06:48:45 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
Thread-Topic: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
Thread-Index: AQHVYfwAkBJd0uw8O0iWCkl8q7ZXAqcZfd4AgAACgQA=
Date:   Tue, 3 Sep 2019 06:48:45 +0000
Message-ID: <DB3PR0402MB391602C6B425DD7EBFB9AF1DF5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com>
 <6d8dd5df-02da-b4cd-e61d-a4a15d0bf0c8@pengutronix.de>
In-Reply-To: <6d8dd5df-02da-b4cd-e61d-a4a15d0bf0c8@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8adba28f-3173-4b44-3242-08d7303ac407
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3945;
x-ms-traffictypediagnostic: DB3PR0402MB3945:|DB3PR0402MB3945:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3945968145EB21AEBFD73BF6F5B90@DB3PR0402MB3945.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(189003)(199004)(81166006)(3846002)(2501003)(966005)(66556008)(66446008)(64756008)(76116006)(53936002)(6116002)(476003)(5660300002)(45080400002)(8936002)(86362001)(66476007)(6436002)(66946007)(6306002)(55016002)(7416002)(316002)(4326008)(99286004)(52536014)(6246003)(81156014)(44832011)(9686003)(7696005)(486006)(76176011)(110136005)(26005)(71190400001)(71200400001)(25786009)(478600001)(8676002)(53546011)(6506007)(256004)(7736002)(2201001)(186003)(2906002)(74316002)(229853002)(66066001)(102836004)(11346002)(33656002)(446003)(305945005)(14454004)(921003)(1121003)(309714004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3945;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I7KXuiIJZ1KXydk58VpZ5IEmkFOTLXbZGZqiS8CFR7kZQ0pr5vM/PkEz8N3H5m2Bcqht6MP1Lzu7wcVbGH8XzBq1/h4gMDvq3AAvUKgi7/x96SL5jpXOZnqrnb5TY2VOMgi5x6asj+nS+3b/nUO9wS41amyLjovG9NUUGHYzZ/lSO0mlO4pcH/O++hQV2VEGpTvEzGALBS5OFD7xHHw/wZ3ys3uNZv76vQd4y2olfaARIYkLFvXNLQQXWHexMF+zOXE5im2IPgEG4lfTvNEeQ9iBI0vHQ8Rzr+/ULezdDTSVeMFc5+7TYyORTiCy5fpQGHzFkPpHc8YCmyaIGExaKHp9b6dEB/g7SD+pEZMqxdiACypJbzFnnjd3ZaVogw5J9eM7pev+Wtbg+Rw5jqvHVy9rPZD+lCvqkhiXVmiFAcM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adba28f-3173-4b44-3242-08d7303ac407
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 06:48:45.0657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZCn0L15niN6qi2c8L8kbBbMMdGBHcECcXwbWv4YeMnezi8OhiKmEK0Zldz+z28Jmnw0Dzt/qQTgkaUpO2gkOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3945
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIE9sZWtzaWoNCg0KPiBPbiAwMy4wOS4xOSAxNjowMywgQW5zb24gSHVhbmcgd3JvdGU6DQo+
ID4gaS5NWDhRWFAgaXMgYW4gQVJNdjggU29DIHdoaWNoIGhhcyBhIENvcnRleC1NNCBzeXN0ZW0g
Y29udHJvbGxlcg0KPiA+IGluc2lkZSwgdGhlIHN5c3RlbSBjb250cm9sbGVyIGlzIGluIGNoYXJn
ZSBvZiBjb250cm9sbGluZyBwb3dlciwgY2xvY2sNCj4gPiBhbmQgcG93ZXIga2V5IGV0Yy4uDQo+
ID4NCj4gPiBBZGRzIGkuTVggc3lzdGVtIGNvbnRyb2xsZXIgcG93ZXIga2V5IGRyaXZlciBzdXBw
b3J0LCBMaW51eCBrZXJuZWwgaGFzDQo+ID4gdG8gY29tbXVuaWNhdGUgd2l0aCBzeXN0ZW0gY29u
dHJvbGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkgSVBDIHRvIGdldA0KPiA+IHBvd2VyIGtleSdz
IHN0YXR1cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFu
Z0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgVjE6DQo+ID4gCS0gcmVtb3Zl
ICJ3YWtldXAtc291cmNlIiBwcm9wZXJ0eSBvcGVyYXRpb24sIHNjdSBwb3dlciBrZXkgdXNlcw0K
PiBnZW5lcmljIHNjdSBpcnEsDQo+ID4gCSAgbm8gbmVlZCB0byBoYXZlIHRoaXMgcHJvcGVydHkg
Zm9yIGRldmljZSB3YWtldXAgb3BlcmF0aW9uLg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9pbnB1
dC9rZXlib2FyZC9LY29uZmlnICAgICAgICAgfCAgIDcgKysNCj4gPiAgIGRyaXZlcnMvaW5wdXQv
a2V5Ym9hcmQvTWFrZWZpbGUgICAgICAgIHwgICAxICsNCj4gPiAgIGRyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvaW14X3NjX3B3cmtleS5jIHwgMTY5DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNzcgaW5zZXJ0aW9ucygrKQ0KPiA+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvaW14X3NjX3B3cmtleS5j
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnDQo+
ID4gYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWcgaW5kZXggMmU2ZDI4OC4uM2FhZWI5
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWcNCj4gPiAr
KysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWcNCj4gPiBAQCAtNDY5LDYgKzQ2OSwx
MyBAQCBjb25maWcgS0VZQk9BUkRfSU1YDQo+ID4gICAJICBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUNCj4gPiAgIAkgIG1vZHVsZSB3aWxsIGJl
IGNhbGxlZCBpbXhfa2V5cGFkLg0KPiA+DQo+ID4gK2NvbmZpZyBLRVlCT0FSRF9JTVhfU0NfUFdS
S0VZDQo+ID4gKwl0cmlzdGF0ZSAiSU1YIFNDVSBQb3dlciBLZXkgRHJpdmVyIg0KPiA+ICsJZGVw
ZW5kcyBvbiBJTVhfU0NVDQo+ID4gKwloZWxwDQo+ID4gKwkgIFRoaXMgaXMgdGhlIHN5c3RlbSBj
b250cm9sbGVyIHBvd2Vya2V5IGRyaXZlciBmb3IgTlhQIGkuTVggU29DcyB3aXRoDQo+ID4gKwkg
IHN5c3RlbSBjb250cm9sbGVyIGluc2lkZS4NCj4gDQo+IFRoZSBLRVkgaXMgY29uZmlndXJhYmxl
IG92ZXIgZGV2aWNldHJlZSwgd2h5IGlzIGl0IGNhbGxlZCBQV1JLRVk/IEl0IGxvb2tzIGZvcg0K
PiBtZSBhcyBnZW5lcmljIFNDVSBrZXkgaGFuZGxlci4NCg0KV2UgYWx3YXlzIHVzZSBpdCBhcyBw
b3dlciBrZXksIE5PVCBhIGdlbmVyaWMga2V5LCBhcyBpdCBoYXMgSFcgZnVuY3Rpb24gZGVzaWdu
ZWQNCmZvciBwb3dlciBrZXkgcHVycG9zZS4gDQoNCj4gDQo+ID4gICBjb25maWcgS0VZQk9BUkRf
TkVXVE9ODQo+ID4gICAJdHJpc3RhdGUgIk5ld3RvbiBrZXlib2FyZCINCj4gPiAgIAlzZWxlY3Qg
U0VSSU8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZQ0K
PiA+IGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZSBpbmRleCA5NTEwMzI1Li45ZWE1
NTg1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvTWFrZWZpbGUNCj4g
PiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlDQo+ID4gQEAgLTI5LDYgKzI5
LDcgQEAgb2JqLSQoQ09ORklHX0tFWUJPQVJEX0hJTCkJCSs9IGhpbF9rYmQubw0KPiA+ICAgb2Jq
LSQoQ09ORklHX0tFWUJPQVJEX0hJTF9PTEQpCQkrPSBoaWxrYmQubw0KPiA+ICAgb2JqLSQoQ09O
RklHX0tFWUJPQVJEX0lQQVFfTUlDUk8pCSs9IGlwYXEtbWljcm8ta2V5cy5vDQo+ID4gICBvYmot
JChDT05GSUdfS0VZQk9BUkRfSU1YKQkJKz0gaW14X2tleXBhZC5vDQo+ID4gK29iai0kKENPTkZJ
R19LRVlCT0FSRF9JTVhfU0NfUFdSS0VZKQkrPSBpbXhfc2NfcHdya2V5Lm8NCj4gPiAgIG9iai0k
KENPTkZJR19LRVlCT0FSRF9IUDZYWCkJCSs9IGpvcm5hZGE2ODBfa2JkLm8NCj4gPiAgIG9iai0k
KENPTkZJR19LRVlCT0FSRF9IUDdYWCkJCSs9IGpvcm5hZGE3MjBfa2JkLm8NCj4gPiAgIG9iai0k
KENPTkZJR19LRVlCT0FSRF9MS0tCRCkJCSs9IGxra2JkLm8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pbnB1dC9rZXlib2FyZC9pbXhfc2NfcHdya2V5LmMNCj4gPiBiL2RyaXZlcnMvaW5wdXQv
a2V5Ym9hcmQvaW14X3NjX3B3cmtleS5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwLi41M2FhOWE0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZl
cnMvaW5wdXQva2V5Ym9hcmQvaW14X3NjX3B3cmtleS5jDQo+ID4gQEAgLTAsMCArMSwxNjkgQEAN
Cj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiAr
ICogQ29weXJpZ2h0IDIwMTkgTlhQLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxs
aW51eC9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvZmlybXdhcmUvaW14L3NjaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5wdXQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvamlmZmllcy5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiArDQo+ID4gKyNk
ZWZpbmUgREVCT1VOQ0VfVElNRQkxMDANCj4gPiArI2RlZmluZSBSRVBFQVRfSU5URVJWQUwJNjAN
Cj4gPiArDQo+ID4gKyNkZWZpbmUgU0NfSVJRX0JVVFRPTgkJMQ0KPiA+ICsjZGVmaW5lIFNDX0lS
UV9HUk9VUF9XQUtFCTMNCj4gPiArI2RlZmluZSBJTVhfU0NfTUlTQ19GVU5DX0dFVF9CVVRUT05f
U1RBVFVTCTE4DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgaW14X3B3cmtleV9kcnZfZGF0YSB7DQo+ID4g
KwlpbnQga2V5Y29kZTsNCj4gPiArCWJvb2wga2V5c3RhdGU7ICAvKiAxOiBwcmVzc2VkLCAwOiBy
ZWxlYXNlICovDQo+ID4gKwlib29sIGRlbGF5X2NoZWNrOw0KPiA+ICsJc3RydWN0IGRlbGF5ZWRf
d29yayBjaGVja193b3JrOw0KPiA+ICsJc3RydWN0IGlucHV0X2RldiAqaW5wdXQ7DQo+ID4gK307
DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgaW14X3NjX21zZ19wd3JrZXkgew0KPiA+ICsJc3RydWN0IGlt
eF9zY19ycGNfbXNnIGhkcjsNCj4gPiArCXU4IHN0YXRlOw0KPiA+ICt9Ow0KPiA+ICtzdGF0aWMg
c3RydWN0IGlteF9wd3JrZXlfZHJ2X2RhdGEgKnBkYXRhOw0KPiANCj4gV2h5IGlzIGl0IGdsb2Jh
bCBzdHJ1Y3Q/IEl0IHNlZW1zIHRvIGJlIGZsZXhpYmxlIGNvbmZpZ3VyYWJsZSBvdmVyIGRldmlj
ZXRyZWUuDQo+IFNvIEkgd291bGQgYXNzdW1lIGl0IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBt
b3JlIHRoZW4gb25lIGJ1dHRvbi4gUGxlYXNlDQo+IHJlbW92ZSBnbG9iYWwgdmFyaWFibGVzLCBt
YWtlIGl0IGFsbG9jYXRhYmxlIHBlciBPRiBub2RlLg0KDQpUaGVyZSBpcyBPTkxZIG9uZSBidXR0
b24gYXZhaWxhYmxlIGZvciBTQyBrZXksIGJ1dCB5ZXMsIEkgdGhpbmsgSSBjYW4gbWFrZSB0aGUg
c3RydWN0dXJlDQpwcml2YXRlIGFuZCBnZXQgYWxsIG5lY2Vzc2FyeSBkYXRhIGZyb20gdGhlIHN0
cnVjdHVyZSB1c2luZyBjb250YWluZXJfb2YuDQoNCj4gDQo+IFBsZWFzZSB1c2UgZGlmZmVyZW50
IG5hbWUgInBkYXRhIiBpcyB1c3VhbGx5IHVzZWQgYXMgcGxhdGZvcm0gZGF0YS4gUGxlYXNlLA0K
PiB1c2UgInByaXYiLg0KDQpPSy4NCg0KPiANCj4gPiArc3RhdGljIHN0cnVjdCBpbXhfc2NfaXBj
ICpwd3JrZXlfaXBjX2hhbmRsZTsNCj4gDQo+IHNhbWUgYXMgYmVmb3JlLCBubyBnbG9iYWwgdmFy
aWFibGVzLg0KDQpXaWxsIG1vdmUgaXQgaW50byBwcml2YXRlIHBsYXRmb3JtIGRhdGEgc3RydWN0
dXJlLg0KDQo+IA0KPiA+ICsNCj4gPiArc3RhdGljIGludCBpbXhfc2NfcHdya2V5X25vdGlmeShz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiA+ICsJCQkJdW5zaWduZWQgbG9uZyBldmVudCwg
dm9pZCAqZ3JvdXApIHsNCj4gPiArCWlmICgoZXZlbnQgJiBTQ19JUlFfQlVUVE9OKSAmJiAoKih1
OCAqKWdyb3VwID09DQo+IFNDX0lSUV9HUk9VUF9XQUtFKQ0KPiA+ICsJICAgICYmICFwZGF0YS0+
ZGVsYXlfY2hlY2spIHsNCj4gPiArCQlwZGF0YS0+ZGVsYXlfY2hlY2sgPSAxOw0KPiA+ICsJCXNj
aGVkdWxlX2RlbGF5ZWRfd29yaygmcGRhdGEtPmNoZWNrX3dvcmssDQo+ID4gKwkJCQkgICAgICBt
c2Vjc190b19qaWZmaWVzKFJFUEVBVF9JTlRFUlZBTCkpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAr
CXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBpbXhfc2NfY2hlY2tf
Zm9yX2V2ZW50cyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspIHsNCj4gPiArCXN0cnVjdCBpbnB1
dF9kZXYgKmlucHV0ID0gcGRhdGEtPmlucHV0Ow0KPiA+ICsJc3RydWN0IGlteF9zY19tc2dfcHdy
a2V5IG1zZzsNCj4gPiArCXN0cnVjdCBpbXhfc2NfcnBjX21zZyAqaGRyID0gJm1zZy5oZHI7DQo+
ID4gKwlib29sIHN0YXRlOw0KPiA+ICsNCj4gPiArCWhkci0+dmVyID0gSU1YX1NDX1JQQ19WRVJT
SU9OOw0KPiA+ICsJaGRyLT5zdmMgPSBJTVhfU0NfUlBDX1NWQ19NSVNDOw0KPiA+ICsJaGRyLT5m
dW5jID0gSU1YX1NDX01JU0NfRlVOQ19HRVRfQlVUVE9OX1NUQVRVUzsNCj4gPiArCWhkci0+c2l6
ZSA9IDE7DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIEN1cnJlbnQgU0NVIGZpcm13YXJlIGRv
ZXMgTk9UIGhhdmUgcmV0dXJuIHZhbHVlIGZvcg0KPiA+ICsJICogdGhpcyBBUEksIHRoYXQgbWVh
bnMgaXQgaXMgYWx3YXlzIHN1Y2Nlc3NmdWwuDQo+ID4gKwkgKi8NCj4gDQo+IEl0IGlzIG5vdCB0
cnVlIGZvciB0aGUga2VybmVsIHBhcnQ6DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmVsaXhpci4NCj4gYm9vdGxpbi5j
b20lMkZsaW51eCUyRmxhdGVzdCUyRnNvdXJjZSUyRmRyaXZlcnMlMkZmaXJtd2FyZSUyRmlteCUy
Rg0KPiBpbXgtDQo+IHNjdS5jJTIzTDE1NyZhbXA7ZGF0YT0wMiU3QzAxJTdDYW5zb24uaHVhbmcl
NDBueHAuY29tJTdDN2E1ZWQzDQo+IGVmM2IyNTQxZTYxYmU4MDhkNzMwMzgxMGE5JTdDNjg2ZWEx
ZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MNCj4gMCU3QzAlN0M2MzcwMzA4ODk2Njk0ODkx
NDEmYW1wO3NkYXRhPWQzdXc2eDZXQ1BlYXZKdTNRWWY5bzljeHgNCj4gUng0bUphcjA0ZlFGTEY5
RWhFJTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBpbXhfc2N1X2NhbGxfcnBjKCkgbWF5IGZhaWwg
aW4gZGlmZmVyZW50IHdheXMgYW5kIHByb3ZpZGUgcHJvcGVyIGVycm9yIHZhbHVlLg0KPiBQbGVh
c2UgdXNlIGl0Lg0KDQpUaGVyZSBhcmUgYWJvdXQgMyBBUElzIGFyZSBzcGVjaWFsLCB0aGlzIEFQ
SSBpcyBvbmUgb2YgdGhlbSwgdGhpcyBBUEkgaGFzIG5vIHJldHVybiB2YWx1ZQ0KZnJvbSBTQ1Ug
RlcgQVBJLCBidXQgaXQgaGFzIHJlc3BvbnNlIGRhdGEgZnJvbSBpdCwgc28gdGhhdCBtZWFucyBp
ZiB3ZSBzZXQgdGhlIHJlc3BvbnNlDQp0byBmYWxzZSwgdGhlIHN0YWNrIHdpbGwgYmUgZnJlZSBh
bmQgbWFpbGJveCB3aWxsIGhhdmUgTlVMTCBwb2ludGVyIGlzc3VlIHdoZW4gcmVzcG9uc2UgDQpk
YXRhIHBhc3NlZCBmcm9tIFNDVSBGVy4gSWYgd2Ugc2V0IHRoZSByZXNwb25zZSB0byB0cnVlLCBh
cyB0aGUgU0NVIEZXIGhhcyBubyByZXR1cm4gdmFsdWUsDQp0aGUgcmV0dXJuIHZhbHVlIHdpbGwg
YmUgdGhlIG1zZy0+ZnVuYyB3aGljaCB3aWxsIGJlIGFscmVhZHkgZmFpbGVkLCB0aGF0IGlzIHdo
eSB3ZSBoYXZlIHRvIHNraXANCnRoZSByZXR1cm4gdmFsdWUgY2hlY2suIFRoaXMgaXMgb25lIHJl
c3RyaWN0aW9uL2J1ZyBvZiBTQ1UgRlcsIHdlIHdpbGwgbm90aWZ5IFNDVSBGVyBvd25lciB0bw0K
Zml4L2ltcHJvdmUuDQoNCg0KPiANCj4gPiArCWlteF9zY3VfY2FsbF9ycGMocHdya2V5X2lwY19o
YW5kbGUsICZtc2csIHRydWUpOyA+ICsJc3RhdGUgPQ0KPiBtc2cuc3RhdGU7DQo+IA0KPiB0aGUg
Y29udmVyc2F0aW9uIHU4IHRvIGJvb2wgc2hvdWxkIGJlIGRvbmUgaGVyZS4NCg0KT0suDQoNCj4g
DQo+ID4gKw0KPiA+ICsJaWYgKCFzdGF0ZSAmJiAhcGRhdGEtPmtleXN0YXRlKQ0KPiA+ICsJCXN0
YXRlID0gdHJ1ZTsNCj4gPiArDQo+ID4gKwlpZiAoc3RhdGUgXiBwZGF0YS0+a2V5c3RhdGUpIHsN
Cj4gPiArCQlwbV93YWtldXBfZXZlbnQoaW5wdXQtPmRldi5wYXJlbnQsIDApOw0KPiA+ICsJCXBk
YXRhLT5rZXlzdGF0ZSA9ICEhc3RhdGU7DQo+IA0KPiAJCXRoZSBzdGF0ZSBpcyBhbHJlYWR5IGJv
b2wuIFdoeSBkbyB5b3UgbmVlZCBleHRyYQ0KPiBjb252ZXJzYXRpb25zPw0KDQpXaWxsIHJlbW92
ZSBpdC4NCg0KPiANCj4gPiArCQlpbnB1dF9ldmVudChpbnB1dCwgRVZfS0VZLCBwZGF0YS0+a2V5
Y29kZSwgISFzdGF0ZSk7DQo+IA0KPiBzYW1lIGhlcmUuDQoNCldpbGwgcmVtb3ZlIGl0Lg0KDQo+
IA0KPiA+ICsJCWlucHV0X3N5bmMoaW5wdXQpOw0KPiA+ICsJCWlmICghc3RhdGUpDQo+ID4gKwkJ
CXBkYXRhLT5kZWxheV9jaGVjayA9IDA7DQo+ID4gKwkJcG1fcmVsYXgocGRhdGEtPmlucHV0LT5k
ZXYucGFyZW50KTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoc3RhdGUpDQo+ID4gKwkJc2No
ZWR1bGVfZGVsYXllZF93b3JrKCZwZGF0YS0+Y2hlY2tfd29yaywNCj4gPiArCQkJCSAgICAgIG1z
ZWNzX3RvX2ppZmZpZXMoREVCT1VOQ0VfVElNRSkpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrIGlteF9zY19wd3JrZXlfbm90aWZpZXIgPSB7DQo+ID4gKwkubm90
aWZpZXJfY2FsbCA9IGlteF9zY19wd3JrZXlfbm90aWZ5LCB9Ow0KPiA+ICsNCj4gPiArc3RhdGlj
IGludCBpbXhfc2NfcHdya2V5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsN
Cj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gPiAr
CXN0cnVjdCBpbnB1dF9kZXYgKmlucHV0Ow0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwly
ZXQgPSBpbXhfc2N1X2dldF9oYW5kbGUoJnB3cmtleV9pcGNfaGFuZGxlKTsNCj4gPiArCWlmIChy
ZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlwZGF0YSA9IGRldm1fa3phbGxv
YygmcGRldi0+ZGV2LCBzaXplb2YoKnBkYXRhKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIXBk
YXRhKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWlmIChvZl9wcm9wZXJ0
eV9yZWFkX3UzMihucCwgImxpbnV4LGtleWNvZGUiLCAmcGRhdGEtPmtleWNvZGUpID4gKw0KPiAJ
CXBkYXRhLT5rZXljb2RlID0gS0VZX1BPV0VSOw0KPiANCj4gQWNjb3JkaW5nIGJpbmRpbmcgZG9j
dW1lbnRhdGlvbiwgbGludXgsa2V5Y29kZSBpcyByZXF1ZXJlZCBwYXJhbWV0ZXIsIGluDQo+IHRo
aXMgY2FzZSB5b3Ugc2hvdWxkIGZhaWwgaWYgaXQgaXMgbm90IHNldC4NCg0KQWdyZWVkLCB3aWxs
IGFkZCBpdCBpbiBWMy4NCg0KVGhhbmtzLA0KQW5zb24uDQo=
