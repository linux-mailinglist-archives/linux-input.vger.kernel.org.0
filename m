Return-Path: <linux-input+bounces-4264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32A90120E
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 16:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 646AC1C20D84
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6B17994C;
	Sat,  8 Jun 2024 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DuwNzLgA"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2042.outbound.protection.outlook.com [40.92.75.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967BD149DED;
	Sat,  8 Jun 2024 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.75.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717857312; cv=fail; b=aovlyzFglQYpbszXqhTapiAfy3/RWk3KfB0HwMHwEb4YulIfq1QKFkm0GuMeTO5PuzEM7jsutBIM5Lwkw7iCeP8E1FKg5LDwIdYnxOzyt3ziotXZhis1J4pT9/b22YMWx3ene7nJlEqu7eeB+ywxSviZQs94Rfyjjzw6jO9KaNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717857312; c=relaxed/simple;
	bh=keT11pKipHwGD4/KtGn4KrZLjZ5bJcJYPYc3iX625Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=O+KuNEE26/iPm25VFw/WtProDWXeVNsXmbR4ua7JW/fCnmxqdhVMNfnIcqx4JBHq/HIKKtTS7nITWKE91j1bOObVL9MAc12k2cKaOOPfP+ZmH+0cllNjBQ+17G85YtLgHJfhts+nI6FUshzq+WHpuDXD7GubvF16TljlYphunyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DuwNzLgA; arc=fail smtp.client-ip=40.92.75.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbGi6InWrd6TkGsR3ycyO0k06rP5RrkNaO9McqneEcXKsS1wUVMT4er9CfAIWx/MyvDZWOWAy5u27jURvADBDIYFmqJ2nq5sfex15rw5X4j3dKrLP+fNEjYxPk91qaAt5w4XGnm/VAc5yL1fDgTCB67sPLcORKlS26aaYRjkerHeg9imQrPRfGWXd2dEbm7+oRRXof6+f9AdqLbixnaX2U/iFaLHL0G76IHG9cq0sj++TtDyNpetf+UEZ7CDXQ74KjlLqN1sTfo2Z3JG56iRAH+W1tZWmekIW5IehXiKNfmrrMW7FOsXk7KpUh+ToW1jkW+FCPO0F1OSPTIEWYLkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FONB1OGxbJtyihzkLOXAIkW5q0+9D20jJTbpJL7HoPs=;
 b=AecXYHilnSGgpN82HFV3Hbxtuw+p0Zh75wA28aeuK3qiE3dc+yg7vmdX/z+MoVJpuoEElSPV+jn6JNErukp5A2ENZ2geCr4DzWf6bnc/hBnpqS8mVIx2paHOWli3LTv1G2DJdr7zOT+POsnunZRJ5+J86jPFw1TYZggd/3sd0cqPp1qtMfp6CEfn03OdexJEJAXWvae9I474K7ncoOynuxti9sY58arTt9GKChuA5Ch1zRxb2f4ov0VilQvCdlnvPnPRg4rUY82OPMcZRAD4rofJ6UtLiDdX0haBM4gSfsYbWs9JQ3gtPA4S8AQu2GAtuem3tNzvMavQYzj1bH+ilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FONB1OGxbJtyihzkLOXAIkW5q0+9D20jJTbpJL7HoPs=;
 b=DuwNzLgASzJatYlDqsDP32ZN827Fy8tqwlhKy/Dbpyxwwcb0NuAu3urD4+rfpx8hq4DmIifHxyfPu27DNjlTo1p8cU27Pqe+j4lh5Q0tofD8cQIM5DnhjYgr7BLBDvblofhRW/boWrwXhCANQQvv+BMGBJ0AouLoyhLX28GJaSa281KopUHIcoXzz6ua+N4zEhgUrexvi5bysWNUl0cfT2XICs4xEFY5sPiRexw4cR0wOr5B5wkPWDuceTj6n5fDO/40FoSD1vo6Hcsoiz7ac0/ykp9UzDldUtSFBZtGNV+Pt4VIW2puXUcAKL8BtvCqjmqidaifOE6wf70eyUkDfg==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by PA4PR02MB8216.eurprd02.prod.outlook.com (2603:10a6:102:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sat, 8 Jun
 2024 14:35:06 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 14:35:04 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: touchscreen - use sizeof(*pointer) instead of sizeof(type)
Date: Sat,  8 Jun 2024 16:34:49 +0200
Message-ID:
 <AS8PR02MB723708364CC0DF2EAAFEE5968BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ohKEUuOxWCxOnVlFFQI9gmV86YT+xUo9]
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240608143449.7451-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|PA4PR02MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 395abcaf-1703-4643-b3f8-08dc87c82f8e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	HiDecNcFTrP6jfJGFgQQwcLnW50vdaFKq8sGb9NpLtteVWA56XnkouHjk229mRc2trLqPGNhU7nFOCNKklj/1EdV9MR0hB21L36Or5pJ0u1CZ22ebUNJJnhF39tMCTJZBtBv2uONIYz4lHsK6k0j1m1SxL5js5BQO0sG0Rrz5p7pgqmeAAFjKbBjkQ4X5c7tHZ3mj4Pn5k3+SbWC21+BVanUqFXdZr2Y9DIXBgarRo8uIw2Ts373jpDUob3MOwO46wvlvaZqitklEpNHOAotbKbw25lteSmVnHLcTsbYFEBBPm7EykzN5plsqfE+JMYz3KDhdOkzpiGEBguGSY6NURYkTZjky2RVMAEhB9+gBywz1EY/7UHHRA+TTEmwCldqS8RlgWNGw6e1vmmIrpRmc+MRhk1MejHRec2s7LzONLpkV2D5PEcqiQreDa/VkJpFArkogXZMWSMOEfd23pjeIjDtONfw90HD8uIc5nmvnRnj1/9iUitWZNk8nz8luyM1LJ916dBxvOND/oVGqLjJt1V8Wz4Rz9zEe+wQDhjNYGrMUhnjkdR94+5nW8ShutSWYR7e2QxVUg9RRYJqYM1/XxFC3RdYHvJYby+rwZcy1fJwI8VLft025g/8sF2lgFsj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GUdrFFgt/lClO+iI0dXwXxO1YVEi5NaXndYPE/RrrUkHlLinFLGkUQBqMBpU?=
 =?us-ascii?Q?wwUR8gXhLr9q8T9Ji1Zaz+slEyvu9hDqi5rvhy9ApOPnGDOVCvD4JVYInJlm?=
 =?us-ascii?Q?om9bKWmW8l6RohCUGBSmDsZIseA0e+2fyRrWcl18ZH4j0IjvW3dFtWRs4ybt?=
 =?us-ascii?Q?4ZDrzD0kw5GFaIjxcxv4fk/89d7FaJLPwX2REAzR7MhOr8Ryka6mdJ3reLFs?=
 =?us-ascii?Q?iEFkxDljAz77Sm9VDJHhwOhhYDhq6+VfI1NsNuHzQvcfGlSc5gEg6VYDXomj?=
 =?us-ascii?Q?gMGYi2r7G/l15JV/bOfUkN32WYow6bTAzRtfYmmSp3FoL3rKCUkySyrkKB+h?=
 =?us-ascii?Q?76hOjC/x/9wUOXUVJy4O7VJ3R3koWyAIkUWcgstYvOEazHrarCIBdyRUmoxY?=
 =?us-ascii?Q?hf3QLyZTCpRxQzj0wyaSLJqoCd/qx9DB9u2hlbMPpi+8NurOLYGDdkgAKZDJ?=
 =?us-ascii?Q?JeVLQ2hY0ef6DiA1+tG+37XPLZ16X3q8TtRyKARwxdaOKfj3oFKJFTzVeBsM?=
 =?us-ascii?Q?qjkeQcIeRfjs09QFGsyRXKQr1oSCLZG2exnlWTR00JWkPCvJD92QvmJovya1?=
 =?us-ascii?Q?1S5xMCDSFzWNgkQJQLXCzh3DOATrHC3Izbx35sm+vCaPQBQ3M4oWrCfEmOLJ?=
 =?us-ascii?Q?JhIaF43/VhAkI+U9sCW3YHb5OPOSBSq3rxntH71QhQfXAmuDQaUT7s+so9o7?=
 =?us-ascii?Q?C2hHYVofyoHCRr/7i8aWChcA82xCJRq9zKiSX21nctrpz5hsfz4iR2rWkn7h?=
 =?us-ascii?Q?KTSiKudf3erBh71qTdoBbKEGM0n616omzNq84DJ60gW1/pL++XS0zn9gQpPD?=
 =?us-ascii?Q?GNV0LIe3FmpJOJPznPOsHCDK8q/WOlBIGnx6abBem7Uft+cfevZIDnttiC5N?=
 =?us-ascii?Q?um7sGqkrIFDJL3e7FMf4egONEbd1GW/LROhtXewCdrM+nJD/EpPkX+2MlC+I?=
 =?us-ascii?Q?IFP/wPycWohJdllWdcni2aMUxs+D5ShlUlTMRFWcKyfcGMDj9bGkKY/uy/VO?=
 =?us-ascii?Q?eTzsDSzCOTo2T3b/U/hR54mA6i5gEsdbNdjJHWJJ+uzqv2dTaBT3Z4clWbz7?=
 =?us-ascii?Q?6yV+Lcd3LpC2LsS5ExrKBTAT/FlA216T/5bl7K//BBu6sWjzg95GCzl1Wl/X?=
 =?us-ascii?Q?23U/eNAeitNgb5/9nzR++ZGmvPfZws/J3kr3V7OXct3FjR6Iwa6958d9MlFv?=
 =?us-ascii?Q?0dvIfQYs7NeLhTpcoQoVXtumcPKeTT0xs3TNImk1wpxT14rxtdbGhmyOjWb6?=
 =?us-ascii?Q?HiLOjcWftaDF7Cwao/5j?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395abcaf-1703-4643-b3f8-08dc87c82f8e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2024 14:35:04.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8216

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter).

