Return-Path: <linux-input+bounces-702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5680E109
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF861C21668
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F83EDC;
	Tue, 12 Dec 2023 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GWnoUxi7"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC225CF;
	Mon, 11 Dec 2023 17:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2MPIcQJaP7PhEIXHgMk4DaxiAmzncGK+eoW7IsL2kV5bah/046Bjr4KBv29f3CFUwCB1VzrOVpkgaSbIKrC+gG8iN/9nXw+qBh4M8eYbL114QEnqrCCMQ9Joqd8RczhcqNImWZc060SMH6wKiwfGHmz9Bzbq55nfGNpOyE9fVzuvTgAKNQi7g0/YLUjYGkWSq5YGKH4vAnRRK4VFLK9q/daLOnlMo/Lbl1flKCtT3/I9xiNAS7PY1ytfoR26SdOVt75JJHmkmmC3fz3q5l0TTNQQj4PVvknjNyQ+X7dAiO62x1PhuEzpMBjdz8Ec0l+3rsJuX3snFgoIoYMo36zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aOvcnIsWIr/aQhWHC6xiZgJL19W0crSSGhdFTpFuCo=;
 b=B3PeZRaqRZhojs7gJq1ZfntSiQXCm9Do7CIyZPRuTuz6TgyOe69OxNPs8Sjs32W/GoyLxF3I2jLKT2am3ghoFEAEApwaAmFVHQFoF9NBo1/tYfAksEYo9/vqLyXrcxQmxD14d65/zleXPSdpeRgn8Y28g2Kk+TPByi1pJtZCouNbdo4ZBKIqr6rw3f1U9pTa39P7nXQ2wFS/LDOcSjLr5v8QtPRmsnUQRzMjgHqrD/dH4Oj0GZT7jnifZzp6xO7M6674azYui6E9jzH47PPqns6zc9LccHw29Jk5+WoLRroXANW1wpEg3Yvx4dSBH5X60julJYvhnhW1MSeQUj7V7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aOvcnIsWIr/aQhWHC6xiZgJL19W0crSSGhdFTpFuCo=;
 b=GWnoUxi7VIpARkieKxabppr9ytUhtOQ8zZ4lWaQB8QFPPddzaNq+YWXRCIWfqUxwMjVoc4MLAUraMM7uDMJnyKcJO675zW6UI7WIIYKSH1WT6piX369fzh41QahaLLnY4dI774TmQVGwp/2TYe70IDd3knVCs97oYsZpiEMxSmQ=
Received: from CY8PR11CA0042.namprd11.prod.outlook.com (2603:10b6:930:4a::16)
 by BN9PR12MB5290.namprd12.prod.outlook.com (2603:10b6:408:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 01:48:06 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:4a:cafe::cb) by CY8PR11CA0042.outlook.office365.com
 (2603:10b6:930:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:48:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:48:01 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 07/12] platform/x86/amd/pmf: Add support update p3t limit
Date: Tue, 12 Dec 2023 07:17:00 +0530
Message-ID: <20231212014705.2017474-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|BN9PR12MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: e73e943c-fe48-43d5-a473-08dbfab46282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SGDOMpnAs6RL+y5UU0QRyMF8kssX3MDr+UC/03/9tcXELnUHf7dcVmUKKJkz4yuaX+1biDvEcNVDAw6eQrPKesDf9jyq1OVW9DV0qiaJbwD8ZQ6fJA1yIAAPClVLjBwdI9gIJD+muMxFvb+QndUcqxIqhxrGZa1Sv/PONZh+NiTX70qgvPPLPwkxc3PcSfhJY4lzZkjRleRB3nWxaNXxED1FCEOjFsHkTRhOpjUX6CNbo0Tou4knaBBc1CkZsUys27VGV9ZBCSzF9bNSZfbxohkh1BcmTAdbYVhkyeNYNF2AEB5IhIsn2r4xeu+zR1cVRZ6FSZD/SJa0RbcCxx8hwBJ3vUEiyqDZRFOX2HW6EWX5wTDg/GfC+2pKyWcif69K/vOz27j2P36eszZGC7jzYCQWITMG4qf+i0mDXTxmc40ZE0CLrh9C9mU3m1vZ53cvp76oF58JX9jNzCdA4c+p9MFpKVcig1N0TvJPeAuvGmBkQTZB853QhrqvV74jDSNXOL1Mf8fJHS2aKj6FIfsOHMZ2nUdRXafy6uC9pL520HWRsAh4hD+h6xzWh+dvJc0SMDaFZLxN408wpFbP34ku9wjkt7r3oaDr4MnmFwsiYx8RmH1r0cq6TdUb1jlbQaU/pizoIwuSE08mUGg6eepkFmjaDlHCIgzUymKihULyu3QPPcRaldoNho+/7tsIS02B71Elp1lwxkZ/wAwr+S9hIzaR+GWUFHJ7f1d9+Vc0rMNz6MlAXmx3d/VzJYLQ820KZC1dVxvzzUwAqSGdAiRvP30bnOKsGpFaq5Y6wgzczuI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(83380400001)(1076003)(426003)(336012)(26005)(16526019)(2616005)(47076005)(36860700001)(4326008)(8936002)(8676002)(316002)(15650500001)(2906002)(5660300002)(7696005)(41300700001)(110136005)(70206006)(70586007)(54906003)(478600001)(36756003)(82740400003)(356005)(81166007)(86362001)(40480700001)(42413004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:48:05.5905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e73e943c-fe48-43d5-a473-08dbfab46282
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5290

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
index 4da51eb28b6f..37bf1c701361 100644
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
index e96db406e91b..bf8cb98d41ec 100644
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


