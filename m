Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C038055723F
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbiFWErD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiFWDxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:53:52 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2911A6439;
        Wed, 22 Jun 2022 20:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUZjiVuwWilRQKkODUtyZxAT6nu+pO9Lg1Zy8Z0Pwb3YawNARCpxezdtvuVujpbGdwCakBCTzxu/YCMkOM0pgP1z/lEmNv7/BNY668Gp/btKmIgm0VT31JeYucv2v6VVdXi6cgzr2FlawmdB/oDv59y0wtCjEVs721DwTodDJZTB/n1ovIYPbS9ahPU1YeSAX48/MVDV3hYfyQKSytCTZqAiIWu2AZ/aQe23rmDzIgiCsz6bFU30VLyRrTpFI6exHaGq2i+D/SZd8sk+X3HanEGmUvLMFCH0WfiFy4bOazfHCTwsQkL8mhSxRMEKKF+3EPzezwkJgXSK83gK5peR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9xhjU0ueNIdoQs/rP0i9bPRvhlt34JbHZyVqDC/0RY=;
 b=jo6zi+00ljPJFYTZfc399+eH1Wy/lu9s3d81uG3JmTKsObtCAHQQx4PY/NjGeANyltWh9if1E/ulUAtOYVaMKiaUe45RKto46lufCeU990wUoIsARVjDtn62z7L8JsrH6hDwlsgJ0xHm7TsNYj7CyvhTqshoLrtoEzJz0zANCd3smaeBcew+CyRAnpjY871f59CZdgjdlt1JTl+P8e9Hqflng63bf+ZLWKMMLWVujsWVPAJRMtkyaP6vucqu94scv/8JzpYV1/IKELRbjYfwsU67aE6wr72kdZjBbpYz58BfxssbpW3zBrpeRcJ8WReLpvd3pM/G6jAWOfG3bIqX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9xhjU0ueNIdoQs/rP0i9bPRvhlt34JbHZyVqDC/0RY=;
 b=m5w8OW19PWbyCYLegIpcuNNkleNJK1s5ZhQru1OpyrRyN9koUATx9BrY1KK/AFSYJYlshddxsgJJ/le7/aIypFuj1Bd6BDHcJEOneqMhAKv4dEfur9lxTtmwbVwEDGLEyC5MugS7yTwXI+msxLe0DamDWP+uIntkJL0+M9UL3DI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:53:49 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:53:49 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 3/7] Input: iqs7222 - acknowledge reset before writing registers
