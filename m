Return-Path: <linux-input+bounces-8814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C39FDE3E
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 10:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 203E51882221
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 09:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5D254740;
	Sun, 29 Dec 2024 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Df5OIzQJ"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011034.outbound.protection.outlook.com [52.103.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F1282F1;
	Sun, 29 Dec 2024 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735465321; cv=fail; b=IF0hsySwH9hvcUvYIqva8NkZNpfmTdK5gmepel6Bi1NhdDbi3s7G9xhzdI8PIHGYu3yCdXgP/UV9smMwoDUe0rRej6J9+m6wb0Uy3dpGAaMauckEWqd3SGVV3EQ3jpPiW0AMUasF74o1hq1UQd765/kJofcVdxMy33hEe37Iz48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735465321; c=relaxed/simple;
	bh=bmVi6iXFn15LgfIRY5Vpm5cJ4zGp6iMPMy0RkFvsnh4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IwF8QysTnmsD8kryK5d4g3NT1t2+qmyu6hvlq8uaYoyDu+1AtAqPzKQvTKsidQua09tjRy5bgSH0NPPbVqNq77VpZv86py/ENS3fIv2U8SrRgRruDw/VOVa9//jf3YE/Ek9foByAKXhhPOIMDMpbbEni+soxC/AI00LIqXNx7mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Df5OIzQJ; arc=fail smtp.client-ip=52.103.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vzs3tFRS0NLSAZ4sp190B7175on6TMaylKxKSJlzbBrpPRHFb+Yd6X0+vCmdhINZvL/RYZjBRRj++HSiUWkUC8dt/Lbn4KVPyayDqk8LBJmxLYuYMoCIVXddHH/W6puD4NmYBtxouAWxjn5MvM2au9nNSqcNIzBhLyDYL8f1kDjmr9kC+Xzg4ItKzsXoVsUW/pLNIA4zyCr16qNZypARaWWoaBAM4Og7H/7lIrU1burEBIymNIUQ/bujZWxDgvtVQ4qywl7G5i5+6+L4m/T1skMScMOb1p0o7QGcKMNd1gtFcFM//fku+uXTTYvIrbi44gcNgPnTjn/Y+8dRdKl3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIzGULiPgk6+Xf9kZJHfHM/bVjRIU+tPDWrlEqBBHAU=;
 b=P+vXXFjBS7/meZ9nqoZUTQweTB7IRk5RXiswRmAvebbw+zrlnERy1mr4PPm+5COJH4lO9X6TH6bEZV+BniAPKct5FjI42pfa5im1Jx48CZMY+vDlUnooeZtF1CVrNhs2XZ4th8ZTVRacvvC5VWo8eyL0hrTkbDmXuimwY9b0ff5AH8vtGgJxUxqTM6uwYfkG3Z+h+zS6FZZU8gV2smjdgrfaMWv7YC2fif0u2ADNYhh5wxFPo4WiXMiNmU2YD2Y8ojhYdWecb/JmRnpB1kYMETP0hgSNV8P2TB+OH/YJBzsqQZ0Kx3NWjiUhgF6ZXgfqVfeQLVwQMaPYVWI6R0lHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIzGULiPgk6+Xf9kZJHfHM/bVjRIU+tPDWrlEqBBHAU=;
 b=Df5OIzQJtvX87aIJv5TVrA9remEwnNq8SBHaS7Ph96Ql7AwA2BAxqBCqe4Om2hn+4TjR5ymNVQdTj+FgTu7VfaJXen1O+6QQflCMNqMpLhEb3RQBUWnLOl9swlF1nzxSg4Gv7W1/Z9WCtsLb0643RDxxc7cpiHfAbTkkhgt65AhWM1cd4pk1VsTx9j5nDhRWWsxoPSinx4NaT6fy7TrTrGroCJkFc/oGnF5GG99HLw+SlWhwwybzpk0wbCHIehtnBA8JEwPPRggyfFpwgwKMYQmGiQT3QGNq1q8h3hQnK5KB1YLalzW3pj6Z99JZsmnCOODkChN3/P+58Ysi0kPxmg==
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:cd::12)
 by MAZPR01MB6846.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Sun, 29 Dec
 2024 09:41:55 +0000
Received: from PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06]) by PN3PR01MB7728.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b7:2498:cd95:5d06%3]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 09:41:55 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "jikos@kernel.org" <jikos@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] Touch Bar driver for Apple Macs with T2 Security Chip
Thread-Topic: [PATCH 0/4] Touch Bar driver for Apple Macs with T2 Security
 Chip
