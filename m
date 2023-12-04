Return-Path: <linux-input+bounces-441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83560803061
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0947A1F210EC
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6597D20DD9;
	Mon,  4 Dec 2023 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YymgYNTu"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACAF85;
	Mon,  4 Dec 2023 02:36:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuLZ+uYSUeCeLQymGWBlyJhTRgdqT3HFDNu27MFmBtIuFUrDUnarvrMxBXQVLKxfrHGq1JyCtJORnwKKeMojj0lcn85pRa3YLNnN103x7eKy8xmupw4dYK7177MQTvc+sVArOjJ5MvWoz42IjMyPzya2Au/gND6Ki5j4rc9xaFiijN/UKP6yzMgMLZ/lin801VmKxzm4Lo2INcgCateL8dtMdkqq240soEDk6JrGj5tELyzUmGII5O908jHNSoV7InjXvJ3DU1E+8abSp99o6F6FCib4Az7nyTah0G5H16fOnku2BExx0aAWMkRgCovLXxlY+12mZo/A34PIz6eqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/YbupjGoS/lgXiknOa+geJjoTcviN3AVo7Z56beCcE=;
 b=TOhR5pCMLKUsHEo4af7UvIoF286AL/1STfi1xwfHw8pBbEjx6Qj1R9TL4HKX9RQESWMssLRn74nlvY6VY7RLAL5HCtDrJVGmf+pd/c8tmEXosVnWGeeNunL4esjZ66akeQam02Xy7VS1mYeF6F7Qzi9kfqmr3oWRRP0cz+5UCAaRprh9X7yfz0b41SN7rBy1cgCeFWRmEUsMI7NhXQcTtjUm5lr4tHZyXsNI8e/e1cuawQ9J4sVWIxCMDUhdng4xX3X7oSYGThb38NRqsB5LU0iN00lmIE9UDG356MwT4TsqaddiHncal0+2LKsDX2yEbSoJNZNjfWQTMi8g8Px0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/YbupjGoS/lgXiknOa+geJjoTcviN3AVo7Z56beCcE=;
 b=YymgYNTuiDVJtypOaaEZidKRW7w8D/6XYG3G0JhNWVRPQHpQNPHPSQApsWMT4DwkS5pw5uP158yLcnGz1EdgkcZNOWb8CGE3FJ6BMR9hB+yXw4o/X5UKMwUJ5FUYPmAjaUc0yPISGhNbSSCaNkyo41JJcf3Dh9O13rpE5vC0Ejc=
Received: from SJ0PR03CA0030.namprd03.prod.outlook.com (2603:10b6:a03:33a::35)
 by MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:36:22 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::c3) by SJ0PR03CA0030.outlook.office365.com
 (2603:10b6:a03:33a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:17 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 05/15] platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
Date: Mon, 4 Dec 2023 15:45:38 +0530
Message-ID: <20231204101548.1458499-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|MW3PR12MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 722bf79a-bf54-47c7-8e3f-08dbf4b4dbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4LPpl0zfANn5IZ9J8L8ttslRszn4TeAwn0ZYJKekkpXWpzlnBrE7Hfq0oMIaylOGByjoLo9oHSg1WMTIXT3QwaiV3EEYHVaCaTj1t70VeyBpgA/AQIcbJsgwl1hjT9wFxvs3kIAWXBKguJ36w/qdX62X72PDsUkh+kb1mkt7wdV7Uieu7ou/Rblv0LcxKkuODOQbAbYICZ4jiswc7UmNBDVPU8yFuwTq5ecFzS7pi2buzrdayHjMsPza2aemtY2PL3W7pwbbzTcARc1ReYOHJoT+lT+6FIKB6oybYEGDSM5xUmvLzWQpHX8vOUHVis0FcOElXnD5kwDRMI4oLrxXkyN682c3cK1Z1jCgnZVOWpSfU0JaeA4D0dZOjYYwgGgSkLc8pduLYZuotRXA99Xbt5td0nQKl0vcCApP86OkJmAYk+1ld6R/6OIUESCpXg0cgUeYd6qg8vrN+BL2IydfGppvtByuqtgsAjG0o4GRCZ9K0yLTo0vh3Pa7pyr1QHKPJ15QBJxgIdNddUftnlnp3zHvMa3Gm9O0qDxTuvXIxl7ROS5ktOCGiySDqrnrAVBhdqvnXqm7u2g02TAQ0aa/fzONWs8dNwO1i2+IM8ydv7EwFiVNahfxvo33vwDKEmnpk7XeDHvt3ycYbUSjJsOUz73uk2ImUrYbI9CjEWRATImn6mAKhXnWJCZkaUiYCqSOYji6tGfsV8pLTTZ1QTPJDYd0gTZCI4R7R/4cFLQaPZNbkSDq58Ko/1t2gj+xRA/VVgaqMNUdyLhRN9D2tatwFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(36840700001)(40470700004)(46966006)(6666004)(2616005)(1076003)(7696005)(356005)(81166007)(47076005)(110136005)(36860700001)(316002)(70206006)(70586007)(54906003)(83380400001)(336012)(426003)(40480700001)(16526019)(26005)(82740400003)(8676002)(4326008)(478600001)(8936002)(2906002)(41300700001)(5660300002)(40460700003)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:21.8828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 722bf79a-bf54-47c7-8e3f-08dbf4b4dbb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4554

To sideload pmf policy binaries, the Smart PC Solution Builder provides a
debugfs file called "update_policy"; that gets created under a new debugfs
directory called "pb" and this new directory has to be associated with
existing parent directory for PMF driver called "amd_pmf".

In the current code structure, amd_pmf_dbgfs_register() is called after
amd_pmf_init_features(). This will not help when the Smart PC builder
feature has to be assoicated to the parent directory.

Hence change the order of amd_pmf_dbgfs_register() and call it before
amd_pmf_init_features() so that when the Smart PC init happens, it has the
parent debugfs directory to get itself hooked.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c8f6ec4c2e2c..4b8156033fa6 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -442,9 +442,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1


