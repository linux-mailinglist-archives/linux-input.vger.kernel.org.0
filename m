Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C70B551FE20
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbiEINZ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbiEINZK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:10 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A102871B
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHP9QTNvQtEi/f3HE5SjQaiDtwQUKOxofDUWImQ14RYtsmMZYFURvv09erUnlUwf0a2uJMgtllFltiZ4A4Chq4/EtODtdi2uBKntbtqUaov0PnK2oDV+LAnNpzerQo4CIfKrzzddLc/roeXGKMQ6tzo7Q2l76BzNWNQiRxyrxOy3Bica6FWeR3CwxDvq0GIrvcAXlppE5+jeaMNoiOGnC5yRwNMpegVOOEScOCxdyqetF+f6hye7Ren2OjfDmVSWy9LKcwr/i7lDAiyPvdRSnJYO3iQa6favj5ayiJ4YYKYJrzan8VStEwVX2LiTfHyBElO4UGarZqI/WVtDOddxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQlGigHISK4c1W+UyhCzgh5Mez3CK0PW6jpej1VFN3Q=;
 b=RIaunWBED7kMJYenJjv6kH9+xxKNTFYhMUp1ShXVO83kk/iNsGUXznjX7GWh6uNtza/dkMzK+N/dPKpMQV50gJ8O/nZv0TIRcxEZED+S+NP06lcNZajvQAPjhYEouOT+nkE1vnUPoJd6O+eqTlFtmm/+KJiR8tV7uTsPVrjALl3iTEjPe0eZYe1HS5/8ZIHPI5tLhIxuEDNmOWwqJhaiK+R6rCygmox4aRtPNyyYtIkf0F+/VKGsMjta7xxpz5mukdf8zs91G9bXULRSQPwuDo67o0lKsFVpzghVLhGhgRvrM6Mp6hCH+9CYKcIrNe9MrjaDPOgns5kt+m5ts1aq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQlGigHISK4c1W+UyhCzgh5Mez3CK0PW6jpej1VFN3Q=;
 b=S4CDcRy31pE//w4DbePJENFJj2j2ncciSTrVN/vjpry4dZ3tkKqAhh+GVBhGV8O0v+njvARxgc6cFhTzwz+JcDK4Na/h6WgahVwUZS1NNON+Fz54GotHyS67aViNrP0y1xRUDHkiypcc41jbsXGq9AULhLmNov60RhiuLtaDFfQ=
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by BN9PR12MB5337.namprd12.prod.outlook.com (2603:10b6:408:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:21:12 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::2) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Mon, 9 May 2022 13:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:09 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 5/7] HID: amd_sfh: Add physical location to HID device
Date:   Mon, 9 May 2022 18:50:24 +0530
Message-ID: <20220509132026.3204678-6-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9083dbca-5c78-4164-5b90-08da31bec9a7
X-MS-TrafficTypeDiagnostic: BN9PR12MB5337:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB533792F8735379E43FAACCC3E6C69@BN9PR12MB5337.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDktvG7XSkuACEAMyqg5UG4ZxBFAlAp1cIOienkR6WLXbrtAvo9Ht/2cExR5EKlHIuQVk8s41INAgKDAj+5fggCB6qZR7qElp8T7mIlgxjd6/gpC9vjJT/ijAagS3ST1/jxH4jUKZ5IGXTx7gBgu3+tq8tiV9a3JrgNSa6ggUVQEdJcJOT7weu6hSLg+tAS+GPXHl3f2GJ/9Gpsd7a/0zN0+Ke9Br+5Fqy2bidL+0krh6iIw4Co3+ybvO7H2cNluXbEaFeGqZmX8lXw3dEtLEc6e2NPfLBKqnwjKAhWpUvg2KSP6wf6xpIS2fq58Wyu5qLrxkrXe8Bu3a4nLBBskCGsISiwdxbXKQnIAOWrpNH8QCuQ6QuqWQeTANPPJMnxxAudQZd9CJX+9pIGMTKdyNZ5Frztkjo1zxTG1CT6eNgqJBU4jiBK0eWkEZ8dog5M6EslRzrwHd41C7d1XvMvv4GRNsK2Uy0P3f7yzzacCblx0uWnMxmWZ1kMVnPUCx03EUdGR/3Am3cSdV+0J7fogEyQ4GShoefpCCOIvcQYvFAOPsxxG8N3ClTG4N/a0vRzpecKkdcGPH0SwMfsT6pQRHCYEGFFo5d4W+nmkrJmj9k17ABf9jZr8pnkp7d5Jzw/56naeC+lEISpg9hVJfH3T3DQm8JTeVDyg7JSfP5Tz4thb7eCqqv+9+Qp/Yyfo5PswWOe1PUR55yy/L9KJGfqxrg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(426003)(47076005)(70206006)(26005)(508600001)(6666004)(7696005)(186003)(2906002)(81166007)(16526019)(40460700003)(36860700001)(8676002)(4326008)(54906003)(336012)(86362001)(70586007)(82310400005)(356005)(2616005)(8936002)(1076003)(36756003)(5660300002)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:12.1207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9083dbca-5c78-4164-5b90-08da31bec9a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5337
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

when HID device is loaded a wrong string is shown as
physical location is not declared.
```
hid-generic 0020:1022:0001.0009: hidraw4: <UNKNOWN>
	 HID v0.00 Device [hid-amdtp 1022:0001] on
```

Hence use amd sfh driver name or device name which is connected
to the HID device.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index e2a9679e32be..1089134030b0 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -12,6 +12,7 @@
 #include <linux/sched.h>
 
 #include "amd_sfh_hid.h"
+#include "amd_sfh_pcie.h"
 
 #define AMD_SFH_RESPONSE_TIMEOUT	1500
 
@@ -120,6 +121,8 @@ static struct hid_ll_driver amdtp_hid_ll_driver = {
 
 int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
 {
+	struct amd_mp2_dev *mp2 = container_of(cli_data->in_data, struct amd_mp2_dev, in_data);
+	struct device *dev = &mp2->pdev->dev;
 	struct hid_device *hid;
 	struct amdtp_hid_data *hid_data;
 	int rc;
@@ -141,6 +144,8 @@ int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
 
 	hid->driver_data = hid_data;
 	cli_data->hid_sensor_hubs[cur_hid_dev] = hid;
+	strscpy(hid->phys, dev->driver ? dev->driver->name : dev_name(dev),
+		sizeof(hid->phys));
 	hid->bus = BUS_AMD_SFH;
 	hid->vendor = AMD_SFH_HID_VENDOR;
 	hid->product = AMD_SFH_HID_PRODUCT;
-- 
2.25.1

