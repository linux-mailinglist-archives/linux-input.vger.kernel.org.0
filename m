Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3018F5E73E1
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 08:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiIWGUK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 02:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiIWGUH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 02:20:07 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A549FA96
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 23:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEH7SCQEmUkJPHQqYPTqKD4bqyNnmym7Z5M3fYElBqJ3fw8BiA+WLouJhWm+HoGzsXdVIuyR9bKuilVTyrKN9MbP29dJRWFsgJQVI1OC3dLW7vLVHgRdeRWgijoShgEdcHYYHqlITSa4L+dfGwhi1UldZzMiRv4wE5RlzROIET12exRDUnnUHRQR91eaOYB3DYQycJW+EO18avgXA+uAfgdyggZNtwc2w11OfSIFDAM62MenEHGs4fkVQnLHKwBRGxRyDqMhltpoYHxMYD0Tjd0x8BjD0SKVS/XBT9wmK5jMCho+AW5WpyReaX41ogy2APR06broIOuEpA5Iw4YKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l6+V4CJA8ppmTKM/jK7ggKMTx0eKz5vNteWRxpuVUc=;
 b=Ej1ukmqHyoG9F3EpdN73VVgaLI26k687fw7Qmo9bgv0WDOS24RM+efkzPCm32YMK84/Sw9I5QqCZ+ZxMYa8BHwotbeg0d+DfVKCcoEIcm/gCgRcgOdmTan1Wyw3t2ARYBqVe6IKOOMnB8m8DZuNBIukCs04WH5y8pRgRpMUC8azYAaqUNcqSYuNvRfoVR75kHiBp0Unul4Ib29lKvIlPNti1jdz9yX1YhONUgTtplJbQuXZvtySQFcj7YODN7U6L+to09zHUe+esLTDjmLG5Bh99LaGKxJfXlSC78m0K+WoUZgbXnHROi3MqNRXXtSgqFP417RTmkHnrfEtDmRrPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l6+V4CJA8ppmTKM/jK7ggKMTx0eKz5vNteWRxpuVUc=;
 b=z+1p5Hhw72IdePO2OiVU2c/e4cDid6218/ZmA/kL+E59IUUgTN9O9AiM1P/ziygl5gWcobfNkFNy1ZWksP5gQMFZO+R3K7xf8wBlTjeE3bjBlhhZU6YzPjJXQAkjuycvTYqjaGXCs0MNP7rOCxYwp7lRHc4QWYxtqf8GfZ7BLos=
Received: from MW4PR03CA0258.namprd03.prod.outlook.com (2603:10b6:303:b4::23)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 06:20:04 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::4a) by MW4PR03CA0258.outlook.office365.com
 (2603:10b6:303:b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Fri, 23 Sep 2022 06:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 06:20:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 01:20:00 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] HID: amd_sfh: Change dev_err to dev_dbg for additional debug info
Date:   Fri, 23 Sep 2022 11:49:08 +0530
Message-ID: <20220923061909.636337-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923061909.636337-1-Basavaraj.Natikar@amd.com>
References: <20220923061909.636337-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcc3cfb-448b-4a46-6065-08da9d2ba792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JpvsJ/o3xKUG9joYsXOKJbJb5ts0mxbvCDZfhtjVZ0N5EekHD2nlnLbC/w+siNvehZ5le+HdS2VFF2aJNRhdZk3LCj2ddjNDS6xWTqQrLhaKNfERCynsRWMDrtgdaR2BzhHay7Tz1f/iR+Db3uSFsq0PvPHWHmVLYaaz5GzyPVyo5gGNPk+WxkanwklB9FTVewh3huYMMSjhzAipuog3vfm6XIH0d2GCHoEPD0gCT+yvyXSHr9xNjp7TK5vO6C1In8k2RraF2wU3RyoDt/kVpz2bw/bS6nFiIp8T0xgtlytmgrUw6HPozNpOD3ylpZihlNgqgYRuk3UXN17GfAboBaZWZD5IT47CfvEmTk40qdpXmqWfZOg8EgVVx9mHKw/S+SwIdjmSRC5g37oD91qy805nSMXd6t9g+sEzLfO+Gcnw7Jdru1yzCUO4L2g3AocxdbW9k2icNnYPH0oau7jbCJRICB7U58nZnT7AADbfWaEmiH3ynCyZ6NAKPDmEoyLX33epneceFn8A2SpAq7D1ok4rp396DmaU/vvJGIS+Qxu072jc78b2Y2EDi6oY9pDMOnwIE7sNOBd6tD1b18cUb9+FwwvFgNiIoUwfxiOn8nJ72upyklvTfMUNQPg7riFh7achGnvim6FLODqs30hl6j6sOKxb65fig/RkZbLg0vai9EWIm//pkcvpziZS4PtH6+h00xtztWjZKnHRvcNzVQGwmshasLA8RT2k1nbte/OS5iuikg/mNMRyan+3MDJiUQzYowNKIQOCaFSV96K9C9rYkL1T95TqoNH+/pVd+rhgXnuHQ0OQkAHdpUZ/5+/
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(82740400003)(36860700001)(8676002)(4326008)(70586007)(70206006)(110136005)(316002)(2906002)(8936002)(41300700001)(5660300002)(2616005)(16526019)(186003)(1076003)(336012)(426003)(83380400001)(47076005)(478600001)(7696005)(26005)(36756003)(40460700003)(81166007)(356005)(40480700001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 06:20:04.4857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcc3cfb-448b-4a46-6065-08da9d2ba792
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Users should only be notified at most one time on systems doesn't have
any sensors connected or non-supported systems.

Check the return code and don't display error messages in those
conditions.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 70436f9fad2f..d840efb4a2e2 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -286,13 +286,13 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	phy_base <<= 21;
 	if (!devm_request_mem_region(dev, phy_base, 128 * 1024, "amd_sfh")) {
-		dev_err(dev, "can't reserve mmio registers\n");
+		dev_dbg(dev, "can't reserve mmio registers\n");
 		return -ENOMEM;
 	}
 
 	mp2->vsbase = devm_ioremap(dev, phy_base, 128 * 1024);
 	if (!mp2->vsbase) {
-		dev_err(dev, "failed to remap vsbase\n");
+		dev_dbg(dev, "failed to remap vsbase\n");
 		return -ENOMEM;
 	}
 
@@ -301,7 +301,7 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
 	if (binfo.sbase.fw_info.fw_ver == 0 || binfo.sbase.s_list.sl.sensors == 0) {
-		dev_err(dev, "failed to get sensors\n");
+		dev_dbg(dev, "failed to get sensors\n");
 		return -EOPNOTSUPP;
 	}
 	dev_dbg(dev, "firmware version 0x%x\n", binfo.sbase.fw_info.fw_ver);
-- 
2.25.1

