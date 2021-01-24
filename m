Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622F0301965
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 04:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbhAXDpM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 22:45:12 -0500
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:51801
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726223AbhAXDpJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 22:45:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yww5xKYRYvBNDByOZEwL4WstTRnUXzA5wBPFiiYibIAkc6p7HflaGX2M0/w1vpmUrZeQAX5pKngaNEObJsDnDACgR9If/858+ZEqGY2cf4KRewlosp+abGoODJ3Je/hzjR6Ait+7yEdfXotz7ImDbACUZWBBxiz02zDEJ3r20v/y8EhGAyb8QCLRJ6MGQbfoW70U3WxdLpKFA1Kntsyj5fouZiZXnZm5LZHUx2zwkIU2tHt02SyfkXUtd9x4xMemBE2z3qv+ExAjJpsVnwQCsh0s2z5CtQrHeeOJLmfuFXYTFhEuKnOu4a/VDOhMiLwTKhfqt2qTf55CAlF607GHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzkmvN1N/gzjrzR3hiO12cNL8meV6iaEqqyJAn9M18g=;
 b=DLuJf2FlKhVxFiJaxvg63T7mX+IYabTVUtZgwmZP6upJS8LklUXkDr2m5Uc2JcggCK/Mw/EeBbxSCXGJy+8/VCc4W/Z/BCyrE6hNjX2nfkMAxaIcfbro3LpjCq9hxbc3Elpq2cicxrmfSyXwkpVasmu2PFqqR3HiNkM57Zzv4WLaoI+sI+guTI6XuH0YwfJhDmXmcChVf5PmBNULo8JssqCHlMzD6B64KpJEKzXSwFQYWBuww5796nVw8Kv9wtZXKnjOjblYhoVqwQud2hBSOYMoywlsl4UxsKsDj855+wp05jMUDmHLVJfJw5WQJUmyc0QFVrXbVWe2AgMbKq9wJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzkmvN1N/gzjrzR3hiO12cNL8meV6iaEqqyJAn9M18g=;
 b=IhD/ZqjV1EABHtF8Lir94+8iYuDTyKqiseaJkMZkxTxehwNHb1pUFLMaMDgE9qN58jUsXoFWY/RGIb/w38VyVZKds4kZkip5+3aaGTAZzlTiuJUPdwaoyvkMZg5hRnysWHcNUZ5cOh3xNB8Jxlf9gOuRIGOkYS25lTtjSLf9L4c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB6992.namprd08.prod.outlook.com (2603:10b6:806:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Sun, 24 Jan
 2021 03:43:44 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Sun, 24 Jan 2021
 03:43:44 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 2/5] input: touchscreen: Broaden use-cases described in comments
