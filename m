Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A7757EC42
	for <lists+linux-input@lfdr.de>; Sat, 23 Jul 2022 08:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiGWGLV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jul 2022 02:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiGWGLU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jul 2022 02:11:20 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1339130577;
        Fri, 22 Jul 2022 23:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JshtXQl2pmIW1mIXZj77Dt7w8Z5sp53w94P6E9uCplj3D5oShcnq97Ot7R9L0VYmujDF5rkT1EDm9AO7GQp8v2DLkQiHIFQRb76fbH7INcoo/jMhDWvz5Q85abaUgV9RIObI+VczEdVx1Ep3bo2F+Ar0eOdFTZoqnpYAsoNzdJyVDpnceaafSiw8pmCLsRHyz+1kTyW5bxvFf3S18q6wWBrZOFufPl4BSdCZQjUloZ7x9acA19QhdqUhEfHuawvzW8GxXoej16KrLQgWbpiHMIXvqOzIFB3xAyit7pUbgTWeLa3xhAwOtQgEn+UzpiLvMr6NM2MM5tbK/VhBfzZCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRXTQEaFzgEEIXj2IX2ESk39BWwqI9/7Qllerr/Qnxg=;
 b=NVJtgBwXGi10BxTuk8cnXK1ZNB3E5VX1UyR47Bp4KrBp81st3I98LNjUgr89Tnh1aY2vw8que0rRjT4xrlPXTYUf3B6fjgD+NkIjCZGXmoYnc81R1qRb/5O8Nt0nKpOzmivEqLZQxmaeWkr5WyN2q/FiZS3FEn4E1NNAPlynPd+vr9yxzE6YgfEm+Sdy8gX4CrH2LlM5AUA0LwtfOy7DZdjSEyiwMZomXah2thg+y564/YoWJFD90KJLwsQWtaWFKSeYUVsTtqW68JP+fL6NRPA42PGETHA7hqKZePsfUgNllr8ew011r2BvKHxpmRlUFKCoZvOkCO6LH5Bd6D9usA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRXTQEaFzgEEIXj2IX2ESk39BWwqI9/7Qllerr/Qnxg=;
 b=5Goip/RgQ3b+EYDgwVcx7vUffDZil0BMW+kpnPeSQizip5aM+JbnRLYoCVwKv6IMJ14RsjqoPKuCNbMWJZ0j4aNgN+mEpGO25y5o9cWmsdbuaqMM1lW1SWEY+DZxIkE29ofwVbgvqUfnwWFjZ7YpU/nDqnFaY3u9uQygGuZNB7c=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by DM5PR12MB1353.namprd12.prod.outlook.com (2603:10b6:3:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Sat, 23 Jul
 2022 06:11:16 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::bf) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Sat, 23 Jul 2022 06:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 06:11:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 23 Jul
 2022 01:11:13 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rdunlap@infradead.org>, <linux-input@vger.kernel.org>,
        <linux-next@vger.kernel.org>
CC:     <sfr@canb.auug.org.au>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH for-next 2/2] HID: amd_sfh: Handle condition of "no sensors"
Date:   Sat, 23 Jul 2022 11:40:33 +0530
Message-ID: <20220723061033.1377061-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
References: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ef730a9-095f-4d0f-9e2d-08da6c72270d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1353:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2aOIkC8eCvwxbQtHj/lLRoqbk9mtmIS95igP1R91C4zQYHz8XwOn4Zp8cjIcqkgcTDxHUdPxj3Qq4Qlz4fd+jhqvLPumcOUx6BNvumQuK3h+dhytA3hcgejf7JkNUUtU/qX/qkeKvxeX9OirWlwhz/qK7BGtCI4yxvWaMqOGfEu8PzBzEOlD3+omV4sNd+TuS+6xQ9cU4pA/TjQyKaXpebiRd8Z13NDkE0BBFaxtsqxFzwBfxPrWuirNQH8pvOp7OiVz/NxI1nh9gfm1kV7ub1AMiwEufhLb7WZY6wTe9fpRhDxJRdEnWJ0Arx6KkerE4Te7ABvwmaqXWLiQjAXGeI+idl9syFGshrjsjO2FoXnbj94CpgmN/MJqjZXwAEfT3iGQSuQX74EhIgrkRMzAyzJ3HJ6lTQC1PxScnBpZlCs6V7HOGFcOU3FOM4ozBieRdSzhUZ+2DyLdPOVNiRWvRU7jiPQohZUuqdJekLoFYv0KtD4n4HC6HtnSCwSGlHJpUnO7wyPcZknHgcRI3kI/f4ZA12iRgeWuZ4Fxrvhgir17+DGPdDUGJvj7oImb+BZn/XNN9dperBurRenIUX7Jugk5buI2nm6T0d4mvLf6iVHiu1s4jN/VTHhi6RClVlp4H20bbI0MV1cYEq6GmbGu4LkRm23+sZNMGM/HziwKEu8OGrS5VpLdcER1FCOm6uOwr0yFrKBH0GZxBzduPR5xUUg/+DVhDATNEacfH/STGBW7NdBVavF1+JFIlnh9sVKGlw3EbgQR+GBZhpp4+rWgkn9vOauJ3ZpvUCSG4kRfOOxw9fFQxP4hqFb/WZAUa+gRpHZA2aQ/f4t2FJ3bjmZdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(46966006)(40470700004)(82310400005)(8676002)(16526019)(40460700003)(40480700001)(316002)(6666004)(41300700001)(81166007)(110136005)(54906003)(4326008)(478600001)(70206006)(70586007)(7696005)(1076003)(36756003)(5660300002)(336012)(2906002)(8936002)(26005)(4744005)(186003)(36860700001)(82740400003)(356005)(2616005)(426003)(47076005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 06:11:16.1747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef730a9-095f-4d0f-9e2d-08da6c72270d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1353
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a check for num_hid_devices to handle special case the situation
of "no sensors".

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index f95e623040f3..8275bba63611 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -225,6 +225,8 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	mp2_ops->resume = amd_sfh_resume;
 
 	cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
+	if (cl_data->num_hid_devices == 0)
+		return -ENODEV;
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
 	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
-- 
2.25.1

