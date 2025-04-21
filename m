Return-Path: <linux-input+bounces-11889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84172A95180
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 662203B0230
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC00F20F078;
	Mon, 21 Apr 2025 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Cbb95gi3"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFA01E487;
	Mon, 21 Apr 2025 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241710; cv=fail; b=LHV8I+Dmp7t+Gb23SGfbaXcY2Z2+jGdX/zvpze+9iV/uvsg4EAkCLjwnYu9SYvXgkV+ROH84DFzBRxVUAQdrNEyq8w7wyhQ6i46uRi1dMjjYP3J7gNcCW4KTfHRoZ17qUVXlNskH4/8trs30zG4KFNMdyrUoA9/x1q29LvQCiq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241710; c=relaxed/simple;
	bh=qYMDHNy6x7LteSXyJourP/ZKJgw92Af9wGSpBcLqRb0=;
	h=Message-ID:From:Date:Subject:To:Cc:Content-Type:MIME-Version; b=GWjr1OBDaLrLa0dr2bg1w1lcBiaWYa65DI0LG/TXIYgvlLL2sntmml9+oweECpewBIarRCuTmj0s3jMHDXNOmnp3tevwPjwzccAJXBblhqWXBQ24JzFGz9Smi+ZFkV3qsdOP4QvEW0n/hYFfNqY0fU6w2uv8Kg4znI/fCWD7fHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Cbb95gi3; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4tsKor9pitNcOZpQfcA50PvaSEQ3R/lIu3xeXyFXH0jpdU59KbsJSqfQxZWeAV94R/JaTCePtcb0ygd0BnTviB76+cRuJnmgcBEqSRE9SprlfniBhiZpoeKAoeQo1lHPzIT9yvKuVS4rZGnZ9l6XGCiwOWLbozRr8eXEulAPw8UtRIfp6omz0vuq4waZlSxL2Y1f+mHJz2NJWh5maB+xJxlM2n0agQGVh7JPps1xElYuTgSYNQTlWWWlNboAONQuj3VFBk7DPDF7AJL+NfVj+LC5O5R4L3FUh/VhX6UAfB6Nu7dH7cAj2Z5KWiNpDFiwfhBe64mFpqM1PNKUxTjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8rvo4PVoMB8SeibvRLkn8Z5/SmePf793BhCpZf68DA=;
 b=xpD85OTA1rvu5ohlYDNeNIlG+1RWeiVdw0QGAGbaQIJbrygjhpiXo/qDOQrCCBEZL8ijB6PDTotlKRGi2STSphY/Nh75Ia4fwAU+ZXt6iGjcwu4iJ7o4oH1xbJ6utx5OKAwaA8WwWXjrc0lUaOZtMDNEKuXhVmmqSvGJ5qsQRbmnZKJRiozWm1JVPyN+jbleJhIedPd37KCKKPw1F55+hi8BQvcx4qHcHd2sbX6za70qOkT1PZEycOpfvvbxL5+hUOvj5nLaS6aRXY0QsH7yCoyOeId1DQh6fC+Ty37eXh5aBEVXjaF6KJAYZ/OPFYau4KlWvctyQuBCnXYksKvcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8rvo4PVoMB8SeibvRLkn8Z5/SmePf793BhCpZf68DA=;
 b=Cbb95gi3eHM//UW79+lxQ6iuTNce8W6zrj0xalYlZgxsnacri5OU2GRVEDlZ0kFQCHzD96cGZECM3ITR3FoMTfdXdp61iye+CkSwOlHbW/+uvqqLmAE/ZWIHsbpwr6SDTKcdJhfC7XEAqgq2atlAjdGIoURNnXewb7aPmN3lXPugmrkmUPrEpiKLNvM4dKUFpVetlUnqQoOVpoNuvTo9bh9an/YIH7W+TYhdkTnu4JivpfJ/B7rR2a3MDueAIVKuwDg8LFHxpqxagXcB1cLfcpEP3WlMeA9kySk2GsaiBMlikhiNehJjBlXzAlU2mu3N4TbAzG5a7lSvNcY3gTD8qg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7289.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:21:43 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:21:43 +0000
Message-ID:
 <PN3PR01MB959774B78630148338DDF586B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Mon, 21 Apr 2025 13:20:27 +0000
