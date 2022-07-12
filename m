Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4BF9572264
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiGLSTn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbiGLSTe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:34 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9361D138F
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ4s4VPFmn0e7Ltph5deiSW2KcwJ0E2sv5X2dvFy6YpddbWd9tPbgFX0K4lKtKTqPNxJJEzIEb6bfYH9qPk2G7F+ikpBpOPtLs2eoR5l/7vMgS1C5ceFGEljrnJ+JCUcewMpAVLpETdimZj0dBsvwHIg3g7LIVL1Ni+DyZogtm7PzxL5xq0Mjo2MAnSojQ3p83xmm1NkcxqVdoMrN9h2mpFO4dYcqj8xYkHv9IZzvYb5xgRfIXjmvccUg2YcioiSKURM6xdG9GOw7FBHnIrYvRDAcbGbYT5yq/6+IS5HMTgf/l0yvrGKUuEHlYW8We7wfTUsO7zah6jPlWdNHWt26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO0ABWkvcQSx0PlIa1C5O1DPZvmrdpNMetJ5nCaxMJs=;
 b=HltYv6VrzDpgxQ7B0OK0AQzAjcOnyJFPsbvJMxQbKycZwnZ4CdQYt6sTKBhphIO7CEHO30kD0nOlc40tQDmkUX6CNsPq+SXCaInru//CVARqmVUZZVfXy/m+eyuzYA2ya3F28r7B4o0SQSw9PFndewWPx0Pu8mXG4OwW35bfy3Zc0YqH1urRs52iSOVyovO1dGIKuK7IPr772C/2zJJ2kYrOBeu+88reHqhey0skTBlKtpCi5ynfWlsM0N27VGdJ9cLbgN0sXOhMGMCloBTFNxalbCuxQKtd/Qdy9TM7AqbjQcRVfXV+a4pMyJLCHl76LLvxcw06dmNtRh6ggxJItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO0ABWkvcQSx0PlIa1C5O1DPZvmrdpNMetJ5nCaxMJs=;
 b=QaE9Y7C7PeWN46vdi5oTytau9N2NlXX3AOTvYs9DMVdfMdnsFcvLeqyqar8gg8Jky6Nmy2TpFLFSoChMFOgQjG6uTE5NX2RuAXFfHGyon9d8Zkz1tXii09rK+cwIYufnqO9ct8vy/IEMjNLNCWWZdgL9fRCehakddyZrKyRBf/E=
Received: from DM6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:5:100::27)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 18:19:26 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::fb) by DM6PR03CA0050.outlook.office365.com
 (2603:10b6:5:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:24 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 09/11] HID: amd_sfh: Move amd_sfh_work to common interface
Date:   Tue, 12 Jul 2022 23:48:34 +0530
Message-ID: <20220712181836.3488343-10-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 166f649d-45d9-40f2-0425-08da64330df5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4272:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftsqWjrPw8UIJbido188IsiNZ4cxmi+96Ytu3/oX8/EUjXeIvddeDCsCLGDMj32vzozwH2ME2Fa34L2DII6m0ZApCwBvZtg3y/Udon2TXwv0alL/MTmCWjkw9d9T41dt3ZcPGumIpbZbyS+0a3Kq78nBccvOelY9HbX74NWtjlIOMVbctBqqHJmycxRiINqOIxPVu8Y2oKymWm4T460dBPetIpIAFLKzAI3cXZ9wIL4S+lzbV9QiojcDqg94dFhp72yf2DIGmWMEITSE4dCNuEXtTEx/XGLWvYEcYzuq+rwIyo7M8S+GsFDOxRhZPVwKJB+e2TuoW0LTktQwlwYMpMxWCClMB3S+9DFLXHrLDgg4CIf6JZjyt60QI3CuD3sLYwdWhsJJ+Yb8wow7ifkrvA+esD7Oy5McJ2lnGOEDk/TKqMNh9+Dfcnp3LpJ1TvnI0TWIGbG1eAFxmSP2+QW8tz1H2wGp6Lk7XaPeiYVp84c8KzGT/sMAbIL4/XAJEe7zl8km17cO4u6PDMX42eqSL7ZnFP14awn0R4AlOx8TnWAG7VMc5HlVswHT0C1l+8L9H9cEO/eL0es+ACzyD5h9v4E1fLWWgbu8dfMuMQi5AY5yAXyRV4uFvyDYuPrpm3nmws8xa+t6JYJDtiCbnpTkoCufTxgaey8PHHmhTxV5/otjMxAJEOypvD4unI24pHNME9eiNW5SbqESPpvAZAeW1j2JgrAHFCxNlg/HfzNStY+85tLwQwptdDf72e8H/irQrcD/kaLd4XeTYZgXP/P3s5k4m8U38v3UN0I2Bxi98o6IU7sOyYk7WodAS1FarW5sPh+Pqa8k6tfC5o7ZMbcokFv4zCZsqqtR4nIP0RP2xak=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(40470700004)(46966006)(478600001)(40460700003)(36860700001)(82310400005)(81166007)(36756003)(70206006)(6666004)(316002)(41300700001)(110136005)(8676002)(5660300002)(83380400001)(8936002)(4326008)(2906002)(82740400003)(1076003)(336012)(426003)(16526019)(47076005)(7696005)(86362001)(40480700001)(186003)(70586007)(2616005)(26005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:26.5679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 166f649d-45d9-40f2-0425-08da64330df5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

amd_sfh_work can be used in multiple files to support all AMD SOCs.
Hence move amd_sfh_work to common interface.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 4 ++--
 drivers/hid/amd-sfh-hid/amd_sfh_common.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 1f59fabded85..8e686081c8fc 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -63,7 +63,7 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
 	return 0;
 }
 
-static void amd_sfh_work(struct work_struct *work)
+void amd_sfh_work(struct work_struct *work)
 {
 	struct amdtp_cl_data *cli_data = container_of(work, struct amdtp_cl_data, work.work);
 	struct request_list *req_list = &cli_data->req_list;
@@ -109,7 +109,7 @@ static void amd_sfh_work(struct work_struct *work)
 	amdtp_hid_wakeup(cli_data->hid_sensor_hubs[current_index]);
 }
 
-static void amd_sfh_work_buffer(struct work_struct *work)
+void amd_sfh_work_buffer(struct work_struct *work)
 {
 	struct amdtp_cl_data *cli_data = container_of(work, struct amdtp_cl_data, work_buffer.work);
 	struct amd_input_data *in_data = cli_data->in_data;
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index afecf7d2bebe..b3dd758ecca4 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -64,4 +64,6 @@ struct amd_mp2_ops {
 			 struct amd_input_data *in_data);
 };
 
+void amd_sfh_work(struct work_struct *work);
+void amd_sfh_work_buffer(struct work_struct *work);
 #endif
-- 
2.25.1

