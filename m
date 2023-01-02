Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAA465B513
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 17:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbjABQbO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 11:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjABQbN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 11:31:13 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828001090
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 08:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxCVfnbqw26fkIhj396XSV67KBA/4lM0uk6fSUp8w1pIgNTX8GPjlWEdXUs6GRzB55z7tgQv9ZqMaZIW/b9vo2uBU7E7617YsAZ6bss4XH6JOebpGwjgS5zLvm+ES8isPBVYqEmE0jpeMn+OqMnvQqnjMGN+QClBfNLnut7iofdVlkAtDsW74ij8SfHZRT2Mnst760DfYpg8SyEXnMURV3rScdV7+aR0r7ydFq4MLB3ga8tQc87abfSzUEXKgyzPGoKRIN0cwAYASLNbUohXbQwvn91kLrt1Q5ZYoJ7+Y3ZyJJ189V0H01dNio+D0VegVKCKwDZ7jZMaUxmCIqBJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMP40TjCpfYfaqFux7bp2Gz6JXuNKhnLTfGA6247/O4=;
 b=gRxAPsSK95eXAkiM3o+OyMQn+gIu4iFcGOYTn7tg680Xm9Gp6ovoC+a191VqFN49rP4Soex56AZCACdXeEJHaf4BgNe0qzK5nGqjo45DP4aWZnuLFepu7VUMHiKScNtzt8SyPZbm5pYaipv/W0V4+7PBZ5qjoIsprsBWSmXxyjdLcI1SCQwa76VZ6DowFP3MKMHM/MLtH/ddlo0H+nsiDd3UWgum2xsaxWnpB35rMSqa1TdsJ1Hgcz/OrTS82E5eyk6s5Ok7SgwTs9mPheyuDn0tzM2kwwTgTMPuE6mXmn1mDwPf2k/Bc1qAKg3ebBEO0UCu670k1x1vfbdbj1yMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMP40TjCpfYfaqFux7bp2Gz6JXuNKhnLTfGA6247/O4=;
 b=AIBOLkOLlJj0YBMVEr10bIbR3n1BfZRY5fV4kl4fhX/RD0FiGV0zdpAa9rm7VxgyeV5ofXznwPs1BWUcPlQoMDHglD2BEAxHSoTTd5b9PNpNCVXbq4d3yzDFYM0RsfFuoCnY1CJvKyyvEoH7qxsfRPQaDb0CqGScncRmNuVcwI8=
Received: from BN0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:e7::10)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Mon, 2 Jan 2023 16:31:09 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::40) by BN0PR03CA0035.outlook.office365.com
 (2603:10b6:408:e7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Mon, 2 Jan 2023 16:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Mon, 2 Jan 2023 16:31:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 10:31:03 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH] HID: amd_sfh: Fix warning unwind goto
Date:   Mon, 2 Jan 2023 22:00:42 +0530
Message-ID: <20230102163042.1743830-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT089:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: c99d19fc-cb23-47eb-11d7-08daecdec10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEKZ5pG0hqAFz1V3d0BklAc3YJje9NRz+CRUrRgbeyP4TzKuBkArG6Idw19cRvnrWNy3m5ErnLf4fyrHJ87CIkHadr5cGjXN+6ovGjyLWmtF5mZQpEMyaNeVkuZUIWBz6bP+ivDFB+XsS9NuiTCGqhxwpj7g4CvnNFzyNKmyjD7usmicwF9AAWKMKbdAqjZy841lcfr8y1bRhLdYz422PhqMfoP+hp4YffBFVClV3hSjwT5hCBeCr0gL4Iymp0t/MzPjBWUcfXJCfNvIYJROqdcVSba12umezBoLYUyy/LFGCMIWd0g0mdF+XVc1HWHi3tD0WJxknSZ0B1lCNFZMmau70PANrDu6373YXd2lHEYv/3UIVgKN/vvuZ7WEVQG5daq9AjeY7AbsrH5qtW3XrtzNTxujI7tCWxzkMFo1SeMj/N0bnjucl+07v1LnnfhFyxsE2uXIZxR7J/mVdiimtn/ofCrR0lpQDP3ekqFXoTst7ufsrZfTnbmk8H0HJcc8YREBZBFbtf8bhSDlaKxxpXm3xLSXZTAIJ75F/PHG8HS8bQa+YvRipcJZ6ezpbLnkSJRLCst7SsVaYMYlxbhpth17ol1nHaQR95xB55ZUY7dgvp4d496yn0gr4dklzG6Gb/qMvELm8WPDKI4iIgjjOJKh1266I7v18pbt2mtfC2bN5bjccq4HY5PiRrarje6F5SbfdW0/qItW/w6s89zTlIffLR+fk8jeOiV8Gwcgg185bK27iCs0S02Hrm1d85DkXfhDN7+SUYQh7o4wGyGyzQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(356005)(82740400003)(40480700001)(40460700003)(36756003)(82310400005)(86362001)(7696005)(1076003)(36860700001)(70586007)(316002)(70206006)(2616005)(16526019)(478600001)(26005)(186003)(54906003)(110136005)(6666004)(2906002)(41300700001)(47076005)(426003)(8676002)(8936002)(4326008)(336012)(5660300002)(83380400001)(22166006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 16:31:09.1566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c99d19fc-cb23-47eb-11d7-08daecdec10c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Return directly instead of using existing goto will not cleanup
previously allocated resources. Hence replace return with goto
to fix warning unwind goto which cleanups previously allocated
resources.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index ab125f79408f..1fb0f7105fb2 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -282,7 +282,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		}
 		rc = mp2_ops->get_rep_desc(cl_idx, cl_data->report_descr[i]);
 		if (rc)
-			return rc;
+			goto cleanup;
 		mp2_ops->start(privdata, info);
 		status = amd_sfh_wait_for_response
 				(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 4da2f9f62aba..a1d6e08fab7d 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -160,7 +160,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 		}
 		rc = mp2_ops->get_rep_desc(cl_idx, cl_data->report_descr[i]);
 		if (rc)
-			return rc;
+			goto cleanup;
 
 		writel(0, privdata->mmio + AMD_P2C_MSG(0));
 		mp2_ops->start(privdata, info);
-- 
2.25.1

