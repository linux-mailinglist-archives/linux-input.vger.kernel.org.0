Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 492DF74C680
	for <lists+linux-input@lfdr.de>; Sun,  9 Jul 2023 19:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjGIRH0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jul 2023 13:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjGIRHZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jul 2023 13:07:25 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98D9E7;
        Sun,  9 Jul 2023 10:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxYVVxg7508558De2AYtpdqyFts+Yt2w3SLMoMwbleHzGJ48h5bKKyFHqVHGMveKu4g/InHBwS6Dr15Sj9cJbRNInHU8JrlIINPZFdkxMPICX2DJ3RGezLezL74hKuf0Yg+cb1Ai2MJSha0zW8NcMYe5tYEfCGbIbco9zN+q98e7ugBS+7uspIIjBR35NLoQdzX8ughksM98cgiJi6cJuwkGMuW6iRPpw9vChc+thRK35fzooX0nX2MFA4t5fCuMjGP1Tev6FsXtKPZELuyMVAn8I39KS+6OlpbqRa2h0M9He9zylKnJq6dfS131lBRSJRS5Gw9SRP+QhdoDnspyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjP0iHJtkb3l7XAg7I5b2gu7Ixfwv+YCG7Xi1a5xioA=;
 b=IVFOOB9e/tfw0WpWrqFuo92R58JmSSYqDKKocGOhuZvb39S1ZR12ZsI2c+gd+KxfIyNm70vVwICOZ7qysjqBPd1K1CWsu0FlA1xWp3ZMFj8KOTmmhXXCMQxBVQQBD8JqGtlcpC+UHjnhwP3td9ykva+eVsGtrm8C+sIPu4RB3mcJmx4fGuj/6hvEy6JApkGYHWXmR2JIDSUGc4wXQGoZw1XPSZPnLTu5j3a6X2b4im+eij2QLSgzGn2i9Zv49CWvQ3VMPfbqBe1PfdjD9vFiSegdV7Mdm9NwNcQWF5M7vS62oCVqrBcOFkFQ57KLKJRKtDUFU3C9K/ke2wEO/Gsm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjP0iHJtkb3l7XAg7I5b2gu7Ixfwv+YCG7Xi1a5xioA=;
 b=VgcvQhQvPcmjZJwHuGNS2KH3qQGja30F7pZzNxLT7rVE1Dcz8efLqzw9hbNmYJUkMwcfubkBrHvMD6C/lQPrXq6fUiv72Dn6zrjxNCU4ImJnX5JoWWVMu6r7/LwzM6OtLS1hva1pVqMlOJrgtXY1ToZM4LI5FN1s9Upe1F9OHM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7020.namprd08.prod.outlook.com
 (2603:10b6:510:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Sun, 9 Jul
 2023 17:07:20 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae%5]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 17:07:20 +0000
