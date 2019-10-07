Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FB6CDA20
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 03:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfJGB30 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 21:29:26 -0400
Received: from mail-eopbgr140040.outbound.protection.outlook.com ([40.107.14.40]:59392
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726661AbfJGB3Z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Oct 2019 21:29:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd+UWbndbFbSQAzR6APgh+VD4jiCiqK5EV5vK/BYpJV/359fvAiY0+zgDHa5bo2oPXqBU04sUp1feoSSEal2yeY3reK2w8ywRDBjc5cqEntkfzxIEyNxof/UNabeZp9UrkCmPeYZ9myrwbwRDH38bABbygBWAwZY+3/iSvNnXhrarT2Q/nnjBUqsweiExNbGcseexxAB3gBSzS50r9dlNzmgSo1eTF5iVr2qwuZ9p+/OzpxF6iPDCXXO9Sq0gOIm9NUJucb2ZMv8rCBb50iZLKNlmv1Jxv346RtEMK9tAIJccXNoWQ7NcHYlEWf6xQbvts7ZWjGyU6hcDYDeZFeFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deyhNno6UlybK5gyg5RYGiamjg2BvbixlWMrqj9bhWI=;
 b=C9QROfzq7/Wn7/5EXfpg6rkLujnfcbY/As/jE8v0JhZRsGPCzHwKILn8K5BAfNGyEgz0Qc9H6XSP52eEMd2ztumu+piN8GOJ8Wxo5VmVMR1UgIUmdhyEy3VO4Qvr4TUdJbiJdm29NffLJ63YmyUnzJBX09jgCiMhZ29b0onxaQJLPEVT0HROho+vxYxVkSgYIp8KXZ+ySsaDZgqKVVA5GxL+xzJNggLKtRLQDf4TXhK3/5cSCLb46P9jvu5mn+UE2eUotAW4rBb1eNFgklLMHJ5s2MAmskB7JnTgRk2sJj3KKQGWKQEMZ2xkR6T+1pD+rU3+XTYxSgn2Fe8p0oyXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deyhNno6UlybK5gyg5RYGiamjg2BvbixlWMrqj9bhWI=;
 b=RvWBTk/rm9Hq11UfNd35i3nuOQTCULc4WqEhuXulQ2+88KoRELGDc/MMPZFINWvRrby8FZx0n1F1U1Dkaw1BoTSrneD7hPURVa/mpfnvQ0oMAvKFyaDu572YF0lD03ql7aAsGPzt9CZaKT3ONyCdrOelHbSqPL39fmmVXn+4mI4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3787.eurprd04.prod.outlook.com (52.134.73.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 7 Oct 2019 01:29:19 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d469:ad51:2bec:19f0]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d469:ad51:2bec:19f0%6]) with mapi id 15.20.2305.023; Mon, 7 Oct 2019
 01:29:19 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
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
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Topic: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Thread-Index: AQHVYfv+INaxBRtrokqtKaL9fDhNpqc3/ZaAgACs9fCAFEyMgIABobbA
Date:   Mon, 7 Oct 2019 01:29:19 +0000
Message-ID: <DB3PR0402MB3916A5821856B3FEAE9265C8F59B0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <20190922161415.GD1999@bug>
 <DB3PR0402MB3916F48DA2A16E57C624432BF5850@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20191006003225.GD7150@dragon>
