Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7865855AFDC
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbiFZHZG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiFZHZF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:25:05 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4A910572;
        Sun, 26 Jun 2022 00:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InFbc+CwVVNmnX5v2TTmxYf2ph94Id7IheL/8hHVwJ7tH2PSkbnFLFby4z+NvJoVR+AcJwxNyLuONQodEYHNk0LVxhCAo2THp5e6FPlMYQsqp+inVvHB93/gnZkRRO9+Vh6Hz0JEy7XCZ0LUkS+WsIXVg5QM+qEY1LeR5Mo+gKTlvizhttdSY8K87mGeOePNYu2sEUdPexTTFLDRz4U675jJcGGS/LLDqxx+FsRJbGt0FMxcDnedcM0bZ3fzT3gOZOxv604bNpq3mkysxO1M8fAa9DhYFozj+ZBboRTemcO2lE7euYhd8nqN8Uct5H+vcTTeSr4AMdx0FYuytK2w3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIARJkYz+dOKtEiLEfzxBg69e71drhpaJr3uvXeHQas=;
 b=bsX7ok6govayKrVsfi0g/uCCNfBssZvGdUyOFynoBXubisowCF0JwIXqc8L+JJwTx/khRwHdUicbhMOkx2GtQdDyQ3ASe2WNJ8vKXScUf517E8XOpG2GlD7f+UsbNEFPGogezmX6xEtm2sxQYUpY08U5wAJJmzuaItudjJKKPXWwW7K+ZjG/QWhQwWzkofm5u1hiHTbOcs8HdIYR4cRsrGzsTOKEj2Cjm9HpO4Zv8RpSlTNIurPoTl4PF4tl6qgj9B8IIoI1JHuV8uz0zV4ie9dHAwK1EXcvr7pEkftZ6PbTHa9ZoDwmKOPkYQ96pymhnxQyNhvbfgyAGyvnYUqbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIARJkYz+dOKtEiLEfzxBg69e71drhpaJr3uvXeHQas=;
 b=JIMlxgTa5zf8FTFPmDTj7tcTqlRUiM9K39p2aRXug9Egw0wQPV4ZNKfcUTUrEUuyleXMpmVjRBI8OxKxZLSXXj79sDilq2wUpabR8hRThH/f8aVCl2le2PPjYOhUyrJbuIFFFiaeqTY180pR7NkCN00Xl5CJMZCFPTOtqRXdn00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:25:03 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:25:03 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 6/9] Input: iqs7222 - remove support for RF filter
