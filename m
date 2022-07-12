Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9147A57225D
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiGLSTX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233200AbiGLSTT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:19 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA27A0273
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGm40E7JpBFrl69htLRygh+9V14dt1RfxLI/Bn7PSIHWXvRpP3hkcN6HRzrVdPDLP08RtOJclnKdlmoyfZF3ZyhzkNCEJoMp3vj6MR+mqllTy3KB1EDtC8njSYkFf/DtEf6oty6YKRKJpaTzHlcdL4x+/yNA2APBBtvGCfnjRKJkbV+A0wC3SQtjBS87AYW62pw6ge1VL+YMhLFtq4fM2pD+p0qxk7Sp4/S7eFk/WNMt494bN6ETIivmz93aXqW8KABiZf7/TWeRywlpYTwylPRFt0l4icY1n7/SdYkoZmteeBCdSrRyoqYJ4sdqfMww5mwkg+qiic7wMDEAiWa7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+4OPzPgIzLnp2MClkySHx9S4VsOU1KlfZcTVNSSnvg=;
 b=cCyAZf97Ib/fSgtRG6Pw7ZWybKE/hcrwqRm96ARdtA+chb6o9+A1qdh3j+oYAeDpIo45DVSuMwNOh+uktB6p1uqKVq8tu9JAZGPj3QROJHfoc/SmelkeCz2UbYzgKP7OivxRZ+P/1FJXlWjgDoez7w5hNGhwgx0WX35T39X/EeteplTTHWR7LCLriLbeg4ETgzmevug/bdYec7F9WFP3ZmAM2jfkFmJy52wNFc6Nu6nRhPSoC8x+45QWrFro/jPQSVzeOurFJs3xhEmurdqkozuphiNql9MOEXZ+SGxLtU4owImJLkeU7PO6cJFqRGcZoLHohR7nzcjtQTJgBAodrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+4OPzPgIzLnp2MClkySHx9S4VsOU1KlfZcTVNSSnvg=;
 b=QAJLIcpL7o5gR/oH4ecNCYm29tO0Gx85SrqB/XOKgxbTVL/yMJrSkgbhYjUdl3JloQaa4rVUdiyuYaspr4irjepeEjmlQ20P2FCkx+oijqTaan8xex5vVrRT/VpMNnJluRlR61xx1KjtIdiMZrEJf8ftnrVD+4wAa2yy4+xkKTk=
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 18:19:16 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::1d) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Tue, 12 Jul 2022 18:19:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:14 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 03/11] HID: amd_sfh: Move request_list struct to header file
Date:   Tue, 12 Jul 2022 23:48:28 +0530
Message-ID: <20220712181836.3488343-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
References: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05c5cc8e-e178-4798-7284-08da643307b8
X-MS-TrafficTypeDiagnostic: BY5PR12MB4179:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzYJ2Kq8q94eP8u0ekObrqoYb2U9L5aAXOFTDxLOMZm1Ld8qUSOa6OMlc4q1UbAgMqqfwBFUcw3lpv/FoDkXskJgw9web9OaeHNJLqVAs6HK1e1xF8Y9St/iKAJd6rnpBFv37PZp4/MfYY140rJ0KSQ6RjX+6kn9otT9Ebpfh3equN4J3g7XQaFrkhTdr2iD72VcoqaqnIy/U9iB4mUqXbE9GPOxidH2ViQ9Fv5RwR4J34YfHMRvvT2kr5pToIHSYn0+/gQOP8pZq2F5UagQFRCjpMAS75KVIALM2DgtHtY+j14r2LAEcLDTOulo6s/OVLmnp5EbNcI0vRfvF7XqWXm3SwBmZyOTovtKuagA4afI1cq99IY9z4kh28Ko3zsM59pXDpAktNdN0U7UJIBfxrR/+BKo6rL3lEdhKokzCnIR3OhOSRdPC0oHZb1UM1L88CT6tBDI5Tl4njFSHxoLRtavGTOJ9t1PB3Q9RE2i7S7a2rQ/KfTkgfacENuLO7WZN5CPHaSbwG4YShhBkwoXoRiliP8KM8ZCp+edB5gr0I5D4ioc9I9Wxho/zyppRE4NuXWT+YQ4pgIaBV3ISTKKsDM4eW21Qy4LUN9Uq9cC2xcHbnQC1DRk0LX30N/KXp5rpoA+XpAd7XlT/pzyTSEDn+P3n2Sco4tIcjv2Y06liNNxAMxYavC8QHGeT0/CG+MyRNv92KHSwPh+tZ+CZaNFZ1hiyEh2EfxpCFZaHlMoyxrlRadY3+miQQca6lMxJ2cmzM1FDFaEJT3afqpRkEy8Z/ThIIzR3bPSIdY6b+cCo0pkzyR1ZOiToncj5Lg9O2P5QWjYiZyIKwH/xPPnOA9wTgj4aeFqohAASxbO43o6PSo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(81166007)(336012)(426003)(82740400003)(83380400001)(70206006)(40460700003)(186003)(36860700001)(16526019)(356005)(2616005)(8936002)(1076003)(47076005)(4326008)(70586007)(5660300002)(8676002)(40480700001)(2906002)(41300700001)(82310400005)(7696005)(478600001)(26005)(316002)(110136005)(36756003)(86362001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:16.1047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c5cc8e-e178-4798-7284-08da643307b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

request_list structure can be used in multiple files to support all
AMD SOCs. Hence move request_list structure to header file.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 10 ----------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h    |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 0f770a2b47ff..fac9e8a66120 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -18,16 +18,6 @@
 #include "amd_sfh_pcie.h"
 #include "amd_sfh_hid.h"
 
-
-struct request_list {
-	struct hid_device *hid;
-	struct list_head list;
-	u8 report_id;
-	u8 sensor_idx;
-	u8 report_type;
-	u8 current_index;
-};
-
 static struct request_list req_list;
 
 void amd_sfh_set_report(struct hid_device *hid, int report_id,
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index ad264db63180..e2e4cc5fc946 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -15,6 +15,15 @@
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
+struct request_list {
+	struct hid_device *hid;
+	struct list_head list;
+	u8 report_id;
+	u8 sensor_idx;
+	u8 report_type;
+	u8 current_index;
+};
+
 struct amd_input_data {
 	u32 *sensor_virt_addr[MAX_HID_DEVICES];
 	u8 *input_report[MAX_HID_DEVICES];
-- 
2.25.1

