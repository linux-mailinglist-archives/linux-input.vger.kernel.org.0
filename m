Return-Path: <linux-input+bounces-3539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356988BDC27
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 09:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59A361C2245E
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 07:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4F313C3E6;
	Tue,  7 May 2024 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TldLZW24"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E3913C3DF
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065872; cv=fail; b=pJuOd29xQ5x5+hgOgV4mZhjY7I1J9QU/FbEdaS8B/f1Y81Cyj/xzLJHeVRcxorQ97YS5Dza7HnO5TMYOT5MWQPCAHoxiLWO+fu5ZKVcNLDXjGTyHA0v3djqFLEPpbT36VeS7H+9h/7oxpJH/+GBKgvLCyEHLSr/TdTL9uu8dQis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065872; c=relaxed/simple;
	bh=21o5a64ZFOzxaSeZoT3uZVs88qVvHPyy+sL2H5mu8Jw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFmfWrQA+vEA0qQ3ZoJ1c5yXmHFgQplOwolrYhWk64gTj8EDOidFB6m0d6+fPbc3vU0e/t0acE8SeWmNGdtY0ETLu1QOrSxI2JlnzvKrbatHRivQ0Bv8rpcRQV2wnHq8m9T6ZTC1FwLXsRUeAd6X7wEDavYBa50q3PY+zydd7Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TldLZW24; arc=fail smtp.client-ip=40.107.237.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0A0KyKJFR01QV81Ql8PjrPDB30NkqISjTUOXomjds7wcMTgROmkE1vzDSbEu8KSJ7Rt/YbOhNcuIFZnPpMmKGNIjhrnDzUpP9m7rJRPk6yk4Z0zbKFvNFDxy15xlDN74SDSeAFoU2mg4qwsPZYbM1uaKs0tmcReeC5ds8ICXr4aKusdTLBnqVS6426baCRgsJu4l3nQj8UDPs9SWzTSwlIS27+Q3LY+MSIvIwdb5euEUvIa3ef6txizLQ+LKxfusZBqlVJxyd/yEnc/Oh1l0qBly6t5PTlCGkki7iChjYxjU8GNFfCcfJ0VC7jTZ4X1WGdQTf54ezawt7I0sh6a0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKiua9jO3JHvuHXQyuCs7QMQHoZ382EEpwBox4tuFvM=;
 b=Pur1FTPOQneHTDDPIoenMnD+kF+nza+ENhdGZisEaRvJG49s4f19/Mwo7ectXzOPbHoyTL0CvfY98+SezZ5AL2/1XpX4gbIU8bJA8CZnNAH8DdKea3zSvkZx90OwCdLC+UW1n4NzCGJlHoSY93+GSeAo7oo29Jc0BGd/Fs4p0sMPZ+he6ndut+JyV7fQ6sYAi+xA+uTxP1RrF22xQK1G0seFQvyJHVwKoL+KgwD+X4pF3mBEtIIgXQuLfM/lBuspKrz+f21lIY+YQBoZNiThGabhpGI6j3IUZ8Zy4fFvx/smpkKYMvH2i52CLiIIJYoM3xeDxSi9aa+25oE8sTekzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKiua9jO3JHvuHXQyuCs7QMQHoZ382EEpwBox4tuFvM=;
 b=TldLZW24ZHoTr/27EJsmtb+zTzEypFaDyzrkyE8VrLLI1g/86wFmmitKT/Gk6+ymkA2YmKB1NCyCrZwoMVqQ9xNEimU8r7JPi7nVYXABPpU3WRobbVmVF6wWXt57eoSHLwKjKDCMz3zvvMff9qeIW15Wn3TUPVIaGp270nR1D0o=
Received: from CH2PR14CA0053.namprd14.prod.outlook.com (2603:10b6:610:56::33)
 by SN7PR12MB6767.namprd12.prod.outlook.com (2603:10b6:806:269::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 07:11:07 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::52) by CH2PR14CA0053.outlook.office365.com
 (2603:10b6:610:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 07:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 07:11:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 02:11:04 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <patreddy@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/3] HID: amd_sfh: Handle "no sensors" in PM operations
