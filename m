Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE3D2FABCE
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394283AbhARUrG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:47:06 -0500
Received: from mail-mw2nam12on2082.outbound.protection.outlook.com ([40.107.244.82]:41600
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394332AbhARUp5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:45:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjjaLQxPPe4Zg7RqMbE6H+sB+evHd8zoc/Pj+FX0/3kQSojZsum2CBgdJUQA8RXztylHchaWBKwfnn+DhPeK8KXvhHCoen7AZ5a7zEceHKm0lw3AcP0txQhY7Fc3JOpVgXLj9PR2x5kauQ+FyAsRKtMQhNnmSbYz0pzs2xsVBTbby69TupdeISCgbFhH5C9MlIz1OEW3Z4Zli1jOqTOIRsfIDo9qNQ5wbk+y8AjXJCVu9vp9HQzfW5kcHatBX4W69gzTwpsOgljC5Ds6mJX25ADsx7D+ieKWP0tPLCadnJ9i923Hl6M0bKPAVg1HqMdlHNGxX7u17r008ge3jZvidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGHAMRWkUrPKcrmiCFU5zMqZS0nnqTcyN8A732J/qdw=;
 b=MDBX8Wh1W8cy5xuHzvTTZyLzMV3rTlhL9O6MAAEzBc/bBJ3hMGpMi0A2M7F07uYzqIBAxJ0Z29e7Vw0srAKjiBrhHMFELGcIyvNiJ60Ci5MzfpfXFfaJgtwWpn1VzUfdKxgEUPqYzesEoqyHB/SiP8yVKLOHpUNsuAF/1HEIDnJ6epY/acXGh0Gyw4+imZq1uRzCK+Nuw/ImfU+n2p86psrnwXs0ZfyaRk1UOmo+upO63lzlMETDovnAImQlguhs++RhdKvngxqCHQFqFoLKVQeRmku7YeSfC1qWMn+H1v3crDzqFEe7LAQYXasEUccz86ZPD9ScnqVX1lI7fweJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGHAMRWkUrPKcrmiCFU5zMqZS0nnqTcyN8A732J/qdw=;
 b=gahTXvCz4LRUXN2noU+3K0CE+5R7rlQ7nC75YTF2Zui5FnPYI692y2XrYsmePpihmfZEkLbkCHmkitkyZ3mt2KDfHzAY9AVobF2npLskuFrNuAL3v5uFWrIjgo4FjA3chD1KTjH7tKz4OySjEoeJEjEwpGw9/IkaJtu2MRUZRcE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:14 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:14 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 02/10] input: iqs5xx: Preserve bootloader errors
