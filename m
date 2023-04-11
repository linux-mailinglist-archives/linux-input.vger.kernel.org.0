Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9072E6DE0C5
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjDKQO3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbjDKQOO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:14 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A6D5B93
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYR74A3/XckXvXz7ETDiBn8G0bnTCo32tGoXUj3Ns45uQDWPgeFyL3HZ3iDQlexSrwxiGPklN8DV/gLflZmMFfDOU3BLfkoguCZQCcRwLgXOoGweqMNLagL2+rDGSO6UUUiu8421GZ4RD7KQOod0Bt8ipEaHQb6UfDj4DrMXIhgq3q/8N0iO0NC+8IEdyCoqV16+eIIRSzbAzEtLTUVqVWFgcTf6afDINrOQHwBaQuUc+blX9vBx3vpJbRtkulcJujPrKL8/u7kqiH5OUhQ8cNwMLCMIL33quU2LPsQVmeojmCVptLxjSVipIjzFAEXzvJeM1se1YDRAPmKfmjfgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCPdzWiwaIKoQ5dedv+uRdZ+7uqz50edcjeWTAtQACY=;
 b=W1ezz/bS6JcmQ/3TzfxvG3p/f1Qs5eI5aqvY8WSFPIIlmMYVQg/xPX4Vdcqpwx9pl2Mta2c61ZMYgSqTy4TvQZtN0TvIMyLHwItdsPNTfflChRW936aD4Y7LLBmQkC/x2DGG1hZS0KmgJTaKGJFxeN6bUw38zuhur4ZeuAGiB4z+rbqpEn3AAS3jgGLXYItIVikmOQ5eB7P0MUPLo7Ng3HH1xbIfOXJwPgAbfHrecaXsyXoDUWGi8s+oSw+8s6W4ddF9aNfQqgg6jR1H1eTkbmHSVjoWgrPGi8xLaLqmHisxF0FvrG3eNdP2QLCZ13uICzsWPLQ+HrwLsdLdMwv8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCPdzWiwaIKoQ5dedv+uRdZ+7uqz50edcjeWTAtQACY=;
 b=xa+FzxvgtPONJGVTfXTvYGas6tKCZboL36ywIV7H+MPwYeZfnZsAl2YwY1hqSxc91r6GVV45twErxG1s93m3n0I7pNWDLYs4xobT1Iucb2UiSqfG4vYppRgYjcMJF0z6qAOJvreyCBmzy0q7KX3XplWg65gUhRNqIHK02YyS0K0=
Received: from DM6PR17CA0019.namprd17.prod.outlook.com (2603:10b6:5:1b3::32)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 16:11:27 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::68) by DM6PR17CA0019.outlook.office365.com
 (2603:10b6:5:1b3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 16:11:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:24 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 4/7] HID: amd_sfh: Add support for shutdown operation
Date:   Tue, 11 Apr 2023 21:40:27 +0530
Message-ID: <20230411161030.909350-5-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|LV2PR12MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 58765dae-d64c-4dc2-8db0-08db3aa7672f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGATMyS0a4Ji6GjgT1Q8hFYaldvlnPfQtLHZBaeLAB5QfpaiLluzCSIk3uo7dy6oYxMGaoFK/aPa5wwleZEgSWGGdxRhYGIL2ungcUiXFab75TWGiK2X1DIpUw/6j0pTZK/NRtF0yK4eqvWGcC1Cf6yyfhUUegRG7MMF6glh7hW4zb2ItrdqmQMcbEwE84BxxbZRKuRzYLoA1p8FlY/W1q/kLw0DopUwMHadj3Ns+GcC6hrtAklzdA99nDDtwdYVvxgW8icvKSpctrhh4gSLJUj0Wa1fJaXBGOqKJ8/sh5eVFqfHT4uZoAICP6rFpiAzg/BNl2N0wFo0g9J+jN+LgJaZiRJjPtS0vE2H3Eywiz7johK7ZQiJKnKNexukk8mP3+QNH5yimzJiLeXCjNcDhmQ4bhMGLHMriHH+8wZ+N0dAOZgHvwp9uogkpG5PNN372PFlu97UamS4dVF8MhinqUM/gtO8dtRa+KU8R8V+5ySEh9YlUFxLpU57uByWg5OveQriR1YnY9cGi7MmO+EUpQyaG4gPEZaWHfiXSHHHS0jB3PSd48JulwRZJMz2NMQpqS4BRDJyoKExGIeMBMt1qPE1qjj+cwdBYWGwLJw0/NxAjNjeDc6RoiSPH4SjDBrgJ4uN7v4wDtSsvv8TLaMiomHWGvwxfszgSgi4EakJ8DuePGn4IbO/P7AyAVha1Ub+g7aOrtpMVpyjdd/+UNCqZe5vlpvssllSsN4E7Bw7qqQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(7696005)(8676002)(70206006)(70586007)(478600001)(4326008)(41300700001)(110136005)(316002)(36756003)(86362001)(83380400001)(426003)(336012)(2616005)(26005)(1076003)(47076005)(2906002)(8936002)(82310400005)(40480700001)(5660300002)(36860700001)(81166007)(16526019)(186003)(82740400003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:26.7395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58765dae-d64c-4dc2-8db0-08db3aa7672f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As soon as the system is booted after shutdown, the sensors may remain in
a weird state and fail to initialize. Therefore, all sensors should be
turned off during shutdown.

Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 47774b9ab3de..c936d6a51c0c 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -367,6 +367,14 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return devm_add_action_or_reset(&pdev->dev, privdata->mp2_ops->remove, privdata);
 }
 
+static void amd_sfh_shutdown(struct pci_dev *pdev)
+{
+	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
+
+	if (mp2 && mp2->mp2_ops)
+		mp2->mp2_ops->stop_all(mp2);
+}
+
 static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 {
 	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
@@ -401,6 +409,7 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.id_table	= amd_mp2_pci_tbl,
 	.probe		= amd_mp2_pci_probe,
 	.driver.pm	= &amd_mp2_pm_ops,
+	.shutdown	= amd_sfh_shutdown,
 };
 module_pci_driver(amd_mp2_pci_driver);
 
-- 
2.25.1

