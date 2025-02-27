Return-Path: <linux-input+bounces-10413-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E4A486AC
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 18:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E368A7A346B
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 17:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216181C8636;
	Thu, 27 Feb 2025 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="sAxVJj1f"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711A1C5F1D;
	Thu, 27 Feb 2025 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677591; cv=fail; b=p/bV8ekF+P9usoYJaQDPHfDAlAhqVsZF8M7lPKAY4lfBvFuZh9PmkNm+MAcLsrkYWd3nAhkyQTHrCMXR9PAWGskkFMcGNhTfO/LLECmbPHpxjPcEM+dZUhQQ3qxdDiC4MGqJIQvA+MoXl7NZFbvgLU5EpzyOsahJKoMBx0Zwwnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677591; c=relaxed/simple;
	bh=dupHdi1kp/izzzrRlPcKkfWR0zO537yHt18y6CSZkLY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kC9O4p28br//lMxSWiM6+uNMrE419JOCWa0a8/XPyOvi28xfFF38kHAWszu3PCAAmO7J3vvEkq5Y8UHOXC/k/frT1rRaFV1TD15ZxQ6w6MKh14CZRnXKgLdx9XTCLPxO9xZjSxAnD1avtbuiJtIAs53QZe4Ut2puYRqOW5mS80Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=sAxVJj1f; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv5IkDn/Jqv7KlX8Y6rBOowUA3wwbQ1PJR4rAe8Lk164XOlcoxr35DZutWK0fnrigJWiJB2hc5aWUlWlK878FFi5hYNhjliJ2rYRjyqQl+5RVzPXbfJsZsAxL8VCpyH2xtGjzvRbkJyZ36ManFw5pBnGOcXm+Nio99Va08sPGqNlNPB8RDhEdTywyB5EwV1NM89pG0PJjidffxqyqw/lknybU6asH2Kw5VHNHBoQArlhjQHN7fVRzXvZGeHgijyd9Eb3O8IVtGn5sTPA1el0wudjSuIqebeft4DsFj04efaSrBBCG67YfXZGLuGhrD3Icljh6l/VrYXSo9hgEgP3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHUCyUqxHYsd7t2eKDLP98rR0haICPDXh6teUSS1U3s=;
 b=y3O0/HNQD0u7Wgiz0f6f1/dCoXq70RBl1m2zZ9HxEZQUSbj9kPkr8erkMisfnoiTKKCbZ+vkQMq5XVBf7nkoq2w4hBgliReHDLJdRINkubU3LcoIVuTNH4lq8aPKMrSXXxe4Jb9Xb7i7USVMw37GUNLhhUSxz+0A0tM4tkhVTgWVZuxv0IJMM+etco737WyAY5oXresm2fmHJ8VKeXuy8HIEhJxJLbMk5rOcGIMoVVTznrFux4hycLgGHYOGPWaqh4EephHlCQnBQiYRHyUjMYdI2O5v/6mM+ISWHIdfiWd9RCOws4y0PgkyzcliTO8YQkXcMRfAiJOWk6i4OU+K/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHUCyUqxHYsd7t2eKDLP98rR0haICPDXh6teUSS1U3s=;
 b=sAxVJj1fh5BpnLQEOJzwQltDR2mUwmfMyC+K3XelTaEsWLHlthFbEj+5b4kIVifG+JvC0FUZQ/PLsKXLWMPFcjtDFUrCxnN6i3YwlrHMjEKu21gCGtgZX/9tlTbCrnK0WABOSa+M55H7zq4LbnyEQg3K3d/CmQiQj4X3MDbm72Gc2lI78Q13hF6uKI7d0tzyEOe8HerFrOo2eRD/KoYvm9NE/c+O38Zqkph8Sd1zXzAyE7uTn8L47VVilbnFG6LLb+UhjboRkZ1/qVxNKgkhjrfebrWNPxgGxmRl9as7NWENttCB34wckngH1Xq9kNWgae8JCmhY4ekDbTi/ckKrLQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 17:33:04 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 17:33:04 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH 0/5] HID: multitouch: Add support for Touch Bars on x86
 MacBook Pros
Thread-Topic: [PATCH 0/5] HID: multitouch: Add support for Touch Bars on x86
 MacBook Pros
