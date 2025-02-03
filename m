Return-Path: <linux-input+bounces-9722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA70A260A5
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 17:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F15518832E3
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 16:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F7A20B7E6;
	Mon,  3 Feb 2025 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ODesHhpR"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010014.outbound.protection.outlook.com [52.103.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58FC194AEC;
	Mon,  3 Feb 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601912; cv=fail; b=jZ+TRpACaG98esjDw/nFikI088h6NrGZc5H/APDB8IQOgMH16+d1PF/ZaJ3VPuEIpIB53gIKjAaM1yeK4uerB/5HdwnWzbbQ4xQbAnO3kiXOvcjAfraSIhH+dNfX0ROEKG2XAw/G4jNuN/bTSKqTenFQVlS4bGRZ+mavLNcXs6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601912; c=relaxed/simple;
	bh=m8PE0Ao4WRx/H2WOewQ9aHMuNA0GeHCpZJkIhSog3TA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GahLSG67xQDTD2rk/aHmsaeT43yYzVeb492mkZjBIlE1ESJMgD9p3pI0vbeTJPVd8aFdkttETihguyIWpI79OVOKC5Vs6g9f2KBu5IcfV+jqGzEzW/WjnWltXeZvZVhYn8ucAZrpNpbR0QpPreNboupUWHbwY8n3akppNfroxCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ODesHhpR; arc=fail smtp.client-ip=52.103.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTCVDNy6earVKvpFAC2XhrdexqKD2ghgPsE3DhDCx+mCzDfmrd26ca1pbBWAZkmELqMTcJSdK6kR5ctadAvjBdMWGrA/oOi7/Z8Kppv0GMIDwlJE4SuYEOpHyamzenkDxffHI0ZH2H4pAXZPDRLQiIc/wo1Jej5HQpXUJfrd3KWqv7CqMPm+lXA0WYTzVQ9H0nMR0OTkhqJq1NEjl9bd5pUzUvein+gWqhgEPNH7JgMQz/SoFTyOsr6kPqrN4d5FKxifEa+msfpcvhe/FU7sdZ2sNqIjalrwOriDXCm9zphPFhmYaTTEKx9AxSvl0PI0nrtN5QhqP+HpibBR/ep+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60DMICABaJsGu37LQE5AZEoLxZoOlHFi5JYbCWzVv7s=;
 b=mvWAGxd9Y2fpogFpzqPW3mii97MECBAXdM/ddyKitFZuVYGE+wQdeqGGJMzLfafD3iLEdjK22aRYSGgxnJbh1hRBLQ38P0lCq8UfhQAUnl4Jkp9KOqh3EwXHuPQNKJ25L+QB9tfXqP/D4FTLU1U2Zy1rhm/T5jt6aB3sN3uiiS+Mgmirh2GXn9Ma1UsSeI4SqINl9rMcaeBoJvrBTOdXL6ouIc+4yHIakvjTjrgE82CY3Z3UAItO7VuSNf3y2bnWJok1ymWdY3d6jhJtd1jwSJh/4xq+1hlS528Scy5AwhQbW+yeinXe/iXHMWHQ+ki9NwHc5hnoc6Z7nTBKqcZstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60DMICABaJsGu37LQE5AZEoLxZoOlHFi5JYbCWzVv7s=;
 b=ODesHhpRU6Q7QI0dASv+SbwQvGzWJmwL1gx9A7LkBRcs0NlpGxAOD8cSqoShce6nDyoAGCTn8QJ8f4cYLcA4bHz5F+7VdfR6l2eGIg6ryrJ9RfjZoRc9Tcpagvw5tQ9o75KqoxdCLWnfWvlSHs8pJT6Uc5vOBnxWLhTtTvDRE+HX2/R5PfM1YDfvIe3/pUGHsUKrQSH0dB2eVRpLyFa7A+RxPq/rR7BJWKw+sLFsAP+tI3o82ajZ0+ANTJ7VHrwf3MqnXa+3ie+BmNvRZ6KkG9htJs7VU0ncj/fz0SyfFAGntVLyEXy6bCUwiY8Rnn+m189TK6a+cY/5hGW0ksR3Ng==
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a7::7)
 by MA0PR01MB7410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Mon, 3 Feb
 2025 16:58:25 +0000
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b]) by MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 16:58:25 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, "jkosina@suse.cz"
	<jkosina@suse.cz>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v2 0/4] Touch Bar driver for Apple Macs with T2
 Security Chip
