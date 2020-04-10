Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DB71A46AA
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 15:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgDJNSd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 09:18:33 -0400
Received: from mail-db8eur05on2070.outbound.protection.outlook.com ([40.107.20.70]:18340
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbgDJNSd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 09:18:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZA0tkyhuDTo2vNLOvc32tTzX8IOTHnqZEWkF5G3Lm9KVgFwzfPGl62F4zvIf4xLPOjaYtMAbvVWUnbIXhG1czzmKojXuX3tmF/Hf7qRNNIjNaYNWYO+9AAZm9KorYmZZE3mCbPi80RE6ipn6UsnW0Xyyt6eQFxZNuvpSh6PHL4eQjcSxbiOpIv+eLOOpuKb9le6XnlwHzLD2labErTUEy69udr31S9XzcV7wN2aMfSsDqdx+lkH45bG5agPVyNjXfhW3MPbdrBYr8FSLwr9hjr+Lg5kjEQ0hE6CvpC58yWQ9+kjPniWri/Kqa4NZ3wRGVuu8Qzy5XdUdSxhlH/NrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLnfXWkf5yPiSLiiHj/ob3tWifEYwEocV5SEVswkJoM=;
 b=g6BRfxhikQZLY6Ar7TU3MwVXLmaP75w9l/b4tP2KKk4yHduF9BLn3XcOz1l3QFqegndpg3BhQXawDNWJxxBB7cIka4m2ck7d7GiPBWchjp0UHEGZBW10mBMUzs7QctsbNUvLOgaZaPq25Ev7Orn4KTcYowr3kT9Ryz2svc0yWTQnyYuh9WFz44KCzMMtllWmRFRWNittRWFdXV5NxrWSyk1YVgMWki/x5myPkGos23dltKouY8LsR/wKqkch6kjVcP4XgLvKTdYjhquJUzf2OldojBBdGLVvVN0tGarcYFdEyGjVWyrqC1srrpU49Z8XOBYuTkbZr332D2D9jWnoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLnfXWkf5yPiSLiiHj/ob3tWifEYwEocV5SEVswkJoM=;
 b=cRu13LsDiwfOb8wJ/UkzG4yFvIL38U1/WGaoN8cA55NCtAiS/QzKEzzqB3bPY4nYhUt+AnPYMjVmPjUGr7Ul7pbIeYJDkP49GQU2CTYVowG5wTrW60gcyi+lZf8XO3RbKkbEOP17aOiGzLsU4UtbXDhIGJShXyL0SfUGNgr+EO0=
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com (2603:10a6:803:60::24)
 by VI1PR04MB4989.eurprd04.prod.outlook.com (2603:10a6:803:60::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 10 Apr
 2020 13:18:30 +0000
Received: from VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::154e:421d:dd21:3fc3]) by VI1PR04MB5040.eurprd04.prod.outlook.com
 ([fe80::154e:421d:dd21:3fc3%5]) with mapi id 15.20.2878.018; Fri, 10 Apr 2020
 13:18:30 +0000
From:   BOUGH CHEN <haibo.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 2/2] input: egalax_ts: correct the get_firmware_command
Thread-Topic: [PATCH v2 2/2] input: egalax_ts: correct the
 get_firmware_command
Thread-Index: AQHWDza00bAK/SUqr06BsZX3waR0h6hyUcCAgAAEq2A=
Date:   Fri, 10 Apr 2020 13:18:30 +0000
Message-ID: <VI1PR04MB50404E969231DDE30DFB62C690DE0@VI1PR04MB5040.eurprd04.prod.outlook.com>
References: <1586522585-14296-1-git-send-email-haibo.chen@nxp.com>
 <1586522585-14296-2-git-send-email-haibo.chen@nxp.com>
 <CAOMZO5BS4ZLd9__xhf+66h_y2-totNF-B3Hh_evotd_MYPK57g@mail.gmail.com>
