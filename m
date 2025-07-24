Return-Path: <linux-input+bounces-13679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E668B0FF30
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 05:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168E84E21C8
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 03:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B9C1DF99C;
	Thu, 24 Jul 2025 03:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="HyRjOH/E"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2113.outbound.protection.outlook.com [40.107.102.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CDA1DED5F;
	Thu, 24 Jul 2025 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753328309; cv=fail; b=I0xu3XZ7R1ONg/xufhSm0WSYWjMZJyZIEe3UR7ZTS662kqHYDaSZYOYEbdoywBVWMPwTDjOgbT9KxUUdVh0c/n0Qir5wLUqOSlweZ+rIICgedH3nXHVVhT4zizgQzgfGFN/rvCvRVgf3k+mNbYXjoXWTTKSIzSfyzI5t7GwafQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753328309; c=relaxed/simple;
	bh=ctVq9G5g0KMC6+ZUVczETH8EVI1EFQbxIPQXKfaJ+9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DqitkPPcCmEQTbHqvKPCmwuShmipSMei30S35es3PKWtogYwjcjh9LqOEUwhJwtxiXxh8GeurcGb2fZBoUE9LaSz8h3P9JRfGY33oe8B48gU/HNIGAFTcMGiKfKigg/fVKQRLCOTzjsJLXKG0Hkh5H5qHGUvWP90CG8tEL0t+jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=HyRjOH/E; arc=fail smtp.client-ip=40.107.102.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waYhegAsQ35joJ66cAGOnl5aYV64IvZs7MuYZKCyFhxGQaxMbAyh+U3bKeLm0aZUy6qiPDY5q1gXPRl3+41EM2ZKRHS8we1zEsLm3bEsUa2lhgUyrt7Wytcaw89QXqLoY4O/mDIxdztjgYeO+IxUGEP0z5w1kr5Xk4gV4x8z3O5YQb9zbSBmna1Hew/84kTMkVZPvIO5hRXNYfw8Ilqc5s6RVd9zOw3lM/hiYAecODcWmEN3w99tRAYZ76cOByIGoQra9FZSEkbp0BgxO9CHrXkrVmtKo8/KUFTeUcBUX0qhG+mLIt0BDCZypCxJcPqRfQxXbW6S7L47qhE3Fkl4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+xT98hQYAb32eB/lP5tQitHA7Q/UI6yzeopY9kZkqw=;
 b=F2wlhP8pqPGTQ4u07428M8z6W/eIQNSuY1ObKK89bvr/57EbZayu+4c9CJsZfI6/FwsGc9CsUtIY+oLRDaYsn2xSaAkWAT5XsFY9mFUt8EHRRktm9hrDFzlqCuOhWXiSpOw4DjBEIB06uBB0I6txTsWbjWnlAP18AfMdL9OSRDY4X84z/583FBfdhvYteZadLAf5H/Ie6/ObOl04o+3tkkm3Jn7Hv/rxc6R5jOFUSVPAzIgp7wRhWuerq986p3+O8mltpf2COchO2sWX5icsxxdF7T/pB5fOekfVHxRJklotyq/It4Cz5g7ylt4tUAnOqTesOTIiVNF3xMgDj22OuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+xT98hQYAb32eB/lP5tQitHA7Q/UI6yzeopY9kZkqw=;
 b=HyRjOH/EnQR0mud8dyVFH+j2OIFQIRzI5EvYM/5Q8wFI2A+WVKDzlazuhd947t+q4liMJBmNFKSvebwV7h6g9S8d4ixBrpWraTgo0IeHPtEKw46X83XrQ5Mqu+ct8sAhfFW9v9dLuET8L5Ai/rjPVHD7NscBiZv6LEl2jXYH42I=
Received: from MW4PR03MB6651.namprd03.prod.outlook.com (2603:10b6:303:12e::17)
 by PH0PR03MB6218.namprd03.prod.outlook.com (2603:10b6:510:d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 03:38:24 +0000
Received: from MW4PR03MB6651.namprd03.prod.outlook.com
 ([fe80::593f:d937:950:4a0d]) by MW4PR03MB6651.namprd03.prod.outlook.com
 ([fe80::593f:d937:950:4a0d%6]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 03:38:24 +0000
From: Marge Yang <Marge.Yang@tw.synaptics.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marge Yang
	<Marge.Yang@tw.synaptics.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Chiu
	<David.Chiu@tw.synaptics.com>, Derek Cheng <derek.cheng@tw.synaptics.com>,
	Sam Tsai <Sam.Tsai@synaptics.com>, Vincent Huang
	<Vincent.huang@tw.synaptics.com>
Subject: RE: [PATCH V2] Input: synaptics-rmi4- Add a new feature for Forcepad.
Thread-Topic: [PATCH V2] Input: synaptics-rmi4- Add a new feature for
 Forcepad.
Thread-Index: AQHb9gLgBDZ3KBSHeEOcWz30uUN1G7Q/8ioAgACwR9A=
Date: Thu, 24 Jul 2025 03:38:24 +0000
Message-ID:
 <MW4PR03MB66518CD2DE0AAD98B1A9366FA35EA@MW4PR03MB6651.namprd03.prod.outlook.com>
References: <20250716033648.1785509-1-marge.yang@tw.synaptics.com>
 <6sjnlz2zcstrsjgh5qxfmswlvwyjm5wiyz4wtlndprskw2aocr@icqoimso45wd>
In-Reply-To: <6sjnlz2zcstrsjgh5qxfmswlvwyjm5wiyz4wtlndprskw2aocr@icqoimso45wd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tw.synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR03MB6651:EE_|PH0PR03MB6218:EE_
x-ms-office365-filtering-correlation-id: 509b2137-bfbe-4783-d3b8-08ddca638b22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1H0UI3oJLn6UBKJ0Jgz7AmJVf6x8lwdf0To3Juw4QJDe6APg2Ja3KyDxtWcK?=
 =?us-ascii?Q?r+KUJtJGM6edxNBrXh3yliHOxeoy8l46pHXLWkEnWoKoEEtQkd/6qNvShQK5?=
 =?us-ascii?Q?KffmX2659656pTgBZ5Ue0D/0CNuWztWlvjeX523Yb50ykG+GdXhYrhliJ0gd?=
 =?us-ascii?Q?/MG+PBX9v2rnaeHxJHggFjrkyb1EEwzn+snC+X1vOIbWMXNUhoLVsdAG1H7n?=
 =?us-ascii?Q?y2FhXfBLFNF0lWnkx1GOFDp98UZxGlWJKD5VcEdk4yxPE8rqd6Eq/J3SA5v6?=
 =?us-ascii?Q?NxUVHL8Cs6vKqcVrGy5AE1+OqRsEBONCYU25cQhFn5OR/g2O//kQ1/5kmEbz?=
 =?us-ascii?Q?oRBq29kqjpuBh2NVv22oJv0xe2H7upYuuvw043fjvFRFOtT5ACQSDeSburye?=
 =?us-ascii?Q?Yf09GvPN7T1Q1okbPwedD5KCE+7qGoU1Al5MdmTPX43G6Z9pc5IT85ZcdBwX?=
 =?us-ascii?Q?8Y2/Mf5z4oX7bybPkGHVRx1GRbS9nV+yL5Lj+r2lZf9R/gWnkaPBGmXUg0tN?=
 =?us-ascii?Q?yjWbyHNsE4X2V0g6cfYASxT4grBd3bO0+vFA3wxse/3CjgaV3ezg3gmixHtw?=
 =?us-ascii?Q?tOa1bVag81+geTdpGm/EM2q7izn8hODNUfvTKrcRF9IJEt+9ObyYrs1W/m1D?=
 =?us-ascii?Q?I8/X8jgdRjXVopHBzussUTJOch386wqRVI00ooMBGey485IqwIuKHYPpUret?=
 =?us-ascii?Q?EjQjNeuaUdIR6I60kNBcFKgqtM1u8xZsrN4kk0PTGlDXMFOLTMrGML05xboV?=
 =?us-ascii?Q?kRDjgmoQjcugVGNhvTJF/l/ozY0Ng2wkLZgRUh9Fk2EI0G0lyvgZmF5VVMP6?=
 =?us-ascii?Q?MRfZzGvtPbVEus//SlROUi4Lw1OVAB3TdM9n6VJ20jY619NSyTGO3cHOOK3C?=
 =?us-ascii?Q?QCbMEzSQ8bpJ2ElKEi7Nm2NQnVqWlaAipxu8MbdckAvrrcZR2W/r68oDt7d2?=
 =?us-ascii?Q?kJtyagFUplvh0jM3Ynd0/8Q5NyrRdCW7LdJpMx2aeiQPMS8+cXHxMH3hadXj?=
 =?us-ascii?Q?+pKifmmCnqUHY4GZ9IGZteo1ZlCvVJTgHSJrtuxXMb55DfxdC4k1FGaBeOU5?=
 =?us-ascii?Q?IPI9792U+GLnZjuPRV0mbFCIkJjD3Od6+POgN2/coyXHgTTvLCzS+8l+YVyu?=
 =?us-ascii?Q?BSPjNKAWlTAdTEZODA2B67vCGilptZ9jvWA9a8IeX77a7DMmQqELNSp2YA0k?=
 =?us-ascii?Q?Sv1PPTi5/Z/pcVqsJwrR2qmshnBpBPgAQITWhyxcGvyP/c0toU5NbM3Pbcxg?=
 =?us-ascii?Q?sVjxD9MlOiAjoaA8cCwgE3918jgd0GvGN+rsDTeGhK3JzXlonhSNypcL01uV?=
 =?us-ascii?Q?rGodGqvTwb2Rf8DEO7aKbHvzBfeVd51cZfWvdT6fcUY1KeOlZA/++6uqkzDD?=
 =?us-ascii?Q?TDQwbHiNQz5o1HrSDMT+ZvAEwQhTFieT8Qz7iBdvEB40g89z4DTzPDrdSHHn?=
 =?us-ascii?Q?y2+J4fmuUzjcnL923evHuCwSOETR6e2Od6XORDHSUAlDD6Vckeuksw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6651.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9LRjVRK1mmVUQos20Md0mMyyhgdxc8mYvM2DvJMcMj7EEY5iU2WibavR7K7M?=
 =?us-ascii?Q?YMLkuUEQiU+OWaMOGhVhvn/A93rfcNn8wXLRtCu5G5AEVzM9BZNntqKdFnGJ?=
 =?us-ascii?Q?9wdPkN4IzOSQyJnbDB40sv/pVDet06pnJjFi9SANCHnXG/3+WOWkVDxwyBNM?=
 =?us-ascii?Q?ndtPDLeZZCtfjxxpb/8ktrvy/4sYjZTdBh9iZ+zYK3jLPlr0ZsJlrQsrKgEm?=
 =?us-ascii?Q?qgClmtk02AkHMgUoeNvuSmH23Ic1I7QTNYWEEJSwEEz5qEDWVh8ET/jgPJND?=
 =?us-ascii?Q?+xaqZkV2Hi0yYPS2wKD2ejk5kypKX/xaz17Zu7HnCei3hFsyMSxkIOJSYWc9?=
 =?us-ascii?Q?pyqXuA00gJw3/AFu+e9tkLgNoQ7CYKwkt1CL7JJcG72UKA2ZEc/pfUMDYT9y?=
 =?us-ascii?Q?KdtDBVtNBRiMVXfaezHdDzsRxlWBFTNCdAlJRLvWUtfMTbvALUSa3E7i+N6c?=
 =?us-ascii?Q?7X1n1RvUYT2X3FQt/npZaU8LDIX3rYeO8f6OYlboWQT5f5T24wqTpmvaricn?=
 =?us-ascii?Q?L2hVw8ARqmVGvpvonIjmDDR9nW1cN0qX2Ym+lFicVoZd6Xt52Ov+IN/0EpHn?=
 =?us-ascii?Q?AVltghNzBPzeVFi1d7RjcIR1my/vZYuNAIM+EesnxW73l+gPlJ+Li8PAamFG?=
 =?us-ascii?Q?G0oGZwvyMuqdGtae2eKZcimylesB4X0KLoJzPxUIsn7H+DEBR3fsIb6jyrus?=
 =?us-ascii?Q?sbu/PZJ7PBrAbyZNYbKbvyen0tPJbBh+Uwy1K+nietaRUpCZJtFc35NfdE7G?=
 =?us-ascii?Q?olyIEF7qXsBFCn+EsUmxOScqgmrpW2hlPvwlone6CUjgrULMrp/hZ+FoXjDO?=
 =?us-ascii?Q?X8eQD4XYr7YIL2OHcEHAA96H7Iy2CjDVh9E4KtKaAa6RzQHC1HcRPTEdml6W?=
 =?us-ascii?Q?rUonSj4RNwbsaCQrTPhA6BLjjsswkdtmAl9lQrLlB5BHoRGo/2fjMdhz+b8/?=
 =?us-ascii?Q?TJsoYIfrshjLAUZ2/b989cTfunxRbTf1KYNBh7ffroIhIniSKniTolgVjvrO?=
 =?us-ascii?Q?pG83Mmoeg1v8Q2qjLnnWU9H1hHjKTx6p+gfbgB/g5y/Z46pKWoQnkJnKeye9?=
 =?us-ascii?Q?r7+UmFm0iWxXnfUiZZ1SQVud4UDB1AJMiFRiwTPl3erkMwTnDMjDEvTdel4D?=
 =?us-ascii?Q?4yBZBsuoaAzYLtuJq32Tv/HXm5rGNN10RuyPAU6naa++sHUZx6j7s6cmCqES?=
 =?us-ascii?Q?RiqGk8iabJnhhHH9Jf0uwdUY4PZcKpzyPo8A+7EQLnXeEioTGtBuvc0iUbWc?=
 =?us-ascii?Q?lZMvIBEl4KIIGbrKoXjiS+o1JBPXcyfwHgJAPqQSGjrfZnZmtM/WzlqaRQhQ?=
 =?us-ascii?Q?O0+Dou878EgmfUAAmyp/J1zEKa9rQe+D/leBn7mjNiiUFPax56soL2fjZfVG?=
 =?us-ascii?Q?CKZycKRzgdjzzYjuHBbrd8aLe0TWhG4rpLzpQ75quWADRomNzlAavBM9co89?=
 =?us-ascii?Q?r8AkqFTuLuA6uGP/MMN/bUcDyF2NdZ0/XlJ+8oMuoMhJw22JOCFbmu6AUyfE?=
 =?us-ascii?Q?rjcBnYn5MqNh3DmyO8QYkyZg5ksln2iGK6gbfNCZER+XQaMRUM9zlfE8FQtT?=
 =?us-ascii?Q?h5TgCAmYXabsVaG8ilZ8L73gThq7VqO3uNeCLM9R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6651.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509b2137-bfbe-4783-d3b8-08ddca638b22
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 03:38:24.0794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIjljU0GDt/hn/HYKaCvwZIGYq85SWGj6JRwlCMcyWvoXI94wOOGYXEd1oPankMQIAxy89wNJPA53WAL5PRBRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6218

Hi Dmitry,
	Update the status.

Thanks
Marge Yang

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Thursday, July 24, 2025 12:30 AM
To: Marge Yang <Marge.Yang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; David Chiu <=
David.Chiu@tw.synaptics.com>; Derek Cheng <derek.cheng@tw.synaptics.com>; S=
am Tsai <Sam.Tsai@synaptics.com>; Vincent Huang <Vincent.huang@tw.synaptics=
.com>
Subject: Re: [PATCH V2] Input: synaptics-rmi4- Add a new feature for Forcep=
ad.

CAUTION: Email originated externally, do not click links or open attachment=
s unless you recognize the sender and know the content is safe.


Hi Marge,

On Wed, Jul 16, 2025 at 03:36:48AM +0000, Marge Yang wrote:
> +     f21->sensor_count =3D fn->fd.query_base_addr & (BIT(0) | BIT(1) |=20
> + BIT(2) | BIT(3));

We could either use GENMASK or just 0x0f. BIT() is for individual bits.

[Marge 0724]
Thank you for the reminder. We will use this design going forward.
> +
> +     if (fn->fd.query_base_addr & BIT(5)) {
> +             if (fn->fd.query_base_addr & BIT(6))
> +                     f21->query15_offset =3D 2;
> +             else
> +                     f21->query15_offset =3D 1;
> +
> +             rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + f21->q=
uery15_offset,
> +                                     f21->data_regs, 1);
> +             f21->max_number_Of_finger =3D f21->data_regs[0] & 0x0F;
> +     } else {
> +             dev_info(&fn->dev, "f21_query15 doesn't support.\n");
> +             f21->query15_offset =3D 0;
> +             f21->max_number_Of_finger =3D 5;
> +     }
> +
> +     if (fn->fd.query_base_addr & BIT(6)) {

Just double-checking - should it be BIT(5) give that reading of number of f=
ingers is gated by BIT(5) in the block above.

[Marge 0724]=20
Using BIT (6) is more appropriate.
BIT6: Indicates whether the force-calibration version is supported.
The old firmware does not support this feature.
The new firmware can use this BIT to determine whether it's the new or old =
version.

BIT5: Indicates whether reading the maximum number of finger-pressure level=
s is supported.

> +             dev_info(&fn->dev, "Support new F21 feature.\n");
> +             /*Each finger uses one byte, and the button state uses one =
byte.*/
> +             f21->attn_data_size =3D f21->max_number_Of_finger + 1;
> +             f21->attn_data_index_for_button =3D f21->attn_data_size - 1=
;
> +             /*
> +              * Each sensor uses two bytes, the button state uses one by=
te,
> +              * and each finger uses two bytes.
> +              */
> +             f21->data_reg_size =3D f21->sensor_count * 2 + 1 +
> +                                                             f21->max_nu=
mber_Of_finger * 2;
> +             f21->data_reg_index_for_button =3D f21->sensor_count * 2;
> +     } else {
> +             dev_info(&fn->dev, "Support old F21 feature.\n");
> +             /*Each finger uses two bytes, and the button state uses one=
 byte.*/
> +             f21->attn_data_size =3D f21->sensor_count * 2 + 1;
> +             f21->attn_data_index_for_button =3D f21->attn_data_size - 1=
;
> +             /*Each finger uses two bytes, and the button state uses one=
 byte.*/
> +             f21->data_reg_size =3D f21->sensor_count * 2 + 1;
> +             f21->data_reg_index_for_button =3D f21->data_reg_size - 1;

The block is duplicated?

[Marge 0724]
Comparing the new and old firmware versions:
Based on BIT6, we can distinguish between the new and old firmware versions=
.
The definition of the attention data size differs.
The size of the F21 data block and the definition of its button index also =
differ.
Therefore, by definition, this block is not duplicated.

No need to resubmit the patch, please just provide the answer to the above =
questions.

Thanks.

--
Dmitry

