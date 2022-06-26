Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9234F55AFE3
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiFZHYy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbiFZHYw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:24:52 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEC862EC;
        Sun, 26 Jun 2022 00:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6zxHt2u1x19nYR0TS2c/ODT73oae8H2/zKI1L/uYMx5UYhZVBFMb1OQcKruZ8mE3fcf+h+4baDVXhV+J6RkPLEda5UbVwSpxAv7ZY9Y4XEyzrjfVzWoR7LrPjSnGoqYAGwCWXxf1VXS86h5AfiCGYbfVTQBsDwJABF//fDxslic6z4PNx00ngRZXwUYqJ/futl9og9mmvURGKbIjkXQ9DBvxN2ShOlA13ifBqyNDv9sxGMed0ApYsyQV+rW+/ejpygCM8EkQnqlKIbQyQM7829wiDfGGdCThVx8muxDiCj//+FnSWpV5+3iIw2Fvhv7eS0meX2AXM8YLXpF7B4zvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EZw7rbfVv+OCcz+0aKBjyhYrkCp3xfZamrOwNsywLw=;
 b=S4htuNkW8xh5/81FfDbdImj69QR6ldsOhLxFPGELd8/k7Hhf8R9oRcezrOWXBkRXT9Rxez9yjQ2c7WFsTV4CFlUUembYIy0iVqSgJgpo9hlGtwIUBDghNU5hWTGvp7wdPNOSLGCVhaXptNu1hQYxXb2jJNfYo5qmPjNx6kTlYC/DsXC1ko1H1RmGnWVHMNgeOKMSZGk8l4Ek/t2K7F0BHxKAslnkpPIECpmONiCs3ueI60EZZjEdqPPVYSZL5UhJuBdc4KSNZbAh4DaFW6QlMALTuFlQ5nSzf0ejtzKKxTpi0VWEmSJvtgN4SUlGWbiFb/OBAgTvGdSrk8v6zF32hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EZw7rbfVv+OCcz+0aKBjyhYrkCp3xfZamrOwNsywLw=;
 b=HD1FMvGbtT/MNySwLpjscTVC4Zhrn+K/tYHs0LL0G75LofjNBTp986RznNT3K9C+nU84MV/yB1oaMCs1n4Mt0JtMS07v+Gp4gJqZlQ7V7V2xGFppzgFCHjrZLW/VpQfTTMGZFEZJ3u8YoiZg7nPAdGZhGQ8Wqq9C2AbF4mRU0Go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:24:51 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:24:50 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 3/9] Input: iqs7222 - protect volatile registers
