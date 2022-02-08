Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD46A4AD8D0
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 14:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346518AbiBHNP6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 08:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355445AbiBHMVs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 07:21:48 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF3FC03FEC0
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 04:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zv5c2LKygVdcNIZzA4Bwpe0NFy9vy/SRhmljTfF8HYebLUc63iUwJggvcG/MRkG/EvHVkQgVvKCXQtf/inF6pE17hqVTO5Ev79TYorQ0Fqp4Xk2cT6K9YeD/Lrt7OQtl9zrhF6u+jlt33WWmaU+3yC38qnbYB9vpD/KeKBoBnWsaav8+tJLTYU9tn1E/9Hzrc8D0ZtdesUzV9I8gQZYg/XOMKIRRDSV1PVMl6M8SpNre69QsasRG0rwqYAKRm0lFRBKY3ciAdDfskyxu7NgxbqFry+lDBBCgM9QturjTwyhC6D3YwF6QYCvhCFnAa2eUujKf6YTGlZEGOG589NyZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvllRpAxBjVeFrEa9pa2NEEleZjoVTd+qLIVLnbqUGw=;
 b=SiEUKSc8JznVQHGVssqJQF7bZw7JmzDVdwpvb3/hze9q+NZW4kpHB2nYs3ODQmpU2/RTtj6o864Ad+1eCnNgIecmZhLeTDQwjs5aLQZptkWx3ikysOq8FhoTi5f945FwMSuCRNYDxqn5CLqKlWP7lJXpovNVtWs8ac4nM4idCjoQXgXe/RzzYydueuBvUUdRs7pagY+17JdzqDZHsj0syhS80kJbZ28B8bqRTqHwJTkvhQ9+Gb7+t5KNG8LahikcYQ6Q1s2gNKsb0malMym+1rR+PfG0S203f2lZ2xQ4qp18GsCzlKmL0Bv3Rucy34rPb2ajDl/kWjfOlPiV3KLXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvllRpAxBjVeFrEa9pa2NEEleZjoVTd+qLIVLnbqUGw=;
 b=eRxg4+O43B//zgNdzxFDb/4h/1DhL0iarlxCEQlpD8PF6xfPWGy6MdC/o5tQWwMuCpnlnIy38msGO+0O0YEFDycLysGVwxEw6F2FqCZ7EQXwKwZ3s6gDOHBLdaG0yhd2jsNS+MkpKPOsFLHKsPoU1aKPDl7Gzk0YGde4dmvrwNE=
Received: from MW4PR03CA0229.namprd03.prod.outlook.com (2603:10b6:303:b9::24)
 by DM6PR12MB2650.namprd12.prod.outlook.com (2603:10b6:5:4a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 12:21:44 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::a8) by MW4PR03CA0229.outlook.office365.com
 (2603:10b6:303:b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 12:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.14 via Frontend Transport; Tue, 8 Feb 2022 12:21:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 06:21:41 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/5] HID: amd_sfh: Handle amd_sfh work buffer in PM ops
Date:   Tue, 8 Feb 2022 17:51:08 +0530
Message-ID: <20220208122112.942471-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 247067b2-09cd-46ec-3db5-08d9eafd91f1
X-MS-TrafficTypeDiagnostic: DM6PR12MB2650:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2650095CB864516733ECE577E62D9@DM6PR12MB2650.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsJJLzJku7ViqRyt6dDNYbNVTGcWkXqlpBrk9HXTq/if/FZIuRhx6p8T1oP3b0/5gYxldJ+iA6oXv4ygb/zrS+HELq/qPh1LY6waQbqgHyMy2PYYnvxxUZ0Nwf8M2Mx+rV9tHvnJP3aPxcw/2KGs3Si0v7/uBbqFLGgxvp0Yh/zPJLTRlbEkMjC6t4a7SG+/AM45sYmNQzXJ+I+BwF66l7x3Xudrj4puvjeAIZBQr0m+zv97yrwGMJJdwsyjmo0i44GeSue1u1nlDHohSV0chmpkyRAwN7tk1KtDbJdOlj/E6T9esvOxtAQw3ZgtbgvDt0BRNbEPPkbAl5clP0JN9Ke7HdiDqU222wqDg5PcIrna0jGMRw91Nzv8FFoMRORRPrMFxhtHkU947FWWViqaQDwgOSRil11nl4d0pdnwEsa74+o94nS/mB91/mrpqNMzZ0BCN5KuCAM6qRjsu5MwFZ4uaXHDhzrEB1cPSau19SskuXEzmRa/6nLLcdrbRjqXvdWJr6u1yx6o0fNnqHT9mqeC07An9Z3sKIho18TtiLJVeWEuUip3PuEZgi3BW243aote5jWFlO+sUErm2DZ8aHpHPF7Vqdt8pnpjIoUbjLVA1anGkrSgw79r0gnpLZO77cRXzW8tBSWl10UlUm5S4UMmqvJ1g6bVYvaHt1prONK7ch/DcrVobInWi6I+p4eJr8VnY7mi3wi5XcWl5JqeDQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(16526019)(26005)(82310400004)(36860700001)(2616005)(40460700003)(110136005)(316002)(1076003)(508600001)(83380400001)(47076005)(336012)(186003)(426003)(6636002)(70586007)(8936002)(8676002)(356005)(4326008)(81166007)(5660300002)(86362001)(2906002)(4744005)(70206006)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:21:44.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 247067b2-09cd-46ec-3db5-08d9eafd91f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2650
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since in the current amd_sfh design the sensor data is periodically
obtained in the form of poll data, during the suspend/resume cycle,
scheduling a delayed work adds no value.

So, cancel the work and restart back during the suspend/resume cycle
respectively.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index d3f32ffe299a..dacac30a6b27 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -290,6 +290,8 @@ static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 		}
 	}
 
+	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
+
 	return 0;
 }
 
@@ -312,6 +314,8 @@ static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 		}
 	}
 
+	cancel_delayed_work_sync(&cl_data->work_buffer);
+
 	return 0;
 }
 
-- 
2.25.1

