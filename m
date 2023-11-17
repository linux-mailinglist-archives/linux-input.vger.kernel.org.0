Return-Path: <linux-input+bounces-101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 326297EED4F
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95DD1F26184
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2698FC05;
	Fri, 17 Nov 2023 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zG0SGvuE"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A60D52;
	Fri, 17 Nov 2023 00:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNbLo6Mxj6VByDmRavu3PeoNhLLTdPUWLF/ldzxAAPVEzGHXPiOkamvurUDZQ0FmZngXlaIFqj2eCUPvXtcxZpmuf87XusZ2JdAceg5zZ3/gEjbo6/ExI+R86pCXKq2Xv5grJU3kcp03pmiopGVPiXXsr+5g0amlg9ldJH3dTcFfx48nd/o6IhNF/cHdPHUJTqkSKiMJkfNPMod/mteuPTFJTZNe5ng0h4jBXtz248VnGPsOxMWXJARTPzmxL36qCEhWbHWj1FozZDRzhY/S8twPL18q+LXpGyJ6SJIACNelnbkbzZ76iVoZTrwSuZhChol7aWOEso8aThx6tN2nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4ThUBmT2J1YBqouHs0nneydTTV69xNOBh60SWe/WSY=;
 b=QQ9WxUEz2Qi2moClwRgQDmy4OabGUBSikdJV/YbAuQwTsF1J5GYetctkkb5v5tnJFjBBTxjKvGdtMnMBbcq7Q5Vhw54rj7ELnAYgx8xBlFe9lADc8CTpfznbNda8Sb5TRZRARxmizhPhxCQnX+xxmf4uM4DpI0OhbinNnAom602YMzIADZDYdCsPAy5Sdg/FMqzwTGWDhAacEgz7w6p4HPGun12p7H+shWMW1WucAUzaDGdoBtEjWZkdElzpIJ/eVwziew04gwz3HT4qKUy+ISlnh9FkL1AdHDfjFGLB/f1XPa6CU+d4CMzVvoAO7fJ+gpNyi8QpDjDqIe2U2oybyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4ThUBmT2J1YBqouHs0nneydTTV69xNOBh60SWe/WSY=;
 b=zG0SGvuEVnaKNcZkh84l3s3DCHoDjSlFW5qMZBtq9/pCUdh3MoMzwBcVWfCRIM1pVq3ZrsmRbaJGXgFI1tzM1eZ6LHRdIyyhZdd6+CpkRnsgw4RdiCCAIGD6kXJ7GmHNBcH5hQZNV9i8WBOuJ6q4hkm8u3fk7pboj6OnTUS11so=
Received: from SA0PR12CA0004.namprd12.prod.outlook.com (2603:10b6:806:6f::9)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:11:12 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::fd) by SA0PR12CA0004.outlook.office365.com
 (2603:10b6:806:6f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:11:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:08 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 09/17] platform/x86/amd/pmf: Make source_as_str() as non-static
Date: Fri, 17 Nov 2023 13:37:39 +0530
Message-ID: <20231117080747.3643990-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|LV2PR12MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d366912-01bf-4f18-575e-08dbe744c301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7h1TJ+xyHwCU5y1Fo3En3TpuXNzahp/LfyawWv6xa1DbCYf1N127LwTCJZgytIPYlBj4+v3p+DD9creWeQsnGmwhcLeBkE1R6kvQtp/0DzifK4W7DKNOal0oCTj2nEvzeJsMpsU90KaEua43M0XscTgpCQTGRGyRteVwqrytONYGtGaP3k31h+ZPER9VJU0mwDpq4wCvzwBiIs4aVgMwkSuUl2ROuNSSz8rV3ndMqkkJ/emlx5D1U5E3u2P1NDPU08+oP9iqALO5r0ti/SOidJpUXIqPphRUPwSP1mp60+Gw+OP60VJ1n9oeUBBYAjwYheqvrdi5LZUfNB3B+eAnJT9vqcOP6inH10iUXuYKpDTAbARADVvgAsmD5ywWXSvEvFlMaKUsLBZEZYZho9uWOSTTI6xxR4LH9q7PowBT1KedQ5bFn79cUlk4R13Eje6BL/ZHpMAoNrEXtMbKe/f2rtMEC6wq15UBTlMntZRM3DL64Sxl6L2asLZg8keSWP58aEHOj04U47ADKW/DmRCosbkvJvoP1xxZe+ph6Rr3zyGT6x80ZPAle/OnWSZ+Dmsli2jmV0nmd5BRoi1ZPsviXjudc6xgnumLwWbWw38fEj+zJbnO5psSmiWS7rr7SMmJz/WCutzXgML/UNy2xshLOVgG45SBo+ttCFYqf6zLF+PvMOViY1bElgPOrJg5JbChXJSeaDSHFAMmo77V676EQhPR1ZOzN5QmRjW6Kth+8ZhDB5d74ITjyL6stVamP2fdpn9o6QNYMXy0mF8U8hTZTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(6666004)(356005)(82740400003)(83380400001)(478600001)(40480700001)(2616005)(41300700001)(7696005)(81166007)(26005)(16526019)(110136005)(1076003)(54906003)(86362001)(70586007)(316002)(70206006)(426003)(336012)(36756003)(4326008)(2906002)(36860700001)(5660300002)(8676002)(8936002)(40460700003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:11.7869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d366912-01bf-4f18-575e-08dbe744c301
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776

Add amd_pmf prefix to source_as_str() function, so that the function name
does not look generic. As this is a helper function make it as non-static
so that it can be reused across multiple PMF features.

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


