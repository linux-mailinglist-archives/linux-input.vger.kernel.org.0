Return-Path: <linux-input+bounces-5046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9C931DF1
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 02:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52F31C211F0
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 00:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C4196;
	Tue, 16 Jul 2024 00:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="p8Qj9S3z"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4601182;
	Tue, 16 Jul 2024 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721088462; cv=fail; b=i/E5VG3u9tLauawBXV2FMI2gilZyIBW+W9KaTdxioprHFZlcPANb7aye1wgIBI/lYHq4n59s9N0c/GBCwPXykPp5/Ect6eEdQNcQH7EIeNb/5KOgMYjy7dfPBksYzxUtuRWGTD/0qnqUteLNjzjs0jSwMo371MTT23016L0V/Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721088462; c=relaxed/simple;
	bh=ov4trNR7VXvrjCFS0kYJBivo2i/RdhsAa4eeqDGlD84=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=txLPvsjepcdVwzrAu5duru40hVD4fGSTHokNoG+4HaPJJNTWYdsh7McCSO/6QvPOahtucjKvg/N7axZZmUu0ji6B7q/aohYxSH9oYoRCNPSdjX3lADv1mB9aUESTRflKKC6nly91yOleY3ZcAtV+W2b9vNpzgC5M6n6LDTo54TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=p8Qj9S3z; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACyhYPiWTbo/2jbjG4g6PZBVAxcEm9/mJ3vROjCFlYT4pYrghaaI+t6/ENoAGANO4iQ8e+0LKIq56cveOn9TyqRohmDNYnM3i/88bVTpn4Huqh2oHq3BIxfvAm2+PHJbRloI+bw6jxUhMp0h3B1rM1Rv9T/zVGPOtWOoSXvNFTezbXH93KFBlIq+884knUnNvFi2wjsjlyEhtz5MdJdI8SlmLxcYCmXZZY4StUG3Mgw9t5Zx5QMpG1P6gpLcQBp/xr4g/tLkH6jFRnoLjtGyAV5kKal7XO3KOpFkDFr5g4Xv1KVOW2va8vsVf2RTYtoHrur1Lj2/ErgSaOJNgjEgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjoSvhD6AqsnyHc38w0x01CZHPmVleRrB7rzLrkpw8M=;
 b=iq8g9GRGcjNxVAnc+Da4YsR8Pwol6VVkLlBBROlHxBteqyvh6X/etecdjwNYR5DKgDTku/UZiMIvzmJVjPtDAnkjVex4P0X2niaDR5aytz5x10QGfZEDkO1S9npIlkHvFyJL+jIoSyS4EpMtd6e+aFxWXcNTHGos2ivAWP82e8mYDYJRrol0MyH6zaGpyPh/xSHeSJa1Kmm5vDYfPMKRUu5VAEpfwWeVtXjBRC3qErzc3LZEnYqwA+IVVXatORLHmPNEvqmMkBem5ZQA7Sd+aPdaPs1PL8YwEg8SaoL0/UndHL7mI9bRzEaOrIGXLycOfrIDCfaklhkEuIKy9zRetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjoSvhD6AqsnyHc38w0x01CZHPmVleRrB7rzLrkpw8M=;
 b=p8Qj9S3zLrGsoncV24xuoVG4RDAIy8q/DERH2AvAFL2hp/C1a8zjHcOM5y9GAQ1KGxel3jlHEZJS+GC6Aw5xlV4U0Ns44N/BQSAEUS5NsjWI4f1HtfG5eqX6rNFU2aSVQJoBY+xitP3FDl8sZ+QgSmL2rK8Fq8DKC/6ibJm6/BQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10152.eurprd04.prod.outlook.com (2603:10a6:150:1bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Tue, 16 Jul
 2024 00:07:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 00:07:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: dmitry.torokhov@gmail.com
Cc: Frank.li@nxp.com,
	imx@lists.linux.dev,
	jason.hui.liu@nxp.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peng.fan@nxp.com,
	ping.bai@nxp.com
Subject: [PATCH v2 1/1] input: bbnsm_pwrkey: Fix missed key press after suspend
Date: Mon, 15 Jul 2024 20:07:21 -0400
Message-Id: <20240716000721.3485597-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10152:EE_
X-MS-Office365-Filtering-Correlation-Id: 191e7ae1-f727-4273-e5e8-08dca52b4ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hsw0slBTkYEMAWlo+VJrZRSwrXyj1lKkWxFuLBZwdPHb1TDjylSwLtuubg0g?=
 =?us-ascii?Q?NEDgAGa4TOAarQb4EGh5/WH2MPCNZ4KsdfzR9Q3M7vbiigVH2uCHPdJWeT+p?=
 =?us-ascii?Q?evjDrmzIfolRhOLaTPidnoOVDJKRhvQbDfmMwQsRelnAfX5vrwdx+Yrue7uS?=
 =?us-ascii?Q?pDun4ROH+bWg4B7hm38/wiE0TceOspI56pj5J6CdMzTJXOKqsdXW6dfbIR7l?=
 =?us-ascii?Q?gnhdQC7vezIQZvk4h72waK+QmiiJk3gBy4AtPhNAFvuI87VqRNeHQIC3WYsu?=
 =?us-ascii?Q?Mb3Rfr7avXPQufU64yteuEp12of6fJ7X9dyovvlYPDhybYu7HvebOz21jX/u?=
 =?us-ascii?Q?gsxeawWQCpQQU/nF2xCqnEg9goEH2bobreNhlB4Tem7wc6wgkgvd69bj9amw?=
 =?us-ascii?Q?lndJLB5xYKwTLvR69HZ3oBBbyApvUHS/g1FXrDejrMjCbaqSV/kxIMMCHPK+?=
 =?us-ascii?Q?KVRG62OHSNMFqzk1rGZJhKP91tFjBj31oy9irflEjCVeeN18ed522KbP7Ho+?=
 =?us-ascii?Q?NNNJmYcyg5VzsHh3MPtWyRWi+cclslXbThIO1RRR41Q1XdXnosLLNJRlmbkh?=
 =?us-ascii?Q?v21tGiPxn3qtPAfSrU7uBW84GRkhotJJE4vjSuYuUqVU1Q4Ka7i7LfgWOq5c?=
 =?us-ascii?Q?x2/JRAKYVfzfiRP5bsisePmH4ESWQ/4QJtX9BU+o8j9HbhgslkZ/V4aNjHEK?=
 =?us-ascii?Q?QdrE7DLos69euX7r4hjiNYbnaCu18kUzUiXDJJgcACzxREeClmn5f3tAEnlw?=
 =?us-ascii?Q?MKJN86EPTqwH/f2KNBHe8jiel4KZQy2dMV9z8vI941uYWbesq9Ws0+aNiCT/?=
 =?us-ascii?Q?rzAXawzTX8qiiutiKrNaEMpc5ywqh6om0uCtU964iIqPkOZP7XsXvc6TCO8h?=
 =?us-ascii?Q?wQFYrp0Nr2GyA/EpofxM9ETVmHRvHb8P6C8Rwytqi3ZYK2cnfFQE1UspY/rr?=
 =?us-ascii?Q?xmzx6mhoAsjtVHy2tet/ZKxj26HdUJHj3jm1InpkIN9NPK2zHx4xA6v0fb5g?=
 =?us-ascii?Q?7jxtw00PVkWqLno6Nnx6K4Pj8bAMW9BriGrCi2BgkZav9YArVTkMbK7wvuHt?=
 =?us-ascii?Q?YEvVpD2qupkJVjk9spnJNP62TDNa8Wq27dOxguBuVEogsmTcH991sX2+/fG5?=
 =?us-ascii?Q?h6zfgk1ibkyr+JHTduXIAXBGXr+Vb0SYCeEp4X3kqyrdnExuNFXoNNj3165S?=
 =?us-ascii?Q?yIuAi0EMSKZbRS5MAki8zY2se0gnrIjdOR4a/g4E0bVX65NsH2S984jvh7Z2?=
 =?us-ascii?Q?G8WU9ySoN997sZ5sJiihMe93CyzLhdV1xjwMYK5N69sSZSFZE90detAEMCyu?=
 =?us-ascii?Q?4vFGjXT0qu4T7nw3R6vRqVMCWt0PeBHOolmOTpdkDhjfydMRfVz+aSgfFqmo?=
 =?us-ascii?Q?B6/5YkMbSBVU4o94fZARlfAazv7sbawJcNsLjoKAy1I0dSCJVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wt0qtQoRaVUgnwR7m+7NpVhj1dDATlJ4st/Npa8IYqb9HZIJSQfr3BOMEa4N?=
 =?us-ascii?Q?Fv54f2HnER0E35ENKatWl3DwPvZTKyaG9ISNy5/iz3gTW+Qmap1kuRGK7OKN?=
 =?us-ascii?Q?+RCJgU87pGi0vNG8WK7em4N5YBVyPZNmBdkJjOFs3JYDo/ckzuKqWtVTikjT?=
 =?us-ascii?Q?udBnG+9SVLRKrJSXs4O+mxlJSe9YlGzC3TKU+SOGPS3USWHasR6esf7JYPNn?=
 =?us-ascii?Q?BPKUf6ocPMW8nJdpcviBh+GTimGEecTNeHej/Um3oQ3u7PrMBTWpVCRdlYm8?=
 =?us-ascii?Q?2/EP0BNXUwY795En2tdY26TACb0g2/tLhcRyY+BYoeRlhWrIoGSEKK7pBfdd?=
 =?us-ascii?Q?7i3MWtBkAMqKWUPqxtqJnWm0sUiv25qMATmQ3u+LyHJd/Df8Rh2a4svn7RJp?=
 =?us-ascii?Q?dVFeCQGNUk+ggBtGeVRN5QSNzoqso74o2FnfS8XPoSGP1IXzZK1Mgi0Ztojz?=
 =?us-ascii?Q?3DN6QMcn8fgc1MiL/+ZHYprWtuHZbo3WkBLVQ/8Tf+bnYKX+84jVZak0iCZA?=
 =?us-ascii?Q?6LKatbkpRLsfYDkpMnda9+hR1U6FPeqBPhypKInH7BKFbI65kzKh0OeTkUEi?=
 =?us-ascii?Q?gJvTbtijo+nOomSkfbpb95eKIzm33Z1ML6rhpyEHaklIWHn95Y5HQqvdPsTh?=
 =?us-ascii?Q?SsdNOWufZHKLLJyLIhmRJ6cMvddvZBQ2D2frn8rUMdoK+1VXxShxD9aiHNvv?=
 =?us-ascii?Q?DClMQHfHzB+wqfEgX0VIjX0dH4TVheg60WEeOYeLDwdmgaALapISV6kqF5VQ?=
 =?us-ascii?Q?7+7KC028p5JYzdTVfxidbBanS/j5CqHW7HNnABVBvdFcKHHxHNTyyEHTdad/?=
 =?us-ascii?Q?OFAkwOrTA5od5Q+NaRtpcBf/DFj0nsW6sesO64lnggKeYPgLlKZ61BnAjrze?=
 =?us-ascii?Q?P9WUeIh1d6vsFs4rPt05vv8nhDDqWLdXISgJvPrwrL8q6awgLvLTs5ArlDYW?=
 =?us-ascii?Q?qhR7MlA8nVz8d+qHyHd+aFVlgh0SGonHzSzNqJCbr/9FWOgbFPLKyIfPjhCe?=
 =?us-ascii?Q?hJtCTMZnAqiVw2FpwOUQfBhxqm+svZpN6MGOOU5yPB8CsiX1OudqsKhUSG+n?=
 =?us-ascii?Q?Dcx2qUMBIx9K2nIvS+Eh8rba1gyY1tQQH8G8DEU6Qw72cJ8DzO/iEA8e403z?=
 =?us-ascii?Q?Pxz/2tm+icdTuhjWafah6LZjQbTgyLsLXcO7BDojZ+rb5kjgqQl4TjJTR7mg?=
 =?us-ascii?Q?lDS2Aqj7+ZrlUfbyhZlWmgjTNL+suGbmP34QsCJ4OArmSg5UHNQmqaXPp8HN?=
 =?us-ascii?Q?M3jyJT52PynJB1+IZkh3Zam/6Al+3kmjZCKJ5cGl0r/yXZaTvbacRubLX3tv?=
 =?us-ascii?Q?v2ktDG3ekhHJaM8KNd7T5x4r6D8BY9MFtE9NBSwzLV0LxGYKPdiy3JCE10+Z?=
 =?us-ascii?Q?hHHMjBu1tmwHdkE35cLSJ1ztK560fnsmY+mVjR1uSOqECjawRDGfvt1jJ3Zw?=
 =?us-ascii?Q?6wugc05X3Ikd2xP334SlXNWJnhvHWDAXoxU+ZRc4uGM/9V3EjfT2k/xoH4i+?=
 =?us-ascii?Q?CjqxTR8XEJTR3YW6FgSBUTSCT1STD8MwSRpvLBoUYHkxapqCUA4TR34ky2Ez?=
 =?us-ascii?Q?Vw+B8RkaALEroXHk9Yxo+Zvqb7pM0EYpFUa6qXot?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191e7ae1-f727-4273-e5e8-08dca52b4ce4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 00:07:37.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+a6Oq9ZrX9TsMSc/bhhbcvvVN/lTXDaQmC53oBpjxPXTfmkqf3WrnDHQZ9RgFCkW8OUHu4rN1dQNRu4pbkEug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10152

From: Jacky Bai <ping.bai@nxp.com>

Report input event directly on wakeup to ensure no press event is missed
when resuming from suspend.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Jason Liu <jason.hui.liu@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- move before mod_time
- clean suspend flag to make sure only fire once
---
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 1d99206dd3a8b..eb4173f9c8204 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
 	int irq;
 	int keycode;
 	int keystate;  /* 1:pressed */
+	bool suspended;
 	struct timer_list check_timer;
 	struct input_dev *input;
 };
