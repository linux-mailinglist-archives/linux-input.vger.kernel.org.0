Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC6F65C590
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 19:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238203AbjACSAM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 13:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238434AbjACR7n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:59:43 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645C311474
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICLm3V7CNE8WMZy4qLFQZV9bmT7Vcbb+3gVBjdB6jr7Vz6HBkDs9cDs8Ei5HD20k4Xc7+fqYuJbEhVHd/KFb5XGmlvEsyiQ77q0LNibTAEi2+PutAHQT9zAWgcQiMnGn39Zrf6vmnzEAdLQ/Vurwo2TRZRR1lifrhPNOA6rjXl0pe8YU4LX75ghgupFf45fg15SvXvGBGAIFSW5021AAUVCbT1QcuBpufFyViKvWyVAkMJtweJnadnYB4z5CyTI6v61PiGhQ4iA3yhE15klt1UL1urpT3sYfNkPV/v0PUUTulUqXXn8BVc8VMPpfC6QRJZvGnQaJkLystnn65njUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IsUcineFaX6YbpxMopOtJLpV9QYnHIlps8mGLCO4S8=;
 b=hfmxyB6yE7KaKKSKJcAlf1uPoJruOsXWX3o/fmIMGVTC5bGEnuNibHlHHZ0xSbwAANtFYHs221sfC2Ws2iRyQ3n9dRmhJEK2JV2xNkgBRBbXiAwW89axk6uenm64MgNWGit8W0WuQcTYmlRamKMOTACMAKLhgDEX8zWaJIqDP4nqGbVaiyPxGArO/Q/ulbU7oyOOdjP9ZSZcIyEFawgInjebI9eeRQ4+FQRAEvijqRHVICYn4mIaQsqZE0dDaQOHSILnMsAdE603tjmURoiFL5eeX4yIzdDpvpDG8WYD+k2PcmwKLcZV5bgb19uZe+4wzBLXqgjHoLRS3o7AnaNe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IsUcineFaX6YbpxMopOtJLpV9QYnHIlps8mGLCO4S8=;
 b=ZcR7MSJ0CoewIjuqGi0a5pgpz86mVCUjLyi9Yv/UEQYdsC8lINq+KaL9sIgNJoOp4A6tXZ/4O14kiRdV0W1CiwIWdIu29i6YtiyjsutaxKUmQI/u89cWPhuvAQ2jqB2QKi8B8PbSX4jb6QK+lZHSpq9e5CW3N/xuQUiCjz5/AVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BYAPR08MB6005.namprd08.prod.outlook.com
 (2603:10b6:a03:c3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:59:37 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:59:36 +0000
Date:   Tue, 3 Jan 2023 11:59:35 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2 5/5] Input: iqs269a - do not poll during ATI
Message-ID: <Y7RtB2T7AF9rYMjK@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7RsTqhYJOZs11sK@nixie71>
References: <Y7RsTqhYJOZs11sK@nixie71>
X-ClientProxiedBy: SN6PR01CA0013.prod.exchangelabs.com (2603:10b6:805:b6::26)
 To SN4PR0801MB3774.namprd08.prod.outlook.com (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BYAPR08MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: abfc37ba-7298-45dc-6c5a-08daedb446dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QgIVlUnVeitXG/kE99hhA+F3rbkDzw+5W+Gn90zJ4gEM6LlP7z2CN9ZzhHXMkxvW26qehL392GGpZB0JYI1Ca0yK+hnE6r3jk/byg542SeeOCPqWNslgZd1zGQaaazxTI7B5gUUQKGew+D/smBA+rZsvzwi71e2vy/VcQURgLIOdA+jTxaUbt58E/O+GgyPyGLGvP+39yec/ouUNFqAl7Fnue4LepmWN52uSZkZ9JCGn1aiEc7qPhwo5tH9+G91y0OKoe2zZYpw313EAyJO64cn0jMGwm9TQkN/YwJIqDenkOQnU1haZCzAqLhwqZCthNadeaAjPV+yv7wagUCCLEX1lFCtJ8Di1r/5x6+WUlAtREJU2q/NW/iir7SHH0o09jmLK7n1HzEsgE/Jku7hP3xCQsaMN1WU7xvZ4lcdASum6IiP3LeS2rfaIUXo2RRsweF5vGi/72RYGLEuaN56I6rG4/JlhpXAdV0ceT010WPmPcuyDvYfvI7ibb7nLl52Pv6+e1yO6nIPtJCWTMLnGWhd9XLqC/b2og25pb8MkMAb86by5V4TEGYN4wityCu0tdKMghKoBffzPzeXIgsqXPHGQ1424w4dG4T+aXCCk8wFM4KQXQ43Q1YRHlPmodrRTZVvBJ9TmGHko0ay7Z3/8QdA3TVURgIP/Q9gt0yFHm1OauEhfkZMa1p/PFoQl5nxX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(346002)(39830400003)(376002)(136003)(396003)(451199015)(86362001)(4326008)(66556008)(2906002)(66946007)(66476007)(8676002)(5660300002)(38100700002)(83380400001)(478600001)(316002)(6916009)(6486002)(41300700001)(33716001)(8936002)(107886003)(6506007)(9686003)(6512007)(186003)(26005)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FouSlR7OTtktdsQoaiLGL8NxszreeEfn8Sv4jSCj92faSBOqygYD41dxmosV?=
 =?us-ascii?Q?VVmCZGj/588HxXpgy0zgd2pgyzz3Q/EyUjslzlNEX68GrfQseL4vnxcND2xV?=
 =?us-ascii?Q?l09bMm39FSWHZTdOnpcfF1IgbjYWmMmhbPh/qy1xVkKiGXspI04qbLZsYtav?=
 =?us-ascii?Q?tvXeBPMPrUyVNwA+3zKgQlgKShONutAxo3aK/RyDdWu9Ik6kwdv+xARc0CbH?=
 =?us-ascii?Q?rSU6cyh9PYVbs/s65jdGzaSvBSmDax66XtGOqf2mAUsrgNZRNNyFXKqvoMWN?=
 =?us-ascii?Q?rp+LZNcGT8LY1E8PUqTFKZ6ZEgWPKs6Y7YiNbQk3Q0uxP1c3I6m1y07yubnF?=
 =?us-ascii?Q?gp6qXKuhnbUdOq7+st3BR0oe2Zjz+FughH7TI5IDl+Px22DfzQIFCAjbGkGy?=
 =?us-ascii?Q?Yxxch3oyOGt49OelWSyzE8PRw/Q3vgghaTwQ/GyYeDjwtQn4W5xfbw8SrPIK?=
 =?us-ascii?Q?CsNS0zIa9Fw7Vn0XX7LClQZvjIrQlT6hwNDxOHMTcKWsI3GvWVCwLgRRsZDF?=
 =?us-ascii?Q?19Y9XtkKmsQ0VoMFvd6NX/XUK1sD0MiKi5Sb9ARIHSXrveyiib5zBbkXy0Tk?=
 =?us-ascii?Q?cHgMyGyXer1ESAVY57OPBwOKz8R7UgUifRyjXYDjVDd/LYhsiOC5cKvKwq5I?=
 =?us-ascii?Q?13nhRyxua2HHZy77tLxL6n3p4KGWl25J9Ohn0ivSCMXaKfp6aofF0eZssNe0?=
 =?us-ascii?Q?lx5aS6+1TZw4OLtJgpWolAky/AhFoZj4BkKN5mDznaIom8/rpakLXpcscjHw?=
 =?us-ascii?Q?CoSB1i+ySx9d8DMvNRsKK6y4HYPJ+qfLFKxfLh7dBf+1nuEWSH2KuZnZSswY?=
 =?us-ascii?Q?h/j8x6yOHS+nD+ZVZCajGq2adrxvCT1onPIVU1EOZA33PfIn+uyuflgIxzZc?=
 =?us-ascii?Q?lZq/zH365hvKnsxS5kqKWmAwAOEaIM9sSVhDYXZI1gjiBTJqWf2+eqlC496X?=
 =?us-ascii?Q?IrS9FzdcXlKDxr5LPDTXwvfCmJdzbIYxmm49MB2efyIvLf2D5DObWXjF4hNU?=
 =?us-ascii?Q?p9dGuCHgKBMx2x7XArc9HnMZV+xcW3WSfBSXPqRXRfAiRD/Nz1EwofOyc5CT?=
 =?us-ascii?Q?TRIxt2Q8EKh5Gwls9q0UyNOCPcmqFntEFqh2n26QKBa+nLPxwYKUTXvfZlO7?=
 =?us-ascii?Q?kyMEqUL/zb0/fHvn7J1uFFOCp6Pic1bD73r3XaHL2WOe/ttYS3+9RLWePc47?=
 =?us-ascii?Q?7w7zeek6QkzbMj1d/WR26Bcx2a5IW/ZGMHXMbq6J3pI5TzoP6nAcxGEy2A1L?=
 =?us-ascii?Q?Ho0gdH7ZkqF5IYQ5PF2W6Zz0MeVlshA8zcTH+7sK3KiCZeNFQTgChFSseIRB?=
 =?us-ascii?Q?TWY2VHJjXqbkaLKp6eDAvtho74k3FaHOZH6dsZ7yJLALelhNTKHQTK90tRhs?=
 =?us-ascii?Q?J2M62DJ+wszn6r38IH7BfHJhqxPGaP8a8hQLYYQxVhLiaWrhNPm83GHQlZwN?=
 =?us-ascii?Q?BTnnrNMs/q+Hq54pbPFi4pcOAlBJIxTcK/GZtoqn3LbSAdgvqpURqmlnylRG?=
 =?us-ascii?Q?DXPS+JMbwAYSjkXAgFvhaCUwBWMOICpN9xCUEsm/BG6d0js6o1sIluoXf1La?=
 =?us-ascii?Q?emt3M7WAMHFkPfQt5AzaxdU5BA5OJQHbbYs592en?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfc37ba-7298-45dc-6c5a-08daedb446dc
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:59:36.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8aYUuij8fO24uiek/1dGGmLEi6eQ+0/HtHpByuiaYhZ0YDTK9KEmUTSUjzR7ZXDXbgXeowrYqnzHvZctkfVTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6005
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After initial start-up, the driver triggers ATI (calibration) with
the newly loaded register configuration in place. Next, the driver
polls a register field to ensure ATI completed in a timely fashion
and that the device is ready to sense.

However, communicating with the device over I2C while ATI is under-
way may induce noise in the device and cause ATI to fail. As such,
the vendor recommends not to poll the device during ATI.

To solve this problem, let the device naturally signal to the host
that ATI is complete by way of an interrupt. A completion prevents
the device from successfully probing until this happens.

As an added benefit, initial switch states are now reported in the
interrupt handler at the same time ATI status is checked. As such,
duplicate code that reports initial switch states has been removed
from iqs269_input_init().

The former logic that scaled ATI timeout and filter settling delay
is not carried forward with the new implementation, as it produces
overly conservative delays at the lower clock rate.

Rather, a single timeout that covers both clock rates is used. The
filter settling delay does not happen to be necessary and has been
removed as well.

Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v2:
 - Added Reviewed-by

 drivers/input/misc/iqs269a.c | 97 +++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 814d1a898e7f..8b30c911f789 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -9,6 +9,7 @@
  * axial sliders presented by the device.
  */
 
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -144,10 +145,6 @@
 #define IQS269_NUM_CH				8
 #define IQS269_NUM_SL				2
 
-#define IQS269_ATI_POLL_SLEEP_US		(iqs269->delay_mult * 10000)
-#define IQS269_ATI_POLL_TIMEOUT_US		(iqs269->delay_mult * 500000)
-#define IQS269_ATI_STABLE_DELAY_MS		(iqs269->delay_mult * 150)
-
 #define iqs269_irq_wait()			usleep_range(200, 250)
 
 enum iqs269_local_cap_size {
@@ -289,10 +286,10 @@ struct iqs269_private {
 	struct mutex lock;
 	struct iqs269_switch_desc switches[ARRAY_SIZE(iqs269_events)];
 	struct iqs269_sys_reg sys_reg;
+	struct completion ati_done;
 	struct input_dev *keypad;
 	struct input_dev *slider[IQS269_NUM_SL];
 	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
-	unsigned int delay_mult;
 	unsigned int ch_num;
 	bool hall_enable;
 	bool ati_current;
@@ -973,13 +970,8 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
 	general = be16_to_cpu(sys_reg->general);
 
-	if (device_property_present(&client->dev, "azoteq,clk-div")) {
+	if (device_property_present(&client->dev, "azoteq,clk-div"))
 		general |= IQS269_SYS_SETTINGS_CLK_DIV;
-		iqs269->delay_mult = 4;
-	} else {
-		general &= ~IQS269_SYS_SETTINGS_CLK_DIV;
-		iqs269->delay_mult = 1;
-	}
 
 	/*
 	 * Configure the device to automatically switch between normal and low-
@@ -1036,7 +1028,6 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
 static int iqs269_dev_init(struct iqs269_private *iqs269)
 {
-	unsigned int val;
 	int error;
 
 	mutex_lock(&iqs269->lock);
@@ -1052,14 +1043,12 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 	if (error)
 		goto err_mutex;
 
-	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
-					!(val & IQS269_SYS_FLAGS_IN_ATI),
-					 IQS269_ATI_POLL_SLEEP_US,
-					 IQS269_ATI_POLL_TIMEOUT_US);
-	if (error)
-		goto err_mutex;
+	/*
+	 * The following delay gives the device time to deassert its RDY output
+	 * so as to prevent an interrupt from being serviced prematurely.
+	 */
+	usleep_range(2000, 2100);
 
-	msleep(IQS269_ATI_STABLE_DELAY_MS);
 	iqs269->ati_current = true;
 
 err_mutex:
@@ -1071,10 +1060,8 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 static int iqs269_input_init(struct iqs269_private *iqs269)
 {
 	struct i2c_client *client = iqs269->client;
-	struct iqs269_flags flags;
 	unsigned int sw_code, keycode;
 	int error, i, j;
-	u8 dir_mask, state;
 
 	iqs269->keypad = devm_input_allocate_device(&client->dev);
 	if (!iqs269->keypad)
@@ -1087,23 +1074,7 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 	iqs269->keypad->name = "iqs269a_keypad";
 	iqs269->keypad->id.bustype = BUS_I2C;
 
-	if (iqs269->hall_enable) {
-		error = regmap_raw_read(iqs269->regmap, IQS269_SYS_FLAGS,
-					&flags, sizeof(flags));
-		if (error) {
-			dev_err(&client->dev,
-				"Failed to read initial status: %d\n", error);
-			return error;
-		}
-	}
-
 	for (i = 0; i < ARRAY_SIZE(iqs269_events); i++) {
-		dir_mask = flags.states[IQS269_ST_OFFS_DIR];
-		if (!iqs269_events[i].dir_up)
-			dir_mask = ~dir_mask;
-
-		state = flags.states[iqs269_events[i].st_offs] & dir_mask;
-
 		sw_code = iqs269->switches[i].code;
 
 		for (j = 0; j < IQS269_NUM_CH; j++) {
@@ -1116,13 +1087,9 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 			switch (j) {
 			case IQS269_CHx_HALL_ACTIVE:
 				if (iqs269->hall_enable &&
-				    iqs269->switches[i].enabled) {
+				    iqs269->switches[i].enabled)
 					input_set_capability(iqs269->keypad,
 							     EV_SW, sw_code);
-					input_report_switch(iqs269->keypad,
-							    sw_code,
-							    state & BIT(j));
-				}
 				fallthrough;
 
 			case IQS269_CHx_HALL_INACTIVE:
@@ -1138,14 +1105,6 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 		}
 	}
 
-	input_sync(iqs269->keypad);
-
-	error = input_register_device(iqs269->keypad);
-	if (error) {
-		dev_err(&client->dev, "Failed to register keypad: %d\n", error);
-		return error;
-	}
-
 	for (i = 0; i < IQS269_NUM_SL; i++) {
 		if (!iqs269->sys_reg.slider_select[i])
 			continue;
@@ -1205,6 +1164,9 @@ static int iqs269_report(struct iqs269_private *iqs269)
 		return error;
 	}
 
+	if (be16_to_cpu(flags.system) & IQS269_SYS_FLAGS_IN_ATI)
+		return 0;
+
 	error = regmap_raw_read(iqs269->regmap, IQS269_SLIDER_X, slider_x,
 				sizeof(slider_x));
 	if (error) {
@@ -1267,6 +1229,12 @@ static int iqs269_report(struct iqs269_private *iqs269)
 
 	input_sync(iqs269->keypad);
 
+	/*
+	 * The following completion signals that ATI has finished, any initial
+	 * switch states have been reported and the keypad can be registered.
+	 */
+	complete_all(&iqs269->ati_done);
+
 	return 0;
 }
 
@@ -1298,6 +1266,9 @@ static ssize_t counts_show(struct device *dev,
 	if (!iqs269->ati_current || iqs269->hall_enable)
 		return -EPERM;
 
+	if (!completion_done(&iqs269->ati_done))
+		return -EBUSY;
+
 	/*
 	 * Unsolicited I2C communication prompts the device to assert its RDY
 	 * pin, so disable the interrupt line until the operation is finished
@@ -1554,7 +1525,9 @@ static ssize_t ati_trigger_show(struct device *dev,
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", iqs269->ati_current);
+	return scnprintf(buf, PAGE_SIZE, "%u\n",
+			 iqs269->ati_current &&
+			 completion_done(&iqs269->ati_done));
 }
 
 static ssize_t ati_trigger_store(struct device *dev,
@@ -1574,6 +1547,7 @@ static ssize_t ati_trigger_store(struct device *dev,
 		return count;
 
 	disable_irq(client->irq);
+	reinit_completion(&iqs269->ati_done);
 
 	error = iqs269_dev_init(iqs269);
 
@@ -1583,6 +1557,10 @@ static ssize_t ati_trigger_store(struct device *dev,
 	if (error)
 		return error;
 
+	if (!wait_for_completion_timeout(&iqs269->ati_done,
+					 msecs_to_jiffies(2000)))
+		return -ETIMEDOUT;
+
 	return count;
 }
 
@@ -1641,6 +1619,7 @@ static int iqs269_probe(struct i2c_client *client)
 	}
 
 	mutex_init(&iqs269->lock);
+	init_completion(&iqs269->ati_done);
 
 	error = regmap_raw_read(iqs269->regmap, IQS269_VER_INFO, &ver_info,
 				sizeof(ver_info));
@@ -1676,6 +1655,22 @@ static int iqs269_probe(struct i2c_client *client)
 		return error;
 	}
 
+	if (!wait_for_completion_timeout(&iqs269->ati_done,
+					 msecs_to_jiffies(2000))) {
+		dev_err(&client->dev, "Failed to complete ATI\n");
+		return -ETIMEDOUT;
+	}
+
+	/*
+	 * The keypad may include one or more switches and is not registered
+	 * until ATI is complete and the initial switch states are read.
+	 */
+	error = input_register_device(iqs269->keypad);
+	if (error) {
+		dev_err(&client->dev, "Failed to register keypad: %d\n", error);
+		return error;
+	}
+
 	error = devm_device_add_group(&client->dev, &iqs269_attr_group);
 	if (error)
 		dev_err(&client->dev, "Failed to add attributes: %d\n", error);
-- 
2.34.1

