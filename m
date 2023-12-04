Return-Path: <linux-input+bounces-453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01665803085
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1848280C49
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF4822314;
	Mon,  4 Dec 2023 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qZTf3r9m"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624D1F5;
	Mon,  4 Dec 2023 02:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbrrw+JXg6tlZYIJqWEOg3XWXxQif8DwQ5r9ZLww5CsjtseQB9Z+Fgz8NWWK79WS2937a+OsZmd9n9hSVW3sO9S6XS7i9ZGABdz+gZ//PphQQ/x2M/lXYEeh51fYbJY2h8ySL20RjL1sQf91nw80KiiBDKaHuIBsRFy+JDGWmUMb7K7qOoAje00fmTkqTs2R8GOd/YnOIFxpIY+/E0sdsU6Y+2fc1rH2RpcDdlAYphVVUPz0G8PPqvQrHM2p0b+w9el0+iRotDSMpFR8Bi2mFmJPzA9FdeRvsKC3ecCySA83+GZXUgWsQIwTr2/Gd0RFZeKk6Abu7N4XmsuIhnEvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEVtjO4K6TCsnFY59yYgWsxqkb7bXTGCh3hY8SuSAuM=;
 b=f+k3RTaJAIF1lTRW7H5ncGdNjFJMmx17+Pbnhlbe0cdyiGPY5j+C/cgP9mHam2gBF+tuPpTSqLkdH5D+9JVRUH9u6wYpR9/dF8ffRry1BuRmFEIqbt2dheoZIsQTDKo4XyC2TyAQjJ366ta329TUDLY6WgYvaEAYMIvTT1SkzlrNaE7CfbTLPwoHVd6A0kon/AVLyuws5epR2k3UjK7PIwE1Gc7COC8DQ+nHb/ie7c6E4k299v1bciXHD+q+sAR2oG/EdzT9sgTBp0O4GQX5w+xIt631zn7XwQ0jPjnW+UrQsZkQLy1HDIICWQ1pvJCKvIvOYf/qe72Q9vIyGWBcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEVtjO4K6TCsnFY59yYgWsxqkb7bXTGCh3hY8SuSAuM=;
 b=qZTf3r9mmlDmcSRZf4YUVfdEsLwtT/2V93dIORezS/6P5V0Jy6KZD7pX3ssUWQHyyT0A99QLSfwNXXdSKaLfWMcy4pTekPyEmLB/ZbbOYFzqNIiPToerm4jw4wrNjcLjDkHe2G36mFPPDh4LMN/8Il/1E/8ll8BSNXoO6Z7N1hs=
