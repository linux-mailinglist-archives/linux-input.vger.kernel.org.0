Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D79E65C58E
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 18:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbjACR7l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 12:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238537AbjACR71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:59:27 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2984711472
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRF9yYlT3tU8YNDg5FmFzaJegdD2Du+T2LEcdENzPdZnQAPMfRkBeAnxXDzlA/sQLVaN2F4cSvhp9Az8rm+xppFRrwtDbE4qxXbEZ4loOfDBz/Ct4m4kRug8jNqRnoiapDAMiZLNpWvs/JrFML+VsQcTJjSorub1TUURiNR1cYsucelY1s22hScar4PaaSnEQVNAlR6cL1LF+gzJhybO0If1Q3cElx1i20/MneSGPsmS/FU0QGaXx0m+miPT5tQZ7o3PaZUAnvkmvS3HAzVIIWGklPNr1R9oia+AFq13jj53LfFtw6iPTZRI1ts+W4gpu6XKkirXst3nuNpfOg18cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQW/uQFOn1Oq3Y237O0D92XgzfQknFA1ouydCXhnI+0=;
 b=P7p3OmTSQTtA7LFDva7wl/ttsggniEmLz8HuVFDcMMsM5TPhLIF9L4U6mgNEdP3/lU9ILeMfUR+QdBqxZpu+Hcrk/VfV4zFnc6aE5qw4eDiLrM5SttfO7tRKic0S/f7ErnUfKVTpvWiq4u16wT5kaudXFBktHJLu6I6vmxTgpDtan/Ppqw/u0JrtXAr103tKFplhE5Xh5mi+o4wxnPri62JqiPr6tJNBAsd7ZkvZBFUsGkslibFBqqEwWyiKcq9b4P1OZUpnvOaqvBhJVI9ZnRQExctPteMBDPdH7i9GtOp2MWEmCPvGiUWfueVx8+Z0ezYFsnr73LBC7Xyd9p9i+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQW/uQFOn1Oq3Y237O0D92XgzfQknFA1ouydCXhnI+0=;
 b=fmlGLAd8YU7/fThjE5AJQJDQnA58Wbd7zhX1167Fm8+nNXIBYnzX60v4vvErweH+RjZtSvAUmHT5PHS2orvQGackl+5qh0Tdof3DvbZQ6DHcaKxQ1pY5sRYoVk85MA+CMsqIkGHirw9H/JghmdFjiK8HBojqcTETGTlP9nieTDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB6592.namprd08.prod.outlook.com
 (2603:10b6:a03:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:59:23 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:59:23 +0000
Date:   Tue, 3 Jan 2023 11:59:21 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2 4/5] Input: iqs269a - do not poll during suspend or resume
Message-ID: <Y7Rs+eEXlRw4Vq57@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7RsTqhYJOZs11sK@nixie71>
References: <Y7RsTqhYJOZs11sK@nixie71>
X-ClientProxiedBy: DM6PR07CA0067.namprd07.prod.outlook.com
 (2603:10b6:5:74::44) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ0PR08MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 85dd109d-e5bb-4aa2-b736-08daedb43f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JTWS1Hd7Pi6yEaOQ03SxuC7ilhBY7KiU0vs/r+GR2Qh5SAZuChz8zClkSjEaocaXMsdM9t0AepURK+vqCkXstiXre+zumg4y9iwjTeUcJXYEdzuAUWpG+LeFtWE702Ng6BeJpd5onRcu1Zx1etRnvqPIpfaoghG8NBLT7af3LD+fGVltfyJ3P8U0zxBuqab1L6NyLc6/AbTg13DdgvRMt3fQWoHX2PWu5CN+d4qanFBJSvF3DBNdYIW4QtnVpbWkRvc529kL4PIyJOwXQ0c6cyXafTBCIKKcHjf+nT1UKFm1QAbjq6fGaFgW+qxE9K+7YqAC5913ZydQ3PZ6Z5ZVMJqRk1/9oWDBP8ei4YhP4U/ekvvbFmGti19dUG3ZFEgaXrcgElttVOL9LN2lw4SCfnOan0W3angpabzVqhnfq44/B2xL+vMVXtUNGzyPb4H03m80KKcTHTFUjxFL6uEXTcTj5R9yRbzL4hNCJTs/ne3f8YW0mJYzF3OvoRgXRlYFzO0pH6YaUKtHPBy+XEc6PgzXkNWQQupK/LR4dfOR+H7cvCxiyr9JHsE5J5nN8zNqfBQIbARmDzDU9+cvMGawkMi/6gwnpPTYv/jyxKMDN58DFBy2txCVaq5vYYiP9vK0z7cyBOZnth+HBwWaipAYge1GIvT8Kp9s+8YaSWqJJbDO/L2M3eEtMdD6cDEEky0xlSmHZahkUR+cayZjWWjDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(376002)(366004)(396003)(39830400003)(451199015)(186003)(26005)(6512007)(9686003)(83380400001)(86362001)(33716001)(38100700002)(316002)(6916009)(2906002)(15650500001)(4326008)(66946007)(41300700001)(8936002)(5660300002)(8676002)(66556008)(66476007)(478600001)(107886003)(6486002)(6506007)(22166006)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?esgI8lIATjbjoFxBgKRcJBeYYbfBBGlcGQ7FsHc4AfiZ24eFCKP34OXtmTTk?=
 =?us-ascii?Q?X4SMFhoqpeobz6R32ubm2SY7fLYWSfraJrC+3iMrmvsL81qRfkh6zcsFO6gf?=
 =?us-ascii?Q?Mzmt0eY1WU1LjRwFUvKAkB9KFizOpT34blpE2FtIKeNMQboQU0bStmi7brNq?=
 =?us-ascii?Q?1sbwDBe33x5L8eQMwevhivwfqLfFB2Y4+xcz63MW/NkXtp3Qn4hfPiIxRpPu?=
 =?us-ascii?Q?v9ahEyWShl9GdSD3USn1EmSgaAGCOqWnWuMmHssCPaRlK1+3iYqpXVaeoMvK?=
 =?us-ascii?Q?aUehIbsDUORRBDMqAnlCEaG0GG6LuWlw5cqBXjhvMk9Hw1ra2gJRrwkUsteP?=
 =?us-ascii?Q?BJrHUJsLSuGVeEysuWml0IzjVZNlDJ0bZ85IYVDxxs4BEdfVDQTwscNfw6gn?=
 =?us-ascii?Q?lHUukiEVe1E6LKlxnq4u3Uxtb/Tq2YxcZ/Q+UjAmeOekUZmcGE9heB/5UCmw?=
 =?us-ascii?Q?1EnHX7MvZULBP+cIJrHsK5Zngkrq4n2iEwFiO+UKIyY7t7NpBaIzr/y8UZCV?=
 =?us-ascii?Q?Ygsm8lAU6rTOdRJAZSoIZ722S+NJdhu5hGOWEZiJo7cvkKed/JW4/BGoALEu?=
 =?us-ascii?Q?vwNfOwWzM93A3UBkuyTGEgGhV+TH1/35TZV4KeM3rcbY/ymBFkouzNAY2Uxe?=
 =?us-ascii?Q?TPhnsQCKA5s/whnzsr1dEeM9tQ44nYuwwRP+HOE1S/Ka7MVYvbORpd9uF/6A?=
 =?us-ascii?Q?0v4BqG9yHowBqpeJhyLyfimf+swK/YN+f9iZKV8s8clU7MlN6bI5H5uKytbN?=
 =?us-ascii?Q?hbXQ/yJhi0/nazGMb2AveHjwjFmMQTWWfVUhcPU6b56w8w7fRbU5rXCpjemu?=
 =?us-ascii?Q?TU8+g/xyN9Upyw7kb/I08h/s5IHthPf+VvpuUHiYrmEVP6XlR9ZsFrGTuok/?=
 =?us-ascii?Q?0uBwcf3Xw69EMNyVzteuA0oVcwiAbXIHvtbYU8OlgDAinmT5sZS7iUf8P9ao?=
 =?us-ascii?Q?nbnaeaGxsJt7MzX6V6CKqMFqXsBYsR72C2NFVEjAlkI6OZbcAi5p/iT6QGNp?=
 =?us-ascii?Q?DR9cJNPdVANQA7+Y7b5zmzy7wqQPwQJOCZcDpzfIrJ+n1cYNatC2ni5lxsqG?=
 =?us-ascii?Q?zPPA67vPuQ1DcP8RcLrQRFROhoYG6DTHaUQPh697akIsH4oG2mc/+EzRxpNn?=
 =?us-ascii?Q?tOxJHTnfbeFRHF+b5F7w8WYWLyuklIM8vgDLV61DfsmkdBPyD8Nsda1xeIgK?=
 =?us-ascii?Q?PV4BKPyk1WQyMBnBeXRMf0ZYATLo8XqYNvpVeE2EWEkRQnKKQUU96TYU3EGO?=
 =?us-ascii?Q?2y+f96HVbNzC3DPLcFxx9A7kTwvtiim8gbAniArA6axnIAAcjyVkKUcc1ziA?=
 =?us-ascii?Q?JntTH9Bjs43AZ+g6zVmlhbt/HFCHdpejhpahqPOam9og/Tb5mK3Z4QEhO1oc?=
 =?us-ascii?Q?kG11qElVx7/bFZr2xH6omiY2dhjyKRqd1/aoKvTldmv0i3llsFenCe9ft+gH?=
 =?us-ascii?Q?dSQ3G7SictZX4Xb4ZU2rUlCPZGAESaSJDKbiIrdrO4BGj+W5JbQlPjsk3iUr?=
 =?us-ascii?Q?/Ir1xU59SsWXzYwiBd51z2ecn/3pFVFNt20NEWJH8dLvgG1T+O82sIkkEkxv?=
 =?us-ascii?Q?5yXUoN2gWovHrdcUIm4r6Jo8WZTwgpzlMs8lceub?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dd109d-e5bb-4aa2-b736-08daedb43f02
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:59:23.4635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQBhUyJfb4cVrN9pP8aOVHSynkSGIFnAVvOFVWwrOOCAdxISPd8lWLW0ABvbHG49ErAiziVUHoU6ynsw0gMZKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6592
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Polling the device while it transitions from automatic to manual
power mode switching may keep the device from actually finishing
the transition. The process appears to time out depending on the
polling rate and the device's core clock frequency.

