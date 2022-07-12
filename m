Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A01957225C
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbiGLSTW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiGLSTV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:21 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4DDA2E79
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDPt3VW1USXjwlO+A0RrMhW5/VjhXvCRKZdpuJcOmV9t08kZbMoYV57079qPEThOei9em/AaIWIzBusXKDV5ty2uC9exNqY3rC7TTkc5JQz8zdyK2dVQu5dQamdhvUhL6o+gDCPLXBCyGKiDy9XYaIhhT3zXbpbfysn3cJiYCkBNg0jpSKeGqK6Tg3DqXht5fEm82NGCNMum/hVmRrgCKcsgWRRMmZ+ZTJgdOWIZD9DU0ob5z8vLzQzXaeg7zgYZJSVpn8OOMq1G8phkN2NLIUrl5QZSCs09d9ahu/8/WNYE5FwC04Ajz0XpvebqUSyY41+jiXk1kL+2O+TM/nrNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4GFrud1kQtralifIha/Qxe0E5KaSBi1R0h9zKu5Jmg=;
 b=U0CIeIV7Lmqd0Zx5nkh61DPc8ZucxxFoH6B/OVrYIHA5IAZjpStV+uYjQnmD5jBJeGpOvjFA/psN841p0T9f97UtKyp/Vks/F2PKhXUdj+oY8wR6Vrdn/GTf3GluRkDJ8G0KrWk/P1SMYoFfgLcPAIWLoyNSgVjYd0GRgdOwB9xr2T+255IPpUbn7IexbP9Y7x8OhrbosEfDNw3Zjs08MWYgkE6+q3HrvUzw7OJSCbu+j/w7EGMhy/Gxwh0FTPCpgOgnTghRUUar+6eqGOCJ8q+C21NUVqJSMpdcFCiOmChn1BB0vFdQLhaA8F5r+RwCSmEbiO61rcP6VGqdZi38AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4GFrud1kQtralifIha/Qxe0E5KaSBi1R0h9zKu5Jmg=;
 b=te14XCYGpoV9so0+ziblKqAU2nl7bHfuVmlULfTn4no6kNDdT484dN4WkxSlQXeko3jL+n0X+4Z0mIKA58y76AAKf9NfM9jO24Z3q2FHQqXJXoTxbrGui5ykobR4hSc9sljmRTnkX33LYt+PAHoYcO0vFHWZwGjJq0qgb5I34Rw=
Received: from DM5PR08CA0028.namprd08.prod.outlook.com (2603:10b6:4:60::17) by
 MN2PR12MB3869.namprd12.prod.outlook.com (2603:10b6:208:16f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 18:19:18 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::b) by DM5PR08CA0028.outlook.office365.com
 (2603:10b6:4:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:15 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 04/11] HID: amd_sfh: Move request_list variable to client data
Date:   Tue, 12 Jul 2022 23:48:29 +0530
Message-ID: <20220712181836.3488343-5-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2bbee227-7cab-4c78-acb0-08da643308c7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3869:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kN24pBrnZkAeydq1Ma7kZDYfZ0+st+hMdaTyPe59pkNQtPhkJaDef3x21AqHulBnCPdTWvcta4CQwjRsz7D7IN18NGRfX8XDsO+D+1pFOlJ+wToTA1KXE51TzF0p6vuR4Bc7kKePRE2ybSg7znJfVNAXimje6VtMhxXAjcazbbN8zFOwjyW3lDJCW947Ai42iEFYDMT+mrZw4zA5/6nZ1rfh91mLJCzk5CD9uyisvQ5mNllce755YD6u3wt5LjH/CWk2MBnhLUIlonkwrbUMmUesMOaDpZeC4Ps2RAjcq2CiILiUhd+KLM95/gQZQ6fOffJl70u9aEcViHvWowsddzLWYCOwGXo93n8OGWHSYaXa9cZXztyYttKpispKUttgYotKlXJZlErarTdW4rxPFR0C6cmtdb0yNZKWwDuCIDYw9u1E4LL9R1YhaDzQ87DHGpql7JxjHAh09YMoXJfhfxUU8fQOOlMzhqi2E1GR/E4hh//klPSZS6MBDX8EdV/0La0MRVx9oola/zizMfgaW9H11gJEpymOAzl8FRg7yCMZphfJvPZ7jDpbN/BXLdc3Z0b13tGCiu8DRFouI1pF4l34gjTGAeJsp6pSCD3FepevCz0merIUNhhg/tlpvQfjVFWKC40vfYcmWEUZ7yrlqK5AsGUrlHxMTbFWgmXLm38VUl9Jd4JyyBUJQEnJkPbV6HTc6sMsZ9kZyVX8tCKNRYRieeuJsqsKWv1/3f93AJpJrTvnEqXk33inHjrJU4fqrnAxrtaNxvZZHNuQfotxHGtPEmEQwk+VR3iMaVPkqf8J0A2SVyhma/lKjhrE0wTqplgQcWD2OtTzuWrZ/XTp3qa+aaEntKo1rBJwU7Nz9CM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966006)(36840700001)(40470700004)(426003)(81166007)(41300700001)(82740400003)(47076005)(6666004)(2906002)(336012)(356005)(4326008)(16526019)(7696005)(2616005)(82310400005)(26005)(186003)(1076003)(70586007)(86362001)(70206006)(40460700003)(36860700001)(8676002)(8936002)(316002)(83380400001)(40480700001)(5660300002)(36756003)(478600001)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:17.8666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbee227-7cab-4c78-acb0-08da643308c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3869
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

