Return-Path: <linux-input+bounces-14846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 073FFB84974
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 14:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A71D4A5CAD
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 12:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A13428F1;
	Thu, 18 Sep 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qFZ9vkzX"
X-Original-To: linux-input@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C634BA3B
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198759; cv=fail; b=l61qAp0wKJNF+dxE1sVEVRyrHMId1oe2/U8XxzGw2XcQ6VCUw/Q1G7IL59VTOxYGZ5cIPNRjMoZEcFo1WTadezWwGK3xx4zu06yiBVfwZ4WLLVldqH8COliNimXJo52oCcO9bl+HBlQgpfnRn7VVSdhCeytE08cY7/RfxAJG7Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198759; c=relaxed/simple;
	bh=JbgY42fbHIJpS4L28JKIV4Hx0HBiAnsBFaB0lNZ5FqI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kERuGAbQRKZBxqUR9/0U/pBO8ls6G59hf0DCbWGoH5QeRDVWjoo2hsfNorbUJ4j+Rq/I0zomhtNfdnv+i+Hd+2KoZPJ8WLBuXXw+gY3OM2XlPtqEW/nR3J2JnKoAlYss2b/SmY02NHxkB+EKPbJS805r1fHGx1kJKlFnR6W4ybg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qFZ9vkzX; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6qv9wva0TUSunp51MJ+9XZtAfrD17aUJRuyL5tNlfDYVTAvak4Slkk/x6qJrKLbcVf4yWMgOT6Hesc44x28xfSafb0lYB1YOYrDFNKfXiK8f04DSerhJZ4sjbdQkKO4YoqZVifyIxfMIoQNN1eWDyUPLDdzx1CIQV+nTSknS92JYK7Ti9PdyRhQKv1OBo36fpFhe4uyGWOmJ/mvW+Qs66Iw+Qs+8DM3T6fY32h+kTp7RYs3buvkiLsDAA5DzSc+iCLGGTpkEOrfEnuJuUtDNiwgOz9Jea1IWRaQ/xbkrWsPN5uGNmVWQqVqDdGillQ3My2Lc0djUSRMe4u+ooxcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4NJgnwhCAXGkM6gbQ3XG/NXTYnWrWVbCsgg9Tjz0Ps=;
 b=zSAJDd22FlZhZoMUhmo5Y3tei0BoS2i/6erAgGjAZc2wLMkjuFb6z46FqE0GAx8TmYldnwEJfK9N6GCd008v1mX3/LPUTng5eoi2y+mJeh1wSgqEtqI4vQkMSfLGjrm9ODIu2GqImGwwDy/XU1bBw8GnLQWuytxnklA03vDM4G0Cz0HYrGG4pHMuyLtWo9Ws98o7h5xT0alw4H3FEt+dM4WMCqQylpHz6UHfda0p2LySo9CmWUWjR7Cf+6n9pwYp+H7k4rYywQ622onVwXBNa8ABu5I/j3BJgv+4rt7KaSxIXBnKixT25Y2vfBTRthbKoYVH7TfY6OMe0LgdGA8FAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4NJgnwhCAXGkM6gbQ3XG/NXTYnWrWVbCsgg9Tjz0Ps=;
 b=qFZ9vkzX2MUzBioyMqWVhpDqOhetNMb/j9ayDZMHEKtrMVzCDOVTDvJ/WF73XqH1/X+ZmtWhPDGGyZ37lJ1Vfd4hTx6W26v/7XsvVA7GKjIqXyj0xF1T37AWVe8rE0iyxvk0Oncdkk7GQpKyr5V6WHgNCnqUm067/f61DDsKRpk=
