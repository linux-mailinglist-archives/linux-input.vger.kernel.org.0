Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF90933A037
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhCMTNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:13:23 -0500
Received: from mail-bn7nam10hn2220.outbound.protection.outlook.com ([52.100.155.220]:64224
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234071AbhCMTNW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBmiV9StruHtDmojeVlEHCAaZLUkjodznbIbX63ivXO97xUGjI+DpGtoIRXgFSYv8S4jTptbg8s9LyFKGVub9KcN/aZWyaF53r2jJJvjrjriqo1Uy5ghWF1UiR7oP5hLfkIWZjxWwMJhAXSx2VzbfkboFfF55k3C1RspUsg/6A4dIFTQzXwilhn3ShunRIotTb3HYziDWdQJanFq1IzdSzIx48e8JcuJ4Yt9WnklOQ2sR7CYPZ6C7u8yB2F//0sx6leJ2d7Pny2rLQgJHe3D4oZtLW1xW04D/aZk0oDxfhJtlP7ZevGsDvpRMDteU0ZILXNN1e9xPOyFM9XW71IObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6rj4drnRImOCTV42qKR2NzhRAzsv/xaVdEwH9wqCaY=;
 b=j/AVCqSSPsbY/R+vg884RMPiQkJkm9r4M6+krCXq3hkkc+9aMU27Weye/BKtu8hczdorSiXn1ciQoSZJXaVhUXjolg3A1x5V/kPynK4a5UbFxA0VTJ+KyU13BbQs69rpHAb81kOYpNqZiwFAKZz+ugnUnlf97Qb1xpBt44jLVk0XZanSwXl69flkOcf3iCWo4JRUPpdKJk/bs5RSXho0B+zCc1/CfaEOWhUHL1L6u49oaEGp1k+KZOgBDF+SoDMAqCN3Zmgi9t3isNs6shQC+WH3UkgY4Ro844DtG/YnW5wUaT1AUIjjWjnv80sa5XrGgDy8kSFrJWojZUKmaWc7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6rj4drnRImOCTV42qKR2NzhRAzsv/xaVdEwH9wqCaY=;
 b=KZrdJTeIShX/8Rr24XjRugTSCMl6Z3peCTCU7NdwMFDj9oMeF32dS+upDQoB2VPWkIzkbzYL2FZ3sT//0lCE7kk0xcWN+IZpdDrQ1jvIElVUyC7GmBBYGFL1H3fTln5HMX9/RVTTnP4/CAABPahiwjtDAAk3Jo0tE8dJOp2Pwno=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:20 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:20 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 3/9] Input: iqs5xx - expose firmware revision to user space
Date:   Sat, 13 Mar 2021 13:12:30 -0600
Message-Id: <20210313191236.4366-4-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ee76b3b-d437-4279-bcbb-08d8e65410b9
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56940CE3676C1810A04FCA2CD36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nKrn3nR7aZM/s2xcvv5+gIo+7GqxM12JvwoEMr0DOUcC6FAFp7JdOap2YOzo?=
 =?us-ascii?Q?3a4g0AeFxspGDy5wudDQWEPWLXGnF60V1qxBoQAQZOeJvYJIjDMOTp7fcIA9?=
 =?us-ascii?Q?tw3EtBeO4h4u37xFKhvFkQX5waMYGOi8+cfRTNziICDYxtaiPW1c7PBWpeYf?=
 =?us-ascii?Q?9CC/lmDbF1KT/HL6UqoUiyZi9SaA3Gj7mTrx4gNYyjaQsIyxqARvpc4TPInD?=
 =?us-ascii?Q?sydCZJzDHzo3cimQcN8iZwF6RSBSPpAWfXb8742N2/hmEWQqHg3Jydxz1tw0?=
 =?us-ascii?Q?ZzgIxXFxuFM0I8EXqTZjchIgD/OKUhx8lkak4BRddNS6ckLrPuJV10+UdbJd?=
 =?us-ascii?Q?/hFlArGCGxrsnACS4o6THgd/C0ztiaJRx5RqtWl5hiw86eSD5BdQTBlzl5tS?=
 =?us-ascii?Q?0eRqjDtTG3dEgfOlpjHSPC0zfS3TWe0tjrlzt/d8ufwriobYcPAVH+E3c8yq?=
 =?us-ascii?Q?108da/q05EnraaBKTfu/Sv5ZtPurGWrs/w5TLFeNj8Yxsvm4SWbfyIUUZWKC?=
 =?us-ascii?Q?Ri4sWVX21+FjMZLTYOcLXO82OVrFS+NV1zxlQMgOJKTrhNWapaBqzo0qnEJW?=
 =?us-ascii?Q?oYQNJ/T5fN3tp1fxQ/aRDU5tFnA9Vt57xiUlEmlZTPMtqv7Rxys2RgC/4C7Y?=
 =?us-ascii?Q?PzJFlZNSUaAZ+IlXFhp3r50qGn3YuWM3JolWsWVJ2kuUQt9Rj1WyCESKbA7S?=
 =?us-ascii?Q?vkUzQZRifhyOfdf5Ud7WjDFysB5fSiRGookuzMyXf3AZe2lLAim8/Ja/Njzl?=
 =?us-ascii?Q?LQPflZRs/PmAnU0+sC8TXPv4dz0rBKXTdcfcNFzcFMsw+FUXKbZlMSqKLXib?=
 =?us-ascii?Q?zlxwvciGJe4GfnWFhh9WcoaOEIBjEgIrFag3sPfRrh0y3+2yHZGS64GgMYXB?=
 =?us-ascii?Q?YRBWwTL0kK8noVXds7h+2pkfqtX3siKaVw7yneutRhqf6ZydcROV/5gmAviw?=
 =?us-ascii?Q?IW8hYPw3Jp80tXd30Uuvvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9v6RmBYl7p6Nbe0uyP9Z4v/nQpGW0MgK+urgJssvM7FbnmGenmDQzrh1VZjY?=
 =?us-ascii?Q?16XoNeiVHogi2wmXvLdbe33rJFfA5qP1KkUP+HGxdmuDkMHc1/6Fkdje5Hnp?=
 =?us-ascii?Q?DbDXx60HSDswxFXQemb1ycJ26dbjEclkc/n/eC+BimfhKITU/lPQV4CI03GP?=
 =?us-ascii?Q?gtghSgKbp/YKtHMVFalPnWMA4rUUzssfPWmY7MKMfcDvqQQ3mHIfhtAr5VIa?=
 =?us-ascii?Q?gocswg063ZG7V0CPrjsApNRh+dZ1s45T1QUW3+PxZwHnHPC+ni/eNSl3Sv1l?=
 =?us-ascii?Q?6pJiT61wZETI6axX9/QGspIeni6UAB3VadcsF/blgykL1QPajdY03TEEdaoN?=
 =?us-ascii?Q?/uNRsHoPf69sSc/j7WGRk+dEzD0oycvVyHs47qpdTzyKQ5OWwQK4P/oTU/2a?=
 =?us-ascii?Q?g0hYlFgYR6yplRtNtZz5phJWP9Xw6AK1gVgqzV8uhoiVPEBs/tm/w/xzN/ni?=
 =?us-ascii?Q?bTVTJkAHw+flIoI0IlfZZFbR9Gqc715rYWgwx6hqaTu06V2LGbbcB/D4UlAu?=
 =?us-ascii?Q?WKoz+sRcCudtmyWzTADxyYY6Rym2dlMwPMgWHmpDdf+nVHwUOBdiByHhbyOi?=
 =?us-ascii?Q?8RTYqhNlQdMn5BqmgMQ3Vx9PKkLXn0sGSL8nFVMA8SQHapSK+Nxk2KqDjaiL?=
 =?us-ascii?Q?Tjaz8WHf0h8OIATE3O4gYo946JmU96GwouIveVOsDmBmTshbUWDDD+PEJlhe?=
 =?us-ascii?Q?K3WP2nViin9nG+c7s7pzR2PadI8Bwi1tgALzIWcr+kpLrOSQPEVr4CAebGSF?=
 =?us-ascii?Q?Th1QIvZC4pwQBc14hBII60NdLJ4z61LiU7mPzTvUGRYCDTpN/CVaX8WPSYUl?=
 =?us-ascii?Q?9mcoMWZH+38CwPQqAbXHod8mSAh3lmNlTWpfE3+AdNfcYl/brgnFZ0X7wt8H?=
 =?us-ascii?Q?1GrKo4bd6JSEkj/5NnB53h35+m3Ur7ps8lrAgLOlljCl1VOaVCDb6un5Alnc?=
 =?us-ascii?Q?QkmsqZs6x5pcg2UtKrqOmh0jvSfblaSXBiTm4iMxhotKqV/2it22ksuS400N?=
 =?us-ascii?Q?JzLJmYyUiwTiP6iwDmbKalE5DqbvekNu5aZXkvTZ8Kt344ODEkCr3jHvLLeF?=
 =?us-ascii?Q?8LgCk6XpCIgyBQ5eJ+71HNWWVjWsfnonw2l6dvg98vtUXE16qpZOAxgujqMT?=
 =?us-ascii?Q?bBATN3+Est8w0KXnwlGPH1JCz/vOe8fAxM5y6eZ8a3O8m34ghYMCj+egKLS8?=
 =?us-ascii?Q?DX5RWSEr9HWHbxjPG9W6FXEnw0MFgUNroSJZ7n9tT+2XIbRlyJw3YRNbwXQF?=
 =?us-ascii?Q?NsOIQMb25wf7zUFOer0REuDd7/AOJhfSWvCRKjxrruXdNkC9unS+s4vLAP+J?=
 =?us-ascii?Q?vM3UMiFK5ZM6nkleCYNG8UTM?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee76b3b-d437-4279-bcbb-08d8e65410b9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:20.6483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab/u3E3nIiHmUb93Xj6cyC+Nv8k5zIoBCpEsqQ8nWR5jD5w8T6iDZu4rDHuE2RWAQILZw5Sh9j05NQI+aokuRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
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
Changes in v2:
 - None

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

