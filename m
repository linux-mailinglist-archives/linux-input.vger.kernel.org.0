Return-Path: <linux-input+bounces-10675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF06A58F16
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCA2F3A2595
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C72224220;
	Mon, 10 Mar 2025 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="TLupK+Us"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E011BD9CE;
	Mon, 10 Mar 2025 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597831; cv=fail; b=b1GLyWekbPAvbQxw/G5jIExoZQB4DD+PA8x5dr80/g3/c0A/RFPdjv6nhX02ZFORVVdgJwmZrOhXwOEX1tBaFNsAhsncLnWLq7tw6gbnBh9Y/xIonXIJlPU1AXqVI9GiW/cm+izj3DiERdyeSda9CF/DQD4BvbRU6ni6mb0aFZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597831; c=relaxed/simple;
	bh=ayiHHNC6jssdh0E7bB5HIsTENo2nQZ2R4m4IGUg0z70=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QrmqgAf+EZ2gpxZF0YCZ+Vdmc5y2MT1VEI5tHlZ+qYLuyIYQlfjk9S4PapIIIT/E86PbNb4FaBwzUIRjIyiZNUQP9NihlN63McfjnOrvjZDEByJA2jE1B31GfGR4uiRHkGcIlQIasTFVCxOGhZHjzSz+i02vDhuvtfNUBH2uB7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=TLupK+Us; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HffnKkeYN+GoEmQO/PDt8jZXnruYrPgCwp/Lg1TU4vXhUcabL6H1qRAsUshaK3tEJFPNW4eOVDS9IMlotEcKfBg9kCN4sqy8yEzBh3MtYfaqg5qG/bJIpEuJzyUrzWrIPjY1gYeVMsaW8uNhRMSyGlsUJDDr35YcTUWmrOUVncSU6aafFHRKo+aQI+3YhCUPd3h9cpzw0jtZDGj+wYhYedglx05IPr9iDjXR1bGWPpfjSlDPQK6XZnBnX5CBqydrHe14eenh3HUO4W1DncADvxWgh5LSwAW2JojLxcyQPh9052M3rQzVll+/mEGV/J3RiH4larEqx2oECk6dyQgALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MW2zs3VVgdFTcl8VhZuUnj2ed23uDMLQw7ffrJ0rwNs=;
 b=O1JrHj70N1cC74Q/aNxVUWrOh7SNeQzUZxM/juBL/uM6SZmMu3Px9acfYhW50oHV6tmo6S/5lPtk4STUpAUvFw8GxnQT1j2++MeAcSJjHnyQZOsOLKOzDp5bzw5UNDRSSmHq4E4X2JvHtdWfT1XQVzzHHmyR0rUlhbItSpyzuHwCbH4OuTHX/Ak8nv0r9GTrubSXT6ranDR75ccxZwC0rrVSVExTwH4jS23idfq0SNbDroe0YH9F9fn/ltkutmHeDQtrZb/ysNCK0UkhU8oBb5+Kwn4tmnDm7ymej2qH7VL/iReloZcmqkO4tWMwKTFptHQrbnuZ0V9m9zLnBezaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW2zs3VVgdFTcl8VhZuUnj2ed23uDMLQw7ffrJ0rwNs=;
 b=TLupK+UsEaO4TCZmrP16reYR7/20CKOek8yn0Bg5vguvkV5guq4przfXs7iMuKNHxgX8g2Aon58GhhUvtBLYjkhLwjBfHqvFqPqQeuZL3chsKybSzF9Lgeit353rXTMNlBM8s0I0WsyAFeEVx8ejwDSX6UUuTq9iriUz/Rkr4/OClSrH4JjCIdlwYZ9D3KFvgmKvWIngcdwk02x58If7JzS2MQ4rm+l1RIvJRXLMAcTuJ7/R9dspS0QUbB+3f5R/dcNzqqdMd3gNcGYWQLruqW4DOoslvUWmiBbDkMPXTFCGXaoRy+LTwfFcVLfe6aJN9S6mptXCma9bmTyrpQwEoQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6518.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:10:24 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:10:24 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND 0/5] HID: multitouch: Add support for Touch Bars on x86
 MacBook Pros
Thread-Topic: [PATCH RESEND 0/5] HID: multitouch: Add support for Touch Bars
 on x86 MacBook Pros