Thread-Topic: [PATCH RESEND v2 0/4] Touch Bar driver for Apple Macs with T2
 Security Chip
Thread-Index: AQHbdlzWYg3mSlqsOEGAqkkEZH9xKg==
Date: Mon, 3 Feb 2025 16:58:24 +0000
Message-ID: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8280:EE_|MA0PR01MB7410:EE_
x-ms-office365-filtering-correlation-id: cb14467d-81c8-41e2-136b-08dd4473f94b
x-microsoft-antispam:
 BCL:0;ARA:14566002|8022599003|461199028|15080799006|7092599003|8060799006|19110799003|8062599003|102099032|3412199025|440099028|21061999003|12071999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rFv617l/bdDp/PRtiMdLSXfzCLg9BU6/XZW6QRrdfqkLK8GebLPrJXaXpZ?=
 =?iso-8859-1?Q?3Z47pbAzqTH4wYMUzjM3pGt4V8lzq5YXmQR5gnKDKBJf5l3yazz3GgQPXq?=
 =?iso-8859-1?Q?ZL1uOqOPRbiorGtJe2QJ5bc6Dum2wWhJQM/PaJ7aEhVy3aLdJZkPfmdbf5?=
 =?iso-8859-1?Q?I7Mm33idte37qHXcbqUcsF0J7txbo5AMMgi8z3mdtGzrgIXe/zYg3GDqpg?=
 =?iso-8859-1?Q?RiZiaUxdiSQ5oyTIfF2wcAa+MDuZS9GPx1r5MOyDzZNd6VUH87cJbZ8wFh?=
 =?iso-8859-1?Q?F0WbUsZFhhUwhyeBcEEaLKYMwBNV+N45MA8a+q9n4KlMgSxYDOmHSgKp9B?=
 =?iso-8859-1?Q?oDjsm2zw6I8ivy/dP1AuDkccpiW/ZXIiI/qfncCSqYJuwLYGJmWOyrnyZz?=
 =?iso-8859-1?Q?ZepqwCeYUOXsNEAA2AMuk9T6V/wWAKvQLheON4cfqTwMyNnWvwD7xzTBxl?=
 =?iso-8859-1?Q?UpCDrR4UrOFguevdaTLdG8p9u0P3nV+OCcF1HvBBY6N11Q3jVP5Dlo7M5P?=
 =?iso-8859-1?Q?MpU4OkGMTYnuWeQXCpQzcRDqUX6igz2AQVtP/8NqXRAcYsThYX8yB8Zh26?=
 =?iso-8859-1?Q?eyw8mme24GJO9mn+QVB6x+094ExHY+JazuwvynW1E9ICXJFtoLUWlsGx9J?=
 =?iso-8859-1?Q?r2BpnhQ/r9ynCcPdY0ZicHLtkX1xnJmfG8gOQZvO74Knyt2lSrzb3l6IlT?=
 =?iso-8859-1?Q?EIOcB4AdSiVGKCFANqjobipVbtp/eJWCW3WTRAHlAj00Omx3Mu7jzqLr+A?=
 =?iso-8859-1?Q?2968qVudBCjYulboPF+1gGKxJ+bx52fs7pqmj4RIWEOqiZhBjq6kIZqnlW?=
 =?iso-8859-1?Q?sK2yy04Nyt6y5oPgjIgUcSJrpGxZvItJAVb+RHeN9pvqloNI3CLDmsPQGy?=
 =?iso-8859-1?Q?s5zlGT6HeBir/s/8D5R9kwKqxqj6qMtfKNTOr9aN/Bn5rYT8BaKt3ljuQa?=
 =?iso-8859-1?Q?fX0T4V6v8qWhMprNfs4UztzkSoLmBpdOGC7mtlEUqAnjMaH5HKB/8atSvx?=
 =?iso-8859-1?Q?90plkt0I5nuSZgZg4JgEhEcZjDxMNogb3X6AR4m3bWEXqgdX4B3v0Hl4yt?=
 =?iso-8859-1?Q?XLJkC8wnraplfq34X3UQFX6BMcFio/agmc7KOv/+kLmRzt1L926k/Ju6r3?=
 =?iso-8859-1?Q?huzDFkKjEegPeyPoYhNW58Bcw+wGlvE0Ji1jrIT/ZnGtKpdrjts8NjdWWy?=
 =?iso-8859-1?Q?w/TC2bxFZE4/UKlE4MoY1aAI0zRSXoq7q2A=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yHI3ZvDCBQlJjbbeDyL4O6AX94v4VTZIl9UH/+8OfruGnjTYXY2VDjcWED?=
 =?iso-8859-1?Q?zDZtY2nFGP6Ab/2jnRO66G4sfTIbJuXwIkNzSJ/5QDGieLm4zMXhjxMPtj?=
 =?iso-8859-1?Q?5Egie5zOWjGsfmC04onUIUUrUA/dUR7gIznj1Wgpjrm2vhylAMcZPLXWis?=
 =?iso-8859-1?Q?me4zPLmOHgdsTDaFsf4TEO8VizRlUsjneUJXdPRVfjndzfI05LDucOXsXT?=
 =?iso-8859-1?Q?tHu8X92NQfc4STlxVZABi2ZbiUvfaA2T0uersyF7NhW6CS8ek1JHNjYxLl?=
 =?iso-8859-1?Q?lPjYmy4XSVEgWWAIWG53revqNaDATfBbo3/tSUJmFaUjDV/3NJpYUeZ4Lr?=
 =?iso-8859-1?Q?HB1FqM65vK5Pd/4h8kI3eW/4cu5Bqknq2nSd4arjgEn2XlVZ3vmizkddpy?=
 =?iso-8859-1?Q?+FqAgnGIVrrWulUCPIAbsXDkPfmFFtqA1W/QuPEiaGD3pYz4sgbXowCIsD?=
 =?iso-8859-1?Q?Rvi2NDZRkPkDIzZ+ztoWLOIy0ueu+w6FHuDJiosM1hAYZrWbWritOjp+He?=
 =?iso-8859-1?Q?9NouN/cTQFTxLNRbFHenzkgf/swGCB8MY31SMPI4Cd/xY9pJDnGv5t2XnU?=
 =?iso-8859-1?Q?+JmEKhWptes6I0CnEc/VCRejd9R8cBao/8/y7JJ7JbQ/ZCkLRtn1BrTj4H?=
 =?iso-8859-1?Q?qRWqYVpltBezxPhn51jj8lyfxU0ysa3y1lZvQI/SlgD8mjPabScdPthVKO?=
 =?iso-8859-1?Q?k4dD0uzWHWnvl7qUcUPbpWYRZtotG+2bYBGvTSGSir5bI4dWMH7mKxYgGv?=
 =?iso-8859-1?Q?3il/hZ9hH0UOQigN+wyuDvAC31Oooz+XTAPndhbFAfI+v+W4w/l1E66ipy?=
 =?iso-8859-1?Q?LCZgSSWkGkanpGzvqWR2jBd0IvcnCZB7MOjXGhnlw/nzoDSwH6Flmd0+qV?=
 =?iso-8859-1?Q?IGzzKjeUZIyVXv1654d3PBcujyYN/v/Gc4pwC99QtxExjiLpGPqmBQK7XK?=
 =?iso-8859-1?Q?KV8ItNqtj5U4oXuD2ejhSgzHy5k+5PsQpNR73+n+Gt3nrpUw62q+WpMWnV?=
 =?iso-8859-1?Q?7YbQGWI2QGLb89QlO309n/ftVby1gZD85bfTz+82o46e4U2nQ7wOWXJh3s?=
 =?iso-8859-1?Q?d3tp5GRfUfRN41T4O7+VdFQzj8hUvBfHrwN5RJ6v6zDT1E7Nl4Y6YEpuVx?=
 =?iso-8859-1?Q?a3DfpNG5uqw5duK0pz/6FEvcym3MCK9HWv9qDrEXS10tLTwNHC+QOlufkY?=
 =?iso-8859-1?Q?TF+z64/QlP2JDLSQ8nSKhoTRs8m1E5cPN3j4juxW7+/gbWCnH49ThcIb0p?=
 =?iso-8859-1?Q?7zHDCtF2h7akdGQvL2VFg36AUP/8glZtrhtOHys/M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BB7FA7372E86B84F9E25857A83CFB662@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cb14467d-81c8-41e2-136b-08dd4473f94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 16:58:25.0312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7410

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


