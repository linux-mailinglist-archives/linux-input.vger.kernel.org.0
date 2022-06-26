Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868F555AFD9
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbiFZHY7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbiFZHY5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:24:57 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFCE10572;
        Sun, 26 Jun 2022 00:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFzurR5TFalY3Xg2YKFt8vqHX0pB12GaoYuxjKpzGFh8sg2T0OY0iZGe4XlrflmVVBHl6xcqEdBbg1gmDwBk1gyMAPFrhY2Vyoyee/F1/2vtPBeTljGu7DN/ODKKLtzHhDDVviDfTyqh0wPBLKl8sTQiT7GEyYq5jGeaJeuaMepqCrxFUFcgPV5f5/FU2wZmoa1QzXV1ZBHpFw9rU7tnCxfQfiSqlDwoxrNSuLNgbla9ZMJXdRpKv43QK83Rkyi+IsjV6Md6RTdKbgg6s6GoCpTG9Ikwrbdz973ly87OOryGVFgKiyVXLOA7yE7GJNdI3Ikm8VRseSpff+Jru8hOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3hiU32w71LTdeLsKDE2RzwREbbziN/WAJ9BLsgG1oY=;
 b=B8DoHKZrJTcGphYcqAEk6kY2FlyExtXOA5Pr7ZNVVUC4OhS6CI8MXGSx8PKxNToNZQqRog1oVYQOFkF6SYej3Yslu5OxASQMvDD8buwwrLz3xPNOHUAB37eMI/abNa3bCs9Qc7w+3Ql1i0ki5R+SwCFXflQfs3I3DLRFzRLsE6EFVYsvRNbeYr93yXAmnTq85iLoPKy043uOuhG1ls7YohFiU/MGDPMhCtVkg0i6vymzYNWz9VGvUY9FUDMyyfcll9eNBMbBOHAK5hdreG5scMuaPDKNB7XTlnNBsfhsiCiiwrbr4iYUGdteYgrp9kEropd7UrDWcgAmQgZ6yIH7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3hiU32w71LTdeLsKDE2RzwREbbziN/WAJ9BLsgG1oY=;
 b=yerrD+CPyqiL22JqJuhgXKELH87gXSY4BVjRfmqJJoIYm+pzDDnLAz3JmeePV7KmnkYMWeRTBAZcQSWFvBuI6/Hv101TPzcU97e6SXhXzsFNJcftzVTzTzq8o+wW87EG1ujkZDVOAUwojQ6S8k+LZvirFF8pvmue218wvK1Xbxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:24:55 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:24:55 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 4/9] Input: iqs7222 - acknowledge reset before writing registers
