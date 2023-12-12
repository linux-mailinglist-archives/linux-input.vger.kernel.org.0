Return-Path: <linux-input+bounces-706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09CE80E110
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D9D51F21BCA
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0EB15CC;
	Tue, 12 Dec 2023 01:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hkkgdgq3"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D995CD9;
	Mon, 11 Dec 2023 17:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/KhFSQCd3pDKxaV0cH/mvSHAIWmAQl/nDa8Oz1aGf8QF11BZVgo070jjaH8hdajM5Fph4L5n1nJSw3FMSHbiBpRIRBKdWq0sAUeXEk1opqLRNw/VUKytif3ZeDKpCxSASk9H6rwIHEsnfZ+OfY+LRfnSb982sg3qu3yXLvsIZLUh2nsGxMWHY5k8+fzVfEVBHSIQkobLz/9HUtIsJjmkfByuOk+y+AxHu1MLkXAJapd5KDQhOwaJDG8C6mJxmeM8uz5JWjp8VRGrS1skfYe1/TUxifKkGsSy0jL3/NmW8A6NZ1j0G3PLMwvkOuNRNV+Eg8zsU1mYAdtUsZgbNAy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4boGE7TZ3picWTxWDlkx5lrWGsUmLtji8nMaF2+3ak=;
 b=Yw11coVuX/FH96d293xyphuhdqLCyao6b3oAhPiXI7Tjz2BxCIBVacPVAN+BCidkpDYj2BmuQo84CnjF+4yztS/PJOGW9RR7IDljDAxCVyk23ORSwbQW7pupo3+VPkqi8Vb1JnQ1xcCphvRgISNTdd2Hf63g3S2I4SZZzQsavzX+NHDWchxUVPv/TOCtNyO4Qvf7nfM/W4WCDhVU2Z0ZI+Hdc1YJw7cTgU12NimxWcQjD3Jwvs8YCHXBMPNzt2AGqpnq4drUor8j9pnqRk6aFcJTLJNzU5QrdgeD95agOcghZ/jOGAAWE8w4SYqZloEu620quvqheojKckgqZT9nYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4boGE7TZ3picWTxWDlkx5lrWGsUmLtji8nMaF2+3ak=;
 b=Hkkgdgq383dAi4RN+xcpsmJpPljUxH9tFV5n2JwNEmkuh25vGnVXZFI8gTOCpP2kSuIW721i1XkmAn+zVschOdGEWFWUb3MWg0dJm8mzoiNjNpPdEa4o7dZLg+vX1Z23Nobl19HeraYkYzdbyy8SRe9/A8KDDBH3mgdjBfofkXg=
Received: from CY8PR11CA0044.namprd11.prod.outlook.com (2603:10b6:930:4a::9)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 01:48:25 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:4a:cafe::89) by CY8PR11CA0044.outlook.office365.com
 (2603:10b6:930:4a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:48:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:48:08 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 09/12] platform/x86/amd/pmf: Make source_as_str() as non-static
Date: Tue, 12 Dec 2023 07:17:02 +0530
Message-ID: <20231212014705.2017474-10-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bbd60f-b907-4f8a-15ce-08dbfab46e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2X5Smeu6HM1hPwsso06+BHt/arOcE2E4Myy82rQNPDh0KyO2DWEqolAVeuysqQOv5fnId+R9uz/pMPMJDvuyD56in/of9KMXJ8nhNa14AAK2fA7pO4fPk8gBDBaK+XqO+0vXbz5nnuzpZBh10/ZnLhhR+94xzhr1HFazTUXFvaA//bsp60CqdM4KM+RFRRnUbiGij1q6ieYxvRO5wfKg92HQi1Ex6cwRe1izClvi687cRPTEtbUQ5ZAbIBrqXFhSEMD7RjfhStGqJu6rYO9BvxmGj78OAYZ8fFAX+eUqlZMj6FNMRKBZWjEe4fKIqd6b48K8bcZMI/DoGb1TFewhktJNISv1q+HOoRYWHQhNd9gCj9RZqjmuykprynOCgNK23THy81f3eDaF0BwjZl3ocmzgQO6N/ga7aqYWpYmA/MCeO7Cgpze8Z/3sUdf7gi6hj5+xKuWp+jQePTxy2eV33rJkWnUef0ewbON1Z5/ASGnKfmvC+E3PDuJBM0gJhtLdzgz+mgkWSobGU2YDi21+00/HwEnz3WJt4KQyVnDq1lI/pIQwIb1aMBpOEbMuOKS+Ty678geRkalwsa26P20UAo3Jz36PWSyfVKPw+cj0LxH7I61mOKG7nDbQNO+yt2IhUNkltypSEjlw0wIlx1L+O9DYf70N1+25bamSfhglYJUgMYnvXTlQ1aL04TdeiseZFLlbRZyr0Mbi2gCKS87FmJ5KXVfCUiT0nZNIAwfXUHktM9fsbeWzeBGcTR8CM9xjZPOZJTI9iq5BxQFSLSZr+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(2906002)(5660300002)(40460700003)(82740400003)(478600001)(86362001)(356005)(81166007)(36756003)(83380400001)(1076003)(2616005)(26005)(16526019)(336012)(426003)(41300700001)(36860700001)(47076005)(7696005)(6666004)(316002)(8676002)(4326008)(8936002)(70586007)(70206006)(54906003)(110136005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:48:25.0748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bbd60f-b907-4f8a-15ce-08dbfab46e22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154

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
index 50f98c398727..25e369477f86 100644
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


