Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9725918340
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 03:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfEIBlO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 May 2019 21:41:14 -0400
Received: from mail-eopbgr50045.outbound.protection.outlook.com ([40.107.5.45]:1798
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725832AbfEIBlO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 May 2019 21:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yjIi5T4r1k+Y5iVTrYemlvNvQlXb4Ph7NXm6a6DFwg=;
 b=qdi0xmA0MepyFEWti81CqxQ9AWdcIuz1/4kC3xhacwIdGOfAUoik++ed81PI1Muyo9ZOB6U6IbIi93o7n/l9V84wi4tnZ6uQw2VFZuiG6mHUcYeuDsSdC+gqxK0bXsCYWO6r7Gt6ZUYMqJrLoz8q4NSVGROm/yc/HFPmKQk8eQs=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3929.eurprd04.prod.outlook.com (52.134.70.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Thu, 9 May 2019 01:41:09 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d%2]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 01:41:09 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [RESEND] input: keyboard: imx: make sure keyboard can always wake
 up system
Thread-Topic: [RESEND] input: keyboard: imx: make sure keyboard can always
 wake up system
Thread-Index: AQHU6odaZd/8EWsin0yXXO1zjKS4q6ZMPHMggBX/AtA=
Date:   Thu, 9 May 2019 01:41:09 +0000
Message-ID: <DB3PR0402MB39169FB6DECE7E1DAC178539F5330@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
 <DB3PR0402MB39167BC7D996F4FF70B5DD2FF53D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB39167BC7D996F4FF70B5DD2FF53D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 824628c3-f030-45f1-2ea8-08d6d41f6925
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3929;
x-ms-traffictypediagnostic: DB3PR0402MB3929:
x-microsoft-antispam-prvs: <DB3PR0402MB3929E7E9623EE2F9AE5B3114F5330@DB3PR0402MB3929.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(13464003)(5660300002)(316002)(52536014)(7696005)(99286004)(229853002)(478600001)(76176011)(68736007)(8936002)(102836004)(11346002)(53546011)(476003)(446003)(9686003)(81156014)(44832011)(55016002)(81166006)(33656002)(53936002)(73956011)(8676002)(2501003)(486006)(26005)(6436002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(110136005)(14454004)(86362001)(4326008)(66066001)(6246003)(25786009)(186003)(2201001)(6506007)(2906002)(7736002)(305945005)(256004)(14444005)(71200400001)(71190400001)(3846002)(6116002)(74316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3929;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 547PZskJZTgfEpZQCdALeeYZhPP4sg1kok9BdNe6JzvxzmJxKy76XWRWcwR3EhVqlmsiOwGXyinW0cBNFpl1B5Cz9r32e18XT8Uf0Zhr32Ush/MXmTv7R589TADPtNmOPVuuYivDDjdZPy5yDGIO6ZoNwyQNTmN1dVkV+pO6UHyPj1lHNQqo7Ofi1wO13ArewetlJVlFEj2h8Y69u1O+Mex7SEIQ9Whw9pEykmHZH1MtAyL/2cn4vC/tAVjm3UHeiZgN1ZFdefRAqMg62yVDKxGt69SNj3aJraIo7FnkGrYFwcPB+M3fM90V2G+/3ncWRzlLQfXnY4A4F+JQ5cZr/9dKSbogm1yiX98+xvQOo1cYUqO3bLJtIYrnOOsoqhle2LMm5jsWg44Lt1y5gISzAj352CzrMXWs+FSXys6/J3Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824628c3-f030-45f1-2ea8-08d6d41f6925
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 01:41:09.1322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3929
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

UGluZy4uLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuc29uIEh1
YW5nDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyNSwgMjAxOSA5OjUwIEFNDQo+IFRvOiBkbWl0
cnkudG9yb2tob3ZAZ21haWwuY29tOyBzaGF3bmd1b0BrZXJuZWwub3JnOw0KPiBzLmhhdWVyQHBl
bmd1dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsN
Cj4gbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBkbC1s
aW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSRTogW1JFU0VORF0gaW5w
dXQ6IGtleWJvYXJkOiBpbXg6IG1ha2Ugc3VyZSBrZXlib2FyZCBjYW4gYWx3YXlzDQo+IHdha2Ug
dXAgc3lzdGVtDQo+IA0KPiBHZW50bGUgcGluZy4uLg0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IEFuc29uIEh1YW5nDQo+ID4gU2VudDogVGh1cnNkYXksIEFw
cmlsIDQsIDIwMTkgOTo0MCBBTQ0KPiA+IFRvOiBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOyBz
aGF3bmd1b0BrZXJuZWwub3JnOw0KPiA+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBw
ZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiA+IGxpbnV4LWlucHV0QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+IGxp
bnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4gQ2M6IGRsLWxpbnV4LWlteCA8bGludXgt
aW14QG54cC5jb20+DQo+ID4gU3ViamVjdDogW1JFU0VORF0gaW5wdXQ6IGtleWJvYXJkOiBpbXg6
IG1ha2Ugc3VyZSBrZXlib2FyZCBjYW4gYWx3YXlzDQo+ID4gd2FrZSB1cCBzeXN0ZW0NCj4gPg0K
PiA+IFRoZXJlIGFyZSBzZXZlcmFsIHNjZW5hcmlvcyB0aGF0IGtleWJvYXJkIGNhbiBOT1Qgd2Fr
ZSB1cCBzeXN0ZW0gZnJvbQ0KPiA+IHN1c3BlbmQsIGUuZy4sIGlmIGEga2V5Ym9hcmQgaXMgZGVw
cmVzc2VkIGJldHdlZW4gc3lzdGVtIGRldmljZQ0KPiA+IHN1c3BlbmQgcGhhc2UgYW5kIGRldmlj
ZSBub2lycSBzdXNwZW5kIHBoYXNlLCB0aGUga2V5Ym9hcmQgSVNSIHdpbGwgYmUNCj4gPiBjYWxs
ZWQgYW5kIGJvdGgga2V5Ym9hcmQgZGVwcmVzcyBhbmQgcmVsZWFzZSBpbnRlcnJ1cHRzIHdpbGwg
YmUNCj4gPiBkaXNhYmxlZCwgdGhlbiBrZXlib2FyZCB3aWxsIG5vIGxvbmdlciBiZSBhYmxlIHRv
IHdha2UgdXAgc3lzdGVtLg0KPiA+IEFub3RoZXIgc2NlbmFyaW8gd291bGQgYmUsIGlmIGEga2V5
Ym9hcmQgaXMga2VwdCBkZXByZXNzZWQsIGFuZCB0aGVuDQo+ID4gc3lzdGVtIGdvZXMgaW50byBz
dXNwZW5kLCB0aGUgZXhwZWN0ZWQgYmVoYXZpb3Igd291bGQgYmUgd2hlbiBrZXlib2FyZA0KPiA+
IGlzIHJlbGVhc2VkLCBzeXN0ZW0gd2lsbCBiZSB3YWtlZCB1cCwgYnV0IGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gY2FuDQo+ID4gTk9UIGFjaGlldmUgdGhhdCwgYmVjYXVzZSBib3RoIGRlcHJlc3Mg
YW5kIHJlbGVhc2UgaW50ZXJydXB0cyBhcmUNCj4gPiBkaXNhYmxlZCBpbiBJU1IsIGFuZCB0aGUg
ZXZlbnQgY2hlY2sgaXMgc3RpbGwgaW4gcHJvZ3Jlc3MuDQo+ID4NCj4gPiBUbyBmaXggdGhlc2Ug
aXNzdWVzLCBuZWVkIHRvIG1ha2Ugc3VyZSBrZXlib2FyZCdzIGRlcHJlc3Mgb3IgcmVsZWFzZQ0K
PiA+IGludGVycnVwdCBpcyBlbmFibGVkIGFmdGVyIG5vaXJxIGRldmljZSBzdXNwZW5kIHBoYXNl
LCB0aGlzIHBhdGNoDQo+ID4gbW92ZXMgdGhlIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrIHRvIG5v
aXJxIHN1c3BlbmQvcmVzdW1lIHBoYXNlLCBhbmQNCj4gPiBlbmFibGUgdGhlIGNvcnJlc3BvbmRp
bmcgaW50ZXJydXB0IGFjY29yZGluZyB0byBjdXJyZW50IGtleWJvYXJkIHN0YXR1cy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2lteF9rZXlwYWQuYyB8IDE4ICsrKysr
KysrKysrKysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJk
L2lteF9rZXlwYWQuYw0KPiA+IGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9pbXhfa2V5cGFkLmMN
Cj4gPiBpbmRleCBjZjA4ZjRhLi45NzUwMGEyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW5w
dXQva2V5Ym9hcmQvaW14X2tleXBhZC5jDQo+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9pbXhfa2V5cGFkLmMNCj4gPiBAQCAtNTI0LDExICs1MjQsMTIgQEAgc3RhdGljIGludCBpbXhf
a2V5cGFkX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgCXJl
dHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiAtc3RhdGljIGludCBfX21heWJlX3VudXNlZCBpbXhf
a2JkX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIGlteF9rYmRfbm9pcnFfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gIHsN
Cj4gPiAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2Uo
ZGV2KTsNCj4gPiAgCXN0cnVjdCBpbXhfa2V5cGFkICprYmQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsNCj4gPiAgCXN0cnVjdCBpbnB1dF9kZXYgKmlucHV0X2RldiA9IGtiZC0+aW5wdXRf
ZGV2Ow0KPiA+ICsJdW5zaWduZWQgc2hvcnQgcmVnX3ZhbCA9IHJlYWR3KGtiZC0+bW1pb19iYXNl
ICsgS1BTUik7DQo+ID4NCj4gPiAgCS8qIGlteCBrYmQgY2FuIHdha2UgdXAgc3lzdGVtIGV2ZW4g
Y2xvY2sgaXMgZGlzYWJsZWQgKi8NCj4gPiAgCW11dGV4X2xvY2soJmlucHV0X2Rldi0+bXV0ZXgp
Ow0KPiA+IEBAIC01MzgsMTMgKzUzOSwyMCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+
IGlteF9rYmRfc3VzcGVuZChzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4gPg0KPiA+ICAJbXV0
ZXhfdW5sb2NrKCZpbnB1dF9kZXYtPm11dGV4KTsNCj4gPg0KPiA+IC0JaWYgKGRldmljZV9tYXlf
d2FrZXVwKCZwZGV2LT5kZXYpKQ0KPiA+ICsJaWYgKGRldmljZV9tYXlfd2FrZXVwKCZwZGV2LT5k
ZXYpKSB7DQo+ID4gKwkJaWYgKHJlZ192YWwgJiBLQkRfU1RBVF9LUEtEKQ0KPiA+ICsJCQlyZWdf
dmFsIHw9IEtCRF9TVEFUX0tSSUU7DQo+ID4gKwkJaWYgKHJlZ192YWwgJiBLQkRfU1RBVF9LUEtS
KQ0KPiA+ICsJCQlyZWdfdmFsIHw9IEtCRF9TVEFUX0tESUU7DQo+ID4gKwkJd3JpdGV3KHJlZ192
YWwsIGtiZC0+bW1pb19iYXNlICsgS1BTUik7DQo+ID4gKw0KPiA+ICAJCWVuYWJsZV9pcnFfd2Fr
ZShrYmQtPmlycSk7DQo+ID4gKwl9DQo+ID4NCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4N
Cj4gPiAtc3RhdGljIGludCBfX21heWJlX3VudXNlZCBpbXhfa2JkX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaW14X2tiZF9ub2lycV9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gIAlzdHJ1Y3QgaW14
X2tleXBhZCAqa2JkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7IEBAIC01NjgsNw0KPiA+
ICs1NzYsOSBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGlteF9rYmRfcmVzdW1lKHN0cnVj
dCBkZXZpY2UNCj4gKmRldikNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+IC1z
dGF0aWMgU0lNUExFX0RFVl9QTV9PUFMoaW14X2tiZF9wbV9vcHMsIGlteF9rYmRfc3VzcGVuZCwN
Cj4gPiBpbXhfa2JkX3Jlc3VtZSk7DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29w
cyBpbXhfa2JkX3BtX29wcyA9IHsNCj4gPiArCVNFVF9OT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BT
KGlteF9rYmRfbm9pcnFfc3VzcGVuZCwNCj4gPiAraW14X2tiZF9ub2lycV9yZXN1bWUpIH07DQo+
ID4NCj4gPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgaW14X2tleXBhZF9kcml2ZXIg
PSB7DQo+ID4gIAkuZHJpdmVyCQk9IHsNCj4gPiAtLQ0KPiA+IDIuNy40DQoNCg==
