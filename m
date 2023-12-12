Return-Path: <linux-input+bounces-699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE780E103
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09F21F21BC4
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5C2EC3;
	Tue, 12 Dec 2023 01:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kymrAFyQ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4137AD0;
	Mon, 11 Dec 2023 17:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRDnPSdtx9PkeUb6fULrUKViG8nmlDb2/C9fD3aOy5o2TAMBr+9bQoNIVSvWJ6luS0gNsG+xfDjwJJqtpE84HytuQQPG5mzM2DhorrnrpDBQrcZfyF2MXFC44p6F/4czKiuaS/pasDSQlIg4R3KHAIRjqb1gVzYzdE3M7qAKFmY62IY1sDutg009ZyxYomNQFgSEYSwV/ClRF5EDesod7sGdF4lXNuhz/GzS5rlqfBXysyywuzQgZMeBu+WdMShvflFc3oKVlN+1bEEVYhXdkxi7cw815nmQEZ6lCNikSj/AiGC9qHFVNeDhuIwBwTEzis5SmmKB6YGWD8p4ontg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1uPIBDDW6yvsygQFWHh+8hhkDOFPviQqSFJe55nhJ0=;
 b=dlpN0OMHpRol4KpNk4jbiknz/UhYcpqJAxym+I4fRr4jELC7ZbeY5D2BGGfNfLfLbWCADlk2BHWBI9zi1zMEazWKm+SLF+lXy5ku6NeQ/zqufWOEx4Zl6EDy5xS+SnvLjOUL+0UeGT8/m9S0b+nzGbqWtCCzHA9Q5QiqCyPLW9OcApLSddldZzhfgFizZ6a2iymNRt8fXdvv7N5AApVxfB4+3pvTbFaOCj+a19MdPw5yJqz+xPfahsM+/mCU2jIF13JU13tLDNQlxaxjTGSgxwzPUupImALSNZsCnhzbtmUdqmprPlkzOzpQ/w7p1xRNzNRICcJmYW7bj+dmS564iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1uPIBDDW6yvsygQFWHh+8hhkDOFPviQqSFJe55nhJ0=;
 b=kymrAFyQsIUE2jpbbVGQh6ttra5XWIOyOd86QkX14nvs1fudAw0HgkumnWcIuSf726gCpSLB1QHihX0fcwV0cW73zTsm4T1X1jjc2EbDIQ5mRn+f08XYKIUi0m75TCDkQddKiD/zJnQBEy14k1O/RAsxQEpXEB3AfDhrlM3vSkA=
Received: from CY5PR15CA0003.namprd15.prod.outlook.com (2603:10b6:930:14::21)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 01:47:59 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:930:14:cafe::8e) by CY5PR15CA0003.outlook.office365.com
 (2603:10b6:930:14::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Tue, 12 Dec 2023 01:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:47:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:47:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 05/12] platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
Date: Tue, 12 Dec 2023 07:16:58 +0530
Message-ID: <20231212014705.2017474-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: c8405ac4-40d6-48a6-86ef-08dbfab45e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q5fDkA39LuPUmW6ZDj34kCfeUX/cspdJM0a5v5RrhKvpxEo0+DpPfvX4iT+lZ8dCvDWKPxlNthPV3bKUZPWyWbyPIkkR6tn3RqfuNls6lmY2N2mR2OU3HPa3H1EaogJsPKeQXoSL5JrNxhkxqCx0r94pda0Fc1NTYoc84Pv1KsM1ogL6w0Nh98MOGHUK1SfR0jpdLwUDsoyRlESiit0s6EVCLLnCEhYDzPZK7uOPBBSL32R1uWj57hwBebJPRwVS0IdvF7moMvxvN2kETLMnQ8M9eW+hCxbaxEefojD1ULuoHC65XSgrpX+ldRVNuDI88vXs3QkCrok7ZcCWwMDwmmvFxVYah+7ArYRRNxhqNHLM9qOB63oP7sXDlDDe1mk88LU+SpBhYtXQLGI9vRn3Tm7h2NvPZsP5YCAUyErjzUJl3JbnVqcq50oBW12CJzSxFhqBo51oJTDe9ogiPdQcHLOS4CjF2Cr292NrtIIkCfVs9j1xK51SpGH8UkNKBI73PGfot3FPFZJ4AGFErsYdlbuVTQ0zuiUiMz11jy4Pqj2LrJSIJPL9tCVdCFGKelzJEC0SBo+z8YTFQ09el9mATcwmbwQ/MhNqF3nsgLykGACATsm9VX1FUo1cTU8bQwlZdnPiVlUhkc4EWkeHSyE7h/wckldyfHJDBugGm8zJ2L9TOdz35/ie9sXRw/B76o4Xqsa63MO5PxfqOKeI+8l7WoAsozRGuFvDGDMqJB75t6gAygcNzouZO9Utykv7xatA+wXoToFSFHM+3X2KnzwMUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(41300700001)(36860700001)(110136005)(36756003)(86362001)(356005)(82740400003)(81166007)(2616005)(83380400001)(336012)(1076003)(426003)(16526019)(26005)(478600001)(7696005)(47076005)(4326008)(5660300002)(316002)(8936002)(70586007)(70206006)(54906003)(8676002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:47:58.8083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8405ac4-40d6-48a6-86ef-08dbfab45e7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

To sideload pmf policy binaries, the Smart PC Solution Builder provides a
debugfs file called "update_policy"; that gets created under a new debugfs
directory called "pb" and this new directory has to be associated with
existing parent directory for PMF driver called "amd_pmf".

In the current code structure, amd_pmf_dbgfs_register() is called after
amd_pmf_init_features(). This will not help when the Smart PC builder
feature has to be assoicated to the parent directory.

Hence change the order of amd_pmf_dbgfs_register() and call it before
amd_pmf_init_features() so that when the Smart PC init happens, it has the
parent debugfs directory to get itself hooked.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c10d40b33667..feaa09f5b35a 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -431,9 +431,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1