Date:   Sun, 26 Jun 2022 02:24:07 -0500
Message-Id: <20220626072412.475211-5-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
References: <20220626072412.475211-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d8c525c-b2a0-4d4f-5ccf-08da5744f7a5
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4kvyk+F0+ZRacQJntFHBzRD87ztwohu7gmjX9YQJn6y/+nhSEeejh2O4pDCMfWTcYItGisix5jtbzzrxSj43A+gp5Q6eMafKpxyn8QgTMnl7cHIndomaxm0clJygjdXwzm9alhOd5PHIg9EZ8Rn4rlm1JpTbboGqsa5Cn3iIPHszimROHwEzd/pfrkQNnMZora1nijteoiW+c/qgcTtYYiHAZw8zhgkhZ9yVKwy9DiisSXnbWlWYZt+SH/8EWV4hTj8NHNMD6fPZXtwTJlZG5acW6gFHmzEdpIO+R1Yad0Fp795Ygq54ovZJi8jpXi3MzP5o/jmuffwOaAz/UN8csGTAwJ1jPbDFNKzA/u3JreZZVsxGFE78630X9Ga4LT1Zbx4IkbAZCjWkJiF+vmCsVeuLkXGj0zC+k7f6WP7lQ3soeSwhrosReCMeFoGMarr86PhAiUAF8JRjdqMufwxmvnFy1Knt7kBZhqGsBskF+llihC9dhYHwQ6ct3EdD0WIAwVTBpWGAElXiOvZujxR/hcfXISvpIw3ekx9BMuzjXpNIxC04qbDnGv/2uj5xvBdVDrwIDVSZ6Kx+kLm3/P07cYuYfJPU2DExhT0zMw+YNuDtIf0q8py1hGfpL5Hyb67+nmpUGpskZedgrmpLGbxtNsmSRZaScpvbXhZrg0BlP54wYyuzAOQVB5uAPd4qZKHSGEtdt091/qdOZTyXPDGnvg6SXeVVKMJaec0LcRFuISvdViL9G+6ZBBW7JFHKhsEuuM7Mf5+GST23iic7WuYK4aPvHQ/wCnrmAagv6qj3W0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XT2Lk3jQzOxD+h2p3h/MfOaVZcw7poPbTVG5Dh8khLF3YCnIq/WoqRPKjAyq?=
 =?us-ascii?Q?wuKetgWN0YKOzIM1LZVWz3bgV3Lb1giMSTLo7g6xZcvWWu3fACWMVuUsJuMw?=
 =?us-ascii?Q?sUK4dstjKlyfNDZla0O7OYRQBmqSmBb7b1WgfBus1VCTE4JS0oK6nqebJaxm?=
 =?us-ascii?Q?nfB+3+8WIonKCDW5XWvKz0vg2on83R+o2hnjxzFe25yFxuxlViTrr/ruWv0j?=
 =?us-ascii?Q?1vZg61g78hv69GYvTJT9rD+e9Q8SL1IWbeeQGC3vQGpnaF6XFQucgSTjih8n?=
 =?us-ascii?Q?Ur1Ts2Kd84IvKvB29t6IF16NHk03tYZHvo+H70r+D9WeaRk48zTHkAIBnoZe?=
 =?us-ascii?Q?V8tHhHLARt95qscXWWuKVLCttmesacHFPwXdeyhbpQm7cks+3/uj98fw4reo?=
 =?us-ascii?Q?O1LyfiLsVJWLAWTO1wOZcK+6//tUVgveZN3vEh84yUF3Jf884kd0I1P7jbRX?=
 =?us-ascii?Q?Mk6dYwul1vNSJ/vTGo876DD8Uw+GIWLhnFH9CU3ei8+R/5nKVEGqrlpNzecp?=
 =?us-ascii?Q?fR9H5S6xuqDoYzrOz2trkW1oUNZwipg54Tmau5rYI9Qn/grgaCS0ttPNkjHs?=
 =?us-ascii?Q?/jk2sHANIZWwq78opPVtFlgscNwLIHZAEiVLGIvDc8NDSmvhgR7L9Tq0/Xhr?=
 =?us-ascii?Q?3Nd+ECBQTseFAUBOlsKh90Ro4rTejuGleOVD+VgOLNMpKHYXRuumq78LDe71?=
 =?us-ascii?Q?QvIItVJVoa/mGbkK9u+qaL/xnv3h6zsfcqY0QWdjsrYV5bUL1itcu+Q7mUc/?=
 =?us-ascii?Q?YUzZmY0DuO4DkpepYup0DwuKaIcBbppzQh8bUkduS2xWtNRjujG8FqY3k9AB?=
 =?us-ascii?Q?CruHO6Hj8oUMuqRr3V5ojQR8ge2DKwyMcxRaCydDIPem9AXPwUbkJb8dhz/Z?=
 =?us-ascii?Q?AOk8hyPRB+iuHaqqrtJdKW6S4UxkQPF37GqjL4h7gHKnwNEM50wTXnKUBwkm?=
 =?us-ascii?Q?QQ3vGI85M1RmK/Gasfi9QGNkKro6XmU/A009Zc8p2uYAcUamea8acYEUUmwE?=
 =?us-ascii?Q?HgwFhtZzujww6ndGibx0y/2hENwXx/DZCuRNwWB6nu8L6WO2MtyJVxUPRsiy?=
 =?us-ascii?Q?pAUYHcdS34sWcx2/ySIJ8nD36jO5z1cinB62AFibCX0HsfmeYP3gkKO1C7EX?=
 =?us-ascii?Q?Kx4SDZHZ/4sJ7vcPpj7/5VzeI6nXgTOFhRehK6IbEr0zPva2MhwlzbigKzbP?=
 =?us-ascii?Q?sEXGO+icoh9/mjfMXdnUg37yDjbUl/txM3jwqHq3HScwqq4AgfZAN7ALkmzu?=
 =?us-ascii?Q?zovNme8V3Atxhd2cnyJJCifjM0cCNac0yTmTbk/33HWggmCw5KI/PIscTzlt?=
 =?us-ascii?Q?RNb+VZAgI5uY3LED9I3rQBwUOBULJRPZvfYDaG/eJ/A8C3K+avyxK/omYHuD?=
 =?us-ascii?Q?jxwuc1H3iFKbmHWhZ0DNIaGHT2AVzdEoHn/NDAKPVuEC9GmZq7T3cR/c5lri?=
 =?us-ascii?Q?LSvL0zhnFOJknECcrpFvKMb1LC8WcHL0/EzRO9CHuz3RZXeA9u3kGKDn1s3p?=
 =?us-ascii?Q?dpAGOiIzZfISDgdNGWB9DTKbXdE8oX78zS+Azuxeo+7Qwv/aiRClIV9PpI8F?=
 =?us-ascii?Q?WuICd2Kem11f5yluKCIuSRlmZ95kBLGL4vIq0Bv2?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c525c-b2a0-4d4f-5ccf-08da5744f7a5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:24:55.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sJDpaymZNSKbUluP0ATlCRR8Uw/3+ezfGfwKY7LEniQzltJBY7CpdmDLvedye9iGPHsDEALXEvZC9SqY0iTtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the device suffers a spurious reset while reacting to a previous