Date:   Wed, 22 Jun 2022 22:53:05 -0500
Message-Id: <20220623035309.39528-4-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: e01f761d-a34a-4c71-9bbe-08da54cbfb3a
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB7766DE82B85A68679DEFCE07D3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrpML3WO3TZRYR8XV1oF/Nrekj3VDQgbpU+ZBrKW2S9OElUx1lQRtzyRUWXknuitkRPxF8t1jDUscU7fQHLlegO0Ah2HU4HPUXMU0OUI4fFG2sPJ/9adFPbbbG0bNYP0frb3eghHwGm1MoiFx0HuXhBZVpT5Cf2hHpW5QaVOg+tSfjnA0RLr7cQS42fplMOTaW8TSh08hCGmxRlqK+9lV4H05K3bDLblEAiAjlmONr0TZ996v6W2eg88SIul+7ezC+Cd0xTDBZgfth2w0gO7gIBolWYkBF9wojsvur7bVeXpnNG0wjA833n0fo8dH0YC6b1YJJjj/RkqCMONUr4QTYQo3kA1Il+aFBEGJ7Iy95S9DfDap+xXEaEnTDdAcOAPoGSrMSDzTny/W8FOLy9hi2eCJ81slsaniFeaItD7SJkGjp6i1h9AiR1g0jym6Ay2NLiBwMklB9BZ40UXtw3ED4vpu4JcBhk1/ENa8Yswth7M94st5MrVLVaqs2V+9CXB1uH4kUHol3/rlFVVLAOjgxDZ0BiohxKKgPqF2tUeCjZu5fUYieT1FPKdX2KWH1m3pk9UiujxAu1DxfEUdzJ+yNhNGeCaIlkxPnO8Bxwp3eytCG4UUzj6JrJuP/yMntqRRUI9LO8cfjvV0vD72D2gXQ4XD7Aej7aVQTmEGzEJCYXKr/7ojLqndjRaxDTE+qkkuM5VNBxYViZEQSek+jJCz96J2xzviXavXr9vlTUiQsCmPGkynkIAYe/m1DzOk7OR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(6666004)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?72+gwAlyZWISAxwT4yGXzLsuImrXk93VFs8ey51Qssx4jAqjLp4KVONsskxk?=
 =?us-ascii?Q?vvTkEqXmXKRo5nfXcLarm1gxuI10XX53BKcge7Dfcxz9iF8/MZSJf83Xz79J?=
 =?us-ascii?Q?elosEI0lMQlxpOu5ZtzpOK0lf0SYixdwZOY9j3xYWNfPfMjexBeP9EDMnVvT?=
 =?us-ascii?Q?8FHF1IGDCfnYq00xShXuR4YhBqdITxTCKdMOJ4dpSJ7AKVAQKbCZXbXsghB2?=
 =?us-ascii?Q?MF2etHLum5BTyUCJiB6ihGBaemj7F98kGzIme8+wRva7sYb+iIE+XF5As6ej?=
 =?us-ascii?Q?5RGtIrzOamVy1fp25MExL0GPNax4xcCsDFuPqE/BtAEVAPz7aovzU6Gp2RJo?=
 =?us-ascii?Q?VjQyd3JZEJbEfiGgYmwdiXYmShcwLZXB67KtXLraCDJkFfMlXk+TQwl0AWkG?=
 =?us-ascii?Q?Rlb1k1iW2AkwfCk9zpKvvKWADZXQgD/UG/1zD/ILsNBUlnZrdA6zwibf7FAA?=
 =?us-ascii?Q?asE/BrKaagxRSLyjWPFDZ6+KSJnfaBUhSsOFp0Oa0NAZwigsOJhqnerXcWO1?=
 =?us-ascii?Q?35ula6smC3QlXld4OIQLaX8zPwhdmU4TWZhEfSKh/z/7bDd7Lkpa1iHvu/2l?=
 =?us-ascii?Q?ga9KVRiBFhlYwCYox7oTO8DYPLeUEr7NneKT3aAt1GQ8JlLp1RwKDxtfAZRT?=
 =?us-ascii?Q?NmQ12GvVW6TYTcEGnFwq0MU/YiJsMtlhX8jX0023iqNOuaJsaPLKJupFl7FP?=
 =?us-ascii?Q?rszTyw7yiZcUUTxEM+3o5lDBG1Z6VcDepjUZyukWFWWunqr1GwpTDzd1WTtq?=
 =?us-ascii?Q?be2s3OwEBXv6M55WI6pqmo7ZWj9OxAhCfmCc0QNF3SE+WbxjMEG9Vij0T3Q1?=
 =?us-ascii?Q?p94POU0w9aP/zsj4Miy6tUjfrjYcqWFjkJlzMZNZOtlfo1QJgjJeUOPERulA?=
 =?us-ascii?Q?vDdkVrdrrp95+9SCeHcKtlUcUKzmtCUG5TgcJwJaxixUs3dgco+dNIRlpXYK?=
 =?us-ascii?Q?fwIf32aOE1sJ90lKgEWNyrEHyGYOGBA5YtL3E/32NYi/8fEVqXJTNAE5Uilv?=
 =?us-ascii?Q?zsglu5I424/L4+7JafOZYTdsHJjTfGgXxi0X0V+mwPfD+J11AQLPudL+S4Zb?=
 =?us-ascii?Q?nHYnU3Lz0V5mSTZvoDjyHIG7lV7QyllQ+yVZqWJKfNrC1a3DpmQtwFMRPA9T?=
 =?us-ascii?Q?kLkc4tjj0h7W0f6kOfyJIvEO/1mPZrGjHyPmZwT/GorOxX2+dUs50mrN9XbL?=
 =?us-ascii?Q?IfcDp1QPxebFRFGQPeAyeA6uaSThmLZ4MYDoj3lShcimETnlkejFVoDAePvZ?=
 =?us-ascii?Q?mwMy2AItiLSxQ8QgugAMKRc8zYmht6dkgomqv9Od2tf+xjBCdSe06hbFm1uc?=
 =?us-ascii?Q?I3a7tg806Coy8Vf7Yc5PPPjSzxsrJuLlY1Ju6kcnBY7LXhjJczdLLVFF98XJ?=
 =?us-ascii?Q?rgpFVdUVQc06tMl9xSTA9YI7MUBLYlp45exUvpAxKRrZraHnu0IWagOfBWHH?=
 =?us-ascii?Q?GC9/L8dEr9xt0d00O33DGbbVjwWql9H9caXDOaI7IjOMxcM7+m/UgE5UukYy?=
 =?us-ascii?Q?Q9uyRk1HjapQGugxZCoLSCRSTE2ZE6JJBPdSYW730agX5priZUso2Om4rTgF?=
 =?us-ascii?Q?X4oxTvN+nX813csQReadUmswOQi2MrySfCmIrKSeQVlAkqwRylnUkmEfybWX?=
 =?us-ascii?Q?lOpHlvULnDbsc2c1KNthCMuE8C8/KplWeqMf+9wzANGIh/cf3qKOQn0lxdB4?=
 =?us-ascii?Q?feh9TIyBxBA2WWBrm0iVd5iB9Ht/Ocpn9U3ux7qj5dTkMCux5ZaGhJTexQiv?=
 =?us-ascii?Q?reTM+x0vCA=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01f761d-a34a-4c71-9bbe-08da54cbfb3a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:53:49.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wegyjrFDNgW0BZa4vtaD7cBjmvT4udiFpj73TRxajwEX3eohwcfVMDSuN+n3QWeQ3bfvYStmewRivPQpbnG/DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the device suffers a spurious reset while reacting to a previous
