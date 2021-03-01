Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6367332A57A
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350721AbhCBMpQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:45:16 -0500
Received: from mail-eopbgr680051.outbound.protection.outlook.com ([40.107.68.51]:34530
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346885AbhCAXvB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 18:51:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cw4eMdLRPFgC+cuXr0wOeq7BThWCx8VbxhfK0my12FTg3N38ayc+Ag0TJn57Cy8S6M5SO6kUboOwRy3KicN2wVB+AOloAlfonmxo5QiR988RKDmVehgPbKp45Dw6y0Zu5+eghJeyoI+DJSunjXc+d+d5NWPTievN7Uvb1aslWmsIfsZL4avVVnPE2zV4P6RDUwEErHVD/G6mVl1/rEVJz2gFWi54Mm+rLl+BrRmQ2EyKifGDj9UpVPZqMrao0JZTOvaeUHltSFALy7ojRRT7J/x8/hp0gbhVG62XSk7hcarKpAZbjfnR+5x03h2Z3/gyrblOf6kMZIjPRbgNmdsvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wufqOSLljnNGB2KTtdxReTpDuHmntXCCcmY05WHZ2o=;
 b=mxeFVDyFbMMfnsNNHri/wRN65MXzXWkEPes08EZq5EjQp7fY73RS1DocJtBHPpHcBoxKZKaCqriTQ6ti3tTFkfN/Enx9GYhEkRUHiFz72eqR6Oc9itqbguuJPNTAy3/+KzEFY50Q+29Uv+6NdElGk1jHmuAFE/pBzcQItpckOnDGDNS9G2iax1zGmHqz4a0Qw5lasf7HZCgJVrTacCMmZjTX0c1GCaPQMRBjztpDVzJWIyHrLp7Qa6SoN5qGEu81/YC5jS5iXddkNv3PoU/bun672pNUOaE02sAxER3o5k/397tCVA7PkJt0wR05O2ediZCPCvgzWGIZ8+9KivchbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wufqOSLljnNGB2KTtdxReTpDuHmntXCCcmY05WHZ2o=;
 b=KXHSISNpsMXL5wg8o6ti1d+Uzur4vEMIIWoWqi56gADit5gqBVQqW5QKQgGiNvGZIwr7TQymvx5uT2/dGhgmvorOYAyvjxIwz6FFtu7S/PqnG7fmLXmcY3LGZzoyFRWh22Fl7IermNdmYSAKWLCEMgumx2nSbou7IVhtl/jiLFA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5629.namprd08.prod.outlook.com (2603:10b6:805:100::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 23:50:12 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 23:50:12 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 2/4] Input: touchscreen - broaden use-cases described in comments
Date:   Mon,  1 Mar 2021 17:49:26 -0600
Message-Id: <20210301234928.4298-3-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301234928.4298-1-jeff@labundy.com>
References: <20210301234928.4298-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA0PR11CA0110.namprd11.prod.outlook.com
 (2603:10b6:806:d1::25) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA0PR11CA0110.namprd11.prod.outlook.com (2603:10b6:806:d1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 23:50:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a024c633-349b-47d4-a743-08d8dd0cc0dc
X-MS-TrafficTypeDiagnostic: SN6PR08MB5629:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5629E5539934EB6CC1E77CB9D39A9@SN6PR08MB5629.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7ENYM2LIqaFzbGzfzz++asEaIR2G8PtnZ91tD+Q/lQidiKgvyh7n7If41v4Z+O4ImrXW4QLtuCrkGZSmSOPiodg63/iVLIFV40hBx3dQ2Cj0opINNoVkHuapDj65WsFqwhaoAHkq+wO+/rdg4AELk+am4VehFrHxlCDwiyCmgKMCcHDxwrh0bKvCuGdReruQxikYVH6+8SY1nhaNlWcAtv0ANIFyb+VzsjQlw3VE3Y7LT4zIgEbH/uku8eiUz9xL8N8whw85i7TV0V2q7Wan4DSdvQOqNpo2mIV0j0WGeOc3t+Xrb4clZ9uSLN/D2Eno1nC3ocKnp/oN38NUALawOY4U6Rwv3wp+kKyhqZF/BBHYYiUvPirkCNHvhU1+io75os7Ejk+pCN+NdyBg3qI/KvnqQvVXxgV2jzk4RdzclitEr+YfMLGZhKLhTjnH1jSwCY5sLTJfSP0UP+90xC0H3h9fzackjvNqsxrTcq8IhzAWVYhJu8flGegB4vHfw5/fmRiXTyAa78G75curFP7bS84PrS3L6wZBj4yF5p4i5l3UrJhn8BlxTGOv+ZX3IWplk0XnhVAxL84wfjOleHhSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(396003)(39830400003)(366004)(36756003)(8676002)(107886003)(6666004)(69590400012)(83380400001)(478600001)(86362001)(8936002)(5660300002)(6512007)(66476007)(2616005)(66556008)(956004)(186003)(26005)(4326008)(6506007)(6486002)(16526019)(2906002)(52116002)(66946007)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UmMKUARCEGA6IGDJVL7t5OpcAmDHl2K0ZPMGBoHzAyTsbwDenHM4Xw+fJ17Z?=
 =?us-ascii?Q?JhruJ7W9E6j1CF+1zyr3ctzeGteOR/ih7/uAZ9j23XGM+Z54RvfzcS2LlIAh?=
 =?us-ascii?Q?DIPQeeEWV1egU/HQw4kNlPHNPFTf+i3C9kYrN2Tx59AG3bMAk4PahHlgLtVp?=
 =?us-ascii?Q?PJxIPCak4sH4NIQdeXo/+vSuObTrW+oGXxerW1T2pCx6S2x8jH00kvAfgs60?=
 =?us-ascii?Q?ftCF76zsQ8ccKfnc6mTLCb8x80IAJmPXJ+g5d0puvGemtmudwyxv7Qc/n9Au?=
 =?us-ascii?Q?YWEDZYDMpCFA+TivTmsp/oKmSs1jayugPdjo1RjrAR6OkjB/kTVQ534YUNlP?=
 =?us-ascii?Q?uk1jcaDmzhb5ZJ0HuXCrUMH+j/E6tFOGXD8lai5DzWSqRyGJ1xAY6pDrfV/Q?=
 =?us-ascii?Q?xVuNxeUauVnhwhe1y0EK8xCaOAkkSGnUHtNpxpyQwuhPwjYRRpgPbBf8FtwO?=
 =?us-ascii?Q?sa9aIywszFQ/HegOKMkn23kePFnXhvAQmtw1la2ZqUJg9JSYGivwbu22HPVi?=
 =?us-ascii?Q?uTucEuayFPI6tkHPobO7r3+P/lHRQUiSuKLFJ+MR3ceFXXmQMd3PMpzpW6WR?=
 =?us-ascii?Q?ePyRPSbccv4sREQBAlMRUAWYI1VM0bgOS4eegVroOp0yUomd3wOu57AsEw2s?=
 =?us-ascii?Q?nAQ5MJK4qeEXmIEC1IinsAfKAclS8u6N/+bwM2kGulWuW/EmyUJBemiI5kXp?=
 =?us-ascii?Q?PW+vc1VRemOgVoaFcILa1gR57PRa77yO/N9xTQFWxPZWh8P0wHfI66yhChw9?=
 =?us-ascii?Q?HkX8OpCdzbT+JwEARIqNn8q0l5xtryMXBN2FynwMZD56MPUfpujrAvLp+s9D?=
 =?us-ascii?Q?pJ7fbFz1Z14pK14bgN72xn+YhUBAvw/ORaqOdoKz7f9NcvLNIczQAomkLbEa?=
 =?us-ascii?Q?nSTC5fbwhZVZHmVpIPks/bizIh1bhHVYH4X69+dksIUOSvxyY5BmoN19MQ3h?=
 =?us-ascii?Q?tDT6WCgTKoaVHzf39gpSV4/OvY5o9FKVT6jsGo3CR3DKSjR6Gfqoxu7i75sI?=
 =?us-ascii?Q?E/ez15U+2wG7ax2pCGVxfKrnurBRTex9p/72h2EdDvKfqhy4x7WKBR3D71IG?=
 =?us-ascii?Q?f28cJdNfxFaa+M1noXA9wzn09PgfceCSqOlyr7jF2Kaw+6gBdBqagQAyZ5kR?=
 =?us-ascii?Q?T5JLorz1tnb6k0ASXWYbwRjPyfjqUnuVjwCOUytKh2yPsbq6umNlpbCyS/T2?=
 =?us-ascii?Q?VjXw331R3S5Igj0JMZMeJgnZXJ7Bfl7tby1NSxindN/dDNnCaj2K6Xf7oUDt?=
 =?us-ascii?Q?XUsbmnKJglcbYk2rL7To6Zq5aYYJyJ7wKX3wgk/weE7V3nKkSxxO8xhDUpd/?=
 =?us-ascii?Q?EL6X9xn5C74SZ1OuhQpGHJMX?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a024c633-349b-47d4-a743-08d8dd0cc0dc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 23:50:11.9146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVxzQalAMjfGid5VvZUmxDXr1x+PWVOo1flVYzzvu0EXNMBq6POgjBKpf5l3BXibF9uddwhyNcpqghQQYrLGMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5629
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that the helper functions have been moved to drivers/input/ so
that all input devices may use them, the introductory comments can
be updated to remove any implication that the helper functions are
solely limited to touchscreens.

This patch also scrubs any remaining use of 'DT' since there isn't
any actual dependency on OF. A minor spelling error is resolved as
well ('setups' -> 'sets up').

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - Removed reference to DT from MODULE_DESCRIPTION

Changes in v2:
 - Added this patch to the series

 drivers/input/touchscreen.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index 97342e14b4f1..dd18cb917c4d 100644
--- a/drivers/input/touchscreen.c
+++ b/drivers/input/touchscreen.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic DT helper functions for touchscreen devices
+ *  Generic helper functions for touchscreens and other two-dimensional
+ *  pointing devices
  *
  *  Copyright (c) 2014 Sebastian Reichel <sre@kernel.org>
  */
@@ -37,7 +38,7 @@ static void touchscreen_set_params(struct input_dev *dev,

 	if (!test_bit(axis, dev->absbit)) {
 		dev_warn(&dev->dev,
-			 "DT specifies parameters but the axis %lu is not set up\n",
+			 "Parameters are specified but the axis %lu is not set up\n",
 			 axis);
 		return;
 	}
@@ -49,7 +50,7 @@ static void touchscreen_set_params(struct input_dev *dev,
 }

 /**
- * touchscreen_parse_properties - parse common touchscreen DT properties
+ * touchscreen_parse_properties - parse common touchscreen properties
  * @input: input device that should be parsed
  * @multitouch: specifies whether parsed properties should be applied to
  *	single-touch or multi-touch axes
@@ -57,9 +58,9 @@ static void touchscreen_set_params(struct input_dev *dev,
  *	axis swap and invert info for use with touchscreen_report_x_y();
  *	or %NULL
  *
- * This function parses common DT properties for touchscreens and setups the
+ * This function parses common properties for touchscreens and sets up the
  * input device accordingly. The function keeps previously set up default
- * values if no value is specified via DT.
+ * values if no value is specified.
  */
 void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 				  struct touchscreen_properties *prop)
@@ -203,4 +204,4 @@ void touchscreen_report_pos(struct input_dev *input,
 EXPORT_SYMBOL(touchscreen_report_pos);

 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Device-tree helpers functions for touchscreen devices");
+MODULE_DESCRIPTION("Helper functions for touchscreens and other devices");
--
2.17.1