Received: from BYAPR08CA0004.namprd08.prod.outlook.com (2603:10b6:a03:100::17)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:37:42 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::68) by BYAPR08CA0004.outlook.office365.com
 (2603:10b6:a03:100::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:37:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:37:28 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for ALS
Date: Mon, 4 Dec 2023 15:45:48 +0530
Message-ID: <20231204101548.1458499-16-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5ad847-62f3-431c-060d-08dbf4b50b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3dozofjIJs2E5QSOuD8xHyv9eTV9pKCp6Gul65nURmj/4ltxZO04VvuewBk131xVWgH8Yc2yt53RxE1xC0kwM86Ei4usL7/aocLuCe1d7vT4L+9UaN1hm1MUZ2TGlTqaprwMR6KUnOH/yHqR4zaoSSe3u2gcMYDecbLCiwGdhPqMmOJC/qS8vr8Joj6N8RuvNXT5WsmYS5gcUm1+tWvwIsRwwPj7//fHPwwIGIcsIcNGNc45sBu6tnPDmwuv/cCXJJz2K3Sq9X7+HcTxMBdD5X87c8UknXFzcvmpQ3StPHIUX2e7dPtsvKYhC8GJIonJb+7BQcfP0OZawtW2INji8DMNNG6lrc6l+e9buiKdCP6wfGhifZcKUQI/6Lmos6tB2KMGlTOXw3Aif6VKR2awP/iE2xQbLIhC2T8MoyYBAWkROqYJiCePsDejH44cYRTaimcpmpFSNW0eFOnwG5CIwyAhPT8SkW73ibUeKe70B2nMmzimE8xhkH7IJ1vi5doy7v855MFQTd3XAtZ/pZYkWZ26mpIc+rxowvtBwTktC+s4Dl/p0k19DUZ48aRW75uFbjM2DhHQPO//rKdbvBdCpGFZJ/nwnMKxoGn6LTievp/6D3gEQZ4vuzFlAyk8awVK0J7aJs27UU5LtU9usUKpHAEwNAS22mIXe813sR3WRDOLo+R+WuRVvCCrES4NStfRiLSnNbwUjvagvILqkoTq2qmTqyxxOLXjXtzoHyhEj/lcmIo99oPjuRfEVoOJyfwBnBPW1uSIMUs/ycANwoWceA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(40470700004)(46966006)(36840700001)(1076003)(2616005)(4326008)(8936002)(8676002)(7696005)(47076005)(40480700001)(356005)(81166007)(83380400001)(36860700001)(336012)(82740400003)(426003)(16526019)(26005)(478600001)(40460700003)(6666004)(54906003)(70206006)(70586007)(110136005)(316002)(2906002)(41300700001)(36756003)(86362001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:37:41.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5ad847-62f3-431c-060d-08dbf4b50b5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

AMDSFH has information about the Ambient light via the Ambient
Light Sensor (ALS) which is part of the AMD sensor fusion hub.
Add PMF and AMDSFH interface to get this information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 19 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c            |  9 ++++++++-
 include/linux/amd-pmf-io.h                    |  4 ++++
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index cd57037bf217..a1950bc6e6ce 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -39,6 +39,7 @@ struct amd_mp2_sensor_info {
 
 struct sfh_dev_status {
 	bool is_hpd_present;
+	bool is_als_present;
 };
 
 struct amd_mp2_dev {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 0351b0fd394a..9dbe6f4cb294 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -77,6 +77,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 		case HPD_IDX:
 			privdata->dev_en.is_hpd_present = false;
 			break;
+		case ALS_IDX:
+			privdata->dev_en.is_als_present = false;
+			break;
 		}
 
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
@@ -188,6 +191,9 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			case HPD_IDX:
 				privdata->dev_en.is_hpd_present = true;
 				break;
+			case ALS_IDX:
+				privdata->dev_en.is_als_present = true;
+				break;
 			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index f8758fb70b1a..7a2eee783457 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -99,12 +99,31 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	return 0;
 }
 
+static int amd_sfh_als_info(u32 *ambient_light)
+{
+	struct sfh_als_data als_data;
+	void __iomem *sensoraddr;
+
+	if (!emp2 || !emp2->dev_en.is_als_present)
+		return -ENODEV;
+
+	sensoraddr = emp2->vsbase +
+		(ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+		OFFSET_SENSOR_DATA_DEFAULT;
+	memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
+	*ambient_light = amd_sfh_float_to_int(als_data.lux);
+
+	return 0;
+}
+
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
 {
 	if (sfh_info) {
 		switch (op) {
 		case MT_HPD:
 			return amd_sfh_hpd_info(&sfh_info->user_present);
+		case MT_ALS:
+			return amd_sfh_als_info(&sfh_info->ambient_light);
 		}
 	}
 	return -EINVAL;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 5e769dcb075a..8bbc67afc7ea 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -46,6 +46,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
+	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -152,8 +153,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	struct amd_sfh_info sfh_info;
+	int ret;
 
-	/* get HPD data */
+	/* Get ALS data */
+	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
+	if (!ret)
+		in->ev_info.ambient_light = sfh_info.ambient_light;
+
+	/* Get HPD data */
 	amd_get_sfh_info(&sfh_info, MT_HPD);
 	switch (sfh_info.user_present) {
 	case SFH_NOT_DETECTED:
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 5b6d29d36922..b4f818205216 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -17,9 +17,11 @@
 /**
  * enum sfh_message_type - Query the SFH message type
  * @MT_HPD: Message ID to know the Human presence info from MP2 FW
+ * @MT_ALS: Message ID to know the Ambient light info from MP2 FW
  */
 enum sfh_message_type {
 	MT_HPD,
+	MT_ALS,
 };
 
 /**
@@ -36,9 +38,11 @@ enum sfh_hpd_info {
 
 /**
  * struct amd_sfh_info - get HPD sensor info from MP2 FW
+ * @ambient_light: Populates the ambient light information
  * @user_present: Populates the user presence information
  */
 struct amd_sfh_info {
+	u32 ambient_light;
 	u8 user_present;
 };
 
-- 
2.25.1


