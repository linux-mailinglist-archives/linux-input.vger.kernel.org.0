Return-Path: <linux-input+bounces-4265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C6D90123C
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 17:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD15D28256D
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 15:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF803178387;
	Sat,  8 Jun 2024 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oEYsHdfH"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2021.outbound.protection.outlook.com [40.92.75.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DECB56446;
	Sat,  8 Jun 2024 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.75.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717859660; cv=fail; b=J5WdFhIJ7p4wsmtLCZ/61SSydROu2eNS59P20iQRmbdHMHmXz0tHjpYm46a5CV7dG9n90QyMmbexL40wEgZVI61I0X4UioLbcIoToZ+91OmmOX7HY66XXZjddyKZtlTNRNPr4/uYHH+MZ0opFPCY7gemXOyLh2LVlppb2lMxE/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717859660; c=relaxed/simple;
	bh=kfrbF1IvkE1sz9g8BzldbyXTyjrManmQsLwLdpJAf6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QPUG3lRSTuZA2Jj/jlWLbf4ycKrAQCDM4LYxWUw9mFGNA5XexPK/fSBnz7QDRdcOhe8gszp7vvuEq8tUkHMalEg1RegzFm+0L4zTdHoTxHEzkTDytnYwS+e5Hy0zD0d10V5v7aiftslmSCUHeWvway0a/L/JtDgkgs+lAQsEiso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oEYsHdfH; arc=fail smtp.client-ip=40.92.75.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAoEnGigeloLHC+g7wWjJ775Ac12q1N3zN1wC7NSwhTFvPS+2HWt6w+CZQp0qvYia5J/1hU/I7fV8tjGrM/RMcU9L2JoYgtiE46vAp92bpMOewXyer6DRkVCYdNed0ikDudfDQ0iggIK4nmYj2y3HWTU516AHkmG6N6K2rQECu7bSlfaQj5fqlXA0tHr9tc17RkZ7ZEdbVhosLh3e7b/pzMiW2LtfV0fXPuIE4Gm8H7ZsEOH2okfhNxoLZlLweCs+F7UguL6ay3X0S7yU91kktWOi5dJqVZG40fYLnkfH444XEqYjF8KPE69bUQUJO9rv4FcfKUlPNa/DrrwrTSviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwZGhZx/srWlTxDdhg4uAgM2FbH326JE8bEXlvSK0Mw=;
 b=cNlAtD2yymFqD9N1wxdoSlGXmmxR8xxOvhMRmBJQ0XWY2MSmOH6jVPOGSP2nw7opp9tREzQ8hVx0Kuxi4/7+bYjmZJD55iExmXpSLVH4p7pL0BokCrTWb7XbsTOZ8rSF0ifXmiSuVOr6jJwgXw8a/hconSMvej9Eh1Kxo1ckzExuSXcAxN1/gWzXWPpigiNeBEK+U0gxWUMmNzAnuXmADTt/v9pqxJFWlxIneeu+hrUv1O232BKwBjFrm3IImbQExowKvWFHDLA2QG5NFBiRcYxvsP2uG4uA4tXxX0KUn3VSTUlNyLYms0U/8Yd9aw6jfQ3hqpc5FUq2XxXqg3O5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwZGhZx/srWlTxDdhg4uAgM2FbH326JE8bEXlvSK0Mw=;
 b=oEYsHdfHFlj1TB+d6IxEXkgAMViGjdXFksfmrL50Ty4nSZGwjNU5CPXIIZUnJKaVMzRCo+trjSu2QduHh72Fzp1dGpjvrwcenbZqEq/xmOEl+p3A4a5q/OIw+3YSoEa0JZBrIjO8YoJgiy4Mq+y9SyCZVtDySbsnCQsgD/me4/GJO+odSeRfHN8LqEd+b+X0gdZXz1tTxFGtKfvU/qghMceAj9YMgNHl/0RJsy/KV1DGr2vcMupGSWQlrXQK/v2HuLUKw9qp2FOCRtYWeEDKLeQp960XVB1wv73iODgdCkUe1ZGpFbDY+keSPOubDZE+nYxL+HAYArvsd3LTGQM3Rw==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by GV2PR02MB8602.eurprd02.prod.outlook.com (2603:10a6:150:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sat, 8 Jun
 2024 15:14:14 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 15:14:12 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Vicki Pfau <vi@endrift.com>,
	Brenton Simpson <appsforartists@google.com>,
	Max Nguyen <maxwell.nguyen@hp.com>,
	Carl Ng <carl.ng@hp.com>,
	Matt Scialabba <matt.git@fastmail.fm>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: joystick - use sizeof(*pointer) instead of sizeof(type)
Date: Sat,  8 Jun 2024 17:13:57 +0200
Message-ID:
 <AS8PR02MB7237FEA55FAC8A9453F2DA6F8BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [0P54ixpM+K+RNTnPT6nrgnWQGQ31m81k]
X-ClientProxiedBy: MA3P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::17) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240608151357.10655-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|GV2PR02MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: e8619c8b-5181-48b2-949b-08dc87cda727
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	CLSvYuX5/jLKVOWgbGlSDiigKeBX+jKmdyNhw6h0aEkbC48M90A2opo//tCDV8V8K06AnHWzdR/HtVVb+DhiKs9l+lEwEPWVX5fNftZM+ahSx8RnCBuoUsljD3gZq2aOzS1QnLKB9PbwGp4pR9/tCZOyw7CJgX/Ua7ewPcNjNbqotcrVblYwMVh8ydru2hL0Jd2VXikfO92Iws09qUFX29EAj7qZANsWxgreZquDdW1AMzadf8O3Wjik3VIDc6moXT5xIy4uZ1uHe7YwAkDPXegkRfw665m4rP1g17KSx7Na1BkwIPfIs9HGrihpGzA1Em3Pop8EUzYiXhB0p0dZbWejpkcsmk+uCd5z37WoVsoXu6m0swC9F32CWiA4+xRnN+lMgM4jFpizx9ddG1qQTEcRKhxAMyJsgtIvrQZfe9xQFAL5qygtBwSvgQVt/6oCqEAQnB4PxLHDE+qr0KUgDX66NCJ/bhiPV3jbQTUWVfkXYGB69sfdrnbwiQ5UL5L4o+oRocM98WFB6SyK0nLCu/KaR3T0Mms2w0ccZd5yK2Y/YkvQD9vpT454EmPGkc3mesndTsZZ/ywtQDF+aksTm/7Bnul+Mdmu4gIVJsO/V9W9TYuGhGOYHbswL+J4PZdu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v0lOufExKK/CC4jEmIQCGr2LXPom2bX6XjwUp7F2N8mzlOWethwhyWUKlTka?=
 =?us-ascii?Q?989lGS2Y0yMVub9d5oBsw2LQWL/1iEq1ci9m3SAb6Uu9VelwXebFUAX8gkXT?=
 =?us-ascii?Q?xIeOgyhtcsFRAOTUxse0UoYI9jw4GHqKUOgNLswOTrZiS7Wf1jK5t5kk3Axa?=
 =?us-ascii?Q?P9NodtIpIvvci9K7SPKIPep0LBS8znFv7JqYJuDEdMzXyoIFYuLQuZePgJhZ?=
 =?us-ascii?Q?S7LSjDFDijNAdSvrf8KHiZyQGUVhNziQnai5SGjgfQCRyzPL2O3L45mFN2CZ?=
 =?us-ascii?Q?x96sunbIMewiKNGob/R7BkVDQ/wawPU8kPwmW1YoxvvNHkuOk7e+okWfOYWZ?=
 =?us-ascii?Q?mCrc26qEpbW/b3jHxLLftEGnVPraJ2XlFXn9YXXVr9WEWTWINEJKmriwZSZh?=
 =?us-ascii?Q?Y0n656/8e8JePGx43G1oARFL1eAVC5Hl6u4vcmW5AIpi9+s7xmqCHIbBLx2+?=
 =?us-ascii?Q?BziXsm1Na7WTOM27t60nRe1K1k1uUK5H1lLCrGfRcVda0TqFMj3sb0a6LMcS?=
 =?us-ascii?Q?sKjEoHutyPVk3S0C6z1W8nLJpqqrVUxfduNq+k+L5Kn1g9JEX8Zlp6U1IzMb?=
 =?us-ascii?Q?UZU9sKoGTMRu9pFYjLN9lX6fxEBrwFHLWxvQCXUuDBDAMD3Q1+mfQxCnRlo3?=
 =?us-ascii?Q?zLbT1LH1sZo7zLKejeLfU127PRVGZnPKmniIY4e0TqZB4t58EVm4Me7qmB84?=
 =?us-ascii?Q?wShnhOAARfdAR3m5/KZn3d8Yoq/Q9CJijdtnM2NmvVZz+JRZeVaUr8+yE8dT?=
 =?us-ascii?Q?bLQb76XSrqFmVyk9Ij4Q8xXmYTVceYx/mYFni0euhDDGSAmRmF8bR4ZuZban?=
 =?us-ascii?Q?ODEQ/vmM5hnBVLJEA5E8OE/h+t4rFeliZV7bLZDpeeO+DDbvT2GGqrV0WmnB?=
 =?us-ascii?Q?Xv3ltKT5FmaeQ4vuTfemSzQUk0Owli6fT0MArBGj2O7irm1W4WUhli8TY1st?=
 =?us-ascii?Q?GDbZicS8bNWZJ9tmi1mqVNeNqWlrxznzFEqV3tYV7p+hWQ9Jnnaj4Vyp2bnz?=
 =?us-ascii?Q?lkG8M1NHxtOMH1sUlT2yRSVhAqNDm+Kc0BBbR8pdIPRTYPKZWhsFSTalN4B/?=
 =?us-ascii?Q?hbiLMHWQeGy4zBTEYJ1UAHkmwfvzixLpWxXVY2sIamPjCYW2V9xRCpcqCl1V?=
 =?us-ascii?Q?zGdM1uFWXl3MggoiVpGsv3XdsMQfZJ7lmP/UDToLNaqO63eHSd24bLsCs0hl?=
 =?us-ascii?Q?znQZ5DMLtKE3sXG1Pt8m4LMzet6oodRWEn4V1UT4sRCP5H05iPwG0dYZJ8J5?=
 =?us-ascii?Q?sIy2iDDiprx1oZfolOKw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8619c8b-5181-48b2-949b-08dc87cda727
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2024 15:14:12.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8602

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter).

