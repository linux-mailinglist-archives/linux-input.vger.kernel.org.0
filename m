Return-Path: <linux-input+bounces-1901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF51B854BB5
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 15:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A991F24F48
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 14:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3FC5A792;
	Wed, 14 Feb 2024 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UhJqhnFK"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3EE5A79D
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921727; cv=fail; b=jDnYV0IK3fZFAEu3AyCGiI823xvnAqGjsPghMU7xozq3hP1Yoo9sEro4uPHU2/bbEBCjDYwGDSSQSoCPZip/MX+/Qa7KwMVvonH4dKkmnrxFNWphlSaSVf2hJVGKH/rqpR96fXtz/MGen4lKTuWVaeelrExcgx/8ihQHxHB2fqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921727; c=relaxed/simple;
	bh=hty8eJr0LgwC9SiL0tfuzDYZ+C5r/By7NZjn8ss7dmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4EbczPY8b0x8SO2yUYkQ1lcTHWYAPXkBX2OaVL/Qaf5jXdjxC8wKztjEtbw9bROTCbf1XbMsw6LPY2FLyPVuYXSJKjnSi5QEJgGaV5/pgTxBxJKGsMErPMST4uMvQR2jDkTBiZoy3Xd/9juT730O1FE7BSNIHNF1VMqxgnlaSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UhJqhnFK; arc=fail smtp.client-ip=40.107.92.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KW7TcMotNHJONuP4CIKmqmOsxHhri8gw5J4b5xUREYhK4WiePI0W4va9ckY7PAIXSlo7Lv3I24OO4X+5wnOTUsfCqWDCKwJUR5Goa7X/W55ZDVyhSLeKViKazCL90BLULktKorQBg3PLH5lS6Ru/WL91bsMnL+y+Uy436ZAFJOPH6coRtdNgkWLKvNK6CP5Hg08/rWr+9FfN7xMj+Lz1EF4qkV5wSd/feQNAEbHPUqi7cBGB1S66HOargljdisl/HRV80donQT+CZvQfkRgFYHg+7aiaNnptr7mxdxPgqVay6nJ5ybhYBNnVFcBkGfVucCJFWkjNI3xzzCzOMSNMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1OxhpFc++XK/nLUchqmsYn4NeX46acCWPZhpWJJd0w=;
 b=HZHdTVnBZ67K/R/+fnXaYrrZtXgHtDKBIR8U1bMX2VE57gdKWbJqs7JO3XoHGKwbxezHeq1gXpBc1CDUEphragMudWtXQI3zOjju4+oCYbiXVM9xAs6f+kWfvKosLFNbJc57ka83rHIn2+gaomyBlQKrQ9Uj3bkPHlz0kA7ySHitn52FHRKGKgQMl4uTfE3y/RaXieDMrPvfbukOZWtqOU91bdb38dWbcx1U50gtSw7wRY19Hp1FigfI0XfnDgTiEYiDs3vH/CDcCo7UcOY7HcFWe4juBAleczo6b66ABZlfJsoalP7vVmcSW54fqFjUNe+2a+ZfYsYJMXzcRXTlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1OxhpFc++XK/nLUchqmsYn4NeX46acCWPZhpWJJd0w=;
 b=UhJqhnFKH+1ewW5IOzlHvczp0xWBzQvUW9AVOSz2eqOUwaAFTaJ1oQTWpTB4E+WTUE6b4THQ7UEAMm0JQl9+9DTMAdNwY7fDh66ZiCv9xf/d8ti0IygsKWlNhp3pMG/EG+gjfl8tNN7hSxugdfusq0RntrhDcEr9yeBXFya7fKw=
Received: from BL0PR02CA0049.namprd02.prod.outlook.com (2603:10b6:207:3d::26)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 14:42:02 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::90) by BL0PR02CA0049.outlook.office365.com
 (2603:10b6:207:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Wed, 14 Feb 2024 14:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 14:42:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 08:41:59 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <akshata.mukundshetty@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/5] HID: amd_sfh: Increase sensor command timeout
Date: Wed, 14 Feb 2024 20:11:40 +0530
Message-ID: <20240214144144.682750-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
References: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|BL1PR12MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: fab5a440-4000-439c-2c37-08dc2d6b1b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hlrEy0yyeokVz3wmz9PK0fOL26eTUQPMynefon9memuSUPjPp1ebokuYdDOFZ7MsGhqraTHj1vzbYtbhfAlJRmkKmgFgqO5UvngbNL//bfMAAw+lqXKuIUMl0x63WWr6M25tqGKo4XY2Q4kD74fxfhIENe03eXO+kdVHbVJm+D/oKebg9kWyaPJ/tV43hAmrIglOQPrRtmk1ezLD25NLj6H4+jt8iW4AZnGQ5bsMwoSbAR9qTy+Lb6WYCUeUu+fGNZUXbEhmgL2ir8nLEHogRCuuUcUMxeB0ry2BM33MNfWI2E/GZD8o/JuXN9l85auWUfo2deBHkGrjoIGgUXdi8dFFe5HLhIsWP5LUp376uA/pZSFLymROusUsCH7qhYBm/kNeVT32PKkCfE/uKdoz4Z3ZLFebgXk4qNNGugiwjo4VIXZW49c3T0ghPu+eWhwUUP+Iex879IWDpO61Q6xkd1PW4jiY5DRO0JUmz2xPREXAHsXIrzj5bM/JhVztdqYSDsRGi0TiyjkhEwMwtdjZQQlQeDBnNVoBkdUhH6Ea3Qop+mKmbSh/KkZlFfhqN9KFPr/QZwuHK82/HD6taSZpEqpoTezQVzgN+ZjppJHSxYM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(46966006)(36840700001)(40470700004)(2906002)(8676002)(8936002)(4326008)(5660300002)(336012)(426003)(83380400001)(2616005)(1076003)(16526019)(26005)(82740400003)(36756003)(86362001)(81166007)(356005)(316002)(110136005)(70586007)(70206006)(7696005)(54906003)(478600001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 14:42:01.9732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab5a440-4000-439c-2c37-08dc2d6b1b29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287

During the initialization sensors may take some time to respond. Hence,
increase the sensor command timeouts in order to obtain status responses
within a maximum timeout.

Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 2530fa98b568..8a4cd793d021 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -39,11 +39,11 @@ static int amd_sfh_wait_response_v2(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_
 {
 	union cmd_response cmd_resp;
 
-	/* Get response with status within a max of 1600 ms timeout */
+	/* Get response with status within a max of 10 seconds timeout */
 	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
 				(cmd_resp.response_v2.response == sensor_sts &&
 				cmd_resp.response_v2.status == 0 && (sid == 0xff ||
-				cmd_resp.response_v2.sensor_id == sid)), 500, 1600000))
+				cmd_resp.response_v2.sensor_id == sid)), 500, 10000000))
 		return cmd_resp.response_v2.response;
 
 	return SENSOR_DISABLED;
-- 
2.25.1


