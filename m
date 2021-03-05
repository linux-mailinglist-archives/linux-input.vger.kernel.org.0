Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FA832E069
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCEENM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:12 -0500
Received: from mail-dm6nam10hn2238.outbound.protection.outlook.com ([52.100.156.238]:45505
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kj43CLD2sLs06ZZlj3mGgISajtmNwlADC5sJUWz60w9hprpdD8Gu6xWy1FzBCYJeKKpVnDt63vzoTRHkcNUxGyhu3p13GrpymsVF+8Eq3iSzjAB+I9SdGDGbLtrsDrZTmOr/L63Yc7dsOoqz7H69mTuBbssTt9eTSxXniQxeKKXsuC8Ka8vfrF7fVSIxyVVbxOqhZOIdOpljB6luMqdk+RYJE43VeNiR1yycVPaCfbdipaFYa9pkB4/wLo4XA903IKKaMBYi3kZj9kSgXcQe7A84kQxX0/3MNkXPVIMt1OUGTDQspi/iPgvbyXx5n28eXiXoNRSVzajxZqZCX/yI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W1FS2l2TCtl0QGsrbIbRyUB+wOqpihlQF7+OP0yCqw=;
 b=WodJdSlw3old00pFCoHclvwdBBVi0lyVxcPrSErF2GKtXOpys3AvrzmVh62KqTXcJDpPS9nJTI9wlVBCukupYou4qjYuSqKCrKvjJ1AplvNgq6GVmSgPD9g71mj6DAlvayGIabyu9QwDQG9vln+ycI8qXGrBY/18CbKd7IkmhZ+GU4fShgzdSscpukHBbXYiFqvX30GVXKsRT/OJPoIIcO0shyAS9w9TSC8qC4l6g3sjOGWlXf/9XF2hEuK0ni9VsWBB8rnHdTaB+EETJ4CflgDGGSCy+LbfVks/H2VTce1zdCSxviB4QYRbJuPWF1zCkZUaclXwcEzMae3pFlypGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W1FS2l2TCtl0QGsrbIbRyUB+wOqpihlQF7+OP0yCqw=;
 b=eXJ4rYMj4r7AcbatSGW+YNiU0i6X7aE7F9TxWhCzL7YZ+1RnKtmjkbT0V0mg5mM4TgWeG6pvkVdw+cqQhxNxgjca2f6AvvGqKlC7M4+3H9esLrDqti73jZeByO4qx84ziv/P3jenipRdvwnmh9I3ezsBEW5ZGOH1MnoE6cM6ShY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB6112.namprd08.prod.outlook.com (2603:10b6:805:f4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 04:13:10 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:10 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 2/9] Input: iqs5xx - optimize axis definition and validation
Date:   Thu,  4 Mar 2021 22:12:29 -0600
Message-Id: <20210305041236.3489-3-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 882b5972-ef00-4a4a-c579-08d8df8cfcfd
X-MS-TrafficTypeDiagnostic: SN6PR08MB6112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB6112FF4A9444B6DD3EDB53D1D3969@SN6PR08MB6112.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLPKbsBbViPy0upspyAgGVlXONaXh0+KhX4s2C/OBqO3zLvxdOEZxl6i1UqDEA4bLA1U2PlS/FDkvXCdpyS8Cz0UCgdiW/UqB6XHW34uPFlfYlRToCeBOT6nJlllRFXqJgx7Eq+btrTsD/I4I4dSTuQ2rIpM351lYUeMT2e3K+V/pGUDCwEbomwGdg0Na8Ia38pvHsKm6pCneIIerVJeuxXMHflfIp2HgzeEt2sCnxy7139dfnmLEuXv6qETd24dPbgVoD8WwqU3EIb6H8wMhsJX9vXi/BcyEL0amMHfcGWsnD37YksfdeJjk9zgxOCnGXdu7/F2revnzJ+nDSKwNx+PI1Nq4rS4sytsSzgtvsJzudoJc5kBrjaTLfCvhkEukv9JShvCWtYlTnR+DK3sTB3n8PY9gIbZEepuiS7a08D0RT5MX/AfYbSGvE0E7frJx3EOTWGxJz6jyFXghceyaQDHv9Q/kfXnbi753pOROL64lAf65euVjfKsDA7wgD4MHQGbbbFOkxRYMrOKLfUTgFIEDIV4jWlINR39F8H69nvSY3iYcaZe90Kx4sS1yOu7MRCi/oeioyXxd7WV0tQYraBwLP1+9hMNOdlssC+Y6GOBo53cEADcdICTeROcsndHIcjHo9CQZnYFqtEgIoGZ54ezcl5qsek2nonj9TQ/jUGkhmvOZ9//JlYsMr/sCddgoDvOsLGWNIGIW9gdOHV8LlstBoFzjPrlGAxmLBWdUjBIPzQ5OmrCqhvX2SQT9/V8vm8/HI8ZpfcqPIvMZXqSYmNJQejhQfTV8p820Fiofq7sUz5HZ75TpyoPJ2IYBGOJejMeIbBUw2r36I3WIjpDtQ3ilr7Oeq2Cw4TeC6qEG0Omq7X23Zw5uF8RDg8nM8gEuwD1ord6D6EYlCIw2getil+9koqLDzMmyozX/t0RjRfw74RQLRzUVPfesSkMrcED
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(346002)(136003)(39830400003)(366004)(376002)(6506007)(66946007)(36756003)(16526019)(186003)(66556008)(478600001)(5660300002)(2906002)(1076003)(66476007)(4326008)(86362001)(316002)(8676002)(52116002)(69590400012)(8936002)(107886003)(6512007)(83380400001)(956004)(2616005)(26005)(6486002)(6666004)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bl6r6Jx9nQqnITeXSLJwHF2Qnkf3qOOq+MD+wKgrIljf9ZhfWoVkVIIA9B2c?=
 =?us-ascii?Q?9Bhqnrq0PIpV3huUvSH/7dHb50HK1vZnVmO1MwHMgRdcVsB16ZipWpR0iMvc?=
 =?us-ascii?Q?RXxV7o7zKHY47L76Dcy7cHEX0UMrQrgUDhbVvzgGAZkYhBhyWj3b/cvjashA?=
 =?us-ascii?Q?ZiKQb6kN9fOVhWa2UwA+IZ9s3fl8sCjZ22XfmupRccL7d7pRG3sjipc0UjDU?=
 =?us-ascii?Q?bmfrFpe93vgnxZqMa/eSJ0l6w4RxpFJGXt4poe/d94aqeUJcOgI4sl6hC5IE?=
 =?us-ascii?Q?Ty/cnqf6pVCHw5h9Rr/3VJ74e+dWqGpr9vUhJbf3/jzFZZ7SH9PFUOFRpQFJ?=
 =?us-ascii?Q?EIpcb+rmxsO+ddB/SKxUcomaHwuAYR8kC59pSDp+AECd/jcFzzJRhvYKGUSK?=
 =?us-ascii?Q?7gxlWEKEvHDRm4txSU63mzmJ7ooTLP0/05fMsO82Xn7WxKJ2dRNw1oW5AmvG?=
 =?us-ascii?Q?ak517xZrmoI+GL4+7hNe337yzH8lHVQyOSL9umndBMqQQiFXWh2p25AD90tg?=
 =?us-ascii?Q?+RgX1oMNAE6QQIagEMIltiHnlpRSRljITjEYLBvSZO/UdBjGeW9vNtNYtQKK?=
 =?us-ascii?Q?0mnn4iXkiHUP6sX0PSaNBd6MTjO2uaYOvR7yA3VEmKiNedPFEZAGpQbb4+gl?=
 =?us-ascii?Q?xzawu6mdKEB2/0DSw4q4WFmTnomRq4cNIaOPPFK2DXSOOO5PImerSwQgzh+z?=
 =?us-ascii?Q?/3F0qePJ96A5FoboZ1HKAIaYXEKuAtZ6fSlcUm7hVURomZRaqSrM5h314p68?=
 =?us-ascii?Q?xzecsi5nw8aeVs4QjZX33sHkY7wYUSmCpjFwL/FjpyEJYsBp8vOH/B35wOer?=
 =?us-ascii?Q?TJD8maR0pzc1bweIDsoczT4SalUvDBAz13lITWXnN7XQ2QZtVfchYYUIGckN?=
 =?us-ascii?Q?IUfh30uQwHfBxeTiMgGfYKHEyBWiMV/M+ht4LvzmmFH/s7NUS6QOLtllBPeM?=
 =?us-ascii?Q?sWKlU0GoJzq2U0hTv8s0hJkKPXw7EIUkoIIAVidydBVhB2KgrgdNTu7dPMuq?=
 =?us-ascii?Q?t5i6YGKIcbwdSD88rBJI0xe63PhHIFrqs0b78VSi8wu419RADv0OxPC+5s9O?=
 =?us-ascii?Q?gjti3VFJwy/1F3sSksulacDWz/s/iC+3l9AvbJJIJFPqQ+zpvsmpd98DBbeH?=
 =?us-ascii?Q?3fikR1ebwpCCFBc9r1QbUHbtlEWvbN+4YZtcBI3F7ihkvxA23ssWTabnf69e?=
 =?us-ascii?Q?5xJK9393OKD1BqFO57J86xwFbDpAhMbLiXWk+0sOKLlpMYtBKgL/KVELYUAr?=
 =?us-ascii?Q?KfRV/WPzx47vrGkCPquedyvL1QDeFYV4PeUDN+zqhy/DrHuooODCiOTEhiOd?=
 =?us-ascii?Q?4G+pnkLnHBQsWBzCLC9OcAbh?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882b5972-ef00-4a4a-c579-08d8df8cfcfd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:10.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UenX7neWxOQKVKiKF4zqwEx0ia55CaOn+VxmO6otGWE22l/mXa49cniVGCOZSeywZ42IXH61Dm2I3qwEiprh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB6112
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Set the maximum ABS_MT_PRESSURE value and use the existing U16_MAX
definition instead of a magic number to validate ABS_MT_POSITION_X
and ABS_MT_POSITION_Y.

Also use input_set_abs_params() rather than input_abs_set_max() to
avoid having to call input_set_capability() separately.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 403e251a5e7d..2a4e048f1400 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -32,7 +32,6 @@
 #define IQS5XX_NUM_RETRIES	10
 #define IQS5XX_NUM_CONTACTS	5
 #define IQS5XX_WR_BYTES_MAX	2
-#define IQS5XX_XY_RES_MAX	0xFFFE
 
 #define IQS5XX_PROD_NUM_IQS550	40
 #define IQS5XX_PROD_NUM_IQS572	58
@@ -504,10 +503,6 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 		input->open = iqs5xx_open;
 		input->close = iqs5xx_close;
 
-		input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
-		input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
-		input_set_capability(input, EV_ABS, ABS_MT_PRESSURE);
-
 		input_set_drvdata(input, iqs5xx);
 		iqs5xx->input = input;
 	}