Date:   Sun, 9 Jul 2023 12:07:18 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 4/4] Input: iqs7222 - add support for Azoteq IQS7222D
Message-ID: <ZKrpRh6RT6+6KrMQ@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKrotyhz7eueujys@nixie71>
References: <ZKrotyhz7eueujys@nixie71>
X-ClientProxiedBy: DM5PR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:4:ae::21) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b3a844-7497-4df7-d5a8-08db809ef4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FicT+bWSgkYoACqEFR/1wpTC0NOlDDhF4n34v3pKGWNhOilACPGgSseQ1j9t0QgXHP8ONimAY9Rg1cqn4RR3hVFDQJfXzm4YMW0cUO1RZxL9N0RnCabHnua06YfiOa0SBcynrobEoL8BHMxhZEzYw72h11ngd3XNYtcfFZzpgrbymqfceEfYK5jvnQZt03+j/nDdM/1zbKntifAIA/+5imc58G9srTnG1ALklSM5YyHF2jW3n9q4wmX0k61lHuUJIL2iuPorsc3Ua5ETLuLsBVxQkL6Fi6E10BQSknMgBzx0HKJYf9rwZbuGK9ksAb3CENBn9QbVfxZ6jgu8kORF9trnYACMkqlISr7FTnH3pEIWXhO/k74VbzQkOy159EgUWr11Yw/FMv/S/WOBkMu6ygBcqX6XX7EukPaVoEHhnZ5KKY7a54maBRHTAkYUlefl4dwA+mouAhSnnZlLmPTjJpYCwix6cgkzQfBE6CrMyGBoaO1KMbLbveOlqVOb8gGfkpuOoQomtNHX2kmTytdhkhHeFpy3RPTh5paX9Qw5EM7xmjTk0ap4rBW2Vo/wTWfSaTXuz15xNifExVcymH/tK7asCX3btv8YH1ZCwrE2KL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(396003)(39830400003)(376002)(366004)(451199021)(86362001)(38100700002)(6486002)(33716001)(107886003)(26005)(6506007)(9686003)(186003)(6512007)(5660300002)(316002)(2906002)(66556008)(66946007)(478600001)(8676002)(8936002)(66476007)(83380400001)(30864003)(4326008)(41300700001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIQ0dudaK16fYaKJt44r+LdkHUiZcBDFIG5yLGrIvQVAPauAWFrpQhMM5TMM?=
 =?us-ascii?Q?oa+DqoPlNt7OdGbech7Vm+cwKr1lBVNK0q+QxbXIzDo10y+CJHzDz+Qsrvnk?=
 =?us-ascii?Q?wYvuIp1QZS+Ev2unICD/E/O33nStrtWlaCaAvgl7swjUQTeR1t2iwJN8eFs4?=
 =?us-ascii?Q?nT/QIhBitoZPbwa9sE/KBdnCuJsrGePcDUMAOMd/6Fvk5nDHiKgCMKUJpgSZ?=
 =?us-ascii?Q?IujYKru02vUrTvVL4awFCuq2QbTf0AC1hAwdsMYzHyIBXy5fren5qMlAvhHn?=
 =?us-ascii?Q?ofFCdGITQvQOOukGTsTWGDK+DOSrgAqcypw0UtVpFEOHS8LsVb2gg2NKOy7p?=
 =?us-ascii?Q?o4/pJZC/siePqojgYRUhFH3EJBAaPfPzoeziEa0gn6dasfYf2lQiz37xPsfE?=
 =?us-ascii?Q?Egi9+gBgPq6R0fEBySMXOWtx6407w0M34V244fCwo4elUZAan2xOEbQ991k6?=
 =?us-ascii?Q?JZJzatD2chxfEoH6VUqhKX+mUPsz1y+Vxk64FL+AN4eOF0zmtLGOgPVBoIOh?=
 =?us-ascii?Q?aY4F3V8QYEnPCd7xhEQJGNqZIBhQPwAk+BN0TDN62syLSe/rYcCSSAFiPXna?=
 =?us-ascii?Q?ABhKfk9swM7GX7TvUosIVeqs8NtEswb8MJ8lQHWyl4LU5fA9y0P6/hRUBg/F?=
 =?us-ascii?Q?AK57GKktNpN3jYIeJ8h4InFBYvRuyxMwt4LP1cvm3fWaZ/3PyvjpG/uofwwl?=
 =?us-ascii?Q?e/EoGZFtKPpD77trYaSKCzvM4DDEmxHwyU6ZUR4b4rC1MGgi20cYIt2imf29?=
 =?us-ascii?Q?hMvFqgsVyCYZ9BG1lHSWXo7xwRtN23CFD5Vlhp6WtEG4QB492gyKXuS83tPH?=
 =?us-ascii?Q?6y6WQyF1f9l+C9Yb4/9r1jG6HqIBUQLkBb/3yPS4bKEEj0shw0hTYsFEI38i?=
 =?us-ascii?Q?P5GVhnEqhutOz5eHW2Kd7GQ8HC8jzOVpmMT2A/Up2FpTNR+Qef4KvBEW3vuP?=
 =?us-ascii?Q?WFzOmWXSFNk05BA9tD7oWjUQV8jdFjK35J5wdbmQeKznPjbtUHAWJYRDRy4E?=
 =?us-ascii?Q?wtlXgOBU4iZ9sZDEnvuP+ut13RH3Yj7z8fy14FndqaTkxoq2LUiOeQ/p/PXu?=
 =?us-ascii?Q?yGRf276K8gTUqJAer8uaMj+pgv1IqWwjcG8aFQ2gzdniSTSNGXinYbcgOudE?=
 =?us-ascii?Q?11insonhZKQT6p7HdGwSptT4Ybl5JrZy3TmJx0eQAHwmpXJKMG062VFWhAAW?=
 =?us-ascii?Q?qzZEX/uX9ViDH8B6k5IldXeLgFSaez63TXTP8PujrEuNK2wmdxHhVFj6Yaer?=
 =?us-ascii?Q?qrbtIvIcjojQxmB3MXoqAHwMgPgjW+uSfU5gWeMraIo426PZIP6yR6dBuyf7?=
 =?us-ascii?Q?1utqQinUjPna7HkxVp+5PO95vCyTFiWIf9mt96j6iq/Ey1b2Sik/7N/2ZKXY?=
 =?us-ascii?Q?j/uRiQ34uwLZiaA1buzwcUICxDRnJdMzTkcxPSGtrXYT/h1KZx5jN+b3nlaG?=
 =?us-ascii?Q?sIsyoQBApANyICbYmCckA+dS8JEg5KmZJIsbFw/7M44YdB+TUMlD9rvqusYn?=
 =?us-ascii?Q?rrquS/daCu22eosOJRCXWIMENgGWfYqPZ4LkTWEHj5CwHRGoxc+JkGN1Zzss?=
 =?us-ascii?Q?3CvHEmqym1yQRK2AqsV4Ol4jRX2U1eYN96BFVQTs?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b3a844-7497-4df7-d5a8-08db809ef4d6
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2023 17:07:20.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpgb0Tgcuki7XntjoocVCxxulkQGq8/FG+qBMxxzuWct1bZRpL/u5KvOHvh5HIDQyHHKPwBclYPGq72CBPZIMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7020
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor has introduced a new variant of silicon which is highly
similar to the existing IQS7222A, but with its independent sliders
essentially replaced with a single-contact trackpad.

Update the common driver to support this new device's register map
and report trackpad events. As with the IQS7222A, the new IQS7222D
can report both raw coordinates as well as gestures.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/Kconfig   |   4 +-
 drivers/input/misc/iqs7222.c | 468 ++++++++++++++++++++++++++++++++++-
 2 files changed, 461 insertions(+), 11 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 81a54a59e13c..c47eecc6f83b 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -791,10 +791,10 @@ config INPUT_IQS626A
 	  module will be called iqs626a.
 
 config INPUT_IQS7222
-	tristate "Azoteq IQS7222A/B/C capacitive touch controller"
+	tristate "Azoteq IQS7222A/B/C/D capacitive touch controller"
 	depends on I2C
 	help
-	  Say Y to enable support for the Azoteq IQS7222A/B/C family
+	  Say Y to enable support for the Azoteq IQS7222A/B/C/D family
 	  of capacitive touch controllers.
 
 	  To compile this driver as a module, choose M here: the
diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index acb95048e823..a9c1dba1e8c1 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Azoteq IQS7222A/B/C Capacitive Touch Controller
+ * Azoteq IQS7222A/B/C/D Capacitive Touch Controller
  *
  * Copyright (C) 2022 Jeff LaBundy <jeff@labundy.com>
  */
@@ -12,6 +12,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -25,6 +26,7 @@
 #define IQS7222_PROD_NUM_A			840
 #define IQS7222_PROD_NUM_B			698
 #define IQS7222_PROD_NUM_C			863
+#define IQS7222_PROD_NUM_D			1046
 
 #define IQS7222_SYS_STATUS			0x10
 #define IQS7222_SYS_STATUS_RESET		BIT(3)
@@ -54,6 +56,7 @@
 
 #define IQS7222_EVENT_MASK_ATI			BIT(12)
 #define IQS7222_EVENT_MASK_SLDR			BIT(10)
+#define IQS7222_EVENT_MASK_TPAD			IQS7222_EVENT_MASK_SLDR
 #define IQS7222_EVENT_MASK_TOUCH		BIT(1)
 #define IQS7222_EVENT_MASK_PROX			BIT(0)
 
@@ -71,6 +74,7 @@
 #define IQS7222_MAX_COLS_CHAN			6
 #define IQS7222_MAX_COLS_FILT			2
 #define IQS7222_MAX_COLS_SLDR			11
+#define IQS7222_MAX_COLS_TPAD			24
 #define IQS7222_MAX_COLS_GPIO			3
 #define IQS7222_MAX_COLS_SYS			13
 
@@ -102,16 +106,18 @@ enum iqs7222_reg_grp_id {
 	IQS7222_REG_GRP_BTN,
 	IQS7222_REG_GRP_CHAN,
 	IQS7222_REG_GRP_SLDR,
+	IQS7222_REG_GRP_TPAD,
 	IQS7222_REG_GRP_GPIO,
 	IQS7222_REG_GRP_SYS,
 	IQS7222_NUM_REG_GRPS
 };
 
 static const char * const iqs7222_reg_grp_names[IQS7222_NUM_REG_GRPS] = {
-	[IQS7222_REG_GRP_CYCLE] = "cycle",
-	[IQS7222_REG_GRP_CHAN] = "channel",
-	[IQS7222_REG_GRP_SLDR] = "slider",
-	[IQS7222_REG_GRP_GPIO] = "gpio",
+	[IQS7222_REG_GRP_CYCLE] = "cycle-%d",
+	[IQS7222_REG_GRP_CHAN] = "channel-%d",
+	[IQS7222_REG_GRP_SLDR] = "slider-%d",
+	[IQS7222_REG_GRP_TPAD] = "trackpad",
+	[IQS7222_REG_GRP_GPIO] = "gpio-%d",
 };
 
 static const unsigned int iqs7222_max_cols[IQS7222_NUM_REG_GRPS] = {
@@ -122,6 +128,7 @@ static const unsigned int iqs7222_max_cols[IQS7222_NUM_REG_GRPS] = {
 	[IQS7222_REG_GRP_CHAN] = IQS7222_MAX_COLS_CHAN,
 	[IQS7222_REG_GRP_FILT] = IQS7222_MAX_COLS_FILT,
 	[IQS7222_REG_GRP_SLDR] = IQS7222_MAX_COLS_SLDR,
+	[IQS7222_REG_GRP_TPAD] = IQS7222_MAX_COLS_TPAD,
 	[IQS7222_REG_GRP_GPIO] = IQS7222_MAX_COLS_GPIO,
 	[IQS7222_REG_GRP_SYS] = IQS7222_MAX_COLS_SYS,
 };
@@ -130,8 +137,10 @@ static const unsigned int iqs7222_gpio_links[] = { 2, 5, 6, };
 
 struct iqs7222_event_desc {
 	const char *name;
+	u16 link;
 	u16 mask;
 	u16 val;
+	u16 strict;
 	u16 enable;
 	enum iqs7222_reg_key_id reg_key;
 };
@@ -188,6 +197,93 @@ static const struct iqs7222_event_desc iqs7222_sl_events[] = {
 	},
 };
 
+static const struct iqs7222_event_desc iqs7222_tp_events[] = {
+	{
+		.name = "event-press",
+		.link = BIT(7),
+	},
+	{
+		.name = "event-tap",
+		.link = BIT(0),
+		.mask = BIT(0),
+		.val = BIT(0),
+		.enable = BIT(0),
+		.reg_key = IQS7222_REG_KEY_TAP,
+	},
+	{
+		.name = "event-swipe-x-pos",
+		.link = BIT(2),
+		.mask = BIT(2) | BIT(1),
+		.val = BIT(2),
+		.strict = BIT(4),
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-swipe-y-pos",
+		.link = BIT(3),
+		.mask = BIT(3) | BIT(1),
+		.val = BIT(3),
+		.strict = BIT(3),
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-swipe-x-neg",
+		.link = BIT(4),
+		.mask = BIT(4) | BIT(1),
+		.val = BIT(4),
+		.strict = BIT(4),
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-swipe-y-neg",
+		.link = BIT(5),
+		.mask = BIT(5) | BIT(1),
+		.val = BIT(5),
+		.strict = BIT(3),
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-flick-x-pos",
+		.link = BIT(2),
+		.mask = BIT(2) | BIT(1),
+		.val = BIT(2) | BIT(1),
+		.strict = BIT(4),
+		.enable = BIT(2),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-flick-y-pos",
+		.link = BIT(3),
+		.mask = BIT(3) | BIT(1),
+		.val = BIT(3) | BIT(1),
+		.strict = BIT(3),
+		.enable = BIT(2),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-flick-x-neg",
+		.link = BIT(4),
+		.mask = BIT(4) | BIT(1),
+		.val = BIT(4) | BIT(1),
+		.strict = BIT(4),
+		.enable = BIT(2),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-flick-y-neg",
+		.link = BIT(5),
+		.mask = BIT(5) | BIT(1),
+		.val = BIT(5) | BIT(1),
+		.strict = BIT(3),
+		.enable = BIT(2),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+};
+
 struct iqs7222_reg_grp_desc {
 	u16 base;
 	int num_row;
@@ -524,6 +620,62 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 		},
 	},
+	{
+		.prod_num = IQS7222_PROD_NUM_D,
+		.fw_major = 0,
+		.fw_minor = 37,
+		.touch_link = 1770,
+		.allow_offset = 9,
+		.event_offset = 10,
+		.comms_offset = 11,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 7,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 7,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8700,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 14,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 14,
+				.num_col = 4,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAE00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_TPAD] = {
+				.base = 0xB000,
+				.num_row = 1,
+				.num_col = 24,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 3,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 12,
+			},
+		},
+	},
 };
 
 struct iqs7222_prop_desc {
@@ -1008,6 +1160,123 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.val_pitch = 4,
 		.label = "maximum gesture time",
 	},
