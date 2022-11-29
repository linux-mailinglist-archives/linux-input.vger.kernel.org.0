Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC1E63B880
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 04:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbiK2DE4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 22:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbiK2DEg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 22:04:36 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDFC4A595
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 19:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azAgOGJ+wThRnO8fHLsaqoFMKf+J48h/zRaKYwzBiZlk7zvUCeZ7XY84DsdJe7hI/8B3is1E3OlJcoBmNlp0+F2WVyHbG0a9ZJBE1XZjI1qa6cDE9FJ5wz6STj0Jcitzi9jxyXIJFlK3nFHDjVwpouwj82nxFvJdecBb5IrcvHKmhpxNxdpmFdzHvkikxYGg59hohFCKJgHfLO3T/VaH6FsSM8Ivu7s8LBxbspaHCODnoluRPH9YoJkt9GUwaXRG+972MOwY7bhyKSFGcw1kYgwGQhhKPFBssptbpRJtMhacGX3fsQbgqfTcfWhDahv1G64ZibxQPeMGK1Ec9zfR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhGgafrIZHiSyj32XqsGqpnKa19UUlOpe+UnK9UMClw=;
 b=T3/rCHM//RyRga55lzL+POVwO+7rCMjq4GSsohvuuVNAa9ScZIyKSR0kRaQBX/ZHbtDK/l+xneA+Hsxc+wZOQYfnYZ7xNtZh05bCMjaNxWPx1WcEocuOczrx+5BDroVqS3uEajO3IK/JPSbwdfNx9yzgXmO2fckQFFhYl/vC+XjquMFV3T+AgpJByK0Fm//W64helPC5CMqztnv7R/ecV99Ux0IWLG5096jdDbkijC6N94t6I/S+cFksss0Nm0EXgE7haS8akMeA94b6xOyMXgg0B2D8xth5j91CJmfYAa7rtBXjOL62xi8uXFXtLLBFOqeKUnl1xpzhkpmlos6SIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhGgafrIZHiSyj32XqsGqpnKa19UUlOpe+UnK9UMClw=;
 b=GWsFu4SqVH9kEuJ2hw2nkklqCw9YYrF6sohDOytvsesu77C0QswydggEEs2+lBzALujFUqTxIHv56dPRy+Udpu/IAVrLX7RtbCBBH6cOFjw1bG2NlevhEFiMhVQdzvMQw8RIgZ4RvKPKiinOUylmiFTyKE5dbBUiIb6hRfUr6/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BL0PR08MB4546.namprd08.prod.outlook.com
 (2603:10b6:208:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 03:03:05 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Tue, 29 Nov 2022
 03:03:05 +0000
Date:   Mon, 28 Nov 2022 21:03:03 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH 5/5] Input: iqs269a - do not poll during ATI
Message-ID: <Y4V2Z8Iwp3qbGiBf@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4V16ey6osEaaZJ/@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71>
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BL0PR08MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ff313a-4e9a-492d-d46c-08dad1b63c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkMI54b1NBUqwH2ObA6vRZfms8BA29Xvau5texe7Te3eyDToJZtj4iWxmTcCJNJgqtQJDD14ExQXMgEkWbudFwQwy/aeLU8xXO/wG+yGEq3+mJ4d2ztZX0gL18BJcHOrLztA28XsWLajDMGPflRzR8+6vCrcbaA9TfyN5Icp6JiS4u6AgV/eMOOUg2MALgvLitGO+lTomofUUS44oE4YVDDkOT9PBzlAxEMvfJP656UY2mlkC/uv2nbDoh72yjonqlpoiSXtDK9UvwV8Rzy6MPKa75Zpj2ENmSTBNfG6wUSocE6iXCQymI7MXyWz0qLxJoE5dWO7izU3zjessozOATXwyyFsFX2MvufsdR05CspEmMYQcfZSs2wIDD7tiRgs2nOOQtSyLtygZgM9GChZ7zgPnU99SfHkOlFpOT1bQ6GIKdHnVyf+/w1ZrmNDMfnNXL4jXAg0w0xdV3/WOwQmpNRDTJfm4Xzv72BlJI6+gLxPgbyBWMQt5k0MMf5KQpN5kejvFXvaOhoaculfLJB45ZZ0LJdmW8kf1n/lIn94bT94TuiuQfuZ7dJROuUM9lExHPNx43BK9Zvo7Gi+Ssae81+o21SRCKOSfX6edDxlAOwWZhHd8rbrqrJWA+mYJxKcgap5cNWRl1lm92lMMduQSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(346002)(376002)(396003)(136003)(366004)(451199015)(66556008)(8936002)(8676002)(66476007)(66946007)(5660300002)(41300700001)(107886003)(86362001)(33716001)(6506007)(6512007)(26005)(9686003)(83380400001)(186003)(38100700002)(6916009)(6486002)(478600001)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ic14Ld/TofD1t5J00stPsFeYUNbKXQqvL+pr3aQOkVCwCjVwdB7e6bJge9pF?=
 =?us-ascii?Q?rQht8aiFD1QSGXYy9DJ2Z4fQd59i5mKZAfCVC7GiKjw7HgZKNlW0xzmkO07w?=
 =?us-ascii?Q?NS5Qm3lF31TLgueM19tbYAX/IYAQryFPbsAmYiD/CZkLa2mIkyskQqiM3XoR?=
 =?us-ascii?Q?D1EtRhmi6A6kkCpsj6ks+gvaaFCl/VsOte3HSacFFg7CFu4KGp2pJi2CQHCE?=
 =?us-ascii?Q?zRklWKPo4vfzf1XMfmY8LFvR7KHRQIdDY1IEImKDMvHELl8PLJXDDFEcfRga?=
 =?us-ascii?Q?loNZ+6t+MVXxvW1RXyoBhTOGWMcbfYBu8zJMi4lO2yxdg/62k1/z8J8cVskB?=
 =?us-ascii?Q?dRoGII77fYaDXxmPv2d5pFTBmP/VFE+GJRlYmWmX4YL0pSLEczp4EToK9WVQ?=
 =?us-ascii?Q?3VhRZnTzFZhRv8IyamVRIOgWk1+R7m+eZtiZm8JA+HQ/MeCivIFDoBU9L83P?=
 =?us-ascii?Q?/1VBGqyC1xhmpwiyrZF4bJW8ixm8W6hDfqPbGtR4wM8p9PvAnRKMDsbdRkxz?=
 =?us-ascii?Q?wwx2QWVdz5A/nCn2qHOO0FofOj/VR2NWh6jPz5JWFd2e1hc84mtGqpEHUbcG?=
 =?us-ascii?Q?WjBETbMAVDuta5qU1aOfFHKGjSMFQWOkLhkpV4I/zPM9wd5gsGR61nmD9oEf?=
 =?us-ascii?Q?imU0JiAsyxrzW3y8Wbrl0zSWXiDXOB+UCyYTpDR18fCSCmPKVXjjA1njTEeg?=
 =?us-ascii?Q?voYtTBAVuK9e3M/gA6rG5JwqZvEN24s35yTkpqu3y8KahsjhX3xtxUXiaH4b?=
 =?us-ascii?Q?YhgU09PRKbxeSejc4BNCe7vY9d47jbzPwbfl5TVJUXnvK8CzvwnXEZk+D0ab?=
 =?us-ascii?Q?nKlk4rp841mHwQUMAQuTjcEAA72vgWmjuHjj8elwr7WX1b2PI+ppz3YkIxq6?=
 =?us-ascii?Q?S8Uq3ioPsIyF5x2Vafbix8qcQA7mT1VF2pWIkFmegm+8d7dE5v8PYpyzOeo8?=
 =?us-ascii?Q?rP+Op/CZgFDpqLLB1BFncD5sj+zyHSfGD1ab/KMFg3/HLM5zFBveBs/a1YVQ?=
 =?us-ascii?Q?6MODbBWKc/tTPWxgAdYI396qjolgtNaoGATzbuqE7fG5mN8MFlUTts8TF72D?=
 =?us-ascii?Q?q6Qmfc7VcCvmHJIV/mJwQ28FhXGQatuoB683naw9mdz8b04DHHqMDQUAgRxQ?=
 =?us-ascii?Q?CkJ3n1gcLW4C293CJCxW1yjJibcPSYZMgH5OKkeqDwyfbkVXpfZHG8y4cp2x?=
 =?us-ascii?Q?7Q/xdi6PoVnCS0oR5dypK6JfUowMCQ3LzU2gvpAQCaSE84DIB54Grpn5rnev?=
 =?us-ascii?Q?4r9VRxgRFYf5TsMwe/p+amNyZz63Sw0n5nG14Q3nIlYzdttm+tK0rtuj3wRh?=
 =?us-ascii?Q?mD/p1HbsY+SHE+3IOdIuxwF67B2+DjGN1DhZGR3jlsB6cvIToIC7w4Hc+SsB?=
 =?us-ascii?Q?86AjB4IX7v1QlfRvReFJOiD3VWh6w91m+RdqlPB5/3E2BwTfa1Yof09bMNGv?=
 =?us-ascii?Q?X+pdhWY/Egxb0E5Z2m13zxRpTNYG3MOgMsdXfBXIW4OaUr8TiAzTbVI8qgOX?=
 =?us-ascii?Q?oIJ3I6g8tJKENFLwyj1jgAg8MMdmmEbVNGsQ97zrxeDgXgxWcW6kPHTG/t4G?=
 =?us-ascii?Q?p7076NILFqN5okEkTtV/GkBkaEjddQZDzJ2SogX6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ff313a-4e9a-492d-d46c-08dad1b63c0d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 03:03:04.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxPmOCpkCXiZytog350t4arq5++COdwrWtt+cZ2m2gtc+4F6VmQM2YYP8YhvJLyDV09gWEQKmrqubxHkvQKjfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4546
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
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
---
 drivers/input/misc/iqs269a.c | 97 +++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index eca680bf8c20..4e7b46d30052 100644
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
@@ -979,13 +976,8 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
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
@@ -1042,7 +1034,6 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
 static int iqs269_dev_init(struct iqs269_private *iqs269)
 {
-	unsigned int val;
 	int error;
 
 	mutex_lock(&iqs269->lock);
@@ -1058,14 +1049,12 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
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
@@ -1077,10 +1066,8 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 static int iqs269_input_init(struct iqs269_private *iqs269)
 {
 	struct i2c_client *client = iqs269->client;
-	struct iqs269_flags flags;
 	unsigned int sw_code, keycode;
 	int error, i, j;
-	u8 dir_mask, state;
 
 	iqs269->keypad = devm_input_allocate_device(&client->dev);
 	if (!iqs269->keypad)
@@ -1093,23 +1080,7 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
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
@@ -1122,13 +1093,9 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
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
@@ -1144,14 +1111,6 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
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
@@ -1211,6 +1170,9 @@ static int iqs269_report(struct iqs269_private *iqs269)
 		return error;
 	}
 
+	if (be16_to_cpu(flags.system) & IQS269_SYS_FLAGS_IN_ATI)
+		return 0;
+
 	error = regmap_raw_read(iqs269->regmap, IQS269_SLIDER_X, slider_x,
 				sizeof(slider_x));
 	if (error) {
@@ -1273,6 +1235,12 @@ static int iqs269_report(struct iqs269_private *iqs269)
 
 	input_sync(iqs269->keypad);
 
+	/*
+	 * The following completion signals that ATI has finished, any initial
+	 * switch states have been reported and the keypad can be registered.
+	 */
+	complete_all(&iqs269->ati_done);
+
 	return 0;
 }
 
@@ -1304,6 +1272,9 @@ static ssize_t counts_show(struct device *dev,
 	if (!iqs269->ati_current || iqs269->hall_enable)
 		return -EPERM;
 
+	if (!completion_done(&iqs269->ati_done))
+		return -EBUSY;
+
 	/*
 	 * Unsolicited I2C communication prompts the device to assert its RDY
 	 * pin, so disable the interrupt line until the operation is finished
@@ -1560,7 +1531,9 @@ static ssize_t ati_trigger_show(struct device *dev,
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", iqs269->ati_current);
+	return scnprintf(buf, PAGE_SIZE, "%u\n",
+			 iqs269->ati_current &&
+			 completion_done(&iqs269->ati_done));
 }
 
 static ssize_t ati_trigger_store(struct device *dev,
@@ -1580,6 +1553,7 @@ static ssize_t ati_trigger_store(struct device *dev,
 		return count;
 
 	disable_irq(client->irq);
+	reinit_completion(&iqs269->ati_done);
 
 	error = iqs269_dev_init(iqs269);
 
@@ -1589,6 +1563,10 @@ static ssize_t ati_trigger_store(struct device *dev,
 	if (error)
 		return error;
 
+	if (!wait_for_completion_timeout(&iqs269->ati_done,
+					 msecs_to_jiffies(2000)))
+		return -ETIMEDOUT;
+
 	return count;
 }
 
@@ -1647,6 +1625,7 @@ static int iqs269_probe(struct i2c_client *client)
 	}
 
 	mutex_init(&iqs269->lock);
+	init_completion(&iqs269->ati_done);
 
 	error = regmap_raw_read(iqs269->regmap, IQS269_VER_INFO, &ver_info,
 				sizeof(ver_info));
@@ -1682,6 +1661,22 @@ static int iqs269_probe(struct i2c_client *client)
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

