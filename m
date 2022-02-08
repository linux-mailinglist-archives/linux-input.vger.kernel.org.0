Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA5A4AD954
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 14:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348702AbiBHNQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 08:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245731AbiBHMVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 07:21:54 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE61C03FEC0
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 04:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGc6F531yuvCmAF7QUV9qr1gr70Mz6xuLR3yd9OE95ryY/UnG5euIr9CLLGPqg3kvvHxdCrHGQtKzg17wEvkTU6m1D0MQoiS5m+cm2HJLVKWrbPG8DbO8YRsdzL1jVKSrc2WI3QsH5gDCP+kekfD7DJZ6yl5CxtcVLRUaKEkjZIGtdku/1ae/vDW7R/Zf89/j8lFQk/dwHy3T3+qmFjkkuRXvJbUWQU8bNiWDw+yWClzqqzxUh/ZwWceEm2TCV3t3KHeLhy5Psiqvhco0HXwv3pfLKNE/zBH+/NK3HeWni/0tsliOt3jyzkKWWMjWT3ZlmyMSd/5mPfZSM3znv22vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CtkzZ6E4pbdeQAO82CnsBzjPzHRhSOz83XC8lKQacs=;
 b=T9OpFpDLsu4x5jK83ZTh7PscF2vIrMIK1w5VWnhUvQVNCznOqA+gNoJIyihSAIFOBlpUb828KDl2TQxXniSkCmS1XalV81TAt0/gyL64gHn4Nji3yrOXWzEhyBEDHJYCOD2TVts0+ApqHp52BdeoPHp/UfQoRwiBps0Na91l64UDN4FqiM1au1q7b54DSC/viSXSzDBlaZfrproO8Li2QRs9IX7t2qMmR37HxivYEcLAurpMlfuDULLuoWWo9fUmht0c8oFDICV/SoHmRfUOapZWDresJOztoASp5rVVSmN35xYLG9gLABf1TwGnjpcmyeKCm/Y5zxsnIfANhaqxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CtkzZ6E4pbdeQAO82CnsBzjPzHRhSOz83XC8lKQacs=;
 b=elvRk2x4bR+hq5703XqYko0dVmBpmp/MKaqr3J4Bikp4c/Z6BbNueJsyZ6XKInjZCdON9iB2XJeJ3HXdRgj4cYTRRmXCrHhHAX46qMu11XbvWSPg0LJjzNJUPfMQ5/T/4O6Miv/2t9I2ooUg/VbF6k9l+xYh7Hzo/bgmKovinSw=
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by BN8PR12MB3042.namprd12.prod.outlook.com (2603:10b6:408:63::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 8 Feb
 2022 12:21:49 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::a8) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 12:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 12:21:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 06:21:45 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/5] HID: amd_sfh: Disable the interrupt for all command
Date:   Tue, 8 Feb 2022 17:51:10 +0530
Message-ID: <20220208122112.942471-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
References: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41b945b0-3913-47a5-0b11-08d9eafd9490
X-MS-TrafficTypeDiagnostic: BN8PR12MB3042:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB304240A9CA4DB8D3D3ACD094E62D9@BN8PR12MB3042.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nUvr+1PgQN1PMxrhi5COWhMKkGhZUDmJM14w/Wi6Gvsnm4g+C1xNBim5ZvZZvwZKBztTRrzAkokybq6SQF1uMFa6bQ8fR4MsS0L7BK+xTLhcSQKpdhqGwhCl5jJI148FHDXEh1qUYR0hiBesyQp0LOWCCi0RgWHTdu5GO+j18DzuBIZTtnL8LbD4GCf/RoZHS+8l3bXECC3XcOQMLh82vhErjpjZE601QLtdUUnXqvgMZEwqf6VrXCE8qSRpLKaly6cpGN5s65C/phPuYJPGW/uYeFabuqwzCoBw4eH7RtHIY8Kdyke7O6B/meV0hRugEr5oUs12SgrgRIXLLrKa2MJu8NStpKsZbHevMkbi0zxELk260ASSXf+5AXayfHzl5z7+trYl00M4imGte2jtBlX2yNNLyF2uzMp3RhNJNjUPikSgnIcshjVRYKRt566OKAQkiBTjoXCf4dfsxiThNkIwdIgzQr1KwgQcWpFGpB0vBE4VtfAQ44rBvILq72/Awp2+rSzA5vCJ5GwgFJKVU6yPq0oLGCrkTJq2F2iLU6rzoauuxGFW28Zph2eVKtwnqWyfrTafsyVjchJHDxTZ667Zu3U/jPbt8l9Yh8jqhGxlMu+HLu3GlfP+jnrf5bAKMKmmm02w2Ib/SsaHDMR9EsYDmPW6BDv5DsNo2nQKH81cX5Stt8l4aIjQe52b/WKJK7v9VNFDudcywG/R2rjRuQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(4326008)(356005)(8936002)(81166007)(2616005)(5660300002)(7696005)(70586007)(26005)(1076003)(16526019)(47076005)(186003)(36860700001)(6666004)(508600001)(70206006)(110136005)(6636002)(36756003)(316002)(40460700003)(336012)(2906002)(426003)(86362001)(82310400004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:21:48.7854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b945b0-3913-47a5-0b11-08d9eafd9490
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3042
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sensor data is processed in polling mode. Hence disable the interrupt
for all sensor command.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index dacac30a6b27..16670e910014 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -53,6 +53,7 @@ static void amd_start_sensor_v2(struct amd_mp2_dev *privdata, struct amd_mp2_sen
 
 	cmd_base.ul = 0;
 	cmd_base.cmd_v2.cmd_id = ENABLE_SENSOR;
+	cmd_base.cmd_v2.intr_disable = 1;
 	cmd_base.cmd_v2.period = info.period;
 	cmd_base.cmd_v2.sensor_id = info.sensor_idx;
 	cmd_base.cmd_v2.length = 16;
@@ -70,6 +71,7 @@ static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
 
 	cmd_base.ul = 0;
 	cmd_base.cmd_v2.cmd_id = DISABLE_SENSOR;
+	cmd_base.cmd_v2.intr_disable = 1;
 	cmd_base.cmd_v2.period = 0;
 	cmd_base.cmd_v2.sensor_id = sensor_idx;
 	cmd_base.cmd_v2.length  = 16;
@@ -83,6 +85,7 @@ static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
 	union sfh_cmd_base cmd_base;
 
 	cmd_base.cmd_v2.cmd_id = STOP_ALL_SENSORS;
+	cmd_base.cmd_v2.intr_disable = 1;
 	cmd_base.cmd_v2.period = 0;
 	cmd_base.cmd_v2.sensor_id = 0;
 
-- 
2.25.1

