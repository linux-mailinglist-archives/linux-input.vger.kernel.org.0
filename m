Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C2E6FBFCA
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 09:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjEIHAB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 03:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbjEIG7m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 02:59:42 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1BE46BD
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 23:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRIS+eVlCCt3O/eIzDyjpOyabps/AHQe/DVbwkKUS/7Y9puwgw7b0MvbRvrsTXOMZbRmtjYjjM5NWDEUMqHyvVZyIAz6Pz5ju6RTpMINWPTNO4w1C1ldDuegkKNXmqlARxEqGbyhAQv2cale+fzbnoQrsNcqv5vPZVvf182L9psPmU3Li0tSgZjZftbng7En8ZcVL8krPe3QRSLwoVSDeV9jKQqhh5cUOUZd4Ad1VDKUFL/G3Byu2sfF0OiRqg6G+J9en86Szs9AM+07tYzHtdT+4kXtXhc1qOnhWC1cn7peqSan3/LgW+p7hHhwnad+6CmI/jWLDINAgBHWPWFOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Lmi5JARoAQL7a/JrrgY/E0dWjzJqtY06aEmPlI7ejg=;
 b=AkBQHI9iif5/ZSYb1E1g68lVzdFMjV6ySz2mtOO2Oib56+IRQGIX1iRJaPEOO6/WTqvyt1beMfZCYdB8NcpeGB4jhqqlJ10vR71LxdU8TwZPKzPIA4IEKhcwJcimgF51kQ0sMb6gtfO9qoRYdET5LRSV7/TBPgskojubaDH8E7I/ZZTYtAxOoyfD+izDrxY1PY6/RxbC7vl9c7FYhtMqRkvt59+DV6onkVuR4bRKP8GWN23pamSDIJxBEv0J0cNKWsmq994QKSQAQ3BxcUJjm8Pl1Sxf8iNoE8PPQOpCdTM5JKLnZ5bgqQO2NQ4D3X59N6NsWK1umHI5NPh2CVYtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Lmi5JARoAQL7a/JrrgY/E0dWjzJqtY06aEmPlI7ejg=;
 b=ToptLyImEF9L33hPuEl3FCBXYte53zcOU0i+U+zCRviPfp7htSfs7oVEEYGRGJ6QPERkaCXVTB7WTHncsFE7agDfdAYn07W0aEllXOAJYNsZjJzijtZx1MapvJvTZGaqjMbjWkM9mub2kd2JftTQa/k75tap1N1g+UIfM1JIwNg=
Received: from MW4PR03CA0116.namprd03.prod.outlook.com (2603:10b6:303:b7::31)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 06:59:36 +0000
Received: from CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::51) by MW4PR03CA0116.outlook.office365.com
 (2603:10b6:303:b7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 06:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT116.mail.protection.outlook.com (10.13.174.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 06:59:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 01:59:32 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/5] HID: amd_sfh: Remove duplicate cleanup
Date:   Tue, 9 May 2023 12:28:54 +0530
Message-ID: <20230509065857.4170013-3-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT116:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dcff17-6aaf-4476-e614-08db505af382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfT34Pi2GSkYlpusEeGmeZ9rnLz7cOy2CEo7bkWRNt7eHTiudQR4/5fh/sQQpGeg/GsGtPoBhOVnmX0hHw1vrR8ZxGCge8x8ft1D5CubUwMnK9z1Dfoo+IcKAkH+Z3y9o99DUrwAMFdkFpH3AzJ5DgNAo1ISOXjrmZCiPjZODUBd+YQyq//Om9VuPYWQbySnZK0vrO7IP8ePB4m/bOxvNEBMb6Tig1eYjvR//5tQAVpAhbvTyJMLaHVY1ar1219Xw2i2pL/AgVUGyy3zx9ZZzQquDfHhtNlJ3nJDYM4JR+aj6GH59Q3/dt6Z0wqNRzvUWjvn1viVOHiHxecnBKSiK08VhhQa9gLaHTky46hiZQ6OojHA+nh9/Zjdkd2ydMhFz4FX+y732w0lnOVict5xV2TRDfU/jL/OKXJTSYhBYNlV1hTaZnriJmvE3pJa08UGiPcZMmoDu0fIaPRhqUKfw/h+Ik8E6w7q0d9P9urHSzVcv3Tu3edjqHm1GH9SW6VvSOK6Dt+QVvgH/CTSOluMICOWNOyyWLyWOlKKxRqTG5onHRxDtSAPQ7T5FBoNcpXnJ24Bi73NSY4nRwuNcN3V0HmSN9x4zNZWM/TOTWoC6E8dmv61GPj9+t3P+j1Iqz8pBRUOpKpR0cpQkGto28cXIUNvdtFEcFkTlQTXnTo6ucgP7WiUW+X4tMUbci4EzLMubWSqQDJ/4MEMDp5DNIaUT/XXzavmGum89r+HTUWehVE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(4326008)(70206006)(316002)(478600001)(70586007)(7696005)(110136005)(86362001)(36756003)(426003)(83380400001)(336012)(47076005)(36860700001)(26005)(1076003)(2616005)(6666004)(2906002)(5660300002)(41300700001)(8936002)(8676002)(82310400005)(40480700001)(81166007)(82740400003)(16526019)(186003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:59:36.4371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dcff17-6aaf-4476-e614-08db505af382
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A number of duplicate cleanups are performed that are not necessary. As a
result, remove duplicate cleanups and use common cleanup.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 27 ++++--------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 7e4a3b6c0ac7..3d62527f87d3 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -292,18 +292,8 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			cl_data->is_any_sensor_enabled = true;
 			cl_data->sensor_sts[i] = SENSOR_ENABLED;
 			rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
-			if (rc) {
-				mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
-				status = amd_sfh_wait_for_response
-					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
-				if (status != SENSOR_ENABLED)
-					cl_data->sensor_sts[i] = SENSOR_DISABLED;
-				dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
-					cl_data->sensor_idx[i],
-					get_sensor_name(cl_data->sensor_idx[i]),
-					cl_data->sensor_sts[i]);
+			if (rc)
 				goto cleanup;
-			}
 		} else {
 			cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		}
@@ -313,25 +303,16 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	}
 	if (!cl_data->is_any_sensor_enabled ||
 	   (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
-		amd_sfh_hid_client_deinit(privdata);
-		for (i = 0; i < cl_data->num_hid_devices; i++) {
-			devm_kfree(dev, cl_data->feature_report[i]);
-			devm_kfree(dev, in_data->input_report[i]);
-			devm_kfree(dev, cl_data->report_descr[i]);
-		}
 		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n", cl_data->is_any_sensor_enabled);
-		return -EOPNOTSUPP;
+		rc = -EOPNOTSUPP;
+		goto cleanup;
 	}
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
 
 cleanup:
+	amd_sfh_hid_client_deinit(privdata);
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (in_data->sensor_virt_addr[i]) {
-			dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
-					  in_data->sensor_virt_addr[i],
-					  cl_data->sensor_dma_addr[i]);
-		}
 		devm_kfree(dev, cl_data->feature_report[i]);
 		devm_kfree(dev, in_data->input_report[i]);
 		devm_kfree(dev, cl_data->report_descr[i]);
-- 
2.25.1