At the same time refactor the code to not use assignment in "if"
conditions.

This patch has no effect on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/joystick/a3d.c          | 2 +-
 drivers/input/joystick/adi.c          | 2 +-
 drivers/input/joystick/analog.c       | 3 ++-
 drivers/input/joystick/as5011.c       | 2 +-
 drivers/input/joystick/cobra.c        | 2 +-
 drivers/input/joystick/db9.c          | 2 +-
 drivers/input/joystick/gamecon.c      | 2 +-
 drivers/input/joystick/gf2k.c         | 2 +-
 drivers/input/joystick/grip.c         | 3 ++-
 drivers/input/joystick/grip_mp.c      | 3 ++-
 drivers/input/joystick/guillemot.c    | 2 +-
 drivers/input/joystick/interact.c     | 2 +-
 drivers/input/joystick/magellan.c     | 2 +-
 drivers/input/joystick/maplecontrol.c | 2 +-
 drivers/input/joystick/n64joy.c       | 2 +-
 drivers/input/joystick/sidewinder.c   | 2 +-
 drivers/input/joystick/spaceball.c    | 2 +-
 drivers/input/joystick/spaceorb.c     | 2 +-
 drivers/input/joystick/stinger.c      | 2 +-
 drivers/input/joystick/tmdc.c         | 3 ++-
 drivers/input/joystick/turbografx.c   | 2 +-
 drivers/input/joystick/twidjoy.c      | 2 +-
 drivers/input/joystick/warrior.c      | 2 +-
 drivers/input/joystick/xpad.c         | 4 ++--
 drivers/input/joystick/zhenhua.c      | 2 +-
 25 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/input/joystick/a3d.c b/drivers/input/joystick/a3d.c
