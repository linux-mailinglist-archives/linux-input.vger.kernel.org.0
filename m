Return-Path: <linux-input+bounces-10087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00863A37AA0
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219AF3ACDE3
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 04:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2306B14D43D;
	Mon, 17 Feb 2025 04:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="dljL2xg8"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010014.outbound.protection.outlook.com [52.103.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A933E7;
	Mon, 17 Feb 2025 04:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739767571; cv=fail; b=VXnvW2GLJoMe6MJg++jnvHn9cFqCrO8MROANYVUwsDWdGID7SuBhv2wnXwfcmC8XNVOckwjWhKaOG6rTN+4Ym4YCQPJR6qL5jnekW09C1F4O+aAAJOai/M0r1w5cRHN6yPg8F0asZIv4E0MF1qoi7lVv/sRuSrgKV11mW6bOhsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739767571; c=relaxed/simple;
	bh=+VtLlWv+YwI/aimC78OdPDfFn3BDbMX0HN5xNe+Z+IM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jYqzfbTVCIAECrUBtxV/gs3DqujwbxBq8YVUkAEAIpvvFZ596GvaJyTJVOUbbD1asFpM3Q73rWOwem2wOIr1JNNm+ZfpONexclRv8jWvZ1+R0SFMuJYM7+9s6WzE0yoKygfY0ti71sW7WE2sSi2rEchUOFI5RDDQ8GDyyfedzFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=dljL2xg8; arc=fail smtp.client-ip=52.103.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2/KdwA9Pz/Q4aUIQhc/MuL4PyrSh8iCLZxSpvKe5HvROCIBqMl6WhRdB2m2ZEJA3w3X59kkZh6V9cqQqR4f0d2mk+27JCaAfUv+inYuf7albXLovPKWwWxzxDjImSC/hxlhVZFdtda/lIRGHxoi/BtGR81HtNXF3y6eUSFx2GIMq3vDcGXNDmNv7iQGCo6S3kxT8do1TuouM7WtJ2n2Pi/wgtLMxY3NxtidVtl6Scd/nPk5wWyRhvqM/psnDGC5AJO8rVCGtezmeCPD0loKc/BYuVT6NEayM2sR5x4aC36WNB+1iZSfQ8RFpIMF+3hQnDX4X/fGkl4vl2QlhcHYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QZKEjEKBo8oYsc7+EbtlMnsVJbLMOrMAibEg3sso4w=;
 b=DD5ffCxVV+YuJebxqyPBUFoMEU+dKnp9cb1R5B2m0/mv++vPxvE1jU8bbfgjd3gYDoOv2kQKMZFet3WEzqYSCUdWhGoeyGDM5m3gsrJzU/TnhFfY16OErX+nXU1rFGU+7LxT4C0WF3Da3zBuStTfluv53tJN1RZ6ajJucMsadAyTV1xt7XkUcVBLl3AQfD1SpVvkRumnphYNOPDOPo9N9a07KzonK36q0cScQVh8/X/22x9gWmg7iaOAl2BbPC+uF0sbJpIos5fKXTvdADq1WkP0YjjoE2ktZhwwM7vzXVAbBnQRJay1JQ+y84oi95AtfVjLGm+9Xov3vLzSLlekDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QZKEjEKBo8oYsc7+EbtlMnsVJbLMOrMAibEg3sso4w=;
 b=dljL2xg8f/uJH+UDF9uyoWTxPhZwlfSrNkpiRwCjBopbeR0SO0NkGaZXLZUHjUsSC01GBKAVVdx47lvksTbcRyHW6pGktvxgROTaECatd/YWAw6ncFHd/dwOPcY92KhuIlibkQhVjmxbxCE7NAxmeqH6hE1Q85zIp1PL7pPPxQJ60sT6EREz5L04BPIOIAUOJsJZmDtfbo8vxj3yUZOziVrdj+dvRAetz6IvHRTiTYjDG6GL8mm5kfpHgrzx61oPvE/+HzGUmMa7WnQqdfd9pXomfEwzpgo0ex/KWO3J+HcT6cWQjWPhov7SqWDwb31FfUsIRI+S9DSGXuBDvNQAgg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN3PR01MB7015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:46:05 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 04:46:05 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/3] HID: appletb-kbd: Fix inconsistent indentation and
 pass -ENODEV to dev_err_probe
Thread-Topic: [PATCH v4 3/3] HID: appletb-kbd: Fix inconsistent indentation
 and pass -ENODEV to dev_err_probe