Thread-Index: AQHbiT2o13we6r7ex0SoH0BF8Ph2lg==
Date: Thu, 27 Feb 2025 17:33:04 +0000
Message-ID: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7281:EE_
x-ms-office365-filtering-correlation-id: 52ae2252-24d0-4e5b-bec4-08dd5754ca84
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|8062599003|19110799003|12121999004|8060799006|5062599005|102099032|1602099012|4302099013|3412199025|440099028|10035399004;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hlQ286N7CStLhubdk8/ervKneMwyqqpJ7U8e/7pm26cJvjR7sePaBqz4MTRQ?=
 =?us-ascii?Q?fpuehgF1yvA/v8LjWRWfivT3uurBjs4TKftO4iZp0zrKF4L+JsObjKBfwowA?=
 =?us-ascii?Q?rO0kyUvFd2Vzoo9W+TSac9ckGdVB/BxkN7tNM7W3qbM+i0Dc2Yyna0hDnYkO?=
 =?us-ascii?Q?B60kSqMpbzgx6cCspp0rdsuAqFtblkBUssWZs3eVeSA/I3Mpz2CXxNWe3GQr?=
 =?us-ascii?Q?QonrW+Zb2uP7poqFZP7/8NV4+WtgTihDBYHnWJyAO8xnMivuEz/oSLZb8zr1?=
 =?us-ascii?Q?ayqjJT1e/bgcMOCu5SYYvjHV+fTguv8IExlSzBztcckv170YbklMRdIzPEjB?=
 =?us-ascii?Q?8z4xq9NOZqURkXeMaTOXZ2wMu+koS/0kQrptLL1FkIDmqSUnV6yCyKDNH68V?=
 =?us-ascii?Q?dzhDrK4a6Aab/5xj3mPR0+/vpj8pahUNjpcCMG20Xl/21lIP7Sur216cbiDY?=
 =?us-ascii?Q?nd1/yMOK50KC3gqpVVn3UTa/KcHgskUHkt7fstbgUtM+4m9GADvE5PcMNk5U?=
 =?us-ascii?Q?6hno3CuiLY8LS493D5+5d+5LJXydd03osYOovzyPgb8m8B3aZFY2rAYuXLDO?=
 =?us-ascii?Q?sSNYNC5L0xXJAe+QIIlV2Du6gcB/rcif4Nrnem2+sGqdXVcZOdbF76PDrUZ9?=
 =?us-ascii?Q?yM+By11F29R5GBbqUl3XxEYbs9F+0lHoEFtUA/kqSaeK+/XVCNqXwIWO3NhS?=
 =?us-ascii?Q?bU0CVRAuWAlTznEilFyid0hCP6SlbZLa0RAdqhZ82rn4kDAJSpGFkeJx5MIB?=
 =?us-ascii?Q?RpmtFp1nJce7WQJW+ihaGkypA0gpCs9Pxht0HOJWZgbxWno/JR8K7D5oEnQr?=
 =?us-ascii?Q?+VUelffvVYencmmjXe9FHsDyRtffQdzaw6NqmckFngE9263xJX3TGUQ006ZM?=
 =?us-ascii?Q?KUmxbdcq56u188rSs3qAXlBhfn0qh+yMP7Ccf//F1AdZxsZkmWjRBHpOGZH5?=
 =?us-ascii?Q?gvNXnEUJd/ZH5zBLDAu6CgyufYTOKaq78qzyVX2K/QcWcxddjKmpu6bGNXhh?=
 =?us-ascii?Q?MK8lxVtJAoDmx4TWXmnLCg4XUZ8rhOEL2rHBsFR5luyBvwDqOoj2KildDmAM?=
 =?us-ascii?Q?cBLVoEGHiGOxRflMqySAKzrL2gHuOsv8wmWqrFWyUPN9mgxm3Bw25zR32AL9?=
 =?us-ascii?Q?oG2qXxsEMcNKhTzb4GaQGbbNRkzga4cYRBFQLrCymKB6hmQRiCWdt0VlpXTG?=
 =?us-ascii?Q?0qqnSoUV5RAkRuKFXxTwnT6D8qN6yA8kRtZiNWDoype8U2+ULU/0get+Heo+?=
 =?us-ascii?Q?XZJ3fDupoA33l/N7uqNB?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?noxLUGB0OpCmOXNWSpt+6KDMtAeWbaRHOBWhqopuau0c3oGPCMqgANT22W+l?=
 =?us-ascii?Q?7q0YoNISa1HSRKzsFR9PgyFLxcZ1oW0vZI9fLH9bkML8UWREdfw5Ka+UimgN?=
 =?us-ascii?Q?vdYYMP6NLz696IIVqrbqERIhWUHOFmp9NzUawQENzSbAni+/YL9+pDAKpyGd?=
 =?us-ascii?Q?UREOxWSECX5ANHd8fFxr6qckVwpkkJ1eMZ0e0aV9meM/LDj/EKAVSTeH8YjR?=
 =?us-ascii?Q?MsQ+RkHu7fGl3YbPBYr7vKKDuY33qsTO1Zea8gaXaVsnzv6iEiBvqUOp6BlG?=
 =?us-ascii?Q?mTjNRVpWL5YGuvZcnsF1ZLjPPuxJJrV8BmRVbWtxh6XBF8CKrBMzg5BkVcc5?=
 =?us-ascii?Q?dEmG/F+tof9gVdvdzJbXQti1xwVm/sUU6hxlN0VvnABnxmqm2rrrJujd1UI4?=
 =?us-ascii?Q?0W8AlDn+5QoBvt/hOhjgJYrIa5mN9gXrj/JN78SCRSeZgB4HHW/PjIVQQ8PG?=
 =?us-ascii?Q?kc+Q9EFiV++GSv7f1bmqG5nSAEN10tlV/GUFr4jY7VJZSe678ukaFUye8QP/?=
 =?us-ascii?Q?tMjUS4ONY1k6zCH/lLYROEotslzg7oMPkmcX/OBSyAdW5fWYrIZRTI/Wh916?=
 =?us-ascii?Q?Ksb/moXbGOSJypQHV8iJQuOny2Z/6kb5uQWYWQou+Yf0M7jB+3MJUUOVPU+w?=
 =?us-ascii?Q?Tyvyucsp5uRydh1GXMZjs3htj0D2on8snyIwBkjV1mHnNphZqbJ+MtYZWofs?=
 =?us-ascii?Q?uc5W+iFiI+5xXk/amtDT5SJ3jtWLA5VRlnLQPaN9q0owmsCFxSeLbDgTUjEr?=
 =?us-ascii?Q?s6/Gr9s2g3RM/VrK9LCzbWSzfK/BYPSRY+lY2HdiqpwetD/JqljAsptmk+mr?=
 =?us-ascii?Q?TIoJl5B0510NAdmkQkD52DXHAowaEcWyPF+4HcLKA9l8p+44sfUCnxjZhC51?=
 =?us-ascii?Q?qra77nuIHyArg7MALqeSVop7JFB130AE+eApoHxmdSBzjba2x4UYdE5bP2AG?=
 =?us-ascii?Q?sYrJSF+syPRC5xzypZ2aPjLmZj8UahJ/Z5XoiXWuJkU3+megSv0K+ante8R1?=
 =?us-ascii?Q?LYh5VSbP7U27Td3ogFnMcGoGAQroKVupmPqVM6EjAieg7uuvPjPB8UdX+AGM?=
 =?us-ascii?Q?vB8r4lZnN8TtmIOxCF8DbsQgbT2EX6ngenk9NK86DmKPfMuL0STEfuUNUBOr?=
 =?us-ascii?Q?Hpe+Vuz65ePnW3UyxAGE4QO3CRqi8k91T24J+PRmAGmwhCjUk98Kfg0nNPNJ?=
 =?us-ascii?Q?AQxX9x6U/OEYP1RHUD70fliOraSf+PCELPXtZSLpy22UWwPjNtc+NvT7UcWc?=
 =?us-ascii?Q?XsNEOsFFwWdh6UdnghnuynuLwdXtAIFuqXBGw1TlJxBWXD98Pu7wfJGThFst?=
 =?us-ascii?Q?o+Kl0exvwhb4BMhrX0PswNNM?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D217C30D39EFF4F98D700132CD76FDC@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ae2252-24d0-4e5b-bec4-08dd5754ca84
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 17:33:04.2959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7281

