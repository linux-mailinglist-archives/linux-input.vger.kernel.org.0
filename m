Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2C51FE14
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiEINZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235827AbiEINZL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:11 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4115A59B
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEJ04vq68wwbqLoWU3ssxLJoLpLdTlc9CS87awxGS89oYRJyIhbf11lRIV+YCSUCAk51cHexwhRze4xk//y4PFDo5kSNyZoBV8na/1IjEV6X0amJbjtwgNrnFTWLqOooScd9jyWo3ZeWj7r2fLnWSKw/nmHIUMloHpPNIqsUgXqJqP+MjqxS5ufIrfAxHtgYTsW2tGK1ejOE3uzWucA2cvUU4yHBjHdxy7XjxUuHOme4UGTnJ1cz0pMGY6ims+5gRFhXkz3HgdzuKZzvAyqSZEsRaQHKrokhmOobmeAMBSph35lmwQvCxVY78KPk458E79G7pAdW1F+C/4lwjTH+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pBTH/w5gQMggu/9HYnlzjY9Fe14PfNWmWD+Lri75IQ=;
 b=FhNV1ZKjmqb7Ne2Nuh5v6Nu1hUziLNo/eS+gtil5FVDsqiCfXYvAzOVGfZSf4aSCc3dMJyQul1MEGT6srm5tiCMHSu4pMd7jbqqw3vRrBJoiHdlUbjBXYVN/qZxmTjFxTLWJLrFLeGtWj5EEcz4ZI4IEnX1u81jgfAmjtcJeN3ETae+4D4umYhlaQuu9MFlUc2fGIEsJW3sXUTdtIXGibmswiZ8LluHs3kq69BZz71X4CvZ6R7QvlB+I4aTJzfUVap05VXMwsvm3T6cdm9wY5bxfybRLhHNM1DaglsAhCDPUN6JYiquOT8WVnOSsNB7Crm8cTh9DoBs4nyH71VZz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pBTH/w5gQMggu/9HYnlzjY9Fe14PfNWmWD+Lri75IQ=;
 b=QiA3y75jqWi8hjfmDIUbaJeoFLnwGKUyBUta/uTZmy7hhSn2IKIzEEWhlmIza82AQnWXehYH1Lmz/4UZGngIecqEHK43fIh6iWYiZV8qDRcIdhH7KymkTMRdVFJGxbH8u4i0483pZz8UGkwEizUE/6SQ+ASsRwbRH4IHOqozhDs=
Received: from MW4PR03CA0342.namprd03.prod.outlook.com (2603:10b6:303:dc::17)
 by BN6PR12MB1572.namprd12.prod.outlook.com (2603:10b6:405:3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:21:14 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::d2) by MW4PR03CA0342.outlook.office365.com
 (2603:10b6:303:dc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 13:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:11 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 6/7] HID: amd_sfh: Move bus declaration outside of amd-sfh
Date:   Mon, 9 May 2022 18:50:25 +0530
Message-ID: <20220509132026.3204678-7-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
References: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c0e9197-7d0d-4c3f-98af-08da31becaeb
X-MS-TrafficTypeDiagnostic: BN6PR12MB1572:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1572A85FCD548F3F604CC232E6C69@BN6PR12MB1572.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erV91OQKRl3lkV4+APfS9bJxbb2XqUhPjhubSLJUAB91wK3vASSMswQOElUmOL5jlUjKfQShn4QYiqTGDONph8n+MaWXjFYH8rHwA8bfHkBDUS5jZTWBrnkXqwL8gtz+4nEp13l+1nT//jzvtfir06F8tM7TlNtNX1635zHECJgvlkafZDPWItAdsJhvVst8QHCzBxjC5qUVPsnTzJHyG/GrXNIiENegewx8Nuf9qrEONYdhLOJF5+w/rupYIGLtowW4CcmJAqx+krDmkOVYGljVwkhYuUSa6hVca1C78306eh1gzURd4uIEpsMwi4TGDsDJurx2WD45k8z+sM4KCpCXQXEjBcGpHLRoROM8YCPvJtTbNR454W4HgHYP9K845er0wBla33+yhfqooANO5vas1sL0JFTr7sMcLAzaOo7Y0IpaRVVjn7Z8ZRIRMnaywA9RLqt3aSwlSkI0+RQfbuzjK7666ugtHUYsJB0sGo75RzPEF0dOs4IPiYCg/UNa9oOoUXxs1yvdJGpW0kQM0rwUYigN//1vSgFawvfolGgsxRgyc79JXUW7hQ362HX+K992o7o8BK+exX+0VDJLhYlP3HNfbR70DvuB2OnRgTV/Z5s38Bkshu8eDiW1MogsVz206CFkcXlSAMOZc3s2TmG4Hc0+Y05DqDRVISNy2Gx9qZN74se3//CoHgSC5fb2Zthkx77NyFZbdWpPOSIoIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(2616005)(54906003)(86362001)(1076003)(70586007)(70206006)(110136005)(316002)(8936002)(6666004)(356005)(8676002)(26005)(7696005)(81166007)(508600001)(2906002)(82310400005)(336012)(426003)(40460700003)(47076005)(16526019)(83380400001)(36756003)(36860700001)(5660300002)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:14.2456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0e9197-7d0d-4c3f-98af-08da31becaeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1572
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This should allow external drivers to reference this bus ID
reservation and detect data coming from amd-sfh.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h | 1 -
 include/uapi/linux/input.h            | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index cb04f47c8648..ad264db63180 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -12,7 +12,6 @@
 #define AMDSFH_HID_H
 
 #define MAX_HID_DEVICES		5
-#define BUS_AMD_SFH		0x20
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index ee3127461ee0..ef4257ab3026 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -271,6 +271,7 @@ struct input_mask {
 #define BUS_RMI			0x1D
 #define BUS_CEC			0x1E
 #define BUS_INTEL_ISHTP		0x1F
+#define BUS_AMD_SFH		0x20
 
 /*
  * MT_TOOL types
-- 
2.25.1

