Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B4E7BD53B
	for <lists+linux-input@lfdr.de>; Mon,  9 Oct 2023 10:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbjJII35 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Oct 2023 04:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbjJII34 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Oct 2023 04:29:56 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2076.outbound.protection.outlook.com [40.107.241.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2338F
        for <linux-input@vger.kernel.org>; Mon,  9 Oct 2023 01:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNPBXDC947WVMCtq/d/972gLY2OnK+m5aChSXjaLhYdCtz0DQlZZLMLyDTLj6pGaod8HmQUS+6GSqDx2amkhDe6RtD/oZdM+8WuBWeYTZPaNFcMCBbdG9tScNbS/600NT30Z6jj+vIM9YG9yQjKyXRpzsdln0pfT9gGufm2HmQoqE1BbtCmm6AfkBBPTLjhKcBTOi0yhPnSTXcds+28ilU9z6s9htKq8G/dpVMEyFccLPlC22VUhm4pLqD5+jD7q70Qz34E46Md+SRCb7YtwD3UQ4ApH2+Q8kYj42pM4ODbWaLLQVrIK3LnaccEsHJTXwY/vzOBBEQPWbZmyyMsrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV66txTMhbDqIoxpaDncP9i0z99yOOF5b+KqankPiUI=;
 b=O0pJcKYSCY2XIyBy930uYx23UQU/GMSGle+cU5b7L0w4Nv8kQxfhIFm+FYfQaoOO2g0+lXXcP/+/rDMGfzszXk0pNkRFC8R2BjYzC0bnJ2ySApWyKXnCLUJaFwkw3Q/JF9xqqEFENzAPlerpPp4rqO6MlCoaNyBKX9W2cLXOaV0tej5FL0Q1hRYqL0WNXI2dfTU1BUZjd57efFSe2jlbUFuA46A9jwtNt3suwphALPdORo8jWCjEqk7C69QMqjwPRvNKpRfxudX60C7epW+tztfvFpEzEFe106JR/egeFzoNTsrL3A+eDd1jFUnNGG9Uhw8BwTUtgQ4STiZzOUR4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV66txTMhbDqIoxpaDncP9i0z99yOOF5b+KqankPiUI=;
 b=b0N76JrwVK2z7+BmlY59pUUsvARtX5Y3UvjnDOxTqn9rQ5C9A0toufRBh49s2vWcUJuiCYDkM3PL/4UuIyhw7o93+7Ak70POuNiBYVxDWKiiMtTRnsIMjvKnl2CW4NbBgh/RUenRaXcsYvT6hyJh0sS6c+WR+IWbnK2dBsUqOcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS1PR04MB9336.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Mon, 9 Oct
 2023 08:29:50 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::258e:61b0:da64:d168%5]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 08:29:50 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH] input: bbnsm_pwrkey: Fix key press missed issue after suspend
