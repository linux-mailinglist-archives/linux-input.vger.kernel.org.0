Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB7C2FABC2
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390080AbhARUrA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:47:00 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67]:64404
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394283AbhARUp6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:45:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2tlLl7/vhUoSt2KYWT1d9XovfghOgUvEnoYNXTNavs4YegLCqLqOgVHrIRyP3BSuEOKK1/QEfmlgBQQj0D7IOZTpgU0l9ZKwzkgeQdgaTL8ow+62Fi9k4f6LuOgAo95emlUVoqx+Gwm7Ud6I4zVz+HOpLOBQzqVp3Ey3bPSUUaplz/f8iEoebisHy8lyf+tJ0W3aKwlkWK7yHqHWuyHz0iCn5GUpiA+wLDkD0JehWaPx5ZN2wK3XzpmTNdE/fB8BLhP4AUzp/s7XW7tqph9gEkUFPV3cfQScoPNcvca7lNOM8+OMxrRpmqIm0MPhJhxEEoi3j1NliXvcZv6puoSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faJchSHOgwqpo/+zc0XigYXJZBc/BVdBLocNSyIDUM4=;
 b=EADcJIwaE+gMr9lvShlBDWgDkCzrpDXJVYiBulzPYDXYTJQxEOzLJVK9EIvtpGncko1NA9HemhTI2EEDpe0iuHrOL/oOFhM1H9yYz1NGsHgFBmiAO9cQslMfNuaMrpiZjwmpbnnCbYh+VID+BKpa/w9jF/CpaczOxqBtefoVjDQEC2uz2WZQ4sewvejEuhkkY/dHypPrzLlhFCaFr2DrqcQnqe9sLyWVfp9wbbbGEjJazxNt1/y3F14wlFU0iGTBLmnxOWHGbG4cnQPRPpSiOKyn7zDr02WkIlN5az9byDe83j/JFQbU9Rg8XIlZo+ml0OcurszppB6erNOj+tfSzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faJchSHOgwqpo/+zc0XigYXJZBc/BVdBLocNSyIDUM4=;
 b=tGbM691eZBUtHLPDRTdKAWnrmm/xGOsHWkPymk9R3qIUg6VgFnq33IEZTv98YX4PTn4FXozMrwVFjZVcm/CfRsU+VwHmtqWHyGGFeHSpfX+ZK2XmZ1tXKtEuRSauWKaBl1kanJMG5e+dUqi5daHrdsvIcJe5aMTcZjorGMqvd6M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:26 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:26 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 04/10] input: iqs5xx: Expose firmware revision to user space