Thread-Index: AQHbWdXlSGAM/7uaaESii9DbXkWdrA==
Date: Sun, 29 Dec 2024 09:41:55 +0000
Message-ID: <793F0F3B-D51C-49C8-9236-124CF130E833@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7728:EE_|MAZPR01MB6846:EE_
x-ms-office365-filtering-correlation-id: 7b2f324e-c44a-4132-231d-08dd27ed0800
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|461199028|8062599003|15080799006|7092599003|8022599003|8060799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZxnBPSUHS4FAaO7NjMpw8Af7krjITPhp7BNyLzIzHoKxuZQTiD6Z/varPiCb?=
 =?us-ascii?Q?JagtHhD9RSI2how4hIwuqtEFwXs/Lvt883gH4d8xSBAfTP0uw5IFTaoUFQMj?=
 =?us-ascii?Q?Rnxnx/Qqsgmd2QAqpvjB0DNqO4WjW99xxz6FXL833jXOSfT/ln45DeIPQHRW?=
 =?us-ascii?Q?D4AXb7HvawDa3BvIHY7WjOhtglmL2Zi0ycOxtvaODKUH9/bTQXSbEnQxnk61?=
 =?us-ascii?Q?rpTdl9H68O43LTeWg2oq70j3q6ZPekVmUENZlzet3dp7gHy4RUMZNCRcQiKh?=
 =?us-ascii?Q?MyOhoJwIkAvRhD8b6OMQlT6NBLamuzRU6Py/WBCuHs4uGb2ZonfGHAtukQIj?=
 =?us-ascii?Q?nGzTbAXkkI+IZEoxomecQ/YLAmCX6yqg5OA45ftkry1hvAt0oTewPNf59jcQ?=
 =?us-ascii?Q?x3YEQ8Vcw0N6GDNTUIW0klIFBVNYUgcj4cy+hT8hie5ukV/Avfy+sTk5sxMU?=
 =?us-ascii?Q?CdJfFvDaHYhQBoujhs0XOO7b8cSkVCD97YwnzqD3lYS/EwuRBP66hIrK7L36?=
 =?us-ascii?Q?XYBezN2+Uth0vT9sjtrh8HYUjZCc84+AwC8btuKOtTH2qUmoNMLMcl5AxJzK?=
 =?us-ascii?Q?F6hK+HvfGAQN1L00dS41dJU4ZV0Ca7f4fVeJJRRRNuMi59vtMEBb/zeWay9i?=
 =?us-ascii?Q?rjMP7/EOM2LAH0d3SyuTZcsRO4oLCA0VaIJYG5HghDPypinkQMUGL6SEZR13?=
 =?us-ascii?Q?iyvlbS4nF+LLI/mOM5g4GHImB0Ye7D7dFMQmD9kCa++fatGjGNWEQakipm9m?=
 =?us-ascii?Q?V/auGB4Ycy7Zh2Mx3QJ+9Y6vkmvnJOVXgaPGR6DC6DB7Ce8hDmTB5IU6PZ+4?=
 =?us-ascii?Q?AuiJviNTsVnSbQoLrN9L7KRwaQya/W1zeqtWFSptV3npG46qm9OZWfDdcz1c?=
 =?us-ascii?Q?76GV3xO2Ct9jdJw8wSUuS1Bmy8EYYvBFT8Kn46864zJnzKi6Osq6WL+ILDaC?=
 =?us-ascii?Q?OzIFiufz1bvGdiXHT7vG05lQEeHBC1ynxgoO6yRXXuhtl5Os7+V6D4ZTG4kA?=
 =?us-ascii?Q?lG6Sr6x1xHS4Sogk9VtWcsbMPQ6luw56wXbKS8tamPIXaexOVQxd8cDsEQxu?=
 =?us-ascii?Q?yrDSSQb5Qop7hdM8qnn6JEA4B+3047IJS9sYGzMZu5ZCUPVdVcE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kzCWYEuHtDzfx5BzsoQl3uR5RSecO7ewSlGuRbVAha1IS/Owt723sGMhFAdx?=
 =?us-ascii?Q?AuBlpTUtPXiW6wuzNT70HqYEfmXlr3DqsBWXqRv/1OJ7QYxGXgB8DyCyTfjb?=
 =?us-ascii?Q?YCzHqHJgqof4I313TitRjbF2rxt08QVjBgWoM9uxrYd0wZvLHd1LLUetpsmh?=
 =?us-ascii?Q?zXYxEiRVge4PLJ2VdswnjlAqXVgENTrV9NefF6Qh62bjd3rWArdKATBnjmAC?=
 =?us-ascii?Q?AZ2Aw1mMQ1xxPaqGYti997i5Dh7PyXl2CoWqQMzjUrmSjXb7PMZMBHZmlwE2?=
 =?us-ascii?Q?bzfji6fyhLzv8DNGcpRYv/fzP7XsrDryOuuy0/QTWcpyDoWG7xom+7zzhhwv?=
 =?us-ascii?Q?kYYBL7miKUVnXiYfORcmvB3jl6XuHl7r4i/SvW5WjAW03g9WvSvvrd3v2rjs?=
 =?us-ascii?Q?4nwDDHAWbTiA86uAigGnMXXlkSXhyObBWwqLwnMlBNmYRReSr3T0vBR0l+iK?=
 =?us-ascii?Q?WeoI4+p1YmNC1nrDs4h4LCYwuaBHJc/Ubij80xiI72mKwS8gmW7BgNhtzUUn?=
 =?us-ascii?Q?F4/zilOazGhqDDXDx2BbDi9rHYuvVL8HCJGSAKDZnLDzDZDFB6f0fnmkr16m?=
 =?us-ascii?Q?NfweqzSG1nUaXIwSM9eiAjosIEIwCLM3Nw2QuJ/V4SjsnZ5QuwNZCtgBqWp5?=
 =?us-ascii?Q?ePQS7cke9UZa+kRrd0werJKBazYI3c7CLnAkN3DcGdNxzmQ7yWdRlxb21/C9?=
 =?us-ascii?Q?jJSMziaUZ3+4NCDYoWWekhU7gKXIFNEhgjBHTeZIIntB1wMG75RQjnLOvtS1?=
 =?us-ascii?Q?qNuGQlZAR4ExBG5a7UqLuOGnqdwjcIt0sBGMqTmdopsBpbkDzJVtWzjShxTB?=
 =?us-ascii?Q?6c1giUwwUWTCMI6jD49m6fHXWCEGwX/MS1Pc2Cm5HU7fx1uIOwqGAbQAbHPV?=
 =?us-ascii?Q?DKbCwIUp+fNkZ07I5mm74haspsTjbbKzffmPsCD4jKzhMOKZEsNVu9hBZDVw?=
 =?us-ascii?Q?R4tW+ASUN/q5D4KJvDjD+2p/Z0dsgaWTcNZ4XdM8aDCpzTR2JsZJczr8CVdt?=
 =?us-ascii?Q?T7Qpavjns7rQzJcrkuI3ivTNK/qK0Wd0K6Lv8zsqi9JcMGiH6em/KNZPfEg8?=
 =?us-ascii?Q?BU14LFGA5J7n6RYCuFJoGBDBaH7BJKemCwt7Ng5sSn9igIFnh+JOGYF76OjX?=
 =?us-ascii?Q?x0nzpJgFggv11xSsibsrusyFyfvsuvZJ9EumH+moFX6fBKthvkX6wHGC7ULa?=
 =?us-ascii?Q?7Z+6ghsOpUfe7N8SDRALSHvvLmueLjA+bhp3wkuDay7ob8LcN7wxWvbjiobP?=
 =?us-ascii?Q?Q9hLtcLZ1o+vVw0Mpv5nVG9WAYEVepVuh6XlMhzQkEfD565IllNwFktcIs9Y?=
 =?us-ascii?Q?ALlyNiy2gqdHoran5AyE6jf4?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D4F5BADCD92E9478A64E8E6667403AA@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2f324e-c44a-4132-231d-08dd27ed0800
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2024 09:41:55.1215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6846

From: Aditya Garg <gargaditya08@live.com>

This patch series adds support for Touch Bar on found on MacBook Pro
models with T2 Security Chip. These drivers support the mode found on
Windows Bootcamp drivers.

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
 drivers/hid/Kconfig                           |  24 +
 drivers/hid/Makefile                          |   2 +
 drivers/hid/hid-appletb-bl.c                  | 207 +++++++
 drivers/hid/hid-appletb-kbd.c                 | 503 ++++++++++++++++++
 drivers/hid/hid-quirks.c                      |   8 +-
 6 files changed, 755 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0