In-Reply-To: <CAOMZO5BS4ZLd9__xhf+66h_y2-totNF-B3Hh_evotd_MYPK57g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=haibo.chen@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45271ace-a26e-4777-89bc-08d7dd51a987
x-ms-traffictypediagnostic: VI1PR04MB4989:|VI1PR04MB4989:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4989295498613154BEFF5F3A90DE0@VI1PR04MB4989.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5040.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(76116006)(6506007)(2906002)(26005)(5660300002)(8676002)(186003)(8936002)(81156014)(86362001)(53546011)(316002)(66556008)(54906003)(7696005)(33656002)(64756008)(478600001)(52536014)(66446008)(6916009)(4326008)(71200400001)(9686003)(66476007)(55016002)(66946007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YPxXgY4fwD+19blhSvWZHOYw+NGX1LbX5oOvFon7tDnq5qIyXiRSB/2M6A12SdKg1xN+wFIelKEhf6UakIpZq/SVjeaApJI1kySNuKyY6PyWQi0sv5pTSsD9LI+xAe8PtES6ksS6WSKqRU+/Cpst0tx5CLN1RoaT2gcKgK2KT0K2CEBhl6FSAND/4uaixc1R9ru8lkio/MxUJrUf6RDt86k6JOg/6l/ATPEuZg5eU6rDe3/JILgW8b/AC+gyE08vmuuksDTg5ueuZheqPNlxH6qKppBMWvACax3DSZpjpqAC4FhMhn8FqvQ4cYJ+xgxUaxAcq91Q0/5NCUSfJh1JAMTu7XbTAc2+qwtPj0utPZjyXUAPeSU7m1cb3V8tcim8H6hL9h0OZ8p66tjmzn1+dueR3zVM3rDBXkcg3bkX+EX7VLIm/aLBQ7/gPwApgEgP
x-ms-exchange-antispam-messagedata: TAlIWY2tr7Km7um18jXyp75kNvFEhAzr8N7aW8fjqSHksL1leXxOy0WpAFvBwueaoIlJiC5Ht6Lqkotrza+gL3RMTXw/zfzI0PRNgZdoVPa2ViW8EStJvL1zNXQRKFOVOO5pGOOKNdJCu/TbeYA2zA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45271ace-a26e-4777-89bc-08d7dd51a987
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 13:18:30.1416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n99aV2vy1uOF22lJFKduJndQAaUwVPetpgFxA76lzg8ehm0K+GGuRFjZOuN8SmVADeJgtyDPo2HTBO1bQzdXgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4989
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMOW5tDTmnIgxMOaXpSAyMTowMQ0KPiBUbzog
Qk9VR0ggQ0hFTiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogRG1pdHJ5IFRvcm9raG92IDxk
bWl0cnkudG9yb2tob3ZAZ21haWwuY29tPjsNCj4gbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3Jn
OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDIvMl0gaW5wdXQ6IGVnYWxheF90czogY29ycmVjdCB0aGUNCj4gZ2V0X2Zpcm13YXJlX2Nv
bW1hbmQNCj4gDQo+IEhpIEhhaWJvLA0KPiANCj4gT24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgOTo1
MSBBTSA8aGFpYm8uY2hlbkBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEhhaWJvIENo
ZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPg0KPiA+IEFjY29yZGluZyB0byB0aGUgVXNlciBH
dWlkZSwgdGhlIGdldCBmaXJtd2FyZSBjb21tYW5kIGlzIHsgMHgwMywgMHgwMywNCj4gPiAweGEs
IDB4MDEsICdEJyB9LCBBU0NJSSB2YWx1ZSBvZiAnRCcgaXMgMHg0NC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9lZ2FsYXhfdHMuYyB8IDQgKystLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMNCj4gPiBiL2Ry
aXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZWdhbGF4X3RzLmMNCj4gPiBpbmRleCBjODE2ZTAzYmE0
MjEuLmJiMGE1OWQxOWYzNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lucHV0L3RvdWNoc2Ny
ZWVuL2VnYWxheF90cy5jDQo+ID4gKysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9lZ2Fs
YXhfdHMuYw0KPiA+IEBAIC0xNzEsMTAgKzE3MSwxMCBAQCBzdGF0aWMgaW50IGVnYWxheF93YWtl
X3VwX2RldmljZShzdHJ1Y3QNCj4gPiBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4NCj4gPiAgc3Rh
dGljIGludCBlZ2FsYXhfZmlybXdhcmVfdmVyc2lvbihzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
KSAgew0KPiA+IC0gICAgICAgc3RhdGljIGNvbnN0IHU4IGNtZFtNQVhfSTJDX0RBVEFfTEVOXSA9
IHsgMHgwMywgMHgwMywgMHhhLCAweDAxLA0KPiAweDQxIH07DQo+ID4gKyAgICAgICBzdGF0aWMg
Y29uc3QgdTggZ2V0X2Zpcm13YXJlX2NtZFtNQVhfSTJDX0RBVEFfTEVOXSA9IHsgMHgwMywNCj4g
PiArIDB4MDMsIDB4YSwgMHgwMSwgMHg0NCB9Ow0KPiANCj4gVGhlIHJlbmFtZSBmcm9tICdjbWQn
IHRvICdnZXRfZmlybXdhcmVfY21kJyBpcyBhbiB1bnJlbGF0ZWQgY2hhbmdlLg0KPiANCj4gVGhl
IG9ubHkgY2hhbmdlIEkgd291bGQgZXhwZWN0IHRvIHNlZSBpbiB0aGlzIHBhdGNoIGlzIDB4NDEg
dG8gMHg0NC4NCj4gDQo+IFNpbmNlIHRoaXMgaXMgYnVnIGZpeCwgcGxlYXNlIGFkZCBhIEZpeGVz
IHRhZy4NCg0KT2theSwgVGhhbmtzIGZvciB5b3VyIHJldmlldyENCg0KQmVzdCBSZWdhcmRzDQpI
YWlibyBDaGVuDQoNCj4gDQo+IFRoYW5rcw0K
