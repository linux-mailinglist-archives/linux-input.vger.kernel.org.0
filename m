Return-Path: <linux-input+bounces-95-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A137EED38
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7444280C55
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7B6FC05;
	Fri, 17 Nov 2023 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b7HovqTJ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1BBA8;
	Fri, 17 Nov 2023 00:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zh5LyZWIKoanyc8+iHf4K5CqygvaXRqZN32VBP9mkF4IXATC5G5oOT5YnY5DUbMmB3xDsh41GaAuZ3LQ0kwOLDTrv+BbEIrPgeeGiJ/00QNHuu1rzkSbPZ0pc3rR6O7o+rP/Kdvtqw6O8lTCNAoZoOoM6L5rf33DeYriHo7V/oBHofpQvrjNT/usJkhNycc5oU1YLzo0G4umXV5JrWIWKiejhCZa6+vIKvxV04+QBpX6JI0K1EDGRperG9Hc3n99zp44YIWNxS1iUrKFRwIyWNxP/o2ZiCNUSj2KKWGNopbkWuCVXe6WEwFVoL1Wiw9F2Hmfgzm6scbUJOjg0hhxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luMp8R58CCOqHa+5av0BV3DYV9/iHbJDmL3D8gL+//w=;
 b=LbqJfPkatEqpvS2unyKYQT34+BarbYMul2HehByL6fJZcjaKvrlldQ63dgXlqjyMf76NxqLkBaaBz2YjVTa5RO35wxQI6DVKBTXXvsI72IZIVW7DbS1IQWLksX6Fpx+84Ist1djnlbz//sJomrsGXPGweEc7jAUZgT0a+OkmPQO+l935hlnhUOa+ixTahaxxuunxr9B8emyJCXnEsVFXEduJpNnt5wBRtwZTQSgoESP0yf0JHCSBA8e6W/QNeoZKFu/hUs19pUO4ipwEKdP/0aDaCGg6ke0BPX+XO9xKdZFzprQKedupKbg+NWEIhy3zUfI4rwsjQD29VEbjzCg9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luMp8R58CCOqHa+5av0BV3DYV9/iHbJDmL3D8gL+//w=;
 b=b7HovqTJ9qzJwZMFHx29W9XmTBku6d4VszxwFl/3Aw6Opdlx2RjwFHqomJCa9u7mNOwEmM2lm5L+uFqqgct9X1CTLy0v8f9+uR5q7gHh+3Ej4tCXDLne4nnifYNh3VBrwVPS4GIg70asz6ewRrBoPyozwsDjaH+MJwGMDB0KYNQ=
Received: from CY5PR16CA0001.namprd16.prod.outlook.com (2603:10b6:930:10::31)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:10:17 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:10:cafe::36) by CY5PR16CA0001.outlook.office365.com
 (2603:10b6:930:10::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:10:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:10:13 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 03/17] platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
Date: Fri, 17 Nov 2023 13:37:33 +0530
Message-ID: <20231117080747.3643990-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|LV2PR12MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: fabd11af-5b18-4b26-8fcc-08dbe744a28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	37HMLbIijwdcAq8/pNTkD8xRiqpJ+XzwAydSvsSIiEYnAz1o+9oaqnIc5AaUWh4FfaDNvYwixfS24zgxo1NBJpvnxsKxOrVVUMiyrn/U4UtWwAuV8wNBf7j7ds/c45c3KjIQUSUSzGVnSjJFUJ/QQ+sNInHXkgjfHKONqG61ozOxsTDEcuithhLCky/mHsjYIVNr1zOQy0Y0N3k2UhPiDDDuBrgfXzTFzNKMvorGp98PrRUaza+a7nYNDbf7fXoQ87MUkVt6QVCf21Qcn41vDRMbQ+SaIpMmwy0zJ/L9PDmREID34JsclD4XHFY8nZ+bn7x9I6ztIo58GciUHj9f0FuFQxxaoDbkwH7OfyottNUjLzq24W3Gapor96VXSTC1gWYd2b+e6ef+8AqOJ2211+znk59+GaW8d+EfxJS6+uq0xvrYeMaKbDkb4baJg9jxD+DbpSkk02XbjIvo0SIwWJ8UA1P8MW7+1OdSck1OkjktU+/KZNd1dOu0zsMXHjFt5OCZf2mDKQjPGXGwjKooBICMnYzCtX1zJp8OJYvfiwr0pJ6wHsqrBig0/66Fqdj3UjByZfS76k86lJhJFkJR0KWkHoewSZMI3TkUtaFW+1SBKP3xC9JMw4aCXdyeloMjsTtFljuKJjhzVSCiMTUWpiPCajoUa77NUKpN7EGo7FR+dEEm/eXHA7Y116Qw9VGIYe6UbkCDgStILc8v7a/v1IhpaFMSmsKWXd7KtFTRV1TX24jSwIFSF6daYGJ9kTU7fPPDYYlM2ecBhLZ0INws6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(46966006)(40470700004)(36840700001)(2616005)(41300700001)(356005)(81166007)(6666004)(86362001)(36860700001)(478600001)(82740400003)(110136005)(36756003)(40480700001)(1076003)(7696005)(26005)(16526019)(2906002)(54906003)(70586007)(70206006)(316002)(426003)(40460700003)(83380400001)(47076005)(5660300002)(4326008)(8676002)(8936002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:10:17.2942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fabd11af-5b18-4b26-8fcc-08dbe744a28d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774

In the current code, the metrics table information was required only
for auto-mode or CnQF at a given time. Hence keeping the return type
of amd_pmf_set_dram_addr() as static made sense.

But with the addition of Smart PC builder feature, the metrics table
information has to be shared by the Smart PC also and this feature
resides outside of core.c.

To make amd_pmf_set_dram_addr() visible outside of core.c make it
as a non-static function and move the allocation of memory for
metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
as amd_pmf_set_dram_addr() is the common function to set the DRAM
address.

Add a suspend handler that can free up the allocated memory for getting
the metrics table information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ec92d1cc0dac..f50b7ec9a625 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
-static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
 {
 	u64 phys_addr;
 	u32 hi, low;
 
+	/* Get Metrics Table Address */
+	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
+	if (!dev->buf)
+		return -ENOMEM;
+
 	phys_addr = virt_to_phys(dev->buf);
 	hi = phys_addr >> 32;
 	low = phys_addr & GENMASK(31, 0);
 
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+
+	return 0;
 }
 
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 {
-	/* Get Metrics Table Address */
-	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
-	if (!dev->buf)
-		return -ENOMEM;
+	int ret;
 
 	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
 
-	amd_pmf_set_dram_addr(dev);
+	ret = amd_pmf_set_dram_addr(dev);
+	if (ret)
+		return ret;
 
 	/*
 	 * Start collecting the metrics data after a small delay
@@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int amd_pmf_suspend_handler(struct device *dev)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	/*
+	 * Free the buffer allocated for storing the metrics table
+	 * information, as will have to allocate it freshly after
+	 * resume.
+	 */
+	kfree(pdev->buf);
+
+	return 0;
+}
+
 static int amd_pmf_resume_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int ret;
 
-	if (pdev->buf)
-		amd_pmf_set_dram_addr(pdev);
+	if (pdev->buf) {
+		ret = amd_pmf_set_dram_addr(pdev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, NULL, amd_pmf_resume_handler);
+static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, amd_pmf_suspend_handler, amd_pmf_resume_handler);
 
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a24e34e42032..6a0e4c446dd3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1