Date: Tue, 7 May 2024 12:40:44 +0530
Message-ID: <20240507071045.295723-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
References: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SN7PR12MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a95d2c3-6299-4865-7f66-08dc6e64dd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r5hJgjDyL12SXHNvGqd5EB1Lnm3Ipm7mBZmfbDKkgevaj9xqtFE7fH9jMktm?=
 =?us-ascii?Q?MrNzFMCCQKgpmVi58Wk+f/McR26IXJB185/K9js7FHxtiEidqSMlCbwgvIPj?=
 =?us-ascii?Q?VfWOm+leT0PeP4yoLRmRJmk0p/bC3yYiT5bvLauq5hR/mM9qWn4UNjdUquvL?=
 =?us-ascii?Q?48Z3hVUicpAqmF1XWSOFzzrMRZU2Z62qs+n9eQ65h0zJr5GvXE71d87EnqrK?=
 =?us-ascii?Q?nDdkX9L8ItZ336xX3oA3/L0OQoGEdFFqGGzYI2IAqi2JfmB11hGQ4Fb3qG7Z?=
 =?us-ascii?Q?ZfDfkC9+Rm+LJMXFuoFqKxPCDL3/mLLZICNjkA4sj8AnEuXawxUyJnSzF5+o?=
 =?us-ascii?Q?o044Ptp+N/wWp9HkSIMBDYTOYoyCyiWVPJcg7nuyJnkaEnQy18z199w1MO/m?=
 =?us-ascii?Q?2FYnRXCsCnNBEJRB2wmSUqG0qutxUPgi+0ggVER20izlDiJt/qjfJOVOWRu0?=
 =?us-ascii?Q?2Lpv4NxzVTFxWszq9ryBjoXSRYVJuRCT4lPSRtK2Q5TnUIoqSO92HYf63CJn?=
 =?us-ascii?Q?wGdyPxZ5GvCqhsdsTstZoxZtBuy2XlfCOgAKGHJ1bXHir+YmxklS0BCqBFVk?=
 =?us-ascii?Q?mcuDv73ukxtFcFu+8Kk5pTK0IRlOkCB5mhv+IkoHLkAcpUX2CWVIIj3hM+5T?=
 =?us-ascii?Q?vESQUTmY0i2yYehEr3/CW1fGltWth/NMxAwEyvnr3TYi5zA8XItP4zSGC7Yy?=
 =?us-ascii?Q?95/Y204aLMWd8J8AelQ4/Khvztda4Jte7HjVy5Us1rWCaFWSsmsZ0PuILwjh?=
 =?us-ascii?Q?BoiuJS3ETfzkdlRQ5CN9Hid5g2PTgfiFVldk9M/OEeUF2XXuvozRwxdSrhyU?=
 =?us-ascii?Q?ZoZBp7XnE+93D91ICijT+nu650g3HCI4FDfTT1nL69qPQC22AsqvVQ2R71n/?=
 =?us-ascii?Q?V9qKcbNAMpwnCvrAp8zHFv8UKuhtdJxgxUzy7Sc86GoqL+VCsIKTkv79DC4R?=
 =?us-ascii?Q?maXm8KxIL3NfsgoJcdsKl/qm/dlA7vr1EWEgpFYMqteHDo9viTnqkAYy+a11?=
 =?us-ascii?Q?vmmUbn4YrqsE8ojaC+wcRzrI0CASqGDYxakbcWHwVapHrQk95lPxjmIs4fDo?=
 =?us-ascii?Q?yqmLg0iONnlOhQDbrefjLc+b4FL4OqQ/V7IDDBebammlj4YSGfweTTiGBTny?=
 =?us-ascii?Q?G5wk0ghewfIheWLxKzEoL6OKoyR2cVDuRRVg4lwe6oGfu3fBFlho5XsmKklL?=
 =?us-ascii?Q?cTKf9KZP2dRL73A78W0iCSVbRQpfaEfDL4HG7FGQgE5PK27lLfD/Srd6yPDa?=
 =?us-ascii?Q?1l/M9fH6zyE0sTDR5eX7pk6V9RCPyaG/0JfTqEADhOAmCv4sNdZEFIRHxvOu?=
 =?us-ascii?Q?EBy949Rn2FRggjXR8um4idkhacgcQb1luJ0Ty3nNSIdo6WYZ9fUB4/yUzn5z?=
 =?us-ascii?Q?2JZ0Y8xaiqdwiV3yGNOC9QVP4CXj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 07:11:06.6475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a95d2c3-6299-4865-7f66-08dc6e64dd3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6767

Resume or suspend each sensor device based on the num_hid_devices.
Therefore, add a check to handle the special case where no sensors are
present.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index f46f9c670c6b..621793d92464 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -227,6 +227,11 @@ static void amd_sfh_resume(struct amd_mp2_dev *mp2)
 	struct amd_mp2_sensor_info info;
 	int i, status;
 
+	if (!cl_data->is_any_sensor_enabled) {
+		amd_sfh_clear_intr(mp2);
+		return;
+	}
+
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		if (cl_data->sensor_sts[i] == SENSOR_DISABLED) {
 			info.sensor_idx = cl_data->sensor_idx[i];
@@ -252,6 +257,11 @@ static void amd_sfh_suspend(struct amd_mp2_dev *mp2)
 	struct amdtp_cl_data *cl_data = mp2->cl_data;
 	int i, status;
 
+	if (!cl_data->is_any_sensor_enabled) {
+		amd_sfh_clear_intr(mp2);
+		return;
+	}
+
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		if (cl_data->sensor_idx[i] != HPD_IDX &&
 		    cl_data->sensor_sts[i] == SENSOR_ENABLED) {
-- 
2.25.1