@@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 {
 	struct platform_device *pdev = dev_id;
 	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+	struct input_dev *input = bbnsm->input;
 	u32 event;
 
 	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
@@ -78,6 +80,18 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 
 	pm_wakeup_event(bbnsm->input->dev.parent, 0);
 
+	/*
+	 * Directly report key event after resume to make sure key press
+	 * event is never missed.
+	 */
+	if (bbnsm->suspended) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+		/* Fire at most once per suspend/resume cycle */
+		bbnsm->suspended = false;
+	}
+
 	mod_timer(&bbnsm->check_timer,
 		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 
@@ -173,6 +187,29 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	bbnsm->suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused bbnsm_pwrkey_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	bbnsm->suspended = false;
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(bbnsm_pwrkey_pm_ops, bbnsm_pwrkey_suspend,
+		bbnsm_pwrkey_resume);
+
 static const struct of_device_id bbnsm_pwrkey_ids[] = {
 	{ .compatible = "nxp,imx93-bbnsm-pwrkey" },
 	{ /* sentinel */ }
@@ -182,6 +219,7 @@ MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
 static struct platform_driver bbnsm_pwrkey_driver = {
 	.driver = {
 		.name = "bbnsm_pwrkey",
+		.pm = &bbnsm_pwrkey_pm_ops,
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
-- 
2.34.1


