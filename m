Return-Path: <linux-input+bounces-451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B6F80307F
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07AC81F211FF
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489DC22085;
	Mon,  4 Dec 2023 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xLad9fhy"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6145585;
	Mon,  4 Dec 2023 02:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmVHMjcomrpZaECBEkPi+manNN5/DBj0e7EVYRMfMWG57apTF3yhZAgBm32abO8zdDhr0t+7QEGPuXhV1yNraEl6+iu8fho5E3CTyQohoMKRXUHhlhT/Fl3KYHDvoY+VhpjQw2JW1m1S6Jz+FbQYat5O2qLQfmck48Rc8ZOWLpf2vle4lmvw9LFhRMzghde2LcU8vsmYQKEESq/ISDOtGDAkAoYWDINApquSAuj3xuB8ZBPniScpfJwLZh2ceTZCYW6UY33UmlRDLMblY9n6c1b7HdUQkx9KRPpd4ZbxN9CC7NQ7vwOQYnF0BMe3yEySAo47j1Gvhk/euXC9qhgtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFs21D8IGCCzUGPhIWcpxeQTZQcQGApSNbttpw7ZgBI=;
 b=FjTJBHGrxh1zFbDHAxjWr5PCFwj8p6vz1hgk1jEuNiYYLl+ueODOnatElYjSndAYgiGuS5XrFB7VPcs/Ngz4iqxwPrIGqxzZ4Zfe8fQy8usSuEqFppJr5Id68t5DlVw2Pc3qLEvEXyICSzk36Spu1fc7EbObhcuGiDq/Mo45RBAsLNqTICd7gLoKD5zannCNe5HzkmucqmM9XvXgCuFhDvyfDH7Jflvy1NdkOy9p4WtMknb031Oq0YdCD5vEKhYu3h8TtVMbZDjmHzZeVb7FLRPdjaW5/+LcdF+OxZwQVWAxyAReFxl1pK5i/o+qFOgdigyVaqGvWJ+7t3PLYEX8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFs21D8IGCCzUGPhIWcpxeQTZQcQGApSNbttpw7ZgBI=;
 b=xLad9fhyZfus9JBOgi7BDoNNahSI+HX9dLZSBXbLYiPgOXpRZySiSRsNV8pRCNJy8smQh6/NPxCtecgRMsVs7Cw6sK72CzZYtzjF2CBPXyO/ZBGwe8Wb+P1XMpXSDUsdYEPa3EwaLl9GoyBHs3D7hB6x36Ge0ZdOIH0WaIcpBaI=
Received: from MW4PR03CA0327.namprd03.prod.outlook.com (2603:10b6:303:dd::32)
 by LV3PR12MB9117.namprd12.prod.outlook.com (2603:10b6:408:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:37:27 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::1b) by MW4PR03CA0327.outlook.office365.com
 (2603:10b6:303:dd::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Mon, 4 Dec 2023 10:37:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:37:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:44 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 13/15] HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
