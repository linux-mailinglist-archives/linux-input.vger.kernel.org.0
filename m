Return-Path: <linux-input+bounces-6727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 301BB986B30
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 05:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7E44B21225
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 03:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8C41E86F;
	Thu, 26 Sep 2024 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="R68zZg3Q"
X-Original-To: linux-input@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072.outbound.protection.outlook.com [40.107.255.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0591D5ACE;
	Thu, 26 Sep 2024 03:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727320521; cv=fail; b=ICQKePEgTnvMvCSEI24uDXMQfGwjGdKgkto6YphSzLJNbCPfLUZp8vAE/ZGF9cefIhJuM3DZefHHBMtHXCaIs/QuZR9OyDUVvHY7livz8TnkioVsszVawcqMp5k0JtsMoI2Pz4JNKUDx/mfk5cL/wXI45HlHNwYw6bXVW9rCzzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727320521; c=relaxed/simple;
	bh=0CvQLDTzX6clUZ9KjiF+ywhnWPP6xF6cRDJHY6Mbm0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=c93Q0PVsNVh1mCnx2WuXDAJXoB0/B7qD/kxInzcwQGFtWjLKwGeRhoxRMT82Ggu+4NvadZG0p2CgUD5WdBrN6dyKU5pV+SnvDt/9JrNdYAUSoblfdzAkYllf0dfWlOOLs7qqvDUtHYtj+YcaxCcsDZIwg/14OZGFawJd/nhUoVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=R68zZg3Q; arc=fail smtp.client-ip=40.107.255.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGku6ES/5U+Pg572lH8j0foyFEqXazSLQC5vnGIGa4MzimltF5q8nnHz+udcfdRwB1Bsz5gJhcZIzvl/YF20TKneRS0HxX/HOmtgbKQu+Y/0iwEnv5CE/FgebjDaJgFusb2stw/ucHjwqAfmHeQclto8rBa7g2Ox65zoDnuLSzlfZmiFUnMuAxb13Y5SNpX6vINI/FFm3GPLgv7eEdzImdXiBpZ/qhoGTvB3mkqXenQuh6+29QgL1zKRp/tgEzXJuJemQZILrumNcNvGvUGlNnkbC9rphzF5fs5KwV6BKz0VmAwqVmSbUcuE0TqINAvzLzHM7l7alTbHJZtvRkqlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un215ODdJ4gFB/1r7ha2OTdmIEAOymaa9RLjMYkeTts=;
 b=GatdrhGeuyKtl7ALCtEWu+6h5Ia0e78he0ccY74UqqKeUF5zus/m1nw3Zq4+JivAASu6eN64pOH5B7wO7ocRdKE+mPgC2YjTq3R2TEGxPX3U+qiabfqs4d1DmY//ZNAchuWykR79QH361AXA2B90Arg2gc+2RezOTUtuunTFwjGHrQ9alJH5V0kc8859t3LcXC3bH+mwY8Ap2+g8vOCN7dZ14OsRw1vNTvvxNoBH8Jo/uZwqNiUbgFf5ildyMK8XtXHRbyGFZH36Ia8g0gVki6CfbBaTQMXHF38nCQ7ldse/n2fzGScuvcBigNSsK6JWeJjwC75q5E526Viq7tUOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un215ODdJ4gFB/1r7ha2OTdmIEAOymaa9RLjMYkeTts=;
 b=R68zZg3QDqD1ljr5+L1Eec3dSr5KA5hon7Yyk3arsh3Rg3g1oVN6h7ZjaHqYCuefRvTj9yRBJl8oSNI902xCsD47xidCy8tp8gl0KfzfYGjfT/1rFfH6SqAmdOQPDf5Fih+N/Gdp9We+i5uy2VF+btc3wk2QCdSPYnYkxUt7oz91eVdOZ3onSZAjugNgJGxQeso8BJXyAblfmaelPij+pkFbLDFf5IGNgsCNyK/ZZlIU/Xmp73rMfHceEqabZHOKkdy0nrhWLJm7qd69r9u4a5/kjmd/hkFY+gOfwbHlDtIdJ5SacHyqqcpHidcFq2p8OfWOmvUsljt41bbnxHwTqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TY0PR06MB5846.apcprd06.prod.outlook.com (2603:1096:400:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 03:15:14 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 03:15:14 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] input: Fix typos in comments across various files
Date: Thu, 26 Sep 2024 11:14:43 +0800
Message-Id: <20240926031457.3479350-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TY0PR06MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 98aacc97-75ac-48b7-acac-08dcddd97061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QxSEQT8aODn7ns2HdlXJo6GAYHKNnoPikEo4KOzV+CPG+tNc+QGMNZMXZW3l?=
 =?us-ascii?Q?luJfSmSmzT9XWCapk3HgfPfwVvWiHPOgPn5WWK/c5LoBju5SwkEH5jO9NuIo?=
 =?us-ascii?Q?UunqecPN8mYdhnYa0FMWuYG6bul3fG11SphT8sPt50W7pPzFJx4BZGdv/vHW?=
 =?us-ascii?Q?Ve07khCNMmN7EcqC5c3LZKTrZLFsCGgiMnXQRsnwGGp85z63S+9iD/VRM7YW?=
 =?us-ascii?Q?79qi7lmM7Sc/1iH0WlfnYa0OUdfJdj3POyxgLpCh8b/oqgwZuOwheFL4d+Lp?=
 =?us-ascii?Q?y16YoankDq7J8wNq+NOppylL52CH2oib+hc7HkW7uxlj1Cb4M6FHk4Dbe4BU?=
 =?us-ascii?Q?UuaNe5kFK1IKYViv+1Pb2QUpQikgkpYmLmeoI+bTb6DFm0det97WutafvN5N?=
 =?us-ascii?Q?8H40lQGfRoXGyi4/SssvNpZxoaN2A/EjYD/qS83IJEgEl0OGaki8qV2mjGR0?=
 =?us-ascii?Q?R8bUaTDZkKx+L/FCoLbr5zxHDoJPr12z/dHsS1MhZNpDbvn4Br5dyrG+groL?=
 =?us-ascii?Q?WN2GInamiPg6QYhTqo6ODyG9+IkXzbUdFleJ5TTKi9fAdhUMLezFoqXhH0Qe?=
 =?us-ascii?Q?qUqjU5W1i8IWWzf1DxbTUclvs473R/bckaXF/Kehr6WDU0xGNyNCoC1eCwuM?=
 =?us-ascii?Q?3lQKnTgP849RaWnVll3R9c0SzvcSTG7Qlp4Qm40IUdNkibu/Rzm1C72Y3gpR?=
 =?us-ascii?Q?XoboJyOcBPyPsLl7Hv+vxECIKQuhIVdumzGNFftkKXJ9XfZk0sXxd99DDH9L?=
 =?us-ascii?Q?oRaq2aFC0nNTKa+UGFEDjk2p3QMg04gaZuQxak3mcWR3CCeqBkWz7Eurx0bF?=
 =?us-ascii?Q?+GsV5GtUlOEz96UwXT74YX4zPs0mAcMAc1q1p0Uowpa0D5KB6vP2QcmnPjI4?=
 =?us-ascii?Q?bGiImE1hRe7JB6UKHm6w3uSirorjGlp09XAcYDFe6arGG+tYu5RhX/Mm/4O4?=
 =?us-ascii?Q?FcrCJYLd4r/YS8ZZIqTYOuNHA04GsgqnXimlEA5R3iQQA8dYOikaljSMNtJv?=
 =?us-ascii?Q?7KrRNKdjJlFDwF2HPDPwaRIjGC3thPPN+ouMctuGhXIsfhT7TvbIf5whIx/M?=
 =?us-ascii?Q?MkrJbHYB6dWAkEzCcMh8hWRuhsTbl6++heYnvYEsAHavTXg72L4I5yB3ZvVF?=
 =?us-ascii?Q?G9omOtKmfLsKRgrFNrUXevkeyxeAXMYtAgr0PJB2OcUUJgVEcVsX5nJ4+8w5?=
 =?us-ascii?Q?h60JIo/+XIvF/ja6zNlUJkowq6uMJSWUZ19I/GlaSk63+GJy7XTzLOedPz4v?=
 =?us-ascii?Q?QIds9lkhpipSUSZUBJFSi2oaM5UhwvM5nIoC5gt/yQBldqJqnU1jxSPxx6za?=
 =?us-ascii?Q?g169oYtw4GMCpkheZgrrYlQ09i9aAyyyxEFMmRdmP7ngmblFuymjIaLb6PUe?=
 =?us-ascii?Q?K3HL89Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I7iovWCxcZyk7hu/Thvi3VWC7aZTTDg3mfoO3Mwtl+Qy9RMoWhGBKXMVJN4d?=
 =?us-ascii?Q?2i7E9TesY48EmSFIyKRi96vya4OmBx/pv8KnlXNhrErIMxxdXSrdGkee5d4N?=
 =?us-ascii?Q?HseYm7qsD+M/M5r48h++xqqU3zwxoq9MTjfj/5m9o0fwS3F6WLlUZNMe7Vl+?=
 =?us-ascii?Q?dQzy1Q+iC5IL2DF0p/mI+60aT90IOYj+CdSmkVHvm+qdDAoiIoVrTT229+9b?=
 =?us-ascii?Q?DYW9i4msY5zTB5q/PhwcakUYLucCiF0FyOJ8MatxL1uR+iLvco/tzogJoWXD?=
 =?us-ascii?Q?m4SiL1n/L6WkHXX2KXDvMS+h3BtC6gfbbKq9rVlDvEKk6fdyxkG+xlk5M1jh?=
 =?us-ascii?Q?RnSXab8PHdb8AfiCAe5MQ5rXfiM5UHkD+Fl6uPL6ZS5JcDoBrTPzJY6g7VX3?=
 =?us-ascii?Q?qc+JFzS2o4k1i0wxAzA3F7n06Ekh2QHvpo97Qnr+wA/spafkTQc/YM9Eb+jD?=
 =?us-ascii?Q?XRuGC9y7ud3FM1f6J5OF0qhJ16cq77Lok7RisPNGWpxidzkb7xZXwuwEehUy?=
 =?us-ascii?Q?afVZW2wxsvDJvBBX7uzBRIjlEYUVTdlwnBFb72h6/9t+gIDXZQG+sVSG34SG?=
 =?us-ascii?Q?kpTMJXhVeiXQ44qwtCyruxzVhAQ9h/MdYFacw0BhDDNynDi/+bE/1lVwScus?=
 =?us-ascii?Q?irz7sCZwQJKcystIOBvEm0RhwHiEjZ5pzffuUDfe2U+o3AnTH19enQcgsq7Z?=
 =?us-ascii?Q?AA3kr8zthAoa4uP8E6ZXZee4BHVXKjN63vNN19CEeUSOzlVQMAeVZl82tU3Y?=
 =?us-ascii?Q?dY0eab+04nbkTTNoNULZEaTVEAzA2w3B1QT5HWvfICrV1cOJ8YgpDeNrglGZ?=
 =?us-ascii?Q?DNNxlWHrbPfqHLOw2jIT0gXVITafB49NiibTxa8IFhDu+TJoG/Yajp0YdiE9?=
 =?us-ascii?Q?W7HxYoG1R8fHV4iZaLs3Q+b5MlzukzUKbGVA0e4TRvsDYcJ3BiNhkGLwdthl?=
 =?us-ascii?Q?u5rohUhAV/GQo0CHHOnf78phHD+nHROmeoBtJu/g+bAIaHaAiUebgMPyifQi?=
 =?us-ascii?Q?JpE2MXefWLvTpwDTgusGRmnZ+w/7+cyVy3Decxh7UrZnoC5/GxWCgudNnvBo?=
 =?us-ascii?Q?mKje3+1hXVutqaXncQx3yUYCcXqdr8s8wOKn/x5DcB2WQxVrN1Y9hN5/S7FR?=
 =?us-ascii?Q?m+Ob2x29Wl5XLFrhBubKELwLYTxa+RZeJqZmzGUNgeOgeYvCvlPkrHO1YxYW?=
 =?us-ascii?Q?Z96H27FC+fXGq3yD9lBZ5F8OHg4ngZtx9xa4SnbJkFTuW2KTtUTGcHraa3Dg?=
 =?us-ascii?Q?4orasbMCxYVC+6hV0ZLL4C/T2vBq/fmmBlcFdXpP9C8yN7xWktwLxgvegcKO?=
 =?us-ascii?Q?Pupwj2DOa6gfBihzhrEES0DSuv/MarTudTkrQxsXUKyqPgHv2tLz9aubbCBF?=
 =?us-ascii?Q?4vYdfJYDWD509+zzE643YAgpCOOCldizrHhbdyueZjdZZntOhJZwZt8Hy+do?=
 =?us-ascii?Q?B8vW9YeEO2a8BDWtKmiBahwDPVhH/PEB8wpKzy02g8ligFVe9HrVQQm8Z9N2?=
 =?us-ascii?Q?lrNbnXg3SSOPcX+6mm0mhshql8VeviQqHPaHQXWshaM822ystqq9UTUJDmdz?=
 =?us-ascii?Q?IQyw2c3o3QvyHl61K+V7hY7rllF8cu0ahavCdGgc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aacc97-75ac-48b7-acac-08dcddd97061
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 03:15:14.4270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkMx76PLqgXwxN6gQOUfCjPH9RpMRsNWWgDlT46FxNAivyUYczDaCI40MZAuUK4N/moIPEdpnBTOHEkpWZinQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5846

This commit fixes several typographical errors in comments within
the driver/input directory. No functional changes are made.

Detected using codespell.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/input/touchscreen/auo-pixcir-ts.c | 2 +-
 drivers/input/touchscreen/bcm_iproc_tsc.c | 2 +-
 drivers/input/touchscreen/edt-ft5x06.c    | 2 +-
 drivers/input/touchscreen/ili210x.c       | 2 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c | 2 +-
 drivers/input/touchscreen/rohm_bu21023.c  | 4 ++--
 drivers/input/touchscreen/stmpe-ts.c      | 4 ++--
 drivers/input/touchscreen/wm97xx-core.c   | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index 8db2a112a476..363a4a1f1560 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -72,7 +72,7 @@
 
 /*
  * Interrupt modes:
- * periodical:		interrupt is asserted periodicaly
+ * periodical:		interrupt is asserted periodically
  * compare coordinates:	interrupt is asserted when coordinates change
  * indicate touch:	interrupt is asserted during touch
  */
diff --git a/drivers/input/touchscreen/bcm_iproc_tsc.c b/drivers/input/touchscreen/bcm_iproc_tsc.c
index 9c84235327bf..e49bde50d77a 100644
--- a/drivers/input/touchscreen/bcm_iproc_tsc.c
+++ b/drivers/input/touchscreen/bcm_iproc_tsc.c
@@ -217,7 +217,7 @@ static irqreturn_t iproc_touchscreen_interrupt(int irq, void *data)
 			"pen up-down (%d)\n", priv->pen_status);
 	}
 
