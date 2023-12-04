Return-Path: <linux-input+bounces-440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0078B80305E
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26AB61C20A23
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7081A1EB57;
	Mon,  4 Dec 2023 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EHgD/Gkm"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614E085;
	Mon,  4 Dec 2023 02:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMcgqy5utaPFEVSx/kyekQjlGPztJS8e3T3BE1BOhLrZ9aVx+lahBBaxQiDdV1apQnvb2D6xaoZUAF6dmcCoYS0VjmoYtq0zDwFG8H9VyUCMc+as6p7W1GW2KaZO3Mhly/26asTaDL6xheI6NKML+SCpF0/0wZzSkja1CDECSBZaop8F8Zsxg+m2Ml03KwFef34jaYpg6Jp02TPEiP59BzD489GHjAkoBcsAbOEFNYmiHPKtLRhaHQDVcCDNWar2lF8qfY7hPyYPVHpKor+5ZjP/xbhjTQX6+33ihQ/oFy0cD8UEkbkZ9sH3uMQ3CNSnqB6zUNrvTRfx0BvkoYKT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luMp8R58CCOqHa+5av0BV3DYV9/iHbJDmL3D8gL+//w=;
 b=iTeudPXrmfZCPA8Jjb+jD6yijiPBDbF++lebD6Qf655+JWAeHMlvYSCdLhR7gqoaA6Zi5Hx93TiXHuV17HJmoZ0kXbexHzdPdoew+iIyPTKhBmvSX551nwGOGL7c2kwstYu9lPCLGhIx6+S7YG89j/hVSTqwl2XKNqLNxlwshw07dWP+nPLbbMz+1FaI0VrHr7YPZ+m49crzRsjVhDF1Eg7ztdpH1eR/DkeNqk8hnrdf7p779P92Ke9w+w/7xBGRtV0Lm0jiBVycpRWOw1a/xgHUEtUjU/Szmjv7mMe9a9c3jj5kyr52rj+AdUeZOUS0br4Y2ZWeaOcpfrQHZmzRzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luMp8R58CCOqHa+5av0BV3DYV9/iHbJDmL3D8gL+//w=;
 b=EHgD/GkmlD1y6yiFd7OnktSP7Hh2ci5SQ287H/z0qsGSNUd0DhgbJHSDc/yd9soRH5ekVzqYNBInasUn48NKSpD2/7JTF4qh0x/IO0Mon176FthcvqrpjhKY9ke2/Sk214XhHTLc42THDrM3rfP0lSkd/6hTTAJsIt59Bm0pxz4=
Received: from BYAPR08CA0004.namprd08.prod.outlook.com (2603:10b6:a03:100::17)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:36:15 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::d8) by BYAPR08CA0004.outlook.office365.com
 (2603:10b6:a03:100::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:35:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 03/15] platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
Date: Mon, 4 Dec 2023 15:45:36 +0530
Message-ID: <20231204101548.1458499-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b41e56b-ce87-4793-1989-08dbf4b4d768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dd3fPb/EEfdvUuWYUePpFQtxIcruqcpWaDPAJ4+uI1BxSKIyKBc503r/SeXZb6szYE6QJT+EHx7g7ajV3TmgAHp43qGv/r8pt4NRO2HnCSQiKqUUHDB8B1k3wqL6845DZdgeKPMHVbhm8MsPVn8DJAVqtaSWIioPnup8W+RHbmQbzOLYb33CVIA36GxM3VXHStrUazpLihujItLUrNsCwnB0tjUUn5jv6m+3hHWlDMID+bvu+HrkGrs91GXOJHv+ZIOO15NpDUMqOXQulC2qo8aTApmKyz815UzjVTVZqOQMDtqGlAiSfhJigB9wbPHM+UUg+04wHYcu2HqhuMgCwacYsD3cyNtttuhu6Q45K58tZJd6zl7m33ZQlqC8Vn1lfR4JH8fb6o7OeiOsMZHZuDOMj7Rzqfs47EEdk+LCqfeTVh4CwrD2+jYAcjn8zxkwIXG99VV43EgSMJjnlcmGJAcESbDHftook397xMOY6PtvQ8QLzyyMs3kmaLysQT5owrVI/U+aylnSvctA96ZAJH8q+qj2yw4kxDKNmsY0qz8krVShwnQKZYsCb51SB5LJA7wxitVV31Wn96t9FLF//3E/X9H9jxuuZ04/1zlJ+J/y6qTiq6HRb7b7GqNofdaCVnHJgbeRp5Ct1E+nfY/PtJwwicgPFPx95dUNrJhhORtRn5HBOlhiae7HFRFlrI41/sNfekfkJ7021hrDBKME2I7Zp3RsNNGtWbYIbKSKKlG7tktjOwVeZjzM7VCB59eXNzGnKQ2itycBGyma85Gmyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(46966006)(40470700004)(36840700001)(356005)(2616005)(36860700001)(81166007)(47076005)(8676002)(8936002)(86362001)(83380400001)(7696005)(16526019)(82740400003)(336012)(26005)(426003)(1076003)(40480700001)(40460700003)(6666004)(478600001)(316002)(70586007)(70206006)(54906003)(110136005)(2906002)(36756003)(41300700001)(4326008)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:14.6552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b41e56b-ce87-4793-1989-08dbf4b4d768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871

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


