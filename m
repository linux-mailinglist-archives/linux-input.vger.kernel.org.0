Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE5632E06E
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhCEENf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:35 -0500
Received: from mail-bgr052100132053.outbound.protection.outlook.com ([52.100.132.53]:24225
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyL53t5WX2LQgqTk2tA6xAErnlIsO9N0ShjagHiDw0Y6VIOU+Zrus+FYyzTw4XrHz6p97vd9dgZaiL4l4Oq99L2DHV10BrjsJjmGXqj/fi6LumNyvGelbmDuqVEDxvnjE6j0jj0TswU5VqeDtDH/O4XzcTtUIRbetluHjxm9sYPCQZyy7UjeM6llAw/kk1bql4UtPwTzGu1XWxGRVdf+RfvKeIMpt+CWkBRx4QeQzHiwmG0cPkWmZlgGvs5NMHIN/YAYH1MK0VBgBoM+Ctyj0iMZVFEvY+ZyeLoII9ccBzfup4MaXA+iZH1RMiHbqvO36o5e6h+ga2ixk1XAwqpU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D+UT2IFzOxDSL/Q40XgaeNqzzFUQ/MxHzASLZJ8g7M=;
 b=XlMBgXaFLVUAN4E3FbpSZFWQSSolJwXoP77hgeYxfhLh45qTl/wzpI99qMY2UHmPWE6k4IegR5uj16iZwxJL45aJnNqrRhI5IZMPLER30HVS7BQJMec1l3yCSqmtVPUHYVPMX1U5bDz8kgWYCLfHzbkf/Nbo9xrGvJHIyGq/utdY1nx8u2stwZXt2hTL1dL1zxC8+ZJvAQVpIh7Efd+vtLvm+ijw78WyvYea7uyvFOb2bNB45w6Qcn86mtfl1y7CmaSOobDsMuA7CGirjW4ihYsii+gjAyX2UyG6A3hQAIKnWLLfRJFni/1KyNwyHXuSdgkG7k9kZxvVI+8nRZ6xpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D+UT2IFzOxDSL/Q40XgaeNqzzFUQ/MxHzASLZJ8g7M=;
 b=WKv4DcjVaKN+gbR5hmlw9RBjb+iU1BeCP3yfElT5xILRPdaINjbget3yJAFdcqo/8xL3qIwhVgicGsu3rfTRUKodsV642P5UUyYZ7hM2t37jlgUz+wYUgqnHZ01mxjZOc27gO1Ndv3ul6Dq++1ghrJaI097Hirgm72YYf7ld7qo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5693.namprd08.prod.outlook.com (2603:10b6:805:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Mar
 2021 04:13:31 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:31 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 5/9] Input: iqs5xx - close bootloader using hardware reset
Date:   Thu,  4 Mar 2021 22:12:32 -0600
Message-Id: <20210305041236.3489-6-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c95a6bcb-b08c-4a53-55a0-08d8df8d096a
X-MS-TrafficTypeDiagnostic: SN6PR08MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56937588BBFD396BAF8A0D33D3969@SN6PR08MB5693.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apErGGJ9ypm5RfhXCgWzUNCqXh3DiP8CpovLtgMJyCV/qDOgEVMXqFJ7khz3gycCXu4AdJhF5eGJMVJqiEG442amT8z7dKETGvefkFVwd1s2B0rqvVH4zw5kEUu3sCNVLLlE4NRDUiSxNHBJiKyis5e8i/Nypzy8TJdxLFjSrvAc2NSo/tza/ALFQYXNrbZsOgett4VtEV+QI3k8DMQex9WWnWVSITVeKLL1ATMuyhcc7F83f1+x6XNUcJ90my0Yp3q1+QgsiqzigmfYoI860UQ0KYMPorEQoqRyDLGRWMHko+4lri7+UOSoHaAfnBYmLYv2+tyXrgDydpcGgnBhAz9ppQyOTx5mVbH/oCjhMgHf5iQW6yRgEbYivWDiU60e4mPY3DJiU+zyphm26wv5dSZRnlWeCzQodokkYsf/sL3yDcBKLg0hqDsqKNARIM2ucq92BiIldQsDRpKoBbRC5mHj4alqfHs1xq/YZX2jUBK/omWihEYTXFsocnVMlTrddoyzj2dqmp3WJVL6QaTpI9pQnZyTe0kaySicxUSEqDTrSguBVAAdFO1yTp0gUoud0TRwjiFMH0MZyE+rGZzbresKR6yVPQU0jdF+uVQTwFyE+SD59wAJ7ANjffS2XPSGZwjirkUqYCOCLUYJUKCJhlh07wVK7ifH8macRP0ecwRveLnmJLYBWfZuEeY6Ndud2q95fgx2efQmYY+4G7yCVxuuxVdvO942CEZHWO5XIzX/bOfsk8fDCx4qTyeOZZMoQQtZYqY/EoAoTFlk1KO4WjudZQYHVWwlZF04/ucqv9b6J/JGOwkXMbArIvtEU+ds1jxjasIK6kdwDlsT3ebIASbw2iRcriqB4NCwU1fToYJFrPifN+xbJaYXQfn3Q3GvT84dDdYkzr8fxbl7bi1Eux65zFbF8O7qBWBRspXYPd4dJnApT/jJdkv5XjYFMWkx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(366004)(136003)(376002)(346002)(39830400003)(16526019)(66476007)(8936002)(956004)(5660300002)(478600001)(36756003)(2616005)(107886003)(6486002)(8676002)(66946007)(69590400012)(52116002)(186003)(26005)(66556008)(6512007)(83380400001)(86362001)(4326008)(2906002)(6506007)(1076003)(316002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wS7hEmajC9AGlOekk3U8KcLr//PW7JSwHC+YbNz/EIF68ohrQFuNfIIANKeG?=
 =?us-ascii?Q?8PafJjsQnlGOF0gZoZ8ARmT8FnrSJKOYMj9naS1PNu5CuE4KxmKFrP0x2EjO?=
 =?us-ascii?Q?QuYgAeBuy1BbmmubDbsbY2wy6VnwXDssnevHuMa3PYqpT+DM9bhR1nIlheRz?=
 =?us-ascii?Q?Rhmwj2qag1plmZ3Zj5tb22Ac8eeS2PI3JZ3hD18jp1hVPnSX3kMN4ibMN5Oc?=
 =?us-ascii?Q?m9mFQz6m5s7Pl6lUFkMUvJhYE79rXsOVvZeNfqiS7dgVz4SMoj6/MPyjwS/n?=
 =?us-ascii?Q?qrgkJAgiviEl+FQSFcp9Xdqs3Jv1ufv1X1KQMGN5iIRnOi8FAqH+HBkzf6LB?=
 =?us-ascii?Q?Btboh8ITLsmBtCf7q6NK1o0bRKsboSxVtLPLjObQ03xp2+f6/qE/ayhGlqEc?=
 =?us-ascii?Q?6kOE3LuvuMgiFbiIaJ3SWJdvD1p28bUnqr2ThCuSgwk/9y4hod0LmCdqCYdi?=
 =?us-ascii?Q?X2Pni3feYiXle/ixHhWBQIEB6jNT2LnPb7HflwKq41vMzNPTduuxlum3C/0o?=
 =?us-ascii?Q?2fuggWHMMtQ9ilo8JAwXoV4SNdS79uq8qRPfMaP9kbOWt3fAM4v4t9C4c9XI?=
 =?us-ascii?Q?qR6AiDQi9Cf9mbZS74gKkbD5N0nKSNMMKf/pw+bwInnAGEvrpok7ZQvKsVyV?=
 =?us-ascii?Q?EsZFWw6DZy5/GXG/m9C6fqeQGi74gjnXVz+if6CPI/iUgFglkxC1NXojn7OP?=
 =?us-ascii?Q?mXyopfYgsrOD8xYAbkmd0a7ZgPWW85JbITmdhZLzZNSJxGLZDpRNnmDouG6w?=
 =?us-ascii?Q?TnFIzTWFlgSuQRm6CCDSaucMsuPDCioGtl0iCcsxjJXmEg9BD8ARmNf6Lirm?=
 =?us-ascii?Q?cdMeRaHhTNJ/7w+zmkCXeUjEtaXRERs5ibOWihSUaxC/zn+aJItdIuBnclge?=
 =?us-ascii?Q?PEnu7d3iKGY0YCjy8r/ir6o56lRmm+16SdKkmQlMY+U/EgNmSDnObQldhQah?=
 =?us-ascii?Q?7hu3ujx++994OfEiCwMg5+619LtFA0H9nEMF7dSHcXurjCeXK0T6e/1Iyw6W?=
 =?us-ascii?Q?X14c/019CcbHeLVShw/FZnTV3YujWAkOX/JBshv8m074g0zFW9t7tneSqHCb?=
 =?us-ascii?Q?k4nd+UWO3hEWqJ3gsqsLUu6FfZ8E/EECcfyHjSYWLmWr2Gf79/iZnZLLo+U6?=
 =?us-ascii?Q?Y7sdauZfNwiEIXBaWNnmL5V/ggdM5xTPo4Dy5f34N7LEA612DBAi99+GuZig?=
 =?us-ascii?Q?1B7ANiwspzR1Nv4apsRyUn8n07pmW681pnB2gtufxPhbwchUZWgwDCMk+MaT?=
 =?us-ascii?Q?m+DeBKM46dBV4OFznwYwAmEufppoIwePipqdO3BWVUi1f2MkN8dWENySJOf/?=
 =?us-ascii?Q?H49z4/E0IL1IICKYG4fEhvMG?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95a6bcb-b08c-4a53-55a0-08d8df8d096a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:31.5930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xB7y7XVUhwSHVPr1JNUVWYkgi23u3VBumayPBlZALrX/3h4EpAS/7tJfFob19PqKGfbuyldNfnL72+ZBIegtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5693
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bootloader can be closed using the 'execute' command (0x02) or
hardware reset. Rather than using the former option for successful
firmware update procedures and reserving the latter for recovering
the device upon failure, simply use hardware reset for all cases.

The post-bootloader initialization delay increases marginally when
triggered by a hardware reset, so increase the wait time to ensure
the device does not subsequently fail to respond.

As part of this change, refactor the return path to avoid an extra
assignment and to make the logic a bit smaller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 0920516124c7..a990c176abf7 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -832,7 +832,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	int error, error_bl = 0;
+	int error, error_init = 0;
 	u8 *pmap;
 
 	if (iqs5xx->dev_id_info.bl_status == IQS5XX_BL_STATUS_NONE)
@@ -875,21 +875,14 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	error = iqs5xx_bl_verify(client, IQS5XX_CSTM,
 				 pmap + IQS5XX_CHKSM_LEN + IQS5XX_APP_LEN,
 				 IQS5XX_CSTM_LEN);
-	if (error)
-		goto err_reset;
-
-	error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_EXEC, 0);
 
 err_reset:
-	if (error) {
-		iqs5xx_reset(client);
-		usleep_range(10000, 10100);
-	}
+	iqs5xx_reset(client);
+	usleep_range(15000, 15100);
 
-	error_bl = error;
-	error = iqs5xx_dev_init(client);
-	if (!error && !iqs5xx->dev_id_info.bl_status)
-		error = -EINVAL;
+	error_init = iqs5xx_dev_init(client);
+	if (!iqs5xx->dev_id_info.bl_status)
+		error_init = error_init ? : -EINVAL;
 
 	enable_irq(client->irq);
 
@@ -898,10 +891,7 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 err_kfree:
 	kfree(pmap);
 
-	if (error_bl)
-		return error_bl;
-
-	return error;
+	return error ? : error_init;
 }
 
 static ssize_t fw_file_store(struct device *dev,
-- 
2.17.1

