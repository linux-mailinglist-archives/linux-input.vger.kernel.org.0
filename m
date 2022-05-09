Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5071C51FE13
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbiEINZQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbiEINZE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:04 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3A224945
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8SW0qLDbObNESEeMfQQ7lWNwjsIdagwh81ou+aTS7LIUHAHxaUDO2XxZ6xvcGgsa++wJTbtoqVnXGwnm1E6nP54hg3kiD03SuetEscA6/3KAE1LHpce0QPvrjIk5T0a+zYJygUbrnu0Mqbgos+Fuq7sRsb1EM7pZ6NMg5D8xTqAByxwdz6OLqcPhS9J1xoYs/diftsS/1gEGQ0FpjRA1yIk1wUTGqw6Ap1nBnIytYQttOXYx9v3m/vpKNvsLaaB77KEUWUwiHH/Z50g2jV8HdjSmhPy94wKhrl919SoeeNQGna619yxBoLre0fNmQ3qcWkDxXszKhec3BIYtjS46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKDmO2kn7YhLtnZH1nLj+hFEruvKiwdM+4E8Q3/iaX4=;
 b=NdY/tjWYcaJDFivYELDiKs8SSQeNe0o0iVjpNXPkS4Kap9VKncStMjDYjHwzIErHOCdEDoF36/bm5Q2ZC0wsvObGk9MROysQ6PBpXqN/RWkJlPKYV4AnR9XUctXdqfBvLkie4W9SsJpLIt/26NCjN6el0Cp1vXRoLU3X+Nnr9bucGesQu25gkoieNlXheEjPLUnvEPxOppLU05sWMsEOqDwF+yEuMd1T3ZbL2IML6jJoKPWOnf7ccSaYC3GPXo144TpgGNCOBVgan8yU/OxepmEDvWmdynSBpWbcvIxvFsp/ZPybtpYfJnkc541HGU5pQcscBMIzUIkTVuyk2icqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKDmO2kn7YhLtnZH1nLj+hFEruvKiwdM+4E8Q3/iaX4=;
 b=Ledv/pJTgSH0wZS/oV8PQM7lXknkFcb4U33dnxfWQGAesf7CqQAk6Vi9tZBjK1N5bRZyjQcdqv1cgEGIthAY0yqbHewjbuP2vfgLpd9pciKl544SP+uXUSVQJZcXlO0sNuR7jU31bOmaqvge8E7F+lCpTC/C2/d02bAXhZJKugA=
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:21:08 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::a) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Mon, 9 May 2022 13:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:04 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/7] HID: amd_sfh: Modify the bus name
Date:   Mon, 9 May 2022 18:50:22 +0530
Message-ID: <20220509132026.3204678-4-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7f92c4e2-d64e-45b5-6bf4-08da31bec729
X-MS-TrafficTypeDiagnostic: DM4PR12MB5200:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB520096D42B980A29DB6539BFE6C69@DM4PR12MB5200.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ie8+i4oHO31bpTg69NlVWTV2z1LB1g26phQ/g/oVliOKHfbIy1Ljctfz3XA2eOs+B1fpCEWg4XQR/5sgUcKCLFa5HQ/9Gn0yi9atTq62FWB5WL1GV2Oh4Wm29Fes6oPmsvi8Jh7uFSFU6q1Vv+q0Q0dqmYgX0q/8lVYNB9rekuZFBMAqGXYDa9uMrZNSHPs/03SorTeWFLJU6yU3UldNCNDDM40YHHbts1Lsd0m10XZ27H8ngVtLQmuyMdKauOSS9s/rM+UH3NKY4qfjjTE0g+liJ/noqay58zNN48dVU1vfYQSoULFUJ3SbBBccOIPLxk5vAlcBO4o5L/jdz6q96736tNF//Fhoeb+fFLQIsO9GVvib65bQ8eWdfkwzwqpxye1byyZnTjCEKH5YYqWlE8sSJ5zz9lV89xnZW1gEF7SR01SijwEhuKygKIP2hgHHiK9ZjjsOdEoUBDuGBBo8VQ7cLBSE4VoftqYFNsU+kau51n9VJIDhpKRu0U2wSuI94empSHwPMBXMbgZmbfKBDm22i+y1m685OwWMkEIM/17600kYZnpkYec6IpxXhF2YupmR0oRg3V5DomXVpT9zY6Ug7tushW9u6cVuLDRgpUBDmYLJheIb+QXJ+ZXZiPZo1+7Kuv3JXLj8n2LH3JXuWfcE688FwYHU+CaFKVmIOt06gGajhFW11shAjj96RNZ+okTKBoh6AqAUC7onxKGhrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(70206006)(426003)(47076005)(508600001)(26005)(70586007)(110136005)(6666004)(16526019)(7696005)(186003)(2906002)(81166007)(36860700001)(40460700003)(8676002)(4326008)(54906003)(336012)(356005)(82310400005)(86362001)(2616005)(83380400001)(8936002)(1076003)(36756003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:07.9399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f92c4e2-d64e-45b5-6bf4-08da31bec729
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Modifying the amd-sfh bus name to meaningful name.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index 2bf97b6ac973..6e487e41f4dd 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -141,7 +141,7 @@ int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
 
 	hid->driver_data = hid_data;
 	cli_data->hid_sensor_hubs[cur_hid_dev] = hid;
-	hid->bus = BUS_AMD_AMDTP;
+	hid->bus = BUS_AMD_SFH;
 	hid->vendor = AMD_SFH_HID_VENDOR;
 	hid->product = AMD_SFH_HID_PRODUCT;
 	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "hid-amdtp",
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index c60abd38054c..cb04f47c8648 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -12,7 +12,7 @@
 #define AMDSFH_HID_H
 
 #define MAX_HID_DEVICES		5
-#define BUS_AMD_AMDTP		0x20
+#define BUS_AMD_SFH		0x20
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
-- 
2.25.1

