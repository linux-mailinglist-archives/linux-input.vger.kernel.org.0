Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCAA24828
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 08:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfEUGgX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 02:36:23 -0400
Received: from mail-eopbgr130083.outbound.protection.outlook.com ([40.107.13.83]:7681
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbfEUGgX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 02:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39Mvynibad5W5A+Yu0zTE2Wge4YgwntWSNR6AYqcXKA=;
 b=PCnrq34+z+kJQUgul6ldSQXLyH8tKypCY1f98HVyUzosIs1+yE+r4YgjhMeJtDqG2+gjarPUowaq9O0BPAsfjaKqfyhQgkvr8sQwebl3WPkUe/+xHfgME2Kya8knzCKtpdOmYUstfvUuRRHetYNriZgiwl3ZmAm1GWhSCKU3CXM=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3804.eurprd04.prod.outlook.com (52.134.73.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 06:36:17 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec%5]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 06:36:17 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [RESEND] input: keyboard: imx: make sure keyboard can always wake
 up system
Thread-Topic: [RESEND] input: keyboard: imx: make sure keyboard can always
 wake up system
Thread-Index: AQHU6odaZd/8EWsin0yXXO1zjKS4q6Z1V6CAgAALV+A=
Date:   Tue, 21 May 2019 06:36:17 +0000
Message-ID: <DB3PR0402MB3916ED371BF79D823FBC5171F5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
 <20190521053047.GG183429@dtor-ws>
In-Reply-To: <20190521053047.GG183429@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d536b2d-5bfd-464c-5d03-08d6ddb6a0e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3804;
x-ms-traffictypediagnostic: DB3PR0402MB3804:
x-microsoft-antispam-prvs: <DB3PR0402MB3804F9B435244AFEF0142F4FF5070@DB3PR0402MB3804.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(39860400002)(366004)(136003)(13464003)(189003)(199004)(2351001)(316002)(54906003)(14444005)(53936002)(25786009)(14454004)(256004)(6246003)(478600001)(4326008)(68736007)(76176011)(6916009)(99286004)(26005)(7696005)(6436002)(2906002)(55016002)(8676002)(81156014)(81166006)(5640700003)(52536014)(8936002)(305945005)(229853002)(86362001)(7736002)(3846002)(6116002)(486006)(1361003)(102836004)(33656002)(11346002)(44832011)(186003)(53546011)(6506007)(446003)(476003)(66066001)(74316002)(71190400001)(71200400001)(2501003)(66446008)(64756008)(66476007)(66946007)(5660300002)(66556008)(73956011)(9686003)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3804;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LlAk3KZDgiq0AKNLCRWcPOTQyDMSK2ogSGQIim24BbMQDNLrq4Xl+F6rMfRZPaTEmOp0sNFrRriiah7whz4YJw1dJ0yTDyJ6v0Zp7YxcnbKyDvNZgulUStJfdQzjjrhxsdbAl7zbn/MOr5wAHveBNxmr3LhY8Cbi/Bx971Fdt7cfxtwUz7X5yL8Gm9JFaGotACIFQ6fEFAlcTaf5t9xgEkpcl2TCUJuAB3NVh1y6RBlI6W3KTezRP2hoLe8bERsuKo88rB5jR+aj5SWTmqyaLS8BDmPeiDiyOiIUhNc0C4uLkjHq+bfOmcUQvAELgvw4yvmIBTsUrz79NipaqWzxq7e2LA1vBK0/iea5iTtB7DGfF8T0THHh0RpTSz2SdS2kVz2jd87drI2BDHwtPGEYBDcZ2QoLndxr1HiGE9PFkEs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d536b2d-5bfd-464c-5d03-08d6ddb6a0e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 06:36:17.1029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3804
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIERtaXRyeQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRtaXRy
eS50b3Jva2hvdkBnbWFpbC5jb20gW21haWx0bzpkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tXQ0K
PiBTZW50OiBUdWVzZGF5LCBNYXkgMjEsIDIwMTkgMTozMSBQTQ0KPiBUbzogQW5zb24gSHVhbmcg
PGFuc29uLmh1YW5nQG54cC5jb20+DQo+IENjOiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVy
QHBlbmd1dHJvbml4LmRlOw0KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWls
LmNvbTsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4
LQ0KPiBpbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JFU0VORF0gaW5w
dXQ6IGtleWJvYXJkOiBpbXg6IG1ha2Ugc3VyZSBrZXlib2FyZCBjYW4gYWx3YXlzDQo+IHdha2Ug
dXAgc3lzdGVtDQo+IA0KPiBIaSBBbnNvbiwNCj4gT24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMDE6
NDA6MTZBTSArMDAwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4gVGhlcmUgYXJlIHNldmVyYWwg
c2NlbmFyaW9zIHRoYXQga2V5Ym9hcmQgY2FuIE5PVCB3YWtlIHVwIHN5c3RlbSBmcm9tDQo+ID4g
c3VzcGVuZCwgZS5nLiwgaWYgYSBrZXlib2FyZCBpcyBkZXByZXNzZWQgYmV0d2VlbiBzeXN0ZW0g
ZGV2aWNlDQo+ID4gc3VzcGVuZCBwaGFzZSBhbmQgZGV2aWNlIG5vaXJxIHN1c3BlbmQgcGhhc2Us
IHRoZSBrZXlib2FyZCBJU1Igd2lsbCBiZQ0KPiA+IGNhbGxlZCBhbmQgYm90aCBrZXlib2FyZCBk
ZXByZXNzIGFuZCByZWxlYXNlIGludGVycnVwdHMgd2lsbCBiZQ0KPiA+IGRpc2FibGVkLCB0aGVu
IGtleWJvYXJkIHdpbGwgbm8gbG9uZ2VyIGJlIGFibGUgdG8gd2FrZSB1cCBzeXN0ZW0uDQo+ID4g
QW5vdGhlciBzY2VuYXJpbyB3b3VsZCBiZSwgaWYgYSBrZXlib2FyZCBpcyBrZXB0IGRlcHJlc3Nl
ZCwgYW5kIHRoZW4NCj4gPiBzeXN0ZW0gZ29lcyBpbnRvIHN1c3BlbmQsIHRoZSBleHBlY3RlZCBi
ZWhhdmlvciB3b3VsZCBiZSB3aGVuIGtleWJvYXJkDQo+ID4gaXMgcmVsZWFzZWQsIHN5c3RlbSB3
aWxsIGJlIHdha2VkIHVwLCBidXQgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBjYW4NCj4gPiBOT1Qg
YWNoaWV2ZSB0aGF0LCBiZWNhdXNlIGJvdGggZGVwcmVzcyBhbmQgcmVsZWFzZSBpbnRlcnJ1cHRz
IGFyZQ0KPiA+IGRpc2FibGVkIGluIElTUiwgYW5kIHRoZSBldmVudCBjaGVjayBpcyBzdGlsbCBp
biBwcm9ncmVzcy4NCj4gPg0KPiA+IFRvIGZpeCB0aGVzZSBpc3N1ZXMsIG5lZWQgdG8gbWFrZSBz
dXJlIGtleWJvYXJkJ3MgZGVwcmVzcyBvciByZWxlYXNlDQo+ID4gaW50ZXJydXB0IGlzIGVuYWJs
ZWQgYWZ0ZXIgbm9pcnEgZGV2aWNlIHN1c3BlbmQgcGhhc2UsIHRoaXMgcGF0Y2gNCj4gPiBtb3Zl
cyB0aGUgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2sgdG8gbm9pcnEgc3VzcGVuZC9yZXN1bWUgcGhh
c2UsIGFuZA0KPiA+IGVuYWJsZSB0aGUgY29ycmVzcG9uZGluZyBpbnRlcnJ1cHQgYWNjb3JkaW5n
IHRvIGN1cnJlbnQga2V5Ym9hcmQgc3RhdHVzLg0KPiANCj4gSSBiZWxpZXZlIGl0IGlzIHBvc3Np
YmxlIGZvciBJUlEgdG8gYmUgZGlzYWJsZWQgYW5kIHN0aWxsICBiZWluZyBlbmFibGVkIGFzDQo+
IHdha2V1cCBzb3VyY2UuIFdoYXQgaGFwcGVucyBpZiB5b3UgY2FsbCBkaXNhYmxlX2lycSgpIGJl
Zm9yZSBkaXNhYmxpbmcgdGhlDQo+IGNsb2NrPw0KDQpEb2luZyBiZWxvdyBkb2VzIE5PVCBmaXgg
dGhlIHNjZW5hcmlvL2lzc3VlIDEwMCUsIGlmIHRoZSBrZXlwYWQncyBJUlEgYXJyaXZlZCBkdXJp
bmcgc3VzcGVuZA0KcGhhc2UgYnV0IGJlZm9yZSBkaXNhYmxpbmcgaXRzIElSUSBpbiBpdHMgc3Vz
cGVuZCBjYWxsYmFjaywgdGhlbiBpc3N1ZSBpcyBzdGlsbCB0aGVyZSwgYXMgdGhlIGlzc3VlIGlz
DQp0aGF0IHdoZW4gc3lzdGVtIHN1c3BlbmQsIGtleXBhZCdzIGlycSBhcnJpdmVkIGR1cmluZyBz
dXNwZW5kIGFuZCBub2lycSBzdXNwZW5kIHBoYXNlLCB0aGVuDQprZXlwYWQncyBoYXJkd2FyZSBp
bnRlcnJ1cHQgZGV0ZWN0aW9uIHdpbGwgYmUgZGlzYWJsZWQgaW4gdGhlIElTUiBoYW5kbGVyLCBh
bmQgdGhlIHRpbWVyIGV2ZW50DQpzZXR1cCBieSBJU1IgaGFuZGxlciBpcyBOT1QgZmlyZWQsIGlt
eF9rZXlwYWRfY2hlY2tfZm9yX2V2ZW50cygpIGlzIE5PVCBleGVjdXRlZCBhbmQgaGFyZHdhcmUN
CmtleXBhZCdzIGRlcHJlc3MvcmVsZWFzZSBpbnRlcnJ1cHQgaXMgTk9UIHJlLWVuYWJsZWQgeWV0
LCBzbyBpdCBjYW4gTk9UIHdha2UgdXAgc3lzdGVtIGFueW1vcmUuLi4NCg0KU28gSSB0aGluayB0
aGUgc29saWQgZml4IGlzIHRvIG1ha2Ugc3VyZSBrZXlwYWQgY2FuIGdlbmVyYXRlIElSUSAoZWl0
aGVyIGRlcHJlc3Mgb3IgcmVsZWFzZSkgYXQgYW55IHRpbWUNCmR1cmluZyBzeXN0ZW0gc3VzcGVu
ZCBmbG93Lg0KDQorKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2lteF9rZXlwYWQuYw0KQEAg
LTUzMyw2ICs1MzMsOCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGlteF9rYmRfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQogICAgICAgIC8qIGlteCBrYmQgY2FuIHdha2UgdXAgc3lz
dGVtIGV2ZW4gY2xvY2sgaXMgZGlzYWJsZWQgKi8NCiAgICAgICAgbXV0ZXhfbG9jaygmaW5wdXRf
ZGV2LT5tdXRleCk7DQoNCisgICAgICAgZGlzYWJsZV9pcnEoa2JkLT5pcnEpOw0KKw0KICAgICAg
ICBpZiAoaW5wdXRfZGV2LT51c2VycykNCiAgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnBy
ZXBhcmUoa2JkLT5jbGspOw0KDQoNCkBAIC01NjIsNiArNTY5LDggQEAgc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBpbXhfa2JkX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycl9jbGs7DQogICAgICAgIH0NCg0KKyAgICAgICBlbmFibGVf
aXJxKGtiZC0+aXJxKTsNCisNCiBlcnJfY2xrOg0KDQpBbnNvbi4NCg0KPiANCj4gVGhhbmtzLg0K
PiANCj4gLS0NCj4gRG1pdHJ5DQo=