The refactoring is mostly trivial except for "usbtouchscreen.c"
file. Here, in the "mtouch_alloc" and "nexio_alloc" functions,
it is necessary to use a variable with a predefined type instead
of the "usbtouch->priv" variable (void * type). This way, the
"sizeof" operator can now know the correct size. Moreover, we
need to set the "usbtouch->priv" pointer after the memory
allocation since now the "kmalloc" return value is not assigned
directly.

This patch has no effect on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/touchscreen/da9052_tsi.c       |  2 +-
 drivers/input/touchscreen/dynapro.c          |  2 +-
 drivers/input/touchscreen/egalax_ts_serial.c |  2 +-
 drivers/input/touchscreen/elo.c              |  2 +-
 drivers/input/touchscreen/fujitsu_ts.c       |  2 +-
 drivers/input/touchscreen/gunze.c            |  2 +-
 drivers/input/touchscreen/hampshire.c        |  2 +-
 drivers/input/touchscreen/inexio.c           |  2 +-
 drivers/input/touchscreen/mtouch.c           |  2 +-
 drivers/input/touchscreen/penmount.c         |  2 +-
 drivers/input/touchscreen/sur40.c            |  2 +-
 drivers/input/touchscreen/touchit213.c       |  2 +-
 drivers/input/touchscreen/touchright.c       |  2 +-
 drivers/input/touchscreen/touchwin.c         |  2 +-
 drivers/input/touchscreen/tsc40.c            |  2 +-
 drivers/input/touchscreen/usbtouchscreen.c   | 15 ++++++++-------
 drivers/input/touchscreen/wacom_w8001.c      |  2 +-
 17 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/da9052_tsi.c b/drivers/input/touchscreen/da9052_tsi.c
