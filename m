Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAF717F0D2
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 08:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgCJHB4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 03:01:56 -0400
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:37054
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725919AbgCJHB4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 03:01:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0ros9CyeeAEaaV/4wOSr+/jxivATXQCvrzec1TE4RmPHk0L9v0xStTGz+LC+ZfZFEh6+8UCQ3+JGe0U1NtxfcOCBHXIa1iMdTjbATtMDkxJsSohBCwpPYdtf2jHRuMJev6vDLzzKeievw/voGMtkbxzruBAMzwI35fm6/NIHX46w5ypUjFOdetK0L5L/K8G4vH6OoYxMUzQbZ8asD5E7uuWyB1cAKuDlq9ZiL4qqlv1yQP3gi+WF5kV+L6DMfxAwi5xoCIq88+ZinruqGB/jHUgzUjwGkITkrVxB63llmw7qIeXfp+3pDKWgr57QtziIDaXgnu1F60RwTchfbNeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPdlqXA2cul8oJiehPkghr6M0MCsIouv2zOSxvPZhrM=;
 b=R3AMLAN5BRQ67+WStwKuJhU6vsmSEd1puM7qEJvHF0mUDnxVBqjopZlone5V12RE1nmAcp0VjOccqu5bgaCCK9HFCPPLAYofpQX86FeTidN1xsOBh3ZDPRFOgoenfoe8TbOqYMFJMEj3RgszTC9n1vFhLQYVxS66AF22I8lJ//2pJpjTn/gzu1+YnIi8MOSy8cNrfnR14WJhhzrMsjM8vqFC6PXNju5YAbQKy6tPC3f+2PiPkUw4fd/QGgPFj8uT7touc8+LlZWQUXvpg7ykpoIE3tCo4uD6ChZ9lp3xppOk0CoFs6Wlb9gx77/pokKULaWO0+AI7oCqHNB6Qcxaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPdlqXA2cul8oJiehPkghr6M0MCsIouv2zOSxvPZhrM=;
 b=S1IEiiLyKOvNaVu8Z4huCQMH5ZlAJIHCkNWI49lJ2llymuhYgZrxO7Ip+AFutRnkHv3n2vuNi6/JmfYWq6an3u5sdc7oBUdBE4eEOS26+A7m0SGM/900dXuwmzgSc/DRnmqRVdTokLzDfOPwzkj02uRtIHBcyQvSGCbhht9MobA=
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com (20.177.52.24) by
 VI1PR04MB5871.eurprd04.prod.outlook.com (20.178.204.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 07:01:10 +0000
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::d0c7:37d1:d835:a682]) by VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::d0c7:37d1:d835:a682%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 07:01:10 +0000
From:   BOUGH CHEN <haibo.chen@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] input: egalax_ts: switch to i2c interface before wake
 up
Thread-Topic: [PATCH 1/2] input: egalax_ts: switch to i2c interface before
 wake up
Thread-Index: AQHV4LfPp2g6PWjH60CmDpEEgaRBqahBZY6AgAAqzPA=
Date:   Tue, 10 Mar 2020 07:01:10 +0000
Message-ID: <VI1PR04MB5040F4A94475098F070DAAB790FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
 <20200310042223.GA192640@dtor-ws>
