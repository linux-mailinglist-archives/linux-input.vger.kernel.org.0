Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5283F6B5742
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 02:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjCKBKN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 20:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjCKBKM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 20:10:12 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B240EFB8
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 17:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXoPx+9rZSJ7p7NXO8Udcr4o5gVVtBujmvSwIlGLdr3Sfdnx6FOmG3hIAJS7plWaVwYL0vHty6rWJuLzl1BCoXZ9YyRbvTW6/vglWAfFZtQV7VfUwwUK3Ld0oeJs65A3JM9X9T/FqZafsDf5aNQQYScUTv/JVXnNkZmZkE7gakLwJDQX7FW1VWRLqwECiVDyZXbo+mkChyUWh6SoIfYYB0TvnuZRIhDFJOMGoxxKCW3i9dnKGZxXuN35mYjxBIepxBF2EsrQdU+iQV+Heu+9Kq1Kox7trN+uflYAcVgSTlR6hmU3U+k91VY8h1Vpp5L2qRh4g4NTqV9pBFpVUIz2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pIR4O1qfvAvl4lly5+1Mihr5ONU26uvmSq37V4DrB4=;
 b=WdcYbFfO5Z/qryWDtpwSZlDmZRouc3HNRN8aMbsjtgGS9Gh27kCaYmJZKVxH02JK+QrwCyzZf+jhPED80rkGhjDJSu6ND01PzFdtV48BcMir0MW180x3/yAKj9nh+eTZpN+kpBucBKziBicn+gE2lVKdN0unfH2edLTizYj1JwbfBG2MOAwCA1q8dKltUGnuD3nKUrvZWGuhB6Pl2t0uHN9WkzgrZQNaMofsUssOP4nAgWRDfPPAlVVUQpOcsIAJrGMu26crP6FMUQnLZCeqDn7DCerc5jPsrqD9k1xc61YSojO2Vi/JHgoy3p7wF27TfD5obcwPZ3Q4qu1TL4U9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pIR4O1qfvAvl4lly5+1Mihr5ONU26uvmSq37V4DrB4=;
 b=JuS/EFnUOKazfKWK9gjbzdJuVVTXNGvGxHUFG6GgwjvyMwTYuMWEaPRIrAb3ub6OxtnifqnQdYuhG46Kj9xunFfCWSBx0zJVY4JHuwsXFIvBliC6rRAkQvIGBgFl6pkZSuj4JOqOrht3BGgPGn2JPr4W/RpLAhLUBQXI8Yx4YOrjzf3pQ3bDdOCUcCKg+26BzYF+ylD2gYv4n89LrjbRvEnR2u4aYggb5S8V3idMPUXjIMRLKjj2XOiZwA+ilmQ4YThKE/nQR7JenprdVa7YrttcAAOWkRm56UfK6nnEwWKjyFLu2ro4g6JJFux4sMiLlgA+AtfTct1l3hlJ70qPZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN7PR12MB2740.namprd12.prod.outlook.com (2603:10b6:408:23::16)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 01:10:07 +0000
Received: from BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::4136:66b8:8b5a:2214]) by BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::4136:66b8:8b5a:2214%2]) with mapi id 15.20.6178.019; Sat, 11 Mar 2023
 01:10:07 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>
