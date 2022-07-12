Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0996572261
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbiGLSTh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbiGLST2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:28 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A55D0862
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxOJMadSEjIoI2Hh49woUE5qqY7umZJXHzBtrGx5Xv5+HRLfE8xXaf2uNjWwNnWd2EWPcmOJZmK0GbkP3rPl+ejwdXoa4AJjagu9/mWjmZwhyKQF4Fhh/8VBsm6iLTYG+FCyt0uh+vf/DmMLMBev/w0QtabMeN+ocTr/IOP6n79Va3TPfHZbJZ41CV+g+VaJhlaB+hbFQyGR/a7OpnaYT7Y1wZWA57Z/gnNict0JLwcDKzliiszd2mLPSdGjH6DDpNuBe0SCtJxnh2IM4wykhp6QRp1EPyoVjJswnt9h8NJx0b5Dj9nHNVqqzQC2pJ59f38SERrHx96RFfqMvLKAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZqHH/DAyaE5dTgo8HjiC0gUD2NSCesj0yf+rc3U+Fw=;
 b=gAzpVTbTgz2x0CvFngLiS5xbuHdj4fwOqCBbvMVu60I+g220gGF9BGYDRKygrgiblM3C6Qc4/9C3zGVEoAKhRLHlBgrmIeY16qaZa5/uP/ot0+NTd0BERES832n9hXZNa0VmoCboJdJduwto1iBFzgyH8YYkCoP147xe46pvY/LcSuamLw81rqDXuc7l3AGFKf4S/YERmO4f1/pw9v2/1toVY/qElY4pIw8YgrJNZsE2JVf7mR/y/U/y4oVyF2bNJ/jcDfiOjTwL2qCc2k0ElECpY2MdoJDiPO5ZIv0QK7caMVhikFp5BFt0hDQX/9O87Kze92qz6XsU6rLF7XGiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZqHH/DAyaE5dTgo8HjiC0gUD2NSCesj0yf+rc3U+Fw=;
 b=WBzM7AB418kys3Vr4lSyo7lKQ8NYYm5Jh2opENWywR6G92WJ4Z1Gy1Hx1GGd5CXwzuPGoRwpFfChr3UzAIr/u6WnO2jtpgy5YNnHid59+3Fc9RvyfwWRKAlHwLC4MBxboRB+nimzDuwlAbeFCBCcByqr7RxI0NXUKZ0wxHUTIpc=
Received: from DM5PR08CA0059.namprd08.prod.outlook.com (2603:10b6:4:60::48) by
 DM6PR12MB2860.namprd12.prod.outlook.com (2603:10b6:5:186::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Tue, 12 Jul 2022 18:19:19 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::cb) by DM5PR08CA0059.outlook.office365.com
 (2603:10b6:4:60::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:17 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 05/11] HID: amd_sfh: Add descriptor operations in amd_mp2_ops