@@ -520,26 +515,29 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 	if (error)
 		return error;
 
-	input_abs_set_max(iqs5xx->input, ABS_MT_POSITION_X, max_x);
-	input_abs_set_max(iqs5xx->input, ABS_MT_POSITION_Y, max_y);
+	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
+	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
+	input_set_abs_params(iqs5xx->input, ABS_MT_PRESSURE, 0, U16_MAX, 0, 0);
 
 	touchscreen_parse_properties(iqs5xx->input, true, prop);
 
-	if (prop->max_x > IQS5XX_XY_RES_MAX) {
-		dev_err(&client->dev, "Invalid maximum x-coordinate: %u > %u\n",
-			prop->max_x, IQS5XX_XY_RES_MAX);
+	/*
+	 * The device reserves 0xFFFF for coordinates that correspond to slots
+	 * which are not in a state of touch.
+	 */
+	if (prop->max_x >= U16_MAX || prop->max_y >= U16_MAX) {
+		dev_err(&client->dev, "Invalid touchscreen size: %u*%u\n",
+			prop->max_x, prop->max_y);
 		return -EINVAL;
-	} else if (prop->max_x != max_x) {
+	}
+
+	if (prop->max_x != max_x) {
 		error = iqs5xx_write_word(client, IQS5XX_X_RES, prop->max_x);
 		if (error)
 			return error;
 	}
 
-	if (prop->max_y > IQS5XX_XY_RES_MAX) {
-		dev_err(&client->dev, "Invalid maximum y-coordinate: %u > %u\n",
-			prop->max_y, IQS5XX_XY_RES_MAX);
-		return -EINVAL;
-	} else if (prop->max_y != max_y) {
+	if (prop->max_y != max_y) {
 		error = iqs5xx_write_word(client, IQS5XX_Y_RES, prop->max_y);
 		if (error)
 			return error;
-- 
2.17.1

