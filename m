Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F5B55AFE5
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbiFZHZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbiFZHZB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:25:01 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF9210571;
        Sun, 26 Jun 2022 00:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlPj112D1DO4YNJbFuAlyGVe5EYj2FRSDjABMf/p/piT+TPdC4F4fFAYxXU25HtP6zUaAn5sOEA2UuSiEw3bD6mTnLeAU3pX+/JSDYqX7tzYlDmcJVhuQsh0A4dREaNa1OaMZQACUjsLg3Af11eNnBxqwlGHAb3HUfjExWNKqT17YY9SzaBhkWwXi8mawxmwgACD5DbJ1HJdDKJGnBnvDaUHbciwVssaS3eSe6sglbzlmTvEZZRVJpK4lTwxm1f7kTF0CK2qF3bm2/+FkpqnYJsQ6+BOSe/jy/LEW3O45V4pNqQ7X0v0Ebx9PqbM0dWukU+rGlr11qd2bfeQPLT3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgTI281MornsjlatUlOhokJU1pCJWeR8Yh3ZBWRdgNE=;
 b=ec6ryvfJO2zYm4WgsPT2DCi3zIinHsvTRmpbbWO+sIQrIwhdIpvlxXC30FapcOlQ8KxaMgGOvMtVRgT0rtWqpJ/TD0IInrwGtWG/JXLAbfLVcRysYm+bb5LCyNALP14cKyUhlNhYYK6e/BL691cONIyJYjCJ2yFWXTlBoJRUFJlJu+ASEOmAHMSTTyoc/YO25XVK7WSL+o1MJSALYZh8HpEMHB0CCv279mkhb48S2dPf3dXFx/SGakeYd3wVpAh19Yxjb2aYtglJXRDOXMe8AclyBRh1VidM6DuD8IqPRYUmoKUN1tA4oIOLLp7Bb3/+HatF8SZLGZpBg0Oo2ZZjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgTI281MornsjlatUlOhokJU1pCJWeR8Yh3ZBWRdgNE=;
 b=GLwILCi6qFPKkCmb1UxQN+PC8rlltf3dDm60MNco3JLewry7nepX5Pzy8wcci5QqplUu4ZfzOR2Gj6m4q9KQPrruFK9DjjjSwxVtfG05b9QxHx4kr53d82yonaZ+cpAx7BfsgHbgw/mr4S8jKxvKx7KBSFSwjPuIsZ/DOWDCGCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:24:59 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:24:59 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 5/9] Input: iqs7222 - handle reset during ATI
