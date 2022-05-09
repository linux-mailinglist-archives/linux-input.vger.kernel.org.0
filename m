Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B0851FE0E
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbiEINZN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbiEINZI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:08 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A18827FDB
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzYpOf0LyCUVGLgJVbrP/cQ1PTlgB3I0nSpD49Xt1i5YqhcUmV/ZkOjEKg0iv+dGBJKs4t4c284bdT6SrICAr4Lyi/0JCepPyzdF6llx4enLufHEmVSgFz2qvkZdJgMn1u71J1fdd0P94L06CvJ7+vX9S7pZxLhMiK8bvCwxLxiiOE/OtywB0+fYD7mr0OI22f9XMshuIalux7o4WCiFQFevHRv7oYPp1RGCG8aXgK+A1bk3kEwsU/d32MChdxHZO1PaKFqD4DPzJfFD/5VrcA4K6OaNZUWP3sNcrXrE/EwSrA/6OxtEkGKoBR5pJuwHFJ2bnmCrioU1YEtK29MDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksmKEJUzTAFJ7VdSfZ9HU7s2dJFlv1OCdmfrRovvyK4=;
 b=ZazUMB2dfdIOoE0Twn/OywVWMmcZkM+AGXVyrECY4FO+53AApHMNIFNcFlcbtzFHJ2rEb7DhtTj9I5Eh7LVcDGc3vazBaiFP4oJ5Fb1GLqIigp1tgtCzTxqv9timAGQDcNzdDSKzE5bOFSxgLKAubKBdyk2I4LdBBC02e/3pJ6Qkt/+cajix57QhY/Uu8mev/lyER5BXYyX0ZY02N0Ae6vPQLbQoLJkoTCgCJmOYljwd2NqMy8muFEibfHx/L5cGu2PBODo2t+jDRZ3m37ghF1eesEesXa9HVqYHRHT6erVelXgI/YCLx4tVVbx83JyYifFnQbWFm8nBWnhato9ufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksmKEJUzTAFJ7VdSfZ9HU7s2dJFlv1OCdmfrRovvyK4=;
 b=QOqrNlCUoCH+Z4KSS5LdRbvPLQJLU+Mts0QA4qJwYJbvtTQCUcaUIZKGrwA32KuXYC8ZiAlHf1+WFBjGDqPp7tut+nltHzR6R8TZWnQ4dNbW70b/x67k6tOHzjJ8QS89DEAVFn/gtEOOr6Lkt9Noc7i/ADpBJcaZsEg3FqMJZsM=
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by DM6PR12MB3401.namprd12.prod.outlook.com (2603:10b6:5:39::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 13:21:05 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::aa) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Mon, 9 May 2022 13:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:02 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/7] HID: amd_sfh: Add sensor name by index for debug info
Date:   Mon, 9 May 2022 18:50:21 +0530
Message-ID: <20220509132026.3204678-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
References: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a385403-7538-4495-0e9a-08da31bec5a0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3401:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3401212BCACC27086678671CE6C69@DM6PR12MB3401.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cc2AVj+ebTbDgcREx9Ly7W9/y/LWKNsaoqbRbxH6b4pVhocX7gFfkjfOxDrXFeYbw9KnWJKR2ldSPK+yub2Kg95FV492o8N2j92nnZzTBqo5+j/RvsjfO8TmfRjbVGaRShVaGByoH3C/t2rBkW3Z14mpeX419pSHyo1pOQdxzwNns4Dj4pPtjDtC1BInetAlBorSPX+sOqoAL4jG//q2nRckrDHRJUzFAS17uhdyuznK++3JIynQHbMD9/6nyz1w81Is042kkorwFsQzwlKRcEgJxlxn2/yJNZtptWFjRVtn4fef+TjMJTzHqm5Zgv640AycT0Cl0benDJotsHrDZJ7reo+Gh4mszwxUbOfeMXaLNXnPDh62xPLMSZMVcwxx8/V4+7gdLi2WwNy/oE+N1t/UUOYn8YBVfaO0fyL9V3wxCemw96ud0jlSG+rsnlqaeKZhkZv3k5ovAwrreq0t4iE90tc6RnwmoKjDqfj/CpJjrn+23m5MdVgAjRgBSDINJss/Ch9toPkpGBCPxnRVgrSTsZDQVY7UsOd8HYGjizFagTe7rYyzr3+021KvvYQiLs4gRrJAa7uy21mFP+uyFRHd6KFMHQPfa4orBeOuXIyd6XaIqscwM4kgjViDgdsYO6kVH6qjAuDxlUgMHmfx0SN+qLVK0jUWY9Mb/oJqQIDxmiMrZuzCHSaoixgZmZKMK00To0ElpxzR/Zi1Rvq06Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(47076005)(6666004)(40460700003)(70586007)(26005)(86362001)(426003)(186003)(508600001)(16526019)(336012)(5660300002)(2906002)(8936002)(83380400001)(81166007)(82310400005)(2616005)(36756003)(54906003)(110136005)(356005)(316002)(4326008)(8676002)(36860700001)(70206006)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:05.3619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a385403-7538-4495-0e9a-08da31bec5a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3401
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding get sensor name for debug info. This will make debug
messages clearer.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 34 +++++++++++++++++++-----
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 10 ++++---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 444acd9e2cd6..0f770a2b47ff 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -141,6 +141,24 @@ u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
 	return sensor_sts;
 }
 