This is ultimately unnecessary in the first place; instead it is
sufficient to write the desired mode during initialization, then
disable automatic switching at suspend. This eliminates the need
to ensure the device is prepared for a manual change and removes
the 'suspend_mode' variable.

Similarly, polling the device while it transitions from one mode
to another under manual control may time out as well. This added
step does not appear to be necessary either, so drop it.

Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v2:
 - Added Reviewed-by

 drivers/input/misc/iqs269a.c | 118 +++++++++--------------------------
 1 file changed, 31 insertions(+), 87 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 1530efd301c2..814d1a898e7f 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -148,9 +148,6 @@
 #define IQS269_ATI_POLL_TIMEOUT_US		(iqs269->delay_mult * 500000)
 #define IQS269_ATI_STABLE_DELAY_MS		(iqs269->delay_mult * 150)
 
-#define IQS269_PWR_MODE_POLL_SLEEP_US		IQS269_ATI_POLL_SLEEP_US
-#define IQS269_PWR_MODE_POLL_TIMEOUT_US		IQS269_ATI_POLL_TIMEOUT_US
-
 #define iqs269_irq_wait()			usleep_range(200, 250)
 
 enum iqs269_local_cap_size {
@@ -295,7 +292,6 @@ struct iqs269_private {
 	struct input_dev *keypad;
 	struct input_dev *slider[IQS269_NUM_SL];
 	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
-	unsigned int suspend_mode;
 	unsigned int delay_mult;
 	unsigned int ch_num;
 	bool hall_enable;
@@ -767,17 +763,6 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 	iqs269->hall_enable = device_property_present(&client->dev,
 						      "azoteq,hall-enable");
 
-	if (!device_property_read_u32(&client->dev, "azoteq,suspend-mode",
-				      &val)) {
-		if (val > IQS269_SYS_SETTINGS_PWR_MODE_MAX) {
-			dev_err(&client->dev, "Invalid suspend mode: %u\n",
-				val);
-			return -EINVAL;
-		}
-
-		iqs269->suspend_mode = val;
-	}
-
 	error = regmap_raw_read(iqs269->regmap, IQS269_SYS_SETTINGS, sys_reg,
 				sizeof(*sys_reg));
 	if (error)
@@ -1005,6 +990,17 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 	general &= ~IQS269_SYS_SETTINGS_DIS_AUTO;
 	general &= ~IQS269_SYS_SETTINGS_PWR_MODE_MASK;
 
+	if (!device_property_read_u32(&client->dev, "azoteq,suspend-mode",
+				      &val)) {
+		if (val > IQS269_SYS_SETTINGS_PWR_MODE_MAX) {
+			dev_err(&client->dev, "Invalid suspend mode: %u\n",
+				val);
+			return -EINVAL;
+		}
+
+		general |= (val << IQS269_SYS_SETTINGS_PWR_MODE_SHIFT);
+	}
+
 	if (!device_property_read_u32(&client->dev, "azoteq,ulp-update",
 				      &val)) {
 		if (val > IQS269_SYS_SETTINGS_ULP_UPDATE_MAX) {
@@ -1687,59 +1683,30 @@ static int iqs269_probe(struct i2c_client *client)
 	return error;
 }
 
+static u16 iqs269_general_get(struct iqs269_private *iqs269)
+{
+	u16 general = be16_to_cpu(iqs269->sys_reg.general);
+
+	general &= ~IQS269_SYS_SETTINGS_REDO_ATI;
+	general &= ~IQS269_SYS_SETTINGS_ACK_RESET;
+
+	return general | IQS269_SYS_SETTINGS_DIS_AUTO;
+}
+
 static int __maybe_unused iqs269_suspend(struct device *dev)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs269->client;
-	unsigned int val;
 	int error;
+	u16 general = iqs269_general_get(iqs269);
 
-	if (!iqs269->suspend_mode)
+	if (!(general & IQS269_SYS_SETTINGS_PWR_MODE_MASK))
 		return 0;
 
 	disable_irq(client->irq);
 
-	/*
-	 * Automatic power mode switching must be disabled before the device is
-	 * forced into any particular power mode. In this case, the device will
-	 * transition into normal-power mode.
-	 */
-	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
-				   IQS269_SYS_SETTINGS_DIS_AUTO, ~0);
-	if (error)
-		goto err_irq;
-
-	/*
-	 * The following check ensures the device has completed its transition
-	 * into normal-power mode before a manual mode switch is performed.
-	 */
-	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
-					!(val & IQS269_SYS_FLAGS_PWR_MODE_MASK),
-					 IQS269_PWR_MODE_POLL_SLEEP_US,
-					 IQS269_PWR_MODE_POLL_TIMEOUT_US);
-	if (error)
-		goto err_irq;
-
-	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
-				   IQS269_SYS_SETTINGS_PWR_MODE_MASK,
-				   iqs269->suspend_mode <<
-				   IQS269_SYS_SETTINGS_PWR_MODE_SHIFT);
-	if (error)
-		goto err_irq;
-
-	/*
-	 * This last check ensures the device has completed its transition into
-	 * the desired power mode to prevent any spurious interrupts from being
-	 * triggered after iqs269_suspend has already returned.
-	 */
-	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
-					 (val & IQS269_SYS_FLAGS_PWR_MODE_MASK)
-					 == (iqs269->suspend_mode <<
-					     IQS269_SYS_FLAGS_PWR_MODE_SHIFT),
-					 IQS269_PWR_MODE_POLL_SLEEP_US,
-					 IQS269_PWR_MODE_POLL_TIMEOUT_US);
+	error = regmap_write(iqs269->regmap, IQS269_SYS_SETTINGS, general);
 