Date:   Sat, 23 Jan 2021 21:42:53 -0600
Message-Id: <1611459776-23265-3-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611459776-23265-1-git-send-email-jeff@labundy.com>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Sun, 24 Jan 2021 03:43:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fc58b88-1f2b-46e5-34ac-08d8c01a3f74
X-MS-TrafficTypeDiagnostic: SA1PR08MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR08MB69925352797CA840EFA43D96D3BE9@SA1PR08MB6992.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFtwmDBuTwrL+EEY59lJbeDPcvLTzJ/cfZp0aYjl64tQ8K8aGWBD+YxrE503bYsQaSfg+hDlgiU/kEEaUsO+hv1axLrEQ7dP7wgy23l5cZMaISsET7vIQx2nMrBoyYLQ37JfGDU5mMcgV3hOqf0VAOW4XgSzJ/PfnnX5aZDw88AtJ6/6ptSXzngZ3jbA9I1Fiu0/bcSwGjQdO10CvgeJw7flDyCGmyF3PMmTcdzZybW8L3FprTiI0QecLTtnt41RdMdd4ULdG5upt6b0DSexBfxQ2OEPEAte+TQ/a6gFt40q4FDk9GGG1lMYLpvZFX10aiFsnoD29ArgEHK8+tE+mOSfFgkMjNIp4nkbPuxQDRZ+GPGeldxdmiFfOmOnWqcIXRIYlTWnQ+UvRkS8IHO39TXFdvKg+KAG0O26dZMllJjsND/FALj2HPnN8zc4dIxxN4nCWHTeMY8cNoswCR9ZxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39830400003)(346002)(52116002)(107886003)(5660300002)(66946007)(8676002)(6486002)(6506007)(66556008)(8936002)(36756003)(66476007)(86362001)(69590400011)(2616005)(83380400001)(4326008)(26005)(16526019)(186003)(6512007)(6666004)(316002)(478600001)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ix9hqFo2hPegvH33fxAEyDmv4AGuNt7bSsQRgCZncAO1IlVC6zlcEyQCTwCf?=
 =?us-ascii?Q?EZebJUJjnK47WTbW9lirZyVZTtI9uWJZAR4aLbGm3Tzoi76vGj8zTKXqb3P5?=
 =?us-ascii?Q?luZZ6yLFrPaYTcU1gbLf4e0IcyC/ed/lKUotiPJCX4gsk/q7srmYFg6FXkHG?=
 =?us-ascii?Q?94ZH9/aLnBtjnDVTjFojgUIp2aZBTe1BX0uM5Gbx+oHqfKz5XwhNYI36PYGt?=
 =?us-ascii?Q?lN0WjHsDhAIvKRJjP8n7OPXCVa/tU2bDhTOXv+4g6ZpRSqfGtD8d0KZjetFU?=
 =?us-ascii?Q?wvbWfrmkgf5puV+eJsJZRExpoHC+vkhXzazxSPeex3H3x7wPsaJaqWSJ+wVz?=
 =?us-ascii?Q?HWZ7zm8nnzgTkfUUxIitfNmmxu/nTCXeYQsO1UJzSav8taye+CZOk8GT83Kb?=
 =?us-ascii?Q?iePyXdij010EYcNooSbTGmXcY9opBBnMvjXe7atP7uzndQ85MN1d6AfSlWX5?=
 =?us-ascii?Q?ZHSMfX75MtfqM70KxjkS/Cdgtt+gGd1ghYPldTG2XA05FX23+lLzGEj8ZHYI?=
 =?us-ascii?Q?irHE3BNikyfgvR7OebXrMq2gGeFkJ1aY0Eyt8i/uAhkl8dnPlvRVMXi3mZNk?=
 =?us-ascii?Q?TkCxVSFbRtn+Z5Edabsx/vXx6DqDO7Rr+daaHWJgdREMf8mipy71rRiDIfOw?=
 =?us-ascii?Q?xXtrkgybF0LSEYpkkk8jql+pYPUtinyi3ZvarJUH1DQcGfxgu/tFHbx0J45j?=
 =?us-ascii?Q?wblG1MCaWaocSTvFYOVDPlpFufxUVK2yb7Y0Wmi9vi1t0itbEzJbTjN+9Lg3?=
 =?us-ascii?Q?J0II/U0TbzkiDDHjKY5r066BdgupYYSThumkKBt8PlZtDtsKcXqMlvNUXtuy?=
 =?us-ascii?Q?kZzwD1SDvBOe3J3BEeNohDBqzN8x17O4Ka4OTNsABUicLjCd+etLi2724NS8?=
 =?us-ascii?Q?2LVa9nBW7hX5w2nUas4BVKYNyhWKqM46TmjqEWmiX87aatEnA+J8Y2jiQF8x?=
 =?us-ascii?Q?hjrm++P0hEiAhdxJYggx1IJ7RNjfbmhBr6LeulDVta37QyybVMDh2+jw1gcH?=
 =?us-ascii?Q?8d0B?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc58b88-1f2b-46e5-34ac-08d8c01a3f74
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2021 03:43:44.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcMOztPEU++4A2eroc8/GouDtUOja548wCW7VQYiNHlIIq9pGMl60yT04vBbNNTgD7TDvQ0LCYxgZiAXRjwELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB6992
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
Changes in v2:
 - Added this patch to the series

 drivers/input/touchscreen.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index 97342e1..46cf25c 100644
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
--
2.7.4

