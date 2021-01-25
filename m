Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC82302800
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 17:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbhAYQgc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 11:36:32 -0500
Received: from mail-dm6nam11hn2205.outbound.protection.outlook.com ([52.100.172.205]:59360
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730788AbhAYQg1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 11:36:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTP8Jyyhy7u0nSksvbjDjw/3YiI2MQ6spsXC+YBrhKEwg1QyMriqfSf9oUhQo4UHOq+tVL7Inhc9rRKW5klf4vgZIjcJ3hIHQ4/mYfgEcVg5us+NTDPxOGdWgBfUT7N2x3ZFagWywnYdFA2SApaGfJrhd8DD9HsT25WxDQy6Lp7fwXQqYZZczRGx8v/WBYf/WlmPBMa/zaf8mjk5Jy989MATl8MUjZK1X+l4VI8IE4roxS8L2+AwYmtXASjLYgQklcJ4w1QZV2FCOuvK7kckjQi0AvIEEd/vfXWaJ/4fu4JddwIBNPFxJsDlZkAelVJngWG8OfjaOzOZXEGbZSzJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRZ2y7H4IbgiyScWVkp6hvHgtpvwgiwY/EvchcMr4Wc=;
 b=Nby1gLmK8kLxDXXjy6MWuied8ualdahklMlHlo+L3RAuvet+5UP14cnccTiIs2iNdPMWjBf/6vFC4iqyyBcTGwuMXzyRBfKJk+uyqofDILwxITQiqGovVaQZ4oq7UBGAmnJkKhOoSfa5rSMqOc2Xv8R1/j1vAP0vUDjdu95VlKfn4SHBmfpms49hcHwWJqEyZXYu6n8W5faN7Z4ZsLrgK9bORQcE2/iPAXnhs93HLNOExv7GQa4NZYq9FB2tp0tYmFoGh2O6f5LCOSRn8Ob+0Nwihc9AEunKosqxkMFW596NwA5iGInNu5EteZH6KPbx4Dj/t2K4YunRzcWnZdCIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRZ2y7H4IbgiyScWVkp6hvHgtpvwgiwY/EvchcMr4Wc=;
 b=J//QeSCTAfSw0XHXcva3hby7SUFVQ7K4hT1OSd5/XxXuYM+d2KMdRaKKcNxVHTKRtiUxq5LMVOU0tbfZmjNntia0YNVF9KKpsBNxSmDPYlv/vr+n6ttyk8/XNSLlJAy6kUBidqJnpHLG1Jq5ajxrhfFjwWSH+mYDXZaN1+B5IA4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4573.namprd08.prod.outlook.com (2603:10b6:805:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 25 Jan
 2021 16:35:39 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 16:35:39 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH] Input: iqs5xx - initialize an uninitialized variable
