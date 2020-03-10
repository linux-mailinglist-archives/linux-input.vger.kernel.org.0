Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3FC17F0F5
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 08:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgCJHPl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 03:15:41 -0400
Received: from mail-eopbgr60064.outbound.protection.outlook.com ([40.107.6.64]:56403
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726156AbgCJHPl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 03:15:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K03xh6Uf8Oqd7nFAgtPxAQmLpV1qFKxWX7Nh/Do3DCJczqvrPDY34m86NJzjD6qcbRwb4BSbcMMVlU7GoqSuDN0hwuUw5lS7qwia0Tb+zWNWUxeg/3FpPkSVyEVpDbpvaeWBytP1NrkSce5WS+fJTGKZUQjSbwIjqrWiRWhf3X1kgl0FR8Y72vf3G2Sq5HRtz0t5m+Bb8zOVXGG8DPswS5mvhyGP8hlMnZX0eLUvj2ixRtmZ0yCMN/PLL3jZrWBtZa1PcIasdG13Ycf0ySg68DqXjBLp6Mcq9IVw80w20kijmHNXe25RgNpoZjw71dPpJ4BQ7dPOZJ7qGXSuCNpo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2hXLtpJGZGzNkmy4zgf/VOtb40eX7iuo8Kc53Cw3Pk=;
 b=PPrLmqqgtOHoAGTLG244QNFzjXMYTuC5yIwBCnewYv0qYHMY32mxSRFyZuqn7dHSzFqtN3x4+TZYDPc+AwHRtNc87Y5A15kHZF9x+P65oii7yABC3cC4XWhrx/1fXKwNWDvRm7hcGEPVEFDe5jT9OKZkUiy+C13drvQTyzV6q84BSfEHo7bqFNfyJYLvFLQfuJtpu5S5QkTRpU7ODTkPGLTQZ/3BzK+r7Imwa/qHtQ80HSrDlHXgbOfetz5YELlTFy0UDzl3+HwwqLRXMpRSSwNH2MHK+M+Jh0XXkwAGM0eWQzmJBiIcC745bzlkcn+25qsM0+wqrjAiRlyKTdrZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2hXLtpJGZGzNkmy4zgf/VOtb40eX7iuo8Kc53Cw3Pk=;
 b=J9/FS6gT1Yy5W3JHcnLymVauN7KcLmTmGZrDVT9whxO+vP2NrCn6y6kXq5i9VZArNd+7x4GCPtM1XlQm7j63fMBOVCEWhGbA8DVMAko64mimlTXvTSGsg6ysTZEocXvj3V1z/Eh6GnE2Tg2ffa2puL776FarQHs5TBVlViG2oWA=
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com (20.177.52.24) by
 VI1PR04MB3070.eurprd04.prod.outlook.com (10.170.226.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 07:15:35 +0000
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::d0c7:37d1:d835:a682]) by VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::d0c7:37d1:d835:a682%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 07:15:35 +0000
From:   BOUGH CHEN <haibo.chen@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/2] input: egalax_ts: free irq resource before request
 the line as GPIO
Thread-Topic: [PATCH 2/2] input: egalax_ts: free irq resource before request
 the line as GPIO
Thread-Index: AQHV4LfPyhmOyWImjEGOyTDIv0f2VKhBZsSAgAAr7RA=
Date:   Tue, 10 Mar 2020 07:15:35 +0000
Message-ID: <VI1PR04MB504032C19CA8D76AE845AE6A90FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
 <1581410472-3225-2-git-send-email-haibo.chen@nxp.com>
 <20200310042643.GB192640@dtor-ws>
