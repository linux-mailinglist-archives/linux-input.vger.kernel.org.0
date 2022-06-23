Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB1155723D
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiFWEq4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244213AbiFWDxq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:53:46 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844866439;
        Wed, 22 Jun 2022 20:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDoD2iueB7bjNIYAZJr2pcdlGFj8D40wQsAiSXD7ZXnR5RdtGvr91UFDSu5oEO3+0QQs6dzzMKjAbrJzjdmsnlzyKfxgzdQNz8SU1MZnozzIEsF1OwfmuktnKMvlTdkVL5k7KdZPqQcm6KapEXPFdna1XQreYzu7fGQkR6ThKO7P6Ro/ilzHsli3UaA/vH1r7wBRWdz8CmdJoA4rNlMtGBA56KAWXYxUScoYirrd4SmQqRyPs/7SXnPPRmmSzgoKPCI3RqyL8dEdG4gUS19t3XzHojAcs5xEA5cTlGX3UqBoseVMpxWcS4QkNzA6VvTmsnQdB/i39cetC1kOI6E/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7PLB+QvUvPJG89baGRQ5Rr1/8qMQOZQ1C9w/BRCyMM=;
 b=VGjDpe7md6JAwt3nYT1WvA7sRlFSnG3pGvVkNfLxSHA9oxD4hBf+2h5U3fpTeu9jv77N4Qhx7zoCH96s3n7a7BsUWO3ArFiwXzhjNqpvNuijbLeb8o6ukgo0AYCTK4x80/Rgfh6bFzjwXiU4EBfHy1pfWFOvPtKXJkLKb3chQG+CSDpfBaDzdGSsPZbZY8kIz20bVQqh/tgPb8cLtU1RNfL9ekL7ZSu5C+2g32/M+qzv8O/JfKsmAWwBKvPn2pgGJIbWP1Pwf6Mqai3pDIYvnvKgxCk1DDMFP9UciBTlmD6l/RnWU2S0731eR/XoHO63MRy3oY/dUyTHbacGIWeDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7PLB+QvUvPJG89baGRQ5Rr1/8qMQOZQ1C9w/BRCyMM=;
 b=Lak+MVOenpaXstQaLDEvLrF43a9FBQw2KKqDC87IPZGF30t3Sy7caR4uuUkQtRTy7kf1Rcp7J+yC+YUseKQkUjxnOhycMSu4vO7vaUO7q1VTLJFKEN82ghVedPxZ/FRnjHHHhMeTpnLJ34qSCEjU6SEhY7qDj+QHyLpwGGkOXzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:53:43 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:53:43 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 2/7] Input: iqs7222 - protect volatile registers
