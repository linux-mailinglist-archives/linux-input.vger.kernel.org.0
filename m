Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA7F752803
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 18:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjGMQG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 12:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjGMQG6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 12:06:58 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6773C1BEB
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 09:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XufVWq5WBl0M7/+yE87iwUt3wJniX7qonbUh3D4S3+szkjo2QWqVDs9Tn/iH2S0XbrlUYO5Evb78W7w9NrHo82P1PnyIz/YxxxDlhCfUmdCPy/FWRQueZRrzeCXkfpksnRqSE46zvCoLd9deGzmcNCTWYxWJOy44a/FHlBfOq9KesQYPD5wpNwvghFFu2HRZRLzVxaV8nO3S4HCmDIHFUyULMcMyis4gnZhbXG5P3whXiwz7qPLa5RYo3ZPPbw+juoGtmakpGHTObDAb/kcud8J7pM7PBjXpvq+OwofwHEFz5ZCa9sKHUrjkLTrWTG/6hrIYZ1pxI+eiMXnP5a7FaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FhaXKmVh+588uR+NvUJBLu8C6T5hiuNaAv2FT+0hAk=;
 b=AOOEHchHZWE0a7qk5xUi54eZ+cubcISa3yTViSAQD0vO1zAPMFXtRvpah5C2M+mdgy3X7BS8NUawlrOVAdOIzPa6uVJrOEV9CLhfE4jJpJTRcXauYM7N3jfmHvJNdLfvl4NbStQ6RubHTkKcVIXad8WgHcUliAdp3cP86I8KyeP/fpG8XwBV32gYRkLHjC5ULQP2B2X2f7tIydxstjlXC3ftAdHGHhUik7uHBqQeNBehRSdWkAW/nLGfdZSARgCUZhwTRGH2gltBqSwcdC6ZYPeyK5xhFtI6k2s/UjAFbK2CnxlUWFkZEtF2Py/sBtkRB+mkmmyPiOzs58pIJbG7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FhaXKmVh+588uR+NvUJBLu8C6T5hiuNaAv2FT+0hAk=;
 b=ghHug61ZKZc/XQZ4ceALbH42BiRf9uejhe2O8FRSrXAVJoGOJ7UwWzj+hF7R/99AT8r8zK0OURIHDLMIM75Fwx/CJDzgawrk057XbIXqHwk37a/QtDReILWVgLpOcfe8802d9+rIt73UtfhQ5XIqdhA4ZkxBoBMse3bx69tKC7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CH3PR08MB9339.namprd08.prod.outlook.com
 (2603:10b6:610:1cd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Thu, 13 Jul
 2023 16:06:51 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 16:06:51 +0000
Date:   Thu, 13 Jul 2023 11:06:46 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs7211 - point to match data directly
Message-ID: <ZLAhFgOatNoReBa2@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN6PR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:805:66::27) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CH3PR08MB9339:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd16f85-4e11-4ccb-ae4c-08db83bb2afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJ8vngD4WCJBmc07TLkzJ4vjxrrR4Hwy682lQPj26s2k24NNhZD8uZ0QO2GGICARX1+mZPOmj8BOXm7EsHjJII59YvXGRsFX7AoB6g2E1EYk49P76GaRDMRwTaDNV32xzZLWxIGSmLW0nNY+RolapAydJfDpvp0RsX35ndpqE83vJfFLJV4e7DSpY3t3DVrcm4juJZ31S/T5TuRGmMD6OkSr+DZEVolxh4OAWvLRceftNs9uTFBaTXThu6Tz7MRyDyDy2rSgijO6Ke3tRWO3nwf5oMu8QNiFtHBDEFH+qicPqSx2uhE1uvSnz4f+pSe1Pll3d4euYKCdqzA3unHUgJ+TUsafm343I+wg++oo+PdO+t39RUnwKj2QQq3S2oM5F0UXwT7B8VOJ0jJEUqnHrHg9QVPYgHQyjcLmJEyTx1ugECIxEtcQAqVvdu+2IOcm2EEjgmHfEgVsPswUtlf8mqUvv0hSp6J1bntegoYLUKHro7WRJjkDsR8+vD/VBMgLXHk7Gei4uTroLzIx6dO7eSzm/sSgEBejSM6RZa65Je8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(39830400003)(366004)(376002)(346002)(451199021)(6666004)(478600001)(83380400001)(966005)(186003)(6506007)(26005)(9686003)(107886003)(6512007)(6486002)(316002)(2906002)(41300700001)(38100700002)(66946007)(66476007)(66556008)(4326008)(6916009)(86362001)(8936002)(8676002)(5660300002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MkTCBL8nTP9WeWGdV1onRWlYp2uQvgMQfrsRMnea6eGnvESX9QjrLdd2D9Dx?=
 =?us-ascii?Q?Lk1vLRViMc3Dj9gsvZH4upsBTzlUhN0j9h0LS6X7ZrTYhzwk+tlyVPKAm9ce?=
 =?us-ascii?Q?LYj6HKYthJeLsi0DR+x3xslYCyXnSIbJaKnsCXzPWIPjiuJxR+t9sqqUkWtS?=
 =?us-ascii?Q?yWeSBOQ5Al6+YxJoNfy1KNqLWiTGL55bcwIiJN63MfNNghHfpOfLtXifgjIz?=
 =?us-ascii?Q?gSPOACiQaxG/A2LVG/7DhwqzMHj4YetWNR0JTcqk4iQFWM5JoCkLJuT/ObbV?=
 =?us-ascii?Q?qG/z+q10YAzwwCCwnUiC8Y1j+I4JsX3v47N6TFobrRCbuaaJZfkcJhpJiKtD?=
 =?us-ascii?Q?3TqluRPu9V+M+7lQYjiyKBKMbEgXklBje9u/SUSHiM48M3k6F7iRzmKlHdSr?=
 =?us-ascii?Q?n8clqTB0KwUU4ZLTKoN+G4Sa131nCVVqF3V+hVM4JxHEizu/uLWrs0hIZqcI?=
 =?us-ascii?Q?Wegu9yFxY9He6ATI2B0ozH95clL98aLphvv97AWWr8vRuV5pwi91p187h7/k?=
 =?us-ascii?Q?q8b/8/CUQJZwDejQpu0udwFEC0xhLju0ZD8jmBu2qbZYwKZM9pd1LqR7A/DW?=
 =?us-ascii?Q?5AMDt4HHlbSBVhnUvwK7mpOdyxun+PpCy+pYyztO8fHKaeWIuEDMek6jUV26?=
 =?us-ascii?Q?62GaD/7vXAli3RBfmtQsWvmCRlzOWk/QjkL7mUOj3n16EyeAkX4BSZ1aDk4s?=
 =?us-ascii?Q?gS/WPGx7S2O3ldrCK1E1uHOKMyEERaFSMImOye+0CiwB0AGXaUQk5fwXuWeX?=
 =?us-ascii?Q?cL32emLvmvLeoRPEYQt/yo7YgLj1WDbQzzu+t/PzzmBQyoNv63ICAJNYUQ7+?=
 =?us-ascii?Q?NBI2WnUe0YgPJPUL5pQQJf8e7UAxDl2ORdkSF56Ah9aqAPb8F1x9/2aY9CY3?=
 =?us-ascii?Q?N7ClLHft6JU03dGXJ0xL+UaIQLvVzFNQ6iMd6oBQ7FJI//bww6Nzgv/A2hW3?=
 =?us-ascii?Q?yL7XM8kWZQ28pAjuGFHMVitSlhtDPJ9ac3cSv3aQBgI7uAAawVhjGEyClFTC?=
 =?us-ascii?Q?YWQN8oz3JfYpXJ66i3nOc43B5XBJ0HXRWXRdv2Y7cQILOfF17F7dHL9fBafo?=
 =?us-ascii?Q?zcMil3u+LrjzoPiX+zEw/kYaLxwO+fJfIv/Y0iM4aYGDnzO1HordK65u7HDC?=
 =?us-ascii?Q?WwuUTeV6Z2WE52kXWW6R+b5wf84+dNHoOs40vd+5cfJL/OSll4qNnxq/1hey?=
 =?us-ascii?Q?tYzDlWtEaMzlInA3+k+/IWMRUGDGw8/+KbPWEQ8DC+/2chdyyRakguwcNSPl?=
 =?us-ascii?Q?MiYI2DwRfJPgSiCzFXVWsbRzsnGzrcU4y0Kml8t1qGr/iO2S+dX0+Wn0huHe?=
 =?us-ascii?Q?QGCC0mhAxK40hW+G9qyc/5z9z7ZPx89YT72km7Tz0TUzD5cP4wFrt1ASt5pq?=
 =?us-ascii?Q?gS+jbSI75d5wanMSU0rpUKtX/LDiOVJVvUEET3aXRKXTPzC1trpPz9f8CJ2a?=
 =?us-ascii?Q?rbTm1UY5O4kSorqbP2Ds1202AdUabtkH66cRWefi5fqu3LwDWnLQTPoyDmVp?=
 =?us-ascii?Q?wUWl4MtQ95PD6lpLd81gOkVgAIF2FpxEdZ5JLDu0+zz4qwfh8hnA2LCdj7If?=
 =?us-ascii?Q?ImFo+VVoiwuQME+K91m0TgJeqYw77szi8PBecu4E?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd16f85-4e11-4ccb-ae4c-08db83bb2afe
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 16:06:50.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7E0v30QKVU37fmGqC9tKIAEFlrlCi4V4n/eFBIBk+/Jp7WgWhfAn22HDxYQyPWWqDq+TMhnP8/Lb7oh+YKbsbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9339
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
 drivers/input/touchscreen/iqs7211.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/input/touchscreen/iqs7211.c b/drivers/input/touchscreen/iqs7211.c
index f60316d37f45..d41bbdd096e7 100644
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
+	iqs7211->dev_desc = of_device_get_match_data(&client->dev);
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