In-Reply-To: <20200310042643.GB192640@dtor-ws>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=haibo.chen@nxp.com; 
x-originating-ip: [112.23.103.235]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79be3efc-70e0-49c7-4422-08d7c4c2d3d9
x-ms-traffictypediagnostic: VI1PR04MB3070:|VI1PR04MB3070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB30708510470FC40A6A0A5AA690FF0@VI1PR04MB3070.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(189003)(199004)(86362001)(5660300002)(186003)(55016002)(4326008)(9686003)(316002)(26005)(54906003)(478600001)(71200400001)(8936002)(64756008)(66446008)(76116006)(66556008)(66476007)(2906002)(81166006)(6916009)(66946007)(81156014)(8676002)(53546011)(33656002)(7696005)(52536014)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3070;H:VI1PR04MB5040.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QF7VXPXsnQsaFlpVUim4xk+oRD+pyCCWDHaT8udyKRbR8REMpuHVNYx4g+E+IpZAT7iJCzsUo/nmdrrSMvncHOLR2fojU0/3iRsDwzrT7feBUFeZ+ZUNtnZ0yqUt+KHGaZwRoQkMB78DzVDSWkpb9iZNOnOUpt+MhqlUWic7cqABLZKIakqkdmi/5p06hmeWvtLYNB3X0LzHMB3Fq2tHskQ5o4ZUucA4IzOwAt9Z4swPztyCXYg4sSL3Fi5Tfz5t6Oqc2tT0I8zoisgk0L0zdGA3NCWYxVc+kGhAuBMchJET/MGegZUTGmh7tWQyZdmlK9HFdnCtLiFoB9pmhUxeLDhmBVsfc0A2p1aT//oNVy1LvwP0SIiEC3NwBtfraM5cR6EY02fr4lan7eVvZZA2s+kWh32Jl/ZFoL7U7F3EMoHX0Y6rG3UAayOsj5sn6Re5
x-ms-exchange-antispam-messagedata: HrYajvHPNgPYqxtyN8iUWsE4Wtr4eAZ6bzjt55QULOffKoI1dKuZMdUQY4ztZ2sXJNczU5r5PJ2/ak9HHRdgpj/SoTv/vpGR46fR9IRbZInhEOqx1H22VAGHsUTX8IGCDCdmp38DtWFGBKFR0IwMFw==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79be3efc-70e0-49c7-4422-08d7c4c2d3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 07:15:35.2052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7bMK9bD5ymQCKqjjJDXEf/mICTXAzmQUgou3W+xXs8ByPYz6fyLuKLBd8+Hlm5ZYR15pQdWd49W7rSpRQcHuMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3070
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRyeSBUb3Jva2hvdiA8
ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMMTqM9TCMTDI1SAxMjoyNw0K
PiBUbzogQk9VR0ggQ0hFTiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogbGludXgtaW5wdXRA
dmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvMl0gaW5wdXQ6IGVnYWxheF90czogZnJlZSBpcnEgcmVzb3VyY2Ug
YmVmb3JlIHJlcXVlc3QNCj4gdGhlIGxpbmUgYXMgR1BJTw0KPiANCj4gT24gVHVlLCBGZWIgMTEs
IDIwMjAgYXQgMDQ6NDE6MTJQTSArMDgwMCwgaGFpYm8uY2hlbkBueHAuY29tIHdyb3RlOg0KPiA+
IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPg0KPiA+IElmIEdQSU8g
aXMgY29ubmVjdGVkIHRvIGFuIElSUSB0aGVuIGl0IHNob3VsZCBub3QgcmVxdWVzdCBpdCBhcyBH
UElPDQo+ID4gZnVuY3Rpb24gb25seSB3aGVuIGZyZWUgaXRzIElSUSByZXNvdXJjZS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9lZ2FsYXhfdHMuYyB8IDQ0DQo+ID4g
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lucHV0L3RvdWNoc2NyZWVuL2VnYWxheF90cy5jDQo+ID4gYi9kcml2ZXJzL2lucHV0L3RvdWNo
c2NyZWVuL2VnYWxheF90cy5jDQo+ID4gaW5kZXggNWUzNWNhNWVkYzdiLi5jNzk4MzEwNGEwYjkg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9lZ2FsYXhfdHMuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMNCj4gPiBAQCAt
MTE2LDYgKzExNiwyNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZWdhbGF4X3RzX2ludGVycnVwdChp
bnQgaXJxLCB2b2lkDQo+ICpkZXZfaWQpDQo+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4g
IH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IGVnYWxheF9pcnFfcmVxdWVzdChzdHJ1Y3QgZWdhbGF4
X3RzICp0cykgew0KPiA+ICsJaW50IHJldDsNCj4gPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQgPSB0cy0+Y2xpZW50Ow0KPiA+ICsNCj4gPiArCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRl
ZF9pcnEoJmNsaWVudC0+ZGV2LCBjbGllbnQtPmlycSwgTlVMTCwNCj4gPiArCQkJCQllZ2FsYXhf
dHNfaW50ZXJydXB0LA0KPiA+ICsJCQkJCUlSUUZfVFJJR0dFUl9MT1cgfCBJUlFGX09ORVNIT1Qs
DQo+ID4gKwkJCQkJImVnYWxheF90cyIsIHRzKTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJ
CWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIGludGVycnVwdFxuIik7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZv
aWQgZWdhbGF4X2ZyZWVfaXJxKHN0cnVjdCBlZ2FsYXhfdHMgKnRzKSB7DQo+ID4gKwlkZXZtX2Zy
ZWVfaXJxKCZ0cy0+Y2xpZW50LT5kZXYsIHRzLT5jbGllbnQtPmlycSwgdHMpOyB9DQo+ID4gKw0K
PiA+ICAvKiB3YWtlIHVwIGNvbnRyb2xsZXIgYnkgYW4gZmFsbGluZyBlZGdlIG9mIGludGVycnVw
dCBncGlvLiAgKi8NCj4gPiBzdGF0aWMgaW50IGVnYWxheF93YWtlX3VwX2RldmljZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50KSAgeyBAQA0KPiA+IC0yMjUsMTkgKzI0NSwxNSBAQCBzdGF0aWMg
aW50IGVnYWxheF90c19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiA+ICAJCQkg
ICAgIEFCU19NVF9QT1NJVElPTl9ZLCAwLCBFR0FMQVhfTUFYX1ksIDAsIDApOw0KPiA+ICAJaW5w
dXRfbXRfaW5pdF9zbG90cyhpbnB1dF9kZXYsIE1BWF9TVVBQT1JUX1BPSU5UUywgMCk7DQo+ID4N
Cj4gPiAtCWVycm9yID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmY2xpZW50LT5kZXYsIGNs
aWVudC0+aXJxLCBOVUxMLA0KPiA+IC0JCQkJCSAgZWdhbGF4X3RzX2ludGVycnVwdCwNCj4gPiAt
CQkJCQkgIElSUUZfVFJJR0dFUl9MT1cgfCBJUlFGX09ORVNIT1QsDQo+ID4gLQkJCQkJICAiZWdh
bGF4X3RzIiwgdHMpOw0KPiA+IC0JaWYgKGVycm9yIDwgMCkgew0KPiA+IC0JCWRldl9lcnIoJmNs
aWVudC0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIGludGVycnVwdFxuIik7DQo+ID4gKwllcnJv
ciA9IGVnYWxheF9pcnFfcmVxdWVzdCh0cyk7DQo+ID4gKwlpZiAoZXJyb3IpDQo+ID4gIAkJcmV0
dXJuIGVycm9yOw0KPiA+IC0JfQ0KPiA+DQo+ID4gIAllcnJvciA9IGlucHV0X3JlZ2lzdGVyX2Rl
dmljZSh0cy0+aW5wdXRfZGV2KTsNCj4gPiAgCWlmIChlcnJvcikNCj4gPiAgCQlyZXR1cm4gZXJy
b3I7DQo+ID4NCj4gPiArCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIHRzKTsNCj4gPiAgCXJl
dHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiBAQCAtMjUzLDExICsyNjksMTAgQEAgc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZA0KPiBlZ2FsYXhfdHNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ID4gIAkJMHgzLCAweDYsIDB4YSwgMHgzLCAweDM2LCAweDNmLCAweDIsIDAsIDAsIDANCj4g
PiAgCX07DQo+ID4gIAlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChk
ZXYpOw0KPiA+ICsJc3RydWN0IGVnYWxheF90cyAqdHMgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xp
ZW50KTsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAtCWlmIChkZXZpY2VfbWF5X3dha2V1cChk
ZXYpKQ0KPiA+IC0JCXJldHVybiBlbmFibGVfaXJxX3dha2UoY2xpZW50LT5pcnEpOw0KPiA+IC0N
Cj4gDQo+IFdoeSBhcmUgeW91IHJlbW92aW5nIGhhbmRsaW5nIG9mIHRoZSBpbnRlcnJ1cHQgYXMg
YSB3YWtldXAgc291cmNlIGlmIGRldmljZQ0KPiBpcyBjb25maWd1cmVkIGZvciB3YWtldXA/IEkg
Z3Vlc3MgaXQgaXMgYSBub29wIGFuZCBJMkMgY29yZSBkb2VzIGl0IGZvciB1cyBvbg0KPiBuZXdl
ciBrZXJuZWxzIGFueXdheXMsIGJ1dCBzdWNoIGNsZWFudXAgc2hvdWxkIGJlIGluICBhIHNlcGFy
YXRlIHBhdGNoLg0KPiBTdGlsbCwgeW91IGRvIG5vdCB3YW50IHRvIHB1dCB0aGUgY29udHJvbGxl
ciB0byBzbGVlcCBpZiBpdCBpcyBzdXBwb3NlZCB0byBiZSBhDQo+IHdha2V1cCBzb3VyY2UuDQoN
CkFncmVlLCBJIHdpbGwga2VlcCB0aGUgY29kZSB0aGVyZS4gSSB3aWxsIGFkZCBhIGNvZGUgaW4g
dGhlIGVnYWxheF90c19yZXN1bWUoKSwgaWYgdGhlIGRldmljZSBteSB3YWtldXAsIHNraXAgZWdh
bGF4X3dha2VfdXBfZGV2aWNlKCksIHJldHVybiBkaXJlY3RseS4gDQoNCj4gDQo+ID4gKwllZ2Fs
YXhfZnJlZV9pcnEodHMpOw0KPiANCj4gSXQgc291bmRzIHRvIG1lIHlvdSB3YW50IHNpbXBseSBk
aXNhYmxlIGludGVycnVwdHMgaW4gc3VzcGVuZC4gRG9lcyBub3QNCj4gY2FsbGluZyBkaXNhYmxl
X2lycSgpIGhlcmUgc3VmZmljZT8NCg0KSGVyZSB3aHkgSSB3YW50IHRvIGRpc2FibGUgaW50ZXJy
dXB0cyBoZXJlIGlzIGJlY2F1c2UgaW4gdGhlIG5ld2VzdCBncGlvIHN5c3RlbSwgaWYgdGhlIGdw
aW8gaXMgcmVxdWVzdCBhcyBhbiBpcnEsIGl0IGNhbid0IGJlIHJlcXVlc3QgYXMgYSBncGlvIGFu
eW1vcmUuDQpJbiB0aGUgZnVuY3Rpb24gZWdhbGF4X3dha2VfdXBfZGV2aWNlKCksIHdlIG5lZWQg
dG8gcmVxdWVzdCB0aGUgaXJxIHBpbiBhcyBhIGdwaW8gZm9yIGEgd2hpbGUsIGdlbmVyYXRlIGEg
c2lnbmFsIHRvIHdha2UgdXAgdGhlIGRldmljZS4gU28gYmVmb3JlIHJlcXVlc3QgdGhlIHBhZCBh
cyBncGlvLCBuZWVkIGZpcnN0IGZyZWUgaXJxIHJlc291cmNlLg0KU2VlbXMgdGhlcmUgYXJlIHR3
byBtZXRob2RzLCBvbmUgaXMgZnJlZSBpcnEgaW4gZWdhbGF4X3RzX3N1c3BlbmQoKSwgYW50aGVy
IGlzIGp1c3QgZnJlZSBpcnEgaW4gZWdhbGF4X3RzX3N1c3BlbmQoKSwgYWZ0ZXIgdGhlIGdwaW8g
b3BlcmF0aW9uIGRvbmUsIHJlcXVlc3QgdGhlIGlycSByZXNvdXJjZSBiYWNrLCB3aGljaCBvbmUg
ZG8geW91IHByZWZlcj8NCg0KQmVzdCBSZWdhcmRzDQpIYWlibyBDaGVuDQo+IA0KPiBUaGFua3Mu
DQo+IA0KPiAtLQ0KPiBEbWl0cnkNCg==