Date:   Sun, 26 Jun 2022 02:24:06 -0500
Message-Id: <20220626072412.475211-4-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
References: <20220626072412.475211-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0463be68-5146-483c-62f0-08da5744f513
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sFuaRZtTEpObcQ6Jja6d6M3tCfpibkYE9Cv6xXqflmX0vqX2l1ApJ3tBlg6Z2wyXY5jtWIy9Cj/hgO9R5UxgGCRwxWo8FoU68hLVYOiVApL/Y0tYIYB/XHK140oEi4M+dbTqbzXxDhOBFfgcfYMaJ/0UE8dYY9WiUtybEnS5NknWr223XZuoueHPw6wpZXqQ72oP7YbmMZdtkLMvtwFUDsJCDe0Df3j20mSbl4oo6BTmUZcFJB0wmq3LkG7hEt4wMPDBF4P2xLqlmMIjRM41eXxn1RDEu3Okkk+4kLIrdFC13K55ZrXSvWjDihqG3DBy8PnQN73W638nVRtWP1OmM7zfwgnBlqEHExizn4tZEQ6uMKuQyMRSACiX7dx19r51Tgx0Sll3IdsVjNyGai0BAtecYi80FsWbv8GZpdC2Nu3J0WPKy84RDm4PKu+62GIb9zcTuXZNsb1i6oLwPnQMA1qu9JWhNn8nz+plUzr0okgqo6RQypEeOanMLyAsxT3KwpyLTF3ZgNdbO/qFQs23nJADgtXdAitkGrVUqChuUTWV1PsampRq3lCwrY+8+Sl9SH4Y9ILp3b5LIj/mjKwmQxtZGAZnhMXX5/uiT7sMPLyByAXNypyv35YdHO6aifzCb2vmc7zVf0oZItYqJeS4d+bOcJYO2ce08Mbky4An/AMvHtdOjzXNfMJY81MkPNu7/29JLIp7FCAkxDXif3e2lBTCXT/tJB4tsM3uSKLJDVGI6RPFJIILZsCaIh1I5eea/yNXitkpCb6OGJ7MShb3qchi7F68oWfgp+sbkfBu87M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ajo/5N+Ki9VXmh4mjfCmTA0H3SJ7k2kbmPnTy+s5p1941qIkTDoqlYCqsLr1?=
 =?us-ascii?Q?o3AVO4SZwMOiON8mb5ZiujiwZQ8CHGmQ3XLXWbPgagT7Lq4YKsKY3AI/7Iqr?=
 =?us-ascii?Q?7dZ0NEvlf/3jGZsq5JOjuLDvNKaaleTDZZwgzJvRZNX3H1b5s1Z6Myrjub4o?=
 =?us-ascii?Q?tnjER+XjfVRRFsjvH6egafIVbYvkRQ4rVGMhtmcsilu1xl6Jii27bxqm364d?=
 =?us-ascii?Q?vs3n1bd6JysmBT3HKsvtqJ+Kmn1V/iRh9NueITGTazCd24bl2+EkVL1s4ZO0?=
 =?us-ascii?Q?Cjy0Z05Tn4OTbbk6opLJpt3/oi2VJypTgS42r5AAByr6ndbLS2wBE9XRTdFl?=
 =?us-ascii?Q?+zckTZzYmxcZmlcgU5ausj0FP2+K6WEcAKZrqnwyRy5Ln4kgZYxmMbnOxfKD?=
 =?us-ascii?Q?wJDIshJeITZwShZpJoWO7yYDlsBK8Vchx+ktl4v8AqOY+XnJ3X2wASB2EX7q?=
 =?us-ascii?Q?1oJe81YOiN9DwKvcg8BDwAT5REQcm9f1Ui5/P0xb4XSo1ttDBUNw4r+RKnPu?=
 =?us-ascii?Q?uUr/qRnQmvnY77N3FnXsCjkOWkzQjoWGLb9bJb6okJ0dYf6gkH9Y6D4JM5qB?=
 =?us-ascii?Q?G9jwSInAXJkdEXCpKTqESNdIuAAiK5BxcR0ZvprZ6zDvsSNf49r9BZcMaNjz?=
 =?us-ascii?Q?eHYLpWS2+cv0iV72AYoJRSeY8IX++QgQ165R8JEbCOYfvJSv4KQZ9fynOc3p?=
 =?us-ascii?Q?8Ob+d+rU6u0HLjQ+C9/Jjw1pP9/6uvWdsiVtQ06admWaBO5T8B1r1er6ZC+D?=
 =?us-ascii?Q?e7/aqeHJ1BLsUPnSMHK7SFU/DrPMbDOl9RIDOdnKPsu5lTnVjjAfSW7s/lxE?=
 =?us-ascii?Q?asdGs+ReCLykk63R0qjnnEeQHO2UgkE/5UNTLBanfiU/YYlWuwUl68UV7/g+?=
 =?us-ascii?Q?59SkOpek+dRwf2ES84CvlohZtPJDnl/m4VEJdpMlATMcx9Y9NKfn893FqvLW?=
 =?us-ascii?Q?Kr98DTmRMUynT0//H/6fbE2goKY9GA8HIbwfJuYoAjbuWIXMERA5j0FJ5sDx?=
 =?us-ascii?Q?qPnd25kVPriNxvG0DyCqBhHYdXuJY1BBLhx9nOZMwKyTBbA7Yo1YEoGT702U?=
 =?us-ascii?Q?Ca1ZryhscA9X/DVVdJnmuiVaE0CHqicrETIe32bwjaSuC8GmreFNZLm9qDqs?=
 =?us-ascii?Q?2+yNpoxA7gevn2+9CJuawSOHWgjLtjgAnsgjMyEV69jy2S4u105qfPvkw0wN?=
 =?us-ascii?Q?HDpCbh2NqfvR7PNDRulMy+brHkm+Fe/hHsYsuQVICPZKuWYYY8qJcuUiRGLV?=
 =?us-ascii?Q?JAtdQpNYK+G4bIJsk2NCvVjCOFlPwDnBDfzn71FMvI+B//s6rE1bw4A0DL7M?=
 =?us-ascii?Q?lLfRZJyfp88wN28QSiW1WgGYbEuXZ6EBB9eX0dQVfeV15u9Tn97O9vg0NXbZ?=
 =?us-ascii?Q?oB9RuQmt1i7i/ocpfqANwpJwrFYSG2wg9ciZOu+ozTyCBWG361Um905dXjka?=
 =?us-ascii?Q?a7oNFQEmqp/mrI9shweDXO/JluqFiAiIKCxwU3T0maQ3H7PHYo51upZI1koV?=
 =?us-ascii?Q?mhK9dG3DfsPrOo42pqDopKQgXz3MEKTlQxQeoR8QGLQy9aD4LMXXyhsBdsQ6?=
 =?us-ascii?Q?iSny3VV4ouOJ44bKg8AiW+D4DMaozG2ml7TnhRnl?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0463be68-5146-483c-62f0-08da5744f513
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:24:50.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6Lm3DWoEKtS81JGapNFhkdWPL3MaV07ILxP6W9hgshDtHONiawgHKB+RAyyF6Vlk7SCthQhBB0s+qI7U8Xlmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Select variants of silicon silently mirror part of the event mask
register to the system setup register (0xD0), and vice versa. For
the following sequence:

