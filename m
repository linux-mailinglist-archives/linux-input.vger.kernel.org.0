Return-Path: <linux-input+bounces-3537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE58BDC24
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 09:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE955282285
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 07:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052FD13BC1A;
	Tue,  7 May 2024 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ClYdi5yd"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE213B78A
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065867; cv=fail; b=PiO1y7ZjodWrY3JFqVRMMVRV/5+fdsjiHfLmBOFLjetUmtp5959OtQ+/tY9KGBNGBDcTK78hTCrNFUE+Ck2iEehKvFl91/4cWwADSRKMcIJwT0efAeyF06BpDhwW7pteXPq4ElbFyMjzUn0Xs/3GA7rsAkcvbx16+Gy1yaQLd/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065867; c=relaxed/simple;
	bh=IfGpP/efiQvU1EWEEzRGR9kEzCxj8WvkXGixc/y3eZw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=plwk7od5ZG0MUd9E+2+2I36ZuariOZGrqx3qMfbiGrbpbHcdDBaLlwAyvEsaYitY0rPFtjR73EXRrbIn3PCn8fdNpCBkjZobfS4qyqkr011BpGKhAHxM715bp1GfGxFkpHd7SDNok7u6g75NE4sPK6++RjvH3mLWF2Tgea3hi0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ClYdi5yd; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRSahSwAvDFG8yjzzbtKD4wpC6jwbGSIEt/FlifJQ2Rn4fylCQ+ZQIaKc8pnCxtU7hLpfS3unEfZa40G2Vaf74BQ8ngigqwTfopnl+IfWpABaRKmYMMr33KPVwN0pt2JrBKbCUiAMuOC0eLOcyFvvcy0hkXefxM5rK2a6BMSHUbj8/UE//KmKYngTV5oUaN0w5Zo3Y0PcXLdDcAifeczqzZXBiwhDtN3sWcYIWg3hJLkqPjiz7HamkUDW2bDYJ1QAcBhbwjw7Ga9P7M2YPs5zkaDxKUPcv/kYpDs2eKbll4yC88gT88duDphqZa3JPZzrwNyGUQZKgjhYUuC9ZZcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgrT+TvzeeSQ1Sa+cFRt/GBCYZLye3c1BZWGlYmdcPA=;
 b=e3NnCpdolWDC7HWiYhvj1tRgs43s5t6vxopPTHqJJlT4ZfTG8pWnFS0P5lb4Z5SQ4XFmteJRwWIfB1zgKj89dFkb+02+Muli9IjVRNWTdJ3l8RLTJUX1T6BohLJ4GrFHuBxvoVqNpF6ka/vsb+ETARDOkFPQnW+J2TToJ9lhskYK4sFI4VItWhznqZGymHMJj+KaEAm6csV+xk9MNnnCnc7igM56AP2hM7dHwrjzVPovc3+Jp62NWXRXvbTD2ukoHFVNBiTj2Uhx3mb6CzeHYcM6HQanlOrs7MGiGyhOtFI8NiVfX5vz89M7EPFJEe5X/iQdnC9+ZSdGx3MM/G3Fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgrT+TvzeeSQ1Sa+cFRt/GBCYZLye3c1BZWGlYmdcPA=;
 b=ClYdi5yd/3FCJycn2q6yqwq56Ohp4t71So8yHNZZZJfjN8HbdXPkh2Hss5hJ8hhoHtahXEZUGd/79hCb7wgPzRvTfW49Cob9/URXS2Segmze+Td1I/t530lNQZecYhQpaIt4Kg2VeUTeJ8OpRl8KsVdVhURV6qgAwlnPITNlSz8=
Received: from DM6PR18CA0025.namprd18.prod.outlook.com (2603:10b6:5:15b::38)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 07:11:02 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:15b:cafe::90) by DM6PR18CA0025.outlook.office365.com
 (2603:10b6:5:15b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 07:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 07:11:02 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 02:10:59 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <patreddy@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] Fixes and updates to amd-sfh  