Date:   Tue, 12 Jul 2022 23:48:30 +0530
Message-ID: <20220712181836.3488343-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
References: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8e29678-6340-47c4-ad43-08da643309f1
X-MS-TrafficTypeDiagnostic: DM6PR12MB2860:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PSjwBWxA/7pW0s7MURRaEo3ZDMp9cEWrBnMKV98XrRg0zBElr3iCED6sUzciVVoPgEgRWwYU84v+RWeJaJRvg3zmI3jxR3LZk6neqb6UKCwHkME8FFBTNzJAes8wn7cCybCmi7aLBxidmZJcwrIiBStkgVbyUhk53uZ2m9MnQKz3HvbsshJYpDKscozcnwOFM6rVkt0Nk9+hov9ABTOCDgE7f0PPmW0IdNcUAwGdKhJDMDEHU81AJtvxeylpUky/cXCSE/RmcCJRkd/RrCOM7jgHK/EnDdGNLk337kYlzy9rcldhuEVZn8xP/AZunEskL8yn88lhT6CeTI/DtntTDDCZqiS7SouKnmhoideXPfk++PBmX4oe8Q6BvKX/PtkSwuA3WHpSnkSqHlD+YAAJr0wA0bDRF82k6hDnQLbslcLCpEUSYvajSn4wfobYMwPLGqFv5/h3NrCTMcgCHgZHX8feHfHwDgF0O7kgIStESjinJCjb7zzPk07CLgbTDwMXCfA+DY6AkU/BDeSQHJDKjUTDZ0Qk9C/UkNVdbBpdVtHt08V4c9cQge5Llpv/BdX9oTGF2CJiLZ4xvRFFlqYN9e5ejfSPco1v4xa9jB0JenpfVBjzCvGA7I1cjjSqXRtGct7o7y55SOmPGN8g5m1cPVcXcMDk+iuyFjMsebNrJh82gST8glc7nl9deailKfzndOqPot0VcLw8xF3lPd5+fqwSs/XWmtgSLtBNnXDiSGFNT+8XP6SLBY2R6EDb6Vhss0XRbugtGJ4lQxeaB0rNiTCQYOqtYuBjyGNjgBoOHd3VG6DnGDa+/es5PZozILTr5yue9bupI/LTCBGeZTC8JHGV7c8FHqdaINeS10qWDgM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(40470700004)(46966006)(6666004)(110136005)(82310400005)(26005)(1076003)(7696005)(41300700001)(2616005)(316002)(2906002)(36860700001)(8936002)(47076005)(81166007)(36756003)(16526019)(356005)(40480700001)(426003)(478600001)(86362001)(5660300002)(336012)(83380400001)(82740400003)(186003)(40460700003)(8676002)(4326008)(70206006)(70586007)(30864003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:19.8196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e29678-6340-47c4-ad43-08da643309f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2860
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add dynamic descriptor operations as part of amd_mp2_ops structure to
support all AMD SOCs and use wherever applicable.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 33 +++++++++++--------
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  7 +++-
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  2 --
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
 .../hid_descriptor/amd_sfh_hid_desc.c         | 17 +++++++---
 .../hid_descriptor/amd_sfh_hid_desc.h         |  3 --
 7 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index e3b3db514c91..e9ccdad66d12 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -70,6 +70,8 @@ static void amd_sfh_work(struct work_struct *work)
 	struct amd_input_data *in_data = cli_data->in_data;
 	struct request_list *req_node;
 	u8 current_index, sensor_index;
+	struct amd_mp2_ops *mp2_ops;
+	struct amd_mp2_dev *mp2;
 	u8 report_id, node_type;
 	u8 report_size = 0;
 
@@ -81,9 +83,11 @@ static void amd_sfh_work(struct work_struct *work)
 	node_type = req_node->report_type;
 	kfree(req_node);
 
+	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
+	mp2_ops = mp2->mp2_ops;
 	if (node_type == HID_FEATURE_REPORT) {
-		report_size = get_feature_report(sensor_index, report_id,
-						 cli_data->feature_report[current_index]);
+		report_size = mp2_ops->get_feat_rep(sensor_index, report_id,
+						    cli_data->feature_report[current_index]);
 		if (report_size)
 			hid_input_report(cli_data->hid_sensor_hubs[current_index],
 					 cli_data->report_type[current_index],
@@ -92,7 +96,7 @@ static void amd_sfh_work(struct work_struct *work)
 			pr_err("AMDSFH: Invalid report size\n");
 
 	} else if (node_type == HID_INPUT_REPORT) {
-		report_size = get_input_report(current_index, sensor_index, report_id, in_data);
+		report_size = mp2_ops->get_in_rep(current_index, sensor_index, report_id, in_data);
 		if (report_size)
 			hid_input_report(cli_data->hid_sensor_hubs[current_index],
 					 cli_data->report_type[current_index],
@@ -109,13 +113,15 @@ static void amd_sfh_work_buffer(struct work_struct *work)
 {
 	struct amdtp_cl_data *cli_data = container_of(work, struct amdtp_cl_data, work_buffer.work);
 	struct amd_input_data *in_data = cli_data->in_data;
+	struct amd_mp2_dev *mp2;
 	u8 report_size;
 	int i;
 
 	for (i = 0; i < cli_data->num_hid_devices; i++) {
 		if (cli_data->sensor_sts[i] == SENSOR_ENABLED) {
-			report_size = get_input_report
-				(i, cli_data->sensor_idx[i], cli_data->report_id[i], in_data);
+			mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
+			report_size = mp2->mp2_ops->get_in_rep(i, cli_data->sensor_idx[i],
+							       cli_data->report_id[i], in_data);
 			hid_input_report(cli_data->hid_sensor_hubs[i], HID_INPUT_REPORT,
 					 in_data->input_report[i], report_size, 0);
 		}
@@ -153,6 +159,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
 	struct amd_input_data *in_data = &privdata->in_data;
 	struct amdtp_cl_data *cl_data = privdata->cl_data;
+	struct amd_mp2_ops *mp2_ops = privdata->mp2_ops;
 	struct amd_mp2_sensor_info info;
 	struct request_list *req_list;
 	struct device *dev;
@@ -163,6 +170,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 
 	req_list = &cl_data->req_list;
 	dev = &privdata->pdev->dev;
+	amd_sfh_set_desc_ops(mp2_ops);
 
 	cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
 
@@ -179,17 +187,17 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
 		cl_idx = cl_data->sensor_idx[i];
-		cl_data->report_descr_sz[i] = get_descr_sz(cl_idx, descr_size);
+		cl_data->report_descr_sz[i] = mp2_ops->get_desc_sz(cl_idx, descr_size);
 		if (!cl_data->report_descr_sz[i]) {
 			rc = -EINVAL;
 			goto cleanup;
 		}
-		feature_report_size = get_descr_sz(cl_idx, feature_size);
+		feature_report_size = mp2_ops->get_desc_sz(cl_idx, feature_size);
 		if (!feature_report_size) {
 			rc = -EINVAL;
 			goto cleanup;
 		}
-		input_report_size =  get_descr_sz(cl_idx, input_size);
+		input_report_size =  mp2_ops->get_desc_sz(cl_idx, input_size);
 		if (!input_report_size) {
 			rc = -EINVAL;
 			goto cleanup;
@@ -214,17 +222,17 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = -ENOMEM;
 			goto cleanup;
 		}
-		rc = get_report_descriptor(cl_idx, cl_data->report_descr[i]);
+		rc = mp2_ops->get_rep_desc(cl_idx, cl_data->report_descr[i]);
 		if (rc)
 			return rc;
-		privdata->mp2_ops->start(privdata, info);
+		mp2_ops->start(privdata, info);
 		status = amd_sfh_wait_for_response
 				(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
 		if (status == SENSOR_ENABLED) {
 			cl_data->sensor_sts[i] = SENSOR_ENABLED;
 			rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
 			if (rc) {
-				privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+				mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
 				status = amd_sfh_wait_for_response
 					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
 				if (status != SENSOR_ENABLED)
@@ -240,8 +248,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
 			cl_data->sensor_sts[i]);
 	}
-	if (privdata->mp2_ops->discovery_status &&
-	    privdata->mp2_ops->discovery_status(privdata) == 0) {
+	if (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0) {
 		amd_sfh_hid_client_deinit(privdata);
 		for (i = 0; i < cl_data->num_hid_devices; i++) {
 			devm_kfree(dev, cl_data->feature_report[i]);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 40da53d5efd0..d2a72ab64ebf 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -40,7 +40,7 @@ struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
 	void __iomem *mmio;
-	const struct amd_mp2_ops *mp2_ops;
+	struct amd_mp2_ops *mp2_ops;
 	struct amd_input_data in_data;
 	/* mp2 active control status */
 	u32 mp2_acs;
@@ -54,6 +54,11 @@ struct amd_mp2_ops {
 	void (*clear_intr)(struct amd_mp2_dev *privdata);
 	int (*init_intr)(struct amd_mp2_dev *privdata);
 	int (*discovery_status)(struct amd_mp2_dev *privdata);
+	int (*get_rep_desc)(int sensor_idx, u8 rep_desc[]);
+	u32 (*get_desc_sz)(int sensor_idx, int descriptor_name);
+	u8 (*get_feat_rep)(int sensor_idx, int report_id, u8 *feature_report);
+	u8 (*get_in_rep)(u8 current_index, int sensor_idx, int report_id,
+			 struct amd_input_data *in_data);
 };
 
 #endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index ecdd2f48cfb8..3754fb423e3a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -79,6 +79,4 @@ void amdtp_hid_remove(struct amdtp_cl_data *cli_data);
 int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type);
 void amd_sfh_set_report(struct hid_device *hid, int report_id, int report_type);
 void amdtp_hid_wakeup(struct hid_device *hid);
-u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
-		    struct amd_input_data *in_data);
 #endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index dadc491bbf6b..f169b4413abb 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -244,7 +244,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	amd_sfh_clear_intr(mp2);
 }
 
-static const struct amd_mp2_ops amd_sfh_ops_v2 = {
+static struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.start = amd_start_sensor_v2,
 	.stop = amd_stop_sensor_v2,
 	.stop_all = amd_stop_all_sensor_v2,
@@ -254,7 +254,7 @@ static const struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.discovery_status = amd_sfh_dis_sts_v2,
 };
 
-static const struct amd_mp2_ops amd_sfh_ops = {
+static struct amd_mp2_ops amd_sfh_ops = {
 	.start = amd_start_sensor,
 	.stop = amd_stop_sensor,
 	.stop_all = amd_stop_all_sensors,
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 2feac14f5d3c..71c114acdd2b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -108,5 +108,6 @@ u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
 void amd_mp2_suspend(struct amd_mp2_dev *mp2);
 void amd_mp2_resume(struct amd_mp2_dev *mp2);
 const char *get_sensor_name(int idx);
+void amd_sfh_set_desc_ops(struct amd_mp2_ops *mp2_ops);
 
 #endif
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index 76095bd53c65..f9a8c02d5a7b 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -29,7 +29,7 @@
 #define HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM                      0x04
 #define ILLUMINANCE_MASK					GENMASK(14, 0)
 
-int get_report_descriptor(int sensor_idx, u8 *rep_desc)
+static int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 {
 	switch (sensor_idx) {
 	case accel_idx: /* accel */
@@ -63,7 +63,7 @@ int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 	return 0;
 }
 
-u32 get_descr_sz(int sensor_idx, int descriptor_name)
+static u32 get_descr_sz(int sensor_idx, int descriptor_name)
 {
 	switch (sensor_idx) {
 	case accel_idx:
@@ -133,7 +133,7 @@ static void get_common_features(struct common_feature_property *common, int repo
 	common->report_interval =  HID_DEFAULT_REPORT_INTERVAL;
 }
 
-u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
+static u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 {
 	struct accel3_feature_report acc_feature;
 	struct gyro_feature_report gyro_feature;
@@ -200,7 +200,8 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-u8 get_input_report(u8 current_index, int sensor_idx, int report_id, struct amd_input_data *in_data)
+static u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
+			   struct amd_input_data *in_data)
 {
 	struct amd_mp2_dev *privdata = container_of(in_data, struct amd_mp2_dev, in_data);
 	u32 *sensor_virt_addr = in_data->sensor_virt_addr[current_index];
@@ -267,3 +268,11 @@ u8 get_input_report(u8 current_index, int sensor_idx, int report_id, struct amd_
 	}
 	return report_size;
 }
+
+void amd_sfh_set_desc_ops(struct amd_mp2_ops *mp2_ops)
+{
+	mp2_ops->get_rep_desc = get_report_descriptor;
+	mp2_ops->get_feat_rep = get_feature_report;
+	mp2_ops->get_in_rep = get_input_report;
+	mp2_ops->get_desc_sz = get_descr_sz;
+}
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index 70b1b7abe2c6..ebd55675eb62 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -111,7 +111,4 @@ struct hpd_input_report {
 	u8 human_presence;
 } __packed;
 
-int get_report_descriptor(int sensor_idx, u8 rep_desc[]);
-u32 get_descr_sz(int sensor_idx, int descriptor_name);
-u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report);
 #endif
-- 
2.25.1

