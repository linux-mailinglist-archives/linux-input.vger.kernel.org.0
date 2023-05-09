Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3916FBFCC
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 09:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbjEIHAE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 03:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235148AbjEIG7p (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 02:59:45 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4075590
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 23:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4QPp3pNuBSb5zqHuOqnsKoBe82j+xAps5tafj526okXTLTBptuuZZ/CxJg5SdXjnjoFPJT2Tom5dI3THgobqh12A2kIxL6WZzhEFuzj+IF046aEZO4ZTfrrPCQ8Lsyl5jEarc4B5ht82kidAgU3tP1Js5lvRsgPDCalD18hl2lWE4i8rf3FPA84C2qOlUj8nfpzmG8mUYL58a0HjF9MaP3uOCo8f/PYZwrLmxz0jJSOV+PFUAokerWSxHW/HWyv9KLC85miZLdPG9MTNq+cF7L8f0MXWbJktCZhC50Nwg1JwpIJHMZ2WQFdx9NXYnLxh5QMuAyf/ZuV7bi8V4ne+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se7ewAzSsrDpeQrBQGWeA9BKLjeLmieHFZMOT7P2LMQ=;
 b=jM9KzWWF11TzAhUCDmYgp75ssG1cNWsAG/XqyPCVtibJMO57iXmWbSeKcGBLNG88/jkNi0d1uVpDj0MxUOpIvYtYYSKIk0JbD9+EDdFTmBoGf5LvaTIk56ulqk4fM/CUrROWeKOHJfGVpOq1vj2nqIwWjgwumj5NcOPOtT/lCW3B6GR2AVhlqOYmbGmCT88o+EutI8k5ty5WVD0JyOCdQbUxb1WdyvrSuIxg3h/4P9GLJttQK228oCQnYoVYegrd3SOKctUT/V2M6/LzfiUqVzGUkYRh4nqZaaM3dyqCIQg7SC8jwYYbTqxtBMK9Buh3oFzbCcz27XDDmFOzbCG7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se7ewAzSsrDpeQrBQGWeA9BKLjeLmieHFZMOT7P2LMQ=;
 b=v6jz2UWlNu6HVQecD7uI+Y15UvwXpTsPT8YLxsZc+ruOvPm9M8EOwn44FokRkUc54JqHmxAkW1GNnFP7v3Cc/7TSwS7apf6AKex50bBQTNm7sgpcVLbNYtQ4HAvq0/mT1U146dYYsYAMiL90Ctvjz7/ErA3qplHPLpPIEizgmFo=
Received: from MW4PR03CA0104.namprd03.prod.outlook.com (2603:10b6:303:b7::19)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 06:59:40 +0000
Received: from CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::64) by MW4PR03CA0104.outlook.office365.com
 (2603:10b6:303:b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32 via Frontend
 Transport; Tue, 9 May 2023 06:59:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT116.mail.protection.outlook.com (10.13.174.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 06:59:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 01:59:33 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/5] HID: amd_sfh: Split sensor and HID initialization
Date:   Tue, 9 May 2023 12:28:55 +0530
Message-ID: <20230509065857.4170013-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
References: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT116:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acca31d-ca11-4cf5-d963-08db505af585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/3Fnukszrj7HjQaZCx5QFgLD6snAj/GmHI3GfUrP6rQUINxxOAXAnVSIWLLGo3spwUzWgcMg3BQfJSLMbl2LsPJEHlG0MpohlNyRdxDFx92e3SdY1ZRD5ot0hlPGJosDMW5as1njRmR/+FDUsGHYzJYHZpKoaWNDPGO0vm1Cb1SoLKVIbK+ou1mjrTMF3H11iYVf8sBM5MDdlE6CMgnMQzB7F4mB1dFPywLlIFVMB3k56ZF/5+HDWdRs6qeKGjFr2zbZs8LBf0ZBZIabCfxNM9xC343OrY3fwFqp/umOnTS0ARhVdsKw/BZKQfqPY+1Si8vfVJzoE2C9d1X0lIVweGo8Q8Yh+d9O/r4wPlrh8xGzzz2VXe/Yt8qQFl+8ayNPJztNKEtafyCRVfP0Zh2ZWXFG6lTs2fpUwInnXX+eN3wCzMJUuGNCD6RssL48OowRvTUURw171gZVLDD98ptJfuPM7ymSoS/Rk9KIHhzI416sIe/h7QUvVNA3+UP0pzd7tUokVLNDW1wXxqXA6sVFCjbVXr92sxN4wekxGn+9uPTxcyVjxh4Yn3bv2O9rrbMX+wHFLzEyy5bNo8Qmuttbg5ziZiLaf2O4xwWsNg80QnmggFE2QLJYeI9Jb/JRFrwHL6+M9UQTsTZD9eaBY6EXacCEfJxUnsu5n+LnUpzNMrZejlbgLtaZk1/T01S33lkbZHgKl5mIyODt7eE3T1zmuZTrKx3xA8BqG2hNQbTK40=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(41300700001)(316002)(478600001)(110136005)(6666004)(70586007)(70206006)(5660300002)(8936002)(4326008)(8676002)(7696005)(40480700001)(1076003)(26005)(336012)(356005)(82740400003)(40460700003)(186003)(16526019)(36860700001)(426003)(83380400001)(2616005)(47076005)(86362001)(82310400005)(36756003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:59:39.8119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acca31d-ca11-4cf5-d963-08db505af585
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sensors are enabled independently of HID device initialization. Sensor
initialization should be kept separate in this case, while HID devices
should be initialized according to the sensor state. Hence split sensor
initialization and HID initialization into separate blocks.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3d62527f87d3..bdb578e0899f 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -215,7 +215,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	struct device *dev;
 	u32 feature_report_size;
 	u32 input_report_size;
-	int rc, i, status;
+	int rc, i;
 	u8 cl_idx;
 
 	req_list = &cl_data->req_list;
@@ -286,12 +286,15 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		if (rc)
 			goto cleanup;
 		mp2_ops->start(privdata, info);
-		status = amd_sfh_wait_for_response
-				(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
-		if (status == SENSOR_ENABLED) {
+		cl_data->sensor_sts[i] = amd_sfh_wait_for_response
+						(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
+	}
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		cl_data->cur_hid_dev = i;
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			cl_data->is_any_sensor_enabled = true;
-			cl_data->sensor_sts[i] = SENSOR_ENABLED;
-			rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
+			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
 		} else {
@@ -301,6 +304,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
 			cl_data->sensor_sts[i]);
 	}
+
 	if (!cl_data->is_any_sensor_enabled ||
 	   (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
 		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n", cl_data->is_any_sensor_enabled);
-- 
2.25.1

