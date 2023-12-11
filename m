Return-Path: <linux-input+bounces-692-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE180DA93
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 20:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 333C11F218F2
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 19:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2668C524B2;
	Mon, 11 Dec 2023 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ANeND40H"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C65EB4;
	Mon, 11 Dec 2023 11:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDnXNCAw+Jwyke39C0XfYgenca6JFNabGFWcDvhDolkM3KpiS1CrUZZoBAQ0+QoKDFas0k1cDTrFWUTj+c5vh7eN9kh6hHXHGqT5lQqsatHnNVxXLEOnF8KRX/uqCJoVBiosnOQjNi5HOdsCq/EhhPwqMLps3b3rncqHnBQM6qOj2hmlXynumve8SAAYaNDIttAHkHU9Q48Lc+C/yG0itOb1Cbw4M5OGe1vxMkAx8bDDhIOar97/t+VvdT/waPz5cctyro9RNVg5x0S0X4COXkLCNWOsxQd1jFAgHe3GZqcQuZ63ypMNezZ5cSGWM14NVmpul1PI6zLs9Fcy2wybzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Pgw9ORULjKsywgw109oECmeLHpetcyve/DVcQlPRws=;
 b=UIG1teDb4X9sqj5QmLfFIP9Oh6jNK1NI0rbF7OTtky7Nj9TS0uLOh0yf+d4jHtTRyLNfadDUL2O9/LJT32yB2gZUrj3ASG/BuQ0i/Zy6REjoIgVUfdaUmS3qsOIVoRxSKUFcKes/5bw872xSpBvIs+tJezhLdxHuAjm1E32+ZlRpDwgqCiuo0TD2gcR5xVypER/3rV9upUvvikSd0rDYhE7OtrBSLpKx6U+97LrZqBqveiFHIzahKTO0JTr+/hay2NFI8r2Ecmr2zgrfrNrxg/rKEMEwrZxTMkmVADjIJRPmZx76sz/cJkegGsQoEOEI2JcMfVuicSp1jDzz4FMtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Pgw9ORULjKsywgw109oECmeLHpetcyve/DVcQlPRws=;
 b=ANeND40Ht1M03oShooFgXxc9n9qR26BVIUTne4F5PdqdoInOwiQKvwJuOAvAXsuqgO4xURMN/lzxRPnoH/oKpX+qIz64kB0UOmthTmx0IR8quzaeZPCpvMEoK7b5uvld7fv8MT9B3Nt474w9VB+JZIsqR8fhhdpfZnuSz409Fak=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS7PR01MB11742.jpnprd01.prod.outlook.com
 (2603:1096:604:239::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.25; Mon, 11 Dec
 2023 19:07:13 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 19:07:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
Thread-Topic: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
Thread-Index: AQHaLFMbdcpDY7K7Gkyzrof7UGihELCkcU0AgAAAYOA=
Date: Mon, 11 Dec 2023 19:07:13 +0000
Message-ID:
 <TYCPR01MB11269A170999252DD59B2B27F868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
 <20231211165708.161808-3-biju.das.jz@bp.renesas.com>
 <71cb51b3-7145-cf03-9291-5ff8acdaa05e@omp.ru>
In-Reply-To: <71cb51b3-7145-cf03-9291-5ff8acdaa05e@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS7PR01MB11742:EE_
x-ms-office365-filtering-correlation-id: 062c315e-09da-4eee-c3b5-08dbfa7c6256
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nc0dpNWnSlc+6FQk7/0sh+0N1yYmbEJp2V1tPG5YVQWVSkIUrozhaV6nhUw/9K0IGANP5U/ousDFDXPlqx25Ol5v7+Y2qIWIe7AyOT7SDGxcAh2o1Sfsn3fkWFg6S1y0uQc7LMBZyN5lSa+TGwbEAv7P065LsW6/Ocs9kkY6iu7y3teHP28Iqbhg9nOvsk5PW2/FN44ryjZnJ3tXcKP4wSbO1ejmwZAQpTCsLbWH4/vj7Hj6NdZwNImkuIoZH/iGA6BTPxpMQsBT4Tr7PZVRg/kiIb8m29N3bhR+v7wqqvc4wUZByeStAoLO5IuXtbIAowmKPrxYIDmlWSI4dThx6gOeQPmLK9pUvHA8rQNBMDuSpvLjvRLsZptu9ZFfgj5aLQQ9JB6WAzJTpn79nD+OqSVhyuycioKawZcXwOYy65Jbcb4BwxSG1F7/kxqn63+TrZ5K4nurcfCILEaUaF/O6MyIJf3a/bxDQLLgKKzUhN3Ytm3bCOnuOU+zCdZe04viSL8z2vA5fodvcjx8l1d46or20EKYnCKGrkNG5u4TTFH6/G3WcusCrfsuJxSgQaX/LSSHAeVEAdWXGksD0SL4/EpDb00dmvwplqG5nfMCdt+ozk9uJ72pzQnz8jfeu/EP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(26005)(122000001)(38100700002)(33656002)(86362001)(38070700009)(83380400001)(52536014)(5660300002)(9686003)(6506007)(53546011)(7696005)(71200400001)(8936002)(8676002)(110136005)(76116006)(66946007)(66556008)(66476007)(316002)(66446008)(54906003)(2906002)(64756008)(4744005)(41300700001)(4326008)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXBOc3dyMURDdnp5V3Rpd3JrSDlTU2wxK2RKVGdEWk03RjRSS1JqVEpkeUhL?=
 =?utf-8?B?YjM2QmdLaU9BaVV1QUZOSkJRUlpHVTEwZHZFN3hVOHczdGg4YVVrYmpGamI5?=
 =?utf-8?B?Q3ZwSnF5OFdENlVmSzNENjN3Z3Vja1YwTzV1alljUnh6QXV0Y2haOEJJMHVa?=
 =?utf-8?B?ck9iOGNSdXhJMkhLdHlPL3lNMDJ4Vm1DbUhFRG9yYzBkWmVxUFR0RjVIRk9r?=
 =?utf-8?B?R2Z6bHcxcmdab09FMTMvYzJLY2lBeEwxRjhDaktnN0RHdjJVS0lCdWRzaHI2?=
 =?utf-8?B?RFFGbjVxcXRhaDFRbG1PMmJSQWNEbmRiY0JTWE5nU1h2TnB2bklURWZKYUJz?=
 =?utf-8?B?b3IrWm1FTkFVUks4UmdId1AxTDhuTTFEbzNwbWFvRFU0M0dUbk00R3RoUDRY?=
 =?utf-8?B?bTlpTUtXdTBlck1ubFZ5bHdkdzBYVGhHU2R4aFIzYVpXUjBPQ2lWWGp6ellz?=
 =?utf-8?B?bXYrK2phSzVWdm0vdm1STyt5cnZmV3lSSnV4S2t4aWJ0emZBUmRrT0tMOXVi?=
 =?utf-8?B?em5OSm1ZMy9TQjZXWlJYVGFrSmx4ZmFZczRZT016UmtVOUMvalAveUhtbDh5?=
 =?utf-8?B?bTFKaUdxMGkwd2prNHFhY1RxNnppc3NvZVJDTjlzNjZRMGwzaTJ1QXpVRW5I?=
 =?utf-8?B?b3k4azVaZ0hsQzE5NnZlYWpIMjQ3d0tYUy9sRk9GRU5XdjhBUXBkTUlYREVN?=
 =?utf-8?B?azlnYUhTZEowWVkzL2paY1FRaFh0eGFYWXRHdlVRSElRbkdQazdtQUlnQzRX?=
 =?utf-8?B?MytKZnM3NklYcEQ0WFBxOW80MFFzSlBPc2VJK253WVNteDJDM3F1N1c4Yi8v?=
 =?utf-8?B?UGhscVE2Njgzb0xwcUgwdWVLeUNkSUp0ckprVzNMRll5eVdrTFEvMnJXaHZT?=
 =?utf-8?B?UjZtZ2Z1akdNZjNrZk12LzJ0clprYVZzUDRUYW1SMU5sTFNuQWNyOHBGV1dV?=
 =?utf-8?B?Zm1XYUU4MzhHTlNHY1ljTS9HcGVIM09YRmIzTTQ0aWlHcVEveVJjdVhWakVH?=
 =?utf-8?B?VWlySHM2Q01ZUE5OT3FnRWpTSUg5c0RjbzZkUkVQODJFaFVFOTROa2dHTHN2?=
 =?utf-8?B?QTJ6clZ6RHJkK1lXa0Q5OXVyT2krdWdRRWMxdG5QZnVMajhldEttejQ5VFJ0?=
 =?utf-8?B?UW93aFc4RXZsZEdRM1RDQmtIMmp0U0VYemMzcGFJVFNPNE5JaGo4UGpmc0pq?=
 =?utf-8?B?L2VOMG8rZmJjcHM3dzN4WG9EcXhxa0tvTGtYT3hsUEMrRCtVVlJZbWErY2Zk?=
 =?utf-8?B?TlFYWGJyREczbExiUEx6K1ZTTzBhR1JkT1JtOWFLczgzdE1aWVFTUjFaeG96?=
 =?utf-8?B?TWYwaFd6SHVCWGtzZmVrbFNINHpsWXVObm1NUk1ralB4ei9RZGRQUW1qOW84?=
 =?utf-8?B?ZXhjVXhNc2lKNmpQYmpYR1p3UVB1d3g0U2FJcjZSMm1TcW1jdnplbkdBaGR4?=
 =?utf-8?B?d1lTbXJqWHhBRXl4SUpjbTY0eCt6NXdNUjVBNEdqNU1YN3Z6MjkrRStzQmkw?=
 =?utf-8?B?dGxYUEg0WUJGQ2U0UEJyVG5paW8xK3ZLN1dLaFJ5dGM1MUNrUUVoMXNFM0xB?=
 =?utf-8?B?cXhvc01VUzdWVlR0QUU1NElUcUdlNkQyMDMrR1J3NmZhY2wveVh1Q3ZNMm1v?=
 =?utf-8?B?YWR0QWNWSXl4NEo2U1QrN3Q3d0hmSmZ1NUdDbjRlRkE5SDlRRFM5emxXUm5U?=
 =?utf-8?B?SU5hN0FERjZGc0pRNm03ajNCV3VUaFlWT1Era0ZKd1hHLzY2STdjYk5mQysw?=
 =?utf-8?B?aWJUNGF2LzhjcG5Za1hUMUdwY1dVdUhCbmlUZDdoM25Ib3N6S3dXK2VMWXNW?=
 =?utf-8?B?WUhpRHZWOGRzNkdrTEVNUlhoM0xac2ZZZXFxQWFUTG9NcXRFVytVa2hjUElp?=
 =?utf-8?B?VkxOTy92VEM0SGNoRFFaTHFjZ0hTckx0eVNITjF1emhBMU5uNlFtdC9NWUY2?=
 =?utf-8?B?VlV5UG5RUXp1QUtzenlSM3ZPRjAwUnJPYkNtWmMzWWdLUlFSbThaOXVsUXR2?=
 =?utf-8?B?N2JjUThBLytzaVJQaGRtQXBSRVd2YWZTWFNub2NDWFhBMW9HeEJDU25DZzVX?=
 =?utf-8?B?TUdEM3RnSEREVkNzL29nZXdsYmtvVVEwVXUrUWFtZnRIYnpFUHY4MDlnUlI4?=
 =?utf-8?B?a3ZWYVZIZGNyMTRZWFhKZTlManVqNUgzenVTY2dBRFV4a055U1N3MmI3VVQr?=
 =?utf-8?B?bEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 062c315e-09da-4eee-c3b5-08dbfa7c6256
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 19:07:13.5475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q6PM59jVZBlwo5KJxrr9Q08zoIcBNqc3iSkce52gih+O8H4LZ/4ZDjSqdb2CNCph4ab+idk/kSCEPZS6y7KmG6gQwO1vjyFLqNRaYDEyD8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11742

SGkgU2VyZ2V5IFNodHlseW92LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1Pg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDExLCAyMDIzIDc6MDUgUE0NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIElucHV0OiBkYTkwNjMgLSBVc2UgZGV2X2Vycl9wcm9i
ZSgpDQo+IA0KPiBPbiAxMi8xMS8yMyA3OjU3IFBNLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4g
UmVwbGFjZSBkZXZfZXJyKCktPmRldl9lcnJfcHJvYmUoKSB0byBzaW1waWxmeSBwcm9iZSgpLg0K
PiANCj4gICBTaW1wbGlmeS4gOi0pDQoNCk9LIHdpbGwgZml4IGl0IGluIHYyLg0KDQpDaGVlcnMs
DQpCaWp1DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gWy4uLl0NCj4gDQo+IE1CUiwgU2VyZ2V5DQo=

