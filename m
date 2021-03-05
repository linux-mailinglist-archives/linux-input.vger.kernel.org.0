Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE1D32E06D
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCEEN0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:26 -0500
Received: from mail-bgr052100133092.outbound.protection.outlook.com ([52.100.133.92]:30274
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEEN0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg/dZiFF+98puiH35cGzLujcKXOvxq1oBzEjYerz2zrPTd/SiN8dOsRl3d0uToukA6hWIWmokQPXrZI4sEiQOTk930i0JmfxrSWcbytsNRsoVIYbVHX7fOq8iQ3BpCyCAwd11ng7L2c8PP/YfZT9cayY87qURB1BcBuQIk9ATyiVbQDFME6+3S2/Yo93TxTuEnHWujcLnP8QiDK0ceCQmCFazTtXmGxbup724/hELDN05gU3rD2XDlMIOS/CYrC5Gv38Fa6PTz5mGbwIaOg6Wf0GUCDQ1ppOJIP5oqoljEYIGT40uQnR6gGKjU9t9Gn1Ho36yYsc7EaixMbFCfdw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKp4kIfCiH8iW2z3YhoiABu/r3H+nf18znDksJIo3gI=;
 b=YMVAWWWh4l9RWS5i2DnUJ4bX2LXQjEzwb6sjR/oMgLfw5F/Cby/1APQ4GWJzbpJvHhPr6+BHsDOQ/7jm4UFy0O0ormhMQIivX2IuoeO1vvhh7oSau+3uv+b5e98TLohN5GvBBQowZYmbanB++kbk0OlG4utNQW3LstAPql3GmEcGoxnW80/IW2D9KPmBrYbQ8DqRkpjUaa4t9BSMggfI1cJxva7aJwEl1JcMKvJEgai0Zb7sdqQlkxGzC+ayAxJaQPAe1GUG/d4B6UkWIhpUuy9Bgi35qbIMreVhUoaxxWfVo10Wj5Wu0UAthx3yAXoeVeASfh3q9gavoBAmU0HGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKp4kIfCiH8iW2z3YhoiABu/r3H+nf18znDksJIo3gI=;
 b=zkPb9Jog5b1NyI+OT2yh1YLTocDIZTxIc0eX+zH0nrE+KGtG1vn/TL4QeYOoWud2fVsJ9gXDbQM0qdQPJtV8eXV/cHwbLsVnzSKtYOmZZ7ezJYsJ5OSZNjlGOOgi0meVYiB8yS2Q5m238fD8FIefwbYcHxftB5G7+3Ixj8CQbX8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5693.namprd08.prod.outlook.com (2603:10b6:805:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Mar
 2021 04:13:24 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:24 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 4/9] Input: iqs5xx - remove superfluous revision validation
Date:   Thu,  4 Mar 2021 22:12:31 -0600
Message-Id: <20210305041236.3489-5-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af26885d-96d2-4faf-911d-08d8df8d0553
X-MS-TrafficTypeDiagnostic: SN6PR08MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5693F4988F927BA53B9CC1AFD3969@SN6PR08MB5693.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wby8WSAzVrRverR8rljg08c0QsATiHVOF/trY+yri5FR/AFSO1FNQWJd4IkN61Ca/wO0Xm2SBqQ0VAVqxmML2QEvyEaWWVh39e/bNw2lHncKzGHf5p8YAShg7+9SoZLot2NJouNINWPXb7w291LKcXIMsqWOQ6o7BwXACO5EG2CNY6FOhkZdimiewr+VSIJEvH3CZzCcpzDZxF1yUX74BAtgVKaxhhAzCpD4s4BoVB8IIESoRnOPmz5TjIqza11Y3Ghy0UR8uvnPVT+R4I6VpsCIdUSPDOneabOvI9AUjyYP2lSRpwKjOmyYum03X3/QyWPR/H1MMMWKmrY31lEBbBvLNByGjHfT3vqel4icFIjlsLBOJVrpJco6MBJt/NxfObcf4n7/Cq+GwAaeWU9tSu9F6bNTNDtOgJBh5Q8JQ5q+/1g+WKJTwd4hKNbjnKjoK4RtU0vzJ44z62Ak353vxZkEElRp/fiJI/Xrju7zsuyU8LUCA2HJ4xcgYRCPuSr3+MQofRgintZlknGi1j56U7uUw5Ay71eD85Y/6HQKvjvq2SJu3LWNFg2Aci8/s1UMBH3kp9hE77+00b9na4uih8wn9SgcHsLlBPf0Xmzusze5iBthucTnFqAhfXe3oG/MFmms782L3TU7nGn4PrUfypBBRXIKmbEfQbUVkmNo+hLjRG0V/pengvHbL/K6Vw1ARFvsNTCOK+wFjaZ5KoRMgR13BUyynC2uFUPxw95z1IAdDgoOKrMRXR9FqMGL4UqvnivbiG0O5shXwF/ImBWOLZJcswCX2tJHMbWdTdOhf3ZMGKJ1HvSIPr9DhVWNoTnXgQ+l3TYuk2rntIkmtzc/WzlsMYYM52TA9Jh0bK07mb0RZz6GQHPdZEKllsbMZY9KsbfNR+FzLKH8PCCHYpP/F0BTlKg99xyJF7JampzqDKHbw0/x0juZp2VHEi2Sen+w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(366004)(136003)(376002)(346002)(39830400003)(16526019)(66476007)(8936002)(956004)(5660300002)(478600001)(36756003)(2616005)(107886003)(6486002)(8676002)(66946007)(69590400012)(52116002)(186003)(26005)(66556008)(6666004)(6512007)(83380400001)(86362001)(4326008)(2906002)(6506007)(1076003)(316002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bv9n3jbYxm8QFB+iFxLFkPJVPS+VJZYBcyYfrdv02tJcin8BsQq1vcgkUZTp?=
 =?us-ascii?Q?QT53qU/hDlembX6QHNy3chy5FMMfhsAdV/7sS6BDzjmXxgj+U+1LVWqWrGzo?=
 =?us-ascii?Q?59KPfRbB2oyX6DC9nnI2lQPTUTXqtG4CDt8gd1XNonrNNmEy+2X8hr2+ImyX?=
 =?us-ascii?Q?xdh8kfuxoxF9eEMJap1mveZ7HNdbpCwhjzrlgyps86d/qN44vJBGk7ALsEdY?=
 =?us-ascii?Q?BHsR1bVZnopAgfihmpaMDzjebXOLv7wnCjN/AdVh2yvymhYTdz6Yc28u+jE5?=
 =?us-ascii?Q?b0aDaXvOL0135qLiFSpx0QrT9WO6Uh8y5BjAR/3LCHfsK3l0iop/GZbvF61o?=
 =?us-ascii?Q?tux2IZIc/ZoRJSX4EpuTTKvNFBqwW3QUFbvzl1671hIw0hRP3GLP53HaqyWN?=
 =?us-ascii?Q?UGb39KVFHr23DTF6f6ztG+7LtH3RKXLV2f7Gzs/nwQM2+dLLZF8U1my+AD8c?=
 =?us-ascii?Q?CWFCCdO8Al7Ig+SesTl7fw9l2rFk2ZT8eyJE9yGSn8jNfz33ey84NbaY+vL0?=
 =?us-ascii?Q?V6s0u81z+T10y32vD/f1ZFxVHJvGn7nTnMCosZy7Ccbw7rh9TCc3wppjbqde?=
 =?us-ascii?Q?SXyA4ljOXxI5nvDDDahzaLe+glTNWrm8FjMoFIsBfrg4vths6238oPUFPcXA?=
 =?us-ascii?Q?SQ+qHXg2mHRFsOJ+aW3tCEw51POfyU4uUNAytzTliyIzcvSkLGluoBOMHRhu?=
 =?us-ascii?Q?hSsWNA0/qpCfDyfVvOHIgiZVoiLnxWg5a8h8Vht5x5yf3s8pZHyfyxF+2O0l?=
 =?us-ascii?Q?CQq+E21+ZudDCQoKAp82V/2dRbJ13pD4z2HQfFGug+V7+kaBheFjdCEDOzEt?=
 =?us-ascii?Q?hmyy8glGXRNdCtf7hl0p/YHRLXbIt1DlsoGwCNihh/krxvaxvS224lWHqtym?=
 =?us-ascii?Q?RpW+OUu72WL4U1g7gFqlhLY5vE86zIgzf0WobgyVe9v1yxhaB2vdsCVStsrR?=
 =?us-ascii?Q?qI+0rW2xn81t4n8TrXP2vGbtpFuuK58cUVZ6kP8H/ObjGYmcE8YgjxUeO2cT?=
 =?us-ascii?Q?sO0kaaz7bwBKBeVAvUl6WwnCbU8mwUXqaAmRLIeWYXZ6hxGqqpLTzldE/iPN?=
 =?us-ascii?Q?AxZZR31A5zPQtX0QOJ4wBC+KcEgBV/kfIPLjJ/JKwriNkU1xQCFPt9N0DALu?=
 =?us-ascii?Q?f+EeJtR9hSrx+qI2YGf+3ZBQy9th7zo/9uz4I2gSVCZClq/sbNQxG/kJAxP0?=
 =?us-ascii?Q?MeVegCIWyvnoEy9h5kY9p1Gu5/XVLvF/JsdL9S2056wjR4UgUxiqiT2QU3VF?=
 =?us-ascii?Q?Ss4rbGNwGx0mIQ67JIn7BxLX4B4Ew+XXMqlUskfx+iNJeemSmKh3FvCujPnk?=
 =?us-ascii?Q?fpw5bVg6hQo2sfk8n3moe6cP?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af26885d-96d2-4faf-911d-08d8df8d0553
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:24.7289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oyHCeZr8UpRO8C0Vpy88Q298a9VAM9dVJYHtISzdCJitsdaQxUEjuLTFxKWtf9473UxG5oYHc+TBXeB32uStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5693
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor-assigned firmware project number is restricted to the
generic project number (15); however the vendor may assign other
project numbers to specific applications and customers.

These custom project numbers may be based on forwards-compatible
firmware revision 1.x. However, the driver unnecessarily rejects
anything older than firmware revision 2.0.

To support other applications, remove these unnecessarily strict
checks and enter the bootloader only for truly incompatible A000
devices.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 40 ++++++------------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index f36d170e14b2..0920516124c7 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -36,9 +36,6 @@
 #define IQS5XX_PROD_NUM_IQS550	40
 #define IQS5XX_PROD_NUM_IQS572	58
 #define IQS5XX_PROD_NUM_IQS525	52
-#define IQS5XX_PROJ_NUM_A000	0
-#define IQS5XX_PROJ_NUM_B000	15
-#define IQS5XX_MAJOR_VER_MIN	2
 
 #define IQS5XX_SHOW_RESET	BIT(7)
 #define IQS5XX_ACK_RESET	BIT(7)
@@ -87,7 +84,6 @@
 #define IQS5XX_BL_CMD_CRC	0x03
 #define IQS5XX_BL_BLK_LEN_MAX	64
 #define IQS5XX_BL_ID		0x0200
-#define IQS5XX_BL_STATUS_AVAIL	0xA5
 #define IQS5XX_BL_STATUS_NONE	0xEE
 #define IQS5XX_BL_CRC_PASS	0x00
 #define IQS5XX_BL_CRC_FAIL	0x01
@@ -573,7 +569,7 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	 * the missing zero is prepended).
 	 */
 	buf[0] = 0;
-	dev_id_info = (struct iqs5xx_dev_id_info *)&buf[(buf[1] > 0) ? 0 : 1];
+	dev_id_info = (struct iqs5xx_dev_id_info *)&buf[buf[1] ? 0 : 1];
 
 	switch (be16_to_cpu(dev_id_info->prod_num)) {
 	case IQS5XX_PROD_NUM_IQS550:
@@ -586,36 +582,16 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	switch (be16_to_cpu(dev_id_info->proj_num)) {
-	case IQS5XX_PROJ_NUM_A000:
-		dev_err(&client->dev, "Unsupported project number: %u\n",
-			be16_to_cpu(dev_id_info->proj_num));
-		return iqs5xx_bl_open(client);
-	case IQS5XX_PROJ_NUM_B000:
-		break;
-	default:
-		dev_err(&client->dev, "Unrecognized project number: %u\n",
-			be16_to_cpu(dev_id_info->proj_num));
-		return -EINVAL;
-	}
-
-	if (dev_id_info->major_ver < IQS5XX_MAJOR_VER_MIN) {
-		dev_err(&client->dev, "Unsupported major version: %u\n",
-			dev_id_info->major_ver);
+	/*
+	 * With the product number recognized yet shifted by one byte, open the
+	 * bootloader and wait for user space to convert the A000 device into a
+	 * B000 device via new firmware.
+	 */
+	if (buf[1]) {
+		dev_err(&client->dev, "Opening bootloader for A000 device\n");
 		return iqs5xx_bl_open(client);
 	}
 
-	switch (dev_id_info->bl_status) {
-	case IQS5XX_BL_STATUS_AVAIL:
-	case IQS5XX_BL_STATUS_NONE:
-		break;
-	default:
-		dev_err(&client->dev,
-			"Unrecognized bootloader status: 0x%02X\n",
-			dev_id_info->bl_status);
-		return -EINVAL;
-	}
-
 	error = iqs5xx_read_burst(client, IQS5XX_EXP_FILE,
 				  iqs5xx->exp_file, sizeof(iqs5xx->exp_file));
 	if (error)
-- 
2.17.1