index fd1827baf27c..15182f16ed19 100644
--- a/drivers/input/joystick/a3d.c
+++ b/drivers/input/joystick/a3d.c
@@ -249,7 +249,7 @@ static int a3d_connect(struct gameport *gameport, struct gameport_driver *drv)
 	int i;
 	int err;
 
-	a3d = kzalloc(sizeof(struct a3d), GFP_KERNEL);
+	a3d = kzalloc(sizeof(*a3d), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!a3d || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/joystick/adi.c b/drivers/input/joystick/adi.c
index f1a720be458b..963250de24b7 100644
--- a/drivers/input/joystick/adi.c
+++ b/drivers/input/joystick/adi.c
@@ -456,7 +456,7 @@ static int adi_connect(struct gameport *gameport, struct gameport_driver *drv)
 	int i;
 	int err;
 
-	port = kzalloc(sizeof(struct adi_port), GFP_KERNEL);
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index 0c9e172a9818..c709b58d770a 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -582,7 +582,8 @@ static int analog_connect(struct gameport *gameport, struct gameport_driver *drv
 	int i;
 	int err;
 
-	if (!(port = kzalloc(sizeof(struct analog_port), GFP_KERNEL)))
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
 		return -ENOMEM;
 
 	err = analog_init_port(gameport, drv, port);
diff --git a/drivers/input/joystick/as5011.c b/drivers/input/joystick/as5011.c
index 407062bcc84b..49a0dfbbeb49 100644
--- a/drivers/input/joystick/as5011.c
+++ b/drivers/input/joystick/as5011.c
@@ -237,7 +237,7 @@ static int as5011_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	as5011 = kmalloc(sizeof(struct as5011_device), GFP_KERNEL);
+	as5011 = kmalloc(sizeof(*as5011), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!as5011 || !input_dev) {
 		dev_err(&client->dev,
diff --git a/drivers/input/joystick/cobra.c b/drivers/input/joystick/cobra.c
index 7ff78c9388bd..5a0ea3ad5efa 100644
--- a/drivers/input/joystick/cobra.c
+++ b/drivers/input/joystick/cobra.c
@@ -141,7 +141,7 @@ static int cobra_connect(struct gameport *gameport, struct gameport_driver *drv)
 	int i, j;
 	int err;
 
-	cobra = kzalloc(sizeof(struct cobra), GFP_KERNEL);
+	cobra = kzalloc(sizeof(*cobra), GFP_KERNEL);
 	if (!cobra)
 		return -ENOMEM;
 
diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
index 4fba28b1a1e7..682a29c27832 100644
--- a/drivers/input/joystick/db9.c
+++ b/drivers/input/joystick/db9.c
@@ -587,7 +587,7 @@ static void db9_attach(struct parport *pp)
 		return;
 	}
 
-	db9 = kzalloc(sizeof(struct db9), GFP_KERNEL);
+	db9 = kzalloc(sizeof(*db9), GFP_KERNEL);
 	if (!db9)
 		goto err_unreg_pardev;
 
diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gamecon.c
index 41d5dac05448..c38de3094553 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -950,7 +950,7 @@ static void gc_attach(struct parport *pp)
 		return;
 	}
 
-	gc = kzalloc(sizeof(struct gc), GFP_KERNEL);
+	gc = kzalloc(sizeof(*gc), GFP_KERNEL);
 	if (!gc) {
 		pr_err("Not enough memory\n");
 		goto err_unreg_pardev;
diff --git a/drivers/input/joystick/gf2k.c b/drivers/input/joystick/gf2k.c
index abefbd1484df..e7ff7bdb1a3a 100644
--- a/drivers/input/joystick/gf2k.c
+++ b/drivers/input/joystick/gf2k.c
@@ -222,7 +222,7 @@ static int gf2k_connect(struct gameport *gameport, struct gameport_driver *drv)
 	unsigned char data[GF2K_LENGTH];
 	int i, err;
 
-	gf2k = kzalloc(sizeof(struct gf2k), GFP_KERNEL);
+	gf2k = kzalloc(sizeof(*gf2k), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!gf2k || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/joystick/grip.c b/drivers/input/joystick/grip.c
index 0e86b269a90e..f339ce2b7a33 100644
--- a/drivers/input/joystick/grip.c
+++ b/drivers/input/joystick/grip.c
@@ -284,7 +284,8 @@ static int grip_connect(struct gameport *gameport, struct gameport_driver *drv)
 	int i, j, t;
 	int err;
 
-	if (!(grip = kzalloc(sizeof(struct grip), GFP_KERNEL)))
+	grip = kzalloc(sizeof(*grip), GFP_KERNEL);
+	if (!grip)
 		return -ENOMEM;
 
 	grip->gameport = gameport;
diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 056a89ac2bdf..5eadb5a3ca37 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -632,7 +632,8 @@ static int grip_connect(struct gameport *gameport, struct gameport_driver *drv)
 	struct grip_mp *grip;
 	int err;
 
-	if (!(grip = kzalloc(sizeof(struct grip_mp), GFP_KERNEL)))
+	grip = kzalloc(sizeof(*grip), GFP_KERNEL);
+	if (!grip)
 		return -ENOMEM;
 
 	grip->gameport = gameport;
diff --git a/drivers/input/joystick/guillemot.c b/drivers/input/joystick/guillemot.c
index 205eb6f8b84d..1c5a76f72239 100644
--- a/drivers/input/joystick/guillemot.c
+++ b/drivers/input/joystick/guillemot.c
@@ -163,7 +163,7 @@ static int guillemot_connect(struct gameport *gameport, struct gameport_driver *
 	int i, t;
 	int err;
 
-	guillemot = kzalloc(sizeof(struct guillemot), GFP_KERNEL);
+	guillemot = kzalloc(sizeof(*guillemot), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!guillemot || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/joystick/interact.c b/drivers/input/joystick/interact.c
index 03a9f0829f7e..262f022e5695 100644
--- a/drivers/input/joystick/interact.c
+++ b/drivers/input/joystick/interact.c
@@ -192,7 +192,7 @@ static int interact_connect(struct gameport *gameport, struct gameport_driver *d
 	int i, t;
 	int err;
 
-	interact = kzalloc(sizeof(struct interact), GFP_KERNEL);
+	interact = kzalloc(sizeof(*interact), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!interact || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/joystick/magellan.c b/drivers/input/joystick/magellan.c
index 017ef8c6170b..2eaa25c9c68c 100644
--- a/drivers/input/joystick/magellan.c
+++ b/drivers/input/joystick/magellan.c
@@ -132,7 +132,7 @@ static int magellan_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	magellan = kzalloc(sizeof(struct magellan), GFP_KERNEL);
+	magellan = kzalloc(sizeof(*magellan), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!magellan || !input_dev)
 		goto fail1;
diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 3833ac47b2b8..8b54f9b18e7c 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -102,7 +102,7 @@ static int probe_maple_controller(struct device *dev)
 	struct input_dev *idev;
 	unsigned long data = be32_to_cpu(mdev->devinfo.function_data[0]);
 
-	pad = kzalloc(sizeof(struct dc_pad), GFP_KERNEL);
+	pad = kzalloc(sizeof(*pad), GFP_KERNEL);
 	idev = input_allocate_device();
 	if (!pad || !idev) {
 		error = -ENOMEM;
diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
index 9dbca366613e..b0986d2195d6 100644
--- a/drivers/input/joystick/n64joy.c
+++ b/drivers/input/joystick/n64joy.c
@@ -246,7 +246,7 @@ static int __init n64joy_probe(struct platform_device *pdev)
 	int err = 0;
 	u32 i, j, found = 0;
 
-	priv = kzalloc(sizeof(struct n64joy_priv), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	mutex_init(&priv->n64joy_mutex);
diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 7282301c3ae7..f6e92db4d789 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -577,7 +577,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
 
 	comment[0] = 0;
 
-	sw = kzalloc(sizeof(struct sw), GFP_KERNEL);
+	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
 	buf = kmalloc(SW_LENGTH, GFP_KERNEL);
 	idbuf = kmalloc(SW_LENGTH, GFP_KERNEL);
 	if (!sw || !buf || !idbuf) {
diff --git a/drivers/input/joystick/spaceball.c b/drivers/input/joystick/spaceball.c
index fa8ec533cd69..49101f1c858b 100644
--- a/drivers/input/joystick/spaceball.c
+++ b/drivers/input/joystick/spaceball.c
@@ -199,7 +199,7 @@ static int spaceball_connect(struct serio *serio, struct serio_driver *drv)
 	if ((id = serio->id.id) > SPACEBALL_MAX_ID)
 		return -ENODEV;
 
-	spaceball = kmalloc(sizeof(struct spaceball), GFP_KERNEL);
+	spaceball = kmalloc(sizeof(*spaceball), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!spaceball || !input_dev)
 		goto fail1;
diff --git a/drivers/input/joystick/spaceorb.c b/drivers/input/joystick/spaceorb.c
index dbbc69f17c89..7250d74d62a1 100644
--- a/drivers/input/joystick/spaceorb.c
+++ b/drivers/input/joystick/spaceorb.c
@@ -147,7 +147,7 @@ static int spaceorb_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	spaceorb = kzalloc(sizeof(struct spaceorb), GFP_KERNEL);
+	spaceorb = kzalloc(sizeof(*spaceorb), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!spaceorb || !input_dev)
 		goto fail1;
diff --git a/drivers/input/joystick/stinger.c b/drivers/input/joystick/stinger.c
index 530de468cb61..1b24ea21aa30 100644
--- a/drivers/input/joystick/stinger.c
+++ b/drivers/input/joystick/stinger.c
@@ -118,7 +118,7 @@ static int stinger_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err = -ENOMEM;
 
-	stinger = kmalloc(sizeof(struct stinger), GFP_KERNEL);
+	stinger = kmalloc(sizeof(*stinger), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!stinger || !input_dev)
 		goto fail1;
diff --git a/drivers/input/joystick/tmdc.c b/drivers/input/joystick/tmdc.c
index 93562ecc0ca1..514b1026e379 100644
--- a/drivers/input/joystick/tmdc.c
+++ b/drivers/input/joystick/tmdc.c
@@ -348,7 +348,8 @@ static int tmdc_connect(struct gameport *gameport, struct gameport_driver *drv)
 	int i;
 	int err;
 
-	if (!(tmdc = kzalloc(sizeof(struct tmdc), GFP_KERNEL)))
+	tmdc = kzalloc(sizeof(*tmdc), GFP_KERNEL);
+	if (!tmdc)
 		return -ENOMEM;
 
 	tmdc->gameport = gameport;
diff --git a/drivers/input/joystick/turbografx.c b/drivers/input/joystick/turbografx.c
index dfb9c684651f..eb8455c34e67 100644
--- a/drivers/input/joystick/turbografx.c
+++ b/drivers/input/joystick/turbografx.c
@@ -172,7 +172,7 @@ static void tgfx_attach(struct parport *pp)
 		return;
 	}
 
-	tgfx = kzalloc(sizeof(struct tgfx), GFP_KERNEL);
+	tgfx = kzalloc(sizeof(*tgfx), GFP_KERNEL);
 	if (!tgfx) {
 		printk(KERN_ERR "turbografx.c: Not enough memory\n");
 		goto err_unreg_pardev;
diff --git a/drivers/input/joystick/twidjoy.c b/drivers/input/joystick/twidjoy.c
index 9b6792ac27f1..ab99d76e5d8d 100644
--- a/drivers/input/joystick/twidjoy.c
+++ b/drivers/input/joystick/twidjoy.c
@@ -171,7 +171,7 @@ static int twidjoy_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	twidjoy = kzalloc(sizeof(struct twidjoy), GFP_KERNEL);
+	twidjoy = kzalloc(sizeof(*twidjoy), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!twidjoy || !input_dev)
 		goto fail1;
diff --git a/drivers/input/joystick/warrior.c b/drivers/input/joystick/warrior.c
index f66bddf145c2..ebeab441e9ec 100644
--- a/drivers/input/joystick/warrior.c
+++ b/drivers/input/joystick/warrior.c
@@ -124,7 +124,7 @@ static int warrior_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err = -ENOMEM;
 
-	warrior = kzalloc(sizeof(struct warrior), GFP_KERNEL);
+	warrior = kzalloc(sizeof(*warrior), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!warrior || !input_dev)
 		goto fail1;
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 70f0654c58b6..40a4ddee0b14 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1686,7 +1686,7 @@ static int xpad_led_probe(struct usb_xpad *xpad)
 	if (xpad->xtype != XTYPE_XBOX360 && xpad->xtype != XTYPE_XBOX360W)
 		return 0;
 
-	xpad->led = led = kzalloc(sizeof(struct xpad_led), GFP_KERNEL);
+	xpad->led = led = kzalloc(sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
@@ -2022,7 +2022,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 			break;
 	}
 
-	xpad = kzalloc(sizeof(struct usb_xpad), GFP_KERNEL);
+	xpad = kzalloc(sizeof(*xpad), GFP_KERNEL);
 	if (!xpad)
 		return -ENOMEM;
 
diff --git a/drivers/input/joystick/zhenhua.c b/drivers/input/joystick/zhenhua.c
index 3f2460e2b095..cc0e2a77ac5e 100644
--- a/drivers/input/joystick/zhenhua.c
+++ b/drivers/input/joystick/zhenhua.c
@@ -131,7 +131,7 @@ static int zhenhua_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err = -ENOMEM;
 
-	zhenhua = kzalloc(sizeof(struct zhenhua), GFP_KERNEL);
+	zhenhua = kzalloc(sizeof(*zhenhua), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!zhenhua || !input_dev)
 		goto fail1;
-- 
2.25.1


