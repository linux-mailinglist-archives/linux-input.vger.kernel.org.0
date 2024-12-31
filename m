Return-Path: <linux-input+bounces-8823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC55A9FF0F8
	for <lists+linux-input@lfdr.de>; Tue, 31 Dec 2024 18:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD50B3A3414
	for <lists+linux-input@lfdr.de>; Tue, 31 Dec 2024 17:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889931ACEB8;
	Tue, 31 Dec 2024 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="jWVaVIZL"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635C1ACEA8;
	Tue, 31 Dec 2024 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735666393; cv=fail; b=qWtsV9T7WZYMxBrP9cZPD6Q2OrmiwUjOXrV41qs3BiLkNOhYwkprecCzn7yRPkFiSHQ1NMd/IFvlFSkVv+1lXXgTLIrAkJJzHOi2W39vcoryOFVZ33zirUFlQDqiV5PPV1mtzbELsbUOYZB1VUZM7Hk6ts4BDLAal0EeOa1qP/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735666393; c=relaxed/simple;
	bh=m8PE0Ao4WRx/H2WOewQ9aHMuNA0GeHCpZJkIhSog3TA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K9cZDwvHDm6gcKmcLCOj3LTUlIL5EX27SfUbI1Vc2mhuUH0mOio6I4Zs6VgWckHahlVS1w8ysaA3Cnpi27uajD/paXwulTSpGXcAJS4i+hMqXWRrNuCAAsE7uxHY0FKadUa8OLoUe4vUkX/dK3vw48CEd0e5AcVStG8LLrwwfu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=jWVaVIZL; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1m2vlS/1wdSnCnP6wvVUQYCISpv7kGKRQopPbQ1JDIvqHKyKJkA8XPgCKbQ70QiaWmuS98XmZrTxVYcaNHPIgs2yNvQ6JIZbDVWgD4IDZwX2LN1cHacrpCvFt18Tktek28ZgxIRZgrkPonZZxQjTuAhBnAX9jNN6HiznLvMFtE57Lw/rpqiIpA7y1jwYM4CsgDXdg15IbWibsZQnMXEtC/BkYsk51i8bb7Qkw7zNNWwHx//S8KqOqSNvAWewNHmrCRlFSdiX4qv+kzxunZE97e3LXhWMC2E4iVpzLyzhfYSCX5bl+ZV4x00dCc4jcLzV5TUE/gUsb84LPT8u8qoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60DMICABaJsGu37LQE5AZEoLxZoOlHFi5JYbCWzVv7s=;
 b=l9mi2RAfdh1Sb8aFSS+3V6CRzXuKcc32/IVPWzsxYC3ytdnQ5Wqa0gDaKPbSvjdvUCAcTyHA3Yb+yYw0uCafKQmsDm72vp1PCxluTcOJ4IFze3Ad6asVNFjnPOPqRKExPxnuzU3DjMs6aoqAT2trUojHzY47KkDOwb4xrxIsw73AUBwK4k5YMlZb4jHAuDo483UTTuw6pHZKIFW/dbx7PpmRkVOQqrRldPMZwBCTkvWn+a9bnqYdRHJd3fxGEzRF/xpclHOCfi1GZgIWHzWpfNr1Uz6ULHkzmELqAq4EGkb7sjVDM8FQQKHAgj5cH4O7sJFbhjy9/87BM/iKuAey0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60DMICABaJsGu37LQE5AZEoLxZoOlHFi5JYbCWzVv7s=;
 b=jWVaVIZLFX+SlC/MqDLy41tC0yKzQz+IuKs6buPEqo22kOGTF04P8h2ElqPUJxjK0dfvKOE2MtIpCew2tPmAL/6dGLH60kiDYHcK9jwPW/waA06I1NXBMlTU7H2JviNag5eaMTtljImznm38N3WAgM/bWY0uWxrWykNOy0L90c9qR/3VhM/OIWrUMiyyH1YlU4zMZan+EgSMfSgntI3bZwYh7fJX2N07RvwmP5wiwu0h/etZb+sRnOsUqWHoiUpmlyaz3N7KypMfpDRi/TF3EDrOMg7imsXxJ+QaSNs2x+fLn650AZVe0o22tjanctemdAWH3OM5d9keTb8M7Yxo9Q==
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:cd::12)
 by MAXPR01MB4261.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 17:33:07 +0000
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06]) by PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06%4]) with mapi id 15.20.8314.012; Tue, 31 Dec 2024
 17:33:06 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "jkosina@suse.cz" <jkosina@suse.cz>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] Touch Bar driver for Apple Macs with T2 Security Chip