+	{
+		.name = "azoteq,num-rows",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 0,
+		.reg_shift = 4,
+		.reg_width = 4,
+		.val_min = 1,
+		.val_max = 12,
+		.label = "number of rows",
+	},
+	{
+		.name = "azoteq,num-cols",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 0,
+		.reg_shift = 0,
+		.reg_width = 4,
+		.val_min = 1,
+		.val_max = 12,
+		.label = "number of columns",
+	},
+	{
+		.name = "azoteq,lower-cal-y",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 1,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "lower vertical calibration",
+	},
+	{
+		.name = "azoteq,lower-cal-x",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "lower horizontal calibration",
+	},
+	{
+		.name = "azoteq,upper-cal-y",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 2,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "upper vertical calibration",
+	},
+	{
+		.name = "azoteq,upper-cal-x",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 2,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "upper horizontal calibration",
+	},
+	{
+		.name = "azoteq,top-speed",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 3,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 4,
+		.label = "top speed",
+	},
+	{
+		.name = "azoteq,bottom-speed",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_offset = 3,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "bottom speed",
+	},
+	{
+		.name = "azoteq,gesture-min-ms",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_key = IQS7222_REG_KEY_TAP,
+		.reg_offset = 20,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "minimum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+		.reg_offset = 21,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_key = IQS7222_REG_KEY_TAP,
+		.reg_offset = 21,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_key = IQS7222_REG_KEY_TAP,
+		.reg_offset = 22,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.label = "gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_grp = IQS7222_REG_GRP_TPAD,
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+		.reg_offset = 23,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.label = "gesture distance",
+	},
 	{
 		.name = "drive-open-drain",
 		.reg_grp = IQS7222_REG_GRP_GPIO,
@@ -1091,16 +1360,19 @@ struct iqs7222_private {
 	struct gpio_desc *irq_gpio;
 	struct i2c_client *client;
 	struct input_dev *keypad;
+	struct touchscreen_properties prop;
 	unsigned int kp_type[IQS7222_MAX_CHAN][ARRAY_SIZE(iqs7222_kp_events)];
 	unsigned int kp_code[IQS7222_MAX_CHAN][ARRAY_SIZE(iqs7222_kp_events)];
 	unsigned int sl_code[IQS7222_MAX_SLDR][ARRAY_SIZE(iqs7222_sl_events)];
 	unsigned int sl_axis[IQS7222_MAX_SLDR];
+	unsigned int tp_code[ARRAY_SIZE(iqs7222_tp_events)];
 	u16 cycle_setup[IQS7222_MAX_CHAN / 2][IQS7222_MAX_COLS_CYCLE];
 	u16 glbl_setup[IQS7222_MAX_COLS_GLBL];
 	u16 btn_setup[IQS7222_MAX_CHAN][IQS7222_MAX_COLS_BTN];
 	u16 chan_setup[IQS7222_MAX_CHAN][IQS7222_MAX_COLS_CHAN];
 	u16 filt_setup[IQS7222_MAX_COLS_FILT];
 	u16 sldr_setup[IQS7222_MAX_SLDR][IQS7222_MAX_COLS_SLDR];
+	u16 tpad_setup[IQS7222_MAX_COLS_TPAD];
 	u16 gpio_setup[ARRAY_SIZE(iqs7222_gpio_links)][IQS7222_MAX_COLS_GPIO];
 	u16 sys_setup[IQS7222_MAX_COLS_SYS];
 };
@@ -1127,6 +1399,9 @@ static u16 *iqs7222_setup(struct iqs7222_private *iqs7222,
 	case IQS7222_REG_GRP_SLDR:
 		return iqs7222->sldr_setup[row];
 
+	case IQS7222_REG_GRP_TPAD:
+		return iqs7222->tpad_setup;
+
 	case IQS7222_REG_GRP_GPIO:
 		return iqs7222->gpio_setup[row];
 
@@ -1936,6 +2211,14 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 		ref_setup[4] = dev_desc->touch_link;
 		if (fwnode_property_present(chan_node, "azoteq,use-prox"))
 			ref_setup[4] -= 2;
+	} else if (dev_desc->reg_grps[IQS7222_REG_GRP_TPAD].num_row &&
+		   fwnode_property_present(chan_node,
+					   "azoteq,counts-filt-enable")) {
+		/*
+		 * In the case of IQS7222D, however, the reference mode field
+		 * is partially repurposed as a counts filter enable control.
+		 */
+		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_REF;
 	}
 
 	if (fwnode_property_present(chan_node, "azoteq,rx-enable")) {
@@ -2278,6 +2561,136 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 				   IQS7222_REG_KEY_NO_WHEEL);
 }
 
