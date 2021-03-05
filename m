Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EFE32E06B
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhCEENU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:20 -0500
Received: from mail-dm6nam10hn2202.outbound.protection.outlook.com ([52.100.156.202]:44001
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClS/kdLjeLtzqx/BYaQMZyyiFdkmPqbeTHBMJEQijboPGvrwmUAdcejaWJvkc6iAAur5VQSyr/03rLnDTyF5yGwmihRiiTsuvJz1qHnEV0P3CRY0IamyLjGUFoxmKH9dFYXhS43jaWEtuw2NhIo7BWD8h9cyBKSp0vrWRVvFz/FoFL9r1UQJQ1PdpUNZO1Rj5R2B/WhWEutYdSitUKdJU0p0gXMT2rsqcJcp86dMyoR/2BXXm7hytSwoMhYVNHHgRTtnAcEEGiddy6Buci6BairPPc4fzZl1neykNbzbb9BmETW4MgSqdHjzso6eDYL1h4ZrKfN+aHbUEkq/vFtSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdvVfMqijQu2EmQz2GIEDGyIBEN6ScSSyHS5qpYfOz0=;
 b=lr6qV5b1bh15qGzb4TIf88QBLP7blGjlq8Rn1YWrVTQDm4LTOVHhuZbjROrnYNhBSIapEydhzWPIGBVTsZOxlJIUjEHm1xkt9ykTNSmgURE1GdI09lwHZCCjqU63OCAeesxxKfYT/4V5V688bgZ0GCafAxL25sE5mQ4C12giGyfLgvoXZQVHrqDuBDdRQFvJhifo7Qji/BwS9/mzK1QD1045islBww5qHWUddTHQaR1Ft8h1BkoidvEMiGvT7qTuVYaukpyObR+TRXN2uolaizoqUGwUsoJNcvmFVn01EHTPp6SFpfzIabMaL2Kgr291ffulO+T4WuyeadZ3yPZiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdvVfMqijQu2EmQz2GIEDGyIBEN6ScSSyHS5qpYfOz0=;
 b=Q6nIitym4eDB5TxwJmtK2fbKkTrTi/+/DdxKHWEfx0H035nt1AC/DnxU6TTdCTD+9nsyayx+u2opDXO2cJz+HyYMaRj1INztDL+lZxYnDsLNHKyVWvpEwRtNEma4wdrqEtFJdIq5BwlcOQkPlXJY7wlVaNaM3XHH6aw7+uu72AQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB6112.namprd08.prod.outlook.com (2603:10b6:805:f4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 04:13:17 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:17 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 3/9] Input: iqs5xx - expose firmware revision to user space
Date:   Thu,  4 Mar 2021 22:12:30 -0600
Message-Id: <20210305041236.3489-4-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305041236.3489-1-jeff@labundy.com>
References: <20210305041236.3489-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c5e9d4-26ab-4451-881f-08d8df8d012f
X-MS-TrafficTypeDiagnostic: SN6PR08MB6112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB6112FDAECFE60D2D1DFDCF77D3969@SN6PR08MB6112.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTCfHTYHprL/qHysFN5dMQykuTOP4guD+tC1krkwEF/XTsBcGFllM4OVl9Wmc4mWAjmUQKvTSLi8YfsbqL3bVvtw/gHbjoHNifDIg8Vye3D/z8uVZujfXQ1ZF0fqk9fIE07cVjsO8f5rJiw/IgqXkjM+XZNi+6jiNpZFcu7x5TB/2BKC7xlHaPRqWqlHY3Xwbg6oCwlVYN0E1VAVPj07QdOaq62qz1QHtfPPXlPRq5NPnzd/uH4+X284XeorYGHTksP/OeU5NnLyszdLOzX/iksLg/hk2kxsDfP86dnhqfF2oDlcwIMFAOphZtMcSUWhs+cSFWEDVMUJEvV9oKCI8RtkGSra414Wo4GkCuPKmPmergGYPFHQqMOkysMqx3agBCrFCo6fBqIgmKg4A2tPcI3EqTzVZBWsi4AVeV0UtkR7w9U60Hm2Qx7Gz6XDFW3/usUyRPiVZfu71xhXe+9Pvye8IzVkdy+HzR0Qj5Kk0hZf1coz0R6KPuQ0xZCgicGPvUDP7PNmbYvQo9aGuOkHjbrmMFquLwIGMdn40sA2iPR79vzgEdcwR1veAIVp8tZil34xCQaDD15L9LgX3nQJdAZRRTGYC9tXHhj7D4zSTkSp9IqMOq01mwQ8cbj8cCDvi8W665E4DUcT2gy32+J/89YBxBWzKrtwvtZnsApVimlVkckKJWvLdFMEIt2i198QBRLCsg+dXXQMUda0VCZAu+q6b0LZFGa//Z/A/1KEBLQyT9e4ZJb+Sx1falYLL/Vsyv/I7xG0DI3NlHitm4qLvmnHcy9LabPmTZQFmzJKk3DlVZo0vTW5c/+6KmuH9RC6j7RWtW+KMJpXUtqd8pvHtk18xEbYJ8lO05ypYv2HB2Dl+ssCwg7Kb+FLuxWf4IEzmCvgfYzvmCK73BSK2XBstNbdTAuJHhsK17UWjmTrz4XwD9PsaK+WmdYLz3ZixtcU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(346002)(136003)(39830400003)(366004)(376002)(6506007)(66946007)(36756003)(16526019)(186003)(66556008)(478600001)(5660300002)(2906002)(1076003)(66476007)(4326008)(86362001)(316002)(8676002)(52116002)(69590400012)(8936002)(107886003)(6512007)(83380400001)(956004)(2616005)(26005)(6486002)(6666004)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VzpW6Zd8zXAA44nnlgyHrktGVE7QT7gC+/rEOHNtSQP95fCXQeENc5b6DaDJ?=
 =?us-ascii?Q?ZIAXU6JzYpoP3EPTdPH+aygW6zhNzMuOdRhTCrel3eTC4K3UJ+dlb4ReO9YI?=
 =?us-ascii?Q?OZACpNUx48Hjr1Kk8NdwOC3o2n4MYMtcI/Dz4Amg7+C/HVzH1hjkEHh2S20u?=
 =?us-ascii?Q?W/ru4QitNyDOyap11awLRox4oNxncMEfmC3w/JbVz5NNMv3LQciX6yco58D3?=
 =?us-ascii?Q?3PRP1Y+GtanelKWnKosh2K66mCKaWKDDAlS49IUYNYeLHfhBiA73VLVf/SWQ?=
 =?us-ascii?Q?+DDRgguMqq82ZmKLmOC8SENpTRon9ETPMOLvOrOyUxv2x7EIcRefkbcIbCNV?=
 =?us-ascii?Q?9nrr5ocV4sk8WyZoRhWGPp3DRKSKo4EztkhDztfnI9BdXE7JN+pe2g0qq0dB?=
 =?us-ascii?Q?FGWE7mRnWPWCXCPuzTgYi88rs67lP7O29YimWfEwa5holRQoPwyDPlQ16MM1?=
 =?us-ascii?Q?1o1SMPsH96jFJAIgdDVk34irMdpFMHRzLXGPYmygOc/j9uZSxn6IBST5ad4f?=
 =?us-ascii?Q?MbSyh2PlELZRqbij3evaT5i0HxGNVbFvjkgrOwtUpI3cDL7C34Ym7Ny4voNp?=
 =?us-ascii?Q?mf0/qVlOoqeKb1rVKOHW9iuE66X8hlmv3EhX4zeOznbcOqfaPhPGISiwnp4u?=
 =?us-ascii?Q?tkhAIXvAN+VjYAptZjz4XWiDEFMeXvcUhPXJvzUuhNcIbASXxP29sSDa2uha?=
 =?us-ascii?Q?R6lK/qasY0ZzkpUmj+1RHsXJBKzNo5wiqGQYAo4GtyopgcsghBnQFViNPuxn?=
 =?us-ascii?Q?LLwq7pFLM/T20msOKT9o42O/uwozUKAuNkLSWHJzGiVUdxz/NEx0dH6fvFGB?=
 =?us-ascii?Q?ssHNJFC4cIerQOo4Pv9wtEOzFQGSJHc+J4+g3ZvD30T7CuJDWKH69CiiadrL?=
 =?us-ascii?Q?s2CAwRC/BID/7dRqARPqYq2WfDU+9iBhYAQDv37bReDNhnD1+ouyJZAwMR0G?=
 =?us-ascii?Q?kwmLP7RdX9Qa4ikm7Arm2I8MN4aJ0e6HH8JgaZpyMLScHDHSyUFy80mUn8rK?=
 =?us-ascii?Q?r4IU+WJnxllWrdwfUIy17jrNeiRG6XeCemEPGnzV+KAX7473dmeLBrq8w7it?=
 =?us-ascii?Q?FDAASa7pPsinxMV2DvQ4c08vCna41VYc9naX1+WXpIAFMJ6WbSQHwgRqzQey?=
 =?us-ascii?Q?MCeflMzT1WyxUg5VCMbhlRM9TbHDgboJ9WT/mf/2VpRe466d7KsYeshxFWYy?=
 =?us-ascii?Q?PmEvYXyv6G140UD4b/uWZA2ftZc5OJmtJ/mzFJpf1Mi4KI3tydntbWH8VX8h?=
 =?us-ascii?Q?u+cJmNLS90dwDlgYI8fK3Q3FNOeTi8P12DgiGrEqIYRlvllzCG1ueitex93i?=
 =?us-ascii?Q?X3Yx+M4Y1YhE/RmLxd0FkByG?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c5e9d4-26ab-4451-881f-08d8df8d012f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:17.7649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhVS0QkUgFnbhFx1F9ohR3MG3iMYDWFdrwQjGVH5+u4EL/IsJP0K6yA3SqBIa2UjM5SRwWnvoqR8zM9lcCP+WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB6112
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the read-only 'fw_info' attribute which reports information
about the device's firmware in the following format:

a.b.c.d:e.f

Where:

a = Product number (e.g. 40 for IQS550)
b = Project number (e.g. 15)
c = Firmware revision (major)
d = Firmware revision (minor)
e = Customer-assigned exported file version (major)
f = Customer-assigned exported file version (minor)

As part of the corresponding rework to uses of 'bl_status', the
IQS5XX_BL_STATUS_RESET definition is dropped with 0 used in its
place instead.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 56 +++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 2a4e048f1400..f36d170e14b2 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -63,6 +63,7 @@
 #define IQS5XX_SYS_CFG1		0x058F
 #define IQS5XX_X_RES		0x066E
 #define IQS5XX_Y_RES		0x0670
+#define IQS5XX_EXP_FILE		0x0677
 #define IQS5XX_CHKSM		0x83C0
 #define IQS5XX_APP		0x8400
 #define IQS5XX_CSTM		0xBE00
@@ -86,22 +87,12 @@
 #define IQS5XX_BL_CMD_CRC	0x03
 #define IQS5XX_BL_BLK_LEN_MAX	64
 #define IQS5XX_BL_ID		0x0200
-#define IQS5XX_BL_STATUS_RESET	0x00
 #define IQS5XX_BL_STATUS_AVAIL	0xA5
 #define IQS5XX_BL_STATUS_NONE	0xEE
 #define IQS5XX_BL_CRC_PASS	0x00
 #define IQS5XX_BL_CRC_FAIL	0x01
 #define IQS5XX_BL_ATTEMPTS	3
 
-struct iqs5xx_private {
-	struct i2c_client *client;
-	struct input_dev *input;
-	struct gpio_desc *reset_gpio;
-	struct touchscreen_properties prop;
-	struct mutex lock;
-	u8 bl_status;
-};
-
 struct iqs5xx_dev_id_info {
 	__be16 prod_num;
 	__be16 proj_num;
@@ -133,6 +124,16 @@ struct iqs5xx_status {
 	struct iqs5xx_touch_data touch_data[IQS5XX_NUM_CONTACTS];
 } __packed;
 
+struct iqs5xx_private {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
+	struct touchscreen_properties prop;
+	struct mutex lock;
+	struct iqs5xx_dev_id_info dev_id_info;
+	u8 exp_file[2];
+};
+
 static int iqs5xx_read_burst(struct i2c_client *client,
 			     u16 reg, void *val, u16 len)
 {
@@ -445,7 +446,7 @@ static int iqs5xx_set_state(struct i2c_client *client, u8 state)
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
 	int error1, error2;
 
-	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_RESET)
+	if (!iqs5xx->dev_id_info.bl_status)
 		return 0;
 
 	mutex_lock(&iqs5xx->lock);
@@ -615,6 +616,11 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	error = iqs5xx_read_burst(client, IQS5XX_EXP_FILE,
+				  iqs5xx->exp_file, sizeof(iqs5xx->exp_file));
+	if (error)
+		return error;
+
 	error = iqs5xx_axis_init(client);
 	if (error)
 		return error;
@@ -638,7 +644,7 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	if (error)
 		return error;
 
-	iqs5xx->bl_status = dev_id_info->bl_status;
+	iqs5xx->dev_id_info = *dev_id_info;
 
 	/*
 	 * The following delay allows ATI to complete before the open and close
@@ -664,7 +670,7 @@ static irqreturn_t iqs5xx_irq(int irq, void *data)
 	 * RDY output during bootloader mode. If the device operates outside of
 	 * bootloader mode, the input device is guaranteed to be allocated.
 	 */
-	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_RESET)
+	if (!iqs5xx->dev_id_info.bl_status)
 		return IRQ_NONE;
 
 	error = iqs5xx_read_burst(client, IQS5XX_SYS_INFO0,
@@ -853,7 +859,7 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	int error, error_bl = 0;
 	u8 *pmap;
 
-	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
+	if (iqs5xx->dev_id_info.bl_status == IQS5XX_BL_STATUS_NONE)
 		return -EPERM;
 
 	pmap = kzalloc(IQS5XX_PMAP_LEN, GFP_KERNEL);
@@ -873,7 +879,7 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	 */
 	disable_irq(client->irq);
 
-	iqs5xx->bl_status = IQS5XX_BL_STATUS_RESET;
+	iqs5xx->dev_id_info.bl_status = 0;
 
 	error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_VER, 0);
 	if (error) {
@@ -906,7 +912,7 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 
 	error_bl = error;
 	error = iqs5xx_dev_init(client);
-	if (!error && iqs5xx->bl_status == IQS5XX_BL_STATUS_RESET)
+	if (!error && !iqs5xx->dev_id_info.bl_status)
 		error = -EINVAL;
 
 	enable_irq(client->irq);
@@ -966,10 +972,28 @@ static ssize_t fw_file_store(struct device *dev,
 	return count;
 }
 
+static ssize_t fw_info_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
+
+	if (!iqs5xx->dev_id_info.bl_status)
+		return -ENODATA;
+
+	return scnprintf(buf, PAGE_SIZE, "%u.%u.%u.%u:%u.%u\n",
+			 be16_to_cpu(iqs5xx->dev_id_info.prod_num),
+			 be16_to_cpu(iqs5xx->dev_id_info.proj_num),
+			 iqs5xx->dev_id_info.major_ver,
+			 iqs5xx->dev_id_info.minor_ver,
+			 iqs5xx->exp_file[0], iqs5xx->exp_file[1]);
+}
+
 static DEVICE_ATTR_WO(fw_file);
+static DEVICE_ATTR_RO(fw_info);
 
 static struct attribute *iqs5xx_attrs[] = {
 	&dev_attr_fw_file.attr,
+	&dev_attr_fw_info.attr,
 	NULL,
 };
 
-- 
2.17.1

