Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C0D415E67
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240955AbhIWMb7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:31:59 -0400
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com ([40.107.223.88]:3297
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240828AbhIWMb6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:31:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMU1M3u+b9/5wZDjQD/t76rlJBNQXvoaQ/+HQ3r5yfpcFJW6L8qyDlFqgwmQU+wGTLKuA8wbIJ7i2Q2hxsdiWjF1DDwsobNEUyU+wiRliZ5vbk11RqVDR7ZQLOCftJRTJYg9+TERUjtRvGakWQ4tgXQwznr2RDHMUYuiX6Nt7eo5erb8fObXYMJUPDAmSVCG3TfOyllsKsk1MF7mr6UhalO4qGknz8ppnXNlGj1A6qCTowbb5YP+ikjsAAdglD67KmP1Ert/yRanSYQqfkIXIdKXg4vgjttnPqLGIbdBPM1219BbdZzIEKicXK+Tcr2jCMS1aaA2w1bdL9AvNq0+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BlY+5t1K3fPUchu5e2hkSQpuFIWbVgHLWCURu0Vi1x0=;
 b=gjWJxeLyEwuaxoyipYo7D4z7SGOqJPPqwhiM00KDw8vZgeFfLXFLRSZCAA1iZ4efqzXJi9JzzHQjka6I+cRjjJ2jpUf3VHFooQZ9ECzMuEwy0zFljaKO6reC46uYJ3aQHuWy5KahU8Cj4Ne9UmdSQ9JtVMvhUvg2z8jdT9ma8GYankOwnNs74oCiIXvZ7a1y/Soel5MAzT6eCjGswiPXQw6Y+kzdXr2pC0bXhKSxSST24ikbg15r8zGx1Le2PAMcJzDaPfkteH8UZO6Cq9kGO5NSxuZ8OHb3s+x8wKnk2IbsrSURVRMocbwtsOZ2O3tGQXZiW/ssdgb16QcTZPEtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlY+5t1K3fPUchu5e2hkSQpuFIWbVgHLWCURu0Vi1x0=;
 b=lVn/74FmGyJ0Fw1FkK8nXUKC9ZeLSv5LV8VrmS5bXLfPfPyAHer/GS3JiQ4QIB1Q4hDOCDAI6FAKYoXPD+Xp7c5TmjxBKT2m7K01S5Cy32nSIGCdghjePcxL5F+dVROZupQa1fLWCyL3vFAhrzwWKCQZA1YIbxk7LdNGpN0yWO0=
Received: from DS7PR03CA0103.namprd03.prod.outlook.com (2603:10b6:5:3b7::18)
 by DM8PR12MB5461.namprd12.prod.outlook.com (2603:10b6:8:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:30:26 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::67) by DS7PR03CA0103.outlook.office365.com
 (2603:10b6:5:3b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:30:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 07:30:23 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 4/4] amd_sfh: Update Copyright details
Date:   Thu, 23 Sep 2021 17:59:30 +0530
Message-ID: <20210923122930.3873914-5-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
References: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a09a5de-af66-4d39-4536-08d97e8debb1
X-MS-TrafficTypeDiagnostic: DM8PR12MB5461:
X-Microsoft-Antispam-PRVS: <DM8PR12MB546104624D0FFA97BFA36631E6A39@DM8PR12MB5461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:101;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NhiLwieBwdhg+tHwlaKfUOHYA7eVBVeh+qTOVLIjtuMBLvHdMkg9f9REdvTbDJoD+xcuH31hgB3EdBh9goRTXW1pnQoZb0z/IZbpg4JJ6pI6FIDRa6/i60ncLgK+tlzzdaHQG5BWYOiS4JDxokwkXIrzgkpWhrQ0WxYwff0Tf+4IfRL08as+IZ9aXtXLaU/VKkRJkeyDmpaATXcgk8jmi3HwYOoLq971HG+JNMXlriJzHO481bX3Ry7tNQ7mK/UuDhgdl7K9kGaNIp3oPNSHIBagmK7WjoferbthIpyFI43vbNWT2h0Jvx7DCo5FZsubf96dm9kjYn/ao5VLG6qtomyHpqQhk4IVqVlDD5Ov8oNuET5WVhwWLzAa/sURFTWgA1Is/E/Iani8eeSqcNjucV1tFuFzM9zSOJ50t/5aUZKZrnaBoLJe3M61p6P01MRUoxewhyj/CCD9qMgFsRk9cUL2MQzi4DyxfdPJ02rM0VnurbAO1iLn8BZmDFrVvA53Mo3pECkvQUSG3GECzubD/rPjsOHjmLWTJLaX7weV1Mzbj/q7OFJY4Mv1n5AMsccLxqvdOwIspg6mZfeoZ6J7uCTkyZHeFi/tS1k2/C/RpFqBa36Py3Sa4RtX1OfT5+9L/fTAT52RWkZIX1v5nNhzaAAA19YLeI+gD3/iYjHgh6nFUeshk+0ECd9DVhX5T2sxICYRgQQ63pDDfhK94SEASm1zk8SCn1KjoXTJRtpD9es=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(2906002)(110136005)(316002)(356005)(5660300002)(47076005)(508600001)(70586007)(70206006)(81166007)(82310400003)(8676002)(15650500001)(83380400001)(426003)(36756003)(186003)(8936002)(1076003)(7696005)(4326008)(86362001)(16526019)(36860700001)(6666004)(336012)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:30:25.8538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a09a5de-af66-4d39-4536-08d97e8debb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5461
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update the Copyright header and Author

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c                      | 3 ++-
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c                         | 2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h                         | 2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c                        | 4 +++-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h                        | 3 ++-
 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c     | 3 ++-
 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h     | 3 ++-
 .../hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h  | 3 ++-
 8 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 840fd075c56f..c5de0ec4f9d0 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  AMD SFH Client Layer
- *  Copyright 2020 Advanced Micro Devices, Inc.
+ *  Copyright 2020-2021 Advanced Micro Devices, Inc.
  *  Authors: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
  *	     Sandeep Singh <Sandeep.singh@amd.com>
+ *	     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #include <linux/dma-mapping.h>
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index 5ad1e7acd294..2bf97b6ac973 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -2,8 +2,10 @@
 /*
  * AMD MP2 Sensors transport driver
  *
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
  * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
  *	    Sandeep Singh <sandeep.singh@amd.com>
+ *	    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 #include <linux/hid.h>
 #include <linux/wait.h>
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index ae2ac9191ba7..c60abd38054c 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -2,8 +2,10 @@
 /*
  * AMD MP2 Sensors transport driver
  *
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
  * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
  *	    Sandeep Singh <sandeep.singh@amd.com>
+ *	    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #ifndef AMDSFH_HID_H
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index b5c5ec52a3af..2503be0253d3 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * AMD MP2 PCIe communication driver
- * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
  *
  * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  *	    Sandeep Singh <Sandeep.singh@amd.com>
+ *	    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #include <linux/bitops.h>
@@ -335,3 +336,4 @@ MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Shyam Sundar S K <Shyam-sundar.S-k@amd.com>");
 MODULE_AUTHOR("Sandeep Singh <Sandeep.singh@amd.com>");
+MODULE_AUTHOR("Basavaraj Natikar <Basavaraj.Natikar@amd.com>");
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 1ff6f83cb6fd..ae30e059f847 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -1,9 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * AMD MP2 PCIe communication driver
- * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
  * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  *	    Sandeep Singh <Sandeep.singh@amd.com>
+ *	    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #ifndef PCIE_MP2_AMD_H
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index 0c3697219382..be41f83b0289 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  AMD SFH Report Descriptor generator
- *  Copyright 2020 Advanced Micro Devices, Inc.
+ *  Copyright 2020-2021 Advanced Micro Devices, Inc.
  *  Authors: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
  *	     Sandeep Singh <sandeep.singh@amd.com>
+ *	     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index 16f563d1823b..70b1b7abe2c6 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -1,9 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * HID report descriptors, structures and routines
- * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
  * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
  *	    Sandeep Singh <Sandeep.singh@amd.com>
+ *	    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #ifndef AMD_SFH_HID_DESCRIPTOR_H
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
index 66d6b26e4708..8d97ca0f9b52 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
@@ -1,9 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * HID  descriptor stuructures
- * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
  * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
  *	    Sandeep Singh <Sandeep.singh@amd.com>
+ *	    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #ifndef AMD_SFH_HID_REPORT_DESCRIPTOR_H
-- 
2.25.1

