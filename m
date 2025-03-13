Return-Path: <linux-input+bounces-10753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09281A5F345
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 12:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D8719C278D
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 11:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1922A26AAB5;
	Thu, 13 Mar 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Auek6UZb"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1816D26AA82;
	Thu, 13 Mar 2025 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866303; cv=fail; b=gGLvJaCwU1B1YdF8q4IJAS7SA4TUk2X/hrwGnuzV4VcOhO4jZUS+bvlNubvu91SmjjOeo4TvJZGdMrM00MwHQAoawPlfb862XA1C+KhwNcNx9ktFE2ho+FIZ6XD9OMKkD4L8Banq9dOp9NgpTo+otUfKAlwiHLue1sE3mTniim0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866303; c=relaxed/simple;
	bh=P3+YM0f5ETW+4xiTeUlwUe1IFK+sgSIn9CRh9WK/06A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHN68p0aOqubKcejxDiUiqBiELrt7GCItU3oYsPm8PjvGgUfNYFpfAAzslPZkcDe6NN1WeYRnNZivv7ca+jtvF7boal0WmDwL5uieNpHN6VPC/MUA/IDetfrTA5gaJJhgCNd3D9Xnc+b+pUHQU2WYfQVlhBiiVEwGdPR5X9shag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Auek6UZb; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4KLjt9BtQXIAcb5/nAPUicXzylGaToD41Yy3khS2XGdqgj5zUD4ndD2S51RYKDOg92qIIWNPkaxePdRoLzczqv8qcYupDrvOpR7vkOr/ykvQ1CUyt0l0ScT5tppbhhpdV897bFH88obJQQwUgMutx3R5xB3jtoPovMNEY8ya+ZOkqDhLWnMqJEs2uE/R79fMN48iloAbM98AED4ezRuuHgccA7W4n3c6fIeVUQts4lzBHw0Ga9JW9tXmEKNBteZ2iqV0pKe9TAEhMqcAy1uKtdW5SioT7bnWeQ1XBAWVgNQx7xqQhehdAljwxY3yM2k7ueQm1mDNyVilrMykG/YuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b4HawMqfhQNkyfgtNHV837DrRzk6LbbGUhuiAJ/8OU=;
 b=DhcD+C5Pj+fJ1FQWzLpZKJhbTnLaFPyDwfpFMJJfgPR9BeJuUKOG4MdmVR5RpHNHXUrJZv5q66nLE+d2FfdtkfRLc8SBfpfluHgA2a/g7+f6mrbhnEYyP717HidyaZfSievC2EEuHocWNBLErYz3AlGAhZc8K8lwN3rrQ7vil11sCoghGxeQR5QHkeAtpXPLaOdYglWeBLU1DSCgo4cdHgWvHCOf68rHLlGxasuH+e0wwMcROzRLy+WcH9pi9QWo5c9bBa5dg2CucVnzSjOO8hDW8h0bHQIRx7CGTFQW7UFVx1JpfbfomyX0HkxLbWf0BZj8IZPPDD9KmlBMCSakNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b4HawMqfhQNkyfgtNHV837DrRzk6LbbGUhuiAJ/8OU=;
 b=Auek6UZbftM1gzEEh3Nc1a6YF+wtKLXNj6SNoDnyLdJF0bzBfLqBZ8JgpgzzkRHrklbQ+nfaUO3PtvbDZSRpFRwoDkscyQH+7VK/vXWofI3KN6VyHeGOcRS60WJ9K5H8Tsc+PoPjqeAQUjB/SG6qJLUwdGyUhblKjqHHKgrudo/rO+3MZMx1IeTiMVXS0p5va7Yo1BNaQFBDflzlnyzMJE4FdtHq2VtIhbuxosZsEnT9N9ybZiIfffgOyFM8KUig61rRFdGGpXvWvgZZmxHYFuVGw4/KfdEAlctRK1LDgA+A6zufYS7oARTsKtUzlKOZT+cZa2hAShQwLsJOdrhWKw==
