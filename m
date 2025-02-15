Return-Path: <linux-input+bounces-10073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D5A3702B
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 19:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADF4C3ACCE5
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6B81DF964;
	Sat, 15 Feb 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="t1B2Z2uB"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010013.outbound.protection.outlook.com [52.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB7E2904;
	Sat, 15 Feb 2025 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739644845; cv=fail; b=OXCMtXBpH9YWArDNjyb+mfEXmo9mb94sJDz2uBcdUIRx260E36vlXuoPp19QJPBl6n7b26ek4qINP/SnGi8VjgZLZbHVrMjXMggNR/5bozwpHHQbvrCPwE5VCAGMijiAa/9/ZK81OEUyxmdnmEItGFLN7P6+A/xSod195UY/IjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739644845; c=relaxed/simple;
	bh=EI1iUBfX+9thqSUzPCI7BTTksSpt3IlZH59T2DrPIHA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W0V/QQJxGwnn9byMyD8sewcur/5VaVYkbZIPFsANCxK9l17HqHSR7pB13DdlztQLZ+/Uv75CurDqQAk0NetgcYZBTKp3yuFiomU6xNLV1G2UCoqfDFXQq63K5SjZc3VrYYETk+qQcLOOYxJrAnXPFCJsOxjBzdFtghjhJgrACzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=t1B2Z2uB; arc=fail smtp.client-ip=52.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkkCReYF5Yv8iH7QR8CksP5LqKQde6GrgCeunT0Fec3S2FqW+BZzkmYfDy3ARaf/0WwjSiJzk2AA09BtAnSE/yV6+WTqrZ5Aawb8hlUULxad127FohDg5n+5kS7Ubg34c5h13HS6AKrJisV4pOkyots72R62Wdo3qvv84v2cSs5x0TWHD3S5fatCeHmCC7cQ3BpOQYGJKDzVDVc/6LeB9Lia+Z2eYWprpYv44Mx/8g9skdI+Yos9/dHxg9yqI1JYZn4rL4glI0isugFc191dbauL/jN7dvCjKvDar7c4m0rH7/qwXTTujq0t/pEHzAN3NIdJUniAFUsMKLp3cwteMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz/1wR3VVxY1g8W0ay10UtcVapP6BwDGzQyoX4R/CGw=;
 b=i8PiUBlHvTVTBdGl7lDK5wGFGm6enz3M4uZZF1TSehvZxoplaAmZRbmBMxWqK2XPX8TM4xHBMn4AUxsot/Dur3AfoI98MzzACyzZKYNPk/DWReJwuUaKDQPCHWixE7XJAgsL4unNx55QHjG1WDWyS4pIKJ6JBJ6MXetpjceod5NQuBYlc1GvBTBsBKvNiUzY6mcTiogojY0N13D8r2BXYGH+hvGdTebIjS5s9vJgRGDIyU2RXKdx9WW+sLw5ChssY2TOmvlEdUl/aE5IpEuTZH58XG9WXuc3dhZn+Vvx3i8X24McACF1cV71YZQnYOfktYBapE1rQAtTTY2rTcGNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz/1wR3VVxY1g8W0ay10UtcVapP6BwDGzQyoX4R/CGw=;
 b=t1B2Z2uBfDEshZD9IkwK0mUfbfHmus24t7EmJMPtZpuvVHotAqhP07LWVX5oIqc7Q68FewKyGuCIkqS14rZ+p6TixH7ar08LNU+/Rv27AuASbDK7/FLIWwi98gCDjYe76BjrxW9xfZAU1B4Qs+PoJjdXUftyuXUvF0lz3dExXVGtKP/k+wkJ6vda49/SQVrZPjl8nuD3vmT5PH6m1MNDg7Tiq9P0YJKK9XT6VgH+sxhXGWH4mRyyP19sEGmNbuqo5zUqfRwF88xD8O65SdrVVDxOY9MYGKJoxucxbr24gcx5r3L6u9hDTEyoPSSLowt63CyuynO8wKCqNKrOoHv7jA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MA0PR01MB7817.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 15 Feb
 2025 18:40:39 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.016; Sat, 15 Feb 2025
 18:40:39 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH v3 3/3] HID: appletb-kbd: Fix inconsistent indentation and
 pass -ENODEV to dev_err_probe
Thread-Topic: [PATCH v3 3/3] HID: appletb-kbd: Fix inconsistent indentation
 and pass -ENODEV to dev_err_probe
