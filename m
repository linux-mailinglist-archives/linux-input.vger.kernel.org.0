Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805B62FABE8
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394424AbhARUvb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:51:31 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67]:64404
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393981AbhARUrC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:47:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBEXKACwAotnlgEslMw/xhQJ3VnNEmS1HuU6QT1Kbxwbk9dWF/VsntG8J3SMTR9KlbcDQbTya3xG01G0+Rxcci0JrvQxhYPDyz4b34ggxYg1J0cghQb1bXrAdiXoAp7GmSz3Oui1nqIcG5bC9epa99ooOLwDX2DcfrRpB0lrhKoa4L9dZtQJyDyQXS7XG1hflk3U1iTe3YN+ILGxj06IkXl13+QPbnvdtE6vMUCJKBlfZDo6r2gMhU9uQ72wz64vaYajPR68KKf2Nc9kX+BvQUIVzrpS84VqXoHALBsKk6x7FNMY0B858zraXY/GBZJtf6HSetkRQeOsHqdG/43hTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trXI4G21zmQhmnB7jC2FncyoTBMcHi+kPxU1iKEqcLs=;
 b=GN3jqw5++ubODqATGfYSFICmobd7h/0/7GJyBEe8QJ0ScPgNQM7i8Rvt4uWKavejcA6wG2zMkJtYcEQU2CkLWzS1Kf+ckr5tmkwTr1RICRxnHrw1KwfWInxTqUcfm4FBHODPDQ10KHld9Vf1RZElaGwkEY4S+wDhEo09ZgsO3KdnxWtqJXxfUIA/DWv9jlCcWWi93HPoZKX2KNKEEt+3tx0X0ORrMofikGbdJZxusruDq/COvGUj7/QB5upeyQt36S62tDylhhlI6e6y4jh0yayi65S9FCNfhcSq9CKo52Y0ChFA0nwWZyXLHi7nk2QCg6y6m27nSZxa0By237z37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trXI4G21zmQhmnB7jC2FncyoTBMcHi+kPxU1iKEqcLs=;
 b=eN1Qt9c88ElRkC0EFNw7xDU5O6GSmrHsbdSTtqoxsVrrI3rZOH0bqmIGYgsckoPcH2Gl1I87Nu/JF4/i4OOWVjkyTygeemIvVzVbK0kNzKM0Tzg+PG+20oiOe0tjS3k2tjYgi7Zj3QbrNN/iizYxv0QeseGXN1DPO7GY322O6/Q=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:45:04 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:45:04 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 10/10] input: iqs5xx: Allow device to be a wake-up source
