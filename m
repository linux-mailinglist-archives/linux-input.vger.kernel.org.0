Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDCF6DE0C6
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbjDKQOi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjDKQOS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:18 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4E983D5
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnOOPlBnijmaRX4dB8jwB0JaiwIsDBIUiqpeHrkaijVZKM4+yOFZGk4QWOApPAW3Hv3HFYZ8bGPmhTfrF+UhaQTHlX0IUDIQxEerH+pNqaduk1v1JECWLuFGfjv5HjyEQyWDwq8XQjKuitMqxqqP73PNsaizK0xe5xouckhWH/EF6f5pLOSYBMvZ8iQWsI8IHZNc9fR55qZ6APqjrQzRCW6q1+TNKmJ8erE5kxuLTNBMZ5FeH/oL4KKkeXIRMMsKItzpMGQ3hEHdTHuUAr6vnOoftFhJFyiRQw+QDIMDZApmGMC00UWBr42BZXZ18S0CGY3wLPhuVl20cDTHGrLqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXb9oo1wk5j10gj0Pfl1rAlJ1gQvZjEP2dCWcQ4s2LI=;
 b=iY+fFIyAN97shCg2L66Wdf0S9uaOv8FANsa65oTBhNLwRPjAlhEpd0i+dGL3+E30+MEbpyB7m1+kuThgFQSMex3oS2MsxnHXG1nZRO+ebKHx4CqB9mKXjgJ67x0+mnzDV2Mh86Fi7hYeT2ZTMiQc8XujIVOgIv39qfdErVcpL5ZMBozoEoTupyNa6LLvNWAxxjmI+Xy1o+6BoXg4hlRnBRSoadFeTUgjupS5YIb6Jzm/B6J9J/NMSRwlNsMe8QWJS2QnxOKnbtARGec6svk2UW5juSVcmoyFpkNl7SXj3hK2nQbN11wAnzB/0XdEQEK/aiB9+hcBdhcUDJEIMJb0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXb9oo1wk5j10gj0Pfl1rAlJ1gQvZjEP2dCWcQ4s2LI=;
 b=UlgHHGtIeSpp2ANGAwwrqsKapAin8WFCTMmqKejWGZpM7mFvFqq3buNPnRjrQIxM2AvJpDqtc2jrDhtoYP3XPm0wVhXvH1hoksNIGNpJEn5it48mvbJ1skNnJmo6OLNoDZC6LImLTY6DTDiEFNJDhbEiJsRjJMsfzKYGMWH+RGk=
Received: from DM6PR04CA0013.namprd04.prod.outlook.com (2603:10b6:5:334::18)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Tue, 11 Apr
 2023 16:11:32 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::d1) by DM6PR04CA0013.outlook.office365.com
 (2603:10b6:5:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 16:11:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:29 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 7/7] HID: amd_sfh: Handle "no sensors" enabled for SFH1.1
Date:   Tue, 11 Apr 2023 21:40:30 +0530
Message-ID: <20230411161030.909350-8-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
References: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|CO6PR12MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd6f484-f985-4887-967d-08db3aa76a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r8tpSbB4Smmlf3gjYlZkTzyhOdyiH6YlmmWiv3fDNT1jN59kIPeOreVCnM68ATX+vLNIknJfU49IN67hj7WbTs1Vv2l9Svvi6RUBXJJy8P/H3B3/Cp4jF9BPvlYAzZnj8uqe169CgQb/VIgHNE/kuMKvfAa3XDoSBNGDy0csYlMpcEnWPxZTAn9DNeo4viOu5soVAGGSqc6mNUESw+KibUFJOMHA2XN4BSvUuCkzrYEcsLdaFEcoQvYnHfhnlR/h7xOplm97KY/qQGFhlCQ42tTO9ZwL4nx+f9e2nvl3reRcanAL4+Rp0jfveuxeLHo8sOV5XY7veFqRcm7c5JEt9PgC5Z6xoGhV4uraoHEhHWcI/fyVB1Z7e5pcXHZC3QeKFJGOkKH4QglIvwP9iOMGBvrVt5C2BGoFIyB9oJ5fRrHjY6efYk+0rdLQCAGQIy+LQ+LQpW4qqpzlRTnQ7SZrZW+HbjkoqHtWEqnAp24gj9pGDXZgRkDJdeTZnxt5LO0qgag0tjm2hZ9vFlcXke1mYnqJB5FGCRbmNOAh6V5YJPA5dF0RD5SAP4qZaLX8n0COGhfvtzwrqwVjUKVdhxVOhr9S6tLEE4j1OGGOAYoHMPcl2idCWXXPeFJB/vgxZkS/rca64mvO/6G/EaCKePKgftW8ywdKy0Rsika1BRDIEy8/DdrX1zYbld7+uv8VpM2MA/zXzN4I/vJM1AHMyDPmUuE4Uq+mwiMppEZu+lz+aew=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(316002)(40480700001)(81166007)(6666004)(36756003)(41300700001)(82310400005)(8936002)(47076005)(40460700003)(110136005)(7696005)(83380400001)(86362001)(36860700001)(2616005)(16526019)(186003)(336012)(426003)(26005)(82740400003)(356005)(5660300002)(1076003)(70206006)(70586007)(478600001)(4326008)(8676002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:31.8515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd6f484-f985-4887-967d-08db3aa76a3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Based on num_hid_devices, each sensor device is initialized. If
"no sensors" is initialized, amd_sfh work initialization and scheduling
doesn’t make sense and returns EOPNOTSUPP to stop driver probe. Hence,
add a check for "no sensors" enabled to handle the special case.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index a1d6e08fab7d..bb8bd7892b67 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -112,6 +112,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	cl_data->num_hid_devices = amd_sfh_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
 	if (cl_data->num_hid_devices == 0)
 		return -ENODEV;
+	cl_data->is_any_sensor_enabled = false;
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
 	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
@@ -170,6 +171,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 		status = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
 
 		if (status == SENSOR_ENABLED) {
+			cl_data->is_any_sensor_enabled = true;
 			cl_data->sensor_sts[i] = SENSOR_ENABLED;
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc) {
@@ -186,12 +188,21 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 					cl_data->sensor_sts[i]);
 				goto cleanup;
 			}
+		} else {
+			cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
 			cl_data->sensor_sts[i]);
 	}
 
+	if (!cl_data->is_any_sensor_enabled) {
+		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
+			 cl_data->is_any_sensor_enabled);
+		rc = -EOPNOTSUPP;
+		goto cleanup;
+	}
+
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
 
-- 
2.25.1