Subject: [PATCH HID for-next v1 1/1] HID: shield: Initial driver implementation with Thunderstrike support
Date:   Fri, 10 Mar 2023 17:09:40 -0800
Message-Id: <20230311010940.57585-2-rrameshbabu@nvidia.com>
X-Mailer: git-send-email 2.38.3
In-Reply-To: <20230311010940.57585-1-rrameshbabu@nvidia.com>
References: <20230311010940.57585-1-rrameshbabu@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::35) To BN7PR12MB2740.namprd12.prod.outlook.com
 (2603:10b6:408:23::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR12MB2740:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e51ea1-1bff-424e-1325-08db21cd5a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Ny1nDWUQkOAsMO1YlJV663/vTLoDPAOSs1OZt/UzOb1iA2c8i9nVmF+rp8x8ipS+yRu/7yuxUZJtJdcILzJmFX2oYxZrj0FFE9eLXEkIvcbdirRcsl1LGtN1CUyONl2kqslFMVOgry6J/i1UnfGixfTcTT1eCLVkx652fVsi4VN471AvVK/4VglrRG4gXSkWu6rdOzNn3JTJqTebkZNz3WdThaEMUvULiH456Eoaj0DLj/ztIK70QImI+LC2wOHzS492TPWjtqG3iO92IB1Be7KcqqJkJ/4Uv8XoDiDa7feesNrhKsaUgA6fPD8J55+wK6zKueofwU4G6Ce/SGE5ABqXxkt0y3M1qi4+VxGAamcpFp7yPhhCC/g/UK/+48PKRoIKlUu481XA1q2mL2iaxLT4sIE8ZDTzSUZqhslS3FuZEa3iNVU7iJsEYjN/zA0QPOjcL4KODQ7xrshk258S8uhseN8wn86YgpEPL9Fjcm78HJzZmoPU/T9Naq69TpmOw/dJ94XpJi9G+nrN8dZQvvD9JfaUU4g4Wzw+Edab5LhtmXrH13wJhTAx84meO0cKvwKCNs+lvuseloJiyzzVcpZCpruZ4JriG0DU3vLlbzO4qBRvrDXCAcW1aD/5EsBAGVblkR7xYOLwEFaVL3QLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2740.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199018)(30864003)(5660300002)(36756003)(86362001)(83380400001)(6666004)(66946007)(6486002)(186003)(107886003)(6506007)(2616005)(6512007)(1076003)(478600001)(4326008)(6916009)(66476007)(41300700001)(8936002)(66556008)(8676002)(54906003)(38100700002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDWVpA+VYzISWRWZonTNwScW6877q6xb4ayO4ETqysTUEm+10/d72f0Xqkg8?=
 =?us-ascii?Q?jCmO1RGeDp6VRoCMW5BgX8WnEc1/rF4S0ZJqs5Xr1hVtlqGZe3UnCcHJloaH?=
 =?us-ascii?Q?+xCfDC/7MGOgk1PKztzprBMAy9RtGDZ8bTN6Oag6TrEpzS95RnBK/6wMSvYF?=
 =?us-ascii?Q?mW/abQuq2ceX5JHzBu8ZtrYm0EG5BukGIJx/NavvUyh4d+RpH4ljB8HSheQh?=
 =?us-ascii?Q?i3QUMuww2W8iZjfCn0YK5C5lB4gjWW+RlQKeNdFR9dg8i8dCZ646Q4Z8VGOk?=
 =?us-ascii?Q?BVcHUP6lr2lva2FoDpQnioqRxn3bDybBR0/nt2YzqAAexjRR3nbXiS4VAZaS?=
 =?us-ascii?Q?aeOAsDf+4ZakEQkL7aVXgZX0pAiFo7HWFtWxeLULC617dY/dmypNLc3eC/Z1?=
 =?us-ascii?Q?2yJ+EaUXkYD7KI8gLU6a3dd/rFooK1J9m9Dr6FqLqU7KgZb8B7FOIVb92H1+?=
 =?us-ascii?Q?VQLCSaUASndurrUlxap4DdbsVeJVNZ8vFwrHzsznsWVBq5FoOqeSge1VO2EU?=
 =?us-ascii?Q?WgIPXVxJ4UIgmx8l5li6fOGXXSZHXfxssUwUdgCl1UlLjyvkwo5ugBDPmYMJ?=
 =?us-ascii?Q?ibYWzYtfiUZOD2P6VS5Ba7WkE8Nct6/HeL4cMHi7Pv00IPQpPgjD8XdBLlvv?=
 =?us-ascii?Q?tYuuAYmtdob2s7TtwBufdFnw9zKRPevqRgccWX4fN8mXOg5LNSGrQK+X9slQ?=
 =?us-ascii?Q?UCt7koRb4zkUvDCInWjKFA5yJE+d46Y8/CRwfA91flBYJQTej0Fk68bWnoN3?=
 =?us-ascii?Q?UHmpcCffB/haACFUAO8ycNfMlw85vOXG2AsR3Pq740Sikew8d2Ne507D02TC?=
 =?us-ascii?Q?xNcXX5/GBmftjslQ5mdZgpuKu7oVQKWu+kDcq0DpJGPUYO1544a7VGnzzOZn?=
 =?us-ascii?Q?QC48n71YEZiAyFAzF+Nj1fdJzx8vEg0whKe8U9yNlFmezMHn6MX/b6tDtEP3?=
 =?us-ascii?Q?xSp4rxruAsR58OQAjfKRvx9WlgPHah0YXPTzFPTuNk1Hwp2OwXFEHRkc/Rbt?=
 =?us-ascii?Q?XUgjh+7MyhAI9/PcPHfihexUCoqCLWP6QwpW/jHlU/j2tfAILaKZQBGhPiGc?=
 =?us-ascii?Q?+UEGeKU2mQktmX/XVa8p3KbZNIAoIg0cMft+GBHYepndYlUUaB0ZZIA7njl4?=
 =?us-ascii?Q?uEW+9aMhIuYtSdzOJb6zKjt/0JodVcglqSJJghFQvJ/JxOACBYoPaS/g5lXI?=
 =?us-ascii?Q?SBH/XO4NR7noCTuWfuGDe/2v9JegfXjAbkBlxvfaRZHh7K5LpHaQaCv6ivQB?=
 =?us-ascii?Q?Mjeb/uDQeCMSyHjEwJvWi1xWFLznzLA9iAxZkgih6aOj1BxqXP1GWpGHtjf+?=
 =?us-ascii?Q?GG05MCMRfptIH4W73sIFtexUbstYwbZeluKXDKnbKG4NoUkL55/IfVxl2aA5?=
 =?us-ascii?Q?Kvgx5cFlUsDNK7P8NPEa5a0LSxl4S5WM+DNhQgur/spCToXNNoAaMxqLJLhs?=
 =?us-ascii?Q?i1pwq5rD5x0WxJOetYJPVzJ55VGUK9jDedEmGpUZp0ibh8hP5BuooLdrGMv8?=
 =?us-ascii?Q?rVB/+kYs1nfr4Cv9I26D8zxwzEWAM26Ve2KDTweaRrIskMOkyDx//a3QRt0+?=
 =?us-ascii?Q?199QlDssFMAfqet3LAuIUcvoyhracA7/pbJlPXczguWgDu3bh3r/mBEF4lcK?=
 =?us-ascii?Q?lxlFlqU3hgOu4Z/S9A1O86eywlPNEkyIFzfZLhoDZJ1VZWr4wQpMxMbuaj9C?=
 =?us-ascii?Q?yelI5A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e51ea1-1bff-424e-1325-08db21cd5a99
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2740.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 01:10:07.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJnLFq4Z0k4t1so7ZuzSzAxnSvJe2LOQlFCVtEUdIJf2se2YDaYpZXcsVZjdmkD/NRQP/r+5nlz3wWemaxCrXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Supports the Thunderstrike (SHIELD 2017) controller. Implements support for
the Thunderstrike HOSTCMD firmware interface. Adds sysfs attributes about a
SHIELD device and introduces haptics support for controllers.

Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
---
 MAINTAINERS              |   6 +
 drivers/hid/Kconfig      |  18 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-ids.h    |   3 +
 drivers/hid/hid-shield.c | 587 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 615 insertions(+)
 create mode 100644 drivers/hid/hid-shield.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a36df9ed283d..e8064131466d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9234,6 +9234,12 @@ F:	drivers/hid/hid-sensor-*
 F:	drivers/iio/*/hid-*
 F:	include/linux/hid-sensor-*
 
+HID SHIELD DRIVER
+M:	Rahul Rameshbabu <rrameshbabu@nvidia.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-shield.c
+
 HID VRC-2 CAR CONTROLLER DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e2a5d30c8895..a886e620a214 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -976,6 +976,24 @@ config HID_SEMITEK
 	- Woo-dy
 	- X-Bows Nature/Knight
 
+config HID_SHIELD
+	tristate "SHIELD HID Driver"
+	depends on USB_HID
+	depends on BT_HIDP
+	help
+	Support for NVIDIA SHIELD accessories.
+
+	Supported devices:
+	- Thunderstrike (NVIDIA SHIELD Controller 2017)
+
+config SHIELD_FF
+	bool "SHIELD force feedback support"
+	depends on HID_SHIELD
+	select INPUT_FF_MEMLESS
+	help
+	Say Y here if you would like to enable force feedback support for
+	NVIDIA SHIELD accessories with haptics capabilities.
+
 config HID_SIGMAMICRO
 	tristate "SiGma Micro-based keyboards"
 	depends on USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index e8014c1a2f8b..7d79c91f2503 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_HID_RMI)		+= hid-rmi.o
 obj-$(CONFIG_HID_SAITEK)	+= hid-saitek.o
 obj-$(CONFIG_HID_SAMSUNG)	+= hid-samsung.o
 obj-$(CONFIG_HID_SEMITEK)	+= hid-semitek.o
+obj-$(CONFIG_HID_SHIELD)	+= hid-shield.o
 obj-$(CONFIG_HID_SIGMAMICRO)	+= hid-sigmamicro.o
 obj-$(CONFIG_HID_SMARTJOYPLUS)	+= hid-sjoy.o
 obj-$(CONFIG_HID_SONY)		+= hid-sony.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 82713ef3aaa6..1cfec6bd542d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -987,6 +987,9 @@
 #define USB_DEVICE_ID_NTRIG_TOUCH_SCREEN_18   0x0014
 #define USB_DEVICE_ID_NTRIG_DUOSENSE 0x1500
 
+#define USB_VENDOR_ID_NVIDIA				0x0955
+#define USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER	0x7214
+
 #define USB_VENDOR_ID_ONTRAK		0x0a07
 #define USB_DEVICE_ID_ONTRAK_ADU100	0x0064
 
diff --git a/drivers/hid/hid-shield.c b/drivers/hid/hid-shield.c
new file mode 100644
index 000000000000..b29af579868f
--- /dev/null
+++ b/drivers/hid/hid-shield.c
@@ -0,0 +1,587 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
+ *
+ *  HID driver for NVIDIA SHIELD peripherals.
+ */
+
+#include <linux/hid.h>
+#include <linux/input-event-codes.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+#include "hid-ids.h"
+
+#define NOT_INIT_STR "NOT INITIALIZED"
+
+enum {
+	SHIELD_FW_VERSION_INITIALIZED = 0,
+	SHIELD_BOARD_INFO_INITIALIZED,
+};
+
+enum {
+	THUNDERSTRIKE_FW_VERSION_UPDATE = 0,
+	THUNDERSTRIKE_BOARD_INFO_UPDATE,
+	THUNDERSTRIKE_HAPTICS_UPDATE,
+};
+
+enum {
+	THUNDERSTRIKE_HOSTCMD_REPORT_SIZE = 33,
+	THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID = 0x4,
+	THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID = 0x3,
+};
+
+enum {
+	THUNDERSTRIKE_HOSTCMD_ID_FW_VERSION = 1,
+	THUNDERSTRIKE_HOSTCMD_ID_BOARD_INFO = 16,
+	THUNDERSTRIKE_HOSTCMD_ID_USB_INIT = 53,
+	THUNDERSTRIKE_HOSTCMD_ID_HAPTICS = 57,
+	THUNDERSTRIKE_HOSTCMD_ID_BLUETOOTH_INIT = 58,
+};
+
+struct thunderstrike_hostcmd_board_info {
+	__le16 revision;
+	__le16 serial[7];
+};
+
+struct thunderstrike_hostcmd_haptics {
+	u8 motor_left;
+	u8 motor_right;
+};
+
+struct thunderstrike_hostcmd_resp_report {
+	u8 report_id; /* THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID */
+	u8 cmd_id;
+	u8 reserved_at_10;
+
+	union {
+		struct thunderstrike_hostcmd_board_info board_info;
+		struct thunderstrike_hostcmd_haptics motors;
+		__le16 fw_version;
+		u8 payload[30];
+	};
+} __packed;
+static_assert(sizeof(struct thunderstrike_hostcmd_resp_report) ==
+	      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
+
+struct thunderstrike_hostcmd_req_report {
+	u8 report_id; /* THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID */
+	u8 cmd_id;
+	u8 reserved_at_10;
+
+	struct {
+		u8 update;
+		struct thunderstrike_hostcmd_haptics motors;
+	} haptics;
+	u8 reserved_at_30[27];
+} __packed;
+static_assert(sizeof(struct thunderstrike_hostcmd_req_report) ==
+	      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
+
+/* Common struct for shield accessories. */
+struct shield_device {
+	struct hid_device *hdev;
+
+	unsigned long initialized_flags;
+	const char *codename;
+	u16 fw_version;
+	struct {
+		u16 revision;
+		char serial_number[15];
+	} board_info;
+};
+
+struct thunderstrike {
+	struct shield_device base;
+
+	/* Sub-devices */
+	struct input_dev *haptics_dev;
+
+	/* Resources */
+	void *req_report_dmabuf;
+	unsigned long update_flags;
+	struct thunderstrike_hostcmd_haptics haptics_val;
+	spinlock_t haptics_update_lock;
+	struct work_struct hostcmd_req_work;
+};
+
+static inline void thunderstrike_hostcmd_req_report_init(
+	struct thunderstrike_hostcmd_req_report *report, u8 cmd_id)
+{
+	memset(report, 0, sizeof(*report));
+	report->report_id = THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID;
+	report->cmd_id = cmd_id;
+}
+
+static inline void shield_strrev(char *dest, size_t len, u16 rev)
+{
+	dest[0] = ('A' - 1) + (rev >> 8);
+	snprintf(&dest[1], len - 1, "%02X", 0xff & rev);
+}
+
+static struct input_dev *shield_allocate_input_dev(struct hid_device *hdev,
+						   const char *name_suffix)
+{
+	struct input_dev *idev;
+
+	idev = input_allocate_device();
+	if (!idev)
+		goto err_device;
+
+	idev->id.bustype = hdev->bus;
+	idev->id.vendor = hdev->vendor;
+	idev->id.product = hdev->product;
+	idev->id.version = hdev->version;
+	idev->uniq = hdev->uniq;
+	idev->name = devm_kasprintf(&idev->dev, GFP_KERNEL, "%s %s", hdev->name,
+				    name_suffix);
+	if (!idev->name)
+		goto err_name;
+
+	input_set_drvdata(idev, hdev);
+
+	return idev;
+
+err_name:
+	input_free_device(idev);
+err_device:
+	return ERR_PTR(-ENOMEM);
+}
+
+static struct input_dev *shield_haptics_create(
+	struct shield_device *dev,
+	int (*play_effect)(struct input_dev *, void *, struct ff_effect *))
+{
+	struct input_dev *haptics;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_SHIELD_FF))
+		return NULL;
+
+	haptics = shield_allocate_input_dev(dev->hdev, "Haptics");
+	if (IS_ERR(haptics))
+		return haptics;
+
+	input_set_capability(haptics, EV_FF, FF_RUMBLE);
+	input_ff_create_memless(haptics, NULL, play_effect);
+
+	ret = input_register_device(haptics);
+	if (ret)
+		goto err;
+
+	return haptics;
+
+ err:
+	input_free_device(haptics);
+	return ERR_PTR(ret);
+}
+
+static inline void thunderstrike_send_hostcmd_request(struct thunderstrike *ts)
+{
+	struct thunderstrike_hostcmd_req_report *report = ts->req_report_dmabuf;
+	struct shield_device *shield_dev = &ts->base;
+	int ret;
+
+	ret = hid_hw_raw_request(shield_dev->hdev, report->report_id,
+				 ts->req_report_dmabuf,
+				 THUNDERSTRIKE_HOSTCMD_REPORT_SIZE,
+				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+
+	if (ret < 0) {
+		hid_err(shield_dev->hdev,
+			"Failed to output Thunderstrike HOSTCMD request HID report due to %pe\n",
+			ERR_PTR(ret));
+	}
+}
+
+void thunderstrike_hostcmd_req_work_handler(struct work_struct *work)
+{
+	struct thunderstrike *ts =
+		container_of(work, struct thunderstrike, hostcmd_req_work);
+	struct thunderstrike_hostcmd_req_report *report;
+	unsigned long flags;
+
+	report = ts->req_report_dmabuf;
+
+	if (test_and_clear_bit(THUNDERSTRIKE_FW_VERSION_UPDATE, &ts->update_flags)) {
+		thunderstrike_hostcmd_req_report_init(
+			report, THUNDERSTRIKE_HOSTCMD_ID_FW_VERSION);
+		thunderstrike_send_hostcmd_request(ts);
+	}
+
+	if (test_and_clear_bit(THUNDERSTRIKE_BOARD_INFO_UPDATE, &ts->update_flags)) {
+		thunderstrike_hostcmd_req_report_init(
+			report, THUNDERSTRIKE_HOSTCMD_ID_BOARD_INFO);
+		thunderstrike_send_hostcmd_request(ts);
+	}
+
+	if (test_and_clear_bit(THUNDERSTRIKE_HAPTICS_UPDATE, &ts->update_flags)) {
+		thunderstrike_hostcmd_req_report_init(
+			report, THUNDERSTRIKE_HOSTCMD_ID_HAPTICS);
+
+		report->haptics.update = 1;
+		spin_lock_irqsave(&ts->haptics_update_lock, flags);
+		report->haptics.motors = ts->haptics_val;
+		spin_unlock_irqrestore(&ts->haptics_update_lock, flags);
+
+		thunderstrike_send_hostcmd_request(ts);
+	}
+}
+
+static inline void thunderstrike_request_firmware_version(struct thunderstrike *ts)
+{
+	set_bit(THUNDERSTRIKE_FW_VERSION_UPDATE, &ts->update_flags);
+	schedule_work(&ts->hostcmd_req_work);
+}
+
+static inline void thunderstrike_request_board_info(struct thunderstrike *ts)
+{
+	set_bit(THUNDERSTRIKE_BOARD_INFO_UPDATE, &ts->update_flags);
+	schedule_work(&ts->hostcmd_req_work);
+}
+
+static inline int
+thunderstrike_update_haptics(struct thunderstrike *ts,
+			     struct thunderstrike_hostcmd_haptics *motors)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ts->haptics_update_lock, flags);
+	ts->haptics_val = *motors;
+	spin_unlock_irqrestore(&ts->haptics_update_lock, flags);
+
+	set_bit(THUNDERSTRIKE_HAPTICS_UPDATE, &ts->update_flags);
+	schedule_work(&ts->hostcmd_req_work);
+
+	return 0;
+}
+
+static int thunderstrike_play_effect(struct input_dev *idev, void *data,
+				     struct ff_effect *effect)
+{
+	struct hid_device *hdev = input_get_drvdata(idev);
+	struct thunderstrike_hostcmd_haptics motors;
+	struct shield_device *shield_dev;
+	struct thunderstrike *ts;
+
+	if (effect->type != FF_RUMBLE)
+		return 0;
+
+	shield_dev = hid_get_drvdata(hdev);
+	ts = container_of(shield_dev, struct thunderstrike, base);
+
+	/* Thunderstrike motor values range from 0 to 32 inclusively */
+	motors.motor_left = effect->u.rumble.strong_magnitude / 2047;
+	motors.motor_right = effect->u.rumble.weak_magnitude / 2047;
+
+	hid_dbg(hdev, "Thunderstrike FF_RUMBLE request, left: %u right: %u\n",
+		motors.motor_left, motors.motor_right);
+
+	return thunderstrike_update_haptics(ts, &motors);
+}
+
+static void
+thunderstrike_parse_fw_version_payload(struct shield_device *shield_dev,
+				       __le16 fw_version)
+{
+	shield_dev->fw_version = le16_to_cpu(fw_version);
+
+	set_bit(SHIELD_FW_VERSION_INITIALIZED, &shield_dev->initialized_flags);
+
+	hid_dbg(shield_dev->hdev, "Thunderstrike firmware version 0x%04X\n",
+		shield_dev->fw_version);
+}
+
+static void
+thunderstrike_parse_board_info_payload(struct shield_device *shield_dev,
+				       struct thunderstrike_hostcmd_board_info *board_info)
+{
+	char board_revision_str[4];
+	int i;
+
+	shield_dev->board_info.revision = le16_to_cpu(board_info->revision);
+	for (i = 0; i < 7; ++i) {
+		u16 val = le16_to_cpu(board_info->serial[i]);
+
+		shield_dev->board_info.serial_number[2 * i] = val & 0xFF;
+		shield_dev->board_info.serial_number[2 * i + 1] = val >> 8;
+	}
+	shield_dev->board_info.serial_number[14] = '\0';
+
+	set_bit(SHIELD_BOARD_INFO_INITIALIZED, &shield_dev->initialized_flags);
+
+	shield_strrev(board_revision_str, 4, shield_dev->board_info.revision);
+	hid_dbg(shield_dev->hdev,
+		"Thunderstrike BOARD_REVISION_%s (0x%04X) S/N: %s\n",
+		board_revision_str, shield_dev->board_info.revision,
+		shield_dev->board_info.serial_number);
+}
+
+static inline void
+thunderstrike_parse_haptics_payload(struct shield_device *shield_dev,
+				    struct thunderstrike_hostcmd_haptics *haptics)
+{
+	hid_dbg(shield_dev->hdev,
+		"Thunderstrike haptics HOSTCMD response, left: %u right: %u\n",
+		haptics->motor_left, haptics->motor_right);
+}
+
+static int thunderstrike_parse_report(struct shield_device *shield_dev,
+				      struct hid_report *report, u8 *data,
+				      int size)
+{
+	struct thunderstrike_hostcmd_resp_report *hostcmd_resp_report;
+	struct thunderstrike *ts =
+		container_of(shield_dev, struct thunderstrike, base);
+	struct hid_device *hdev = shield_dev->hdev;
+
+	switch (report->id) {
+	case THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID:
+		if (size != THUNDERSTRIKE_HOSTCMD_REPORT_SIZE) {
+			hid_err(hdev,
+				"Encountered Thunderstrike HOSTCMD HID report with unexpected size %d\n",
+				size);
+			return -EINVAL;
+		}
+
+		hostcmd_resp_report =
+			(struct thunderstrike_hostcmd_resp_report *)data;
+
+		switch (hostcmd_resp_report->cmd_id) {
+		case THUNDERSTRIKE_HOSTCMD_ID_FW_VERSION:
+			thunderstrike_parse_fw_version_payload(
+				shield_dev, hostcmd_resp_report->fw_version);
+			break;
+		case THUNDERSTRIKE_HOSTCMD_ID_BOARD_INFO:
+			thunderstrike_parse_board_info_payload(
+				shield_dev, &hostcmd_resp_report->board_info);
+			break;
+		case THUNDERSTRIKE_HOSTCMD_ID_HAPTICS:
+			thunderstrike_parse_haptics_payload(
+				shield_dev, &hostcmd_resp_report->motors);
+			break;
+
+		case THUNDERSTRIKE_HOSTCMD_ID_USB_INIT:
+		case THUNDERSTRIKE_HOSTCMD_ID_BLUETOOTH_INIT:
+			/* May block HOSTCMD requests till received initially */
+			thunderstrike_request_firmware_version(ts);
+			thunderstrike_request_board_info(ts);
+			/* Only HOSTCMD that can be triggered without a request */
+			return 0;
+		default:
+			hid_warn(hdev,
+				 "Unhandled Thunderstrike HOSTCMD id %d\n",
+				 hostcmd_resp_report->cmd_id);
+			return -ENOENT;
+		}
+
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static struct shield_device *thunderstrike_create(struct hid_device *hdev)
+{
+	struct shield_device *shield_dev;
+	struct thunderstrike *ts;
+
+	ts = devm_kzalloc(&hdev->dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return ERR_PTR(-ENOMEM);
+
+	ts->req_report_dmabuf = devm_kzalloc(
+		&hdev->dev, THUNDERSTRIKE_HOSTCMD_REPORT_SIZE, GFP_KERNEL);
+	if (!ts->req_report_dmabuf)
+		return ERR_PTR(-ENOMEM);
+
+	shield_dev = &ts->base;
+	shield_dev->hdev = hdev;
+	shield_dev->codename = "Thunderstrike";
+
+	spin_lock_init(&ts->haptics_update_lock);
+	INIT_WORK(&ts->hostcmd_req_work, thunderstrike_hostcmd_req_work_handler);
+
+	hid_set_drvdata(hdev, shield_dev);
+
+	ts->haptics_dev = shield_haptics_create(shield_dev, thunderstrike_play_effect);
+	if (IS_ERR(ts->haptics_dev))
+		return ERR_CAST(ts->haptics_dev);
+
+	hid_info(hdev, "Registered Thunderstrike controller\n");
+	return shield_dev;
+}
+
+static ssize_t firmware_version_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct shield_device *shield_dev;
+	int ret;
+
+	shield_dev = hid_get_drvdata(hdev);
+
+	if (test_bit(SHIELD_FW_VERSION_INITIALIZED, &shield_dev->initialized_flags))
+		ret = sysfs_emit(buf, "0x%04X\n", shield_dev->fw_version);
+	else
+		ret = sysfs_emit(buf, NOT_INIT_STR "\n");
+
+	return ret;
+}
+
+static DEVICE_ATTR_RO(firmware_version);
+
+static ssize_t hardware_version_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct shield_device *shield_dev;
+	char board_revision_str[4];
+	int ret;
+
+	shield_dev = hid_get_drvdata(hdev);
+
+	if (test_bit(SHIELD_BOARD_INFO_INITIALIZED, &shield_dev->initialized_flags)) {
+		shield_strrev(board_revision_str, 4, shield_dev->board_info.revision);
+		ret = sysfs_emit(buf, "%s BOARD_REVISION_%s (0x%04X)\n",
+				 shield_dev->codename, board_revision_str,
+				 shield_dev->board_info.revision);
+	} else
+		ret = sysfs_emit(buf, NOT_INIT_STR "\n");
+
+	return ret;
+}
+
+static DEVICE_ATTR_RO(hardware_version);
+
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct shield_device *shield_dev;
+	int ret;
+
+	shield_dev = hid_get_drvdata(hdev);
+
+	if (test_bit(SHIELD_BOARD_INFO_INITIALIZED, &shield_dev->initialized_flags))
+		ret = sysfs_emit(buf, "%s\n", shield_dev->board_info.serial_number);
+	else
+		ret = sysfs_emit(buf, NOT_INIT_STR "\n");
+
+	return ret;
+}
+
+static DEVICE_ATTR_RO(serial_number);
+
+static struct attribute *shield_device_attrs[] = {
+	&dev_attr_firmware_version.attr,
+	&dev_attr_hardware_version.attr,
+	&dev_attr_serial_number.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(shield_device);
+
+static int shield_raw_event(struct hid_device *hdev, struct hid_report *report,
+			    u8 *data, int size)
+{
+	struct shield_device *dev = hid_get_drvdata(hdev);
+
+	return thunderstrike_parse_report(dev, report, data, size);
+}
+
+static int shield_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct shield_device *shield_dev = NULL;
+	struct thunderstrike *ts;
+	int ret;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Parse failed\n");
+		return ret;
+	}
+
+	switch (id->product) {
+	case USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER:
+		shield_dev = thunderstrike_create(hdev);
+		break;
+	}
+
+	if (unlikely(!shield_dev)) {
+		hid_err(hdev, "Failed to identify SHIELD device\n");
+		return -ENODEV;
+	}
+	if (IS_ERR(shield_dev)) {
+		hid_err(hdev, "Failed to create SHIELD device\n");
+		return PTR_ERR(shield_dev);
+	}
+
+	ts = container_of(shield_dev, struct thunderstrike, base);
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
+	if (ret) {
+		hid_err(hdev, "Failed to start HID device\n");
+		goto err_haptics;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "Failed to open HID device\n");
+		goto err_stop;
+	}
+
+	thunderstrike_request_firmware_version(ts);
+	thunderstrike_request_board_info(ts);
+
+	return ret;
+
+err_stop:
+	hid_hw_stop(hdev);
+err_haptics:
+	if (ts->haptics_dev)
+		input_unregister_device(ts->haptics_dev);
+	return ret;
+}
+
+static void shield_remove(struct hid_device *hdev)
+{
+	struct shield_device *dev = hid_get_drvdata(hdev);
+	struct thunderstrike *ts;
+
+	ts = container_of(dev, struct thunderstrike, base);
+
+	hid_hw_close(hdev);
+	if (ts->haptics_dev)
+		input_unregister_device(ts->haptics_dev);
+	cancel_work_sync(&ts->hostcmd_req_work);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id shield_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NVIDIA,
+			       USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NVIDIA,
+			 USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER) },
+	{}
+};
+MODULE_DEVICE_TABLE(hid, shield_devices);
+
+static struct hid_driver shield_driver = {
+	.name         = "shield",
+	.id_table     = shield_devices,
+	.probe        = shield_probe,
+	.remove       = shield_remove,
+	.raw_event    = shield_raw_event,
+	.driver = {
+		.dev_groups = shield_device_groups,
+	},
+};
+module_hid_driver(shield_driver);
+
+MODULE_AUTHOR("Rahul Rameshbabu <rrameshbabu@nvidia.com>");
+MODULE_DESCRIPTION("HID Driver for NVIDIA SHIELD peripherals.");
+MODULE_LICENSE("GPL");
-- 
2.38.3

