Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2B76FBFC9
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 09:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbjEIHAC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 03:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbjEIG7n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 02:59:43 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E457F4C31
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 23:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwyDOox494Mm96Ndp2GZQIV2nYDnTmX/X+IRkoq9iqm3SGQO0Uu5CuUfYKkKuorzp4ktc3ybO3h60Z1IEp9j1STPWEf2CYFggF0Z11iz8tiN/sceWvkhrRQXGUKl+br5fG69UYrDcvK+wqWzMruBacge/4ko0r1iEnecrT4hd+TOzpAQtA0GFBdXuKvouDSUOZl8ywlt2zCBtNwNGhBnXJd2jtB7AsjsugTZSlLYJ5RMqqeXDyMth6uAPf6K8cfWknA7ViFn7cTXZKa6+4HCKVxFm74M52FOhej74kheX1YzS+89mXT1WIegfPQ6WZSFTB+4yfvqG3RsaOS79udMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVk/N+I4e+gPmh58OSlB1nZZobtv+1Ib22lKzChWlFU=;
 b=n6ZdwxOlVN8/N0YYLKyiSFVPJnqmsp6JTMHbfaYvbeMAEycwUB+Kj2rmvxtcUCO5F0z0RHbk1f3DKgiQKtQ0FmOb8n1Rwxe/TOjbgIGvHaYfaKryikc16TQVGBFeCTLR2lHzBiYNhAjA9PecihMqQEp17Js76JDS3g44+OYoTUlFmVLr211R+WKD4sYkkDp3sjKK9KXQd2Z1tIc3l943RVHiiqWmsquJSoqsMEMKMeCq+1J5RSexkNMnkWOHNc+AWdLcaQ9QvA/e94iWmiC/NuJyhMUWeUUR1XwfO6sANuAzANNvPuGZXuPbdwfKTR7Y+omJODibYMLKTYztcjAc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVk/N+I4e+gPmh58OSlB1nZZobtv+1Ib22lKzChWlFU=;
 b=nSlf4nEYIPlCAAXCbQLLTCR7MIckq+YR0Z/OZoRvx4Fk+8MA9/6OtSrK2OCx5UZN6oMSj/uN5FO0TUJaNICCzXLpeydv385RkGoEcw5qs/CKDZ+rrc+lWmogrftpq/lL9z3niBcH49CC8j48dRU2uB5Sn5mYYO73kD8lzY9N/ok=
Received: from MW4PR03CA0106.namprd03.prod.outlook.com (2603:10b6:303:b7::21)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Tue, 9 May 2023 06:59:40 +0000
Received: from CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::84) by MW4PR03CA0106.outlook.office365.com
 (2603:10b6:303:b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 06:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT116.mail.protection.outlook.com (10.13.174.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 06:59:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 01:59:37 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 5/5] HID: amd_sfh: Split sensor and HID initialization for SFH1.1
Date:   Tue, 9 May 2023 12:28:57 +0530
Message-ID: <20230509065857.4170013-6-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT116:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: f35a5277-5ede-4785-4a45-08db505af5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hin4UPpzofAlAw6eOJq8+rR1M1uYVxDoP+74nE9f2MmXVhZtZyZMFidESGm1IQkJmgDv52a9rD4H4G5/3aWQhGH1Io1Xv5S67ogBOQaPgU01jxjOu/8+KPvXg2h2nwcrC7/vTxKpkZg4tbtypPFO3b7v4SZyCy9Myv6pFJph0zSAoCGpGSPfEkul3wNS0JE8a8Pn+RYVfv75JTkIZFvq1UhHsNBZJPFMMZkE33QOYpaZ+SxTJoAF8ThOP2lAVMVLpZQ/US4TMhGDJOJKPCd9unC4IcRFWeE3btpbmqAlte+xmPYxPaqsywH9Jcfzjo+jbqxsTLA/UCUXPN2gMLHUxwkvfAVcENWZCkEl22Xpm24Hcfv0OKS87rzhmdnibNaJY61Kj2yuz925wL+wwSZGpvRDUwNGzfPithP5AQqwEdxNyTCND5IWBBFmvymYWY8ZFdJeWDZIxtJ7iWg9Yr1p86CzXKfHooDwJAoHxVRap4KrRvx/jH5a5Xe3SRQlLrDgJ+sOPrfx9mCyXZxSh5oQ/aW+0qGlRHBNSbtDCCPG5HM6Y90wggHqyn7tWx626a8uDpf0i1qRe5GHlhXLsJJNRVaU4AJNj8d8TJDYZlZv97Fq9y0cD438JkJvlLybHTJW2okHe8sGgsKnpvPp15Ga5V4sj3q4kA3IAh53/MnO79PngQwnbNi5HnPGJ4kTaVVzIbR2lFxwf1BSSssGb2MLMsQzA364INfKu8vKccSRArkkeOY0Jaut2zP+fW7xdcv/XZGRyqmrBbGcWXbp7nR/4VjztYeeiJydzr/hH3/24Rk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(70586007)(70206006)(478600001)(86362001)(110136005)(82310400005)(6666004)(41300700001)(316002)(40460700003)(83380400001)(5660300002)(36756003)(7696005)(4326008)(8676002)(8936002)(81166007)(356005)(82740400003)(26005)(2906002)(1076003)(186003)(16526019)(36860700001)(336012)(426003)(47076005)(2616005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:59:40.3587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a5277-5ede-4785-4a45-08db505af5d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866
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

Sensors are enabled independently of HID device initialization. Sensor
initialization should be kept separate in this case, while HID devices
should be initialized according to the sensor state. Hence split sensor
initialization and HID initialization for SFH1.1 into separate blocks.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 2102d53bd51f..e9c6413af24a 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -168,16 +168,16 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 		status = amd_sfh_wait_for_response
 				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
 
-		status = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
+		cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
+	}
 
-		if (status == SENSOR_ENABLED) {
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		cl_data->cur_hid_dev = i;
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			cl_data->is_any_sensor_enabled = true;
-			cl_data->sensor_sts[i] = SENSOR_ENABLED;
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
-		} else {
-			cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
-- 
2.25.1

