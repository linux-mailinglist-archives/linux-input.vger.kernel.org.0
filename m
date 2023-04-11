Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279686DE0C3
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjDKQO1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjDKQOM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:12 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E637DB9
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR+V9sp5tLStdMF3IlLe0yeBFYQ/IGye32dq5pzpl1BkG4dRHL3SiNcySD4R1ppaGsXk90yi4Fx5iWcHchUQzvv16JuN/S3CEi+cf//PTC7SUDxzPuMvfAltPEAUV8z12FiTP/PTaAIfy6Ej8Uog+PAsq4mdu2TztmuJ0ZhOyjukNFlABpadKP+3FC09cUg7m2a0lqliuia1dc954HdQntBkwM6bft1zMVhToWTs2lhOx9gLi0vyAQ9HquLbdI4ItL4X+rSIi1ePhs1YiCRg14okhP62za276/I+ARaye2MkJTU5DkFp60iAHWPgOGyAcyHwM4n2EtScHIzbMrVXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/ZR0rzUOGijyjY/5dCl25yg6J1YZcZ76HnP+s/fN9g=;
 b=I59VvkhmMW9drzp5vwriVMYSn1VtqvotmRGp8ifDT59ANuEnnoEljQAqlAaiDIwkZF7iqpqIFmmB7sKRJt+0oXrUOjkdCckdA5H0AJcBl9FL+uQl0y2hjBCFhhHuU7YCCcb0M/vFz9sS0sJLZv/ydRnu3hZuQakkWhRqbDvdFMOIdI0yxYInCYKrZAPhtx7QnH+qFE6dSPH/ZrG2JVOUFGf9GiW2byGwiuF8PdVNUOZM1/gdrmXbMmmFW2CJ7ExVQD+sWzyv/gS0XEbZo0CEYiYlTJj2vuG8apo/AZ6aoZiw5JA4ypBPmWYZ7tlgMOmnXGo1TLV67jfIu4ywMGodcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/ZR0rzUOGijyjY/5dCl25yg6J1YZcZ76HnP+s/fN9g=;
 b=TUtyZDAMMdffrR9yW9YzzdBuCca0GdS8kyybTLaqrYtgvbR0lyKrhNJXfc7z9L6eGGFmCK1y0qf6oChVlUKzF4e9q2RfwLoYlvsLU8+H2wsTyXFq5bk3ygqcijXfykC/o9mi+mHw+pv9CznYaSFKo+u06NXLeeoQFYo1PTw0DPg=
Received: from DM6PR04CA0028.namprd04.prod.outlook.com (2603:10b6:5:334::33)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 16:11:30 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::4a) by DM6PR04CA0028.outlook.office365.com
 (2603:10b6:5:334::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 16:11:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:28 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 6/7] HID: amd_sfh: Increase sensor command timeout for SFH1.1
Date:   Tue, 11 Apr 2023 21:40:29 +0530
Message-ID: <20230411161030.909350-7-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 74876982-31b3-4d8c-bbb7-08db3aa76937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpghNTIJBZ3hITJubOFNplZozLs5jj4/izUWdtl2xV4ueN9kQYXBAimLwdn2exraM2RSZr9zFUJeROKsf32DFCZ6A0rgqlC8xpg2ZiSRK0n9/xE8+SVOkpgKS9iSmbmuiDxkPhar9lNP754ZNi8p2lWQsoPWNBhSe85VK+1MIyWFDGtNfrA9NEKiWP2E+rc5cOZewPZT99jZ9ufdFMKB/6cKLeku1A1lOh1NewmfNhywruFdmAAlaYj7Db7uSllLbDTVTmPY16kf4XsBZ613fStqAMNjFMsPgdP6ZN3aE1htwuOATe+u+BbT/iVhFRBlmLSSwjoxJNpRbPmn5FNmdbYcR+eaGt/YVillxB/xsJhwj4RfLe9QZ7nSkTgsL/Hlqz009ktfV+hzhFLV1b9hW7qy3Dbh+vZ2Hf3YxYT+UpnBdA749zDPrbkp9W1WQity2djPRXKOOvVKYq7ZrBfi22YdvYrMf1sZmOsdb+HZaDPN/I550BXF5AZCsx4M9M+1wjQ9wUL0h0D44Dzf0TK4uHtrzQcSG7Id5rfil7GGUf0R5ffmrvfzw6y2p5aVrpiJOuYn0dJ5MGHleedQywGE15RDmdkV+rZECJWFh8j1a2SfzRyTfGlJMZjt/IYCKGlPMxNge9z/nmQyhZ6WiVeUQg+siMjl88eWIKzWo5yoaOA0lpspMQo+7HVvhvoG0RPx1hEcfgJSYb1CgXRfamnyf65dgGQF/R15x+Wrh9jSnkE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(336012)(426003)(1076003)(26005)(82310400005)(2616005)(83380400001)(47076005)(186003)(40460700003)(81166007)(16526019)(2906002)(36756003)(36860700001)(86362001)(5660300002)(7696005)(8676002)(8936002)(110136005)(356005)(41300700001)(316002)(82740400003)(70206006)(478600001)(40480700001)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:30.1485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74876982-31b3-4d8c-bbb7-08db3aa76937
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The initialization of SFH1.1 sensors may take some time. Hence, increase
sensor command timeouts in order to obtain status responses within a
maximum timeout.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 6f6047f7f12e..4f81ef2d4f56 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -16,11 +16,11 @@ static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
 {
 	struct sfh_cmd_response cmd_resp;
 
-	/* Get response with status within a max of 1600 ms timeout */
+	/* Get response with status within a max of 10000 ms timeout */
 	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
 				(cmd_resp.response.response == 0 &&
 				cmd_resp.response.cmd_id == cmd_id && (sid == 0xff ||
-				cmd_resp.response.sensor_id == sid)), 500, 1600000))
+				cmd_resp.response.sensor_id == sid)), 500, 10000000))
 		return cmd_resp.response.response;
 
 	return -1;
-- 
2.25.1

