Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C7033A035
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbhCMTNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:13:23 -0500
Received: from mail-bn7nam10hn2234.outbound.protection.outlook.com ([52.100.155.234]:5825
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233635AbhCMTNN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkuZIruWhO/2iIzNjF3IcfK8kq/GkbyOkicmNXg/6+fua3nMREck4nvG/Zz1vw/IC3269ARkOX/ziwvoDJ1P7waZam/ZV9I4ZKWWClwgjMI+9ZjRm9R5OI27cXCuYUEV22i5D1QCw6cpt/JMxcIypyfI9eNP6DBV0jytb6BRn8qtksWtY7FgsdQtFbg1v0H4NxzVD1UsV4PiAQao8AQNC6YWOeN77L+Xw/iWXVi70UH9rmX9eqvJD+ht9MYPl0q4+OZcvK6Wo3DTFl6kORbeRTrHGT1UGPtl+9twrjKaMwCHUnf//Z9tc04TwHKgxy4Bo4LvRNXiG8q4vzDL6quWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwKxE/hX1t+fFoFzNONjVGPe6GI5Ez0sx606ZcN6wPk=;
 b=cXGbQN1/R+OS+cOiVm7X09hQ1nFKnkpX4XcQMevt7aT61UIpj6chJ465YMWr8RrR8VpzKs+gUmUAfUXFYvBRWTMYLW0ndR7AnOhs6F9qiUUa0QxV9hPgl1+YABSBf1Y1NdvtqbdgsPGAuBDSRGCAwnpCGnsNmqMiMMxsra82+HLBxIiwSFEeci/KfW6LXNHjh+B5LiUBySREzXHX73tXCKx63yxk53/aUx2BATKefRs71AKxeBB5GeUri/ZKdzqZsP9LgZOUFsPNpcpC/qAFfYd7p6BLaB8yK8hOiGq50FBp9hOTmybzc/09sNyHR+5fs1NWIh8zcvm60dG0UIAvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwKxE/hX1t+fFoFzNONjVGPe6GI5Ez0sx606ZcN6wPk=;
 b=H1OePByq/nKeGouJ49YXpjP32E3ZtkU7brFybOY//uhcpNoAI+MovpGZh4BZKcerSAt/IpSK2v+bOlNtQY5EU5463SWrKq7Sy0F5Fno8Tr/B9lZGul1dbipKaZZQnSmWKRgpPE2YRyrW1FJn7xcymWmX09Vsu0QaFFPxhs7TZEs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:10 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:09 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 1/9] Input: iqs5xx - update vendor's URL
Date:   Sat, 13 Mar 2021 13:12:28 -0600
Message-Id: <20210313191236.4366-2-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 800d5a92-0631-4747-ea74-08d8e6540a4f
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB569442F681FDE696962C6A24D36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tkhISqjacDb9nCGwWomxNw2MDp7mMasOw+mU+wJdXOUuqpSSAqLFPqd40nhN?=
 =?us-ascii?Q?Lbzc8nhrIciOSswSP2GcX4IfeyBQlYD2myoLja4JegnvAG4LHXUduzFP/RzE?=
 =?us-ascii?Q?cC3P5aBtyHuJnIPNKYE5KnFoTS97oqI03UY+jrX+z5Y4UfT30gAjkq0BOovn?=
 =?us-ascii?Q?wU9jwBG4B5I2H3lclzsRrBTaUSL1d3LwT55/Nn3vNhrzNkCISdYDnQoicsoK?=
 =?us-ascii?Q?othxdaGp0rGMPWHiESXE/fe9vxWTxN4QwOzc1UV381CnSlhoSfFKnDa1DRwc?=
 =?us-ascii?Q?1prN/yO2iHnISyuMYmdIfxX9RfvhJC1il6rmq82DsdR6mICnKQR/B6ofP9lK?=
 =?us-ascii?Q?djKkIrPECRhbaIm7w5wZfi51tuMuVMm22xf6BrMmq5tTmqMHmqgeJ9kOGZ9V?=
 =?us-ascii?Q?siaSkbSXNXRm/0Cny13hQ07JfcAHCo9FXsNLqsurtPEyiinoQXQZ5jiwDs2+?=
 =?us-ascii?Q?1IUdUBZRtAG1vGhabyHJIwgpH4TbsKJsun2kSWRVpb0xMJeQBogUoaADgoUa?=
 =?us-ascii?Q?rVI4NlwPx3W+8+A5NtszYHRSyxdkEYRCHHPLetEaaGnT9NHVKZkEECV61oFH?=
 =?us-ascii?Q?yhxppWn4r/HEv2M5ssYTNWU9Jsb4/6+P5RHBnCK2Gwkv/HMpLdXcH6y98bfv?=
 =?us-ascii?Q?dYNeB9iyUKy2lTXTQJ8Rl2GUW6ZuLregfOk1oNJRVJnXYyWkbuCTvER0t43/?=
 =?us-ascii?Q?D/hUangCPbu7KpyKNUQq6Btc2guwe54Cn0A+/dzLI9ImykisFi0qCKxMxFOW?=
 =?us-ascii?Q?E58RIgJI7xaDL2IOd1um02mpBAISBJdaPIIy6OzmJCIell8eWkR66l6zeHMs?=
 =?us-ascii?Q?WLf1wzva0YQ8MDnNljbYD0oHTQuAB9WWY5QRk3YPW1jeMtMxXyO2TDpMXCwW?=
 =?us-ascii?Q?MY+vBFsUU3f/Eyu8OjwqR8svL7sscTG5q5iGI3jv1tHdP+xsHlJHzaQuNzw3?=
 =?us-ascii?Q?GVWPRDul+A7pLgUcqoyq0KC5PDIWPjdtFNsWL683VdvhfDHX0H+9FU5e979s?=
 =?us-ascii?Q?7PAXx1cr+hSbF+OO4ZpFVl9yT9Lk0KkU3IhtFiI0C6F4doc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(966005)(4744005)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a0Gon9mJNuFRTZS5tRvNCgmJaRo70TBSg+7tusbmbbUFRRSWimezA0QVQUHO?=
 =?us-ascii?Q?MvcJvYTncYtXs6XxXiQcQoH0jK1dbKvVkbZLVNvD0+eOBIBDbWeUp4425n3G?=
 =?us-ascii?Q?1KBWQGn6hFy4oUO+Zhpu5n29helca18xxPyUtP3U8BzAQpr72L/T7Z74uS2l?=
 =?us-ascii?Q?Fhsi/qMjU9C32HmfQhLzDmxs2PWmlgzO4JOwaUpdKx4VcdZkjOJxT+Ig3u2E?=
 =?us-ascii?Q?CEX2ogYgZ91NLhjEf2GOiHuruWgkut4Yfl3mD3Ib8nmAqmeO5SpMLk0EQ0RQ?=
 =?us-ascii?Q?oXcqWbDzwf+Gr1rb2vZzfQyMFzXp7Ks84AC6J/Opy6weEE/3BJu1uI9XMP6T?=
 =?us-ascii?Q?FrM0P9Rzm2F88ffhpVDavCrM25TAd8D0wS7jkGHPcvHuITuICBnJ8mYs1GAW?=
 =?us-ascii?Q?fpUkOAojLQ0PC4mFn8qISq++y48PWfDrZkK/Fwq8BKEoSfVabcbo/AEcS6bm?=
 =?us-ascii?Q?z+6hkofeAjpD8cfUK+3GjoP/PnE2Pe0NaZImjusEQiPUkXzBgAJnMxgbhYUA?=
 =?us-ascii?Q?ef7nC2gEokkeAiTRp1kf/Mzc7nSfZMhyCkGGHBe0RCCG4ievAiId3U5Y0YAq?=
 =?us-ascii?Q?SCmzHySksKUTCG0vW711FELWl2POCcvWv3YoZ7U51MtdD/y0j6HDGKrpyvXM?=
 =?us-ascii?Q?N1eERqgtHw5guIKcOU57siism/0kHHIj8sL17MFWYybKzkMXV32a3c4iDhrF?=
 =?us-ascii?Q?VCkF8KiA+sz/ugfh/HvvGq7L6yo0K+9c4WPNE5XZ8tcSF4Bhha1zOjdEN0mX?=
 =?us-ascii?Q?cGGDv0X6lN7Jz4MBmtxdam+Qpw2aK9/wBcC8v2F1Uqo8wUD69ztye/VNkF+1?=
 =?us-ascii?Q?FuX/dq8rRuikDdpc4zTy11W8VWy27H3LkTedCRfw/ZUDIxmMf5z73e7RobZM?=
 =?us-ascii?Q?3ihmycIiqWhEI8ycNCjWtyf+yguxx8EifUVh4Oiu8WL0RFllQ92/blGaKnGS?=
 =?us-ascii?Q?PVo04HhRGrwuds1D/2Rj1fYtVC1lx4ReKI4Kt0Up2XNtd3S8EMa3ANeRylmH?=
 =?us-ascii?Q?TEPSbR18umX4cE1jar1gjDiwvZCLyhBgvgVYitp3xpyEk3T1X3+tLuV8Fk5V?=
 =?us-ascii?Q?++GtV6RaU0PrbvVb+MTAS39imCmnoZi2WOtSuLbN29YyQs9lnThl0bWqZ3pI?=
 =?us-ascii?Q?jQlWlVoTqIU5neZ7Y2TaGKIIW5YrQDDGaVavGDxLVtYxfDAzbA0v8YIHjA3c?=
 =?us-ascii?Q?7J8BahzedIFg4/h1ikD8pJxpJf1U6MLEarWRIxlswmd/4/WrsJdsMXYh7DmZ?=
 =?us-ascii?Q?cAnbLU54/oO+kc8bD+/ssj5mHVyODuapkkA5Wzmj2VTsKEunE7U0kymDMx+4?=
 =?us-ascii?Q?uvGT0Rg4+OTuNwd4gTQHDwf+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800d5a92-0631-4747-ea74-08d8e6540a4f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:09.8925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3WLNwAy7aVam6otcZQaFGqoblIt9fb66XwkKc2JiuGgKIEBeHgVV6KNT2gLjwDkcWfoztKsv2MM4R06WLG1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace 'http' with 'https' and correct the spelling of the nearby
word 'datasheet'.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 54f30038dca4..403e251a5e7d 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -8,7 +8,7 @@
  * made available by the vendor. Firmware files may be pushed to the device's
  * nonvolatile memory by writing the filename to the 'fw_file' sysfs control.
  *
- * Link to PC-based configuration tool and data sheet: http://www.azoteq.com/
+ * Link to PC-based configuration tool and datasheet: https://www.azoteq.com/
  */

 #include <linux/bits.h>
--
2.17.1