Thread-Topic: [PATCH v2 0/4] Touch Bar driver for Apple Macs with T2 Security
 Chip
Thread-Index: AQHbW6oNdgMN1a56EEChv9ji0GSZgg==
Date: Tue, 31 Dec 2024 17:33:06 +0000
Message-ID: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7728:EE_|MAXPR01MB4261:EE_
x-ms-office365-filtering-correlation-id: 5b3cff7f-73ce-4f14-9a21-08dd29c12fbc
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|15080799006|8022599003|8062599003|7092599003|8060799006|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sKORW3GoixOsi6hcrM7zQX6JiCpnD1pGGi3CKf38RxwRioEKK8k3sK3ekie/?=
 =?us-ascii?Q?L23CfAOvL3B4iI671+cBEzeo54cYiOjKuvamjJoYukThhDjwI+byco+834kD?=
 =?us-ascii?Q?oVi7CNqhKoXflk3XGcq7PFkrSaJvq98jVagZsJ3c5M9j5picOxb2cqFlviG2?=
 =?us-ascii?Q?LKioDMRZKTfHBMQqeBtvHltdt62PKFKPo1LNb1rMok3KlWBJmCs4ClF3BelJ?=
 =?us-ascii?Q?0xdkV48xSSvGzKbFUyMtZZKebevqhzvuexoBEqp/eqdznUOk7IeiuxxXmgXZ?=
 =?us-ascii?Q?iUdTn79Vg66xxYkOYgzAJsp3cZk13clqtm0gqte6qYw/NymbfVc9HtL9DNfb?=
 =?us-ascii?Q?L7AiksOZp1oKWhrKGm1dCl8UgZWE1oGaQJfIbYnqvYQgXbqmDp4lWAMYx8Ng?=
 =?us-ascii?Q?MY7M/GOEx+sQkmkKcI4+zBsPwGXu/pCHnNECWJr9Iv5GbuB+8vPsgax+c2WX?=
 =?us-ascii?Q?tMb3T/nlugBnFqaxTBrdxRw6bc8qbBl4aCbfJ2oxSb8NHDTZPjaH0bctr5vA?=
 =?us-ascii?Q?3zQwsf23SBDPSQfHfY8nVvBwi7E4cyf1W2+UgD6ewpjhYtGTMUkwGHN86hCP?=
 =?us-ascii?Q?JcSNbLSwuJhbwDPQcZIYPQ6Cw1i2CD7pNTl4j7pLjvCIu0sAL56FdQDU0IEb?=
 =?us-ascii?Q?NnkWzw9PnmqM9Evv7NuuAOGlB5tIvL9sTWDBJiYqar0+e/2KG4SHDcwIjbTF?=
 =?us-ascii?Q?iyBwRwgUCsDchSZUYVqmk5AQbFaXuTKSj3uyiFaEw96UAUICWrMOxqTxrJwn?=
 =?us-ascii?Q?aqEp+Q09NCTi2SxUJ1iOX5ahKsGpdSknQ4XIHuAQuSarOsdKXlDYRKbUvcXe?=
 =?us-ascii?Q?jGqz3GB32SIWPCdY2Kz5IImWHVT54jtkCOuN4ATOsHjPT09p4B1nlqBn/BFX?=
 =?us-ascii?Q?KOHIh+bD9Og32zpNgEJzHP9FJuywc7UdIk+ipC6RhErllrpFKeUxTbh0N+HU?=
 =?us-ascii?Q?/5dv9lLthph4TE5W9AybHyVpc026FBYly90AmwwoipXTKnPIrW96NzYf9sxq?=
 =?us-ascii?Q?0afRozzykzaiuCMq7Owb90GLKLi2xuzw8/0nHyu4W8AjyQinvTqpDTb2V6Ym?=
 =?us-ascii?Q?hlc3vt2+1cXDAz2Ph5PlcSPBY82vEG1dboSEi590DbId/7ApJDw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jHazk++Nll3mbcwbePXhNnXoRfU6OR4ikbCPelx496FnWyl5CcacagqW7Pvq?=
 =?us-ascii?Q?iZwe9UqGmDm1tlfKVI2Tp37qRA8tPMPGI3LLN9T8NCL78Siy5tV2us06AQuf?=
 =?us-ascii?Q?8zdH81y+/gcl9mRBPir5qdxhr7VxYAARL20OetPHOrLeuWsSttG7H4kKdl0Y?=
 =?us-ascii?Q?RRCmlETn8wlEpGLFjV5fMSAYUEOjqbG1TMEPqY0TC1uEW/JHFthLfxFZhFhR?=
 =?us-ascii?Q?BocYgBfx4N5jYofYr2tx1Os2rro0Yg+6t3Ek0MCJixY4lKD8JcycBfbFtd0P?=
 =?us-ascii?Q?Bw12z6h9AvqPZVEE3S7VmnlJM1uhEJgsMl6435Mon6hYZwD5Zt9ywu2sv9E4?=
 =?us-ascii?Q?EJoD1IjH3s88aw6amOHN2Rkn4mE2WA0VELWxhVc+gD9FkqmJ572MkWY8hZuX?=
 =?us-ascii?Q?BXbMzHeARs/GDqdqLHv1siWRFC4M0NMqA3JF/nV4RVgw6KddxG/rWoGJCeg/?=
 =?us-ascii?Q?lyLoliiztG+ntCiYFwZEse0u4Jt7Ghv1ClnH5/viAJ1XCj49em4NRPusHpT6?=
 =?us-ascii?Q?9i0otj2DLYq0aF9So3SHoIK28Mew51uLPUf8NENyJ8a3epsGdmtK8kqR/cVq?=
 =?us-ascii?Q?bgVXJzi1HVnbclxS1wA7rDAruxY5mTaXuzDpn19S13xlCJH9HmvfrhxVwntZ?=
 =?us-ascii?Q?gS3bPZLwqRiS9l7xmgrmGtch5SZLde8hVRgZ7kCwtLTdcVrMdgGELw8M0zSa?=
 =?us-ascii?Q?fVfV76r6TGg4imGxQOHWyKQd2Eq/CPUhDt65KA6SljGERhG2ftpr+FDpkQ6+?=
 =?us-ascii?Q?iFiNfgvMG6D9rIIBRXk6r2V/NwsZz6QTli5qRzm9IxaiHYXUEFos+dUo4WPR?=
 =?us-ascii?Q?/R4BVxlmrcecrLTiiK3KyEYQ0mQ2w2eUYrSlBeZGyJzpPZVtUM+HOpZdYdKj?=
 =?us-ascii?Q?RC/fZtXYojM7lE99jUeg1jTEktNZm8Dt53tiQAPlSbJbJKLqpyfd0FAVfjPv?=
 =?us-ascii?Q?cUoI7H6GPIFjRZ0grgtqRvhA/hCspv6/GsUouUZ+KEqTH4ESO+WF1718ke3s?=
 =?us-ascii?Q?/KS9XGY1XB/HTDTtqAlKFe+Xh6aDNPRSG9s8boGG5nqxWiDyjLgoF0GFKhde?=
 =?us-ascii?Q?Cu+hFxCOFywhtYasJEPUeg7WDvnllRkDYv2+cnVPQlHi60yO2RlyukFrJzRd?=
 =?us-ascii?Q?OUOi1raFkS480acKKkfa41I/qAHYk53KE1z6QKGmFAaHtmGX5VxQPtve4U5Q?=
 =?us-ascii?Q?VQ/r1Xwdlm6YmrjixmOxg3t60YqrsLTlxd7nxgU3suTykKsoEsacXL9e3hyI?=
 =?us-ascii?Q?tDyxkgmQyP89gD7D+sJRIHknOSo6YPEz/bn8hIGTtpsaJnRvKCzTr7FQEIN1?=
 =?us-ascii?Q?4SZOyhKPJXGin5qgvzRrN0pU?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE6706BC5B98A444BB6B0EA6F520099C@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3cff7f-73ce-4f14-9a21-08dd29c12fbc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 17:33:06.2709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4261

From: Aditya Garg <gargaditya08@live.com>

This patch series adds support for Touch Bar on found on MacBook Pro
models with T2 Security Chip. These drivers support the mode found on
Windows Bootcamp drivers.

V2: Added checks to the keyboard driver to ensure backlight driver is
initialised first.

Aditya Garg (2):
  HID: hid-appletb-kbd: add support for fn toggle between media and
    function mode
  HID: hid-appletb-kbd: add support for automatic brightness control
    while using the touchbar

Kerem Karabay (2):
  HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars
  HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch
    Bars

 .../ABI/testing/sysfs-driver-hid-appletb-kbd  |  13 +
 drivers/hid/Kconfig                           |  25 +
 drivers/hid/Makefile                          |   2 +
 drivers/hid/hid-appletb-bl.c                  | 207 +++++++
 drivers/hid/hid-appletb-kbd.c                 | 506 ++++++++++++++++++
 drivers/hid/hid-quirks.c                      |   8 +-
 6 files changed, 759 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0


