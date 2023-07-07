Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFD274AB77
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 08:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjGGG6p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 02:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjGGG6o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 02:58:44 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DA2172B
        for <linux-input@vger.kernel.org>; Thu,  6 Jul 2023 23:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J22OJ2yzQOkQ5f1MK+h29+cKcNQ5RGYtOODRty7jd+AgAboHuk3goix+WqSerH+WBm1sIgzObHEwZ5Y+pED5KVVLgQl5PlCNO6RTksflFP4v5WO0KpqqaePCpCd8woU0pTAEDKAZaG97ngPppMQ/0pdAPZWCMadzxaV2ov3wPlQ9IU4xtagF82ncQZ4p5kQ9s/tjyevNhovACLlNpJgg8ASVxpoBqNUBh5n4LOiklTU2MbVvnpWuOnebGdAM4rCrlUOuXefExkDPSP/X5ehD9ZWgD7x0AM16zFh5s7FN/gatoNwJHTUai+U63dgIOy6QWrBkBQjea2GlAWoY9tQNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUAHbKN5EKUsx7xTnj156RRm6rkKFZb9g7QUHzFQljw=;
 b=g34TXEmuhkmAHgwhuhyUyreyUKeBaYGsRkBnKA877Su2QtWeZyTb2/a7HfZk+UwWsS/vmL1DwIElsxlslLXkX7+fPG4VQXZ6SYLcz7cFsAVWKy2MOF590GLMWZ8ZLnCN2Lq0eyuM/REIivo9Ye4/6NMhalUUhtuKuy3MLV7vK2OXsx8VBYzuVJ1p7Ojqy2WRZ7Q6D2onR/1cj29EKG9kvDxxJJofEC12URvBnERVZ4w1djuDPZMqhMY6HNyasrQ0YS+eutS2OIIEZlsR1UnQgF/Bze5Te72ogyc38/dsgE5k/PcnXY+Hhongn50VUsbQDbWWGLnJhrnbxmGEQSBcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUAHbKN5EKUsx7xTnj156RRm6rkKFZb9g7QUHzFQljw=;
 b=weHIQMxnLMYtlwhwnT1EcZejatyhZB3B06TptuLw8VCSFm2ybgqaHT5oXM0q+lqG9GuHLxUjN3f8e1YFx0P7Ku3Ccdl3gh1o8Ki0Dz6HXf8zmXEO4DmBIRNf4FJKYWJCHtRlzvZYtQ0OwDWrrc2aYfeeBxI3pSFsXZM7buxe2Zs=
Received: from BY3PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:39a::23)
 by SA0PR12MB4589.namprd12.prod.outlook.com (2603:10b6:806:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 06:58:36 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:39a:cafe::c9) by BY3PR03CA0018.outlook.office365.com
 (2603:10b6:a03:39a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Fri, 7 Jul 2023 06:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 06:58:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 01:58:34 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <akshata.mukundshetty@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] HID: amd_sfh: Fix for shift-out-of-bounds
Date:   Fri, 7 Jul 2023 12:27:22 +0530
Message-ID: <20230707065722.9036-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
References: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT115:EE_|SA0PR12MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba1872c-3be0-4e54-79e8-08db7eb79600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5+lXilE+KTPGjJX2TiihQIUPokPBVpQ0AmlGAzUQBFID5rhfu8/C8/JUTK9DTyGiZOL1pWHuxauadKOq6ezjIY6WUfHwcZdzHWRqY2/ScrHqEamRL4vOxSECh4oA7EqYiSo2lOD69p5JyaQfw2fJ624XMsi9eYwZhkI3jF8vJcRNJ6oInCR5fLG42zJbWkmhAz8fcgG9jaof0WnZ2fF1ZmU6JEA3E46OCllKhSRatmAOUYwCG4OBdzmJhZOnjRIatk6m0Q3f1uXSNKHS/v/t5GPO6lBy3fQxwTeFzYztsc9TOyDAgwYO8bNGoRORWzTrRAbv8EpXR4BJ0D6qMUELCgBdcPZKtUAwj3VZAnfTr2HU+wRg7DDgKEg1rbdsq/6XeT3N+e4QmwjfORtj6buEVKM3jie31mWfhXWNW7YSQiUP2uS0WgzwIwq/XQpW2YUC14ECzjEPILMy0mu1tGa0TguelvufrkvuOLT/Te244PocS8a7yc7Maqsvvg0zektQooYvNVqKqG8gmxbGk/xKl+gImpv4EvPWMMQ7vprIsprsFCNNab5I4WYNkN9rLfUu4757HvARxjYNcb1eo2VSHLZxMezgtQjCIjcK8c+FqaEDLkP/07oUZOE7JhQXvyaqsXmWYtpxU5sWjlk4jG3Nk3QAfXubAvI1AcRfpISDy6FfYksuMdsDURvN+U//r37oO+G/SlTKVM0FsYWBduGEKgVV/I+MuDnc8aK3gDjXsN0aMNHnNSUqkVfyYg92xZ2Yw2E+e+2n7k5pAkUsVp5/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(186003)(336012)(26005)(16526019)(1076003)(426003)(7696005)(6666004)(36860700001)(81166007)(478600001)(47076005)(2616005)(110136005)(82740400003)(356005)(316002)(8676002)(41300700001)(8936002)(40460700003)(4326008)(5660300002)(6636002)(70586007)(70206006)(2906002)(40480700001)(86362001)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:58:36.3004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba1872c-3be0-4e54-79e8-08db7eb79600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4589
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

