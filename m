Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DA965C58F
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 18:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238138AbjACR7L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 12:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238620AbjACR7D (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:59:03 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10241182A
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogxw/t6D+401Wd0PJ0ZJoqd1G2nzMMRL96BZ7c+VlSwo02BaeIzVbRmBybLqs4X4Srz1V93HgMZsAOt68KwmfXhhKHXERzgS9kw07/umz7VRidGJ6orj3CNnIa+i+9UcQee8mEShndOcbiEJ8Mr8d2DlgBaUmLE0fX6x6xM2rCcDyRjXkNISkAGw37fJfY26mqXujJH43sxTNJRnaSqzu8EKI3fb7x2/YEk4VTq71e2+afCRQUk7oNOpwqZK7fruh7aQc+jl4uDr11ofaEIWGhxZLmjHMdcHiY9TCEHMHTRs1gbfKGA7WkzjpDHfUSdmRIlUWMm1p+CQJu4ydUru8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiA3tzweHmkLit8EUfvaBKSCoh6vI7f/8oOHY7/tSQ4=;
 b=MhL1jv73uJIwkDC1kbXLx3SEd9MzJ6F7cMWSgh8y7Rzu7iExNUqx5fPMb/1j/gK6BTjprUv+xkJ1xm1MOjfOwJBXRvaXxA62cUHnkffFLYYXCfePBJC9K74RGmPSGw49cvFPXBARuu70i+lnw5IzqrWqFlJWQXtXd1fGCGyG/W4GVIekbJMm4Kpx2ZRJksPsdRI5kd0o7B3ZLyHNHoEtJUjm0POU4DQBn8qem3vRzXwHUEPNZmSK6dnboq7aIhlhjAIddBruJ7qGhWAuSmBbBUIX18E1KYIxg9DoYmKmHBCRV/n7wBIqZ46UQktOgHGLpV47jGYkVHJkHClF0UWeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiA3tzweHmkLit8EUfvaBKSCoh6vI7f/8oOHY7/tSQ4=;
 b=qY/qBKT52o9K6aJ00DeWj5n+IPeSn3G/zCHiuP8FGc+uCsddXP+sRIHuDn5SgQLCMZcrbODVCeOKZgLZDYGfu5cp/LIrRF3Q1meL1+tXun6EZAkyuc2ExL6nPdSszQelk/CuB37FVB0CGezJte40jggg0lVQo/8XQ5VkVEaoI0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB6592.namprd08.prod.outlook.com
 (2603:10b6:a03:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:59:00 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:59:00 +0000
Date:   Tue, 3 Jan 2023 11:58:59 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2 2/5] Input: iqs269a - increase interrupt handler return
 delay
Message-ID: <Y7Rs484ypy4dab5G@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7RsTqhYJOZs11sK@nixie71>
References: <Y7RsTqhYJOZs11sK@nixie71>
X-ClientProxiedBy: SA0PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:806:d0::31) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ0PR08MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: fa36c2b3-144d-416d-c993-08daedb4313c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CC2LTWEISrtrKiLX5VeV2bZHCC7UH11lmdHrcMV2ewIWoKvQbkOs4raeLZ4V6QXNf4itfCm8rz9KD75d5D62ijrXNMKdiRehdkTt5Y3TaIr3Bs15CFxkCM0k0bgsTMhu3v5xpUZsdrAVrt+ixAHa/SVEtbcdqt+WW/vsez8mchEO20xW2yJVBAPFvZIWorgV3TGddswmb3UjKsICNo5xHV8N2qUUkxaTkXdECyAxLAu5VuPkpkRm4Y1DRElce07Vgekez3aGpJ5RphcjP+i+yzmgmka/+u4AzmeQaDkcyKt1mm92s4vt175DKcndjurHTiCY6axbHhZGA8EuN+7XN5m48y8qhstRAaaAp3Gcz9pKyOUDE1jExzOJcoV2wov/4VQfz5UYJtUYV17TmrWCEjefFZIU/ALQmZFFJTUYsmuPoPsgAOXS39/1OQIVv+yxhuA8mTyLBPhT8Tb5ga+RxjxjgIawcRUTcfE9uLy5+oJnHFcMBCRT5p4TzocNSAeaDKcTAZtnE8XTvYlAicHtMBXKeOIooTid0kSYjTQAg8iPy7R4K34SSI7OgAf5rXRyFAL8UFZm7ipkfagqZV5qYAojKtAD2tEj3iXWCojipz9+v3ZDKx5bJvl5MWYwqhZ0DDamnfFMj0bJAd56lA9G3mBt8pWzdZHDAlbExLb11cc77gaX1hjkqyOWX+MQEtqA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(376002)(366004)(396003)(39830400003)(451199015)(186003)(26005)(6512007)(9686003)(83380400001)(86362001)(33716001)(38100700002)(316002)(6916009)(2906002)(4326008)(66946007)(41300700001)(8936002)(5660300002)(8676002)(66556008)(66476007)(478600001)(107886003)(6486002)(6506007)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8u6rYU2PJjPY39seL7fY1OokQlcL3C1lmm/k0V1acen6Yfnxba5LTvAVjv8K?=
 =?us-ascii?Q?JwvsJyrZyY0Gx5Bprw0YSn/XQPwbbl27M6/dKRmlmh/A4CEeh9NwIZ+NKAZh?=
 =?us-ascii?Q?cdM3K7SMOKf7AJrxsQRBjuGYjegVpNVyKUcf2Tk/8HJePUdIZqtOW1+LQMtm?=
 =?us-ascii?Q?+lUvJ4JtkosI4NC1r4tmXUWwoJc+nSdDBNvp/xwREqSJ7WYBb+uGqZphPXl+?=
 =?us-ascii?Q?JWEtaswIwWOhCbgCFNjZ0sz7erh9jaLVlVckFa+MHbOWClE/jPh8YRINYfjN?=
 =?us-ascii?Q?celXbG9UA3IW9S9weLjBM1YYdQ3cageCissptf+6vCBHKz/UiGjvzdHvN7Pf?=
 =?us-ascii?Q?Cgb93GgqA00TntqzofR291ql6xj8DmZcBMueg3nZDeTXT/vcNZQmig0IIzVT?=
 =?us-ascii?Q?v74d7Xjtl6eozc7GQbUMVFIYFCf1X68cR9GYhhEFLqUYsv+DSE8Ws/XoB16A?=
 =?us-ascii?Q?ZFQNGcuKUrAb2QGgB8UCRDMJ1+/xSGp5jfFfdWZiPtPBS9H9g1572uK5YPMu?=
 =?us-ascii?Q?ryR2Ppypo0gTfXNQnvJpFbHuPT591sNu6j+rIw9vK0Ipnkvo7k4hDZ4eBGdH?=
 =?us-ascii?Q?jSRYqeUANbZ/e50BJ+LSgXqVT+CjlCoGjSl9VUrZLoyKCVPP7VN8qJHufYn2?=
 =?us-ascii?Q?U/DuvuC0DBTWn0HT6QJVNmn0TQe9fyKj9p2/nd3wZbq5w2rGdVE7tx4T0hvm?=
 =?us-ascii?Q?KUyJ/x2R3SemZoys+DI9xvAyOCpZ720uBJe70ej2k+8X6bAxohb2VXeQKLi9?=
 =?us-ascii?Q?khApVk9IhG8CJn6yV0xv9Usq2oTaClvYMcTcRiLOUsSilgxm7PBtlAI0y2g0?=
 =?us-ascii?Q?o9eOzyMxUVucEz4JtXPHlgI7v0HxXZjP8+dLtkIpOQOTVN5jS7C7cSGr0j26?=
 =?us-ascii?Q?LJyDKZ3zPEK5oBGVsO2bPsXnSAVlJfRrrjyK5Jv2HGBU2MYJ2Ve5DWFnpH5h?=
 =?us-ascii?Q?9RSPsMr9B2l8E3WEO4WuZXyH4T/kIIHADBPypOIhfhzUTBEFQKeC+M1myV1U?=
 =?us-ascii?Q?AerphYB0E1YBVuTIJkRQYC7bZorKMFcYcgyDIR4b7T0QmOkbPegPyiWBmrox?=
 =?us-ascii?Q?iF+ms75NbQjyGKZ1ML1PHQ9YarpYXbAYFW2nFFygz1G9C6GAzI7SV7puN3lm?=
 =?us-ascii?Q?E+AO8hLjnJDu7y7ZTe2Dw1tRah2o9q7uDc5dQg+vrR85/0qUMP600EV9M8hW?=
 =?us-ascii?Q?fjB5Xru5oJf+TCanqXwMQQG/ifKvG+Goh/1/PHJQnn2vQ/uBYIMJX6o7iikr?=
 =?us-ascii?Q?DRuSQM4NYtJqizWJbeQFDnqUPKVg7a7D0zt3ecV5PdIszBiKHG+BT5MMJiay?=
 =?us-ascii?Q?myyb/McpDv4OrGwC7zV1pfU2aramcVNrcnOtx/tusutsMLxe/ah36xj5GCu5?=
 =?us-ascii?Q?wOLj+O3AUL36gk9MeOvTG33CbFhGV8yQvI8VihIvPDIX8p1v+zJ/Vw4uUyn1?=
 =?us-ascii?Q?S9DurgWs4yGsC3rz0gEhsiF2dWzoru2jmv6ynjSWfNSyxHWe0BI6q19Jrr2p?=
 =?us-ascii?Q?y2uyNiTzHhTub8iCCuDk5ZIOPs41mJCKgltx9QDGXRoB8GeAafgbgMko2oOj?=
 =?us-ascii?Q?KbqEdZMRCbEWA361E/h+8r9l6vBBgnecofHOsmvw?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa36c2b3-144d-416d-c993-08daedb4313c
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:59:00.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0BpyijZ0bxEbFsK50fzkw0ELD+FZ84S3j3c+HperTEaKgUI3oe64wNaWP2Ktx+RXoi3R7sEsEyuiKGrlSrCeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6592
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v2:
 - Added Reviewed-by

 drivers/input/misc/iqs269a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index ea3c97c5f764..ea3401a1000f 100644
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