Date:   Wed, 22 Jun 2022 22:53:04 -0500
Message-Id: <20220623035309.39528-3-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623035309.39528-1-jeff@labundy.com>
References: <20220623035309.39528-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da79c9e5-9bb6-4d47-68bd-08da54cbf745
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB77662BC30CC5455F4E760A0ED3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpZHcjXzIFwJDKRE+XsW0IOWpNHjEzi0x+BNQh3yiCgj0MJZP7mvrJaP3sdyNE/VVJ+n6ZuoBor9e0+3na6nNz/HbyMfHuUCYpmf+f+b3oYklNJz3tSP8o55lLpnCWzB03VjAf6gduKKlM/hpzthAc/WkGZ5kOL3OB3NExrxgCc4RoitIK2lO2ZSFOXQrfWbAufbjT0dpCow0bkZj9ByjXidVAFWr+lJbjJkL/f2GtQNm3KzCYyafOQGhDcNDVRnetPXLQb3lsRC9rG3RVCD18CkoimohyuLCmIS+Fz4Y+scWpYEfjPbrAWbvzFATXi24kwK7i+eLc/VlUi6YZU4lux2NzcEfRDYX+oqY5KMNPJK9ovuSeR2pRbIQG0vt9b+jMGoWiJqFyU4tYLbfLkCriOM0g96uaV7539VhI70v1d5TCWdGJQ1srjBUFQipDn8MXvuS4eddS1RU8rvD6y44WdOdlj7lChrVmoPFi37MugU5KBORplToJIVFZDsGssm3u+dO+mQgq6SbGPUOAlARf4ccVnWiqg8RIpYlNSauVsoFYuBPf/v0nBkDBQy8r+2J8H0IT1lqk4vgk5LVYk2/OJmjJTsZtEyMbY+KuhA2E+66hX2nq18Yjdx9o1aqmo7cC77Le0hvTMRm3xloOr8t6KndtTCxdcd5iCjTjn6VHC2YJsT4GARNbEEVk9NaqGXWlOfXzQIr31SJVhBJe3o4Xmr2roFwgSdMZnT08YFeL7/x2tBUsXmHrMZkZE/k+Tt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(6666004)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wB6hLSXoNrkqTQ3fc9AuFpE6CZrzfEMsFvopp3cTQnv1p4seI5kDeOYAhvPV?=
 =?us-ascii?Q?G+Wnih2dl+00roz6AnEJxXUQNmfgn6WECtn1jVOZEDQ+b5mPKnAkmS9XHxAu?=
 =?us-ascii?Q?aju/ZqvUPk8cJ2PhvnPeW8tY6PP3LxdKZIkdmGd509G2gM9JcDJplUDebPPo?=
 =?us-ascii?Q?zLPGTf2jb4bclgrKHhsh+xPHngKrGVvcn8f17p7i2hF1JWpMr2V3+QZHOq2U?=
 =?us-ascii?Q?gRTNxsRXGnuAkxrfLR3MrOCg7XRNfR3kSNQHGKwvH6Z+Dr3Ob2a6r0lDtCWc?=
 =?us-ascii?Q?SZXSQJ6wrpeVASHJB+USVpn0YMsJUSlRwbVhA8VqWqIkFm4d1IjnmZnxzlLq?=
 =?us-ascii?Q?5zWlx9UB3Ff++43nnuysLICgHwNNh25AAuZcAe5ro4Irst6vZs3l5K0Dp5NQ?=
 =?us-ascii?Q?AscCeOf0E9FWeNIVOgCiHeRrgWbdDyAhpcuHt/D930L9NMVJoihanpxASqmr?=
 =?us-ascii?Q?QkD+ntcPIDRFt4fcJH/BZgHBIq3DUOYxMMIiNrZQNVyN1rXdgW9T22/1MKCb?=
 =?us-ascii?Q?+60a8SYJ/QXe8e5e5LEww8U/ufoL4qz3Ty7jdndddWrQVCCQgmx60PW8e9Ne?=
 =?us-ascii?Q?lwnciI0BSjRz8jTyTA5D0eXqvgYt9F8z4vV/zOGkysF1eZIvwKHQfHLsqsnu?=
 =?us-ascii?Q?Q3WeCk/euqYI/CbCNOwz4+Jxw9BngE8p3o3av8AHEBltfOCFNIk0Zr3Jhl11?=
 =?us-ascii?Q?MB2y2xOh6Wx/VtfGT9NF8MvI3hSXeNpkKGSB4GQy+/kEDPS/TG4bYrkv4gTE?=
 =?us-ascii?Q?Dwt2vo1yAy8wrbKU9Btfz513wdSpLLv1ZTpiPuYV/sBCEHAuwuotXZR3HRKX?=
 =?us-ascii?Q?vSiIUDmB6uSSnrBuhcNzvG/HYsc8HzSwj9oiY0yvBbg2xh/0vqaA87STefTg?=
 =?us-ascii?Q?kibFhkM8TmXSxurxM9p4ytuLQE5JYOqAfxDkb1wv1Hx/usSyk3gM81VCef3X?=
 =?us-ascii?Q?yKs/tlahjf56hyPBW1atDAj1UyLtKT9I2EitU/OqXHk9P+byqs9n/4gB7psS?=
 =?us-ascii?Q?IPQQcE+SB7nEij5/t2SveVYg4JST0nV/UwI/BI4c2WlQ6hxFHar3fTQ5dpSv?=
 =?us-ascii?Q?p7SP/sbD69BEVmYzy6/E7pzrFxDClDqMFY0dUgmnok8GuLV6afgVnpffzyxG?=
 =?us-ascii?Q?n65aKlwzdg4ATbKb/ypVTh+Nz0YIwVpshjyFQVqJ7kQwfIh5u7rRPBkCTmHQ?=
 =?us-ascii?Q?+b95KhyjLqUaMLLQ+vqRpmmwX3r4iLu6J+/XPsvIYt9AWk+DDc79KXjm7LOU?=
 =?us-ascii?Q?3QVcX22K+oXDMMtHUHwzmLJBPbj9OOIa5heUAtthNbQ7rWIRfJ8fNY/QB/0c?=
 =?us-ascii?Q?Epds176k+QUHtYzShRDw2PTaJhngRcj7a1+qCfkJuaonYgwRCVKqC58N9Bly?=
 =?us-ascii?Q?0gayG28Uf9ZW7it4JaJK1CEhtP45z+6jLSqi549ErK6VURdIocFZbR0R1/hg?=
 =?us-ascii?Q?Zg6fKBy/yyu4otj6nzj53A9l3PK74inqnWEEpSgpWK20EzcWYaCcaFyd1MCn?=
 =?us-ascii?Q?KkSsGwLqW0G0hhTLwzGHImnzKsyu7nHyH2mLYbxExZg0FmHU9+7pKNKSdiaJ?=
 =?us-ascii?Q?ZN9sOm6NCA1gvN73z8e9msC1Ew0BLtBLYoGdN0DANnRZ7aj/cZawA7bgQHa0?=
 =?us-ascii?Q?EPltE40YIkkst2EYP8n99RDVYMJeRLQX4EQZjlf/N39JPgtAuSN5TQJhcLfh?=
 =?us-ascii?Q?aHe0flyBHmtYMHtByMAE8gKZw8Txtj1OIb7xouGaqmO2W8cugRZGxJMobCok?=
 =?us-ascii?Q?TxHPAzABBA=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da79c9e5-9bb6-4d47-68bd-08da54cbf745
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:53:43.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS0S30OMsdgQRHQvd1AD6MCghojBCpT/EQejoYuxVRgrUpRp6h3LJi3bgvtfD9Vuiyc256mXPjGFGzP4EFruxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
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
 drivers/input/misc/iqs7222.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 6cfabd6e3a15..ed5989093713 100644
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
@@ -2233,9 +2246,6 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 			return error;
 	}
 
-	sys_setup[0] &= ~IQS7222_SYS_SETUP_INTF_MODE_MASK;
-	sys_setup[0] &= ~IQS7222_SYS_SETUP_PWR_MODE_MASK;
-
 	sys_setup[0] |= IQS7222_SYS_SETUP_ACK_RESET;
 
 	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
-- 
2.25.1