Hi all!

This patch series aims to improve the Touch Bar support for x86 Macs.

Recently, the hid-appletb-kbd and hid-appletb-bl drivers were upstreamed
into the Linux kernel [1]. They enabled the Touch Bar to display a
predefined set of media and function keys, exactly the same it does on
Windows Bootcamp.

Now we are about to get support added for the DRM mode of the Touch Bar
as well [2].

The DRM mode enables the Touch Bar to act as a second display,
just like macOS. So now you can add a widget, put a clock or anything
else on the Touch Bar as long as you can develop a daemon.

Now via these patches, in the DRM mode, we can use the Touch Bar as a
touch screen. The Touch Bar seems to be not compliant with the HID spec,
thus via these patches several tweaks have been done under the cover of
a single quirk, MT_QUIRK_APPLE_TOUCHBAR.

For the case of T2 Macs, apple-bce [4], the driver for the T2 Security
Chip is also needed for all the peripherals, including the Touch Bar
to work. It is still WIP, and will be subsequently sent later to the
appropriate tree. Till then, I'll suggest for get the driver from [3],
or more preferably, get Linux support from https://t2linux.org/.

Cheers
Aditya

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=3Df=
or-6.15/apple
[2]: https://lore.kernel.org/dri-devel/72610225-c6e0-413a-a791-468635743fc2=
@suse.de/
[3]: https://github.com/t2linux/apple-bce-drv

Kerem Karabay (5):
  HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX
    fields in case of Apple Touch Bar
  HID: multitouch: support getting the tip state from HID_DG_TOUCH
    fields in Apple Touch Bar
  HID: multitouch: take cls->maxcontacts into account for Apple Touch
    Bar even without a HID_DG_CONTACTMAX field
  HID: multitouch: specify that Apple Touch Bar is direct
  HID: multitouch: add device ID for Apple Touch Bar

 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 70 +++++++++++++++++++++++++++++++-----
 2 files changed, 62 insertions(+), 9 deletions(-)

--=20
2.43.0