Date:   Sun, 26 Jun 2022 02:24:08 -0500
Message-Id: <20220626072412.475211-6-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c857dc8-14ca-4af1-7d8b-08da5744fa3e
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 383JZX+aEPeKNfEpDjIufNVkK3s0cLZ9RWZhwRggyJan84rKjWbBoMMBRmHN76Wb2OroL5RrqzDx9KRJhCfQP8Wl0Gh8f8XuOEjv8oFXY+cnwD4CYS0lbtPxszBWph4sl7Tb2gfWdYrtmbCxBpFRa5XY/AGfVsJ+PapYF/p3NfLmnd90ajfbCwIMHaKF0Uz7whfsJAEEWTDN9TjqEgyluTEfHI3K/TNHd+XizO3iP6DbySljHj1cOIAXr4tSp6dgAndSqkaQ/RpHYgY3PFk2RQAyfudiYIb01iPUTd7qQNzLPjmMKZ7jLgSr2gVEtWjHLF7OjDtdcuq1uJNWCRqI8rANjwJfwGFwrY6AmE9GgQeyseKRgg9A5B88zQ5h5wfyVIUntIjIDWm320zlUGhzjwSH73InMBqGWOm0cWFh697jp6gf1NMvEPtBo5NYJm7LU9g9h0QsGVjkOQN+DPOz+ZHCN/q+ARcVkvsVWmDvKjilO5QaXtAb/OOBZAylBhNA4L5fntYRPPGYrhLlgS3bfWMbBhRkaD27E+ay+hsZqoiQ3hY0uFTqnQClio77xJ1am3hoam1a6z44Q0HFbCj4sKw4GLKyDuBwiW6OAf2mW1Lp69VzkWLFjXE8D6brbutzFXRshp7GfpRez2OmsuFhx3aS2iCipMTALVNBwhpkq0Aq8tRBUc6Fdb43JNZlC2bxGtCCGkzA/WBoNMrSaiWAdko5PaFt8CJGkuBk6eAFeFu9fGRHMMqBR4mx41JhfhRQ0lRUzBy9M/qo7mBaIqtwLvKRGobpEekR1+f2/ZuSMy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dkCvpwNevog0SEZjY88lXlp25UhGQGaMTLHawUF2hL5LQMsU4XiL2VWHzhZE?=
 =?us-ascii?Q?3u6Us8okFyqu82y4vQeiKgaCqmnvHqeXQVzG52LivcHVBSdDErQ0V2ecbm9V?=
 =?us-ascii?Q?AorpqCLTcMO6qabpee/EW3PhwuScXVyOwxHpumHER4+r9osnPcTpTsW24hNe?=
 =?us-ascii?Q?N1j7SzEUuaaQjyiMS11IUvN6M+xEB+dlDlW105amJ+KkePB4/U9Jx4qokl1h?=
 =?us-ascii?Q?HkHjitgS95qI1f834poVUbfLKAHccPtFfbjpFwke6/Ouv2ML+BJPYtgwWBoZ?=
 =?us-ascii?Q?cTMjDwKNlCCfzw5KdAPUG7RcaOiD41pntnSXuEtoHrjlXm9NUS6uBtxGDald?=
 =?us-ascii?Q?Z59ecToBqrs8WKbhcsUBcE0bRL8zJcXOC0BWEQZ2MKM6KziQ1yvY2+XCQBvS?=
 =?us-ascii?Q?p45eyUTMv3qy9Ac2IBgODAFDpNkgg2x05GKM22bHu+AK71sC/3OvPvvF2Ruk?=
 =?us-ascii?Q?zbGTSA7owTbr2lQuQSyvQHdQ6dqaUgLC6cdSVtkx/t1GAxz8O9pcKNeJPz8a?=
 =?us-ascii?Q?133/KvTOCpWct5kJOGulDl3cRZgu6SbCKzz7UdvfYdOGEmlta8C7C26R2dl6?=
 =?us-ascii?Q?WKXzg0ree2UJblMGJJ8GkbdjwWeV7KN5JfoaSAJbZgwnatluArdNGVVVmV7e?=
 =?us-ascii?Q?7dua/4VHh/UOCJHeVBYkb71qf2iEstqQ42xieJZkaGZHpCkmgks+NYK2h4xc?=
 =?us-ascii?Q?C/cd0Z3cDGg0o+cMVST0kKL+iveAKT9ybMeO4DOn3ufzTkNmNu84slTpI4pj?=
 =?us-ascii?Q?ARC+cNtltHVmvzbzsZqJ9+jxpB5WEvPTOH6oIfqr4MCmo1ozjeLSBczOUfqd?=
 =?us-ascii?Q?D2eo8u6X11EzDLtAnPLDwl9RjphmZ+xdyLe/wXj3t2TLn0q7pOZD5M1LTg9h?=
 =?us-ascii?Q?T2oCV3aaV8OwZNmUrl5tBPrjjWvNb6poGBDQCmVeTxVDvNIRHfJWIj3h4mFS?=
 =?us-ascii?Q?q+f7LueUmfAd7bG+hwRImRVvKJY0aB5a6ZNnNt/t+FM4NXzpgyiyfSWCN5Qt?=
 =?us-ascii?Q?Pit33lh++xR6/QuEa9nTLqKt+0/MlqwykIMBCVNp1ULF4cxXjYQvQC1MX1cB?=
 =?us-ascii?Q?RJ20d0GtWlA6JsPJH04oCoyejV4l3ycdQSwPqSOQ69tdawWjD3YjpW2F7tGi?=
 =?us-ascii?Q?ZllZc6N32F9xwam7QgQFQlMgm3BclzZbUtdz6hApgXPx+Z0EIgjaX/4QJSd2?=
 =?us-ascii?Q?BxOSHNafx77XgVJE0NTHxkVMIeM7iOYtimVHEHV73r3pPe/4seoQ5GsrvAjv?=
 =?us-ascii?Q?zjjs0Hof3X+mSuQDTzHBChKfyCUXrlmqXkhcdr9sGLUlQXgY/7T+r6cjlGyu?=
 =?us-ascii?Q?PuRrWrVmgERPTcyIQPADgGwGEkQPYGSK9pU41NCTpLlqL4QT87HnKtHOFkQA?=
 =?us-ascii?Q?LdC1A71e1XWIQ8518XTbywdi3rYSdx9NW3cfWpKxxMlFatXjXF+zRAHCz/2c?=
 =?us-ascii?Q?NEeioOBgufR8WUjr/7cWTdLoe6PfcZ33CScypuFIJWIlYdTK9NaTcRNOLJm5?=
 =?us-ascii?Q?HhCURTJVH86jdJko9ALh2rF5m9AdOuT81ou5eS9YhsM8pvFGSOJvKCD0WkpE?=
 =?us-ascii?Q?qwP9GPBFKrk998/d0BtND2LUmFNyCD8QycKJGQkS?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c857dc8-14ca-4af1-7d8b-08da5744fa3e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:24:59.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQ9MIdX8t7XW+aRRngH32LY16+lz/3dYVG8XpNIH39DTK/4LTKe1umLUs8QlgZQw0IRPWZDa32F1doLPISMQ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the device suffers a spurious reset during ATI, there is no point
in enduring any further retries. Instead, simply return successfully
from the polling loop.

In this case, the interrupt handler will intervene and recognize the
device has been reset. It then proceeds to initialize the device and
trigger ATI once more.

As part of this change, swap the order of status field evaluation to
match that of the interrupt handler, and correct a nearby off-by-one
error that causes an error message to suggest the final attempt will
be retried.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/misc/iqs7222.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index aa46f2cd4d34..e65260d290cc 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1314,12 +1314,15 @@ static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
 			if (error)
 				return error;
 
-			if (sys_status & IQS7222_SYS_STATUS_ATI_ACTIVE)
-				continue;
+			if (sys_status & IQS7222_SYS_STATUS_RESET)
+				return 0;
 
 			if (sys_status & IQS7222_SYS_STATUS_ATI_ERROR)
 				break;
 
+			if (sys_status & IQS7222_SYS_STATUS_ATI_ACTIVE)
+				continue;
+
 			/*
 			 * Use stream-in-touch mode if either slider reports
 			 * absolute position.
@@ -1336,7 +1339,7 @@ static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
 		dev_err(&client->dev,
 			"ATI attempt %d of %d failed with status 0x%02X, %s\n",
 			i + 1, IQS7222_NUM_RETRIES, (u8)sys_status,
-			i < IQS7222_NUM_RETRIES ? "retrying..." : "stopping");
+			i + 1 < IQS7222_NUM_RETRIES ? "retrying" : "stopping");
 	}
 
 	return -ETIMEDOUT;
-- 
2.25.1

