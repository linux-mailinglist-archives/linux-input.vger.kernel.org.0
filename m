Return-Path: <linux-input+bounces-444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D94803066
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C584C1F210EC
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFC52233B;
	Mon,  4 Dec 2023 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cg9hVVDV"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2514DF2;
	Mon,  4 Dec 2023 02:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQCWIEpDA8gST80XTZlgyq91cC4POff4KsyvlnE7JNvJ2Y8uuMDc0m+MjDXH5X79qi1OxoActWJYe9Im5zcoJuapoOLpjgm34NjYT5judBursKNN3V0u9DKgfXKaEQqBW4FOvhp14Vic+ml1pl67BkqpeGS/UFinCHYe3vV4eBIvk46mSQdeuDhHo1uU1ytdU5FceC4IfOsZu+EMPNdMDMiJCFr+xE1hVdVizfdEg0KruUanX+ajuIAQBgPXhA0FKqkaQCxjD37Equdu/2Ci2AXrHC8N5ZF96v0R+WR0GnHMcr+2ZBl+fdSVLe5FNHn/XeLGZbyr9X2I9T9Evziq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRyjTJT8za0x3q3C/gUcZw7VOzDOvEEwWCzGQCYMafk=;
 b=ZLJt7ZaDJxGms4iRCxrehOpsPAQo/wi962Py13i2PGTQxQLTpKgFYjEexPZGnFdyrxGy4sS6VZ2xIQkRDf5h9jPhTSmS8m8zeeo8o9YPD+VmVk0yQwDyiIrUT47rzvUt9BBtQKzguIiaIjfAiTrX4MZkNGqEoZbYgbEpwnmmhHh64bkTSQ50ZRk73QtFKfLoNQDlMqCfpGwcHifWtEpc6fJoXbkmxhsMNycXHthV7zG9HFmOyr9uAvkkCi2+K4OXdplJRpzcC+QvkP/NjCclqp8xda8Jb0Dcl/IPKng8IlaRogSXrpvUiFTtm+jVdfX/bseij4Uangg8VzFvstNAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRyjTJT8za0x3q3C/gUcZw7VOzDOvEEwWCzGQCYMafk=;
 b=Cg9hVVDVy3xlNhPuAzuJEByujV9yOjoRwEyXiAK7M26Sh35TwDoywBENg7TaYED8rSgkHcVtLcbTbMO7c+VQTC/oLJE+5EBb60D9yhJOnBYcSr8iIVlH9b3kA6M2ZCuW0YqbsgVzqq4qeO34Yw0dvEoVk8ACFiXhqobKb1VH4es=
Received: from MW4PR04CA0282.namprd04.prod.outlook.com (2603:10b6:303:89::17)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:36:28 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::c5) by MW4PR04CA0282.outlook.office365.com
 (2603:10b6:303:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:24 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 07/15] platform/x86/amd/pmf: Add support update p3t limit
Date: Mon, 4 Dec 2023 15:45:40 +0530
Message-ID: <20231204101548.1458499-8-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: cd96a08f-49db-4dbb-ba62-08dbf4b4df98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eABsnEzxVnPLcVIccS9i3HzGtNyo55/jlS1h/hlJqBiG4U4XE9NgHrw8iV4NzrzZZmgGL6M3adigp7zjpETzS4DI2zmrnDqec2f9MKg/q8daj1g/kII5ub2GI4f1W7CGLY8kjTP6pl74V6/J0GWu4CfKwFPDsahrHnBMlT0tFhFBolY4/CIchLXNXrOdLdnJkUGBcOhcjvsMiRPXnEqBGUxpGRPPrhbD9US/r1XKwJNpOTYwj7qoWuxbqKokLgX/S0i0lFSl2e+NYFbLWJdx5BoajNoecLUmuxxVOZ1Kaobth6duuyrf/0xp5wl2VMuZawwz3Qu82jtvA+59B7FFbhRi28+6QXbxovEUS5uHnuPuh5R87bwaBTZcQ/Y1aAzFzJQV4+fwbLKg3HaladL0nAkvbcQszWRatgjJdAG8p0B3PWuDCpIXN0VsqlQNXsXjkdPtVrJ08di1tg4XNV6NOIWZ86quPR0Q4sqRpQMowXhh/awUiuwJwDoqnDfY4UgauesnQtfyNvA6mj+U/WxRXbJodZB55k0ynEzPxe3Cv+5BNs7CX4SJlaQ+ipz1CXkVKANC37ivgWyK2cYTTrzIIHsm4SJmJ1miNrf/Tbmfky8RJ6bH49wwSFLWGZttcScV4C/6Lt5O1TyRBTzpGTzdnvtvuHekXGmCzWkVha3cKUMKUcriUyljlRiP4wEe0MG9s+bbCgQXJNbOUhELRNtXUKsBe1RNIR6U3c37zDb5Wdg/69zQMmC1Qsc7BAjq7F5PkWqJo4ETExSWqXcEz4gzMoJqF/5aazSIPHBVd6hMXI0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(36860700001)(47076005)(81166007)(356005)(15650500001)(2906002)(5660300002)(82740400003)(16526019)(83380400001)(6666004)(336012)(26005)(426003)(7696005)(1076003)(2616005)(70586007)(478600001)(110136005)(70206006)(36756003)(41300700001)(54906003)(4326008)(8936002)(316002)(86362001)(8676002)(42413004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:28.4269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd96a08f-49db-4dbb-ba62-08dbf4b4df98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260

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


