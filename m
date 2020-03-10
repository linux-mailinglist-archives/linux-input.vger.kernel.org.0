Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7414417EE49
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 02:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgCJB64 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 21:58:56 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:46277
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726156AbgCJB64 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Mar 2020 21:58:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVA8LXiCWtwyqfDfoI0rZfrcyvZhjLcW1076l0G3n6oeis3xyMOcs9e6SAJdHZez/fSyD8T7NlK1DCaaW3XEND3SSValKQkxDfAntIVe5zN4Uo9wBDtBPAaf9rer77gJF6cAoC+UTcg27YjV3DRjezgPwMlAClz1X/2oYH4J2FLwwI7CQZXrF+wxV6IRS5Ze7jNijxz+kbr3ECSY60HrFuqowpeJAl+M0u0//Lr/k4EzVDUWmzJqLnji93hi4yTxJqhUAfEeouzb/u3sWAykyVvCvywbheRvV5UfGYD4tAPenykHoZ4KqprhfUZdBQ7HocgCPReMza7WapRsOAKCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al7mrZMff31qWmsz9z4GdOestBL4HjlZwGg3S672U40=;
 b=Z4eWl9827W9N2inKdcNAmtJFki12ZmZzZ3WHYz9TsU+n8P9JNJHd69uoNRpUvlqI25K93Vb6CDIcj3RHoUI/rGq8ZZU0gAY5RSftFepQwn8C+Ys4XDMulBiyhwLcUgmSQpHe7wJDZbKgBddGC28mMQQFw/QpHoRdGPPW4vGJicJh3rn3+lSA8LwQ7VZOsFgSTZSm4xiuy8zNvL1MsA/HzkpPpBjJIqSF7df57RMYVvQ2Ll4lWO5AfX8ivAmuNi3t0ATTjfuMXe0Ku6cUvSyIFjijuDiJWhiXfhUFvoTA7SgV0Y/FHfcxNMk7h/HL6+6Npf1s57lFLBdbXsANaq/Hig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al7mrZMff31qWmsz9z4GdOestBL4HjlZwGg3S672U40=;
 b=XsvC7LLy7TQ+rSLxxLcWykJVvmxB4V8GRRNWs04Uee0jQXtkGs5RdmwecRpHqpI2JvWbzyn2HhNsu5QNMK6yOIcQ0qh/AcdMdS4Hmaf3X3EdcyjI2lmARf2jtzanlMvkBJpUkoQolQY0tsbnLNR1GMOHw+DKL5mYCr+J5rVXMjM=
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com (20.177.52.24) by
 VI1PR04MB4960.eurprd04.prod.outlook.com (20.177.49.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 01:58:49 +0000
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::d0c7:37d1:d835:a682]) by VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::d0c7:37d1:d835:a682%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 01:58:49 +0000
From:   BOUGH CHEN <haibo.chen@nxp.com>
To:     BOUGH CHEN <haibo.chen@nxp.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] input: egalax_ts: switch to i2c interface before wake
 up
Thread-Topic: [PATCH 1/2] input: egalax_ts: switch to i2c interface before
 wake up
Thread-Index: AQHV4LfPp2g6PWjH60CmDpEEgaRBqahBPQSw
Date:   Tue, 10 Mar 2020 01:58:49 +0000
Message-ID: <VI1PR04MB5040BE3CE3413B12A252372F90FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=haibo.chen@nxp.com; 
x-originating-ip: [112.23.103.235]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 25875051-deb7-4989-8ee4-08d7c49693ac
x-ms-traffictypediagnostic: VI1PR04MB4960:|VI1PR04MB4960:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4960C97E7999D58030273DED90FF0@VI1PR04MB4960.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(189003)(199004)(186003)(55016002)(4326008)(110136005)(7696005)(33656002)(9686003)(86362001)(478600001)(26005)(53546011)(316002)(64756008)(66556008)(6506007)(66476007)(66446008)(5660300002)(2906002)(8936002)(66946007)(76116006)(8676002)(81166006)(52536014)(71200400001)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4960;H:VI1PR04MB5040.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eStSRTLqfl5WHLOZkVyoyNOn6wf2PExQ1DDkcA9pLcEzUdTjwx98JhCx+QcfDegYIQk9njavA/S/WMn0uCWZI1pjtIke2b+uew5VvhG2PV+zpNGC6Rn42JXtxMgOSwg7G7wlCykes6m4CEqSK/5H/czgrqF+WfexoUctScuY75p8r+r64efnzO3JkFmNfb1TVpBOKl6lvWl8SpCEaPm0fQUt6XkP33V8SpoB0aPOfRbIvFe26yfcRqkZIZ486EIsitWhgqnMvd/TVsdZBE0bZqsw1ZYPBTbibYqy/nrJwghd88iCxSxrYpe9DSFBRKvAGkoRPThdQngUl+cbjenMGyggkCObgD/ugm+Rjx7pvHokXJdM6zkwrx11lzQCIhAKUREZOGdoN+WMnmCWT2lLV63m2wsupiJbp8MOGunwLJwc4gUYoXZoZss/Eh8tDWOc
x-ms-exchange-antispam-messagedata: 2wF6j61ctFjQebsHuEqT0bmCWLIFY44x/g7bMGbvI1C/cEt1p4V0TzlC2VcyajqSwJ6d3/UhSUYvN43n8mIxVaAcVOi2gDVEajxlFf8OJpXNc8Gja6IY18i+1R5AbK54WRg2UE9GCcms4nqu/+zJkQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25875051-deb7-4989-8ee4-08d7c49693ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 01:58:49.5402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIa27SfHMVNR4mj8oYlE96lpIvXYrsbdmZfDaWDBkR6lq5izTLcAop36GK7LrRgjlj3R3/hq/t9zZzwHOiFIEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4960
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

