Return-Path: <linux-input+bounces-10854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A9A62A3F
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 10:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C6667A9CA0
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 09:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17C71F890D;
	Sat, 15 Mar 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="bqoGoAdq"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237661F561D;
	Sat, 15 Mar 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031305; cv=fail; b=XJyByQISgfMpCFy7gdWptwXZcR7nrmwKZv/fjIMTIWEv/m6Ftxz+3bF/ZP355xj979wRYzmWW16/XciIpPHbSxN7l1b9p8yU+yOZy6kovy7/6EjR1s7ueDTMaDCfiPHGae1iIENq4FpM7DQNFk8K9p1iTQkUxb+luzGuLnUEJ4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031305; c=relaxed/simple;
	bh=K8PY+wnvNOk3eftydV31oUl3jghTg4SihwN71ivEMfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/1P/GUzQfuj9usMEkQKpXTCu33IQxKbO3LfJ+1RvrJQEayJ7SadZE2zlQx4t8EAJSxKJZiDkJ9Xr7XSd/OWkyZejOOJK6Y3my6Q4bxzPX/HeWzFBCtyIquj/+TE5Id9sLiS2M8YDqQKtPxn4LghsZLBbM1Ay/U2Bn96ujAGAb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=bqoGoAdq; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+eR5V8/UaPlBLa+bRNL4K7zPdnDx8hlXzuibspJgjJgw3WYhb0W46hLjCC6ROp8sLCjakTSsTVql8zXG1WDGkbmzqDsnvc+SFu4lLguDidCM52y7HDQCg6ALzutxyAVOxoijwAdXxOf4U0w9nmmJz8uTW3nhirSijuLPo0+VZ2iW8dX8M5NzyeWZkaic5cb/t09dkCPzBFub89vrR03SByiKiG9ZhPdp7rgmlWCSGjWOGwu8A43iIT81vJ6k8HhXfS3oY8NKdBYIIDGyWB7gjPkR7XN29BaNhKhSHRGJasFqceEOJaeQ8xkA+cpcuy3QI7BIShXKA6unZZFXx1zRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfI0WSGNcqj9pf9bKjfDRflNwnUM3YAXUf7XKbEqVGk=;
 b=lPAyaOKMjelHrsh3+eAl7r0jErLpyN3ogunHoaBrWzEMM8+5WheWUNW6BnnF4brqZZKrnu+2c+/n91TFIrH0pHilre+0wg6FtPEjJEKfn6eDhQFPdjoLMiyfOH1qU+5Gr1d4mAub9A0/634KJL0F0Na5y2YqfyQ83NVNvxPfIXWMOr89VzBDjQ1dxw4pZ00XQl5UQpnGzXHV9dfKr1PgwCp3AGF5VvYlt9ZdqUFG1kQtRaFm+HhYV91WD92AQwIQuMwxDTZItzR1HJy+VG/iOwa4c/TVUeFbth8YjRYDz365VZpiuIq2uqDkY8k+9baIlw73aPBkIaF195vZL+ZT9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfI0WSGNcqj9pf9bKjfDRflNwnUM3YAXUf7XKbEqVGk=;
 b=bqoGoAdqBzXeoEB5UWqB7ovY+N1suc199+eYG325vBDGAn/p+rzqL9T5R9BPEdpM0KHt9qdzBZgbSVGp/UfSuZJc7sMYCA7xs8XsX0qtKsLUrjHjPSLYAHkzxCoYW94beVSN6+h9c5RfDGa4h0WhfhKAv3Dx/1FdGmK7GLcF8hvmgDLsnZTdu19mLO+PVw/IXDdBHihXqhWMdxG/2ckKmYb0VJeIkL4VMJppSAdS38Kye4kAixDvi4brDOago7399gLZQ5xNXdKBGWArDkpdodaYXhC6PEKrMf3gYMatSgtwQuG583R2rFpxxhS9Y8R9WsNLNJINiltwpR+evKreQQ==
