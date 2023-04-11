Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539816DE0C1
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjDKQOV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjDKQOG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:06 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BB87D93
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmMLDJx89qZOIdDPXgSl7DCIcYvxfBzO0RraLiVg3re0IwH21QpaVL65NGDacA4F++ST5mlF1JKaABFUA37CmcRFKCBAkW8aVS+/76lrQbUghDZkuu11zVLSjcrNJNzaBHsd6fSjzJsvRTM4iJ38S3ZkZVefIroGRp3Ocf6mxHmvwIlYa5HBIE/c+zTGH9hxSp22RkJ7XbJx+w+uVo0S/vc09pRwU4BiVNE/VaAqVii787za1Wgwoqn66JZjWKOMhvybSsgv2/cn6uwyKMKeAy+l9Xst80E99cc21g6y4lMB9lFfXJF7+aidSpcaFN3oUEqczAn8aUZRxV00ID8m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yMHiZbLxXnvNrpBPmxXHwYs8LLZzT9oz2UnuCbyJwg=;
 b=odosmRkxnX1iyrMUa9G7+AlHJN/nB6cHeGa2bz0sbqTjWpAHWJcINaCm+mIkYkJ3lr5veQ4zPeYs3OR0rN8jnN+hAwXDSjploHastGPWNP4HHsFzFohB7Ey0O1z+KvrlCbY68/SlOCnhyoBDjVU6meAbSRKky48nHdkjO/ft7P4HtyJx5+z7vqNUwHUeo8Cwsq10VA0kRYIw+xF0cJiaUmye/HI1XrMGbVvp/CHSb3y2f+2aBXfG5hPSQYqzV8SJOKwNIUpga55m0XulvrVULaak3dGYom0BkF+A2ml6dfVxSfBjubD+b/cK31gnSHHv+QLTh6omD2HaIj1uPmUoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yMHiZbLxXnvNrpBPmxXHwYs8LLZzT9oz2UnuCbyJwg=;
 b=37bWxZLCsxb5dwPhyi1jsKt6w/gjNZogRABOzuiW/gi4qKIw+xmh41J0dHp9kVJC3G1odO1DtU+Ch74FVZDneXceRjWVNFdY03t2p8MdkgBYXn0Zl0BgjVC3gLcfm/R7n3SOsLNd7HjWbVc0i4w+T2ZoEj21W58hSPwqNAu2vAk=
Received: from DS7PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:3b7::9) by
 MN6PR12MB8471.namprd12.prod.outlook.com (2603:10b6:208:473::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 11 Apr
 2023 16:11:24 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::10) by DS7PR03CA0094.outlook.office365.com
 (2603:10b6:5:3b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 16:11:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:21 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/7] HID: amd_sfh: Correct the sensor enable and disable command
Date:   Tue, 11 Apr 2023 21:40:25 +0530
Message-ID: <20230411161030.909350-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
References: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|MN6PR12MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 13aee8bc-e539-4f40-5c0c-08db3aa76554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jwj2RUhVwJ471JxHVXoanHISY/h6kEDNJrUp9Bme5HxG8I98zoKVY6HnAAd6mAkuzzWbojbHxV2D7e1xmqQLl0fxNjzSWF+4logy+O2/EvxQqPHVjGGwNwyXg+M3D0L3SaerTCIb4MJ1zi/WmBWx6sktXxxY5t+px1I2x83K6moqTlruZ3q6XCb+1QFlzLSYxAjhZ8bc+MR41Cyak5jO5fo+zhsxyQJpimMgfyobDuA4ypcTJu7msZhgNy2oBf8FpTA158hophO6VPUL4Vp+w3JUiOJ/ZO3vdFnVCz2/BvqyoprRhT4NLBiVPHJKu3zkT99xa4ppsp2VIXzrvCtuPLc0H7O/ABdMWGu+ybpSUs0Id7D1MD5+SJLI8L6V/gV6TjxVGahFVPyj0YMYWq1o6AoOXOU43gNrLevB9+dYlaDleIeGuiOpcH1j8VCd+/vDh03We6z/56eeGq1zvpz2i0d3dDFfYn8lZ1YN21VLZh9eAvyt0gJrbCTIejUqofvHamxvbyybdP6BaLemvzpEB/wgm+I+0uD2zgqgv652VqKZcmWJaPy1Gr83BwySZE8dxFrDLEO/IW450YX9ijFqybw2MZiA8JLTf4Z8gYiZoEhkjSOOdtRr9LEwcCtSf5EHUDTLOrL7u3sGESOYHmhs+jCWEbJ6loz7clevrr2Mu5zeEizkOua5DcpqpHgsg0/vnK66c62nRV/R46Q/JQVmp/+TB+ZBkWCRZmkZoJhO3Lg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(2906002)(86362001)(36756003)(40480700001)(2616005)(7696005)(186003)(47076005)(336012)(426003)(16526019)(83380400001)(1076003)(36860700001)(26005)(70586007)(4326008)(478600001)(40460700003)(81166007)(70206006)(356005)(8936002)(82740400003)(8676002)(41300700001)(110136005)(5660300002)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:23.6252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13aee8bc-e539-4f40-5c0c-08db3aa76554
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8471
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In order to start or stop sensors, the firmware command needs to be
changed to add an additional default subcommand value. For this reason,
add a subcommand value to enable or disable sensors accordingly.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index c6df959ec725..6e19ccc12450 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -33,6 +33,7 @@ static void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor
 	cmd_base.ul = 0;
 	cmd_base.cmd.cmd_id = ENABLE_SENSOR;
 	cmd_base.cmd.intr_disable = 0;
+	cmd_base.cmd.sub_cmd_value = 1;
 	cmd_base.cmd.sensor_id = info.sensor_idx;
 
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
@@ -45,6 +46,7 @@ static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
 	cmd_base.ul = 0;
 	cmd_base.cmd.cmd_id = DISABLE_SENSOR;
 	cmd_base.cmd.intr_disable = 0;
+	cmd_base.cmd.sub_cmd_value = 1;
 	cmd_base.cmd.sensor_id = sensor_idx;
 
 	writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
-- 
2.25.1

