Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033094AD8DC
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 14:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349046AbiBHNQE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 08:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355452AbiBHMVu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 07:21:50 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14EDC03FEC0
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 04:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjcCQUeHme7y4iGyl8iMHVvVafHeeZfFgA+CnecLjqplp0AZBDcFvih8lXyIk8NTYpVUj6QadqFtyoL6koK65OYa8AAhBOENZubE7BOLBE4VYjYT7OiDlvNvrADjgpzE/7IOkfF1FGOl25UefIJWQQMCVRc9X3lcokJOW+6DM8kgnW6w4uMWpUnI6JylIX5X4q8pwJVyMdNEvkdxfhomVcb64D2yQz0D5hhhluTiItketebueDyORQVV4bJn/yXkvEpYH4b1/yguWpSssWQg7ANouANNjR+owoBx5dKUM+cm7GlNl/cW6OJNW8o1ppHQRy5o/nHC1/OZqgwaMIQxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aoq9wbAhEAXwJtABJIUvg9/sWAz5lDvnnJkLX7Hh+Xs=;
 b=DIvH/NcxVU5O7nSWBQkEENSdQ96UwxOv+IlTU/CREpjE2gjIxerGRSjQDT16tmQ+kA0H2Cp8mgayXNJEYtpjaYafstMjOSKXMLz+FaTZzdb/p640W+1T3fVxNk5QEAbGz5me3JtKFLFP1dA0cTCqXei1vtSzrJLLaSYvNsxi0A0ttYwkMSmPaaxZvVToKDs/6v2oLQ1I6316hhZxKINDzQFyDYWQBB+abuyv9i/B90gDtPkxB932JPby7KGdF4DndfrncM7ebhKenxstj/6aw1G3YpnzM1oYrHi4mLZcrPQwDm/0qq81FjskfLuA6NXa4FD260YXc/ES/mEm+pTZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aoq9wbAhEAXwJtABJIUvg9/sWAz5lDvnnJkLX7Hh+Xs=;
 b=nLFcyUcNQ/P1W9IT2Pp+jRWVRvd/EmE+/hK2mV9eNFOxdHg8aKAaA/S6kx2ZVYyAGyPHJG7WZVkkazCWzGOILCdM3cawJ7dPZSVUwK7HcAz3RW08PvCT/ne/TxP6gNRpWT0LXRztw0zfUcyjVDouCuztzE/j3mVhFAQKiy+HO8M=
Received: from MW4PR04CA0255.namprd04.prod.outlook.com (2603:10b6:303:88::20)
 by BYAPR12MB3030.namprd12.prod.outlook.com (2603:10b6:a03:ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 12:21:47 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::30) by MW4PR04CA0255.outlook.office365.com
 (2603:10b6:303:88::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 12:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 12:21:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 06:21:43 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/5] HID: amd_sfh: Correct the structure field name
Date:   Tue, 8 Feb 2022 17:51:09 +0530
Message-ID: <20220208122112.942471-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
References: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c198c8b7-76d1-4d28-0a71-08d9eafd938b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3030:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB303066741CAEA6D634C8FF26E62D9@BYAPR12MB3030.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ckxv6wMher1osFIfVbP9Z2QB/uSpnP5Y1FRb6TIgXPego0qRYWXCk+u7O9VKwq2zp5AIewMLC6B6SJkGnp0Ts06cbkLcSPI3DjVJIPdXcxlrcNDHm3vgM3+vDjqLIwvznfSEZF9N/s2QmWO1Bx2N7ZYpB9MLShQSAnblmH/7OMPLEbuIcebaREUA7aObj03K+f1RoOIUDVNunyMw0MrgGXmXg51A83/Pf8Mm98cECDs5BePlhwi0mcjYhYcmsxitBtuPu91+MPxX4LWWdaN+IvHwd5k0kB0ZyZqWr9wYF0BEicu1hY+RI+hv+KiLH2I8OBsKLotkaxp6dlc/IrWHZdbvy55EvosbKI431FykfRAJ5Du1ME/bS+n0qk6bEh4zVpeqvkrAylVPBY9aFw/PndZ2gcmItok1JH4c6uUhqtUfLRwPZscBw/pfbccCY5WJSNwxtlodGDbbfKpsIWCZja55m4FDY39N5LnAk4o0WOsyRMG/pmmzWpjXsERNgAyjeDKxHIQiHc6HJD+NsN5aIAvKx0kkxtiHLuxqf+xJ8QYvQ36FwFpLajQmwEpuZp73r7Aus/723RpCRldN543utb+6gXAzAtlapnYhDJg/u+K9bl7UPvbWZW5z1jiWjmQCfe59ppb9Gsa9zTDKGgxsHLyajaDQ7qilN6EkLO3Tqjk9zh99HeqrWGgNBLUakYgGesawErwzn2eWmdjyHHxarQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2616005)(40460700003)(426003)(1076003)(2906002)(5660300002)(47076005)(86362001)(82310400004)(16526019)(36860700001)(336012)(186003)(83380400001)(70586007)(508600001)(356005)(81166007)(70206006)(4326008)(7696005)(6666004)(8676002)(8936002)(6636002)(4744005)(316002)(26005)(110136005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:21:46.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c198c8b7-76d1-4d28-0a71-08d9eafd938b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3030
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Misinterpreted intr_enable field name. Hence correct the structure
field name accordingly to reflect the functionality.

Fixes: f264481ad614 ("HID: amd_sfh: Extend driver capabilities for multi-generation support")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index ae30e059f847..8a9c544c27ae 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -49,7 +49,7 @@ union sfh_cmd_base {
 	} s;
 	struct {
 		u32 cmd_id : 4;
-		u32 intr_enable : 1;
+		u32 intr_disable : 1;
 		u32 rsvd1 : 3;
 		u32 length : 7;
 		u32 mem_type : 1;
-- 
2.25.1

