Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24ED17A361E
	for <lists+linux-input@lfdr.de>; Sun, 17 Sep 2023 17:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjIQPT0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Sep 2023 11:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjIQPTM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Sep 2023 11:19:12 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A394B5
        for <linux-input@vger.kernel.org>; Sun, 17 Sep 2023 08:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo+ajalnC4HunYcfQsrYaaRmlEbl0jw07iXD12yIpB+QSnikTWthTtjUrh8kYJtPQy+8/yGa7UQl0JMzvwMJtsHpVH0OEcydZ1l18ALyNf4/Aaf09L0uCOwl8bk5hfDngk5+Kc+2AS6WOfCeeKdKkMTau50/VGwSAyzOIykssONxtrEsfSGSCJMhM4hlsGubUyxPqEfQbVWGtf8WrnHWWCwnfdhaklCFR8gM8wCR9qOTU9YNRD/ncwzqPKc9V6W9E2JmMjYZcrHQ3RzvdgzpPkC0dpcCsU/mpuhOTdFaol6EALZGurO/TvbDhVqtHp7cBJVWQRjcxtwIGdeuMrvYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJsOTJcca6kv0nXQpSC5xgBjqEbp5eaGxGKlFm9xijw=;
 b=X+83L8PQzatH7HFa1xrgoFy4kRd4y/cTgf32r9yA2vmwlSZDScIEC1BexS9F7BNuXeu6fKaD1PT8YuMTKudItdLKTTqT/3GK5Ux9xG+FTKLNbulWsthHBiUbtqb2bH/WesGC7KdlK4W9kR4XJSbENh2FZCvg73hwCV/tdUukw5eZNvV2oGCSdysA//w3rt2Y0RsYSPR36tnatP+nHLKqyu0m19QPO7e7ZG+0CeWic37jv0YuoA1v9dexPFj3SBT0la1mXroOTYDdxxW399eLmQRhG98xZh3XmOpvjKsrM8Lc6kYK+hTsP+HDDWMV48v8qmjgQM9wd5429jS1BnCAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJsOTJcca6kv0nXQpSC5xgBjqEbp5eaGxGKlFm9xijw=;
 b=O7kgazh+OWnhlvymeD/mwmr/A+Zn0ombz66AyFJbnE7XHlWlNV/EKmCC08znLCHCOkAT3+ciNPM842VZ0RfI5YgUEYWVG4G7sxhycQxLpM+rNXh8TcbOUa6J9fYTC9pQoN12iYOwBDaTXFD2fOb/t3ZBZmoN+6t8ydzmHBOnMud+VoEmhipAPJpiVUydT4NzkXwWRAxeVM9bz/I2z+R7hZpOCsNwVNnT2MLwfpJ2MZTIXv+rmDt5BjLTDS1PO/div47E1dRwVwKN++Fet8a52et1XRhogQtCXOUCI/MH/HPjbA9xFDeboL2F08KlEZmO7IU6qyv75G/gGAVIWbnEzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Sun, 17 Sep
 2023 15:19:03 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::5cc1:1ea3:4ec5:72af]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::5cc1:1ea3:4ec5:72af%5]) with mapi id 15.20.6792.024; Sun, 17 Sep 2023
 15:19:02 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>