In-Reply-To: <20200310042223.GA192640@dtor-ws>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=haibo.chen@nxp.com; 
x-originating-ip: [112.23.103.235]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1cee429d-7124-4714-4e5c-08d7c4c0d06a
x-ms-traffictypediagnostic: VI1PR04MB5871:|VI1PR04MB5871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5871E466B79229688DDFE69A90FF0@VI1PR04MB5871.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(189003)(199004)(2906002)(6506007)(7696005)(86362001)(66446008)(5660300002)(478600001)(6916009)(33656002)(54906003)(316002)(66556008)(8676002)(9686003)(55016002)(186003)(66946007)(8936002)(26005)(81156014)(64756008)(81166006)(66476007)(71200400001)(4326008)(76116006)(53546011)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5871;H:VI1PR04MB5040.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kYzAvr7Pc0q/3f+qfPFjX0WFx5eMCzTr/3dlfaK5xnGcocm05kl+N5g0p3XSy4smc5mAmq4PMF5Akx1XshOXw613hYNcSaaORMjT6db7XzZHwZBeOGepQ983Djz+vJtUc6Pg0A+1Dx0LZH5Kqm4Y9a8drFMHSovVyN55B5/P8vwFEFtllOu+oWFhdoauXvATlfrShev5NfPljEq2rV5AcBqTmcx6JquzBQDR3umUHeUmwHAKGi8U4aLLG1111pet8yCKGa70fx67vf1GRwH4025X/qahPpMVznifgzL/OARjYkB6k48wSx2Pv0Ttjnl79Tw8KRxSl52lKSVhpMwZOe4clVKeQTz9Ac9pzEXeKgugqOcCyG+1XnyvEUnRuTkBw7ZFru3KVbdaiYsZP9nxA6UpL4GOYrcTohx5L5TAw85i8TqpnDkEA839jsJAhOWb
x-ms-exchange-antispam-messagedata: jMXPB5mnbRrpJf+wpl4O61AO4k6v9x5Tzw/iDkEqaV4fHoMVN3pln3SP9Wra4WzGPYKiW0rSodw3s9YmFxDXk4zgReizRvJwHRY8J+WetCMZyL8pK8jbV2XPXSUTStofW3/O/B+dfy+FpjTfKhi+6w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cee429d-7124-4714-4e5c-08d7c4c0d06a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 07:01:10.4105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTdwGZStRvMlWrgQZFYAyRU4iDGlqJ6vcBxrYViJrGE60SqdZ+iQQFaYajzBhUpYwgcUVmpW30BLByBtRaEpfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5871
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRyeSBUb3Jva2hvdiA8
ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMOW5tDPmnIgxMOaXpSAxMjoy
Mg0KPiBUbzogQk9VR0ggQ0hFTiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogbGludXgtaW5w
dXRAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaW5wdXQ6IGVnYWxheF90czogc3dpdGNoIHRvIGkyYyBp
bnRlcmZhY2UgYmVmb3JlDQo+IHdha2UgdXANCj4gDQo+IEhpIEhhaWJvLA0KPiANCj4gT24gVHVl
LCBGZWIgMTEsIDIwMjAgYXQgMDQ6NDE6MTFQTSArMDgwMCwgaGFpYm8uY2hlbkBueHAuY29tIHdy
b3RlOg0KPiA+IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPg0KPiA+
IEZvciBIYW5uU3RhciAoSFNEMTAwUFhOMSBSZXY6IDEtQTAwQzExIEYvVzowNjM0KSBMVkRTIHRv
dWNoIHNjcmVlbiwNCj4gaXQNCj4gPiBoYXMgYSBzcGVjaWFsIHJlcXVlc3QgZm9yIHRoZSBFRVRJ
IHRvdWNoIGNvbnRyb2xsZXIuIFRoZSBob3N0IG5lZWRzIHRvDQo+ID4gdHJpZ2dlciBJMkMgZXZl
bnQgdG8gZGV2aWNlIEZXIGF0IGJvb3RpbmcgZmlyc3QsIGFuZCB0aGVuIHRoZSBGVyBjYW4NCj4g
PiBzd2l0Y2ggdG8gSTJDIGludGVyZmFjZS4gT3RoZXJ3aXNlLCB0aGUgRlcgY2Fu4oCZdCAgd29y
ayB3aXRoIEkyQw0KPiA+IGludGVyZmFjZSwgYW5kIGNhbid0IGdlbmVyYXRlIGFueSBpbnRlcnJ1
cHQgd2hlbiB0b3VjaCB0aGUgc2NyZWVuLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZW5kIGFuIEky
QyBjb21tYW5kIGJlZm9yZSB0aGUgZGV2aWNlIHdha2UgdXAsIG1ha2Ugc3VyZQ0KPiA+IHRoZSBk
ZXZpY2Ugc3dpdGNoIHRvIEkyQyBpbnRlcmZhY2UgZmlyc3QuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMgfCAxNCArKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMNCj4gPiBiL2RyaXZlcnMvaW5w
dXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMNCj4gPiBpbmRleCA4M2FjOGMxMjgxOTIuLjVlMzVj
YTVlZGM3YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2VnYWxh
eF90cy5jDQo+ID4gKysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9lZ2FsYXhfdHMuYw0K
PiA+IEBAIC0xODMsNiArMTgzLDIwIEBAIHN0YXRpYyBpbnQgZWdhbGF4X3RzX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50DQo+ICpjbGllbnQsDQo+ID4gIAl0cy0+Y2xpZW50ID0gY2xpZW50Ow0KPiA+
ICAJdHMtPmlucHV0X2RldiA9IGlucHV0X2RldjsNCj4gPg0KPiA+ICsJLyogSGFublN0YXIgKEhT
RDEwMFBYTjEgUmV2OiAxLUEwMEMxMSBGL1c6MDYzNCkgTFZEUyB0b3VjaA0KPiA+ICsJICogc2Ny
ZWVuIG5lZWRzIHRvIHRyaWdnZXIgSTJDIGV2ZW50IHRvIGRldmljZSBGVyBhdCBib290aW5nDQo+
ID4gKwkgKiBmaXJzdCwgYW5kIHRoZW4gdGhlIEZXIGNhbiBzd2l0Y2ggdG8gSTJDIGludGVyZmFj
ZS4NCj4gPiArCSAqIE90aGVyd2lzZSwgdGhlIEZXIGNhbuKAmXQgIHdvcmsgd2l0aCBJMkMgaW50
ZXJmYWNlLiBTbyBoZXJlDQo+ID4gKwkgKiBqdXN0IHVzZSB0aGUgZXhpc3QgZnVuY3Rpb24gZWdh
bGF4X2Zpcm13YXJlX3ZlcnNpb24oKSB0bw0KPiA+ICsJICogc2VuZCBhIEkyQyBjb21tYW5kIHRv
IHRoZSBkZXZpY2UsIG1ha2Ugc3VyZSB0aGUgZGV2aWNlIEZXDQo+ID4gKwkgKiBzd2l0Y2ggdG8g
STJDIGludGVyZmFjZS4NCj4gPiArCSAqLw0KPiA+ICsJZXJyb3IgPSBlZ2FsYXhfZmlybXdhcmVf
dmVyc2lvbihjbGllbnQpOw0KPiA+ICsJaWYgKGVycm9yKSB7DQo+ID4gKwkJZGV2X2VycigmY2xp
ZW50LT5kZXYsICJGYWlsZWQgdG8gc3dpdGNoIHRvIEkyQyBpbnRlcmZhY2VcbiIpOw0KPiA+ICsJ
CXJldHVybiBlcnJvcjsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAkvKiBjb250cm9sbGVyIG1heSBi
ZSBpbiBzbGVlcCwgd2FrZSBpdCB1cC4gKi8NCj4gPiAgCWVycm9yID0gZWdhbGF4X3dha2VfdXBf
ZGV2aWNlKGNsaWVudCk7DQo+ID4gIAlpZiAoZXJyb3IpIHsNCj4gDQo+IEkgdGhpbmsgdGhpcyBz
aG91bGQgYmUgcGFydCBvZiBlZ2FsYXhfd2FrZV91cF9kZXZpY2UoKSwgaW4gY2FzZSB3aGVyZSB3
ZSBkbw0KPiBub3QgaGF2ZSBkZWRpY2F0ZWQgcmVzZXQgZ3Bpby4gQWxzbywgaW5zdGVhZCBvZiBh
YnVzaW5nIGZpcm13YXJlIHJlYWQsIHdvdWxkDQo+IGEgZHVtbXkgYnl0ZSByZWFkIGJlIGVub3Vn
aCAoaTJjX3Byb2JlX2Z1bmNfcXVpY2tfcmVhZCk/DQoNClRoYXQncyByZWFzb25hYmxlLCBJIHdp
bGwgbW92ZSB0aGUgY2hhbmdlIHRvIGVnYWxheF93YWtlX3VwX2RldmljZSgpLiBJIHdpbGwgaGF2
ZSBhIHRyeSB3aGV0aGVyIGEgZHVtbXkgYnl0ZSByZWFkIGNhbiB3b3JrLg0KUmVhbGx5IHRoYW5r
cyBmb3IgeW91ciBzdWdnZXN0aW9uIQ0KDQpSZWdhcmRzLA0KSGFpYm8gQ2hlbg0KPiBUaGFua3Mu
DQo+IA0KPiAtLQ0KPiBEbWl0cnkNCg==