Date: Tue, 7 May 2024 12:40:42 +0530
Message-ID: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5f3c0f-c36d-4740-d814-08dc6e64daa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cF+rnCCjKrn5Yq5oWNynizwYKWe7xcb0qjHUjEprh0gUPqxClPSQkXNyWbd+?=
 =?us-ascii?Q?JXAT4kxDqtNRT/BBpdfWB4RYevmhWOexluQrnx4CLmhKZck0bNorRRXl5+Wm?=
 =?us-ascii?Q?eG6cvOYM9Z/AhmLLqghRd3KNqQEPyIztdaja0/iAmPQ+Yot2CKLGFtgFbmtk?=
 =?us-ascii?Q?jzIQscTy8R3w3BZ7ukKMKN+afosLaprxLLSPP64r/QjbQSEB9fLzcZjpKK4T?=
 =?us-ascii?Q?/vl/EBdqp3ZRhrodzjmEt3XoflmpZAbGYUOWIj7ZoUWXLXQHeCNbEu6303E5?=
 =?us-ascii?Q?V6QiqvKrozcnmoE2Eudm9vsBDiXpfOUhiO0S7egBcTz0GXhhzxI8bR2Re8Ey?=
 =?us-ascii?Q?744PL1X3qjXCra6T6mW0zPB6m010DpS4b8tSrysLgVmaPp163zcv58SVf4ed?=
 =?us-ascii?Q?TtHyLgBaUiBpFngWSqozIQYlwv3/udOo0PePW1FKMF42HRVcZMUG9w7SghtH?=
 =?us-ascii?Q?+lZ2NSrwficxT/A69F7FIDIu/oRb+McXPakLhXRgGsF8g6761rpaA+4OmPPs?=
 =?us-ascii?Q?unADq7IunVrPyKbOQQENXBjD3KdOpwBjcaKdNm4uC2tIGPsKkr52LxhIJgzd?=
 =?us-ascii?Q?m4TxiA/05Tr9M/bAvJBtTjsqkihp0du0CYaM2TAQDSv1lX5xRXKpu10vCN4k?=
 =?us-ascii?Q?oGVAirKhkhf1bzh5U1+irRcgqs787oRgs5eYg4uzsEFz7QORYr1SnQStIxmi?=
 =?us-ascii?Q?apCzC58pIxvHp5Oz+zTEv/o0xozFPvW8kpV9dWkHCvL9KIcVKE2tG1wrx11M?=
 =?us-ascii?Q?32cTKKbQ+lnO6KXHHUmZhOfCScVAfnp9bEu6fP3phKKmfBwAxJOQSVLwlwGi?=
 =?us-ascii?Q?2o8QUXgTMFs7TWnR95n4XKzxMPrfyI1tMuhp9jGuQreBZUBupQ0qIlYrgIp2?=
 =?us-ascii?Q?ELa/z5tohzxGzca6g+3L1TUM/RVXJgq6KqUyxdIRdkwbZKMBJntjoleUCVa8?=
 =?us-ascii?Q?RTChJSrKONSPFsxlXxxIG1sa/LZeC+ek0YDV8qqDI3hSK+Qxb7MY51zLhTeP?=
 =?us-ascii?Q?8jZqTpvWaqhZcyCM3LZojunuHqH7NaM5qxGqCmBVMdJAlJ2ucqvxZgiT9qA8?=
 =?us-ascii?Q?15ZncrTUr9yKjUAli2iJE9fDOMzyyTOo3Mr6Yckl+p9WSHjCXa99z+4gP7X9?=
 =?us-ascii?Q?u9l86OpEFomTgY2hsM+nti6VMNLtoQ+B6MwBERvfT8+g1DELmhs0P5zuPc41?=
 =?us-ascii?Q?uwwDAAAvQkgyUzsCRKVKNmm8NVrZA22P+G0xKSWwa9oOlrThN3om/oL05MSE?=
 =?us-ascii?Q?0Rt/spZuzulY2lOTnNXLM354Uae3l92nBCo0Qd/X5wljEJNNtSktqLrRIYcz?=
 =?us-ascii?Q?wcGo30aAfEZ3tfBeuKvAaFPpMfIJtaz6iMj65jOYjW6tKFSQMn8j+4Uw7hf9?=
 =?us-ascii?Q?iwWj9wzyYzOkyqlAteImOV+44p/H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 07:11:02.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5f3c0f-c36d-4740-d814-08dc6e64daa4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611

This patch series include changes for:
- Modify and log errors based on functionality.
- Handle "no sensors" exists in PM operations.
- Use amd_get_c2p_val() to read the C2P register for compatibility.

Basavaraj Natikar (3):
  HID: amd_sfh: Modify and log error only if case of functionality
    failures
  HID: amd_sfh: Handle "no sensors" in PM operations
  HID: amd_sfh: Use amd_get_c2p_val() to read C2P register

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c          |  5 +----
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c   | 17 ++++++++++++++---
 .../hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c  |  2 +-
 3 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.25.1


