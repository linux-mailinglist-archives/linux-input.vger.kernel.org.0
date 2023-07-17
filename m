Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC8F755F13
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 11:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjGQJS3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 05:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjGQJS2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 05:18:28 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11147C7;
        Mon, 17 Jul 2023 02:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6AXdDzH2z4bKx3CRFwveZ2p+hml3zDZnYcDU/C0PgeDBBVJM8+UAT6robLWLfjHS2RcazYPbzTotqACWYzSEQUtZJP/9/PkXVrtEWR3JL9FTZfLwSTKanqyhh2TfTyyh9kfgqS4gxYmIXsWUGExj4MUOFrMSyi+ZEInXU5WspWWkPoLJgjUmDQdvJaqeb5bAhkdM+zgpN9YOjURneHvBjaJVDYRUCYLpckcsXf904iUC0pPS9/x7ClrskmIUPizs38aCkV7CstCbRYf8cwlvzjgKJWOwK8xiolKT1wb1Dev72o6rySuO+0+kAbK2pl057uGkEZ6iVjYAfQXVgyf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6wwCcNtglv5CfqVbZGYPy7ow91jgoQhHSr4UFQDHHM=;
 b=f+mTpn2Q6S6E0GT5Hf0hc7Mr7zY2z3aXqHjsVopfyRzFMnhtaAnVZvlHkRLfCLjgFJc4a/MqytwRU46W5WCV7NszKlcV/gH/rSB2hWpjeq2kICb82CXRiTr7Hw+/dpXcStDcZSzA3lrzdZGlzQPi9RStXK7DEDmpj4p2gRxfnEr1RwXb6YSy8bqBn79QBtVSIDNJi1Fj+s/GkHF3TD1FTwBwf29SwebXDVOiz6V9X4TzkgX9Z33/7enTW4xvv+p8e7CTOU6IDt8/yQbEsOqc/xjqD3NduNlj21pV/0lGCXVQqlXwjzXIDXpBEtiV90HJOZZ1bBbR5ls9+G+1uSelTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6wwCcNtglv5CfqVbZGYPy7ow91jgoQhHSr4UFQDHHM=;
 b=R4mCYu8akV14HtUbH/YTpe6eJoczic1UyEZUI8RyuIMJaXIyMCXi/YTDnZxtqDPm2zNmC97/KRXHXo6Wy0zzkO3/hpzpiETkMi5C4ACpcQw16u0zRy+J9coxDywwRyGnQDdxVQOCft+rOSrBIQI0zyBnEvmbo4/Fbo9w+CT7SrM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11666.jpnprd01.prod.outlook.com (2603:1096:604:244::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 09:18:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 09:18:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] Input: exc3000 - Simplify probe()