+static int iqs7222_parse_tpad(struct iqs7222_private *iqs7222,
+			      struct fwnode_handle *tpad_node, int tpad_index)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	struct touchscreen_properties *prop = &iqs7222->prop;
+	struct i2c_client *client = iqs7222->client;
+	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
+	int count, error, i;
+	u16 *event_mask = &iqs7222->sys_setup[dev_desc->event_offset];
+	u16 *tpad_setup = iqs7222->tpad_setup;
+	unsigned int chan_sel[12];
+
+	error = iqs7222_parse_props(iqs7222, tpad_node, tpad_index,
+				    IQS7222_REG_GRP_TPAD,
+				    IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	count = fwnode_property_count_u32(tpad_node, "azoteq,channel-select");
+	if (count < 0) {
+		dev_err(&client->dev, "Failed to count %s channels: %d\n",
+			fwnode_get_name(tpad_node), count);
+		return count;
+	} else if (!count || count > ARRAY_SIZE(chan_sel)) {
+		dev_err(&client->dev, "Invalid number of %s channels\n",
+			fwnode_get_name(tpad_node));
+		return -EINVAL;
+	}
+
+	error = fwnode_property_read_u32_array(tpad_node,
+					       "azoteq,channel-select",
+					       chan_sel, count);
+	if (error) {
+		dev_err(&client->dev, "Failed to read %s channels: %d\n",
+			fwnode_get_name(tpad_node), error);
+		return error;
+	}
+
+	tpad_setup[6] &= ~GENMASK(num_chan - 1, 0);
+
+	for (i = 0; i < ARRAY_SIZE(chan_sel); i++) {
+		tpad_setup[8 + i] = 0;
+		if (i >= count || chan_sel[i] == U8_MAX)
+			continue;
+
+		if (chan_sel[i] >= num_chan) {
+			dev_err(&client->dev, "Invalid %s channel: %u\n",
+				fwnode_get_name(tpad_node), chan_sel[i]);
+			return -EINVAL;
+		}
+
+		/*
+		 * The following fields indicate which channels participate in
+		 * the trackpad, as well as each channel's relative placement.
+		 */
+		tpad_setup[6] |= BIT(chan_sel[i]);
+		tpad_setup[8 + i] = chan_sel[i] * 34 + 1072;
+	}
+
+	tpad_setup[7] = dev_desc->touch_link;
+	if (fwnode_property_present(tpad_node, "azoteq,use-prox"))
+		tpad_setup[7] -= 2;
+
+	for (i = 0; i < ARRAY_SIZE(iqs7222_tp_events); i++)
+		tpad_setup[20] &= ~(iqs7222_tp_events[i].strict |
+				    iqs7222_tp_events[i].enable);
+
+	for (i = 0; i < ARRAY_SIZE(iqs7222_tp_events); i++) {
+		const char *event_name = iqs7222_tp_events[i].name;
+		struct fwnode_handle *event_node;
+
+		event_node = fwnode_get_named_child_node(tpad_node, event_name);
+		if (!event_node)
+			continue;
+
+		if (fwnode_property_present(event_node,
+					    "azoteq,gesture-angle-tighten"))
+			tpad_setup[20] |= iqs7222_tp_events[i].strict;
+
+		tpad_setup[20] |= iqs7222_tp_events[i].enable;
+
+		error = iqs7222_parse_event(iqs7222, event_node, tpad_index,
+					    IQS7222_REG_GRP_TPAD,
+					    iqs7222_tp_events[i].reg_key,
+					    iqs7222_tp_events[i].link, 1566,
+					    NULL,
+					    &iqs7222->tp_code[i]);
+		fwnode_handle_put(event_node);
+		if (error)
+			return error;
+
+		if (!dev_desc->event_offset)
+			continue;
+
+		/*
+		 * The press/release event is determined based on whether the
+		 * coordinate fields report 0xFFFF and solely relies on touch
+		 * or proximity interrupts to be unmasked.
+		 */
+		if (i)
+			*event_mask |= IQS7222_EVENT_MASK_TPAD;
+		else if (tpad_setup[7] == dev_desc->touch_link)
+			*event_mask |= IQS7222_EVENT_MASK_TOUCH;
+		else
+			*event_mask |= IQS7222_EVENT_MASK_PROX;
+	}
+
+	if (!iqs7222->tp_code[0])
+		return 0;
+
+	input_set_abs_params(iqs7222->keypad, ABS_X,
+			     0, (tpad_setup[4] ? : 1) - 1, 0, 0);
+
+	input_set_abs_params(iqs7222->keypad, ABS_Y,
+			     0, (tpad_setup[5] ? : 1) - 1, 0, 0);
+
+	touchscreen_parse_properties(iqs7222->keypad, false, prop);
+
+	if (prop->max_x >= U16_MAX || prop->max_y >= U16_MAX) {
+		dev_err(&client->dev, "Invalid trackpad size: %u*%u\n",
+			prop->max_x, prop->max_y);
+		return -EINVAL;
+	}
+
+	tpad_setup[4] = prop->max_x + 1;
+	tpad_setup[5] = prop->max_y + 1;
+
+	return 0;
+}
+
 static int (*iqs7222_parse_extra[IQS7222_NUM_REG_GRPS])
 				(struct iqs7222_private *iqs7222,
 				 struct fwnode_handle *reg_grp_node,
@@ -2285,6 +2698,7 @@ static int (*iqs7222_parse_extra[IQS7222_NUM_REG_GRPS])
 	[IQS7222_REG_GRP_CYCLE] = iqs7222_parse_cycle,
 	[IQS7222_REG_GRP_CHAN] = iqs7222_parse_chan,
 	[IQS7222_REG_GRP_SLDR] = iqs7222_parse_sldr,
+	[IQS7222_REG_GRP_TPAD] = iqs7222_parse_tpad,
 };
 
 static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