Date:   Mon, 18 Jan 2021 14:43:46 -0600
Message-Id: <1611002626-5889-11-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611002626-5889-1-git-send-email-jeff@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN4PR0501CA0137.namprd05.prod.outlook.com
 (2603:10b6:803:2c::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:45:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fb31ad1-e173-4ca0-e713-08d8bbf1ef26
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4846FB2C6CD01A8DCA482647D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/2aYu2f5P1O0e3Iu8Qh9hTZrwIXrOBiq8E6Rjiyx4UN/NPLkgY82DFZiXwQmhE70GCikjsV2pn/ScXrkt80cTM7EmQz6g0xSJ+LFUD/D1VZzeff/h7ONv1d4GmbLwI3vo3j5Dm/yfsz9EhDed2HgmWfplJJqCLbkUgmmrnJpLCYEO3dTHNq33cI71fGBVjRLzVDu4bUS1LT1E7yKBtx3daDmynld0zDgn+NNM8pCf6jWYa1woCs6hgXo0xRT89Y7hDmxYuJ5q0GNodSX8eL8dTUeRUSxx6ccRHeUPeTk3pMTX4Kdx4f5xAtLzqodQw9UM4yzz6VBeI/U7bMoZUKVgsQSPnSyjMPn6N2AI96Rf0omH5nkBjtKhYzwPOqNiLFY9e14n7nBzsOqYuU499JQ6FuUvY/Wr5aCUUFd9oPbybYESUL/P34D9+eugvgnTnhSAvtoyXVTYH8rGIwOIPnRRSPw6hZ0g2XF6rMPIDoeUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ULM+4HrCgQ66eSxj5RTLEe/PdVEaoPLO6rbVVfE6v61a5sAhXW79tx4wCeWl?=
 =?us-ascii?Q?QRxTRaERw2Y2jFbToODEHiS41DkErFkbQRHXQXG/I4YA6RnT4NxKuRcSqFuY?=
 =?us-ascii?Q?73woysJ7EeHTvxuIJv0t14Wgyjg6kcPwoZ4Vfzj/44t+5Kf5FeED5O/rKkQi?=
 =?us-ascii?Q?e3gZROd7NPY/BP5Jv3d9512X4LhUPiPBbxt19lYladakYX1Q4FcG8MaOhbLD?=
 =?us-ascii?Q?njAYPyzHyqY3ETRRVp0dzXuzvGqi0+XOucwLUkoz/J8D368stVxR2kaEUS2+?=
 =?us-ascii?Q?mvuMzNNXWmhpvWjbRNE/dKXF5+RbyYi8YLwAtzkbFID9RYZWg5V6ao17mRGk?=
 =?us-ascii?Q?rVZ6uiE/uJn2+7p7xShbg1xtPAQ3LlWVIhgt9gAjnFdgekzKEPudYnmKNcsd?=
 =?us-ascii?Q?Z7PS3lADvADLqN9WU6J+4XHa2koImQeLNTWVAD9wtBwI/onCFbXNzfmTzrYc?=
 =?us-ascii?Q?A+hIa1JYMiEKtmwFEHCmF70LNg4qcrBTCSwwVmoLKs7A5jeTrHh06sNMRxYr?=
 =?us-ascii?Q?bUUpyr0sls5XfMZhGI4LcDILL9wrCOqJ5lzzG1QwgtKQzOzbu8xkKCox76/W?=
 =?us-ascii?Q?fUW0bc55e1kltFwZcEbtLqkTI930rTfiMpd/m1mWkmEnOihDuA3MOL/XK2y6?=
 =?us-ascii?Q?OjnhHm2b4pBVhZzZSc0HeEhd9ju/ZKL6hEOzbEw/8cmlIOIIgr1sHcCdfQM0?=
 =?us-ascii?Q?/nQtDDhIYdOXNLAHKszXTwzYZ24+J3rhiG553oBdb8maMUL8orf1p4/Em/QH?=
 =?us-ascii?Q?LZKmMlltKOvyrXo9ZA2kiVmBhfJr9DXnpeIju7eii2ruMoAWHq6F7vl477gy?=
 =?us-ascii?Q?wHUzrNvEbY1qEG4HD6JQE9K3+KLinr+8s1u6Zd7Z+xOkxIrpQO1uc5DGM5HO?=
 =?us-ascii?Q?xIgFJNvv5B9YQjDtW3kqlty5Yd7VDj07kEant1iYrfdH4/8B8zVFoOm5hKny?=
 =?us-ascii?Q?LK+VBZM0fLvtWBGVMZd05bt5Vc1VLLixIg0oTXSKTlx0RIrVlcvEiA8NXz0l?=
 =?us-ascii?Q?JfAL?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb31ad1-e173-4ca0-e713-08d8bbf1ef26
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:45:04.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxiER1ukSOzrDf4l60Jvy6iGlHt19Vl7x2+GsdTx9TjqJd15LxiZ7NJOhDzDRiA3MS6vmiGL+JqrdQzsKVVH1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Avoid placing the device in suspend mode (from which it cannot
generate interrupts) if it is defined as a wake-up source. The
device is still permitted to enter a low-power sensing mode on
its own.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index dac132b..6c1bc6b 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -1001,7 +1001,7 @@ static int __maybe_unused iqs5xx_suspend(struct device *dev)
 	struct input_dev *input = iqs5xx->input;
 	int error = 0;
 
-	if (!input)
+	if (!input || device_may_wakeup(dev))
 		return error;
 
 	mutex_lock(&input->mutex);
@@ -1020,7 +1020,7 @@ static int __maybe_unused iqs5xx_resume(struct device *dev)
 	struct input_dev *input = iqs5xx->input;
 	int error = 0;
 
-	if (!input)
+	if (!input || device_may_wakeup(dev))
 		return error;
 
 	mutex_lock(&input->mutex);
-- 
2.7.4