Date:   Mon, 18 Jan 2021 14:43:40 -0600
Message-Id: <1611002626-5889-5-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611002626-5889-1-git-send-email-jeff@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN4PR0501CA0137.namprd05.prod.outlook.com
 (2603:10b6:803:2c::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bfb8b5c-7407-450b-8554-08d8bbf1d876
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4846FDF9A59CE25196E441D2D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuBmpdzvTAPoGbAnPCO8jK4ESWOLAwhoCPdRztGF0OYGZeEYCtek/DsSMNh1mOcBcv3EarUN9OwJ+So9RKSnnNm4DNmWihemx4FD5zPLa+zPxoEFyVd7Ony2wgndc6T5T6KprkuYPIcQRqz78vt9gdd1GqlHYnhYWw2EUJ0PdAt4FTBepZUzQV0hIv8+OI1wIueg7odAer+/Xo3E4prIbwmoYwrsAdDoDoqDSSx1zlRzddsC6KeVKV6fTUYISug7RCdCf3hf0uH6y+UezcM1r1YBuO/hLxmkrsXC9kGmn7x17OMNcdVilFE7W9G7w4ZGe5sIyBvlxm315IQeusoiQRmZvQnuuMhDAyA0FQwmRUyqaxrLIiUkNzWPqnVtybnfHm9UMdg8b5LcGSFz0MEB+5msPsEmDYEc9R6ltc4LoxXeVSeiMxqgqLZi5MPfv4d26H1aaggS49eIVInJ430Buw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EnIq6cpC1f64XThWSgwPj+yloZ36cJTkGFmiCXNBYP61D3Vo0Y0xd+gCuRh/?=
 =?us-ascii?Q?d6mNGbI6JLDRD6foTcgR2xLsSVx3J6+qYBrInD9AqhmrVbnu/OBaarmFRDiM?=
 =?us-ascii?Q?CaUyIVsPmOsU8J8iEaQIWJAzAu3pKs8A5GbZu9nIoLG+zIboyQ1oc964PqQR?=
 =?us-ascii?Q?5HXt79kyYaB7/A5lFtU61FDfbrXWLhCh7a8eg+RgqpNRwwz53sZIcS7+JIc/?=
 =?us-ascii?Q?1iJGtP/MgijMIBjREo4WrQa8SoTLKpN6WyTtPnHtlho93IJXR/9F+OM6W047?=
 =?us-ascii?Q?THimnFdoOZ1qrEo7+3NL3GQpfcdD7VTCONnW0b1FQawvMU7LeJBvPtSKIz/h?=
 =?us-ascii?Q?pKLsDYVF6NlEPV+XNU4QLUAMt3S7Q6aO6yA2ZmqMYGDHO20SL7/XLx5VYz3f?=
 =?us-ascii?Q?9r6TglMcNWcMFhaO4YFz/B1cR+YEYAEJRbmTu5NkQAqGf6EIjmGwz434n0Bh?=
 =?us-ascii?Q?0i/3T3RBFue+da6aiC3XoYquDNJ/lXiRQ5PuWNNZmAb0rIz5O/DAVRki7CPe?=
 =?us-ascii?Q?41zFiHiZ4FFJ6zGXJvY2ebYPersxG8JZMt4snj3sXUn3hxfjUKf2bqQ10e0q?=
 =?us-ascii?Q?XWCyG1XKaYIkyZdgPy39NEVoFXUKX9kirwijn2WeQymzlwNQBiJ7AYlEHdRq?=
 =?us-ascii?Q?eEFqzGQHGQDN6qM6OPLlwlOYLoimyQLp3PsV/3qRUzUbvbc0DF4Ud+JjSOeo?=
 =?us-ascii?Q?hrm5u/4N4En2NN+6ex3ylKrFB2wQDEtSsPXjauiCljNJFpzS7U5hyCYySYUG?=
 =?us-ascii?Q?JZ3TSG0Dp6CYCoMj03wowVbrCa3atUPqsDsFVsvPm1yoHtQRyQe74zklRMT9?=
 =?us-ascii?Q?EbYOLac3TZkCf3NY9+/lJqdU5RAh9oxg78RfMx1X51ntmXKtrIhkD8vwjSEM?=
 =?us-ascii?Q?xqvkOLHXTsV3b305b/mSP/IjzPmM76ZhlMePrYrlc2cgSsCojxLJhxHR5fq3?=
 =?us-ascii?Q?l+/9eGKPSC8ZVetgeYUwf/kbtozBXLGIFdPDkVvRS8KkPCvRBwW+ZTL7slsK?=
 =?us-ascii?Q?6+Ln?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfb8b5c-7407-450b-8554-08d8bbf1d876
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:26.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hAVoV9sfpHbLyS8QBMp56DmzaLfj8dkQ+N7kWDNqolTgcJ7p4HfbZx/PzCyIFbpzDM0UQ8OlZC2U4tPXqknvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device's firmware accommodates a revision field that customers
can assign when firmware is exported from the vendor's development
tool. Having the ability to read this field from user space can be
useful during development.

As such, promote the fw_file attribute from W/O to R/W. Writing to
the attribute pushes firmware to the device as normal, but reading
from it will now return the customer-assigned revision field as an
unsigned integer (e.g. 256 = 1.0, 257 = 1.1 and so on).

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index b2de8c67..5ee22ab 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -64,6 +64,7 @@
 #define IQS5XX_XY_CFG0		0x0669
 #define IQS5XX_X_RES		0x066E
 #define IQS5XX_Y_RES		0x0670
+#define IQS5XX_EXP_FILE		0x0677
 #define IQS5XX_CHKSM		0x83C0
 #define IQS5XX_APP		0x8400
 #define IQS5XX_CSTM		0xBE00
@@ -99,6 +100,7 @@ struct iqs5xx_private {
 	struct input_dev *input;
 	struct gpio_desc *reset_gpio;
 	struct mutex lock;
+	u16 exp_file;
 	u8 bl_status;
 };
 
@@ -666,6 +668,10 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	error = iqs5xx_read_word(client, IQS5XX_EXP_FILE, &iqs5xx->exp_file);
+	if (error)
+		return error;
+
 	error = iqs5xx_axis_init(client);
 	if (error)
 		return error;
@@ -1004,7 +1010,15 @@ static ssize_t fw_file_store(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR_WO(fw_file);
+static ssize_t fw_file_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", iqs5xx->exp_file);
+}
+
+static DEVICE_ATTR_RW(fw_file);
 
 static struct attribute *iqs5xx_attrs[] = {
 	&dev_attr_fw_file.attr,
-- 
2.7.4

