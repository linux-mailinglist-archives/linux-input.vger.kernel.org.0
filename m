Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF3163B87F
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 04:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbiK2DEc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 22:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235409AbiK2DEO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 22:04:14 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F164C262
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 19:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzLN7RyIKoDbfYej5TSPUzIWoSd6TV0gACauHRz+HfoCK7WwHFp30CgBVtMVo6Ruzxm+hyTlCBnj4p8bQE8HfEpSbx7HHbxWWz7RGru4j6g1zAPyKRpt68wuVtYDAmyX2kkymaURqyBLqePCeXReC0oxeVm1eaqzfNqDCwd8awTov0Mv1zyriKEJ7H5EG5Svbp6OOr4+OQM2gsycuznBeaBPNh4Wgv4zPB9zyWtlLHzAT7paOOJcS+LKUBFf2pbu9a9jp/6V70ldy45rNV6kN91NhVs65Li0gJ4Tc83Ry8FrT/VOGD5m2m7ETTh6V46sPCQRXlQzrthwKtgEz4wYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq9VJZW+9T/AFf54+q7Rj9hV4i/A86imUc4yCoORKkY=;
 b=EmE6pmBRX57Zhq/s7LC8FDDbH9W+VlwvSlieDkgEwub3F5Koi93dzr0IH0tfjpnh1p7rGp6Q1SeKmjSax0d1Qgw9TGnIPXkQHHqdT9cikqVTRB6lJbKpmHBmSJzfDy4jWoZrFmDCROsr6umodjR2j+eWWj1UXb+4Y+HPGnKYHbPFvz1mKt7HEB33WIyckZSec/GWCC7mvpA0+ec9OWr6JjIlmU4gRLnQZYAYmeapWZzh85Y8cnqVrmDK45VbEwGt8wXn/NPW3fZRZjj0whyRzL0vkBItyMVPp+/7hAfiaLr6lXmBi3uvZJJVYwQ4J7DHT/6c0UokSNFmNzQnS9WJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq9VJZW+9T/AFf54+q7Rj9hV4i/A86imUc4yCoORKkY=;
 b=cDANaQthizI2B4+6PXPhwbMuHnrbAGVxpAFwVBwhbzk0+GCSrACTP0zlApo4enO+ito4yvjSSuSRDHL6uZp+Lb/exyPCflh276kiZMWlw2Ab/XbDpGaSqyRGGnzGVPrZpKGT58pCTPs5UbxRJ1f9+ev2YfrtAHy+mdzcMTNrxck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BL0PR08MB4546.namprd08.prod.outlook.com
 (2603:10b6:208:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 03:02:54 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Tue, 29 Nov 2022
 03:02:54 +0000
Date:   Mon, 28 Nov 2022 21:02:53 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH 4/5] Input: iqs269a - do not poll during suspend or resume
Message-ID: <Y4V2XUtLVkOHvi6C@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4V16ey6osEaaZJ/@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71>
X-ClientProxiedBy: DM6PR02CA0145.namprd02.prod.outlook.com
 (2603:10b6:5:332::12) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BL0PR08MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 1017ccbf-5cd3-49b5-14dc-08dad1b635f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewukNXNurKpOq8tlbrIqs7/G4t6sAi3Zs2BpR+GC3G6Jok953cbuWIzDkEQbHoF4SI6D4pZZ27mzfUYbHDrougs3kk8SKqSMYTJGzCXN0ZBMnE9uiCkEwdljrdYJVqxyfwmNEBUq/BXAw2/8nlAy54TKx8AAxZbDIKxjGX+rx9Je+cxi4Turl3CEZkxasSErr7gYIKDpK0yhSMzl9s7i6EhVr25JsNYHJOXDhWmCVmXlTVUqkvnnd9ksakZ+CYCoZafvKRtobkj2Gfc9X/sukVnd7mAVbZAqvFizwms61DHyvbV3pKQKPQPn3W9uI2m9wQKsK/AM3veqiMao3d2pltn64qnPXBQtVDHVYRXyXSOb6Hrnmfh6HZWFO37gf6MVWDBdp5qZm5EOnXNnkXHqG7HXBY7lwpSWOQnE9em1O5RKQ0ceCTdAUjrt8WTdNoD1A7eYiCa9YzlyhlNjfC+zXzCaTK1sxjWyqx1pIDqBgoSGqno5T2RjrVHsBRaqKA320RYDSSdR7sVyQwvKTPXNTjbhVrrikAsmG62IV0pWlb5SeSF5iM+py0nqjIBKRE6Y9qAJ9efhK2SjwMt0TReUCHhlKNG6KxXOr/2LV6aGlc44p9awlmIoZ+4PBQVw1E5nt/iRtyHCd3Tg5XbuZ1EmfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(346002)(376002)(396003)(136003)(366004)(451199015)(66556008)(8936002)(8676002)(15650500001)(66476007)(66946007)(5660300002)(41300700001)(107886003)(86362001)(33716001)(6506007)(6512007)(26005)(9686003)(83380400001)(186003)(38100700002)(6916009)(6486002)(478600001)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fmJUdEoLVQkJhaTdRKDxc1UdoaF7tvDHl2TApBAWtoXhQhFneilyCsDj609u?=
 =?us-ascii?Q?ELcqxwgkrTr9WDytpMh5uB9LlrA213z8sXrZ7ZEXU2AvIjacS9dctf8MfLlg?=
 =?us-ascii?Q?pWX1v2NpCP8GI8Kzj1tPDfG+J6OjHx6GjtNc0nlpMo1th/UibcUzZjJgutD2?=
 =?us-ascii?Q?///H0FkjIF2B6cnho7QobHGYh0wRKFUCL3IFulBn4as0o1hq4KrFMP6uerQr?=
 =?us-ascii?Q?Gdc/XvAZ84neVh7Pn3VhPMgTEMEsq89UYEJh/gvGRHle8kvMwT/tGC5fLbKH?=
 =?us-ascii?Q?jFC2Kt2/k7UsGMrQHjOcSD6qrQBz82Awg243AFVLSbXrhacWCcxZ/7w0k8/l?=
 =?us-ascii?Q?Qxq8h+kfZSbl9dkpa82mIpSUZf32u7+h4ifMvZiVNI+ZdezUmwZIWE4U9vTt?=
 =?us-ascii?Q?+HT/X3FNplEvbnTCr0PaXVJOIrySWDJk+pGIRF5bc0hrLMMvHHyeVzKfJxdi?=
 =?us-ascii?Q?dI+GVu1rwOZuPNkSZ1AGrywvmS6Qs7/p4+MUFY1dGAKto+OS9/svr/3XHZCb?=
 =?us-ascii?Q?edC3eM83Fy7DeiuQFsrrD1he6CTQF8mEOGPdpRyaYIs8Z+qUYZGYAg2CxMz8?=
 =?us-ascii?Q?pxk28uxR5zxSxc99WGO9io9ULjPx1KrHp7iczbs4Evkx7WxbRBig3hApvIHu?=
 =?us-ascii?Q?c/vYKP7JQk4mmG6aV4rBt5flEHQh3mUARheevzk8oFYgnsQrv8/vVqWu7Gvj?=
 =?us-ascii?Q?SAwIFZ3r1ouUIdM7tSxL2/aOVCDT6ZEPkk2xla37qwEeSogg4E81S0CN6vf7?=
 =?us-ascii?Q?R/nwRZeVxVuRoRFNCUYQ3dfuihrU1bKopWFnAVsAXj2W14JREeFcxdm+mHaw?=
 =?us-ascii?Q?ST2iJYSteYw/YkKYzF0EfSYmQU6g/fzeIDVrFrDSeOI375JVfdt/o1u2h9s8?=
 =?us-ascii?Q?VEKXZoStzVUBoNveBr9TYiIF5H5/slCbdJBraA9PWw9Em57Zeuw1QWwC8vaS?=
 =?us-ascii?Q?iR/dUzPkewNeVgL3OUlCOZFEhWsiktl1N5niisjzJ/f7E9hml2m2xhcHKf1E?=
 =?us-ascii?Q?N4eOVDTZhT5+o6GxemH+QpX4g0kNp7UjhrgxmCyI3TOTLW4MWIOY2Uu3ifd9?=
 =?us-ascii?Q?8fUi7Ed+oUMYLsxSPE+2y36ivRSSUHRJ2fShMndUpwUQAULcDqK80al+kJES?=
 =?us-ascii?Q?n20Tm8MrDxZuIm005aQJekX0zT5gmISTWlbLC+bGd3sCwEPhel91ucpHi2Ap?=
 =?us-ascii?Q?tiZzLLJsZ8JrB/32GG1qUfCbqqtQWXKD3TXnjRn6p4r1YhHGaSkRuuLV8Wl4?=
 =?us-ascii?Q?ScPGYFwr7h3LeTR+1VibSVExXtnxA5uymM0wTbbKOkBCeZbwLmM0Oo6JfDFw?=
 =?us-ascii?Q?uymEjkRaqN0CzHvZxxIgTxs5fygMM2inLl02qzigbfxXUSwJOGyNzZRUVJ08?=
 =?us-ascii?Q?uPmQOJO9zzcvarDo5qpDigTwMpCOUuULeXCmZ6CryKXsbixB2gPgWSjtN1tY?=
 =?us-ascii?Q?egPUJbsdLPongmyMafXbNSZMLAxuWSbFmcEFDA4n2rG/RDAYPi1bDbNyYRzo?=
 =?us-ascii?Q?TDoDI0f3pT06XTntC97akJrBr+OqZaJC1EuLCfFbNQyyIcxU2VRJGM273YS3?=
 =?us-ascii?Q?jsJdtLcuNtypFSBYZVQFG2OF88Bq/418oiMvwSyJ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1017ccbf-5cd3-49b5-14dc-08dad1b635f9
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 03:02:54.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvnWd+CX1rPofLcjL+IOUSt6MlWfp7ZWfxuAPOBmX00q/y641f3/qMpTrjGT7p2f2HzNocMO9sI+K8Q98IH1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4546
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
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
---
 drivers/input/misc/iqs269a.c | 118 +++++++++--------------------------
 1 file changed, 31 insertions(+), 87 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 0eb3cff177e5..eca680bf8c20 100644
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
@@ -773,17 +769,6 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
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
@@ -1011,6 +996,17 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
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
@@ -1693,59 +1689,30 @@ static int iqs269_probe(struct i2c_client *client)
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
 
@@ -1756,43 +1723,20 @@ static int __maybe_unused iqs269_resume(struct device *dev)
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