@@ -2298,7 +2712,7 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
 	if (iqs7222_reg_grp_names[reg_grp]) {
 		char reg_grp_name[16];
 
-		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
+		snprintf(reg_grp_name, sizeof(reg_grp_name),
 			 iqs7222_reg_grp_names[reg_grp], reg_grp_index);
 
 		reg_grp_node = device_get_named_child_node(&client->dev,
@@ -2346,8 +2760,8 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 			continue;
 
 		/*
-		 * The IQS7222C exposes multiple GPIO and must be informed
-		 * as to which GPIO this group represents.
+		 * The IQS7222C and IQS7222D expose multiple GPIO and must be
+		 * informed as to which GPIO this group represents.
 		 */
 		for (j = 0; j < ARRAY_SIZE(iqs7222_gpio_links); j++)
 			gpio_setup[0] &= ~BIT(iqs7222_gpio_links[j]);
@@ -2480,6 +2894,41 @@ static int iqs7222_report(struct iqs7222_private *iqs7222)
 					 iqs7222->sl_code[i][j], 0);
 	}
 
+	for (i = 0; i < dev_desc->reg_grps[IQS7222_REG_GRP_TPAD].num_row; i++) {
+		u16 tpad_pos_x = le16_to_cpu(status[4]);
+		u16 tpad_pos_y = le16_to_cpu(status[5]);
+		u16 state = le16_to_cpu(status[6]);
+
+		input_report_key(iqs7222->keypad, iqs7222->tp_code[0],
+				 tpad_pos_x < U16_MAX);
+
+		if (tpad_pos_x < U16_MAX)
+			touchscreen_report_pos(iqs7222->keypad, &iqs7222->prop,
+					       tpad_pos_x, tpad_pos_y, false);
+
+		if (!(le16_to_cpu(status[1]) & IQS7222_EVENT_MASK_TPAD))
+			continue;
+
+		/*
+		 * Skip the press/release event, as it does not have separate
+		 * status fields and is handled separately.
+		 */
+		for (j = 1; j < ARRAY_SIZE(iqs7222_tp_events); j++) {
+			u16 mask = iqs7222_tp_events[j].mask;
+			u16 val = iqs7222_tp_events[j].val;
+
+			input_report_key(iqs7222->keypad,
+					 iqs7222->tp_code[j],
+					 (state & mask) == val);
+		}
+
+		input_sync(iqs7222->keypad);
+
+		for (j = 1; j < ARRAY_SIZE(iqs7222_tp_events); j++)
+			input_report_key(iqs7222->keypad,
+					 iqs7222->tp_code[j], 0);
+	}
+
 	input_sync(iqs7222->keypad);
 
 	return 0;
@@ -2584,6 +3033,7 @@ static const struct of_device_id iqs7222_of_match[] = {
 	{ .compatible = "azoteq,iqs7222a" },
 	{ .compatible = "azoteq,iqs7222b" },
 	{ .compatible = "azoteq,iqs7222c" },
+	{ .compatible = "azoteq,iqs7222d" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, iqs7222_of_match);
@@ -2598,5 +3048,5 @@ static struct i2c_driver iqs7222_i2c_driver = {
 module_i2c_driver(iqs7222_i2c_driver);
 
 MODULE_AUTHOR("Jeff LaBundy <jeff@labundy.com>");
-MODULE_DESCRIPTION("Azoteq IQS7222A/B/C Capacitive Touch Controller");
+MODULE_DESCRIPTION("Azoteq IQS7222A/B/C/D Capacitive Touch Controller");
 MODULE_LICENSE("GPL");
-- 
2.34.1