request_list variable can be used in multiple files to support all
AMD SOCs. Hence move request_list variable to client data.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 12 +++++++-----
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h    |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index fac9e8a66120..e3b3db514c91 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -18,8 +18,6 @@
 #include "amd_sfh_pcie.h"
 #include "amd_sfh_hid.h"
 
-static struct request_list req_list;
-
 void amd_sfh_set_report(struct hid_device *hid, int report_id,
 			int report_type)
 {
@@ -40,6 +38,7 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
 {
 	struct amdtp_hid_data *hid_data = hid->driver_data;
 	struct amdtp_cl_data *cli_data = hid_data->cli_data;
+	struct request_list *req_list = &cli_data->req_list;
 	int i;
 
 	for (i = 0; i < cli_data->num_hid_devices; i++) {
@@ -56,7 +55,7 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
 			new->report_id = report_id;
 			cli_data->report_id[i] = report_id;
 			cli_data->request_done[i] = false;
-			list_add(&new->list, &req_list.list);
+			list_add(&new->list, &req_list->list);
 			break;
 		}
 	}
@@ -67,13 +66,14 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
 static void amd_sfh_work(struct work_struct *work)
 {
 	struct amdtp_cl_data *cli_data = container_of(work, struct amdtp_cl_data, work.work);
+	struct request_list *req_list = &cli_data->req_list;
 	struct amd_input_data *in_data = cli_data->in_data;
 	struct request_list *req_node;
 	u8 current_index, sensor_index;
 	u8 report_id, node_type;
 	u8 report_size = 0;
 
-	req_node = list_last_entry(&req_list.list, struct request_list, list);
+	req_node = list_last_entry(&req_list->list, struct request_list, list);
 	list_del(&req_node->list);
 	current_index = req_node->current_index;
 	sensor_index = req_node->sensor_idx;
@@ -154,19 +154,21 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	struct amd_input_data *in_data = &privdata->in_data;
 	struct amdtp_cl_data *cl_data = privdata->cl_data;
 	struct amd_mp2_sensor_info info;
+	struct request_list *req_list;
 	struct device *dev;
 	u32 feature_report_size;
 	u32 input_report_size;
 	int rc, i, status;
 	u8 cl_idx;
 
+	req_list = &cl_data->req_list;
 	dev = &privdata->pdev->dev;
 
 	cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
 	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
-	INIT_LIST_HEAD(&req_list.list);
+	INIT_LIST_HEAD(&req_list->list);
 	cl_data->in_data = in_data;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index e2e4cc5fc946..ecdd2f48cfb8 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -52,6 +52,7 @@ struct amdtp_cl_data {
 	struct amd_input_data *in_data;
 	struct delayed_work work;
 	struct delayed_work work_buffer;
+	struct request_list req_list;
 };
 
 /**
-- 
2.25.1