Subject: [PATCH] HID: nvidia-shield: Select POWER_SUPPLY Kconfig option
Date:   Sun, 17 Sep 2023 08:18:50 -0700
Message-Id: <20230917151850.62505-1-rrameshbabu@nvidia.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0374.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::19) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb6d02a-ae3f-4da9-edef-08dbb7916c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFc61y6JoDpL3GXNCGV+FgYixWtnLpmR3RB4Uall6msIANTJdvnC9CIkOf3zZ6CpZYHEryona9Zhr09Tw5jLFqGIlmqW+KaZLqyQqpPlGNRmoNzucnZv4QqRZlqjW4LOkhrhSGrsSRvWkFvbKfFkOXT46B3sgzkNONyRM88PhtqbPUtAHbzphFpACnM8WhWkyMpKQBNzsxYQM1bWvF/89VvLHYD0bzM+Bv8us9WDmRlHl8V2h2ixUJq4e6f7NXwnzbgoSuhXAXGSXyx0miRmxr8aFMpE4I8F8EuVipNP4uaVXgfgqu+Emdw9EKyglQatY2df+8qRPPm2KdT/54lgnSGV6oSURXTytl444XISNciQBPM6RQ/335va8CPN7lvTkH8ufoyBbd5d47YtdJoKCr6dQj8nP39lRBO2NeqUKxlh4HLhA7leYPqcA3I9PuQq3f29wA+/Yg7sG5Ltl2U0HvgCrwK6xUM/3x+EqijCsY7X7NNIAJPF7O4FL8e/Fl2iqi1sRIm+yLMfTTO1wc80CcyFH0e6ZkkbQWdLMn7qN8vSepXgf3+COF6SDTsfvm6G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(186009)(1800799009)(451199024)(36756003)(4744005)(2906002)(86362001)(6512007)(107886003)(26005)(1076003)(2616005)(83380400001)(6486002)(6666004)(5660300002)(478600001)(38100700002)(6506007)(8936002)(8676002)(4326008)(316002)(41300700001)(66556008)(66476007)(66946007)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cb/esGkk/WJ//7SHtR7Z+SiYQKSbUPvcZ5ys0xf5ePx0hLdQoVsVkzFJP0fZ?=
 =?us-ascii?Q?+L/oPkWCouLOS+Rkq/0S1/DRBkuY1vZGjqxB7rinTnqq1Um5IdTWSqvnKphk?=
 =?us-ascii?Q?PflMm3xaKqnXN0MhXGQYWID5TKbPzVWO9PASs6qg3SgPOtz2oCbYxyDTNI0s?=
 =?us-ascii?Q?zWQZVhZps+CmWuAqfbuh9Vg13MklFEXMk22Kl3ElXer1FAl3uTnsgd9D4JsL?=
 =?us-ascii?Q?PE+cHf38lI/R+E5eRHyGP+5zvvgSK/l4sU6fW6m/adOQqXy8Qp6EGTuYXCSB?=
 =?us-ascii?Q?knV1baiWaB/MDlHjbp7GJlO8dUaFJQxrIF7VExIEvwOia8GSUCNQT6i7oPzJ?=
 =?us-ascii?Q?Y/BwP29RD0pOArkYiXw6VLDCixlczLL23G3oXA4LgfJzCDv3+q9f+AbRLJP0?=
 =?us-ascii?Q?+w4BrSKIPaq/gw8XZPU17aVN9TugW+xDdQkvxPcxrCIVe5SPE4Yldr08Q3Q8?=
 =?us-ascii?Q?gDhG1uV7QP00AJfQHIECUUi8w9oEOBwyf/lmeZje/JNDwqPx9NZppoY5bvvA?=
 =?us-ascii?Q?gJnS+R7yAt2xvwVBYpfhsjdSLUJ1WCp7ZyEVyNGwRYjrwzZrLwnqL9eOZMMQ?=
 =?us-ascii?Q?ETZPOaoDJkMGVc/TwTbYvuyv4nUep2zoN5aYr0tDGefjYEqiyhthAl65sJat?=
 =?us-ascii?Q?3VOOIwnnitlVCpyyvUO59PR6+s/YkHeYm1KIqKULmmR0j9geo9+ykQA973RG?=
 =?us-ascii?Q?3wVKpTih+LXSYrrCY/1dl+EGj0LW1KoMyutmvGHM/eOKoV8rC13pDZtviYzB?=
 =?us-ascii?Q?DGUzUDVljbV9aE0GVkfeO/GX1f50Lg7RI0dHvs9pRCIfFu25lG7O+RVvc/4y?=
 =?us-ascii?Q?QzVs2B3PvZmcurZPyJDAmSrS28MdsuF8aYr6wqrtRXlKwPf2hRSi9EJ3gSCN?=
 =?us-ascii?Q?7ZemYrL9tkeQ3qCz1SIjQ7C+2cPsxtqiOhHo58T2Qrr8jvik2j8+HzBtXAp/?=
 =?us-ascii?Q?xVW2hNldFInQQ/aVfw1bdIPxuZzoErByoOAvIlkRb4ZgOJZnRH/99REzGrLX?=
 =?us-ascii?Q?TAkxL8JyCdBzGv3OUmOI0hm+W8du64FrSSAuXHPFrcnkC58vGxIbZnXt49om?=
 =?us-ascii?Q?43aUgezyZikhmjIJaiKszBbIeplpGjLO7cqyJR1NhX5NKIwcIEIw9cM8Y1G4?=
 =?us-ascii?Q?nl38Rdjzsh1yA8+IztqQXTDvtrFI/mE52L1gkPO4zcp+eDTd5f6Pc9fFxyWf?=
 =?us-ascii?Q?03eNvOIP5AmTkkrPOuD7C2/98rMe8s62Ld0YVIi8Fh3IPeFXQiDgWNnHQ//F?=
 =?us-ascii?Q?+BHhbVf2/S7Sy2+wlWZclE625PrfVgLmqkOxeUDG+kvLPJue7N8mT5spgWOe?=
 =?us-ascii?Q?BN5xotSQRUuIqT2fD7eohIJWBiWnn9jEOSIIiJP2fiOwLNNahafrOfMAPm2a?=
 =?us-ascii?Q?dj6RQohybdJzhb6gUcvMHpQ8WYKDDeRkALfLj/XrdCjHnP3otIGuftWGozAZ?=
 =?us-ascii?Q?cwoPlV9UDx9GE+eVC8Iwd8tYzQ+6Aueot9WZAH4s5KK+oxcbQ+htrXx9b/7Q?=
 =?us-ascii?Q?7kLU0W51t1cV1v8QFsgKvBv4eYyNRuRVO/rguaqg8vlYiomCy32kZOclCTj+?=
 =?us-ascii?Q?1quSppiO5obSsJHCy3MUaylgQRH2GK8Vb9KwHIPd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb6d02a-ae3f-4da9-edef-08dbb7916c43
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2023 15:19:01.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGzFWdRjhfQjGzXYwB9O7uLuS8klyFPemB5OGRebt0UEh4hBnX3v6/Km7aLMFy0WQgZxsKUyEg3lzuLsXOGtYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Battery information reported by the driver depends on the power supply
subsystem. Select the required subsystem when the HID_NVIDIA_SHIELD Kconfig
option is enabled.

Fixes: 3ab196f88237 ("HID: nvidia-shield: Add battery support for Thunderstrike")
Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e11c1c803676..dc227f477601 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -792,6 +792,7 @@ config HID_NVIDIA_SHIELD
 	tristate "NVIDIA SHIELD devices"
 	depends on USB_HID
 	depends on BT_HIDP
+	select POWER_SUPPLY
 	help
 	  Support for NVIDIA SHIELD accessories.
 
-- 
2.40.1