-	/* coordinates in FIFO exceed the theshold */
+	/* coordinates in FIFO exceed the threshold */
 	if (intr_status & TS_FIFO_INTR_MASK) {
 		for (i = 0; i < priv->cfg_params.fifo_threshold; i++) {
 			regmap_read(priv->regmap, FIFO_DATA, &raw_coordinate);
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index e70415f189a5..8c77e9f347c5 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1219,7 +1219,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	}
 
 	/*
-	 * Check which sleep modes we can support. Power-off requieres the
+	 * Check which sleep modes we can support. Power-off requires the
 	 * reset-pin to ensure correct power-down/power-up behaviour. Start with
 	 * the EDT_PMODE_POWEROFF test since this is the deepest possible sleep
 	 * mode.
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 4573844c3395..a8ecd0f980cb 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -898,7 +898,7 @@ static umode_t ili210x_attributes_visible(struct kobject *kobj,
 	if (attr == &dev_attr_calibrate.attr)
 		return priv->chip->has_calibrate_reg ? attr->mode : 0;
 
-	/* Firmware/Kernel/Protocol/BootMode is implememted only for ILI251x */
+	/* Firmware/Kernel/Protocol/BootMode is implemented only for ILI251x */
 	if (!priv->chip->has_firmware_proto)
 		return 0;
 
diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index 4ede0687beb0..1ea0b12b2635 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -44,7 +44,7 @@ enum pixcir_power_mode {
 
 /*
  * Interrupt modes:
- * periodical: interrupt is asserted periodicaly
+ * periodical: interrupt is asserted periodically
  * diff coordinates: interrupt is asserted when coordinates change
  * level on touch: interrupt level asserted during touch
  * pulse on touch: interrupt pulse asserted during touch
diff --git a/drivers/input/touchscreen/rohm_bu21023.c b/drivers/input/touchscreen/rohm_bu21023.c
index 0e5cc9fbad17..295d8d75ba32 100644
--- a/drivers/input/touchscreen/rohm_bu21023.c
+++ b/drivers/input/touchscreen/rohm_bu21023.c
@@ -388,13 +388,13 @@ static int rohm_ts_manual_calibration(struct rohm_ts_data *ts)
 			err_y = (int)READ_CALIB_BUF(PRM1_Y_H) << 2 |
 				READ_CALIB_BUF(PRM1_Y_L);
 
-			/* X axis ajust */
+			/* X axis adjust */
 			if (err_x <= 4)
 				calib_x -= AXIS_ADJUST;
 			else if (err_x >= 60)
 				calib_x += AXIS_ADJUST;
 
-			/* Y axis ajust */
+			/* Y axis adjust */
 			if (err_y <= 4)
 				calib_y -= AXIS_ADJUST;
 			else if (err_y >= 60)
diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index b204fdb2d22c..2228842dfb49 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -107,7 +107,7 @@ static void stmpe_work(struct work_struct *work)
 
 	/*
 	 * touch_det sometimes get desasserted or just get stuck. This appears
-	 * to be a silicon bug, We still have to clearify this with the
+	 * to be a silicon bug, We still have to clarify this with the
 	 * manufacture. As a workaround We release the key anyway if the
 	 * touch_det keeps coming in after 4ms, while the FIFO contains no value
 	 * during the whole time.
@@ -140,7 +140,7 @@ static irqreturn_t stmpe_ts_handler(int irq, void *data)
 
 	/*
 	 * The FIFO sometimes just crashes and stops generating interrupts. This
-	 * appears to be a silicon bug. We still have to clearify this with
+	 * appears to be a silicon bug. We still have to clarify this with
 	 * the manufacture. As a workaround we disable the TSC while we are
 	 * collecting data and flush the FIFO after reading
 	 */
diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index f01f6cc9b59f..91384ad1aa40 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -222,7 +222,7 @@ EXPORT_SYMBOL_GPL(wm97xx_set_gpio);
 
 /*
  * Codec GPIO pin configuration, this sets pin direction, polarity,
- * stickyness and wake up.
+ * stickiness and wake up.
  */
 void wm97xx_config_gpio(struct wm97xx *wm, u32 gpio, enum wm97xx_gpio_dir dir,
 		   enum wm97xx_gpio_pol pol, enum wm97xx_gpio_sticky sticky,
@@ -403,7 +403,7 @@ static int wm97xx_read_samples(struct wm97xx *wm)
 			* is actively working with the touchscreen we
 			* don't want to lose the quick response. So we
 			* will slowly increase sleep time after the
-			* pen is up and quicky restore it to ~one task
+			* pen is up and quickly restore it to ~one task
 			* switch when pen is down again.
 			*/
 			if (wm->ts_reader_interval < HZ / 10)
-- 
2.34.1