Date:   Mon, 18 Jan 2021 14:43:38 -0600
Message-Id: <1611002626-5889-3-git-send-email-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6035ea82-cfdd-4de6-a952-08d8bbf1d0dd
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4846AAA60DCAFB65816CDA34D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWukdIoYZIL9NT6HSl5NyfebBiuP3W0InFASJeHsPPlfFxr3ZjEbirYUYkpYRoLrgmakfGJLfwN2fLBEPNxiF9NeDqDDKRfrNoGnpdyEHW8F22vrfOR4G5IrPktFF9i+TQJU7nxCgtHNvrzJV5ruPrV/vT0kmmSsQt59DOuU7j53mflIh8GvCOmENbYpKy9ttPAYhOu+d3t4lYJWWCNiwmMrO1yivqkPLQ99UMATvHMoz9sRXf5mySVA9iHdwzUFv5BtmWhdmU2DqpC7arME5sUwsojfp4yLm4kia/O17vpLuU2YOhR+eYcqXHcjaeR37mIasPXr3fG+OLJ4rbNtLsuK38KHjQSfM4CC4Ef9IGeWXiRz47PTlG1LU914RhbcAiCqDUiFv7vQgbGKXxI/jrhS919TJzwiWHbvfe2cyg5RGpuKDjsFfrkLYoGy+/h9FA0V7YRemIUHovI6S7+B4t7luHmooZhemroSX4b6q6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RlTDzlmg0/KojfpAYYuGwR+YRKut5np579zwMRRbVmuERm+NkbUJK6HI27q9?=
 =?us-ascii?Q?Mpdfm7A8FyPM6o8oOZdzvFfGr6Uy5vFTDFbxqDYolHt5SAXlxZI4YLjk+b4x?=
 =?us-ascii?Q?lUUtvoYkAFzgeg81quXl9i7kAr6Snhs6HbC8OAco/v20ezMh/yRxVhjQ28LC?=
 =?us-ascii?Q?nQNffj2CulbV3M9qSC8Lx0Epk6U7Y7KJS3lq+HimjZ0zjHlGszrsca+siuhq?=
 =?us-ascii?Q?k6tV572uIBnhvRNKlunu7Duirn51Upjy3e7xrqYipXaZNKGkqrsuK7rRPH7M?=
 =?us-ascii?Q?Jz2ysjzFQ5PqfHyjqEoyU9QdExQpmhx56ucfZMx09wqgHSgZhd0YNZs9P3Kf?=
 =?us-ascii?Q?FmG9SDcnzw8DTAX3JFKVYSVjgPyKVF65Tq/kzf5xcWEwH5ouNT2MzUVOx5AQ?=
 =?us-ascii?Q?/I3+m2aqqOYWhqtpAYcYgOwJsKPNpiIsYU0eRhM7w0hX1ysbqrR9fjlb0HTF?=
 =?us-ascii?Q?S+QUF0A2swSaQOS7U3K9/li2Jr9tUechR/8U3YBc+osHo3iiNsRhanTUuJld?=
 =?us-ascii?Q?szCJbSfTMvctHMPQIjakh8Xz3WT9fatD5p9a9orjCdR0z8iwyn04W8XOAqsN?=
 =?us-ascii?Q?UT2LXJ1YpLhe5LRKR5pLNwIP1mS+ZztutfWrXddgjqGA55NTthg3ghORh3aR?=
 =?us-ascii?Q?/ogqqRY4NCi5gAz5LSPLaqZ0tq/t8hm2GSyy+dneYRrZpE/7LAZuBDKnhzzK?=
 =?us-ascii?Q?oMOAFF+lPGLEF4M8U5E9wxHwrX1qamrmzXCtJiu2hxvIH7R9sLKuX6PlP2Rd?=
 =?us-ascii?Q?HVAeuQ18LRbNqhi1X41hXxR2TdBFMeI+3kbTw3BZg2c0AITxrSBOdSXTG7kG?=
 =?us-ascii?Q?7PiHlzH3Tr8L+AuOwBzftaZiOI73dPy4/1CMBzEv/+wOsnszsMpcpP9yYAZw?=
 =?us-ascii?Q?oBXoD0Y9mFefoTiM8Cac7eY7tm8pDyVa738mRllJ3cYyDQSVtBUdKvxtJTGm?=
 =?us-ascii?Q?4ZjokFOhYuxZ902tgWyqFRDKi185Jcun8L0Xp0XtXPMu9etlEy488nJPVnKx?=
 =?us-ascii?Q?z0by?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6035ea82-cfdd-4de6-a952-08d8bbf1d0dd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:13.9738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKdYeSpPl+2vFjwi/rBvNmlYZyMd9mZ4wCGQpmvs74/h3I+9d+LHBRYSqNcmyQ2BMC8zjJoFcgB7JAALcVpf8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After user space writes the fw_file attribute to push new firmware
to the device, the driver calls iqs5xx_dev_init() to re-initialize
the device with the updated firmware or recover the device in case
the update failed.

In the case of the latter, however, iqs5xx_fw_file_write() returns
zero (success) so long as iqs5xx_dev_init() does not fail, and any
error encountered during the update process is lost. Solve this by
saving the error before calling iqs5xx_dev_init().

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 08e79d6..ff0a0e9 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -883,7 +883,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	int error;
+	int error, error_bl;
 	u8 *pmap;
 
 	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
@@ -937,6 +937,7 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 		usleep_range(10000, 10100);
 	}
 
+	error_bl = error;
 	error = iqs5xx_dev_init(client);
 	if (!error && iqs5xx->bl_status == IQS5XX_BL_STATUS_RESET)
 		error = -EINVAL;
@@ -948,6 +949,9 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 err_kfree:
 	kfree(pmap);
 
+	if (error_bl)
+		return error_bl;
+
 	return error;
 }
 
-- 
2.7.4