spurious reset, the second reset interrupt is preempted because the
ACK_RESET bit is written last.

To solve this problem, write the ACK_RESET bit prior to writing any
other registers. This ensures that any registers written before the
second spurious reset will be rewritten.

Last but not least, the order in which the ACK_RESET bit is written
relative to the second filter beta register is important for select
variants of silicon. Enforce the correct order so as to not clobber
the system status register.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index ed5989093713..c1ead10dccbe 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -94,11 +94,11 @@ enum iqs7222_reg_key_id {
 
 enum iqs7222_reg_grp_id {
 	IQS7222_REG_GRP_STAT,
+	IQS7222_REG_GRP_FILT,
 	IQS7222_REG_GRP_CYCLE,
 	IQS7222_REG_GRP_GLBL,
 	IQS7222_REG_GRP_BTN,
 	IQS7222_REG_GRP_CHAN,
-	IQS7222_REG_GRP_FILT,
 	IQS7222_REG_GRP_SLDR,
 	IQS7222_REG_GRP_GPIO,
 	IQS7222_REG_GRP_SYS,
@@ -1348,6 +1348,34 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 	int comms_offset = dev_desc->comms_offset;
 	int error, i, j, k;
 
+	/*
+	 * Acknowledge reset before writing any registers in case the device
+	 * suffers a spurious reset during initialization. Because this step
+	 * may change the reserved fields of the second filter beta register,
+	 * its cache must be updated.
+	 *
+	 * Writing the second filter beta register, in turn, may clobber the
+	 * system status register. As such, the filter beta register pair is
+	 * written first to protect against this hazard.
+	 */
+	if (dir == WRITE) {
+		u16 reg = dev_desc->reg_grps[IQS7222_REG_GRP_FILT].base + 1;
+		u16 filt_setup;
+
+		error = iqs7222_write_word(iqs7222, IQS7222_SYS_SETUP,
+					   iqs7222->sys_setup[0] |
+					   IQS7222_SYS_SETUP_ACK_RESET);
+		if (error)
+			return error;
+
+		error = iqs7222_read_word(iqs7222, reg, &filt_setup);
+		if (error)
+			return error;
+
+		iqs7222->filt_setup[1] &= GENMASK(7, 0);
+		iqs7222->filt_setup[1] |= (filt_setup & ~GENMASK(7, 0));
+	}
+
 	/*
 	 * Take advantage of the stop-bit disable function, if available, to
 	 * save the trouble of having to reopen a communication window after
@@ -2246,8 +2274,6 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 			return error;
 	}
 
-	sys_setup[0] |= IQS7222_SYS_SETUP_ACK_RESET;
-
 	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
 				   IQS7222_REG_KEY_NONE);
 }
-- 
2.25.1