Date:   Mon,  9 Oct 2023 16:34:23 +0800
Message-Id: <20231009083423.1937885-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS1PR04MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: df283fc8-8651-4bcf-7202-08dbc8a1e786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqrVVeYOPbFWYgiuib4mojJ1hP7FSbsZLWEEDFnXlfKiMAI6e8zRfkYjaY6QOKT9o28xpZWLTAjyG2eAbMK3+5DkG7Jay6mVsszXIdw3ZGjoP3aW+/XmARXdyZHeEdzgw8H1RIDBf2PX15tAQA5YK+kW0qtve8b06RUpKDSeDVhIaoHZdgmS9PgcsPy5B/kPuem02PSQkKLtJFnm3l//ZIrTOsO/BXeM6GFFE8SRlt8jEHlRxYBWB+oJy2whRUCR6wXL7ftrDYuWwMIRR7VCaoCb3bVezPzdnSdnjL6LJsIhODdPF7DNtwYUsNX5/tx6YgUYxLw8IE9xA05/X7oYOyD6uDBFFTGHNgH8OdeRQYZ/Fb/P5S7UANV5hOmi9QrGYJpPeKhOfsfQ3e9Hs/8BcbPNa5+1BOV4JxM5QofHNOqvtZA4LgPaRZJ85CD1UEz/sejZk1BiqKsbckuTcU8M7wZfzYP6YidA/SRaDyhK/R8RHAp3/png3Fr1IoVXTWCzsQsmSVKSRfWOnCJ9GGJMGbfgitmAkoc/o3Ubnjg0O4lPJvz4uUq910w122S4DOz32X+F+eVEv030s1pSh2dcfmAEFk3nzajjyzZwRbAcSnk8IYcNdv+nY4jlWXh/QUob
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(15650500001)(8676002)(5660300002)(4326008)(2906002)(8936002)(41300700001)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(52116002)(26005)(6666004)(36756003)(38350700002)(2616005)(6512007)(6506007)(86362001)(83380400001)(6486002)(38100700002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EVMsv9VUHded1G72dpUVnzSvU2cVU4ccdVat9+dgzwLo5M8xZptlj92TG/Gt?=
 =?us-ascii?Q?9umTd+Y3/Oc5iF+7LjBrfud8BvvI2cf0rcOIW76sS++nIMzISVuwkXudNCIn?=
 =?us-ascii?Q?7Xk7OgojULAYLEfuYvPAgtmw1Q3FuSFEITQ0e7o+sUJIbbN8ff+DxgqdXAYv?=
 =?us-ascii?Q?2Tvxjx7xDN5bOzVpzakltE8eNkNqCBkKJZhKH62JO7j7MUf20HBfC64ijF0W?=
 =?us-ascii?Q?JtknHd15Emk57rxu0TmIK/9NbhFPQR89RL/jDFQz7g/x+Qw7c53ctkiOBYT/?=
 =?us-ascii?Q?yKqHCE4JIQT/PoSWL8m+HqI1qLNgbFaqUPQiQ6aacbsD2752qBqsdVksQeWL?=
 =?us-ascii?Q?l4LOgtLUEo2dOqB1wW0sbmKXiK9Trx3hfoNsj9/4oU+svoyGiZbh8TIYPdqD?=
 =?us-ascii?Q?/q5FucTK1tCzeMRkvhoiPkR0TK6nCyqxmk9hKvredjDpFJAKrWMO/UhgCiot?=
 =?us-ascii?Q?mR0FWILq/36+Cj1kQezXFlDORH5pK/5xHWrarJhaZwuS6StuugVvP4QOSrWa?=
 =?us-ascii?Q?jPqXzZ3uPHMd1TIb9XIy6BKpAdPAPvTWLCD4yU2JvIlLxu6hjC9+dSrQKpZA?=
 =?us-ascii?Q?SqMPj3zM9ToznRMsmQ2gcVdjg81J7H8KU9HiJ12SJCVYKgf0US1q9UtJ2YQI?=
 =?us-ascii?Q?PjcOHuRWi9Mb/v2HscUaZK8RPerS5CzJyoGaap6xCLHXe2iBJNgIk3sJaT0Z?=
 =?us-ascii?Q?mLSRyjmoIIS+iI+eBPXFCBj4lQRGfcfvPQQyukY1/AsbRjt2yLSqak0xCz9l?=
 =?us-ascii?Q?TvJ5NTOrhSk3H7Vu71DU88dh+yqLLkxaHyEY9ylPUmLa4+gOCJFXz+2kHsGv?=
 =?us-ascii?Q?hPhp3jlp2QA66VxLiQ+F2VlLF1sqcyb0FZ51f40EER7lTGGEPMRKcj8duypb?=
 =?us-ascii?Q?PfeWfBbeAwHAjLYb9lR08lUfnIxlqJzeucDjfjrm79yMVXkSOuinxdofnlvP?=
 =?us-ascii?Q?WOnHsA2HxyEnUTcxJ2kUcA8QxMGTv04jvSPam3Zl0xgJwQy3FJH0uMMtkPGr?=
 =?us-ascii?Q?BtqTHlXHBXECDuiyezBV+R2sug2cOTXubsIzDSyyyGmpTfKYXTx3oBBf7b3x?=
 =?us-ascii?Q?BEFjIOWlckEmS+UmN0iPq3Qq/HlIibQ5bhlLK4h0Xs7oKkpS+/WC0pxMZsMq?=
 =?us-ascii?Q?TfgPZ1wWnUBFVc6zEwR16RUpniRSGD1ECRLGLRQe1jLOx6C18Du8CazUdM9a?=
 =?us-ascii?Q?CRjsCd7MC4amn+86yB4O57YEcHIMQciyiScP121djW0Ry59hjJ68NmBCtKHD?=
 =?us-ascii?Q?HR8Ap81VtnfefODqTHaj+SztjQg2B5mZIOfX6El8Ns62aL/FMMU57qIfPon4?=
 =?us-ascii?Q?CLphvr3Fu1k9etGqYz/2eqJ9G9IjjpBWdddiJ0l4wNVN1/bLFgga9/iQLlbp?=
 =?us-ascii?Q?Mox/ROONy+cDJ3B6ympSvodU7jpTplHuOU3ComA4WbLM49goU8zbl4+eqSdH?=
 =?us-ascii?Q?L3PH+WyS9PLSI6bDb9Y+wIycNGDvoQNMfwu7mWSXFZt7X79QcNr34KClgy/r?=
 =?us-ascii?Q?wxmSOlw3jNnuELyAF3eCoaE825i7W8Qmp5r2Z13NUcyYGSHAvQPiQ/qincXY?=
 =?us-ascii?Q?2+mSKp9apVh9dikH1/n28uew0PAvSnmTCMw8RVe4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df283fc8-8651-4bcf-7202-08dbc8a1e786
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 08:29:50.4720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1QvwPS3XHKMa9BjCSO5aDkJD537MIRWcRzFpOxh6pV6tCoWIHGGTiN1Lk7+WgvfZFJasBfE13u67h/zbxnkMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9336
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When wakeup from a on/off key press event, need to report
this input event directly to make sure no press event is
missed when resume from suspend.

Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 38 ++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 1d99206dd3a8..55d4fd115887 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
-// Copyright 2022 NXP.
+// Copyright 2022-2023 NXP.
 
 #include <linux/device.h>
 #include <linux/err.h>
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
@@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 	mod_timer(&bbnsm->check_timer,
 		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 
+	/*
+	 * Directly report key event after resume to make no key press
+	 * event is missed.
+	 */
+	if (bbnsm->suspended) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+	}
+
 	/* clear PWR OFF */
 	regmap_write(bbnsm->regmap, BBNSM_EVENTS, BBNSM_BTN_OFF);
 
@@ -173,6 +185,29 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
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
@@ -182,6 +217,7 @@ MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
 static struct platform_driver bbnsm_pwrkey_driver = {
 	.driver = {
 		.name = "bbnsm_pwrkey",
+		.pm = &bbnsm_pwrkey_pm_ops,
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
-- 
2.34.1