UGluZy4uLg0KDQpIaSBEbWl0cnksDQoNCkNhbiB5b3UgaGVscCByZXZpZXcgdGhlc2UgdHdvIHBh
dGNoZXM/DQoNCkhhaWJvIENoZW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogaGFpYm8uY2hlbkBueHAuY29tIDxoYWliby5jaGVuQG54cC5jb20+DQo+IFNlbnQ6IDIwMjDl
ubQy5pyIMTHml6UgMTY6NDENCj4gVG86IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb207IGxpbnV4
LWlucHV0QHZnZXIua2VybmVsLm9yZw0KPiBDYzogQk9VR0ggQ0hFTiA8aGFpYm8uY2hlbkBueHAu
Y29tPjsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIIDEvMl0gaW5wdXQ6IGVnYWxheF90czogc3dpdGNoIHRvIGkyYyBpbnRlcmZhY2UgYmVmb3Jl
IHdha2UgdXANCj4gDQo+IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4g
DQo+IEZvciBIYW5uU3RhciAoSFNEMTAwUFhOMSBSZXY6IDEtQTAwQzExIEYvVzowNjM0KSBMVkRT
IHRvdWNoIHNjcmVlbiwgaXQNCj4gaGFzIGEgc3BlY2lhbCByZXF1ZXN0IGZvciB0aGUgRUVUSSB0
b3VjaCBjb250cm9sbGVyLiBUaGUgaG9zdCBuZWVkcyB0byB0cmlnZ2VyDQo+IEkyQyBldmVudCB0
byBkZXZpY2UgRlcgYXQgYm9vdGluZyBmaXJzdCwgYW5kIHRoZW4gdGhlIEZXIGNhbiBzd2l0Y2gg
dG8gSTJDDQo+IGludGVyZmFjZS4gT3RoZXJ3aXNlLCB0aGUgRlcgY2Fu4oCZdCAgd29yayB3aXRo
IEkyQyBpbnRlcmZhY2UsIGFuZCBjYW4ndA0KPiBnZW5lcmF0ZSBhbnkgaW50ZXJydXB0IHdoZW4g
dG91Y2ggdGhlIHNjcmVlbi4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VuZCBhbiBJMkMgY29tbWFuZCBi
ZWZvcmUgdGhlIGRldmljZSB3YWtlIHVwLCBtYWtlIHN1cmUgdGhlDQo+IGRldmljZSBzd2l0Y2gg
dG8gSTJDIGludGVyZmFjZSBmaXJzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4g
PGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVu
L2VnYWxheF90cy5jIHwgMTQgKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVl
bi9lZ2FsYXhfdHMuYw0KPiBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMN
Cj4gaW5kZXggODNhYzhjMTI4MTkyLi41ZTM1Y2E1ZWRjN2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMNCj4gKysrIGIvZHJpdmVycy9pbnB1dC90
b3VjaHNjcmVlbi9lZ2FsYXhfdHMuYw0KPiBAQCAtMTgzLDYgKzE4MywyMCBAQCBzdGF0aWMgaW50
IGVnYWxheF90c19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAgCXRzLT5jbGll
bnQgPSBjbGllbnQ7DQo+ICAJdHMtPmlucHV0X2RldiA9IGlucHV0X2RldjsNCj4gDQo+ICsJLyog
SGFublN0YXIgKEhTRDEwMFBYTjEgUmV2OiAxLUEwMEMxMSBGL1c6MDYzNCkgTFZEUyB0b3VjaA0K
PiArCSAqIHNjcmVlbiBuZWVkcyB0byB0cmlnZ2VyIEkyQyBldmVudCB0byBkZXZpY2UgRlcgYXQg
Ym9vdGluZw0KPiArCSAqIGZpcnN0LCBhbmQgdGhlbiB0aGUgRlcgY2FuIHN3aXRjaCB0byBJMkMg
aW50ZXJmYWNlLg0KPiArCSAqIE90aGVyd2lzZSwgdGhlIEZXIGNhbuKAmXQgIHdvcmsgd2l0aCBJ
MkMgaW50ZXJmYWNlLiBTbyBoZXJlDQo+ICsJICoganVzdCB1c2UgdGhlIGV4aXN0IGZ1bmN0aW9u
IGVnYWxheF9maXJtd2FyZV92ZXJzaW9uKCkgdG8NCj4gKwkgKiBzZW5kIGEgSTJDIGNvbW1hbmQg
dG8gdGhlIGRldmljZSwgbWFrZSBzdXJlIHRoZSBkZXZpY2UgRlcNCj4gKwkgKiBzd2l0Y2ggdG8g
STJDIGludGVyZmFjZS4NCj4gKwkgKi8NCj4gKwllcnJvciA9IGVnYWxheF9maXJtd2FyZV92ZXJz
aW9uKGNsaWVudCk7DQo+ICsJaWYgKGVycm9yKSB7DQo+ICsJCWRldl9lcnIoJmNsaWVudC0+ZGV2
LCAiRmFpbGVkIHRvIHN3aXRjaCB0byBJMkMgaW50ZXJmYWNlXG4iKTsNCj4gKwkJcmV0dXJuIGVy
cm9yOw0KPiArCX0NCj4gKw0KPiAgCS8qIGNvbnRyb2xsZXIgbWF5IGJlIGluIHNsZWVwLCB3YWtl
IGl0IHVwLiAqLw0KPiAgCWVycm9yID0gZWdhbGF4X3dha2VfdXBfZGV2aWNlKGNsaWVudCk7DQo+
ICAJaWYgKGVycm9yKSB7DQo+IC0tDQo+IDIuMTcuMQ0KDQo=