+const char *get_sensor_name(int idx)
+{
+	switch (idx) {
+	case accel_idx:
+		return "accelerometer";
+	case gyro_idx:
+		return "gyroscope";
+	case mag_idx:
+		return "magnetometer";
+	case als_idx:
+		return "ALS";
+	case HPD_IDX:
+		return "HPD";
+	default:
+		return "unknown sensor type";
+	}
+}
+
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
 	struct amd_input_data *in_data = &privdata->in_data;
@@ -219,13 +237,16 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
 				if (status != SENSOR_ENABLED)
 					cl_data->sensor_sts[i] = SENSOR_DISABLED;
-				dev_dbg(dev, "sid 0x%x status 0x%x\n",
-					cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
+				dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
+					cl_data->sensor_idx[i],
+					get_sensor_name(cl_data->sensor_idx[i]),
+					cl_data->sensor_sts[i]);
 				goto cleanup;
 			}
 		}
-		dev_dbg(dev, "sid 0x%x status 0x%x\n",
-			cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
+		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
+			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+			cl_data->sensor_sts[i]);
 	}
 	if (privdata->mp2_ops->discovery_status &&
 	    privdata->mp2_ops->discovery_status(privdata) == 0) {
@@ -268,8 +289,9 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
 			if (status != SENSOR_ENABLED)
 				cl_data->sensor_sts[i] = SENSOR_DISABLED;
-			dev_dbg(&privdata->pdev->dev, "stopping sid 0x%x status 0x%x\n",
-				cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
+			dev_dbg(&privdata->pdev->dev, "stopping sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
 		}
 	}
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index e18a4efd8839..dadc491bbf6b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -353,8 +353,9 @@ static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 					(mp2, cl_data->sensor_idx[i], SENSOR_ENABLED);
 			if (status == SENSOR_ENABLED)
 				cl_data->sensor_sts[i] = SENSOR_ENABLED;
-			dev_dbg(dev, "resume sid 0x%x status 0x%x\n",
-				cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
+			dev_dbg(dev, "suspend sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
 		}
 	}
 
@@ -378,8 +379,9 @@ static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 					(mp2, cl_data->sensor_idx[i], SENSOR_DISABLED);
 			if (status != SENSOR_ENABLED)
 				cl_data->sensor_sts[i] = SENSOR_DISABLED;
-			dev_dbg(dev, "suspend sid 0x%x status 0x%x\n",
-				cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
+			dev_dbg(dev, "suspend sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
 		}
 	}
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 9aa88a91ac8d..8c760526132a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -138,6 +138,7 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata);
 u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
 void amd_mp2_suspend(struct amd_mp2_dev *mp2);
 void amd_mp2_resume(struct amd_mp2_dev *mp2);
+const char *get_sensor_name(int idx);
 
 struct amd_mp2_ops {
 	 void (*start)(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
-- 
2.25.1