Thread-Topic: [PATCH] Input: exc3000 - Simplify probe()
Thread-Index: AQHZuBLYUZVM5UKFGUyub4sZqhZ55q+9rbKAgAAAfSA=
Date:   Mon, 17 Jul 2023 09:18:18 +0000
Message-ID: <OS0PR01MB5922549913878331560B0974863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230716182455.216335-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUSxVxuiwtbHR8OP35Hjsq34=FPfjBccVVoYQUzO6FK9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUSxVxuiwtbHR8OP35Hjsq34=FPfjBccVVoYQUzO6FK9Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11666:EE_
x-ms-office365-filtering-correlation-id: cb949425-883b-4359-f7ac-08db86a6c27e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nPAhu0rHE/uuHg9pfRJHND3AWrFJWuXkCfWTAS4slUU9lT52b3lFFr5Wx+CoQ6kkG9cmM3N6nEjNI5nqtHbXqB2jKp3uHdLaiVxdGIrl9jQcmNsoie9yqKdzeiMJ84acSdPQmkXDjXWop0H6lAatAdnPU/ZC2AB1xXN6gZFcE7jIIDvyIh5hLw8PN/yO8qGYQH43v7veSFC57EIgUo+A529u+6V7nqBOjva3dmB5rLpbJJXQ7gxLQo7Xtz/HdLPftfygnqOGbgT+5NTCw0EsY6c7GrRpU3/l1Pn6EVeMuJaq7+7fPIeSZKGfFNNWQBOwtXvJ9R3SoyMO2h1ycvJCj6q530C/yO9nE0AJ5fs9oMzI3M3lHpomUtV6v9Ghu4dnwX3rCC7OzKuiGQx3SJDN0Mf2SH3zM2bm84uyf0Z3btY6Tql9IJHSch1uXHrpMFPPtAKPccmyitBNrXiO2W0lm7Em9a8bPIsJjZrdH+0wA3fYNEJoFm1sg1I2NiNxk3dHIxl3K7lqpduSjO5GlVqeLrS1Ybavth/W9R6cj4elfw6GoEWa1pYfqxrWGqbt+iMm1JEJx0vaz+yD1un0Nt2VxK7di2EDliokfoSF6+8C/+EwTW2GMs6eYNtdXYkeuhnK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(7696005)(6506007)(26005)(9686003)(53546011)(122000001)(83380400001)(38070700005)(86362001)(33656002)(38100700002)(186003)(55016003)(8936002)(8676002)(2906002)(41300700001)(478600001)(5660300002)(52536014)(4326008)(76116006)(6916009)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(54906003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmJPeW8xamFGYmsrRTF2d3BoM3Q0VjRaMkJRNnZpUHJvOXJpZG9sZUt1aUNG?=
 =?utf-8?B?cXJTNXozc2taRFhDZ1orQ0tmQkx6cjl4SnhDOHFZQi9IU0ZXVllYMkU3THZU?=
 =?utf-8?B?c3Y5aFpmaVJxNE9Yd2huRm12a3RsR21yWEF0UTZucFpCM2hJQWpOTFN3RnBu?=
 =?utf-8?B?MG40RXJVd0YxUnlveE03L0FNRTNpd09OZW1HYTR3dWFKRHJONjd0S0NuODh6?=
 =?utf-8?B?c1NMNmw4WXFKdHhVeGtNU3NFeTNxTENuUEdQNzJCWEhHbGZlZTBUNGpwZmdN?=
 =?utf-8?B?aWNsWlh5SmpDQVFQMzhJQm8ra2tVc2R3by8yVHpxZ1NKUXRqREIzWUdPMlll?=
 =?utf-8?B?dzB5QW1pTlZqZU44cUxTbU1UWUFJWXhWOXRFSDdZdUlOZkhUanVueno4YS8y?=
 =?utf-8?B?d09KczZIOS9lRzVnWWdDUUVtK3pCNVVmM0tDbXVWMlhjRitjS0NPYlZ6VnRS?=
 =?utf-8?B?RzM4TjlTZTdQRUppQmRQZWVuQW1UaGEwQjlISE13eCtMUm5KeUdKQytuM3pa?=
 =?utf-8?B?ZXZmQ1JqMXJjMFpXckZWdjU0TVJvclpMRmxwWkFDUVIzOE1Sc3c5Yld4UUMv?=
 =?utf-8?B?Yk1pRkRNdmIrZW9oUFdKREU2RTYyQ3lzckE5Y2JldVdtdzR4MXhWbVp0RlN5?=
 =?utf-8?B?WjQ4MFNJdFBqcTByOWllQXZ5RHhHZUh0aVZZZGkxQXBVNXhuUE1hOTlTTGl4?=
 =?utf-8?B?NkprQjVFSUxzQnhxZzR6S0VWaEVUejZFL1NGUUhZamNzQVB0T0tzbThud0Yw?=
 =?utf-8?B?MjZPYlc4VmJwNGpBNXlwdHJQcUwra0tTMjBzc3VOOVd5KzMwVjR5ZVlPWnZz?=
 =?utf-8?B?MmxOVHNycHRxSURHa3NSaWlhdEs1OGIyZnRwaHY0M3UydnNHQ1dHVDNXQ1c5?=
 =?utf-8?B?bnNNelVhNzlXaVc1QzRCQXpWYndiZUh2U1VOWWh4TVZmNWJzaDIyZ0Rka0VB?=
 =?utf-8?B?cUxhckhXbkFhWC9raUtrZHJJUU5pZ2NNeTF4NW42YWR0a0ZOcjZld3dWS0hk?=
 =?utf-8?B?Q0sxenFTZlYyS0NpWTF4TjlLVHFvVWFWcmdpMHBrREV1UU5pQzNXeS9Fek5m?=
 =?utf-8?B?R1R1Vy9hTXg1Z1lpdW4rQXk3Ui9DTndKUmk2eklzWkNnTjkxeUVQTU00S0xI?=
 =?utf-8?B?VGplQjF1Q2NrVFNKenliVGtqbXRvQ01oRllWakZFMFRSVFY0ZkdnMW1Ca2hw?=
 =?utf-8?B?em1QK091RzR3TVVNazJOV0pRT0xPdURzTEt1QTRCa1VkWTEyNm5mWUtmQzIy?=
 =?utf-8?B?UlkzdldxZllTZXQ2dGNoeHdaSjNlMDhLZlljZVhLTmg4cDZDSVVBdG9vSWRr?=
 =?utf-8?B?RzM2bHFqSm83eUs1N0ZJc1hhb0h2cnU1blRuWUVLSW5hWXZXV0RzVWgyZ2Qz?=
 =?utf-8?B?SnRTQ3hReHpRdFVCNzNRcjlQVzg5bzlBbDk4N3JOcW1FbE52aEhIYTZiZTR2?=
 =?utf-8?B?bDk0Wks3VityWnJxcUhGK2NBcVFKZ3ZSUnlVU2xQRU5zV2xTZzFYWHVzdFpo?=
 =?utf-8?B?aGNMRVcwaDlva24yRWt1dUxVc3pSZVh0a2Y5eTJGejJyQVZhcHNoTGtWaFYr?=
 =?utf-8?B?ZTBYZWE3RDR2TVU2WlA3SnE2RVIvM0h2STJoUDQ4eWtxcG4wNjQwSTh5bWdG?=
 =?utf-8?B?aERhRnNjeElDR3dUOU52UzRyckZwa24wM1R5L2FLbkNXQU5FeFp2RWwrV1Z6?=
 =?utf-8?B?bnd2WU1qb1NHZW8xcW1NUG5CK3JYaTlGaUxtZzVjY1dldGlObTRCY0YzY25o?=
 =?utf-8?B?UlhFWDkvZnl3bzZ3Uy9HZmJBcGd2Vmk1ZVk5dEVRN080c0JIT3hYOFdTRS92?=
 =?utf-8?B?NUVwdTdrZWJBT051M3BVb0tiNW9SVkZMc0pBT3lQNE9reEw1anZtQkRaWjdU?=
 =?utf-8?B?TmtFdGRWanlDcFNtclZtaXFqeGdkcE4vbDZsRFhIUStCbnJvMWdPWHNvbmVB?=
 =?utf-8?B?VXpkV0M4RklvUmxkYWdnSHRLTzNqSXBlR2hBZTlGandqckxyTkphRWFKWHNO?=
 =?utf-8?B?Y2pvUTBYTXh4WXcwN2lxS0dFYWp2QWw1V3ZWeVlUcGVCVTR1UjlEQUFCdlQz?=
 =?utf-8?B?VDB1M3d1eGIyRjZUalorTWRpREh5ekhvZVBYMFU0UnI5NVhlanNWSWtHbXJM?=
 =?utf-8?B?Y0ZnaHJTMU1WcjMrOTc1b0l4S3JMcmN2MEVQV1krVDBhV0ZSaTI4RWxETXZW?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb949425-883b-4359-f7ac-08db86a6c27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 09:18:18.8835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: il51KadV15tRLlrA0URwYDJamX7U5LxDwUWw8klneqhiwLVToWFW2ctOnTOcJN9mD4sweZqNUwR0f+ked5sLtf/TET9SaGXlPBgfvZczoJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11666
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTcsIDIwMjMgMTA6MTMgQU0NCj4gVG86
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IERtaXRyeSBUb3Jv
a2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47IEFuZHJlYXMgSGVsYmVjaCBLbGVpc3QN
Cj4gPGFuZHJlYXNrbGVpc3RAZ21haWwuY29tPjsgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LQ0KPiBrb2VuaWdAcGVuZ3V0cm9uaXguZGU+OyBNaWtlIExvb2lqbWFucyA8bWlrZS5sb29pam1h
bnNAdG9waWMubmw+OyBsaW51eC0NCj4gaW5wdXRAdmdlci5rZXJuZWwub3JnOyBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsNCj4gUHJhYmhha2FyIE1haGFkZXYg
TGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+OyBsaW51eC0NCj4g
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIElucHV0
OiBleGMzMDAwIC0gU2ltcGxpZnkgcHJvYmUoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFN1
biwgSnVsIDE2LCAyMDIzIGF0IDg6MjXigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBleGMzMDAwX2lkLmRyaXZlcl9kYXRhIGNvdWxk
IHN0b3JlIGEgcG9pbnRlciB0byB0aGUgaW5mbywgbGlrZSBmb3INCj4gPiBBQ1BJL0RULWJhc2Vk
IG1hdGNoaW5nLCBtYWtpbmcgSTJDLCBBQ1BJIGFuZCBEVC1iYXNlZCBtYXRjaGluZyBtb3JlDQo+
ID4gc2ltaWxhci4NCj4gPg0KPiA+IEFmdGVyIHRoYXQsIHdlIGNhbiBzaW1wbGlmeSB0aGUgcHJv
YmUoKSBieSByZXBsYWNpbmcgb2ZfZGV2aWNlX2dldF8NCj4gPiBtYXRjaF9kYXRhKCkgYW5kIGky
Y19tYXRjaF9pZCgpIGJ5IGkyY19nZXRfbWF0Y2hfZGF0YSgpIGFzIHdlIGhhdmUNCj4gPiBzaW1p
bGFyIEkyQywgQUNQSSBhbmQgRFQtYmFzZWQgbWF0Y2hpbmcgdGFibGUuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEEgc3VnZ2VzdGlvbiBmb3IgaW1w
cm92ZW1lbnQgKHdoaWNoIGNhbiBiZSBhIHNlcGFyYXRlIHBhdGNoLCBhcyBpdCB3b3VsZA0KPiB0
b3VjaCBleGMzMDAwX29mX21hdGNoW10pIGJlbG93Lg0KDQpPSy4gZXhjMzAwMF9hY3BpX21hdGNo
W10gYXMgd2VsbC4NCg0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pbnB1dC90b3VjaHNjcmVl
bi9leGMzMDAwLmMgfCAxOCArKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9leGMzMDAwLmMNCj4gPiBiL2RyaXZlcnMvaW5wdXQv
dG91Y2hzY3JlZW4vZXhjMzAwMC5jDQo+ID4gaW5kZXggNGMwZDk5YWFlOWUwLi44YjY1YjRlMmFh
NTAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9leGMzMDAwLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2V4YzMwMDAuYw0KPiA+IEBAIC00
NDUsOSArNDQxLDkgQEAgc3RhdGljIGludCBleGMzMDAwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
DQo+ID4gKmNsaWVudCkgIH0NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZp
Y2VfaWQgZXhjMzAwMF9pZFtdID0gew0KPiA+IC0gICAgICAgeyAiZXhjMzAwMCIsIEVFVElfRVhD
MzAwMCB9LA0KPiA+IC0gICAgICAgeyAiZXhjODBoNjAiLCBFRVRJX0VYQzgwSDYwIH0sDQo+ID4g
LSAgICAgICB7ICJleGM4MGg4NCIsIEVFVElfRVhDODBIODQgfSwNCj4gPiArICAgICAgIHsgImV4
YzMwMDAiLCAuZHJpdmVyX2RhdGEgPQ0KPiAoa2VybmVsX3Vsb25nX3QpJmV4YzMwMDBfaW5mb1tF
RVRJX0VYQzMwMDBdIH0sDQo+ID4gKyAgICAgICB7ICJleGM4MGg2MCIsIC5kcml2ZXJfZGF0YSA9
DQo+IChrZXJuZWxfdWxvbmdfdCkmZXhjMzAwMF9pbmZvW0VFVElfRVhDODBINjBdIH0sDQo+ID4g
KyAgICAgICB7ICJleGM4MGg4NCIsIC5kcml2ZXJfZGF0YSA9DQo+ID4gKyAoa2VybmVsX3Vsb25n
X3QpJmV4YzMwMDBfaW5mb1tFRVRJX0VYQzgwSDg0XSB9LA0KPiANCj4gQXMgYWZ0ZXIgdGhpcyB0
aGUgZWV0aV9kZXZfaWQgdmFsdWVzIGFyZSB1c2VkIG9ubHkgZm9yIGhhcmRjb2RlZA0KPiBpbmRl
eGluZyBpbnNpZGUgdGhlIGV4YzMwMDBfaW5mbyBhcnJheSwgeW91IGNhbiBnZXQgcmlkIG9mIHRo
ZW0gYnkNCj4gc3BsaXR0aW5nIHRoZSBhcnJheSBpbiBpbmRpdmlkdWFsIHZhcmlhYmxlcywgc2hv
cnRlbmluZyB0aGUgbGluZXMgYWJvdmUNCj4gKGFuZCBpbiBleGMzMDAwX29mX21hdGNoW10gYmVs
b3cpIGluIHRoZSBwcm9jZXNzLg0KDQpPSywgd2lsbCBzZW5kIGEgc2VwYXJhdGUgcGF0Y2ggZm9y
IHNwbGl0dGluZyB0aGUgYXJyYXkgaW4gaW5kaXZpZHVhbCB2YXJpYWJsZXMgZm9yIGFsbCBtYXRj
aCB0YWJsZXMgKE9GL0FDUEkvSTJDKQ0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gICAgICAg
ICB7IH0NCj4gPiAgfTsNCj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIGV4YzMwMDBfaWQp
Ow0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IElu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