Date:   Sun, 26 Jun 2022 02:24:09 -0500
Message-Id: <20220626072412.475211-7-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 56371832-58c5-4bae-2dfa-08da5744fc84
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SD+02sPcd0R9K6pxYY5fF/B0mfisPI+ZChSd8zLyIlHxzVE1BFHQLsik+G87a7e8AHJSVOVGre4yuIEnFsVN0KtEFJuYGuTT08cZFl6WZHOOwrohI2hfSWy9dlqKaqIQV6N/X6SmcbEpsxYg1GoDQIfUi2ZD2TnIPZP8WAKxpdZln6hNG2hgRC13FBq/KGtXyFXbICQFaJj2ibyP2zPFp30Avtoc9msLuWBOPmnWndJzls/UF8a52Yr4mGZKA1fNnQ94EZU30+9LNoZO3Ui+5yXNkFYOoWJg593sJwrSdkq+SFPIZbYATQZtZmaM+D0fxOwa9l+LwTlBLljD9lyz9XRQiPKxTy9duCML1bs3/5QOe4bTd5QT75xREhRXAX+Mj7j6BLPoY0+5P3jRvABIz2O7GqTseYudQ66jCG7+GzGw0RSj3v5uQhrocGsIg816yFABttrZwEul5DWr/jcG3saUMHfrTCUKbh/rd7AaMgcB1wxXoI5PWEWgtztpJ7z/cmUr6I9MXw9F4VDujCHuAoigRrM8+PXVxg9Oa6jK+57x5+0UReeETepfmLC1BQ7i9FmnLhsh8Lr/x2bUMqcDjfkHopQyqhptN/t1J//UjyCCGQg1We4Hc7kfSfeusJogzaEqEqXiPJtcKzQRfZ84j6wOX05Gx6ojC0VZFLi6KdWrkV0LHpp3kXsmMT0JoJjZ0y5dCxhQeiXi2w4YI/d9+elzDRcoykJglwrxNHqrK9M7tRTJxrweJ5zhvb7odHnMR8A8wh5rF9YWz7amBqBfJ9yuit4YwyQ7uPhiKJ/64A4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(4744005)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iPUavq9RtqEV6yK9yX9EdlXLpEJUkTrT5FW3ixB4owpUQ+fXAeCgJ84GTHwv?=
 =?us-ascii?Q?2sCeH0BAF9YRIW5D8kbIhP2mEUyJ363fycSSPcpWczKNAZfUtduS1WMKiyAA?=
 =?us-ascii?Q?6ORojjgMPT0nbdIpHpDzdD9xXaPWKmA84YgrYtSY7OD/gX/jpgQ5qoNoATUG?=
 =?us-ascii?Q?Fw0iDq/DpwV/eVenr6wDEFN1v7qYI4vs0H3qjU3Q4ZIiwB81xQ6suZjTFNvP?=
 =?us-ascii?Q?+k4M/TUs0SOKgQ2+MrL/RAF04hxTNu0eNeKM6HjPn6WMzwaXUWx/3AQOkM35?=
 =?us-ascii?Q?KAdbTb5MnkO+houxkdWcf342RoFrtx7w/Qc9e6o2PqfzR90OSV9E39twEpOg?=
 =?us-ascii?Q?r7SzajMYreg0dRF2U/VpCCJ0LN93n8TXXK3Gr/uIC1GJ4DdFn0+QEuz3oMkB?=
 =?us-ascii?Q?Wz38FU24RRHDiiegBgAT7PgwqXFUgaFW3ZBWXP0PELW0dmW2mLV6ajrplC9U?=
 =?us-ascii?Q?ZYNIgELPOt3AeW7MTB/jA16h8aL6glwKBJ0YdpupdO4JFTlDN6VG2idX1ycP?=
 =?us-ascii?Q?5clOGJnZReXkoC8++WOQl3NhQX421L0Z40CGAgwlkVEXwQnJU6+SNxgB6gvo?=
 =?us-ascii?Q?tEO+QVF0N2ToTy/CzXE+BceO25NscViHk+gGNv9yfJOybaoZdHiOMx+bFD3A?=
 =?us-ascii?Q?3r6e0s3nhFhabVQeiIOM+sO9jehmfJey5A4pGMwcpmurowGZHMpBTjUJqyiO?=
 =?us-ascii?Q?D7S+ebTOe5rsLwjdYUCJPhjKMkCn1dluCYJWe3J7K7I2JsGn74NB0tSkOn7G?=
 =?us-ascii?Q?uITKDBKK9gkLFHRWZPqm2PHIMrLMFIBWQJdzl7g8ucCNmGBAcRmmfq3wYuvC?=
 =?us-ascii?Q?ci9PIUTShroZ9SC3G2rSaYx4oN3mRlVNvbNmYlj1LM4iwSPfccjrpHAQLrtD?=
 =?us-ascii?Q?GzbjhphB5c1SEZInAog+piNiw0QOptlFKoyEnha3ZREohTWwNY/u74sfXbE9?=
 =?us-ascii?Q?6XtABiOb8qsSoGC7m6fKCb/FRTRX0lXz2bsncYKlb2yrPjdW6E1vtjWyTcwd?=
 =?us-ascii?Q?172Cipf9o6HpyHcxJQkEPARQVeFucXDh7ShMMUbDPKZqfx+qYX4QFAtLQJC1?=
 =?us-ascii?Q?TDDWk8l1hNzYS7lF1l6HiSM4j/64gg8zgX2ib4j5Ul82oTo8PDij8IFrhXZL?=
 =?us-ascii?Q?VKeHOZjtyuucsitBcPxsQxNVHbtdaGiZkw1eAwPvR3R6WuQV/fCKIzlDk3dM?=
 =?us-ascii?Q?azp2Sy/ypJjsMyNUxoMJITnxnCQqypVGBSFB//vw3IUDt8u3EW4xvcMrzaDn?=
 =?us-ascii?Q?YNCSumw2sYT/hm2elCqZ+6uFvYsH2rqae/WxU75/Pqv1lQhupJiBspc1zJMC?=
 =?us-ascii?Q?xY/XU/rJbjgw42roWyQD26cebpvouMktxX7JXKvSNVXbWNeJt11i4AQNFHOY?=
 =?us-ascii?Q?wUGg1upChIhzN3AxULMIVZvwLkUbPLWhPGdsb259zZUM35l8uqUeQeR55Gjz?=
 =?us-ascii?Q?BpyZFaCAjr4dqAlXM3bACveAsuSXHeqB0VSz3x7fHis4aM6YFVJ3GVf6+apG?=
 =?us-ascii?Q?BX+ApjNKahOcne11HuF14z7RelYFYIDpCerRHHjleUAoZe3Q7dvc3pjvDrbW?=
 =?us-ascii?Q?CoBXuTlDe2roriKoFS1par2DZATWASnyKfMZfqkI?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56371832-58c5-4bae-2dfa-08da5744fc84
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:25:03.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MZgv+VagyhB10uvuMUcnwekGi+T4bFj7gDgGJGoRqPtjtwIFaYZyg6+7ApHbrgv2qOs/NdxgdPjqTKOHSLPhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor has marked the RF filter enable control as reserved in
the datasheet; remove it from the driver.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Clarified commit message

 drivers/input/misc/iqs7222.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index e65260d290cc..b2e8097a2e6d 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -557,13 +557,6 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.reg_width = 4,
 		.label = "current reference trim",
 	},
-	{
-		.name = "azoteq,rf-filt-enable",
-		.reg_grp = IQS7222_REG_GRP_GLBL,
-		.reg_offset = 0,
-		.reg_shift = 15,
-		.reg_width = 1,
-	},
 	{
 		.name = "azoteq,max-counts",
 		.reg_grp = IQS7222_REG_GRP_GLBL,
-- 
2.25.1

