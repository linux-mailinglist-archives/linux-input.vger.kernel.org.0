Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF306DE0C4
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjDKQO1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjDKQOM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:12 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1261F7D99
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRy9ZW0VJM+AC0J7O5yvuiALlf0wvqV8DYJcvLmDLMYkySw/+TXD0YvB+Uo5PIPqgkwafqR7YZQ5AcrdA6wiRM8QNyQyPSpIDxlk8OwIu2NQiM8k0laXInosCLGxDtcxd5lGy5nMeJ+DFSrB8f+WCTgzWzx3H7yUdn+4lcVkeW3/gp1P0M4omj8N+DGfOHPizKWU3GPBhA/UTAzDKR2OLGnUdLQdKES2/aN0Fud6SSEMnevlSAbGS4Aljm0aL2IwrApJjP0qeF+Pq4QXpxGtLnq8gluqCFrX2m7Ibk0drZGceLF1NZaFzZq6O3pXx4nkRgCLtYDSR96z6I2QBrHjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liE4yvPQ9sg2cjzdBiA7mTr1UHcTayWGmVX1GYuBClw=;
 b=caC0pHLsLqzxsxG6t4rK/lveY6MEdqjd+ezUpjsbvmj8rmUlWb071IlvRcoB+WY9tWQkqtU0Mj/v6Pig+e8vZNt3bakURNCSEPEN5BDOh2pqKPN2KB6kavop7tVMXx51I5S+MSYVt7ud4kqFKvi93lXkCS/Infd4RQn1ZK6y7A3Ok5lHaCq9xmlzVAQMqw/wgTqEnMuixXmk4QWi/iLQxQRhGrB8X+6J/WAWeZAGSgvNybRDS1QqaNiv0IN/gAGSNWvM2NHHc5pMOQvrgfM7hItYhKOUAHD51KLspnJV1LSeTUKmzHWUgI/sIW7XLpizPVMMK/OyGpf8Sh7t5+tLuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liE4yvPQ9sg2cjzdBiA7mTr1UHcTayWGmVX1GYuBClw=;
 b=k+7BhUSlAVNM+/FnJxx2RVn5ydcqO2etgScZ7LbaXeJuHyN5cS6Se7Y558QOQCv33xSl9MRQBEObO97zWajUVSdcbjBgmWje/PaQnX0mB3Pl2XaBp06iPQgU3rqUfBFRGgrcAT+HPlYS75iEMcA9L3wjyVzHXc6tOl5uHam0RSs=
Received: from DM6PR04CA0017.namprd04.prod.outlook.com (2603:10b6:5:334::22)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 16:11:29 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::e6) by DM6PR04CA0017.outlook.office365.com
 (2603:10b6:5:334::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 16:11:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:26 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 5/7] HID: amd_sfh: Correct the stop all command
Date:   Tue, 11 Apr 2023 21:40:28 +0530
Message-ID: <20230411161030.909350-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
References: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: c053be66-6e45-4cd9-433b-08db3aa76836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vj+gcEuI2lTQlEdzjuhtD0PtkPCYrZbGXvUqRVO2aAf5KwIR6FNHPdUfQgiuSDZz7qjgGmpJe9L40lwb2JVqSGGQIiU38FSEnUOq65FSZw1320+LtPLb049iH9yHBzmeRTtq5HzqAB6EP8sLJOs2oK2J8tsxpgMxhUbitfNHoR4Mwa+ZrjH7AP2UVmuv+lepi7tQ8bJHNvVbYGhBwU8Rli2QFJQovRydBszHP9MJv8g/uyfKrWkTj7EEgl/GEwjqcV1UaroO8mxpJPfEYkl0h+3GozDHsFZVcFq9Y+bybz+nMbypEWn7VR95ayKXwu96ZIfr5fb+n6vNk+/0cNNFwGoiNB/pM14+qsH8KP8MnoUUDgNGUhwAw3SK28z2ZL3uvoJTedeMkUbH4Y36dTx7ZkDIMguNvjpuhIS407m9gsIlzEBs6NUJpgeyzkt3caOA2yRVazueVe7027o5AYyUG3SQHiZmH98L/T+cZLZpxK8NsmtZsAhjVaWIUJTavUZtOV1B1qKbOLMhpVKCIOYGkcCwcL/+hGoc5IMtL3ZeE2L8j3/1IfxfDFGDBZh9+mFRCJyvTlYirU4e9iIYYZ0nCxGErxi4Ml27rYdEfYQTwq+5Xa3HXFjnFifB9fPGri6lLIXeIUGoq8cDBZyZV/L/WE5cBEsWyf7MMTShaGu83KFb38Kf5YAFHTsK9A9ATu7K8gs0cZe0lgp5Ovn2CtP0eGAef1mJW6WyMCPSOcuEYxw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(36756003)(36860700001)(5660300002)(110136005)(41300700001)(47076005)(316002)(82740400003)(478600001)(8936002)(356005)(81166007)(2616005)(186003)(16526019)(70206006)(70586007)(86362001)(4326008)(2906002)(8676002)(7696005)(40460700003)(26005)(82310400005)(336012)(426003)(1076003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:28.4612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c053be66-6e45-4cd9-433b-08db3aa76836
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Misinterpreted the stop all command in SHF1.1 firmware. Therefore, it is
necessary to update the stop all command accordingly to disable all
sensors.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 6e19ccc12450..6f6047f7f12e 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -58,8 +58,10 @@ static void amd_stop_all_sensor(struct amd_mp2_dev *privdata)
 	struct sfh_cmd_base cmd_base;
 
 	cmd_base.ul = 0;
-	cmd_base.cmd.cmd_id = STOP_ALL_SENSORS;
+	cmd_base.cmd.cmd_id = DISABLE_SENSOR;
 	cmd_base.cmd.intr_disable = 0;
+	/* 0xf indicates all sensors */
+	cmd_base.cmd.sensor_id = 0xf;
 
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
 }
-- 
2.25.1