Received: from SJ0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:33b::27)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 12:32:34 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::71) by SJ0PR05CA0022.outlook.office365.com
 (2603:10b6:a03:33b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 12:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 12:32:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Sep
 2025 05:32:31 -0700
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Matthew Schwartz
	<matthew.schwartz@linux.dev>, Prakruthi SP <Prakruthi.SP@amd.com>, "Akshata
 MukundShetty" <akshata.mukundshetty@amd.com>
Subject: [PATCH] HID: amd_sfh: Add sync across amd sfh work functions
Date: Thu, 18 Sep 2025 18:02:02 +0530
Message-ID: <20250918123202.1076393-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 50972efc-29ac-46d9-c56f-08ddf6af718f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QmJpF5yWYGqPHWvRJQi86Bm+vh9VGZZMQreca21hDRE7upCokpa7QhEr3swR?=
 =?us-ascii?Q?JpnIMbaYhKd4To/qD1DKq0eCnwy7N71Nmcb6W5t6H+WoAeKduQLt24IbBhQD?=
 =?us-ascii?Q?iZsXqIyeiDB9ZpyRjiT/OctxuL4Pq+7Tl/cWHoUn+ZzUQPDJ9EP3qQTiI2Zx?=
 =?us-ascii?Q?famrlFvdXQeqZp7N83Q4jC9T7bgiHhfZMAHGGcVSBT/sxyyYvQ7w/VgZqjG3?=
 =?us-ascii?Q?SnRx7/bKw20IC8ke+Gz5Y89HgusUbj9vZ0bPEa1kJcPSFor9r914f1DwV/Zb?=
 =?us-ascii?Q?LxtvIX07v7RkcrpJWgB9EO9O42J5YV2F482MlHY95ds1AjysYWuChPec3lZU?=
 =?us-ascii?Q?I4oytruqihWhPfBfzX+Y8urY4hJzUvqWPRulAzU45WTs/ZPhO5lHelihr8Ss?=
 =?us-ascii?Q?FtMWRpeC/w9jwUAHAzrRyiheObQbxrlnJo7UqPo+fKOGUkNcrDOvx8FaCgIK?=
 =?us-ascii?Q?g9ulh8AqAk0Zj2xWwi0HEZYRxq9fF/nmWU1c5FMjMGhZvzG8KFBsQ/SmCTdr?=
 =?us-ascii?Q?sqid6vnglCoPKFGxjQNQZmptXfax5WDgNXFRTthUA1b5oOQaz4mFqqzqP/e8?=
 =?us-ascii?Q?j3hH6l5y/idjyKzavCpT023jcHLoVamP2Ig0vRe01QnqGF5ji0tDfE2EPIz7?=
 =?us-ascii?Q?7VPMfNoS9CTldVMagcAiF4flg6Wq3CbXjYx8lZef2in/bcU+QryvqygF2vA7?=
 =?us-ascii?Q?89oPxlwUbU/kyoXt9M2MEXO8RgCVTkNHzrgUPdnE5i8l+7CR3fTPzq3rJdEb?=
 =?us-ascii?Q?m86T49X/aaO8paLqrHOUKaJnt/hFrYTze+wKgtu8J2nH1HMkC4t8FAC6sHHb?=
 =?us-ascii?Q?fkoMz1GYr5JVylwRDK8Wu2kb6bDFFya7OpjNFLti7ry57lhJSN/nc0MR4fmv?=
 =?us-ascii?Q?x4Panmv94LcL82OnLAL+BDbMKW2/XZw3w7qG6hUMZNexfmsdXyIEdTIqqlAZ?=
 =?us-ascii?Q?qtS0PBcED0zryLK0Mtm/+MW7GKAW2Rd4d7RILeZgSEr0K61uEA4wNZdfr7iK?=
 =?us-ascii?Q?7OTPP3kX84sAj20jzAnlGPA/riYxPYdQoLiEFvjcSGHUWGZyauDBAgYX0nVu?=
 =?us-ascii?Q?aucd9kqQzf6ju7eXOZH7qc7Qk8zUoELoHtqEsyeCFr++uNWuwguIKK66pW09?=
 =?us-ascii?Q?qNHUnBHYFwcrpEEb5OLyDOrbSnx1zRgY1TE9bT+f1KBOdTigOODhucPPl9Bk?=
 =?us-ascii?Q?ulJwscoGwDytgfLLlayaw2tI+3SKAM8xL9yNcCKtKXVG9RqGgCP4T//LtTxp?=
 =?us-ascii?Q?bVJOmUpg4iDW9AZeNAYznILXOtByeBnUmkvKcSb5irvNLn5NIEzSCRuu1Znq?=
 =?us-ascii?Q?SDmSKwPPrnyYe3Cin5LI7kUFmdQFbeXEDUxs+rZXbHqmSNVM3C2s1FpX0gn/?=
 =?us-ascii?Q?cD4Xx/U6YqaVikLHlaBiYCfgMPTWok/cE3nJ3Gy2lL+PM07YVxIHU18gKqjh?=
 =?us-ascii?Q?BSQDaF2i9FnMdQNpq4NeKmkLhICt8q/y1acPz50OMdI9GklRp+81jlbZtAC2?=
 =?us-ascii?Q?FsdZyw69fUB2+Ofns7xTdgtQYb6nvl3W87Or?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:32:34.0088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50972efc-29ac-46d9-c56f-08ddf6af718f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

The process of the report is delegated across different work functions.
Hence, add a sync mechanism to protect SFH work data across functions.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Closes: https://lore.kernel.org/all/a21abca5-4268-449d-95f1-bdd7a25894a5@linux.dev/
Tested-by: Prakruthi SP <Prakruthi.SP@amd.com>
Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 12 ++++++++++--
 drivers/hid/amd-sfh-hid/amd_sfh_common.h |  3 +++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 0f2cbae39b2b..7017bfa59093 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -39,8 +39,12 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
 	struct amdtp_hid_data *hid_data = hid->driver_data;
 	struct amdtp_cl_data *cli_data = hid_data->cli_data;
 	struct request_list *req_list = &cli_data->req_list;
+	struct amd_input_data *in_data = cli_data->in_data;
+	struct amd_mp2_dev *mp2;
 	int i;
 
+	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
+	guard(mutex)(&mp2->lock);
 	for (i = 0; i < cli_data->num_hid_devices; i++) {
 		if (cli_data->hid_sensor_hubs[i] == hid) {
 			struct request_list *new = kzalloc(sizeof(*new), GFP_KERNEL);
@@ -75,6 +79,8 @@ void amd_sfh_work(struct work_struct *work)
 	u8 report_id, node_type;
 	u8 report_size = 0;
 
+	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
+	guard(mutex)(&mp2->lock);
 	req_node = list_last_entry(&req_list->list, struct request_list, list);
 	list_del(&req_node->list);
 	current_index = req_node->current_index;
@@ -83,7 +89,6 @@ void amd_sfh_work(struct work_struct *work)
 	node_type = req_node->report_type;
 	kfree(req_node);
 
-	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
 	mp2_ops = mp2->mp2_ops;
 	if (node_type == HID_FEATURE_REPORT) {
 		report_size = mp2_ops->get_feat_rep(sensor_index, report_id,
@@ -107,6 +112,8 @@ void amd_sfh_work(struct work_struct *work)
 	cli_data->cur_hid_dev = current_index;
 	cli_data->sensor_requested_cnt[current_index] = 0;
 	amdtp_hid_wakeup(cli_data->hid_sensor_hubs[current_index]);
+	if (!list_empty(&req_list->list))
+		schedule_delayed_work(&cli_data->work, 0);
 }
 
 void amd_sfh_work_buffer(struct work_struct *work)
@@ -117,9 +124,10 @@ void amd_sfh_work_buffer(struct work_struct *work)
 	u8 report_size;
 	int i;
 
+	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
+	guard(mutex)(&mp2->lock);
 	for (i = 0; i < cli_data->num_hid_devices; i++) {
 		if (cli_data->sensor_sts[i] == SENSOR_ENABLED) {
-			mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
 			report_size = mp2->mp2_ops->get_in_rep(i, cli_data->sensor_idx[i],
 							       cli_data->report_id[i], in_data);
 			hid_input_report(cli_data->hid_sensor_hubs[i], HID_INPUT_REPORT,
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index f44a3bb2fbd4..78f830c133e5 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -10,6 +10,7 @@
 #ifndef AMD_SFH_COMMON_H
 #define AMD_SFH_COMMON_H
 
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include "amd_sfh_hid.h"
 
@@ -59,6 +60,8 @@ struct amd_mp2_dev {
 	u32 mp2_acs;
 	struct sfh_dev_status dev_en;
 	struct work_struct work;
+	/* mp2 to protect data */
+	struct mutex lock;
 	u8 init_done;
 	u8 rver;
 };
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 2983af969579..1d9f955573aa 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -466,6 +466,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (!privdata->cl_data)
 		return -ENOMEM;
 
+	rc = devm_mutex_init(&pdev->dev, &privdata->lock);
+	if (rc)
+		return rc;
+
 	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
 	if (privdata->sfh1_1_ops) {
 		if (boot_cpu_data.x86 >= 0x1A)
-- 
2.25.1


