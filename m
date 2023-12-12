Return-Path: <linux-input+bounces-714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7765B80E702
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 10:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6A4282AE9
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 09:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257B158112;
	Tue, 12 Dec 2023 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mENqulwx"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10A7B7;
	Tue, 12 Dec 2023 01:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmOnhEEjxUqGUCRWCHwrS23f7SbWwigCi7gkV2WM+bd4V0pEOFB1ZsPRYA6Lw6YBLmX+HN6YnhTEryZc5zfTlAZ8EyfexUFZxh4iLfTaESjUuyei7MbpPd0ESLljvcFTlZmKbH8ZJosqVE5Qnewu6FzNqtbe85fMlO+YVwQjhtUoeQWVa+2E3DJoZSUQA+xVGaabEWxJfHltoOm9670Lyio4/4hUBxcbKdcqpHbeehl5sP/Qo9FlrSr0A8jmfNctdoliMSJyJX9byznb+6PEdKW7qEWMkI7HpCo6nkhxDqLs34nzBHzz6t4fzpahAheKAj365gwnJ6xFyng6U9OBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eqqqjuAVjiZzT4BTcn7Vsf25Zwc5eoSvN0QzUbW7vQ=;
 b=WagMn2j4duhaLdug3/QdlmlypkrLB6l5EKJqNPIn8j+JhEc5GMqPUW+MgcwOB6zwupcwW/WwYG1O0KRYrU+w33is647o9DKr7qk6SkcbiCrRGGfxk5hf/S8X8Sz64VhqcW0b3tyJaNLTdDo5RD4R6sESaO9bJFE65dUcmaNf87ULgqtXY6850g1goDl5Mhh5eMNHiGKb2n+HYH0H8+2hdyuLm+lNfIbs38TzpF8ZdNjARLQxpH5Od5gvPmzVALSRH8D1UQuZ9a/Wui8/6qU02CaO41ubx3EbVA/vh9IBoYC7gx9jHw1yvE3h1DwZ9ZtXnAImhpjDZHAAoFv9Vq3AHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eqqqjuAVjiZzT4BTcn7Vsf25Zwc5eoSvN0QzUbW7vQ=;
 b=mENqulwxhOCJvCg93DFWzVW1COKOkxPSjmifPapxLBOAiPAlIBziYQjYL9Opz8IrwSQlYfHMfGUzxdcCGY/HfciwABiE8mIEjmRRbiUfsRhS+Km2qAvwfYtPDQ4+EJwGmca9nTuLtEbWW/YBoaKWJugriYfwSGdRzG6RUjBLqRc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5522.jpnprd01.prod.outlook.com
 (2603:1096:604:a1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.23; Tue, 12 Dec
 2023 09:03:41 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 09:03:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Support Opensource
	<support.opensource@diasemi.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
Thread-Topic: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
Thread-Index: AQHaLFMbdcpDY7K7Gkyzrof7UGihELClSkSAgAAPDLA=
Date: Tue, 12 Dec 2023 09:03:39 +0000
Message-ID:
 <TYCPR01MB112699325FAC71E81546D258B868EA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
 <20231211165708.161808-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5522:EE_
x-ms-office365-filtering-correlation-id: 0909a07e-a103-4342-e408-08dbfaf13b76
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d6plV8yVe6yVdVxVwjinrynV7o0WDgxtMo1DOzMIKz7bFLCVzPf69LyshvMTW0WBIFgv9aAyP4dvKm2frfu/dfx41pGVAj3DNfQdBMS5P4HXBH4F6gzN53dvoA6DgdqgbV/hrgfSk43iGoZ0dPZgigZqvuuqp7DdYv5o6AxqlBSk/FT8Q8/TGCQ+AJzvQWkUQRZPgWqSaBPWbbLc9eQiA4w+CuFSjdESDF2mFOUPmxezEQkyA/Y80ARMYsKOJkMyqB64SyVja7Ja7Zb32XG0R9z6XY/LOhFytgl724sUBZB4I7BVnLrQxr2VkAuPxu47AISNOywMHyd6W7RMyJ7DtG9yMMWTbEpWwljoQFMOkNJwQ0gtbk+k61Kwi/s5dKHTETfqdkYMqjl+ASVGy02+fH2JHzz7fcDzWM05Z67BjBbIsHnzfMC0Rz6R5KqjdsfVkpbo8rreWwG8ly9wJrqGxzW7ZNvL9PLJ1s9goddKnoa/qHUHOAllWNu3jr8NAHMGFfkRQHDyTSJPAqGOSjLUIRSW9qLQ75kDy7RSedwrzLcHcluq2fmP6q74BO13pv5iQpsk+qwA4Mp6jn8jhuCgCCqiZjXSpkoeAmkRGU9uXUIsSCHoLWK9JjyiRlRXNNfS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(122000001)(38100700002)(86362001)(316002)(33656002)(55016003)(66556008)(66476007)(41300700001)(26005)(83380400001)(6506007)(9686003)(66446008)(64756008)(53546011)(7696005)(2906002)(71200400001)(478600001)(38070700009)(76116006)(6916009)(66946007)(54906003)(8936002)(4326008)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0lPWlczTzlHbWFSdUdQd1ppM1hCeTI5djZGTkgzVnhjSzFja0R2c2JpZVhR?=
 =?utf-8?B?L0pCV0czdXVDRXV0YUhFdlpENXpGOEYyMDczd1ZtYTVBa2FQQjZCTXBrcGxx?=
 =?utf-8?B?Wmo4VEl5V0swMnJXeDZ1dEh5SUhhUzBkZGhxU1hkditKL0F3eUtoL000MFlF?=
 =?utf-8?B?bVVKaTJhR3M3MmZKKzJkV3dYSEZjYnFFWlhhREZzR3lkMUdpaEtzd1ZwODl2?=
 =?utf-8?B?ZEMrbThLeFVlNysxL1Q1RlRIeGdRbzhRbnJiUDRxbzh1bDhHWE9SaWNYQ0Y4?=
 =?utf-8?B?NjJMMWNRUWRlN2tpMk5GREFUeUQxWmNrc3dZNDRtY3B6VGlNR0o0VVB0SVdC?=
 =?utf-8?B?L1VWcGlSd1dZbW1zU2tQWndyVXcwMzJiRE1tUlVmL2crL2lDdWFGd1JaT0E2?=
 =?utf-8?B?TFlZK3NScjlCRHBSdDRZNGdRVS9QOVpvcEFUcDBwdkZCUkpKbVpsSHFib0hm?=
 =?utf-8?B?Smt6M28rRHVlS2J2bHdmYjBMSmZma1RrUnh6OTJkV0c2UnFPSkFReENja205?=
 =?utf-8?B?L3VsN2phRWRRNnkzK2xPQXpJQzZlekt0cWRrU3JxUlFkSUtGWUlCY0F1Tmc1?=
 =?utf-8?B?TnhkRWYvS0cvN3RMY1pob2c3NHord1NXWndIUTFOWHk2QklzU0F5NllaTlFh?=
 =?utf-8?B?MFRJWno4QnZkZWFDeTR0Sm1xZlNsWDBqR2FFM1l6Y2YyMy9ZVzNLaUwzcFBX?=
 =?utf-8?B?UWM5cUpqSStLWjRwYVNVTWQ1TTNiUlNUOTllRXFNa09kMU91Z0ZHbDJSOVVz?=
 =?utf-8?B?MGpobTBMVXpvSVBrdm42ZDBPOEk1U2R4ckZEMUJic1JVSGJJM09SSWx5TGlR?=
 =?utf-8?B?NSt4NXNTQ2k2MGhVRXBDL0dvdUl6YnBRYkZuOXkrYVk3TDBDdGZHNXIrOTRh?=
 =?utf-8?B?TnczaFQrU2VlTVp4VTRBNXptNFhoNis4d3ZQVDFkcTdYWktXNWtJWitCcC9K?=
 =?utf-8?B?Vi9rM0pnOWpNalg0VEN2NE0zN1R4T1VGSWU3N1lRUlByUjdnYlJlTzhPZUxX?=
 =?utf-8?B?ZUZJdTVTcHpDK2Y4MnljQlV0Nkl6Q0VIWU9GNzFlRk9LQzJad2VjN0xtTVpj?=
 =?utf-8?B?ZllwSVZQckExL3p4TzBSTXN4bDlSTUJvU3JMM0RESUxxZjdsYTRDWTdnZGxF?=
 =?utf-8?B?bk0xazZaU2oxTlpmTFNMS09CWVV0cjhibUp4L3NWTzI5WTVkc0ZRNEF3OWhn?=
 =?utf-8?B?NHY5eUg0blA2ZkNOdE9HM0dXZGNYeEZheEgrUHdIR3dMU0h3cFVGMTFuS1Bh?=
 =?utf-8?B?QllLL0NOUEMyanl0YitTKzhCbkUvQk8ralJ5dmEvcHdrc1ZhT0hLQWJIZzlX?=
 =?utf-8?B?bmJ4UWNmam55LytIVWlqWUNMYXlUKytSTmcyUVRoZjYyQXRJOHJ6RkpBUHRD?=
 =?utf-8?B?bHArdXN4ajY2TmJnOTlIYmFPTFZNVHNNZXJybmRGaW9ldUllNmg4aDRSeFRD?=
 =?utf-8?B?dVJLK25xZGMrYlcrdURUaUEyV2grMUZrcmxyenFBNVgrdkJBbEJRM0llYVZo?=
 =?utf-8?B?UWVLSW1HY1FuSVVBN3pneVV6dWFJVWlEM3p2eWFVSnQydnRwbTdLM09LSU5Y?=
 =?utf-8?B?V3VoRFFPWUE2MnN3K3ZtS0RzZkZFNEpjbVhvTnhHY2l4ODIyVjM4Z0hFQlJh?=
 =?utf-8?B?aEMwcW5OUnRyaE9DT1RPWXpWRkdCYmFQMWlLa1VPZmVoMG1GZEdrK3FYMFpS?=
 =?utf-8?B?UXJMSTZacERQZk9TL2hzR0RiMFFhVXI4dHY4aVF4ajJ5Znc4U3JwQ0JxamZs?=
 =?utf-8?B?MHl4OXNlTjZ1WVlFRVJyN3loY0s0SWNuRWlGSWhnTFF3Z3dGS0lyYWxaeUZk?=
 =?utf-8?B?ZDM4bndpQjcyVUVUKzJ5SjVBdW5vSW1TSkl4R01RQXIxTldGTXhtZmR1TllG?=
 =?utf-8?B?VCs0TGpSdkVFWURZNVVOdGx4MEM2TFpJdnh5NmhqM2xvQkJvV1MzZ3hZaHZS?=
 =?utf-8?B?bFk0dFhWMUYweGxxVUt4Y0V1clVtUGZHRmk5L2NVU1loTkpzb3BsVlVvV1kv?=
 =?utf-8?B?ZUdIL1oxa3Y1a2IzNFU3a0xOek1Wd05oTzAxRDBmU2FBYnd2T0ZqM0FjRmxv?=
 =?utf-8?B?MzI2SkF1aGV2cnV0MzdXYkxiZFlwWjJTRC9YZFBobmZCMnVscTBLdWEvaDQv?=
 =?utf-8?B?eVI4MGg3R2o2Q01GTGVWVlM1Qm1FRnFuQ3JneEtDbmRWUnZvMzExZExTankr?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0909a07e-a103-4342-e408-08dbfaf13b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 09:03:39.4215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfVHLm60wtZ1pbrIFjIUhUkwKZH767/k1vqZlmfcSf8N8pN8dR47zGagbtUWb4CrGJZktGJgt4bNecyh+3iMj8oC8YgylyL1JItBzUEB9f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5522

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDEyLCAyMDIzIDg6MDIgQU0NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAyLzNdIElucHV0OiBkYTkwNjMgLSBVc2UgZGV2X2Vycl9wcm9iZSgp
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgNTo1N+KAr1BN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gUmVw
bGFjZSBkZXZfZXJyKCktPmRldl9lcnJfcHJvYmUoKSB0byBzaW1waWxmeSBwcm9iZSgpLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2lu
cHV0L21pc2MvZGE5MDYzX29ua2V5LmMNCj4gPiArKysgYi9kcml2ZXJzL2lucHV0L21pc2MvZGE5
MDYzX29ua2V5LmMNCj4gPiBAQCAtMTg1LDEwICsxODUsOSBAQCBzdGF0aWMgaW50IGRhOTA2M19v
bmtleV9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4NCj4gPiAg
ICAgICAgIG9ua2V5ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZihzdHJ1Y3QgZGE5
MDYzX29ua2V5KSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwp
Ow0KPiA+IC0gICAgICAgaWYgKCFvbmtleSkgew0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJy
KCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5LlxuIik7DQo+ID4gLSAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+IC0gICAgICAgfQ0KPiA+ICsgICAgICAgaWYg
KCFvbmtleSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYt
PmRldiwgLUVOT01FTSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IkZhaWxlZCB0byBhbGxvY2F0ZSBtZW1vcnkuXG4iKTsNCj4gDQo+IFBsZWFzZSBkcm9wIHRoZSBl
cnJvciBwcmludGluZyBpbnN0ZWFkLCB0aGUgbWVtb3J5IGFsbG9jYXRpb24gY29yZSBjb2RlDQo+
IGFscmVhZHkgdGFrZXMgY2FyZSBvZiB0aGF0IGluIGNhc2Ugb2YgT09NLg0KDQpPSy4NCg0KPiAN
Cj4gPg0KPiA+ICAgICAgICAgb25rZXktPmNvbmZpZyA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgm
cGRldi0+ZGV2KTsNCj4gPiAgICAgICAgIGlmICghb25rZXktPmNvbmZpZykNCj4gPiBAQCAtMTk3
LDE5ICsxOTYsMTcgQEAgc3RhdGljIGludCBkYTkwNjNfb25rZXlfcHJvYmUoc3RydWN0DQo+IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgIG9ua2V5LT5kZXYgPSAmcGRldi0+ZGV2
Ow0KPiA+DQo+ID4gICAgICAgICBvbmtleS0+cmVnbWFwID0gZGV2X2dldF9yZWdtYXAocGRldi0+
ZGV2LnBhcmVudCwgTlVMTCk7DQo+ID4gLSAgICAgICBpZiAoIW9ua2V5LT5yZWdtYXApIHsNCj4g
PiAtICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiUGFyZW50IHJlZ21hcCB1bmF2
YWlsYWJsZS5cbiIpOw0KPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOw0KPiA+IC0g
ICAgICAgfQ0KPiA+ICsgICAgICAgaWYgKCFvbmtleS0+cmVnbWFwKQ0KPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAtRU5YSU8sDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJQYXJlbnQgcmVnbWFwIHVuYXZhaWxhYmxl
LlxuIik7DQo+ID4NCj4gPiAgICAgICAgIG9ua2V5LT5rZXlfcG93ZXIgPSAhb2ZfcHJvcGVydHlf
cmVhZF9ib29sKHBkZXYtPmRldi5vZl9ub2RlLA0KPiA+DQo+ID4gImRsZyxkaXNhYmxlLWtleS1w
b3dlciIpOw0KPiA+DQo+ID4gICAgICAgICBvbmtleS0+aW5wdXQgPSBkZXZtX2lucHV0X2FsbG9j
YXRlX2RldmljZSgmcGRldi0+ZGV2KTsNCj4gPiAtICAgICAgIGlmICghb25rZXktPmlucHV0KSB7
DQo+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBhbGxv
Y2F0ZWQgaW5wdXQNCj4gZGV2aWNlLlxuIik7DQo+ID4gLSAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPiA+IC0gICAgICAgfQ0KPiA+ICsgICAgICAgaWYgKCFvbmtleS0+aW5wdXQpDQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIC1FTk9N
RU0sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8g
YWxsb2NhdGVkIGlucHV0DQo+ID4gKyBkZXZpY2UuXG4iKTsNCj4gDQo+IGRldm1faW5wdXRfYWxs
b2NhdGVfZGV2aWNlKCkgb25seSBmYWlscyBvbiBPT00sIHNvIG5vIG5lZWQgdG8gcHJpbnQNCj4g
YW55dGhpbmcuDQoNCk9LLg0KDQo+IA0KPiA+DQo+ID4gICAgICAgICBvbmtleS0+aW5wdXQtPm5h
bWUgPSBvbmtleS0+Y29uZmlnLT5uYW1lOw0KPiA+ICAgICAgICAgc25wcmludGYob25rZXktPnBo
eXMsIHNpemVvZihvbmtleS0+cGh5cyksICIlcy9pbnB1dDAiLCBAQA0KPiA+IC0yMjEsMTIgKzIx
OCw5IEBAIHN0YXRpYyBpbnQgZGE5MDYzX29ua2V5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gPiAqcGRldikNCj4gPg0KPiA+ICAgICAgICAgZXJyb3IgPSBkZXZtX2RlbGF5ZWRfd29y
a19hdXRvY2FuY2VsKCZwZGV2LT5kZXYsICZvbmtleS0+d29yaywNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYTkwNjNfcG9sbF9vbik7DQo+ID4gLSAg
ICAgICBpZiAoZXJyb3IpIHsNCj4gPiAtICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2
LA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gYWRkIGNhbmNlbCBwb2xs
IGFjdGlvbjogJWRcbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZXJyb3IpOw0KPiA+
IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyb3I7DQo+ID4gLSAgICAgICB9DQo+ID4gKyAgICAg
ICBpZiAoZXJyb3IpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZw
ZGV2LT5kZXYsIGVycm9yLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiRmFpbGVkIHRvIGFkZCBjYW5jZWwgcG9sbA0KPiA+ICsgYWN0aW9uXG4iKTsNCj4gDQo+IGRl
dm1fZGVsYXllZF93b3JrX2F1dG9jYW5jZWwoKSBvbmx5IGZhaWxzIG9uIE9PTSwgc28gbm8gbmVl
ZCB0byBwcmludA0KPiBhbnl0aGluZy4NCg0KT0suDQoNCj4gDQo+ID4NCj4gPiAgICAgICAgIGly
cSA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJPTktFWSIpOw0KPiA+ICAgICAgICAg
aWYgKGlycSA8IDApDQo+ID4gQEAgLTIzNiwxMSArMjMwLDkgQEAgc3RhdGljIGludCBkYTkwNjNf
b25rZXlfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLA0KPiBkYTkwNjNfb25rZXlf
aXJxX2hhbmRsZXIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSVJRRl9UUklHR0VSX0xPVyB8DQo+IElSUUZfT05FU0hPVCwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiT05LRVkiLCBvbmtleSk7DQo+ID4gLSAgICAg
ICBpZiAoZXJyb3IpIHsNCj4gPiAtICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LA0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gcmVxdWVzdCBJUlEgJWQ6ICVk
XG4iLCBpcnEsIGVycm9yKTsNCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIGVycm9yOw0KPiA+
IC0gICAgICAgfQ0KPiA+ICsgICAgICAgaWYgKGVycm9yKQ0KPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBlcnJvciwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byByZXF1ZXN0IElSUSAlZFxuIiwNCj4g
PiArIGlycSk7DQo+IA0KPiBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZSgpIGFscmVhZHkgcHJpbnRz
IGFuIGVycm9yIG1lc3NhZ2Ugb24gZmFpbHVyZS4NCg0KSSB3aWxsIGNoYW5nZSB0aGUgcHJpbnQg
bWVzc2FnZSBhcyAiIEZhaWxlZCB0byBhbGxvY2F0ZSBvbmtleSBpcnEiPz8NCg0KPiANCj4gPg0K
PiA+ICAgICAgICAgZXJyb3IgPSBkZXZfcG1fc2V0X3dha2VfaXJxKCZwZGV2LT5kZXYsIGlycSk7
DQo+ID4gICAgICAgICBpZiAoZXJyb3IpDQo+ID4gQEAgLTI1MSwxMSArMjQzLDkgQEAgc3RhdGlj
IGludCBkYTkwNjNfb25rZXlfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gPiAgICAgICAgICAgICAgICAgZGV2aWNlX2luaXRfd2FrZXVwKCZwZGV2LT5kZXYsIHRydWUp
Ow0KPiA+DQo+ID4gICAgICAgICBlcnJvciA9IGlucHV0X3JlZ2lzdGVyX2RldmljZShvbmtleS0+
aW5wdXQpOw0KPiA+IC0gICAgICAgaWYgKGVycm9yKSB7DQo+ID4gLSAgICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRv
IHJlZ2lzdGVyIGlucHV0IGRldmljZTogJWRcbiIsIGVycm9yKTsNCj4gPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIGVycm9yOw0KPiA+IC0gICAgICAgfQ0KPiA+ICsgICAgICAgaWYgKGVycm9yKQ0K
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBlcnJv
ciwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBy
ZWdpc3RlciBpbnB1dA0KPiA+ICsgZGV2aWNlXG4iKTsNCj4gDQo+IExvb2tzIGxpa2UgYWxsIG5v
bi1PT00gZmFpbHVyZSBwYXRocyBpbiBpbnB1dF9yZWdpc3Rlcl9kZXZpY2UoKSBhbHJlYWR5DQo+
IHByaW50IGFuIGVycm9yIG1lc3NhZ2UsIHRvby4uLg0KDQpPSywgSSB3aWxsIHNlbmQNCg0KMSkg
c2VwYXJhdGUgcGF0Y2ggZm9yIGRyb3BwaW5nIHVubmVlZGVkIHByaW50cyByZWxhdGVkIHRvIE9P
TQ0KMikgQSBwYXRjaCBmb3IgcmVwbGFjaW5nIGRldl9lcnIoKS0+ZGV2X2Vycl9wcm9iZSgpICsg
VXBkYXRlIGVycm9yIG1lc3NhZ2UgZm9yIGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoKQ0KMykg
c2VwYXJhdGUgcGF0Y2ggZm9yIGRyb3BwaW5nIHByaW50IG1lc3NhZ2UgZm9yIGlucHV0X3JlZ2lz
dGVyX2RldmljZSgpOw0KDQpJcyBpdCBvaz8NCg0KQ2hlZXJzLA0KQmlqdQ0K