Received: from PH0PR07CA0106.namprd07.prod.outlook.com (2603:10b6:510:4::21)
 by BY1PR22MB5559.namprd22.prod.outlook.com (2603:10b6:a03:4ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 11:44:58 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::71) by PH0PR07CA0106.outlook.office365.com
 (2603:10b6:510:4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 11:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 11:44:57 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2894BCFB79;
	Thu, 13 Mar 2025 13:44:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: crypto: fsl,sec-v4.0-mon: add optional force shutdown time property
Date: Thu, 13 Mar 2025 13:44:52 +0200
Message-Id: <20250313114453.702-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313114453.702-1-ian.ray@gehealthcare.com>
References: <20250313114453.702-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|BY1PR22MB5559:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3baf8c1d-c89d-4862-3182-08dd62247b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TPZbJJwkC2Dk9iLEZ7JOcBsVRpaPlEVH0iCXDu0FK95g06by2w5Ar3aIPde4?=
 =?us-ascii?Q?zQZLN5Im2xBwOMTxhWd/eZ+VE7yQuRnPqysmeWGI9ScjAI/FidkWJjALKo+P?=
 =?us-ascii?Q?b7Ev2/ChMaXp9iK9bhKlN0m1nkRuttZ/PPv0zIvVa/1liVYZABy0wxZKKiz+?=
 =?us-ascii?Q?AmLa5CejSEMNgtL+eYmWQ9tZGU5tnX69qrQnboVqWueQEYklAI2DjgunLxlH?=
 =?us-ascii?Q?yoXWHJ1nHwAq4XW92UBo71uTe3EnPnylsPlT0sGVY7J42/HZ+nX4/vV3LuHi?=
 =?us-ascii?Q?AK+TELJjQBoSSsrH43XlAwzYiC9Nvzm36Xd77shjM/Usor7J6v5sOPi0F+n/?=
 =?us-ascii?Q?FOrnx/0oOYXqJmMTcvyX2199BSZSzKcOfnZKgZjkvkVm4pu9i12QLU6fRCU1?=
 =?us-ascii?Q?3oTNE19ydcYwVCiyXiNRD4UyUjEhwIqsMLmyNW6lNp+nXQH12e6YJrRkkjO4?=
 =?us-ascii?Q?fC/wgl1fqpha7oYbU+WuqorPOHKzIobI7CG9MWrpXJE7JnpKdMY/7cuXF13z?=
 =?us-ascii?Q?FVCrV7h4+6LwAbAfsSKpCDIwmi60+vdkhsZ0uPStELa3A6NJ4e68X7AfbAXJ?=
 =?us-ascii?Q?udoQjveBQe0CXD7yXEhV7LH2cdcar/skGPCNk/M3/CiSSrGcezzlK/nOMy4v?=
 =?us-ascii?Q?oJGk8Is89NdmTODGt3kJFii5V6o19pT4wnYIu4zN7DKLFi2SPwdHSkNfto+x?=
 =?us-ascii?Q?qldb2e6U7OvhYI8AjbmB3vMSUBL6Sn88HCnEdAC7FzUuZzW/C7mzMib7wldd?=
 =?us-ascii?Q?vtmOWPAI5kxEW56+uvXM9KGqRozTcuyfiqOHV9oxg376DGuRUVpkgtaInxDo?=
 =?us-ascii?Q?GGyiTHiJrE3vkVJfMa3EzbTVfp35GcFnpNYt7f3ccO9USUz7oPtgd16Uo1yb?=
 =?us-ascii?Q?x4d9eRH5ZoXObONrUPXMXOrDl7lDm5sU38lNsaLh3a1w3K4pnZQaa4/TOBH+?=
 =?us-ascii?Q?Ck2U6swyDzxw6CU9Bsjt0OXZ31s5XkGU38wuZpWz6xlG8nzEiP46s3FHbh9H?=
 =?us-ascii?Q?pXLigwn7VfwnnhNOvbnRWp5Ie6iTxdBlg+d0a9lMo4PPXMOGa79P0f6iY1Bo?=
 =?us-ascii?Q?MHJLEZS+pD15s9XRvSIgrl7F/ORwcwl+ODAzrWgR9Q5YVWDR4G/ay4IOyzgB?=
 =?us-ascii?Q?ZNzlS4eSXjX6P7Of80gHcD5KXcmynuTtgB3p0oc+Yz4EIZbZrzuZSosSr2SE?=
 =?us-ascii?Q?RxAPI12byXDyym2rVoA85kfNiXTdVwtDuwY4OivS8pJ93j0vwhGf/UV2Eqf6?=
 =?us-ascii?Q?Uiz57oG946VMLcybhELA/LM3X+mlQCC/gM9eQPBmvhCf/gR6pbQRDYjGol5W?=
 =?us-ascii?Q?0vnQH9lSlOmsIQWVtf/gplHmBPMzVVwpJ4VC3qS8HX70jNTJdc4ofEtlwfWk?=
 =?us-ascii?Q?XptpyELlmMc40TmGjZey0cVoSC5NpBP+n4Y84Ifvht9jei2D8UGluhEY9VaK?=
 =?us-ascii?Q?LAVJiHovZ7scPrhMxpao94lB1p68S3a6p3ze3FBHKkuchHcBzvcMew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:44:57.6024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baf8c1d-c89d-4862-3182-08dd62247b1e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB5559

Add an optional property to configure the force shutdown time.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 .../devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
index e879bc0be8e2..ee282c352535 100644
--- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
@@ -111,6 +111,14 @@ properties:
         maxItems: 1
         default: 116
 
+      force-shutdown-time:
+        description: |
+          Configure the long-press force shutdown time.
+          Setting this value to zero disables the long-press detection.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 5, 10, 15]
+        default: 5
+
     required:
       - compatible
       - interrupts
-- 
2.39.5


