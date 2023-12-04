Return-Path: <linux-input+bounces-447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6D803076
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2671D280F61
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D7221A0A;
	Mon,  4 Dec 2023 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X+rj0cr0"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B59FB9;
	Mon,  4 Dec 2023 02:36:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2Ns44kQuZW0iv8damn5Gn8XzuohEmMwksyVivAoGHRGJatOVbRyluv/shyNrAQMB+JQei8KOJRlXsY+jZdFJHNXMi27Iw6FXrRuYo9qozTBkx6u2dv7M+Q2EhsEcCOcA1H0qvX7P4vFgf7nGjiQJAouy1auY7axEVaf0TsLMDRYslhUoMQjo2SNnQX8lghZhGxpuiAC9fOXe1LBUNOhLd0BCzKXzpoi4CtJeyw5N+9BpSRM3FvOF7OW2VOQQ0Nz17D+THNPjrjSyfLZNF+I0ZaWRaDlPIuRaI/NbfphdxVx0V0XxaqA09hPVTF+9kDMq5osrm25cGt3BVDCIKEF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30hH3w19yZZlf11C7+7J4gVzwcKp3pPm94RjdHEM8Tc=;
 b=gS3BPWEN9YJrL6mKORLXvyXelbBehn6qoK3242uQJ7ivAluMh1VsxRBtGAQCv9NoUVOBvUXDI9rBhk7DbN13G8IE55o797cjHAG/I7vOLfbaeDy4QquhT57DGfxaIySKMusjuXeeFIr0KmR8OGaoA8oGDyH7W5QfBDXkaIAov1OuY8dg2Y0PbsIWzSvTpJkTnOBTI/+y9jO/H4hV4LS2HMSiRhMvua/Wbm4qR3q0aib45irPhnOpAUgk3MeBPHFBu5wJTdJmMvBbH/eEHk3yIJMIsNy4KceyGe8Hnd5L3cpQ7C1SWBYTrAsPc1+MbvwlywUQ8PKnoYQGFlJxU1UBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30hH3w19yZZlf11C7+7J4gVzwcKp3pPm94RjdHEM8Tc=;
 b=X+rj0cr0/8+JwvdlcIt1P9xOfcCqszSOHk7xmMuwM7LFqV0JAvYLAQkvpSkc2OHXgbXFzXnOYVj3JT93JQ/8AMufvNopWbMCWDaIXu3VYi2XJPq69+rv6Koj9SWaWbmGSH1kBu2j8yptIpzUbmrCsW8f68S2sO5Zxo+Jx/1kr4g=
Received: from SJ0PR13CA0146.namprd13.prod.outlook.com (2603:10b6:a03:2c6::31)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:36:35 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::a9) by SJ0PR13CA0146.outlook.office365.com
 (2603:10b6:a03:2c6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:31 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 09/15] platform/x86/amd/pmf: Make source_as_str() as non-static
Date: Mon, 4 Dec 2023 15:45:42 +0530
Message-ID: <20231204101548.1458499-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|MW3PR12MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beb48ad-7e51-4aa8-cdd0-08dbf4b4e34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wVi9+MViZs/NrT8HcPXLM98kld865KtDkUIwvPr8FaH3fk5qeaK0SYFhZSBWDvd6WYgKO7KqBDt7hE1/tsvcKBQBT6Pns8eMPFHoafo8rfMyAPIEWjapw5bj99g0jcuDhvnCFFmxwfb6HJ4ti8MV+wupSQI8zwEkDBpnNTmU/Y30aY/bzMWHDJGeSRn5856CZp81BNEPpWK032416DvrPlgkmctRw9sRFHINfAf2aRhA3ZUaE4JJ7al1F2Ii0yon6kJh/rFr6ymOb7L+9XK7FR8XDIsmKaF1X1zK1HCTUW8om/IX+lvsiXD1nI44A/Yxo/LnU1IwQlEoIw2n6u2vgJ8Gz9P3NgKPymxZaTZ70oZyXlm3D1UQucfnzxL9GOH7yOMIxdo0Z72CA2TAlJha4VpR531JGu+jemzhl8feGu/DYtCMQs4uRGT+AVzCImAvD9FWuvYUR6k69TQmpGWK8zNCnI2xVH909WwiwGEeI2+4Vw58R0JcyUZhShqIEvUkCOBc9mPllRWKIxaMG/eZuvNulQkmLIsMK2yq8vdJTMIm2IrQmrRWPVJSYdYD0pmfRs7vpuF99I6ILVvIHIEbIOySXXiNbVkkk5HqSU8BJJsbsIJ5TgJBe6TkqeHz6EPiF1/icAt8TObJuw2pX5Vf3hUfhdzQ64Q7FBAoJgv2Rm8Ydz00qSralsKue9If1fTzMaJY7w2DbKT38XjZWUDH0K2wITZFckk70uwxmdYd+FyHGcQ08PoKUlJsT6onc+IRwtmpos7WNz25glAYOUNOBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(40470700004)(46966006)(36840700001)(1076003)(2616005)(4326008)(8936002)(8676002)(7696005)(47076005)(40480700001)(356005)(81166007)(83380400001)(36860700001)(336012)(82740400003)(426003)(16526019)(26005)(478600001)(40460700003)(6666004)(54906003)(70206006)(70586007)(110136005)(316002)(2906002)(41300700001)(36756003)(86362001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:34.6402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beb48ad-7e51-4aa8-cdd0-08dbf4b4e34c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345

Add amd_pmf prefix to source_as_str() function, so that the function name
does not look generic. As this is a helper function make it as non-static
so that it can be reused across multiple PMF features.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 drivers/platform/x86/amd/pmf/sps.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index fb9ce2593236..216a9f795436 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -600,6 +600,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *output);
 bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
+const char *amd_pmf_source_as_str(unsigned int state);
 
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index a70e67749be3..33e23e25c8b1 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
 	}
 }
 
-static const char *source_as_str(unsigned int state)
+const char *amd_pmf_source_as_str(unsigned int state)
 {
 	switch (state) {
 	case POWER_SOURCE_AC:
@@ -47,7 +47,8 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
 
 	for (i = 0; i < POWER_SOURCE_MAX; i++) {
 		for (j = 0; j < POWER_MODE_MAX; j++) {
-			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
+			pr_debug("--- Source:%s Mode:%s ---\n", amd_pmf_source_as_str(i),
+				 slider_as_str(j));
 			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
 			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
 			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
-- 
2.25.1