Thread-Index: AQHbgPbauH2mSAtX0k+7dZzv5BNdGQ==
Date: Mon, 17 Feb 2025 04:46:05 +0000
Message-ID: <25CD58FB-ED22-4CBC-8166-7340D1E1B4B1@live.com>
References: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
In-Reply-To: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN3PR01MB7015:EE_
x-ms-office365-filtering-correlation-id: d7942f7c-67c8-442b-57e2-08dd4f0dfd1e
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|7092599003|8060799006|461199028|15080799006|19061999003|4302099013|440099028|3412199025|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V1+4Rtjj1ztnv+KsArv26dWUrt6YvTWBlMhfWQPZ27m1yCHfhM3JtnVd2KAu?=
 =?us-ascii?Q?ederoCMbozMUr85dQvqCdMBcr5yxFGdILUIzIBi7fauZticICeK17w2OXnyF?=
 =?us-ascii?Q?a+FbOwaM8sxlqWkkIB6eMzHhf7MwgohzpHtfBQIWg6vkITlZ7jtH+qfMu1SG?=
 =?us-ascii?Q?y6Yzg4qk1VbQUCVouNGZZz5lhgx8gXOmHQRoweYQGywg3JComERNk42EnJw9?=
 =?us-ascii?Q?e44bIMPgB8b0LNKRW8auGbnuPGUjiaav06MYVkKkZNIIuXMVw3KKS+IEzc60?=
 =?us-ascii?Q?dQOPhJnVkWfwdM2+6qBH6G5/xKOOKrtpZ3b6rhwzfNDdcVKbYyr+GKYFgVPN?=
 =?us-ascii?Q?uaZiJ0QxpXEdeLYAuO3MzfLStMKb1R1eoIl5TUG0otj7NHB27cpMhmuYMl5o?=
 =?us-ascii?Q?sNzFUeFydXNO9D5NwYZORJgAiZHE5iT8DEeIO/I/eDahzEJ/lSxESLSOhqet?=
 =?us-ascii?Q?eblq6kBwgPK1ShhCzgyMwJtZfQI8LOyEsXHOLtOlUAIxB8vAcKCVKg32yIDe?=
 =?us-ascii?Q?/MTVU5GERB8R7DIevQMfhw+eEqtwY5ihhJCkbGJjEsIrbuswRC3g7Vf51tw2?=
 =?us-ascii?Q?FFTVCH1LvAh2/hFMCe2JqKSHQRxAeUOH2pkJAVxCQTfKb44WRm5DPgqgne14?=
 =?us-ascii?Q?LLzEdoq47GZtw86USEQTkSzx0hktQRiFSWLyxiQrT0yfgJtYqMZVKaTEDB1o?=
 =?us-ascii?Q?ej5wxQ+AmI/lr0S2OgixgoHMkFhdhqGTevAKGp7UrXBt+BAsvfFHEnJR9ndy?=
 =?us-ascii?Q?UTm1azNwlqHoFwi+i2e+lgjlDfYz69enMzLsM5Y4wvn06Hr7bkhE/LQJqYNZ?=
 =?us-ascii?Q?pmtqZIY83mV5EMvwlzBRcDekQamukxNDA0SjJ5k33WNhbRb6y2imlg6Jalz5?=
 =?us-ascii?Q?e2R+jx7u3Hsjgkv4L4Vw+NB2S99HEQQBUGQiAEKQrXxBW0UzR0W6pVV+aEU7?=
 =?us-ascii?Q?RrEoVtAJ01yOUIQygpQr7PbYj9UkQ3sCdXjf2QtE7vpcqIhnel2hrNDAApf5?=
 =?us-ascii?Q?DU6AETu8Hk8rW5vgjyJ2eh6cT6s0lHnog+p04gh97RYhR8/37VO06AxVDUwf?=
 =?us-ascii?Q?Zz8n7FeECy+nnbaZYculAf576psiq8CM2fVvLKGYquEqt6z8KZw+7aO9KPdW?=
 =?us-ascii?Q?F7S9Qnrkopc70Umj0fvnNO733hbsjQ8liX66NybAklPMOZHCwtPC9GMteWQa?=
 =?us-ascii?Q?isca/n7jH3JMq/zvGuAKNuqrGFfAl943RJD62C0ygam/3LBVhq78cZ0+CRv5?=
 =?us-ascii?Q?pOImA3oW49PzHUsPQct/1U3vv0l9GsA12FZLuZKdJA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iIgKjXuB94vCJVkHVqM9JjjUaJ2nrznZ92qKzl/h6LfqwOi8JLIfQW6PWDyK?=
 =?us-ascii?Q?wrLvazC2l6e3nBQ0jU8n6tvH1/M4U9V0VB5d8sOufM5eaX/cBn9YQBXkfy/Q?=
 =?us-ascii?Q?UneIqdHBUz6o+eInHXRCfK8XqxDkDDJdw5JRFyfYhpXTM3+O44X9uTUr5M42?=
 =?us-ascii?Q?6i6zGXu9qHPBXWD75T2sLB1psLb1kSt4trHglPneMnIK7Pq55u3TpXLoiEZC?=
 =?us-ascii?Q?akP3BhgfSaaq4RBGYoMAy9XYyasyL/T3cbVTdMmHXzy09VEpqoNSXB3/MhJ2?=
 =?us-ascii?Q?hbPO6ARbEtZe8dQ266xsQr0brkRWFEsrwbVS6pzYK4zRiuWibM4QZ/T5TEpx?=
 =?us-ascii?Q?AoSNUhbTs/1uzsK8/vhfs0edKubVleLBXkpmraGqXkr1fyAIhlvP1j4vjKH0?=
 =?us-ascii?Q?/UfqD/hA/3f8upeF69zNYIGG0QL1KFx1FhEdvO3wbZQfJDXoX0yDzPge38Zp?=
 =?us-ascii?Q?IDeXyRQUSoi+Q1vHLgT67qK5v3xIvLKXG2T7+qtzMgzmfQh9lCHlKvaGMYWR?=
 =?us-ascii?Q?cHNxaJZwDFnIe4/YB+Xo+1U6hg8I0S4Q9Xhfa2wwGZz/Onh4VlFUt5N238fM?=
 =?us-ascii?Q?RVXlikJ5H/p4fVhUpM84YuO28Rr8G/M9r51pNd3nISX+WU0jiCwS/CxMQJnJ?=
 =?us-ascii?Q?2PTqNZUOuKNX+WzsNN+0RbpH0YyBI4dIM0h0YcmeXUc81FYHsdPjZquHZLNm?=
 =?us-ascii?Q?kTr6FkcfzQGXrxkBLVIAHMrDLkG3JXO2C4rpzVGwtC9pHRzn0vyPFwfnqg5o?=
 =?us-ascii?Q?T0LYGJMKaMD/XCyNQK34KA2NWI2j57UbI+2fktfsdjn4bBwfZDJAcm4ODY9B?=
 =?us-ascii?Q?xRi4OqNYDcg0mrwLxUvnQqFfMboF3oIQfiHEO6pejbcOujMVhQ9wEwvbmIYu?=
 =?us-ascii?Q?GphvQLxFZYyJyByK4789smFVcslCkhqgmS0oUBnV+QI8aI8U8IEDb+FOFw9L?=
 =?us-ascii?Q?U39pQX+ipB/YnsM42rgjX+tukDlYY5Bpm0s6i5IQqd/H7/DJ1fjXtTuwAVlY?=
 =?us-ascii?Q?yh0SLGW6Trdj28ZYiwTEsZ8Ld8fBhe6+SFsYiTJ0GVgpdux/dmYyiSBN/hZy?=
 =?us-ascii?Q?PoEz9Ic8BVlwhfMxFfUshNvu02Wa+MhAi4VgePIslMJlskpjTiG2Ays4vGHv?=
 =?us-ascii?Q?SEJVsJiyjMH+bfoGUw1GYMZPt22PfvNd3Z9Ye9rQKRO0FtX4tAc0lbPNIAgL?=
 =?us-ascii?Q?VTo3W+W7J+0f5IiP6SzdSi27jSA+yoboQXPtztzRJ9uUZeAOASC1wL8fBGyg?=
 =?us-ascii?Q?Uz4pMXFNp3Gd0PALBvGmcxSgw9o3cut505vWTHsngecZwm968Q4dRtcM9mP2?=
 =?us-ascii?Q?nZu55jb0v2IIuyMN5aeLZWt0?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FAD119E17DC02244AD0AF1660C89C743@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d7942f7c-67c8-442b-57e2-08dd4f0dfd1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:46:05.6059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7015