Date: Mon, 4 Dec 2023 15:45:46 +0530
Message-ID: <20231204101548.1458499-14-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|LV3PR12MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b99f0b-d2ca-4ce3-80b7-08dbf4b50259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rm9q4Ix5B47Ii6penHP3UZridHwNrCweHDzBlwK4iC7k9EPMWG7czo1hxKr8Jmn/WOAXlaCjNVKLaCeBXdeI9oKUc01oXL8QNSI2AsdGp9TAmUUx8cXMIsvBKDf2OFuI0LrDwz+8jeM7yWnCmpsTtvB5zGjU+lqhjjYArNTOny90QhJf+3gOT9vq09dSzxyape+y8OG2bu8Ytc2Nu7i0DfAUIIhHHxsJqAr/pGaELAB+s/LGILfOZedp/a5khOYrBbNudOhnhFaCvTxmBonVYFPg+X6IqGhP5WAH2utp/6keqYXf7a/TVaI/VGP1CnuFbyloBiOx/KYcNtfpTi9+x7QvuuVa7idI13WLVkChXFFibEPXAH7JuIt36vstFv/dn4AC+Pskzem9y1rEnSR4CqMr1szV5Ds+7miZPU1/REUC559QOpzv2EeGHy+X9kFskD3YEVRxq0uUmzHRMXs6DAehg4rHEn7m0AtLwe6uewGQIeSVGKemEr4zTjFNrMoi6G1wYA/oh0/Xhq8oGGI+i4eRhCcHGj6ebix7RTHkrZYt+3jfWo45tnouUx0IG0/KjA5xfxwqd1DRu3KZcRhoVU8A2m6Zkbz2rTxbKh9MFb/rGRAkX8hkph2wiaLeZJz9pUVFuLTHv+YwOmpyaSqiFnyegFyLyxaSrLmIczI6+2UUjp+pdiIL+WcBSVWwQremnmI+8xn4aLVdQvGCBUyglR3ZYf4ytH9rmyJ8J0FrT8EiWWfX+pNY1xnZPaG3lPGItn1Tyfd+VamdIfwtTOiT5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(82310400011)(1800799012)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(478600001)(26005)(83380400001)(16526019)(336012)(47076005)(7696005)(356005)(81166007)(426003)(1076003)(40480700001)(82740400003)(66574015)(36756003)(2616005)(316002)(110136005)(54906003)(70206006)(70586007)(36860700001)(5660300002)(86362001)(4326008)(2906002)(8936002)(8676002)(40460700003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:37:26.7172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b99f0b-d2ca-4ce3-80b7-08dbf4b50259
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9117

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Current amd_sfh driver has float_to_int() to convert units from
float to int. This is fine until this function gets called outside of
the current scope of file.

Add a prefix "amd_sfh" to float_to_int() so that function represents
the driver name. This function will be called by multiple callers in the
next patch.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 28 ++++++++++---------
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 8a037de08e92..33fbdde8aff0 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int float_to_int(u32 flt32_val)
+int amd_sfh_float_to_int(u32 flt32_val)
 {
 	int fraction, shift, mantissa, sign, exp, zeropre;
 
@@ -201,9 +201,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&accel_data, sensoraddr, sizeof(struct sfh_accel_data));
 		get_common_inputs(&acc_input.common_property, report_id);
-		acc_input.in_accel_x_value = float_to_int(accel_data.acceldata.x) / 100;
-		acc_input.in_accel_y_value = float_to_int(accel_data.acceldata.y) / 100;
-		acc_input.in_accel_z_value = float_to_int(accel_data.acceldata.z) / 100;
+		acc_input.in_accel_x_value = amd_sfh_float_to_int(accel_data.acceldata.x) / 100;
+		acc_input.in_accel_y_value = amd_sfh_float_to_int(accel_data.acceldata.y) / 100;
+		acc_input.in_accel_z_value = amd_sfh_float_to_int(accel_data.acceldata.z) / 100;
 		memcpy(input_report, &acc_input, sizeof(acc_input));
 		report_size = sizeof(acc_input);
 		break;
@@ -212,9 +212,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&gyro_data, sensoraddr, sizeof(struct sfh_gyro_data));
 		get_common_inputs(&gyro_input.common_property, report_id);
-		gyro_input.in_angel_x_value = float_to_int(gyro_data.gyrodata.x) / 1000;
-		gyro_input.in_angel_y_value = float_to_int(gyro_data.gyrodata.y) / 1000;
-		gyro_input.in_angel_z_value = float_to_int(gyro_data.gyrodata.z) / 1000;
+		gyro_input.in_angel_x_value = amd_sfh_float_to_int(gyro_data.gyrodata.x) / 1000;
+		gyro_input.in_angel_y_value = amd_sfh_float_to_int(gyro_data.gyrodata.y) / 1000;
+		gyro_input.in_angel_z_value = amd_sfh_float_to_int(gyro_data.gyrodata.z) / 1000;
 		memcpy(input_report, &gyro_input, sizeof(gyro_input));
 		report_size = sizeof(gyro_input);
 		break;
@@ -223,9 +223,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&mag_data, sensoraddr, sizeof(struct sfh_mag_data));
 		get_common_inputs(&magno_input.common_property, report_id);
-		magno_input.in_magno_x = float_to_int(mag_data.magdata.x) / 100;
-		magno_input.in_magno_y = float_to_int(mag_data.magdata.y) / 100;
-		magno_input.in_magno_z = float_to_int(mag_data.magdata.z) / 100;
+		magno_input.in_magno_x = amd_sfh_float_to_int(mag_data.magdata.x) / 100;
+		magno_input.in_magno_y = amd_sfh_float_to_int(mag_data.magdata.y) / 100;
+		magno_input.in_magno_z = amd_sfh_float_to_int(mag_data.magdata.z) / 100;
 		magno_input.in_magno_accuracy = mag_data.accuracy / 100;
 		memcpy(input_report, &magno_input, sizeof(magno_input));
 		report_size = sizeof(magno_input);
@@ -235,13 +235,15 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
 		get_common_inputs(&als_input.common_property, report_id);
-		als_input.illuminance_value = float_to_int(als_data.lux);
+		als_input.illuminance_value = amd_sfh_float_to_int(als_data.lux);
 
 		memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
 		if (binfo.sbase.s_prop[ALS_IDX].sf.feat & 0x2) {
 			als_input.light_color_temp = als_data.light_color_temp;
-			als_input.chromaticity_x_value = float_to_int(als_data.chromaticity_x);
-			als_input.chromaticity_y_value = float_to_int(als_data.chromaticity_y);
+			als_input.chromaticity_x_value =
+				amd_sfh_float_to_int(als_data.chromaticity_x);
+			als_input.chromaticity_y_value =
+				amd_sfh_float_to_int(als_data.chromaticity_y);
 		}
 
 		report_size = sizeof(als_input);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 656c3e95ef8c..75267b0fec70 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -166,4 +166,5 @@ struct hpd_status {
 
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
+int amd_sfh_float_to_int(u32 flt32_val);
 #endif
-- 
2.25.1