spurious reset, the second reset interrupt is preempted because the
ACK_RESET bit is written last.

To solve this problem, write the ACK_RESET bit prior to writing any
other registers. This ensures that any registers written before the
second spurious reset will be rewritten.

Last but not least, the order in which the ACK_RESET bit is written
relative to the second filter beta register is important for select
variants of silicon. Enforce the correct order so as to not clobber
the system status register.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/misc/iqs7222.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index c46d3c8f0230..aa46f2cd4d34 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -94,11 +94,11 @@ enum iqs7222_reg_key_id {
 
 enum iqs7222_reg_grp_id {
 	IQS7222_REG_GRP_STAT,
+	IQS7222_REG_GRP_FILT,
 	IQS7222_REG_GRP_CYCLE,
 	IQS7222_REG_GRP_GLBL,
 	IQS7222_REG_GRP_BTN,
 	IQS7222_REG_GRP_CHAN,
-	IQS7222_REG_GRP_FILT,
 	IQS7222_REG_GRP_SLDR,
 	IQS7222_REG_GRP_GPIO,
 	IQS7222_REG_GRP_SYS,
@@ -1348,6 +1348,34 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 	int comms_offset = dev_desc->comms_offset;
 	int error, i, j, k;
 
+	/*
+	 * Acknowledge reset before writing any registers in case the device
+	 * suffers a spurious reset during initialization. Because this step
+	 * may change the reserved fields of the second filter beta register,
+	 * its cache must be updated.
+	 *
+	 * Writing the second filter beta register, in turn, may clobber the
+	 * system status register. As such, the filter beta register pair is
+	 * written first to protect against this hazard.
+	 */
+	if (dir == WRITE) {
+		u16 reg = dev_desc->reg_grps[IQS7222_REG_GRP_FILT].base + 1;
+		u16 filt_setup;
+
+		error = iqs7222_write_word(iqs7222, IQS7222_SYS_SETUP,
+					   iqs7222->sys_setup[0] |
+					   IQS7222_SYS_SETUP_ACK_RESET);
+		if (error)
+			return error;
+
+		error = iqs7222_read_word(iqs7222, reg, &filt_setup);
+		if (error)
+			return error;
+
+		iqs7222->filt_setup[1] &= GENMASK(7, 0);
+		iqs7222->filt_setup[1] |= (filt_setup & ~GENMASK(7, 0));
+	}
+
 	/*
 	 * Take advantage of the stop-bit disable function, if available, to
 	 * save the trouble of having to reopen a communication window after
@@ -2254,8 +2282,6 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 			return error;
 	}
 
-	sys_setup[0] |= IQS7222_SYS_SETUP_ACK_RESET;
-
 	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
 				   IQS7222_REG_KEY_NONE);
 }
-- 
2.25.1