Received: from SN4PR0501CA0021.namprd05.prod.outlook.com
 (2603:10b6:803:40::34) by SJ0PR22MB3753.namprd22.prod.outlook.com
 (2603:10b6:a03:4e9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Sat, 15 Mar
 2025 09:35:00 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:803:40:cafe::1a) by SN4PR0501CA0021.outlook.office365.com
 (2603:10b6:803:40::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Sat,
 15 Mar 2025 09:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Sat, 15 Mar 2025 09:34:59 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 16E7FCFB47;
	Sat, 15 Mar 2025 11:34:57 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: crypto: fsl,sec-v4.0-mon: Add "power-off-time-sec"
Date: Sat, 15 Mar 2025 11:34:54 +0200
Message-Id: <20250315093455.1100-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315093455.1100-1-ian.ray@gehealthcare.com>
References: <20250315093455.1100-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|SJ0PR22MB3753:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d61107e-254d-437d-8723-08dd63a4a7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9NaUXq2bPey9qLN6jb7S5HeppMrmZiwfcluYyLiKyMeicOKFSXDbu8sO60R?=
 =?us-ascii?Q?KEghvSb9HFXkqd3IVY7I/ssVRvff4pdwmtrX5evcCmE+Y7wtzArqI8I0hBVL?=
 =?us-ascii?Q?nAOul0MKFJKL1EZvNA1dQCraQ1bFs+5YBSMjG+y0qs2OZmLdh1oSWXK4bEgx?=
 =?us-ascii?Q?cxs/mCLuvCRcpil1h9s2l6HQlL+bSJy/6Kin//NAf1vRID5lUzk98pqutkKJ?=
 =?us-ascii?Q?pwhY8WAs2+SKpNe/aIfXxXranGUjOgqV3buGtkPuTPUbCxPA0lL2bzG43iiM?=
 =?us-ascii?Q?GlXNxsslEWzyZT/urH/EqJzENFojA4Prg2Oxllzt7rVNHoke2Qso9VT/yqJ8?=
 =?us-ascii?Q?i4Gq1oe59wUTluuGlEaCsnGegaHtiyMjhIzhiMEHgHu0r+Ijk0FNoBa67EXT?=
 =?us-ascii?Q?GzV08RxHJ4WBTMngxkJSkbfhKTWIbHMMLByaHuXBDrusk6+vcWpO4NEw7XaV?=
 =?us-ascii?Q?CcBAT++8jY6snzUeEDZrHM3rXrDKAORgZdxtTwjE/YPQnWHXuerYcSMX5amb?=
 =?us-ascii?Q?eK76OaBPpWcglbMw32MRVCq/tz2kj/hWc429KA9wTwGxb6h9LDEJzUrBNCZG?=
 =?us-ascii?Q?KOEogLuhq4NUb8lK+wv91i9fBV+wjBpSexLU2x5P+x45YduKM47wJkU8fucC?=
 =?us-ascii?Q?DMJDcLHpPTUcJuJAfSQgxJmdK+NDDxx0RDuUy56y+Yg4MH5uzdUOjljjbZk9?=
 =?us-ascii?Q?KHKSVfgocgVVwZj4g4eJOgZtFAzyqnSaXzIVEMhPrC5sCP1dOHJjb97oyY6R?=
 =?us-ascii?Q?1L1aFYwkr+lcRRrWC3cvfZxj7HRzQ4ZeDvEIf9hNuEWel1TGEfGpGle3+1JT?=
 =?us-ascii?Q?gZYmHq6DmG7omyO8GBOFAmIR/6l1aoGaxxzKEiXN6Tg3hB1swPWFQWMuKcfx?=
 =?us-ascii?Q?DBVQ6GfluNNSdVrLlXKoaIMS8FPK8eyPZR8wRM8rtuGhI55DKHUtmAfsp//Y?=
 =?us-ascii?Q?t7EAqrHZ5slkRnqQSaY8OR5Sg2nDyrDIOsKT7Vib0TqSOhPJAH+ZMilSGf4R?=
 =?us-ascii?Q?B78AeO85GOzTYR3XniehBEWz34xSih4eD492iThINJcakJNnQPNV9h2VeQ4G?=
 =?us-ascii?Q?Hslr1yZ9MEHtWv32B+y17vr311l9Q/z2AbAzuT+GftMCHZXNstpBD102Aa5o?=
 =?us-ascii?Q?GZDJc1dDpZ2fXLcDLOojYaGxxjncSmkaX1U+bKlg/smWRloA9kZpPaCPCqFm?=
 =?us-ascii?Q?QLbXGOTN4+K7gbUeAOxsiFimJa+w0Rqs/vPeHx8gKIs+CUX+OAdAqkSGyJ8X?=
 =?us-ascii?Q?mgvCGnNZOvJSl21zsNbHp0QRG2eW2tNZjV/rxGmHHCGJ6Pg4Ll799icrXXR1?=
 =?us-ascii?Q?KjyIan0wt18v8TSRMSgmb/00x5FdmUEg3DUjxuRgc0cHGC06eUwkX6KbOxfh?=
 =?us-ascii?Q?kRT0R3EQIplglqFMrv1HCYgokVchpU6Oww+j17M8+fqpKDL7E5JRSAHLlBAY?=
 =?us-ascii?Q?uYH67fohEET74d9VrdKyPL2xf9Iv8jYYmdIrLKnI1pXeKwymbaCwkjRj2z6j?=
 =?us-ascii?Q?tGxDK2Q8pV/kLbI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 09:34:59.5715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d61107e-254d-437d-8723-08dd63a4a7e1
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB3753

Update to reference the input.yaml schema, thus enabling the use of the
common 'power-off-time' property.

The hardware supports one of four fixed values, and the new property is
optional.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 .../devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
index e879bc0be8e2..9f8e6689cd94 100644
--- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
@@ -83,6 +83,8 @@ properties:
       by SNVS ONOFF, the driver can report the status of POWER key and wakeup
       system if pressed after system suspend.
 
+    $ref: /schemas/input/input.yaml
+
     properties:
       compatible:
         const: fsl,sec-v4.0-pwrkey
@@ -111,6 +113,9 @@ properties:
         maxItems: 1
         default: 116
 
+      power-off-time-sec:
+        enum: [0, 5, 10, 15]
+
     required:
       - compatible
       - interrupts
-- 
2.39.5