In-Reply-To: <20191006003225.GD7150@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d15abafd-0f14-4dea-e108-08d74ac5c665
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB3PR0402MB3787:|DB3PR0402MB3787:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3787B13F983F8B1A4C7A2C8BF59B0@DB3PR0402MB3787.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(189003)(199004)(33656002)(486006)(44832011)(4326008)(6246003)(66066001)(476003)(6916009)(25786009)(6436002)(74316002)(99286004)(71190400001)(26005)(186003)(305945005)(8676002)(7736002)(8936002)(81156014)(81166006)(478600001)(9686003)(5660300002)(256004)(7416002)(446003)(6506007)(7696005)(229853002)(52536014)(11346002)(102836004)(66556008)(3846002)(54906003)(6116002)(86362001)(316002)(14454004)(66446008)(64756008)(66946007)(66476007)(2906002)(76116006)(71200400001)(76176011)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3787;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13nhrK6UZQGZDOIgrXUUpSLO0FHgy6xXSFQQvAFpcv2cUgRVjM26E21ZI0O4EOLknouWIynBzU+mSP7rIovSV6juGYlX+o+lf+8Uu4dIgWjQFymnAtRXKSSuCjP1b11bxsQ+/OzJqQkjSuqkbMAe+R43slqY4l9KJ5jAgqF0BF7KalNZZHI4zd8ISb+yp42ozgAT4bb6o2ilm9s7H9pRR4IG2dYvRqXwTJ5yr+xO059Mt3MzXf2jCDFrWRSMudRyfKxvy6bPo1AezXe/5ZgyNxmnXl6nzKXPvCUNt48h5InxGA8E9Q6vz4Ni7olR/D/7IO1X8mJtUG6pOHXuesu/JkxDAzDq2SeENTJeg1hsk3C3iPTJCJqNqgZM5l7FjA+GY3YMASmI5nyTrwPBSuWfsOV4xrrKGrVbUjkAOWXfTYY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15abafd-0f14-4dea-e108-08d74ac5c665
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 01:29:19.2033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soyMP4W6xPzdV2+MPZ1iO0zEeC9nTMRKcfvrjDBWLgDviGYFarlz6sOh0BM8yokpioyNWEu5uU2YHJ6xuLGulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3787
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIFNoYXduDQoNCj4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDI6MzQ6MDdBTSArMDAwMCwg
QW5zb24gSHVhbmcgd3JvdGU6DQo+ID4gSGksIFBhdmVsDQo+ID4NCj4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggVjIgMS81XSBkdC1iaW5kaW5nczogZnNsOiBzY3U6IGFkZCBzY3UgcG93ZXIga2V5
DQo+ID4gPiBiaW5kaW5nDQo+ID4gPg0KPiA+ID4gT24gVHVlIDIwMTktMDktMDMgMTA6MDM6NDAs
IEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+ID4gPiBOWFAgaS5NWDhRWFAgaXMgYW4gQVJNdjggU29D
IHdpdGggYSBDb3J0ZXgtTTQgY29yZSBpbnNpZGUgYXMNCj4gPiA+ID4gc3lzdGVtIGNvbnRyb2xs
ZXIsIHRoZSBzeXN0ZW0gY29udHJvbGxlciBpcyBpbiBjaGFyZ2Ugb2Ygc3lzdGVtDQo+ID4gPiA+
IHBvd2VyLCBjbG9jayBhbmQgcG93ZXIga2V5IGV2ZW50IGV0Yy4gbWFuYWdlbWVudCwgTGludXgg
a2VybmVsIGhhcw0KPiA+ID4gPiB0byBjb21tdW5pY2F0ZSB3aXRoIHN5c3RlbSBjb250cm9sbGVy
IHZpYSBNVSAobWVzc2FnZSB1bml0KSBJUEMgdG8NCj4gPiA+ID4gZ2V0IHBvd2VyIGtleSBldmVu
dCwgYWRkIGJpbmRpbmcgZG9jIGZvciBpLk1YIHN5c3RlbSBjb250cm9sbGVyIHBvd2VyDQo+IGtl
eSBkcml2ZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxB
bnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gQ2hhbmdlcyBzaW5jZSBW
MToNCj4gPiA+ID4gCS0gcmVtb3ZlICJ3YWtldXAtc291cmNlIiBwcm9wZXJ0eSwgYXMgaXQgaXMg
Tk9UIG5lZWRlZCBmb3IgU0NVDQo+ID4gPiBpbnRlcnJ1cHQ7DQo+ID4gPiA+IAktIHJlbW92ZSAi
c3RhdHVzIiBpbiBleGFtcGxlLg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgICAgICAgICAgfCAxNA0KPiA+ID4g
KysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
DQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+ID4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0
DQo+ID4gPiA+IGluZGV4IGMxNDlmYWQuLmY5M2UyZTQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0
DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJl
ZXNjYWxlL2ZzbCxzY3UudHh0DQo+ID4gPiA+IEBAIC0xNTcsNiArMTU3LDE1IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6DQo+ID4gPiA+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgLSB0
aW1lb3V0LXNlYzogY29udGFpbnMgdGhlIHdhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25kcy4NCj4g
PiA+ID4NCj4gPiA+ID4gK1Bvd2VyIGtleSBiaW5kaW5ncyBiYXNlZCBvbiBTQ1UgTWVzc2FnZSBQ
cm90b2NvbA0KPiA+ID4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ICsNCj4gPiA+ID4gK1JlcXVpcmVkIHByb3Bl
cnRpZXM6DQo+ID4gPiA+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZToNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgImZzbCxpbXg4cXhwLXNjLXB3cmtleSINCj4gPiA+ID4gKyAgICAgICAgICAgICAg
Zm9sbG93ZWQgYnkgImZzbCxpbXgtc2MtcHdya2V5IjsNCj4gPiA+ID4gKy0gbGludXgsa2V5Y29k
ZXM6IFNlZQ0KPiA+ID4gPiArRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0
L2tleXMudHh0DQo+ID4gPg0KPiA+ID4gTm90ZSB5b3UgaGF2ZSBrZXljb2RlX3NfIGhlcmUsIGJ1
dCBrZXljb2RlIGluIHRoZSBleGFtcGxlIGFuZCBpbiB0aGUNCj4gPiA+IGR0cyBwYXRjaC4NCj4g
Pg0KPiA+IE5PVCBxdWl0ZSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsIGNvdWxkIHlvdSBwbGVhc2Ug
cHJvdmlkZSBtb3JlIGRldGFpbHM/DQo+IA0KPiBUaGUgcHJvcGVydHkgYmVpbmcgdXNlZCBpbiBk
cml2ZXIsIERUUywgYW5kIERUIGV4YW1wbGUgaW4gdGhlIGJpbmRpbmdzIGFyZQ0KPiBhbGwgJ2xp
bnV4LGtleWNvZGUnIHJhdGhlciB0aGFuICdsaW51eCxrZXljb2RlcycuDQoNCkkgc2VlIG5vdywg
c2luY2UgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2tleXMudHh0IHVz
ZXMgImxpbnV4LGtleWNvZGVzIiwNCnNvIEkgd2lsbCBhbHNvIHVzZSAibGludXgsa2V5Y29kZXMi
IGZvciBkcml2ZXIsIERUUyBhbmQgRFQgZXhhbXBsZSBpbiBWMy4NCg0KVGhhbmtzLA0KQW5zb24N
Cg==