Thread-Index: AQHbf9kcTTu6+SMmkUul9eC3vJ51Ow==
Date: Sat, 15 Feb 2025 18:40:39 +0000
Message-ID: <21F8BD96-7E20-463A-A997-4FBCF0934D87@live.com>
References: <00768D5D-F9CB-45DA-8F5A-3E21E84A8AA8@live.com>
In-Reply-To: <00768D5D-F9CB-45DA-8F5A-3E21E84A8AA8@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MA0PR01MB7817:EE_
x-ms-office365-filtering-correlation-id: a484bf8d-d29b-406b-d169-08dd4df03ead
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|7092599003|15080799006|19110799003|8060799006|8062599003|102099032|1602099012|19061999003|440099028|3412199025|4302099013|10035399004;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ecm02s7PUFMA2m+jo3ie0/GPzuvfp3bfqyo+ikoSauZ5DeofrMSFCXUaxOco?=
 =?us-ascii?Q?Tl9E90ZpGh2MZQYDkkS3KBV61TSm3RmVYtyi+EfoliRrzzt1sOAgpBeheBl2?=
 =?us-ascii?Q?CDkN2+43Y5OM0GyqwexBhswL9iIenhOUm3SPK8p1ipc+NxOpHVaXihOeSgSE?=
 =?us-ascii?Q?8hykbkgfc6cAxGZiy4phnO3gyCIMV9Rfk07nE5BGYTnJ8LlXXV0wACfydZfX?=
 =?us-ascii?Q?o8Spk/MSr+nbetim+EBWpROVM0XrfszFDfsynQiW9Gi2En3inw0G6VLnGVI8?=
 =?us-ascii?Q?5deGtex7K1IOYRXl2eNGHvZZeRqWgyO+vJHOgagAKZB80iuWBQ7BJPrp+bdB?=
 =?us-ascii?Q?HgtBNFrc5Y/ZyV22rG+y4+AfwgLfg6CEJH716QRe5W3+XN1BpDjSj4XcCNwe?=
 =?us-ascii?Q?nY961D4XxFj1LA41gAwqmqYDMytXV4PfCBOYH14GJRjSVwS6YLVWKDsqlow/?=
 =?us-ascii?Q?GTfsLB68vP9O5oJRt9JKVrZQyjY24acOeCjr39eF5vuLxx7EZl2snQJimbH3?=
 =?us-ascii?Q?0XiX42UpNePtzoRxYupb/kQ0qXyKvdkF8Leui3ZirjP4AediYYy9JIJSeMks?=
 =?us-ascii?Q?8A+MnrPRr9yLWTupUK23GaJKITDFshuNN04U4anAcC0GTZDya6dgzu0CRDqP?=
 =?us-ascii?Q?wtTQ13x0/fPyWMWBsWilRnu36l77Y6X8GH4eEb7YRlxmZTILAHQc4e2ZMTQh?=
 =?us-ascii?Q?SKUEFhbwa2XcDxtkNS7BqsnO9mwc01R19UZlDSrEDfIX3AsRwG2vtiSZJ3LG?=
 =?us-ascii?Q?+xtPTULukPMIUFonQSdwQr+trbEtW/avGqBV8raNbjNGisUvWXp2iNCSYWEi?=
 =?us-ascii?Q?9g4CwC6kr6ZcBYVL6KZaSSOpIEa0pma9bTrUaE1bMr6qnVH7l5wnB0YkLxJQ?=
 =?us-ascii?Q?bYEQSwAProacCHK7cZBVPRFPQ5pvGke/LbUTbjNlwI19Z0m456J1MnrfpkJF?=
 =?us-ascii?Q?tKEWP/DuwTOQqLPnwKReNwLPKPNW2t6tFR+q5Qw9IZ42cXSp7nMpcGqgSvR+?=
 =?us-ascii?Q?kT2L8PEznvY/Vsl448gxq/C52m8InaUa8clk4uwPsmvOIUA39r7rUYcJhPLV?=
 =?us-ascii?Q?nt+93SS0MYcMeKyxMI2f6Mk/nFYf4ysyUwEuJUOBls/TUtN7C5aGsm9iDvPf?=
 =?us-ascii?Q?EWKp4cO4HnBamuL+FlLnT8cgSpYFGy+ilBsuzTkoiwjwQ7TxonYcsQ/ECX3A?=
 =?us-ascii?Q?LstFGDXBD6KH1jZW6R1e+Kkf71UpioSO6qkqqLVLAv9OaiHrRiBLqu3gB+gy?=
 =?us-ascii?Q?VnkWOBULNoLpzFplhjSzGruTfoBQnu89gzzAHLObwQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ID5JWiYep8YY451nDnxy5ka714P6tNh91shcr4Nb3wr6HMuRX+AhBiLia8Sr?=
 =?us-ascii?Q?K+qWTKbaGLzZD7V79BSOwqcL64eHHWHOdur7Df07swdZ3vVqnCNPkA0MM0qG?=
 =?us-ascii?Q?8xCC5xmU0uggcwDJkmlLkEzvOfhbC7u9hljz/GXrpxkxZVd2S4DqoTjvP3cs?=
 =?us-ascii?Q?gVosTybJOTGDjGfyM+AGpVJbJhci7zXzoymGcM9o8yMfHfojn94HdgtTbh0n?=
 =?us-ascii?Q?kuGUXmfGi38f9PP8oleHs5hfrVSKr7Vtkd26rJBIjW84KntsWVz7bS5OuREQ?=
 =?us-ascii?Q?BsgsO9i/OyaCF/qlTzBqf0groXCe9gHnJzqPuZ1ndUxvKlXc7JyAi3ggxC0e?=
 =?us-ascii?Q?Lxh7nyKU6VtYLPmsRMcmtSWrmXLp8bew0ltpLBAvkUUvecw5qYNhRSVsT6t/?=
 =?us-ascii?Q?HA8QLBp1M0STOLD3M7dhG85HiJosQt2ZuIUEsQHU8EtA3HE/MvYPTKScuXVi?=
 =?us-ascii?Q?0fxBIc7EP9Dpyr8L8pDHHZ7vJET2fF98mdopShrrCAO/bawccVwVc/fecKkO?=
 =?us-ascii?Q?+EA32rNjxWf2mYp6RTxsDMFHaLkmpB79bgn/P8UTRS5hpvsa+6E1SwncirCe?=
 =?us-ascii?Q?j9m0yZhhsGHLZvIzoa6bwc/+EWK2jP83/2fLL7SAslvvGdgNJCVocZMbTFaF?=
 =?us-ascii?Q?+a7kCJVP/sGAvqpDArThhm0XHIfpt8iAMl86pIBNgEbrqjRDr6Y4R32vUEV5?=
 =?us-ascii?Q?PpD0/p+P0ZJZuNmLLaiAzU26CjDgJLOB2X2Asyc5mTW95yaa/CjL9SdbJFXu?=
 =?us-ascii?Q?Fh9ip+ruYm17R2D54rpppB5XxVOK9wgoslpinoTlICSFTCm9Wpb9YMakNLZg?=
 =?us-ascii?Q?/pm0nllu2xqCtwkfx+Cp2w253L6GQk8U0Gu/BydnfCZAS0Vne4CVYYnODKyg?=
 =?us-ascii?Q?oJDAlfJdHshQ3+JwmVNO1UMaz73HLc3QQpc15h53SQ5VID/lRvILsjhSaSOz?=
 =?us-ascii?Q?MLhulD9mpN/ggU3gqfmLTUqiNt/Rc83Flk2Gw1/ARt43ARBBsc0mDWkD9hyb?=
 =?us-ascii?Q?KHFR/lLLTLbX6526EMVLUBGuatrcMuhndoi+W6qb5YfZ+VuwHn5TRUBT+Sla?=
 =?us-ascii?Q?mrApX3SntmymQGe9vUn/B0684sRFt8+sLeGMzl2kPwOa3yhD2PrjM1jGneFL?=
 =?us-ascii?Q?1+vXjyTbvmkSq6RNVHnb9wrQNAmDE1vu2nq1VRlw8bom8GYz5Mt5wGG6t55N?=
 =?us-ascii?Q?K83fU3bNAduNooWx6VhpZFwXMwXqEFx6tmgfI6LFj0fw6sXfJCIDvM+eiKop?=
 =?us-ascii?Q?TArigM2cZdCT7jrZ5tgr6pSY3eiug/G/pybSULR+ro5B4Dh03vtJbpfhie0S?=
 =?us-ascii?Q?RooRdxLuEamX8Xz4n4yhj+S+?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <965AC5FF0C11054BA3D2E11864593090@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a484bf8d-d29b-406b-d169-08dd4df03ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 18:40:39.5460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7817

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
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-appletb-kbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index e45cc3ac4..200db518a 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -402,9 +402,9 @@ static int appletb_kbd_probe(struct hid_device *hdev, c=
onst struct hid_device_id
 	}
=20
 	kbd->backlight_dev =3D backlight_device_get_by_name("appletb_backlight");
-		if (!kbd->backlight_dev)
-			dev_err_probe(dev, ret, "Failed to get backlight device\n");
-		else {
+		if (!kbd->backlight_dev) {
+			dev_err_probe(dev, -ENODEV, "Failed to get backlight device\n");
+		} else {
 			backlight_device_set_brightness(kbd->backlight_dev, 2);
 			timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
 			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb=
_dim_timeout * 1000));
--=20
2.43.0


