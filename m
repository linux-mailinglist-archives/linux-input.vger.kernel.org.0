Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F3A4A4CFE
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 18:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380853AbiAaRTM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 12:19:12 -0500
Received: from mail-co1nam11on2082.outbound.protection.outlook.com ([40.107.220.82]:25089
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1380829AbiAaRTE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 12:19:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgdwOfn+1949lVJlNa1xr48a2BrywbWZd6+0mtAD99jPbhgefGfLMc3FNaI8YcSVUalC0oIgXO4pZw1jhFpvgyRiqkX2gaV7xfS1oCFE63d/25+Cf+pFD+fuKqxoNvET2JLxG4WEyID1pqr7cP9yuwo79u9E8U8nSJhe0LRzL51J/XrH5TtAthmxwqIz2V91DsxXgr98Xv9LRlJQ/9jOfgDgaVHRIcFoGM6AH9LxfbnY14bEhKr8P3Lbxc3Jsw3CPEvCdM1dEpkVFreudG0vsjvtkcEK/3nSxzuBjLi07mwXCRk3APxSPbz/pzq8TG+zrMpjZPcGA/QvziRHmiFFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVOsQOpsulnVnjmwf/xdgabuiCfapM7675sQtzbkS0I=;
 b=eC6JwiNwC+i6a6jtDgbWfwuOEnC9gSsDDXh+gyqylv69U4TFQu3yaUgGH0VwsaEjgkw0P3xhfI9/7NEiVKryNlEHYRfUU2l/pMZw5DnWpSJGX5ugviDaHhkVvsJCAhlizvKscWFyPFShuQaJhYlXYyR04pHpSngCD7PHRFdOzY2vnb+tw06SwjCRCxELsFrexE3DSnUYY+91JhGaP9CAWV9qNTsU7bIPpvKApTyCX/uQEZbw0PhioK2PhMgwaBdwVFBPRA9MQQbvILn89u4Z5vyoMb8mtXf7t5M7sxzGkwMnAUtIw/stSYy+6uFAonNFAiVzRcMpG64ya1q1ajKZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVOsQOpsulnVnjmwf/xdgabuiCfapM7675sQtzbkS0I=;
 b=d8/sGlH1d+UvS+jdowuanL22oKRvYzcg89A7uAjWqB8l9SxAj9YKuf85cMTO/Ms73cc0LsWTZ8aj+EiB0Z4pSAhgxNRADD56EfO1uPxRjwyBWuAg/yvzhr9cUg2QXWuoLdbKHVPp0VtFaZ9uo83pU5jeW7B9rWhXoXzayw3k+To=
Received: from BN8PR04CA0005.namprd04.prod.outlook.com (2603:10b6:408:70::18)
 by BL0PR12MB5521.namprd12.prod.outlook.com (2603:10b6:208:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 17:19:02 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::34) by BN8PR04CA0005.outlook.office365.com
 (2603:10b6:408:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 17:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 17:19:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 11:18:58 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] amd_sfh: Add illuminance mask to limit ALS max value
Date:   Mon, 31 Jan 2022 22:48:33 +0530
Message-ID: <20220131171833.3998492-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
References: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c169e253-d38a-40ed-add3-08d9e4ddc694
X-MS-TrafficTypeDiagnostic: BL0PR12MB5521:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55214CBF9FEC14A7876014EBE6259@BL0PR12MB5521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIIpqAsMzEh18i89fJ8HJYpjUIEBHoG9mEtXgpM6vZRavYZcrl+pLOs+wOyisZ9Ya1iOAQ7t1GAr2l8lnUMVNee65TlPGFF7TRV9DnPH46e9ULGevBW0pzIMMG0rPgxB6Pl+kAgaDf38NX4brlrhnCX3SpM47sKf68cm+CfF25IN8lrhaNHlatHu0185KTGexk5LpzVfZPfABiJiZ0v99O4H5EB4WOR0PK4yC3w2QbVJ+hPbesQ7Y9sYGHRCzALtE+iGeCmY/tYCz8qgq2KkZ2XIjlgUq7DX26tqbyPCrG6s+Su203fnFArRGO06TTPfq60B/Kkt2ulF6niOPiJ/eOfhzepLaq1BPp/5xHI/wdzNWkkENyraRHoaBwhLLVXB2cTtH6LtCsy+6CmsE3ALyh3TsP9w4ZZLhROq/6U8hJYMLLkg/m+X6nRDVSFoj9lRFvZZHwvcRSjYZfsTDCufBxwHEfn0Aa56LynqxVxVJabGBfFtryMEFSIW7sOuwitZ9pc7nAKsMLVLK+bFIWkPWcyaVk5qYWRyDltmVe+oTGDvZMTKZonAEC2DnSe7pzm9k812fQlb/QeD10Pq6dpluoMIhMQMHuegW2jiPg40GlotV+LOLkMjbT6GYWpVB5sgznkarq146FzYA/8b4V8iOro6jeydd5Cq0Zb+W+g6uyHNzAa1etSP7NMyVdbqhzZZorYigKH9f2M31bw/KFCbsw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400004)(4326008)(81166007)(2906002)(8936002)(36860700001)(86362001)(47076005)(83380400001)(8676002)(356005)(6636002)(1076003)(70206006)(70586007)(7696005)(6666004)(110136005)(36756003)(508600001)(26005)(40460700003)(5660300002)(316002)(336012)(16526019)(186003)(426003)(2616005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 17:19:01.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c169e253-d38a-40ed-add3-08d9e4ddc694
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5521
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

ALS illuminance value present only in first 15 bits from SFH firmware
for V2 platforms. Hence added a mask of 15 bit to limit ALS max
illuminance values to get correct illuminance value.

Fixes: 0aad9c95eb9a ("HID: amd_sfh: Extend ALS support for newer AMD platform")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index be41f83b0289..76095bd53c65 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -27,6 +27,7 @@
 #define HID_USAGE_SENSOR_STATE_READY_ENUM                             0x02
 #define HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM                      0x05
 #define HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM                      0x04
+#define ILLUMINANCE_MASK					GENMASK(14, 0)
 
 int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 {
@@ -246,7 +247,8 @@ u8 get_input_report(u8 current_index, int sensor_idx, int report_id, struct amd_
 		get_common_inputs(&als_input.common_property, report_id);
 		/* For ALS ,V2 Platforms uses C2P_MSG5 register instead of DRAM access method */
 		if (supported_input == V2_STATUS)
-			als_input.illuminance_value = (int)readl(privdata->mmio + AMD_C2P_MSG(5));
+			als_input.illuminance_value =
+				readl(privdata->mmio + AMD_C2P_MSG(5)) & ILLUMINANCE_MASK;
 		else
 			als_input.illuminance_value =
 				(int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
-- 
2.25.1