Subject: [PATCH RESEND v2 0/5] HID: multitouch: Add support for Touch Bars on x86 MacBook Pros
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <bentiss@kernel.org>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::17) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <cover.1745241627.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNXPR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8238d7eb-aad6-43d9-1a05-08dd80d77566
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|7092599003|461199028|15080799006|5072599009|12121999004|5062599005|1602099012|10035399004|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ar+r0hPMDGhro7gqy9AbYnGMyDv75RCrM0noDr7E0QwSibPTKUbd++GSK3jC?=
 =?us-ascii?Q?KxY3M3Wf1sYjaHLZpmSswdPPTZ4SFsgkVd7Gm68kJVvNHVUqz1SDc843hDFc?=
 =?us-ascii?Q?fzs+YZEGmb23kgOms7/WPRbgxYgPPuq2gs7m1AMt3IlLHFuIdluj3GYrt/eA?=
 =?us-ascii?Q?lvKNSnJswktVOMakqwK/PRpbBaOQYle/vr8wVYTsdxf+s64YnUhSOcjVrcL/?=
 =?us-ascii?Q?RVb+BA+wv1IR1TjSlVy5D8dKOpJLslyVFxeR0HeMsJwa3CuGymjqEvYbPyRz?=
 =?us-ascii?Q?i27PCXufSCmB4J1GILcTdYQB+3jAKhczlZpc1q/uYLnVBLr3laddj3+mD8j0?=
 =?us-ascii?Q?bH0k0F0NQlRHuQ5Vu+U5B/NbVviN94C9Pg4nBdJbQIlB0NqLMsQB9+WYNUHe?=
 =?us-ascii?Q?Gelhl7VwvJ8BSLoy+w6h8ypDYBW/Mok0UnXh4mM6LVQjMia2oP3CcWb7s7k0?=
 =?us-ascii?Q?pEhbgY7pU0cUrCaTat0VNI3DglvbMmStJdXV7K2406c26Emi3TBZbmLFjXnQ?=
 =?us-ascii?Q?0Cu+xy8ql9MQvkghJuoefv/paX+OZEO+IEZHfKpVRDFed4fsxFQ57Tlg4uer?=
 =?us-ascii?Q?HJKIXSoTAfgV2/osJ4p5ngnCpEftDYKnDF8l9Gfe62+bhhbNJDdK+EYbtTW2?=
 =?us-ascii?Q?/sPa7zZJwtQKvhh0tekX78Mw+Z5BTuA3fpOU5EbSsNlfDsPgZrXL17/jqlut?=
 =?us-ascii?Q?JjXiOD8L6WQkVQkz0I4/3H7mnOsWj5rb3khAVcf4v8BRXMpFXv/EfDU7CIXK?=
 =?us-ascii?Q?45oPeRBTrnWgly++m5bOo1oJoIcU0b3GVq1KGX7JWjVdIQ2L0TwNjaEN+y1r?=
 =?us-ascii?Q?e8gWgEqHh++0S0/15ctWgYup/dIcQs89y3HpcJpCXOEjWOxxX2Yslc3T0gKd?=
 =?us-ascii?Q?ODrpE6WvtS3HVQIiGSWQvdN8wdSG6Ehn/Z9FBOBFs1kvbh701P11d96oLVSh?=
 =?us-ascii?Q?L+Onqupdk3ysCo+epT92HV0m4FlIdMOUnUW2TNkX9MnzZNxnuOrLFxk++ZV7?=
 =?us-ascii?Q?8Gg9u3upDN5mT75tR0Qzvn8wOmNCo5Xv5z9k8PVs7xUfSA34vKLN4+swQdRo?=
 =?us-ascii?Q?jgmXENvY0bAHrP0EBnK3oHyZUB3jJP6+Xy7E/f8gOwZ4kXs77omy8pkd7hGb?=
 =?us-ascii?Q?DsXKef0KhmCV3U9IBUE2dVNyGK9sfebTnwedBsSPH96JHtNVV2G7ogugGXu3?=
 =?us-ascii?Q?x6cqKukkInByxNywvOFf8o+Cj8VxiFnrL3t4/REXie8MMqVyy+Wr2ViE6ZcK?=
 =?us-ascii?Q?Y96TRGCIloJmrvUZ6uTBQtg5PV7nTfS3v4ixI0nLTtAtNBDgqcbJ9t5PU4Ua?=
 =?us-ascii?Q?4XE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jIHjY4nP+E4TpI8JBkby8herk1c/U3cff4M6VwhHozItb19anlSQLZWWm2rr?=
 =?us-ascii?Q?Nax2qjP4k9qIudxJ+ffT0bFyoC4O0viYJjRZVXUEdLi2f7TyS5uFba4Hyx5A?=
 =?us-ascii?Q?9mnzQU0ACIBS+dNQzKMJDbe8kHCRAUNeVqq7/KRZ6N+KFHJSdz62eJsUXBDO?=
 =?us-ascii?Q?9DuHpL0yQ72zu6nCZWrgk1F1/aXUgQ6FxWyHjpAGWql1/O8wg5ESLM5KE+Hx?=
 =?us-ascii?Q?WqcCrUbIhzb4lU3ycV0zHGFsAthsKyYMsW7iOaqcB9dWkpd9MU6u4Y5Fdish?=
 =?us-ascii?Q?zpvkutmwVX59Q/wUbryO+PZuDf7YMJurj64jEVmP9coz2InB/kQDE/lagU1+?=
 =?us-ascii?Q?rQiZMNQNuN85O1hsn/Tocpx4TYThcCSmV2Ap9zsT+8pQ8z08BXDyq5sRCFyp?=
 =?us-ascii?Q?CkV8LbijvN09l+QOirkWtKIOfbeYovGdVUQcO9efV5KKgEC9rx4k6woxpzOO?=
 =?us-ascii?Q?tK5SH3SxNJ3/CdCzsZ7j/zhai7jm7mMHGWZ5QO3LXtw/laO+ITLYeFytjcBG?=
 =?us-ascii?Q?X1HvCk5HjF5pRPMYXHgDKSq6NR5Y560Lu9GNZzRVgJyn9M9uFwHobQvfa4K3?=
 =?us-ascii?Q?8IvwoAnJhGDuA3to0J/tFbeSK85GGj+pnCwZnlkNPW1wV7ix+4uWww9uA/Wr?=
 =?us-ascii?Q?IZvezItiTxvrn+/GBsL+U8quDLXK6s2Vom9hGlBtw9eaF3G1Zf36kFGELoaR?=
 =?us-ascii?Q?mgtVPSSpBMzBWhZH5K1RCY4jZqt0pT8LH2gXjp5saCBbtgBvdJl0b+YD68HH?=
 =?us-ascii?Q?5wqi3RGVBbqKVkwgvEVB1bp0SZNe0QFeFKwpDEVDp4hr7A1ebF8g0L2vufxE?=
 =?us-ascii?Q?whGwB9bZBds/5Jg510jfbEFzJaNforaLr4INDMEZ+lFpXp9KMDYlFgk2MCxT?=
 =?us-ascii?Q?GTXamAqL4htHHRwA7nvyWNKqYM28OJGUKjXf4fAAJKl/h6i9UK9AuAqLYH84?=
 =?us-ascii?Q?2yjyx0FCcj+H67w7Bn/Lhv595R3o4rpZxY6hwKSxWBwYY+Qh6cOGn6sp0lEz?=
 =?us-ascii?Q?4vU/hRsu+pkG/ZZrx8dOloCflRIpqx0SDCIUQy+Vrmc26sl3iMfFYUT9OxMt?=
 =?us-ascii?Q?ceuhW0CT4QBVereXvDOtuIw9eRqZoOJHX0NfAz7LlbzKr4RVBYhhtAbBHvKX?=
 =?us-ascii?Q?QaQjn8/8AmHwF8h8AvjDWQlQEU6vwE02cLyAFXSH4I/OzPX2iMx7LT+f8SHw?=
 =?us-ascii?Q?pO3mCBIkEKjlWms+ccWICGUEahkX12wNkcOjdYse6500a1uOUft95OqLAE4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8238d7eb-aad6-43d9-1a05-08dd80d77566
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:21:43.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7289

From: Aditya Garg <gargaditya08@live.com>

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

For the case of T2 Macs, apple-bce [3], the driver for the T2 Security
Chip is also needed for all the peripherals, including the Touch Bar
to work. It is still WIP, and will be subsequently sent later to the
appropriate tree. Till then, I'll suggest for get the driver from [3],
or more preferably, get Linux support from https://t2linux.org/.

Cheers
Aditya

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-6.15/apple
[2]: https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0670c2f56e45b3f4541985a9ebe06d04308e43b0
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
 drivers/hid/hid-multitouch.c | 62 +++++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.49.0