-err_irq:
 	iqs269_irq_wait();
 	enable_irq(client->irq);
 
@@ -1750,43 +1717,20 @@ static int __maybe_unused iqs269_resume(struct device *dev)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs269->client;
-	unsigned int val;
 	int error;
+	u16 general = iqs269_general_get(iqs269);
 
-	if (!iqs269->suspend_mode)
+	if (!(general & IQS269_SYS_SETTINGS_PWR_MODE_MASK))
 		return 0;
 
 	disable_irq(client->irq);
 
-	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
-				   IQS269_SYS_SETTINGS_PWR_MODE_MASK, 0);
-	if (error)
-		goto err_irq;
-
-	/*
-	 * This check ensures the device has returned to normal-power mode
-	 * before automatic power mode switching is re-enabled.
-	 */
-	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
-					!(val & IQS269_SYS_FLAGS_PWR_MODE_MASK),
-					 IQS269_PWR_MODE_POLL_SLEEP_US,
-					 IQS269_PWR_MODE_POLL_TIMEOUT_US);
-	if (error)
-		goto err_irq;
-
-	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
-				   IQS269_SYS_SETTINGS_DIS_AUTO, 0);
-	if (error)
-		goto err_irq;
-
-	/*
-	 * This step reports any events that may have been "swallowed" as a
-	 * result of polling PWR_MODE (which automatically acknowledges any
-	 * pending interrupts).
-	 */
-	error = iqs269_report(iqs269);
+	error = regmap_write(iqs269->regmap, IQS269_SYS_SETTINGS,
+			     general & ~IQS269_SYS_SETTINGS_PWR_MODE_MASK);
+	if (!error)
+		error = regmap_write(iqs269->regmap, IQS269_SYS_SETTINGS,
+				     general & ~IQS269_SYS_SETTINGS_DIS_AUTO);
 
-err_irq:
 	iqs269_irq_wait();
 	enable_irq(client->irq);
 
-- 
2.34.1

