Return-Path: <linux-input+bounces-1902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A56854BB6
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 15:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD0C1F24E58
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 14:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8343F5A78C;
	Wed, 14 Feb 2024 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t3v1BaCU"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F25A79D
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921731; cv=fail; b=mA9PoaKBnwstUUJODkh+tHdh2p03IPJCCQXQZTJVw8I/BEm6Jms0Z1npo7240Q5ajM+GghQVnAI7Vju6ok07H7IVPsyy6zbqIlNyeEjY8As43ttdXwFWMFe8JOjrjvquPK+Xxk5yDMF12QNouXpRtcjgSBfLSAYkh7njC8YQ2Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921731; c=relaxed/simple;
	bh=SJk/kMCV0c2PatNP2r0l6elVdad4Dyjd63Skh6cRrng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GncyHQGv8p8fa0BXCtO3QuiFutwvMWo6YY4UM2eVhJ9tGH2nGaKlFPm1VwblcuYB/z2l1hbrPG+WUb+DbHvpStqtRGYc9aaPHkA10dhNt8hcBK1bAsx6rPXITM0BaTKZCG4NgoTYtK4tt0XPSBnEOV1sCZbjf+KKFPwZgQG3/oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t3v1BaCU; arc=fail smtp.client-ip=40.107.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byMO9mbdSaq5rbpJshF2azkhDWVArrRjSleoAdzy4u8n3Z9w18FmPxzXdCbX6p/RvuSlS+GK3I/BOCTpCWfSeg9GTx2m1/zInVgxfbNxxZuj4FnyRe4TUE6WwXwx6eeH5Y/cRKvyx5fPhvvhWvHopcOYpopp+xc7FFJSGH0MXwdmFtn7TRuGNvfeJjMP4TnIIjbztKm9SNDPCobWD7a0gl4lumegvUSE6+AWljPCv+VPnreAbI8DayUVmimGmXXre8n79ilLcVYL7pPgfIv5+bR8DEZeqXsN6BhX3krK9iuTCoJQSMc18zhT/kzepSD0nCS59OP1eDAvQeqlz5z1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSxlxbIOWrCO4ZD1mqTgIDx+z44EFV1jRxcR/4lK0xk=;
 b=Pu8de9sZkyYG9RkxlqNYxgjGZk/q8mxeRtl6accIsrXaeFCHH00XT7OXBwdM0FX/6kKgrrSq7PR7tqeEXweBCVhyWBRxNLFSCGt+wU7T4qPUjALbuTWdjbimH39FzBNrNKDUpUgPT5zA6vsrlk32/zZCjj7r9yKerpXhKaWvJbZ2Lc4WTTdOT71mZtVyhunvN/9gLPXTLkPQFCAd/5YsQ4E1ptiAbu+qrTm77r+rMRJNFylloZ+oR31FTEeYsq2y6PuHK+5bpV09QTAIq74a+7qdZzQ4HKQx7KJ5ZEntjfygbcuFp2BsxtSzgpr67nLdir6vJC9IzBwa9XbrEeFgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSxlxbIOWrCO4ZD1mqTgIDx+z44EFV1jRxcR/4lK0xk=;
 b=t3v1BaCUwNLcOuQlifzKK60UUxS356xdbH2WQN+WPFxpr/Yh2LQQjgN2QesbYrZSaqeZKLrEaZsjpDgyRdF8vtYtdEwUognV/+O10I32A+D9mitHVctUQu8lnAHFNZvXCOnxai3EJo7hgbrTRTVUEAcYAyFMjD9YYxdYOXoDq20=
Received: from MW4PR03CA0168.namprd03.prod.outlook.com (2603:10b6:303:8d::23)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 14:42:07 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::a4) by MW4PR03CA0168.outlook.office365.com
 (2603:10b6:303:8d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 14:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 14:42:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 08:42:01 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <akshata.mukundshetty@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/5] HID: amd_sfh: Update HPD sensor structure elements
Date: Wed, 14 Feb 2024 20:11:41 +0530
Message-ID: <20240214144144.682750-3-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 50981e3e-5f54-4bae-da9a-08dc2d6b1e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qZnAn8BXROoH+lBGPHIUrLC/RJCU5GGOnwBBY0PVqIZl7hWMl5igfkNJhOUwcMmMLbcaj0492LmhwD1mp19ghb92TXhBI7611u0PCJBxq9OSojnOWDmJXZKyIBEjQ3Nri7PkLe185nGcFWf4wMLxkcU9YRlvDnuU4qmFbqJtKLDW5Lj2REdXb2AztDNIr2tCSoburQOVZQJ2xX1ZktOdBAJEtSo6HECW5f7qbHYPl1rbeGWkP66KDM2ZHnzQ3HxCONlmM8X8lqptDP6BTVlRwHu69AyLufvLtVuvbwmoJLI27blULqyPkCGwe5xbLgogaycGpRaEGqXcIAM2UBJ/sqUD7Ukp5uPhNd7SFi4DODWGkp8peUMVrFueDjsBVcmmiDeZ27zPp130ej3HR4tsMeMpBXAE9OG+99JZzOx/smEbn8wi3UW8WgRKjtuXBN3B0QV1ec4O4GUC0rjExMWWBxOZHer/VQUBsbhOrJgB6nLVu+D31gxKNyVMcaGVqpHLdyaTiJmYN3nQpMNKZu7nXeHBNBC0PqX77C0Fs1vfCCsUlX98uso9F3H++LWTyFucpf2NvjuWJsOV50Nki/3drzq16NNS7VcItxeFzB4dgak=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(36756003)(7696005)(5660300002)(41300700001)(478600001)(1076003)(2616005)(26005)(83380400001)(70586007)(336012)(16526019)(8676002)(426003)(70206006)(8936002)(4326008)(316002)(54906003)(110136005)(6666004)(86362001)(356005)(82740400003)(81166007)(2906002)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 14:42:07.2493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50981e3e-5f54-4bae-da9a-08dc2d6b1e6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826

HPD sensor data is not populating properly because of wrong order of HPD
sensor structure elements. So update the order of structure elements to
match the HPD sensor data received from the firmware.

Fixes: 24a31ea94922 ("HID: amd_sfh: Add initial support for HPD sensor")
Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 70add75fc506..05e400a4a83e 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -90,10 +90,10 @@ enum mem_use_type {
 struct hpd_status {
 	union {
 		struct {
-			u32 human_presence_report : 4;
-			u32 human_presence_actual : 4;
-			u32 probablity		  : 8;
 			u32 object_distance       : 16;
+			u32 probablity		  : 8;
+			u32 human_presence_actual : 4;
+			u32 human_presence_report : 4;
 		} shpd;
 		u32 val;
 	};
-- 
2.25.1