From: Aditya Garg <gargaditya08@live.com>

The following warnings were flagged by the kernel test robot:

drivers/hid/hid-appletb-kbd.c:405 appletb_kbd_probe() warn: inconsistent in=
denting
drivers/hid/hid-appletb-kbd.c:406 appletb_kbd_probe() warn: passing zero to=
 'dev_err_probe'

This patch aims at fixing those warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502152006.fBBCdEr3-lkp@int=
el.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-input/6263a1a2-4d50-41db-aa54-cfcb3e0=
523a4@stanley.mountain/
Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brigh=
tness control while using the touchbar")
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-appletb-kbd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index e45cc3ac4..d4b95aa3e 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -402,13 +402,13 @@ static int appletb_kbd_probe(struct hid_device *hdev,=
 const struct hid_device_id
 	}
=20
 	kbd->backlight_dev =3D backlight_device_get_by_name("appletb_backlight");
-		if (!kbd->backlight_dev)
-			dev_err_probe(dev, ret, "Failed to get backlight device\n");
-		else {
-			backlight_device_set_brightness(kbd->backlight_dev, 2);
-			timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
-			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb=
_dim_timeout * 1000));
-		}
+	if (!kbd->backlight_dev) {
+		dev_err_probe(dev, -ENODEV, "Failed to get backlight device\n");
+	} else {
+		backlight_device_set_brightness(kbd->backlight_dev, 2);
+		timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
+		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_=
dim_timeout * 1000));
+	}
=20
 	kbd->inp_handler.event =3D appletb_kbd_inp_event;
 	kbd->inp_handler.connect =3D appletb_kbd_inp_connect;
--=20
2.43.0


