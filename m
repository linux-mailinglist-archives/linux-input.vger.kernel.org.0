Return-Path: <linux-input+bounces-707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F326780E112
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DE291F21C3E
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D47320EA;
	Tue, 12 Dec 2023 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UB7s+ixW"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CAFCF;
	Mon, 11 Dec 2023 17:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUopxZ3FF9wnCn4pUSbkwZNhapdLtaOS9ji/0WUhiwY2bRoYxezdcidxqJ6vhu7WRFrgAlT/HB4PNjaxvBUkgPLMlbAou+or2aZ+RMKWzf5B+x2qprIdjftCH5tmwlSqyfF8M1TBC9sag6m67ogvhFZWbgKasV2TOhYb2tgOYPP8/Kf/OTvQSmvuajpdA8JK8f9nvP6T47iUJtA+pXtscEdphJ9R2z1W69+uhxk5NYwJ8uKSd6E3uB9krxXkWqIUL/S/0yijNShsJf/UTarj/4nM1P+Mpjju4MHGUN10X70q27KTr9jQ4DW6cd88Gj0798zehZaVduZbz7IA245fGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T6paaQkVopXsVw2oQkEhI2WAq/Zg7f1IYVEUyZUcIs=;
 b=IICoDqILUkx6ZhI289n2lIMGfec7FZ151gCE1jdxtEft0vPQ43oGjTfkUrdH6MJ2tx6qrXnAhhlE5Jq4UUk+7shYRJP/T5uW1TdeY5qqU/HjfF4pt1XqfL/aDtUQ0juVTfiLqw73z2R5obBffT/4of27/mOX6dK6BlVkCmMz4PUGwvXMtd/f5aTc9BGBqd+yqzMjlzGh2uPqRhKVENC9aNNUby4c71v6OdvFvh1p+o2IexPY1niXv7b+5NFRam199JYWi4847B4L2VHNlh+Fdwd4auTOwSj4voYpO2plKshyoGFaWwn2JZOdKSHlqzhDrBJ63ZNaq2yOIYflTaK1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2T6paaQkVopXsVw2oQkEhI2WAq/Zg7f1IYVEUyZUcIs=;
 b=UB7s+ixWMutRCwWMFfoIuaHZ+/lZSprXoWxhdyTrQ/EQQKWUemMcnmG7vWf3nrikQFm9lE/9slVI13NJqwY/zP7/Xfw0tW2tOkiuwmrNFvAnSX2ny1pAMAcGdjp3DJJNX9bWFlayPuIZqVr/AhXWrQxuwoL39sw0VcChOCht4/I=
Received: from CY8P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::13)
 by DS0PR12MB7972.namprd12.prod.outlook.com (2603:10b6:8:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 01:48:30 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::2a) by CY8P220CA0023.outlook.office365.com
 (2603:10b6:930:46::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:48:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:48:26 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 12/12] platform/x86/amd/pmf: dump policy binary data
Date: Tue, 12 Dec 2023 07:17:05 +0530
Message-ID: <20231212014705.2017474-13-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS0PR12MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9de861-c177-435a-8bc9-08dbfab47130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aC54jwzYF4HWUsV7/PZO0fPDd5nzMy0HFdZC4YGzlzHOoItZz/oyeIBYwpwHMQ2QsZXpmwHIwuN87w2sDw1OrDm++IiEc7KPuB2vDrKndgLN0nSi/p9k4UELRxyYPN9lflPUos+M2ABhccVQkY5qYB9bV0VGxXa+rupbsPrqVKlMxJYNxUVcatC5oIiW7s6GTrZjSRlfxB40s9n24uAiDQ8ktTvnGzXfiNlU9Do4hjxjaWp866UBio0lGv7vzbGdkzM45+ozgmFa9VCZhcMcUQ3ZMSK5MtoIz1ytZMelo3B2SUdwZce/9/BtkHn+PvHI71tvOmgvlt5LILQqwT8+HkTH2W4t3tHgrVr+zVBua02rASLFrEpN86RpWcfsjd3jqwjmZMvat1nHp1tuRwb7AESXg/iNYaPs2eIQMlATJN6yS87IFdR1HqkQtxkVEZB8d9IiuF9dEWB5SzF1rMwXEZr6xQOF9GoJPmRlCeKr+Xab61jQH4G1GqrC4UjAZHzN2qKmgHo+5ILN0xWgO4rcWGCC1iSpoZjdAf3UpYX7lvT/Q6awgsZd5696IPK9MX+kM9paGhhFG0eRckPEjGYA68rRlPRDzdFPXLx/zt4m1cnwx7iyAqHd+qLoqZJA0a8c6N/2hItJNDXu6+eZIBB1DxMDvOhwItaCOqAp7WQewdfVSeaAIZwp8WbDUO4CtcDklLWAXQ4BSUs9UiIezEUf+tJ9T7ZXsoqOjPtFZe6AC/C4GsBlegq9KYHsxul7fcCYjHWTGRFQZQu7oU66MqXLjA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(336012)(26005)(2616005)(7696005)(16526019)(6666004)(478600001)(1076003)(47076005)(81166007)(82740400003)(86362001)(36756003)(356005)(2906002)(5660300002)(70586007)(70206006)(54906003)(41300700001)(426003)(36860700001)(8676002)(8936002)(110136005)(316002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:48:30.2183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9de861-c177-435a-8bc9-08dbfab47130
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7972

Sometimes policy binary retrieved from the BIOS maybe incorrect that can
end up in failing to enable the Smart PC solution feature.

Use print_hex_dump_debug() to dump the policy binary in hex, so that we
debug the issues related to the binary even before sending that to TA.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index cf95251741c7..9a4757f4f521 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -276,6 +276,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 }
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
+{
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+}
+
 static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 				   size_t length, loff_t *pos)
 {
@@ -296,6 +302,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
 		return -EFAULT;
 
+	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)
 		return -EINVAL;
@@ -321,6 +328,7 @@ static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
 #else
 static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root) {}
 static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
 #endif
 
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
@@ -335,6 +343,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	amd_pmf_hex_dump_pb(dev);
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
-- 
2.25.1


