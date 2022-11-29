Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 634C363B87C
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 04:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiK2DEC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 22:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbiK2DDp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 22:03:45 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAB64A9EB
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 19:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTOgazd8Jtq+9e9g5TqKIewK80eY6pEMFHZPaU307jMPy57q6W8VoAnhBPPcYR3o70jXHCYHpdzcqVfup7KgK+XcO9BBXBgl09zlqiz78eZ5attm6K7ZH/JS8MbQAN6hKLFZ4OWPpSH705xHH32GJeMB9QWtxDBmtCuBv98ADB2jhJabA15hiYx/UBJH7IvFw1LNny1NNYYu3n9Ci/Oj0xnS3bR+8+qQMh2yyCT3dOtKtlhKXXC4edGYJFMNQ0R/KImaHyJaazCTBgbDu/MPlE0DgxbceeHWcv0ULxryCvo/KHmnmskPCiylvOv5tv3m7vBJPQgRdG2R65a9bsoH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoolyEDq0mbqRl1f6bE3MzSxx1uQGtKMf6aft92SAc4=;
 b=AsdUfLNxQKatclDGBY9ePBDI4sHslf4LjTcrWRVTFmVY1TqrsM7kod6m1bzETDSLqaWEIJje20BqjAQHm279EwR8Vic12F4Ubm2Kew9ZzBy6RvOCIj4R+zPxI6XcybxEEpJa0afuAx4KscINc9dsBT9VbDKQLL0rauHg1HLJZXX0A3pCjUfOciGfufJzgySSsBBOJIDyMCbyVpfx2tPFJXNtb/E7BDPMq1xCi9t62mKRC6lSfjnX9ezSuJkjfnulFdRZvdKw21fklI6Na4az2j8K6DDXgNFpcCxrdC4LKv5Mqk0KrEZ+Dwfvv/5aNKVcC9iibDs3JFuESzZIL3+GZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoolyEDq0mbqRl1f6bE3MzSxx1uQGtKMf6aft92SAc4=;
 b=Y2+QaBHHvXSEQP6V/6uPzbf7zDk6bVh+D+m/bQk5u5sPgk7V4hgTP++wpZsqi3JAZ0epeQAP4RDeG5IuhldueSmvtrjtx3oNkInZg3Wt76jfK4B6vg6CdPQoxYEl+kBUnPUgP92GtSfetRqVc/xmnSch2NyObm3awKXGZYxHtaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BL0PR08MB4546.namprd08.prod.outlook.com
 (2603:10b6:208:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 03:02:33 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Tue, 29 Nov 2022
 03:02:33 +0000
Date:   Mon, 28 Nov 2022 21:02:31 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH 2/5] Input: iqs269a - increase interrupt handler return delay
Message-ID: <Y4V2R7GB48a2BOke@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4V16ey6osEaaZJ/@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71>
X-ClientProxiedBy: DM6PR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:5:54::24) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BL0PR08MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 550694fb-cc4c-4828-649e-08dad1b62939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0sWDHyRy+oPH2du+sPWYNTqpHTpNqJ7r4Z5FhTzQ6LlnFdxqmEft/FDihwuF1mk+In94NVHj+sS3Yw87LR4RDJcX1ca9XkPi/2feVviue6nMDd44HKYQNe1TEWzMRiYFWEnUnT/cE7Pv8TGSBHePDakfht3bbXT+4uY+iJL6hr7ngRhUoI0O3mMShDwsYorqOUq1F8kaJSW2zaYNgIWRcrYeM07D07qb3H/7tvbuO7WkNJMqN3k0S9HKYlB15nWPt+yQU3TULMY6DzHzltLWKpbRPhqk03o9urpyXkF0cehoQMd2cgoKycHpcoSaJPrTF/Jk55CPHoAxjeZgm8b8ooKwRg7C7AJJaoEllMap0mWfeY0Mr1GrHM1QT9ZpHRJ+CXnu8cV5iTY+/Ji6odOV5zNvVnccJBfQMz5u2ExmeFNDraUVNtW/InBe+dEsPqP6I498OGVffpu4DR1jM7g3N/ppBrNmY7x89Klw74WJl7+3YP2hxHjCMQbp9fP/rnaXmwCgHlmkVeXbgG+Fj/dA+87WoXQpVj2p6NUhg3WMdAcJ6EtUK+2IzAbqKPEGt09K6rPTAqnNCDXENPx4BrRJ+AEnDDhKO5xBMvIJLGDJFA4iORIgtsWWKg14yM7bqZh4PiuU37QANrOuyXs1WPFDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(346002)(376002)(396003)(136003)(366004)(451199015)(66556008)(8936002)(8676002)(66476007)(66946007)(5660300002)(41300700001)(107886003)(86362001)(33716001)(6506007)(6512007)(26005)(9686003)(83380400001)(186003)(38100700002)(6916009)(6486002)(478600001)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqCGO6IQCN4OjznKh1S3Vbmpn65sTDm3atY2AVqhwYGJzV5+ifJUC52AuTkk?=
 =?us-ascii?Q?+RF3I7v2V0EEh3jEEBhi932lDgvha9y7W5uq16HPfDU/XW9l1dQuQX+1qpLf?=
 =?us-ascii?Q?GrrqjMtArLfTrylYZCJNAN5xr9k23hDaA5hf+qnq6cupkVxxCVW6b6oU82yW?=
 =?us-ascii?Q?s2VOVKkdTrBq9CEh0YjpNpWpEk8IEZ9+S85YjbzWVWXexyup0XRqsbx16TyR?=
 =?us-ascii?Q?JS+0jqUqPMB4i4Wgo6+qctqE7PuPDX2M/lQhJbPseaYX4AfFNJSqu8BDO2wu?=
 =?us-ascii?Q?WJ+zVdv8AZCxeq5DWNfj7klE8YZsbEuHMYYajujfzsC5Ndj6h17CHfWSZj/K?=
 =?us-ascii?Q?MAhaVl8GLQOUqXUCmbY8pC8kIgQX9/JmjVtm43tccOv80GBybBBHv579ZCCQ?=
 =?us-ascii?Q?OCCixifTOkV6pimiB7tMlGD4iBXKRRu8JPAMBpy44Vnksz7jTsVHk9xomNjC?=
 =?us-ascii?Q?YBr0CXI0tklXaD8IIMEHSGBWh/CUlW+MNzFPBoSnDNAYxjB1KemtTk6FFzcO?=
 =?us-ascii?Q?dqPx8cj+ta6HdIdTrNGHCEcIVSTwNhEAUgW9GutZEbTAXUpTC0djaEOxZo7W?=
 =?us-ascii?Q?LSoe7bBB+WH7lewI6sij+mDPGuxOaGsVdgls2bRzxVua+9IMgwB92foe6DBG?=
 =?us-ascii?Q?MPlFcI7o4fyUuVkNzY18y7ZvV/Y+d0HhPtj9ZhWcKAtP4HDijZXyvAo3lyIK?=
 =?us-ascii?Q?oCASxinlltzytD4GWwmOjcGL4wM2dmeyhRV6NZ2B9BuQFoM7kmjADtBZPpVj?=
 =?us-ascii?Q?navQM00Ue3dMrQEjiwc6inl5YK5JY03cIUhBlgQorbV0QR+JYBwLLW6+F595?=
 =?us-ascii?Q?C8RR94ZixIKgeRVNZoo38b/Pn0/dg2URVQXU+EgRtH8BUFw9DqTvuZqC+ryJ?=
 =?us-ascii?Q?XyRP+Lw7FVp1dtEQBBnukM1tMF4iyUY0Uq97ivlI+zGZuxScyFQdsQQByV5f?=
 =?us-ascii?Q?beIjtokVejY+MJXLPcrHWs/LaU/OSwGbmenJN9YO5Ihlix44mlac9zoYZ3uh?=
 =?us-ascii?Q?0tErHr/g1THKsq3SbZtydPfIZ4eO/DzbrIcCpcmXzqtderyGmUWBd5g1TKKH?=
 =?us-ascii?Q?cCrr1CVqLBb0Egk0d9a1TdNv+tQXR9YLOZDlfEIcyLlT3WhWxpaHSZF2ViBw?=
 =?us-ascii?Q?aoPruMnj9LEBEuaN5jxyYulsKIHSRawctTKINuPge2SqMijO55bW6fN8/W4U?=
 =?us-ascii?Q?n5Djw+I43cdAJQuH6yBUqANHkbdUvKtvrbtrr5kBeQN6BsyXVt03HWoYKCxd?=
 =?us-ascii?Q?T/QFmyCRl1rxohwMDbYsOotJFsqFzA+awX1B+l29BSDSrHfwJb116R2SuMRg?=
 =?us-ascii?Q?HcLHm8aq+/7E6QFHqGHAJ8TLF2wn1FGiVUqvB+j2lkFy+Xfw1zeq+ThM50c8?=
 =?us-ascii?Q?agK8ONkBvKtPKl/W2veAS0bf7UE2Y1os6n+Q3xuptvhEaQIKWSA0uIOjTlkc?=
 =?us-ascii?Q?yEXqpcESDkzsLxvm09MZMYc3T9DGIrkeA8KI92VymhkFlMBf8PYVbVXBRkN9?=
 =?us-ascii?Q?+7TGZbTVPRoL6Da/LhV0fQ5PiSWMAsHBYn0KmF4ZthflVNsnxUS+eCTisNAW?=
 =?us-ascii?Q?Syfy+SXIfHhPY+kOtRLsZG79AHjLrWr8Ovd0PgKZ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550694fb-cc4c-4828-649e-08dad1b62939
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 03:02:33.3476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab1rgBXUiCNMcr6SGdwrREhKFseSBm5sVAVWzM808pkDt+ctX5uZr2uzvAGM5JXUHcZSqDwrwHeuyOL8DNGZ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4546
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The time the device takes to deassert its RDY output following an
I2C stop condition scales with the core clock frequency.

To prevent level-triggered interrupts from being reasserted after
the interrupt handler returns, increase the time before returning
to account for the worst-case delay (~140 us) plus margin.

Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 5620a009bf55..711e67db71a4 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -153,7 +153,7 @@
 #define IQS269_PWR_MODE_POLL_SLEEP_US		IQS269_ATI_POLL_SLEEP_US
 #define IQS269_PWR_MODE_POLL_TIMEOUT_US		IQS269_ATI_POLL_TIMEOUT_US
 
-#define iqs269_irq_wait()			usleep_range(100, 150)
+#define iqs269_irq_wait()			usleep_range(200, 250)
 
 enum iqs269_local_cap_size {
 	IQS269_LOCAL_CAP_SIZE_0,
-- 
2.34.1

