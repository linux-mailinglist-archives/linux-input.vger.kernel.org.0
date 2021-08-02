Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871833DDA15
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbhHBOGI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:06:08 -0400
Received: from mail-mw2nam10on2087.outbound.protection.outlook.com ([40.107.94.87]:56241
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237048AbhHBOEb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO9QY+zq+IwhoIavhyvicvvtOcrgy9tjMmkzcCQgIlyTqtAObWI+ucZQb/sxuhwx68d7098TXl+ffpb9AMx38aPNju635iD1mg/4Q5TYu8+qbTlO492f2OkP4XlFr6D7g9yVkzT20mLWidNCQIJNEnn9F/fGDPbsfFYW6W7yRptzQdfQz8tujuUZGhoLYozZndYYSR/Fs2uNJOtlXGBgdIf3KK8WjQxenaqlcYnw7vu8L83WFY2Xa5srADPf0Fx4paq7H1apzJbEQWKLj+77VPZ/IO+QF5EEUm3jbhxI/DVZ5qf8vlkzq1B5hy6eH1KsbmXWJTDjIVAXQRxn6ekkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhKYGMnrxt86OSThJmI2bNbISvN2gDAqonU680lEemA=;
 b=F56hU3XQOhe/AtmAkVpk//rFWt3tD7xcIc4iK+yIbJfxv3U9OeQxMkrsC99OgVfwqMJxu/ZbuK1btHVBfnjL/XkF/cwY0/+JplwEPosAhL87H8/wh+rHwiFbzjXq5lt5IxlfvQY6Ekr8aVqMrZys03DXH40/8+f7WZnzUv42Jb2K66D/ved+HEt+nk25g5QorqyAkY4Dt754MwrhIEVZQ41uEf6RE3Qb2WTuQTztInCKCHca8r5qWwcPBClsXjg1HgaIsD5pYsTZum6LrFAgK5BidnaC8rlNfTLRlVQofp0R5d8oEYfcby3zgDQEAbrW4k9r2JeZOJYWud6/Gk/K+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhKYGMnrxt86OSThJmI2bNbISvN2gDAqonU680lEemA=;
 b=2jtvpEvbe4mFL/R7sV4+eouNjbF4/UyqvOK/0BJrM7GdZb9+G30o2HSun7UKobsO/2a9w7N2j5To0PJAebU3RVcL265tqmsqNfgpeCh7G5TqqCPAUhDsAKOPU2cjti/W87nQT1VQJILiT43A1E2kzyRC1NldMo7z+0IRyivjCSk=
Received: from DM5PR16CA0013.namprd16.prod.outlook.com (2603:10b6:3:c0::23) by
 CH2PR12MB3879.namprd12.prod.outlook.com (2603:10b6:610:23::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21; Mon, 2 Aug 2021 14:04:14 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::58) by DM5PR16CA0013.outlook.office365.com
 (2603:10b6:3:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend
 Transport; Mon, 2 Aug 2021 14:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 14:04:13 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 2 Aug
 2021 09:04:10 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] amd_sfh:Move hid probe after sensor is enabled
Date:   Mon, 2 Aug 2021 19:33:39 +0530
Message-ID: <20210802140341.901840-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
References: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3528ccc-3758-436c-6f50-08d955be68b5
X-MS-TrafficTypeDiagnostic: CH2PR12MB3879:
X-Microsoft-Antispam-PRVS: <CH2PR12MB387933BF99CA6E0209296643E6EF9@CH2PR12MB3879.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: as+98JB3LzQi/nmx3o09gHjHnTck35I3au1XWadHlbvSbK0aQ6LhD8QjW1dNnbLMAWMByL42aF1ic5qAZ8N90rbTL9pGKyXy8q662QTkpdY28UgjVo8nFT7mHJQdhq69Jfl9w7dG6Ix5a6utrnj/BtUX0GXzaU1DKwV+I/hnQ6xskBobfIJTy4I/Mhhv11DUIyfaIFMstCcq+NC/XbFN0baXnWZ049lq2CoEXbLhImT7L6+/BEF53uXEhPvdSuiaySscpOen8DT0B0ziHCBk4MfD0rHTNWX1G6mz7SGyi0vWXGggzDhbJlDWMcCQU6R+LS85/htwVlxUe3I2WTuYMnf6ZC/1Reu74RPh4Xhz5t+3VSInz4DnIlB0HXScYj3+CnAb3ssSNKH6nVFdOhFwIy42A9rC70ZUkCOx+bvUhlLNVF4El3WOr8hUqHNOE6ZuMSun+ygiTG+VAnXUStwdG/J/HXTdBPW/iP4BUoKgiLchq1w6anI8GRr82lwLn6Ua6f0RMJ0CJDLruLSDMW8pXrQ3T4Wotwn01offC0ZvH8ew6xJfzq5DxRp794quODAo3+6+GqE7iPPdgWnWh7oml2UAv3zEpDQvk1cH/vFtE+iVhtFV59uSUB/7NQNJqhb5rYxxSNiU/2Iyyow+5P8pKib2fD2CwtptDG3Zir82Qzw0B8OZVM23kRLQmAmSv0FM3Ac3LBW4DmhXNHxq4RqpZzKg4UnQYf1vJ2DLrPj7F5M=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(70586007)(2906002)(6666004)(478600001)(36756003)(70206006)(82740400003)(336012)(36860700001)(5660300002)(83380400001)(86362001)(82310400003)(47076005)(2616005)(316002)(110136005)(54906003)(7696005)(4326008)(8676002)(426003)(8936002)(186003)(16526019)(26005)(356005)(1076003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:04:13.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3528ccc-3758-436c-6f50-08d955be68b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3879
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Earlier platforms don’t have sensor status checking mechanism.
Sensors are always enabled without checking sensor status.
Hence invoke hid probe only after the sensor is enabled by
checking sensor status.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index b7b66a1eb971..4982ccf9dc25 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -205,16 +205,23 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			goto cleanup;
 		}
 		rc = get_report_descriptor(cl_idx, cl_data->report_descr[i]);
-		if (rc)
-			return rc;
-		rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
 		if (rc)
 			return rc;
 		privdata->mp2_ops->start(privdata, info);
 		status = amd_sfh_wait_for_response
 				(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
-		if (status == SENSOR_ENABLED)
+		if (status == SENSOR_ENABLED) {
 			cl_data->sensor_sts[i] = SENSOR_ENABLED;
+			rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
+			if (rc) {
+				privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+				status = amd_sfh_wait_for_response
+					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
+				if (status != SENSOR_ENABLED)
+					cl_data->sensor_sts[i] = SENSOR_DISABLED;
+				goto cleanup;
+			}
+		}
 	}
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
-- 
2.25.1