Shift operation of 'exp' and 'shift' variables exceeds the maximum number
of shift values in the u32 range leading to UBSAN shift-out-of-bounds.

...
[    6.120512] UBSAN: shift-out-of-bounds in drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c:149:50
[    6.120598] shift exponent 104 is too large for 64-bit type 'long unsigned int'
[    6.120659] CPU: 4 PID: 96 Comm: kworker/4:1 Not tainted 6.4.0amd_1-next-20230519-dirty #10
[    6.120665] Hardware name: AMD Birman-PHX/Birman-PHX, BIOS SFH_with_HPD_SEN.FD 04/05/2023
[    6.120667] Workqueue: events amd_sfh_work_buffer [amd_sfh]
[    6.120687] Call Trace:
[    6.120690]  <TASK>
[    6.120694]  dump_stack_lvl+0x48/0x70
[    6.120704]  dump_stack+0x10/0x20
[    6.120707]  ubsan_epilogue+0x9/0x40
[    6.120716]  __ubsan_handle_shift_out_of_bounds+0x10f/0x170
[    6.120720]  ? psi_group_change+0x25f/0x4b0
[    6.120729]  float_to_int.cold+0x18/0xba [amd_sfh]
[    6.120739]  get_input_rep+0x57/0x340 [amd_sfh]
[    6.120748]  ? __schedule+0xba7/0x1b60
[    6.120756]  ? __pfx_get_input_rep+0x10/0x10 [amd_sfh]
[    6.120764]  amd_sfh_work_buffer+0x91/0x180 [amd_sfh]
[    6.120772]  process_one_work+0x229/0x430
[    6.120780]  worker_thread+0x4a/0x3c0
[    6.120784]  ? __pfx_worker_thread+0x10/0x10
[    6.120788]  kthread+0xf7/0x130
[    6.120792]  ? __pfx_kthread+0x10/0x10
[    6.120795]  ret_from_fork+0x29/0x50
[    6.120804]  </TASK>
...

Fix this by adding the condition to validate shift ranges.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index c81d20cd3081..06bdcf072d10 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -143,16 +143,32 @@ static int float_to_int(u32 flt32_val)
 	if (!exp && !mantissa)
 		return 0;
 
+	/*
+	 * Calculate the exponent and fraction part of floating
+	 * point representation.
+	 */
 	exp -= 127;
 	if (exp < 0) {
 		exp = -exp;
+		if (exp >= BITS_PER_TYPE(u32))
+			return 0;
 		zeropre = (((BIT(23) + mantissa) * 100) >> 23) >> exp;
 		return zeropre >= 50 ? sign : 0;
 	}
 
 	shift = 23 - exp;
-	flt32_val = BIT(exp) + (mantissa >> shift);
-	fraction = mantissa & GENMASK(shift - 1, 0);
+	if (abs(shift) >= BITS_PER_TYPE(u32))
+		return 0;
+
+	if (shift < 0) {
+		shift = -shift;
+		flt32_val = BIT(exp) + (mantissa << shift);
+		shift = 0;
+	} else {
+		flt32_val = BIT(exp) + (mantissa >> shift);
+	}
+
+	fraction = (shift == 0) ? 0 : mantissa & GENMASK(shift - 1, 0);
 
 	return (((fraction * 100) >> shift) >= 50) ? sign * (flt32_val + 1) : sign * flt32_val;
 }
-- 
2.25.1