Date:   Mon, 25 Jan 2021 10:35:00 -0600
Message-Id: <1611592500-32209-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:806:22::7) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SA9PR13CA0032.namprd13.prod.outlook.com (2603:10b6:806:22::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 16:35:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6bcd94-9cf5-4173-cccf-08d8c14f3fc2
X-MS-TrafficTypeDiagnostic: SN6PR08MB4573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB457319473E3BD1F0187A068CD3BD9@SN6PR08MB4573.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4wJkW0ubYXdtx6zH5i81d/3uWZPyvmGDtn0w8eWQC/kys2lr+BlWErIZy/EjUFzbxS8lFrQh6pSmYtmizRetLVXpblrvs+rSYgEphPP95C4WMxy/bjKyI7lii3InfwMLn93nWjkudfbkRPNHNkwe7IboaLUqa/Anp5nsNWDmZ0zD/2ZLbhlCpX1QSoLv/DEy8qjRDI9v1j0MrHxRsnaz8+T1E2xrdvvt3G/CCXHiW3ZOezQ5dMCZETS/UxXUTJEqT6sZzJGtXflBh6cREV3vbtfF5BmytCnhIAMRZXzRyuhBzKEwWq1/U3Oi71JekzDPm3Esy5j2HtwFBVhI96MF8pjjyXbuCy+n0ikmdUGCNmjW83wsfm9pa8ZU2os1+8iqpzLgWDwIaA3i+13SBd4MS73WIld+xf4knFebV+hOO2YRRwkybFp8pctHQJt7ggRWXjB9JjHb9ZMlU7KzsZ6xg50Jn2TCZsOOn3QuQDxF7tIfs0Na8JgAgGlq2k8NrldqJvC+laHHfUD8QHf7RMy+mPbQEjJzukM02oSvtmvn0VOknQrL46GZxUu59xJfeYklbCr8YPffMXoolMiN1swvMiEB3Q2G/yxcyKzzG/0IsEquOjNIjNznViBkT2YtjfwvWYYP4b4jQsqD2LfD9AdIacEgc7DFGGgGmmi9otVAUJpnG47hPzwQ0fLQq0zcnOwgHOCzgD4w2oREVUonV1hDOeMqmTqbvlp956JZ1L68qo1QbZGvkDXDEPunYpaxN7B8JlYuFVdEsjOkkFlJSLuYPxgiucAOI4LTSleecSoUSuxliIQJOYDlgE/tMDliZFb7PTABRhMwqe/JNpcp4pxm8hS3i12GOA11nrIT61ydPkxqZ/xn97j0qLXEzvae0PebZ/IM88sdC/u170nMAouowsylHMkIfOpYxdvtho03EF1TyK0E7pSbRjzuXlaTAze
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(376002)(346002)(396003)(39830400003)(136003)(366004)(52116002)(316002)(8676002)(6666004)(6486002)(83380400001)(36756003)(8936002)(86362001)(26005)(4744005)(6916009)(186003)(2906002)(66476007)(6506007)(16526019)(69590400011)(66556008)(66946007)(478600001)(6512007)(107886003)(2616005)(5660300002)(4326008)(956004)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mlQGk/douYrJR7g/W8qYrtiCSasT7fYMbdY/wg45a5yURZpFZgpMrzJTOFRl?=
 =?us-ascii?Q?j+MWbmx2QCuepXz7WqkRXlyt9e2bADdnzAyzGD2R9vG76mfE1+7yutWofWaT?=
 =?us-ascii?Q?xNMNnlL2SWP2h9bzK+ziCPAg+h0Ix77AzeTEs+Q1J0v94mh9EE2miDHF6jgX?=
 =?us-ascii?Q?kzSSOYae1HXcSmNEwPOU2e7EPpaeP/nuSAzIIZNodH1TvMbX6Cd0SNg9IExW?=
 =?us-ascii?Q?SCCm1xZtJKzW/DPKdaanaxSJlRhzs8kyu/GRQCBe9WqdFT3RGbIrk2h15eI2?=
 =?us-ascii?Q?vYFDMxkeqo5nbpQsW+dnfHQEB4uqhytHb5fe/3xZAzHz2BCpVWDMafg55ads?=
 =?us-ascii?Q?Lk7TD7FFiTY9+v4IpVrOQ4oZ5VRryBpBSNThxe2WyRxcGKbl7KKV1K1L3Ppl?=
 =?us-ascii?Q?aUo+5RXZ8796U/clTcSmdUQl8vUd+Pqe0Kf6DJCb6WZIJjg1j08+myCIo6qI?=
 =?us-ascii?Q?GJXUF97bGepvmvRDIJG/rJ5E9pXCkbFyGHSGBwZtr72No70Jd2fBGsfLtFEb?=
 =?us-ascii?Q?AvYZ0wyXuT/xnTdONsCApGmi/tDnvtW9G2WC9JaZHQ/w2PrMUTC6WVT/1xhK?=
 =?us-ascii?Q?bv/01pme4X0KxMWivAGE9sZnIlMPnofTz+6FhYQdMxrISyREwGXYB4Y1pbfG?=
 =?us-ascii?Q?EhDkH2FL6nC9NWwcDM/e3mXuzh4gSbxkoG9GM/PetX+pgUNlN6H86/zMozwL?=
 =?us-ascii?Q?4n7VjRfNnubRqc6yfI0dnDKq9JPs3kGwVEMQlrpkNzQpznP/bLBy52itOFQ+?=
 =?us-ascii?Q?bZBeylbat9PGMxfymPjZoOcOIjgpTm7NV+iYN2xcU8R1FGUN8CtcV3ZxfwGY?=
 =?us-ascii?Q?GznqaZJDRHzmGYSUOX90uPxVcYFgnaCcpVTWD80bbWe59ratwcchBEGnn1Fg?=
 =?us-ascii?Q?wgmIgYxP1TritAy70gGctl3w9yN6tL9H3vgLhnv97VqfGY9StlGzpzDSZOoV?=
 =?us-ascii?Q?enaCaRp/Q+5j17D70m7soV83BUxGmETrDUq1xTXnuNpwmecDCtAtqK/rMUuy?=
 =?us-ascii?Q?JUFhtxiWWuZTBy9gJTPLDMPYS7p1CihSQXL7m+51onRun39OQ/i4RGg8ua+C?=
 =?us-ascii?Q?X1xXjmBE?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6bcd94-9cf5-4173-cccf-08d8c14f3fc2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 16:35:39.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apmjJKShIBN15QIl+6ETcmrXzuB6Hpt4VJS3RjJyWUCCNK3WFki2+8+R3n8oQNe3eQ1y4h83pyTi0WAQ6mGg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4573
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If execution jumps to the err_kfree label, error_bl is evaluated
before it is initialized. Fix this by initializing it to zero.

Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 05e0c6f..54f3003 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -852,7 +852,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	int error, error_bl;
+	int error, error_bl = 0;
 	u8 *pmap;
 
 	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
-- 
2.7.4

