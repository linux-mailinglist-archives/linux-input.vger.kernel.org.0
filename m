Return-Path: <linux-input+bounces-98-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF07EED4A
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DCB51F2613D
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B0C101C8;
	Fri, 17 Nov 2023 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nYaU1ULw"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EAA131;
	Fri, 17 Nov 2023 00:11:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCcBihFiMgD9B8KjObugms6UZee/nFNIi+h35lYCxoRAeOn993OVw1+pun0M95iU/c4+ApZBjxEP13kld2F/euqiDJxWmH5Df8t86RWTeKzmvNt94mvsVwRxV9zPmRatMlFs7ZgYb9/hEI23SrM47clzf6ZnvYxnmjdBS+2ThoTmsuWDe1/cLIjI1YrcS5SNYPRV/gsMXkqv9bQ7j7TzzvpGZLGK/YU/YPKh6qFcdUAgSrb1ZWm8NKU5lt1wat2OmiKG/JXs3GpLQZPOjeLZCsYeWuaVxbmjSrHsWXSKsyXj77MBq2WkHOQu+GvZ1I2FOGh9/6r69dO58s3JPCJUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRyjTJT8za0x3q3C/gUcZw7VOzDOvEEwWCzGQCYMafk=;
 b=a1em5xbOf30UmuJ2NZg91hg+QmXrA2vwowNuStfGO7avpwE+r6jfjMLQnAiTC5aNjLP7UzfV8pAsMUDaGPVoCzEIkIvC3tOItBTPU0cF8R/EezgYQhD4Dtr2uFxwnYXP5TrBTNwShWwhoa59/9bYihT1UYZ9xmvFxZAC7Po750BoWFc36rFTzLbNNd/CouTg2OmAySkhM3eJKSD0yZ6e/LG5JECzZsfhNJsNlut+q7phzv4d90aVISMaQjUgu6fvumLHz1w6S7bV83M2tKxmOp0apWbWsL6xkLp0zGknyqqY7NRSisotO6kSR7VMBK0qIVl474uVR93ACk1kdWkQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRyjTJT8za0x3q3C/gUcZw7VOzDOvEEwWCzGQCYMafk=;
 b=nYaU1ULwwq8JdbtlZ7pquhEMaQyuq7hFwC13Cx4eY7MmpfDe+agfRcr+YGuKXC6l1XK4wUn6EOgSQ6viav614ciqUn/odIuixNQxRj2iiNNEpHU8pA/nKmGq07XKPY0kzBhbttMfOqJnyEed/JQ+VOyUyyhMc/uPDw3xV2JCmYA=
Received: from BN0PR04CA0157.namprd04.prod.outlook.com (2603:10b6:408:eb::12)
 by BL0PR12MB4852.namprd12.prod.outlook.com (2603:10b6:208:1ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:11:05 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::36) by BN0PR04CA0157.outlook.office365.com
 (2603:10b6:408:eb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 08:11:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:01 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 07/17] platform/x86/amd/pmf: Add support update p3t limit
Date: Fri, 17 Nov 2023 13:37:37 +0530
Message-ID: <20231117080747.3643990-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|BL0PR12MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: 72152348-b287-489e-8513-08dbe744bf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4sVYgGD2OoqHc4zT8j12Cc0xm26xfSOqdAOUxU4gbVyKt5nGmCthGP751pr/WiyXScVLZToKAgzpGG7gJiHjns1zRi9zMG7cDYHMLX8XDuxVd90VytcwHidqgLmCyPpdge8msW4CYoVKvIU5Hhyas2MwrX7PMuE5gZ9kcSwL/wLPNZULD60WlhOvvaPr5z7Myg+YEJnFKQADy09eTr+4tbT6JA0gALhHGBoYzGQV15rEoYcGaYROekWpAsuWqFmNbDnFneHPQ8kikgJev0cYAj/avC2vqVBDc0GjulqhlvmzGHmTYK3NftD1rkIsx0SxKfqavlFZq7UuqKBTzflYlsY32JtwrUBa8pztCknsf4lx+lCOJWJn5cxbYkgYcNQZ6yqP3ZtzotAacBv9gR8flCjzRCI8RmaFQYHnDuvIWKv2P6hlxgKSFY9BVGU/xqKYjKspAMYTCyyFEQDnVqbHQnkJkOiyN3bXwZUnR0brlUowuzdevu3Ar9IteDppedvxdff4f30+sAQjow9YxNac9rq9/0pj0KkdOh0mbgg33cw6Wul12IxoSI9vOtRlVCyTqKN+dlomrf7jtxQjYV6+mqS2iLvWadnOIjn4oWQyq9bDwOxvaLEtRQaZKoCwPPDshsHDRnppAPfQUY+qB8nAh60wM1EHI7Lrz53rMTSrFndWftXEipHGyS78ttmEMJJ71bjM8oCYXfPYR4rtzmmzRbVchEQ6NFXz0QUPvffxYZlF/Gquytbm3o9xuB082gf2Ew/MeiSOff5PeKLGFMpVUKBuINjXzvzMb8PKRKwRFE4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(15650500001)(41300700001)(7696005)(478600001)(36860700001)(6666004)(5660300002)(16526019)(86362001)(2906002)(26005)(1076003)(54906003)(40480700001)(70206006)(36756003)(70586007)(82740400003)(316002)(40460700003)(110136005)(336012)(2616005)(8936002)(426003)(4326008)(356005)(8676002)(81166007)(42413004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:05.1952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72152348-b287-489e-8513-08dbe744bf13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4852

P3T (Peak Package Power Limit) is a metric within the SMU controller
that can influence the power limits. Add support from the driver
to update P3T limits accordingly.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    | 3 +++
 drivers/platform/x86/amd/pmf/tee-if.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a4a73b845c09..781989c7dddd 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -49,6 +49,7 @@
 #define GET_STT_MIN_LIMIT	0x1F
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
+#define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
@@ -72,6 +73,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_P3T						38
 
 /* TA macros */
 #define PMF_TA_IF_VERSION_MAJOR				1
@@ -481,6 +483,7 @@ struct pmf_action_table {
 	u32 stt_minlimit;	/* in mW */
 	u32 stt_skintemp_apu;	/* in C */
 	u32 stt_skintemp_hs2;	/* in C */
+	u32 p3t_limit;		/* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e3f17852d532..9861c2702251 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -105,6 +105,14 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->stt_skintemp_hs2 = val;
 			}
 			break;
+
+		case PMF_POLICY_P3T:
+			if (dev->prev_data->p3t_limit != val) {
+				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
+				dev_dbg(dev->dev, "update P3T: %u\n", val);
+				dev->prev_data->p3t_limit = val;
+			}
+			break;
 		}
 	}
 }
-- 
2.25.1