Thread-Index: AQHbkZxBz6fISZF+7Ee7yKm6hzDCgw==
Date: Mon, 10 Mar 2025 09:10:24 +0000
Message-ID: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6518:EE_
x-ms-office365-filtering-correlation-id: 67f22a49-27f1-4a7d-bde6-08dd5fb36442
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8060799006|7092599003|12121999004|19110799003|461199028|8062599003|102099032|440099028|3412199025|10035399004|4302099013|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ei7OStmZHvAj09av72picvoroNrPw9Ws7dcpXNxU4Os1ozTiC4ExSE7GYV7Z?=
 =?us-ascii?Q?vz5M1oJMl5DnAN/Px+30hxn4TTiQ1Oz2DjlLAv4j6w3458DpL6nFxqnH8xFP?=
 =?us-ascii?Q?OjD1NntYbd8UM1W3f8/1nAemCmNAcjFJhNusP7sZXGEQfTkWgOOm3YPow8dT?=
 =?us-ascii?Q?cU59SHzymeez2AhXpNUzLobuXjZSO8xHkVuFZeXPLcSi8JjgovZJBNKX3vZN?=
 =?us-ascii?Q?nLHDSpnC09+wELc3FdWxx0rR9YgJLEZBPvH5PqTzIPYNcdfBWTGynN9Y64IS?=
 =?us-ascii?Q?/18Fsdm+tortiFvPmBn+YYmL3Y+DYd7+l7IlcwmN+z7SkhaVlk66wVwhx/ve?=
 =?us-ascii?Q?0qJ1m98EFmImh4KGYswMENxK1PG1NJ+MeHyw4TQ0DSQHrpFQtr5AW+pPqPhC?=
 =?us-ascii?Q?nhuDDuK+SEV3Sfy8A3NWQwY/tEa7rE2rPFSRL6W56OrdI44A7MVEoZ+84du6?=
 =?us-ascii?Q?36zMVobJKGJ4y+cwzKxhDya9IIVfpSIMtIqQUzom3fdzszDBXFhiVslXCjpb?=
 =?us-ascii?Q?pM3O3NjrQ/2Z96S3uhtwMutq/5ZeRTUHiqpZLGL16o/9xOf+1jvRzcS5C0qf?=
 =?us-ascii?Q?oEgKJPZzNaKHB9gsqzZkcvD4clx7M9+kydhZ/efG6bpNkd/xncaW68vZMqei?=
 =?us-ascii?Q?kCF+QqlycAOP/rXZ7xFawCnSrca8eQP1uts6pv75wmVq7tLp1BptsmzAAZYk?=
 =?us-ascii?Q?AKGL/0O47ZdoYn+S5AK8H+vuE0DGWh/F9tiyCg15DeGdnB6eAnLqLsYFwsiu?=
 =?us-ascii?Q?bGujiXbAZnFo9j8CMQNg3Qlv/DP47CjGvqy6Bcm4//KK1xcSCMYFlspCAgPg?=
 =?us-ascii?Q?0wmV1cHOBSJtlCrpWPG/vLxhiDpFf5NSD5Z9dwEJqFZOA/s64ykNJOsbMfwJ?=
 =?us-ascii?Q?+V8YeqNLWoB2a3m3zLkvGYsTaTAxqTqHQ/GD80VKvFFNQCcjR5HCdX7Fdhsr?=
 =?us-ascii?Q?yvePQNV7QxkVs0LKxIPI/egNdZG2KbPEWXPYh4Af5qV64EvdJF8HY9jg8Rt8?=
 =?us-ascii?Q?gBWa4aboUCM5oNyrrr+bklpPVcFA/zDd9cPyFH7KsGHAX0zHTOinS+robpSY?=
 =?us-ascii?Q?Yx8BVtnCSe0EnUsk7KxXg+rk0I9RqazpJm3DMBp/OAZDxh5/TQq8YbwRtJOO?=
 =?us-ascii?Q?G0wKyeIc21T0QI7MHOQg4IWAOJCUb0GipHVolIxmZnKowaV4rotcvWNzsZna?=
 =?us-ascii?Q?qf7kLnk4audJrZS0UYebqRSBI/8YEKOmtzr6zxPn7on/mIFJO6PQEw2nK+w?=
 =?us-ascii?Q?=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W37pqQA8fGq3nQfXEkDrEpd8JAJaS+04f+DIHO4iBJFarvMMCpepcixNcIeC?=
 =?us-ascii?Q?0eoFXlV3zWyboNtN0KWZdc4t5UUO+kAV3Wkc/S4ObRoO5b866+MYPcC9CHOw?=
 =?us-ascii?Q?+EahcdYdKCHUFQs62YYHxmTy+UQtB/y2myY+2GTGCo9dMTIMBVrpmzJQ6tPW?=
 =?us-ascii?Q?GhF0sNKLGilqkaC5Q/DgxJXd3ieJXq6KOA10WxR8rEstU4G9pg7m0ayANVAD?=
 =?us-ascii?Q?NUphEI1XKf20pcOx09EDG3qoA35xZixKjIHVd8MygTVtY7iTLqC6WanLL9XT?=
 =?us-ascii?Q?QG2xN11ISyy/boeqza90isu4CwyrJ7niYW/ZayvGDlXF84Y4sVzN0MOh7FaN?=
 =?us-ascii?Q?+qmz930Bd7xH9G7YSjqot0xlThH/Lg0B5uG3jQugDpTlCRbWmvIa1nzMuhpx?=
 =?us-ascii?Q?7LLUTwXrXF+t+zkHkWNeJoKacBYRTS0ljbC747qrkm5Fcv5XfB8KCN0Ce48N?=
 =?us-ascii?Q?YL1FCsd+tNdo9sJsigkk17zMn9BlNt8wtt2x6eVXckCCRnzRPtE6w2bIlWsX?=
 =?us-ascii?Q?BYAg9aHOt0T9SM3FgMX0gYOdv1UFAXndz5muQ2VqYmhNQE9YWvcnaEr29DsF?=
 =?us-ascii?Q?5b9cj23uyiJcrifi4sU0GWkoC0g5coTKGs4XMeMucVIU0ibPP3TnqO+BJoLd?=
 =?us-ascii?Q?UYCw/qZKmulfFi7Lf2PgWZBQwmDfqgVRM+8ExS09sM/6NeILnrLhMsE4VKcs?=
 =?us-ascii?Q?hXbxddL1zrcyI0vaLrF/rz+IYmqtgY4PkV23dm5VVB6kwMNyHdT+Wq3Gd6Qa?=
 =?us-ascii?Q?dOnKu+UpchX7ASPISdoAgEIRB98/S7FWz1ZuF3Izqh2nTngfA+vesNsqKs6S?=
 =?us-ascii?Q?WVirMOFf8fjpwmBynHaSNiqMn1/YypNy2472ZEt/B8Hwxz8f7N0gYl/Wb6Ib?=
 =?us-ascii?Q?jD6hvdnJYdkEVAfvRZllmh11y6xNFmKqfDL5WF69dGuIE+RxP5arpEVB5KjA?=
 =?us-ascii?Q?NrxuIBi04J2hwdoaZ84IUyNv16706nVTJhjklv3tBtEq8NKrl++3gLedN0co?=
 =?us-ascii?Q?7xYkIBJkq1onCrg+ptJBWUOzDjVgPwfiRxQNddhGQsxB8wksl/YJr0gBR3Wa?=
 =?us-ascii?Q?s4uHEJ1MvnTtFbagcg8UUIoJbsFco4ZvV4tsIsfeV7/8wiFKvLK7Ubao8pfz?=
 =?us-ascii?Q?tB//RZEeahV/bIu/OhuMN+ypwYLZy02MGKeR87DsNYpdhFCzHNf3ze5JVQ7X?=
 =?us-ascii?Q?6QxErILKmt/cnhR1UI+3W6RfUqRE9/zljb1CTqIVDsbjAhqVAjiZn8GRcCrG?=
 =?us-ascii?Q?KdPdPZWBJEBLL8+r23Ko?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FFC3C8D142F70A4085B05692E9B6F6EB@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f22a49-27f1-4a7d-bde6-08dd5fb36442
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:10:24.2151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6518

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

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=3Df=
or-6.15/apple
[2]: https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0670c2f56e45b3=
f4541985a9ebe06d04308e43b0
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