1. Read registers 0xD0 onward and store their contents.
2. Modify the contents, including event mask fields.
3. Write registers 0xD0 onward with the modified contents.
4. Write register 0xD0 on its own again later, using the contents
   from step 1 to populate any reserved fields.

...the event mask register (e.g. address 0xDA) has been corrupted
by writing register 0xD0 with contents that were made stale after
step 3.

To solve this problem, read register 0xD0 once more between steps
3 and 4. When register 0xD0 is written during step 4, the portion
which is mirrored to the event mask register already matches what
was written in step 3.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/misc/iqs7222.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 57616a7ebeae..c46d3c8f0230 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1274,9 +1274,22 @@ static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
 	struct i2c_client *client = iqs7222->client;
 	ktime_t ati_timeout;
 	u16 sys_status = 0;
-	u16 sys_setup = iqs7222->sys_setup[0] & ~IQS7222_SYS_SETUP_ACK_RESET;
+	u16 sys_setup;
 	int error, i;
 
+	/*
+	 * The reserved fields of the system setup register may have changed
+	 * as a result of other registers having been written. As such, read
+	 * the register's latest value to avoid unexpected behavior when the
+	 * register is written in the loop that follows.
+	 */
+	error = iqs7222_read_word(iqs7222, IQS7222_SYS_SETUP, &sys_setup);
+	if (error)
+		return error;
+
+	sys_setup &= ~IQS7222_SYS_SETUP_INTF_MODE_MASK;
+	sys_setup &= ~IQS7222_SYS_SETUP_PWR_MODE_MASK;
+
 	for (i = 0; i < IQS7222_NUM_RETRIES; i++) {
 		/*
 		 * Trigger ATI from streaming and normal-power modes so that
@@ -2241,9 +2254,6 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 			return error;
 	}
 
-	sys_setup[0] &= ~IQS7222_SYS_SETUP_INTF_MODE_MASK;
-	sys_setup[0] &= ~IQS7222_SYS_SETUP_PWR_MODE_MASK;
-
 	sys_setup[0] |= IQS7222_SYS_SETUP_ACK_RESET;
 
 	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
-- 
2.25.1