index d71690ce6463..52e0e834e76f 100644
--- a/drivers/input/touchscreen/da9052_tsi.c
+++ b/drivers/input/touchscreen/da9052_tsi.c
@@ -232,7 +232,7 @@ static int da9052_ts_probe(struct platform_device *pdev)
 	if (!da9052)
 		return -EINVAL;
 
-	tsi = kzalloc(sizeof(struct da9052_tsi), GFP_KERNEL);
+	tsi = kzalloc(sizeof(*tsi), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!tsi || !input_dev) {
 		error = -ENOMEM;
diff --git a/drivers/input/touchscreen/dynapro.c b/drivers/input/touchscreen/dynapro.c
index dc07fca7c5ed..fe626a226b85 100644
--- a/drivers/input/touchscreen/dynapro.c
+++ b/drivers/input/touchscreen/dynapro.c
@@ -110,7 +110,7 @@ static int dynapro_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	pdynapro = kzalloc(sizeof(struct dynapro), GFP_KERNEL);
+	pdynapro = kzalloc(sizeof(*pdynapro), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!pdynapro || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/egalax_ts_serial.c b/drivers/input/touchscreen/egalax_ts_serial.c
index 375922d3a6d1..07a4aa1c19bb 100644
--- a/drivers/input/touchscreen/egalax_ts_serial.c
+++ b/drivers/input/touchscreen/egalax_ts_serial.c
@@ -99,7 +99,7 @@ static int egalax_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int error;
 
-	egalax = kzalloc(sizeof(struct egalax), GFP_KERNEL);
+	egalax = kzalloc(sizeof(*egalax), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!egalax || !input_dev) {
 		error = -ENOMEM;
diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
index 96173232e53f..eb883db55420 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -307,7 +307,7 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	elo = kzalloc(sizeof(struct elo), GFP_KERNEL);
+	elo = kzalloc(sizeof(*elo), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!elo || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/fujitsu_ts.c b/drivers/input/touchscreen/fujitsu_ts.c
index 3b0b8fccc3f0..1a3e14ea2e08 100644
--- a/drivers/input/touchscreen/fujitsu_ts.c
+++ b/drivers/input/touchscreen/fujitsu_ts.c
@@ -99,7 +99,7 @@ static int fujitsu_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	fujitsu = kzalloc(sizeof(struct fujitsu), GFP_KERNEL);
+	fujitsu = kzalloc(sizeof(*fujitsu), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!fujitsu || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/gunze.c b/drivers/input/touchscreen/gunze.c
index 5a5f9da73fa1..dbf92fb02f80 100644
--- a/drivers/input/touchscreen/gunze.c
+++ b/drivers/input/touchscreen/gunze.c
@@ -97,7 +97,7 @@ static int gunze_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	gunze = kzalloc(sizeof(struct gunze), GFP_KERNEL);
+	gunze = kzalloc(sizeof(*gunze), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!gunze || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/hampshire.c b/drivers/input/touchscreen/hampshire.c
index 5c4d877564ee..dc0a2482ddd6 100644
--- a/drivers/input/touchscreen/hampshire.c
+++ b/drivers/input/touchscreen/hampshire.c
@@ -109,7 +109,7 @@ static int hampshire_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	phampshire = kzalloc(sizeof(struct hampshire), GFP_KERNEL);
+	phampshire = kzalloc(sizeof(*phampshire), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!phampshire || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/inexio.c b/drivers/input/touchscreen/inexio.c
index 1d7e4c3966ce..82f7ac62a4f2 100644
--- a/drivers/input/touchscreen/inexio.c
+++ b/drivers/input/touchscreen/inexio.c
@@ -114,7 +114,7 @@ static int inexio_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	pinexio = kzalloc(sizeof(struct inexio), GFP_KERNEL);
+	pinexio = kzalloc(sizeof(*pinexio), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!pinexio || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/mtouch.c b/drivers/input/touchscreen/mtouch.c
index 28e449eea318..eefae96a2d40 100644
--- a/drivers/input/touchscreen/mtouch.c
+++ b/drivers/input/touchscreen/mtouch.c
@@ -128,7 +128,7 @@ static int mtouch_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	mtouch = kzalloc(sizeof(struct mtouch), GFP_KERNEL);
+	mtouch = kzalloc(sizeof(*mtouch), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!mtouch || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/penmount.c b/drivers/input/touchscreen/penmount.c
index 12abb3b36128..95adede26703 100644
--- a/drivers/input/touchscreen/penmount.c
+++ b/drivers/input/touchscreen/penmount.c
@@ -199,7 +199,7 @@ static int pm_connect(struct serio *serio, struct serio_driver *drv)
 	int max_x, max_y;
 	int err;
 
-	pm = kzalloc(sizeof(struct pm), GFP_KERNEL);
+	pm = kzalloc(sizeof(*pm), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!pm || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 5f2cf8881e72..8365a2ac6fce 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -672,7 +672,7 @@ static int sur40_probe(struct usb_interface *interface,
 		return -ENODEV;
 
 	/* Allocate memory for our device state and initialize it. */
-	sur40 = kzalloc(sizeof(struct sur40_state), GFP_KERNEL);
+	sur40 = kzalloc(sizeof(*sur40), GFP_KERNEL);
 	if (!sur40)
 		return -ENOMEM;
 
diff --git a/drivers/input/touchscreen/touchit213.c b/drivers/input/touchscreen/touchit213.c
index fb49687da405..c2718350815c 100644
--- a/drivers/input/touchscreen/touchit213.c
+++ b/drivers/input/touchscreen/touchit213.c
@@ -139,7 +139,7 @@ static int touchit213_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	touchit213 = kzalloc(sizeof(struct touchit213), GFP_KERNEL);
+	touchit213 = kzalloc(sizeof(*touchit213), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!touchit213 || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/touchright.c b/drivers/input/touchscreen/touchright.c
index 3cd58a13e44f..30ba97bd00a1 100644
--- a/drivers/input/touchscreen/touchright.c
+++ b/drivers/input/touchscreen/touchright.c
@@ -102,7 +102,7 @@ static int tr_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	tr = kzalloc(sizeof(struct tr), GFP_KERNEL);
+	tr = kzalloc(sizeof(*tr), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!tr || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/touchwin.c b/drivers/input/touchscreen/touchwin.c
index bde3c6ee3c60..fbd72789ea80 100644
--- a/drivers/input/touchscreen/touchwin.c
+++ b/drivers/input/touchscreen/touchwin.c
@@ -109,7 +109,7 @@ static int tw_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err;
 
-	tw = kzalloc(sizeof(struct tw), GFP_KERNEL);
+	tw = kzalloc(sizeof(*tw), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!tw || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/touchscreen/tsc40.c b/drivers/input/touchscreen/tsc40.c
index 139577021413..9f485cf57a72 100644
--- a/drivers/input/touchscreen/tsc40.c
+++ b/drivers/input/touchscreen/tsc40.c
@@ -83,7 +83,7 @@ static int tsc_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int error;
 
-	ptsc = kzalloc(sizeof(struct tsc_ser), GFP_KERNEL);
+	ptsc = kzalloc(sizeof(*ptsc), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!ptsc || !input_dev) {
 		error = -ENOMEM;
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 60354ebc7242..dd6b12c6dc58 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -505,12 +505,14 @@ static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
 
 static int mtouch_alloc(struct usbtouch_usb *usbtouch)
 {
+	struct mtouch_priv *priv;
 	int ret;
 
-	usbtouch->priv = kmalloc(sizeof(struct mtouch_priv), GFP_KERNEL);
-	if (!usbtouch->priv)
+	priv = kmalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
+	usbtouch->priv = priv;
 	ret = sysfs_create_group(&usbtouch->interface->dev.kobj,
 				 &mtouch_attr_group);
 	if (ret) {
@@ -924,12 +926,11 @@ static int nexio_alloc(struct usbtouch_usb *usbtouch)
 	struct nexio_priv *priv;
 	int ret = -ENOMEM;
 
-	usbtouch->priv = kmalloc(sizeof(struct nexio_priv), GFP_KERNEL);
-	if (!usbtouch->priv)
+	priv = kmalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		goto out_buf;
 
-	priv = usbtouch->priv;
-
+	usbtouch->priv = priv;
 	priv->ack_buf = kmemdup(nexio_ack_pkt, sizeof(nexio_ack_pkt),
 				GFP_KERNEL);
 	if (!priv->ack_buf)
@@ -1661,7 +1662,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 	if (!endpoint)
 		return -ENXIO;
 
-	usbtouch = kzalloc(sizeof(struct usbtouch_usb), GFP_KERNEL);
+	usbtouch = kzalloc(sizeof(*usbtouch), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!usbtouch || !input_dev)
 		goto out_free;
diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index 4ddb6b3baba5..c8abb9557ee8 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -598,7 +598,7 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	char basename[64] = "Wacom Serial";
 	int err, err_pen, err_touch;
 
-	w8001 = kzalloc(sizeof(struct w8001), GFP_KERNEL);
+	w8001 = kzalloc(sizeof(*w8001), GFP_KERNEL);
 	input_dev_pen = input_allocate_device();
 	input_dev_touch = input_allocate_device();
 	if (!w8001 || !input_dev_pen || !input_dev_touch) {
-- 
2.25.1


