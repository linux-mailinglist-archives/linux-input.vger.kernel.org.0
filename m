Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C5A5E73E2
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 08:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiIWGUL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 02:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiIWGUJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 02:20:09 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3D2A7AA1
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 23:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xb0bM+QTc0+trOpXYbP3f/evyy9Tmbowl1InTD+vxUoIivt59qxritxETlUnDIEbzNIHNM/xI3ELP0uOBmEYU+QTjgcyJgFCWoSSmMO53a1UG374AQ3q7idWLiqMWgdfPKJWZdmXg7UOWTAH3GeVGGOIq5sGK7s4VNLh8g5aiHvMg6NnJeHtqC99ueYBmg9Vu06rvXgjkF+mxmyHjVw9M8UL9hbL4dwe5ZokGrYZDzaS4rLxEJJZjc5rdPdYO6BlBmx9KNTCLUqP2WRmCtzWKCacEDv/xjGEilJc+l4keFVlnpGxAEejhVc+rg2cqmlg8w1SB2XbZoH7E2BBlLGlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0tmahANQcmh/hQzCpEsFCWPcSh7pitOSsVhBELnS1w=;
 b=H8dlhPyyHWhQxZB1iho9zRyPXMfAamfjWf+vrLqtXe3IaL8bS+I1iNDIC9/rCBxo3Et7Vv2D3IzaacsbLOcyjjDnt9J1EVVdkJ14NJQEJzme+cSmKRIYjl+LxiW1GYPBzJuNjDnC4P12e+1t36ZNdNz8DTvgTIXRFMQsRqDLTh8V+HiTGqgrYjV8NPImFOR3Q6L1dDEZ0WHxs/TDsL6ecfz4SSvdUHgAkc4NAmn6MYd+E5rffAgbEzwNmsaxxGsN6mr90AdJE3znDTlwWGd1NS634CFa+z0UckTp995TUJIVIRRR46gZtjXSsfdD3LGFOvmMEIwD8r6ulSlay9WrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0tmahANQcmh/hQzCpEsFCWPcSh7pitOSsVhBELnS1w=;
 b=3+rpNnBed9zTqv8oyY+PqK47CXLTJvO0H7x3ooKLHz6hWsZlw4Ao+xLOONOQo2TXSB42RPwkN1B0tmoRQyyGwyYWW/o6l+pk1fSxF6oO5KAUnl9X8sZQlt7iJyGKn49ExJgSXm3sLRP5pAyk6Abn4UYVMbFWnBpOkys/RkKKSc4=
Received: from MW4PR03CA0269.namprd03.prod.outlook.com (2603:10b6:303:b4::34)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 06:20:06 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::32) by MW4PR03CA0269.outlook.office365.com
 (2603:10b6:303:b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Fri, 23 Sep 2022 06:20:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 06:20:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 01:20:02 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] HID: amd_sfh: Handle condition of "no sensors" for SFH1.1
Date:   Fri, 23 Sep 2022 11:49:09 +0530
Message-ID: <20220923061909.636337-3-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fac033d-8c51-4ed6-2728-08da9d2ba8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VV7ZhWm6ANaWJAvWM6VXZ5d299Jy/t1moqBFTHOjGLGOuf3wfkZfi1A6Re/gVrp+71Kv6RbXCCsH+AXaUmOfcrAp62PMNaYjWBtJQVARfyCjPCDPn1NNKgAo43LFpX5syWpygWDcMExVBt8nBYs99RNzUgge42uBhkX2WJTIdfWM6p93UeV9ol5RG6PkDPTbl9X02XpL/YA+AmNf0K1raltMArfcRTm6wC/1UfvjDgVzlixGEft1rr5Hvmm07NJNIWhY9qLndxBGNWXuodkIgK1fw9WsHjicMueikBdZYubxcoIKo3AEXD2Z32zT1H+XIfsb67XU7OjBjVs9IzA7yxtcNzKxVYGT481S3ZEZQj1d3FT43vHeZIfdXD6kc4pxixlwWR7GU4B/5AOYJTBi/NV38PsnGskMFdrsspz+gvCKFZ4ZktfsZK3gALAthFDaO0HNE1pNH4IHrkQsDgNbGyz3Jr8Ip5v9a2A1YqQyx6/ymBnvb/5LL2sf6mip5wE22FxJH3/CM7Ba3DYpe1abwqVV+1rfTTyWi2bxRBHzkQXnUNx5byUESzKs0Sf3HLv+P4dPwamw3FoNfgk5s/yRU3EQRSW/CQKKIxVf7z2ny+nIsGggnFmNuWZ7R38EO11dhmC2OWPWIWP8OmJcBM9UQFdLkrILATaxqBkgKZoFGoassMHgLNXZZaIeqbFyHYgtRLrA8ZbtADplBU0Z3//xdYLnXnWXTbICPXcqNMR0fVgfosl8Co3KOmcYawBWu+bZJZ9S4KIqqlBwx5uMULoh76ytt5tbiW7t6bHNVV5eqKU9020EdkDnfbB3QpwoDdxI
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(26005)(4744005)(8936002)(40460700003)(2906002)(41300700001)(47076005)(2616005)(426003)(70206006)(4326008)(110136005)(8676002)(356005)(70586007)(316002)(82740400003)(86362001)(16526019)(40480700001)(82310400005)(5660300002)(186003)(1076003)(7696005)(36860700001)(336012)(36756003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 06:20:06.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fac033d-8c51-4ed6-2728-08da9d2ba8a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a check for num_hid_devices to handle special case in the situation
of "no sensors" for SFH1.1.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index d840efb4a2e2..4da2f9f62aba 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -110,6 +110,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	amd_sfh1_1_set_desc_ops(mp2_ops);
 
 	cl_data->num_hid_devices = amd_sfh_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
+	if (cl_data->num_hid_devices == 0)
+		return -ENODEV;
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
 	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
-- 
2.25.1

