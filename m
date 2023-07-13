Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2ECC752A37
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 20:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjGMSMP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 14:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjGMSMP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 14:12:15 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4302680
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 11:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe3IxdJOjh0/fAX5KuCrwFlGcaLDyQIKFHDaKSI900b1XoC1mQnmegiHI4D6i93hnW83GoRmPaG44Kuyrv3CdYjOsLSKs+Ufx/8vkdEHTvhihbK9c3e3ctwkMCHisi4e7736hvjc/UcLI+XDpuM9qe0Y4N9++ItnnYqUiUYIO+/BRQOh6fml9m1db/pbqYraff4UcgWDwpANo89eruG1L8Y8HaatQI+xHD5/1SC8xGjB/tezRuuiO33JfaUciO4wAWadvtnDxvat5OK5dc6dSENEanDnPwqwDPI/Z10QfxdFmXi6Zci9JVKWhBu35yKoku9RWoicMYBDJ4Yacwi8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hnMlVoVyghscRQWhHXGtE410OFVUzetyQ3KiQsw7kE=;
 b=UmJs8LDQ4omA0LqxcNiKKl2FaVrZ7kr6+ex/YgtC+nE5tI8612P9yx5FYi+z0DAXDtenQ6NCHG2otIB980uAZ2Hp6rS5pf52Igailicpf9e6EW3Xqhh5kOB/xCz8HljpmBEk3kPEy8AGCVHLNtPWvHKyxWJupKW922kvZQ42bxRnkAc5+6jQ4ZEB5QiCSGUuyDPx9YIr89gvlI2IILwMLJhUGZehs6GWe8XflHW0GFN50J0MU5GVsXqUr57129wDy27K01IKvOg0Ml4xn6Q1aJnlBVMvFMs3FB16T2TGWzfAfbP9Eo7z0O53wOwxOGTwY8lFMXopJRcZo5I/9dfLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hnMlVoVyghscRQWhHXGtE410OFVUzetyQ3KiQsw7kE=;
 b=KCUQZo1luUWDRDKdPzx3CaipTTRtnvjabRRwt/QlwQkqIwQb1H+k4LDZ/ip+Y4HvpVMZU6cnyvstXX7h9Ak6fmkDhYlN0xBIw3w+8CbkOjLP82kr7kcmGJ47lbwfcGZGR45WR878xKtDQXvR9e27/vgdS7+vnquB2e9lRqsxv94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB6744.namprd08.prod.outlook.com
 (2603:10b6:510:3e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 18:12:08 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 18:12:07 +0000
Date:   Thu, 13 Jul 2023 13:12:02 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2] Input: iqs7211 - point to match data directly
Message-ID: <ZLA+cuciIeVcCvm6@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1P222CA0064.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::15) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5c966c-401a-4774-7bf1-08db83ccab3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOj9Qq4qojtNvVgp/FYEQrRDbucPmqSxetb+EPwmV+lV1PuVt4vtqC7klOgL7eMu0CBBdTjmgvf6vffm7NoWIUOiZIuoMfvejYFAK0947cIGCQwypg9Eom50RrDOkvrDk1b482pegqjWVFMXerQCMjNR7xNcfwFW8V+R3JhQg/DPElLhu9g4Y0LwqKLhyPKS9985v7VZeFdPQ4YiO+aqXmTjS/bgTz5F5cPpwnrraP11i3ZoxF+N2gS2irG/6VbtKee101NW7f/wd29J7xZ73p4wSVueItpBLB3nauK2+R6sAF1sn0Avkb9Usilnp+SDXhWLIk2/hS0Ul4YsP9ojHdkeSXRYlpX/IIFzoWXK0iOES8btdneGgK4uuR91Gvr0Uv25h6lRJQrlg0cEC3+ekPHYcsDO9KEfZM0ll45tC0dcjJyj8trse5XwCHEMT4NPkrTzObrTK0tDhNzlMKRPYfTnWShaTTtCKxZCkxNDdmCucy+bn71rrNuMFOu2NgqiwmXH3X7q/cqWKH4NmIolwd57y1jlA0G28PfThr9xcD8hihEJPHz3h7i4kEEf3rRfSzzYSuTIuw945tcH1w7y6xGuRall+1NDANdyIbX8sWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(366004)(346002)(396003)(376002)(39830400003)(451199021)(83380400001)(2906002)(86362001)(33716001)(38100700002)(107886003)(966005)(41300700001)(6486002)(4326008)(6512007)(6916009)(316002)(5660300002)(8676002)(8936002)(478600001)(66946007)(66556008)(66476007)(186003)(6666004)(26005)(6506007)(9686003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYnTLS/an6Aba2Sd7fI5n9ddvKS3B2vnpRs6DZOZ+V3ySgPBUtnePkVZwG7e?=
 =?us-ascii?Q?xch4i1S/3YmkY2xxO+sWjF3AvTF/P3hC9jKFJ5KBmlbN7gP0wg4hwLM3qcN3?=
 =?us-ascii?Q?v+y2pVx0i77aMjH77HKUi9mZ3K70NPFODFTGQvJk282IQWb9JuRwtC93UFI6?=
 =?us-ascii?Q?6lC2BH0mt723AVBJlUIGFsm4SE/4H6Unsq2RAIjbOVxD2veK4+UWY9WYqIjT?=
 =?us-ascii?Q?BgKV/+CQi/HRdj3pWdsx9F7v+b1+5Y0BSC8IjYtpYmiQEDlyftE3F7doqYeh?=
 =?us-ascii?Q?vChatjBw7El1WikIUzLrzUBmW9m+N8g/BCIJIwRmETLNzggOjZuE/VAgGyVJ?=
 =?us-ascii?Q?pFJnbxdHdw4YfaR7MA1PNYVz646RBoYg2NH2kbFQQxW9W9lNp7nzXLRBX6E4?=
 =?us-ascii?Q?c2F+Fpv/NXUfYQXyZcp2zOG3hJyn2cRq73AJ2374sQTSt2M22x0CQRfqHXRN?=
 =?us-ascii?Q?xdsHMrGNj97q4+NdOp5ghpUuY4DfcHYedQ2wpM2GDiWpdgKyjuArYTj9VAf+?=
 =?us-ascii?Q?rkwXQtUHJWjQYh35hmtUFwNEiGYuAH0CTsyl6gMw2kd3r+/Ehfc8MxiCxNF+?=
 =?us-ascii?Q?taq/wc9kRoc9+HQrfLGkhw7JSL51Gv2kXs38DzONn+AksILwmq2d28lwd88D?=
 =?us-ascii?Q?ADtjcuhtAgKH0evunUKRJtkRWzHoPO/aR+CtsqYi2VmyBpBXhna/pb8CZ5Er?=
 =?us-ascii?Q?d7bdFZvrWANnjZ8m9Y8EGqcmbmtyNhGUPkp1qLu4BN031V1Po46PjPnLZvtw?=
 =?us-ascii?Q?RXyPAL7BeLq9U++cN86GHUemXgGQlMxAlWul+VDM8fn4PyHnqEw1Zw44Vb2y?=
 =?us-ascii?Q?0Gy4tHpKxDEL7Ad9rcAPahVkDi91tDl7jcNFhA8PL3l6tI/DKx6Gr8EgXErN?=
 =?us-ascii?Q?/j6kFwjhWBTHyoxASwFkpUY3FzIttwqgfjcUCFesr3Cyasdi65WLGLrTqFdm?=
 =?us-ascii?Q?PSeIGGMO7SeTP7CVvNCil0Yx6m+/uj1eTfmQ0DOPXQpTzbh2wzlMUpa4XsKF?=
 =?us-ascii?Q?LP7EeHBjhQ3xtmSXs7qeBLnJwuXT5JHh6CCftcmddzfnfMYkZV20GSaCW0wd?=
 =?us-ascii?Q?huJhrcscOCHpKn3iNHvWH9AAMAsZj9zn3hUKyGKDWnAKdzLFgy0Ret60n3KP?=
 =?us-ascii?Q?3nHVSelIA+V0wshIyCsasbS+1qiKASqm4bWHsiX01t9qYRENdTz74yD3Go1k?=
 =?us-ascii?Q?Vxb/2aksb0GmNPlCL33xM59J86BfJ4iirTTiOLAz/nILuXvATW+5HnO6ugPb?=
 =?us-ascii?Q?eei8Mk7bQM3udrB93/Dh05jAHPT/zBG10oYJXzpoRwP4ptLezIIzL3xKXDpt?=
 =?us-ascii?Q?gAhgnd55CtwWOKvnP9sXQkpO+yUGfkGb2EWTYYjjdzJLdaRRBqW20L9WYxth?=
 =?us-ascii?Q?SCrYnWUdY7aYkOiQxpzXGW/RhSjn/Afl0/AGs5aPwoZ35ho4BSSHHySVCl3f?=
 =?us-ascii?Q?8p3fE7SY7TaJD1VaA7Gh3FUasoNSF4ZB1d6BTF80QpPftiEtEm+wEl6vW8NF?=
 =?us-ascii?Q?ObjeAfuweqUgq0jFlPovnQkcNKbnVCfICqY5UnPME31HR1tbMDf97Sm7Un/n?=
 =?us-ascii?Q?L9xoW6TvS2PztSEAiMVufxrrQ85Wik80s1urOjI1?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5c966c-401a-4774-7bf1-08db83ccab3e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 18:12:07.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHc9EYrHu3eczezIavPwm2QZY5juX17LrZgXIt3K4n5T/C0U5+fDlbK4bSl5xNYwwPfYlBugClA9oXbgezjDdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB6744
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Point the OF match table directly to the struct that describes the
device as opposed to an intermediate enum; doing so simplifies the
code and avoids a clang warning.

As part of this change, the I2C device ID table is removed, as the
device cannot probe without an OF node due to the unique nature of
the hardware's interrupt pin.

Fixes: f2ba47e65f3b ("Input: add support for Azoteq IQS7210A/7211A/E")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307131717.LtwApG0z-lkp@intel.com/
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Replaced of_device_get_match_data() with device_get_match_data()

 drivers/input/touchscreen/iqs7211.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/input/touchscreen/iqs7211.c b/drivers/input/touchscreen/iqs7211.c
index f60316d37f45..dc084f873762 100644
--- a/drivers/input/touchscreen/iqs7211.c
+++ b/drivers/input/touchscreen/iqs7211.c
@@ -2420,33 +2420,24 @@ ATTRIBUTE_GROUPS(iqs7211);
 static const struct of_device_id iqs7211_of_match[] = {
 	{
 		.compatible = "azoteq,iqs7210a",
-		.data = (void *)IQS7210A,
+		.data = &iqs7211_devs[IQS7210A],
 	},
 	{
 		.compatible = "azoteq,iqs7211a",
-		.data = (void *)IQS7211A,
+		.data = &iqs7211_devs[IQS7211A],
 	},
 	{
 		.compatible = "azoteq,iqs7211e",
-		.data = (void *)IQS7211E,
+		.data = &iqs7211_devs[IQS7211E],
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, iqs7211_of_match);
 
-static const struct i2c_device_id iqs7211_id[] = {
-	{ "iqs7210a", IQS7210A },
-	{ "iqs7211a", IQS7211A },
-	{ "iqs7211e", IQS7211E },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, iqs7211_id);
-
 static int iqs7211_probe(struct i2c_client *client)
 {
 	struct iqs7211_private *iqs7211;
 	enum iqs7211_reg_grp_id reg_grp;
-	enum iqs7211_dev_id dev_id;
 	unsigned long irq_flags;
 	bool shared_irq;
 	int error, irq;
@@ -2460,13 +2451,11 @@ static int iqs7211_probe(struct i2c_client *client)
 
 	INIT_LIST_HEAD(&iqs7211->reg_field_head);
 
-	if (client->dev.of_node)
-		dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
-	else
-		dev_id = i2c_match_id(iqs7211_id, client)->driver_data;
+	iqs7211->dev_desc = device_get_match_data(&client->dev);
+	if (!iqs7211->dev_desc)
+		return -ENODEV;
 
-	shared_irq = iqs7211_devs[dev_id].num_ctx == IQS7211_MAX_CTX;
-	iqs7211->dev_desc = &iqs7211_devs[dev_id];
+	shared_irq = iqs7211->dev_desc->num_ctx == IQS7211_MAX_CTX;
 
 	/*
 	 * The RDY pin behaves as an interrupt, but must also be polled ahead
@@ -2554,7 +2543,6 @@ static int iqs7211_probe(struct i2c_client *client)
 
 static struct i2c_driver iqs7211_i2c_driver = {
 	.probe = iqs7211_probe,
-	.id_table = iqs7211_id,
 	.driver = {
 		.name = "iqs7211",
 		.of_match_table = iqs7211_of_match,
-- 
2.34.1

