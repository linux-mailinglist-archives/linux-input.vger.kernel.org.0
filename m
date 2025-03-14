Return-Path: <linux-input+bounces-10828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F58A60D95
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 10:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6F63AE44F
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF3D1EEA4E;
	Fri, 14 Mar 2025 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="ctQnmM7N"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476881EDA0F;
	Fri, 14 Mar 2025 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945350; cv=fail; b=lEZ7nl0Sy1a2nTtxz1rkYccHNJqK/bmH5uZFMYHwTkM4gDcZsVcWmtwgt5gptjtqGm2Eegr2Aihu/VdosugJFetZhJSTjwCzns+I+OJtV5yUNew0tS4k3jOo6iwOG+yo/o0YV430AW63KP4Dhg8pmMP60vfXb9Vw2YMwjHq+e/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945350; c=relaxed/simple;
	bh=ROmOeU3NJPIwKIfg3Q5RVTxayiP/mgM2Hydl4ZJ/09U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cVNVSEPb0VdW2VTl3TY7EGM3iTBlQUBfZKWnQDIhRQtt1eUP52SXomMCoTsf1c2fJ6qc9tPuwrofxYQEgpm2kEC58PXQGxOwkXRdPh1DY74v+LROxiIZBz76QU7z4fk+lLSn8ySkeX9KapaSWtDGxX4YqIA4Ud1fEOV2O/V/O0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=ctQnmM7N; arc=fail smtp.client-ip=40.107.100.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYsk4n9UILyZinCaZtShYsj47MUmxo7jkkLswu7d+Y+djlXYNvyv6j2nYWBU7lpKYM+ZV0H2symdYf1gvpt0FW5moC37nJbVzR2b6m3w9zC0htOhkUdJbH14X2PZ3ehyqcDbKcAF61VaNIswVKcch9MyN2RTJyOGGpHJAfGGnlRHgjPd5sXfA7uL/dHHxJ5oRUJV8J3LP8/pXzWeXsyi47V7FoZNfw3kfAh7Duwlo0hmPxYk4pbjXD8/PwN4cWU+Kef0aC1WCaL7APk40U+zK3yMrHt/txC+K3JquzBa0eD6QWL3xDJ2JaAkci5pQmziDVY/wGkyf1ykGDOTlp+4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU8ace58HBHspvh1cTzp+ZAiqCNFRghzuk9CG81Lj48=;
 b=R8QqJrYq4o37Sik4NdPiAblQulgE3Izdw2QVmdLNdNZkDBrWDGL+mqveH1Ky6kyKKDGF4kWLS8MhUM+/vn8NgBe0Og2cDUAqC7y/oMk/+33ZrQNdRrHsp/EKNW1HVwLpvmINqH6S8W5p6mhwAHQhfUolsjimr5M+meY5Z446wq+AnDH6HiZdNvuv8M2wZUixtR9+8LSO2GVA0bpgb2dXASuHYOyfJ6D9iOoQTIpwAPBLCWhgeZUArPcs5Jt8ok7MYlJj1nFydV8Qa6qMjW0Tyhr/wXNB1CR6EnXzjaZoIkvGIpfJci7LUlwE9Nw3YFrD755HVQ1XtgzYUgx4m6Y8Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU8ace58HBHspvh1cTzp+ZAiqCNFRghzuk9CG81Lj48=;
 b=ctQnmM7N5VHxgBP+G1GHq9/OkJxYj9PrQFiO2fOIcT/QcvxCjJUo2UkDvoKq9Av5Gjzi1ouxKxJs25m29cFvZ9nGP+oqYhY6wZGgzSIGr/oHdStGdKtKPyFTqoIr7rnzsXOEfQSDT1v3YzXhaOpXHmoOnmSGq2Fu6d6B9CH7C5mDNSfw4oK994AN0JmR9NgueoITCyQO3i36un/5j68yDB/27l9HW9LQKO6VL8+rJFigFBt+9wzRI1NdsQ3qBt4NylnPskvrkfVnSgPB5XK4trynRWohyR0OulPJdikMMvto28l0F8AX+hW0qZ5mItWrVxIBOEE1VtxXqq48cyElRg==
Received: from PH8P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::34)
 by PH7PR22MB2966.namprd22.prod.outlook.com (2603:10b6:510:13c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 09:42:26 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::5d) by PH8P222CA0004.outlook.office365.com
 (2603:10b6:510:2d7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Fri,
 14 Mar 2025 09:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 09:42:26 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 9DB24CFB5E;
	Fri, 14 Mar 2025 11:42:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] Input: snvs_pwrkey - add configurable force shutdown time
Date: Fri, 14 Mar 2025 11:42:12 +0200
Message-Id: <20250314094213.902-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH7PR22MB2966:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10d2898a-6b16-4c5b-dfec-08dd62dc879d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k+o/rBmKRHtJp/+gqypnPxA9lyIVXspRkkXmW7WZTnoy6/LSKqEppfkVx1ck?=
 =?us-ascii?Q?COqytANhoIPgxCMlNZ+TaBdZCGv0aTBXSRbLmRYdi0y26iLbze6iwaRcvb1R?=
 =?us-ascii?Q?V+wAxAUJqzdqTmMAtlaYxkB73gJCsXFTTJK/U0ImHRJDLOo8AdzYkuiCHMeh?=
 =?us-ascii?Q?2NqssJrjuvD4Dd20NpdqU4nRzxIJgVYMFenrKfpuM0RoTKtQ8i2wZbqQnC/2?=
 =?us-ascii?Q?FSHBWc9WZjpOl0f5CH+q3k+fq/VGNofj26BebvF9e2vECBK9cispizBuH2EN?=
 =?us-ascii?Q?hXnNPeDh1GFel1DvBWe3qatvonV1xbjVWfm7Fif57aZ6uLYYt0bSIMk10B9j?=
 =?us-ascii?Q?i2GyohXwWypgC6DLFtV+R/OvbG8C7YQBGK83yHhdQt0EDFzuHvL4mV+RP59K?=
 =?us-ascii?Q?R79S+DrH1hHxDp7dSr4lAkE2UZ82S+mfIDOAwAGWyv+rIhbmKrXqxXZCQxJl?=
 =?us-ascii?Q?1YrFY/ywputijUfQip3xf0NvMk4YePGAkWZAekmnN60MpDU/QGml/+QAHCRn?=
 =?us-ascii?Q?N0DWMj6MlRUthJXX37HzjCrrxG8uUY6EPKTBGsDPWIsfUHI9eCa7QwqdJ6ov?=
 =?us-ascii?Q?z2C6CngMyn0JBaxQebhbzkDIKqSNzFLq6Sp8H7SgSHA4zEyQ96RpTEnwTar6?=
 =?us-ascii?Q?7jS96qn+qVJJ/2AyphsXlw6UDGAJ5NbOPF5ucaCUBYb70RcI1dWaLQztRgnC?=
 =?us-ascii?Q?fvBR1Ah0ne0+V6dz/tfIzgLorFsFfzg4ClzFVJLCeuWxBTq8ebe7M/AAJMMu?=
 =?us-ascii?Q?bu77N5cH+HXrdjd3WmnRqfPnbDubODIE2dy1kHp744gmVXfUec7YvauBzcxU?=
 =?us-ascii?Q?1LyFiKAg47HUdvDL84VRCf8nSBFBx5sWebIcogl5S7P7J9AdG+r3E/C4nw7K?=
 =?us-ascii?Q?vPZK1NM6tNqNMuczAz6ZI2PTuWsNsU27YgiCz92OdiI+sru03tOmdVYctJ4a?=
 =?us-ascii?Q?RKfOPcFADXj7KMbj+8TP85ZtV8x4nenFNYYWgsjrS4LryJP7FZx9zPaAfdr0?=
 =?us-ascii?Q?DtLF8zHDSSnm/zoBBNXVyfIRu8BFuB4mq1hQ4LhseYq/w08z5qrG0S7pwsup?=
 =?us-ascii?Q?ST1/QCcCszXJcZbRYdOFCPOiJMRNXfl2tDfwgSEVGcE1Wuz0jFzCL1In4DLc?=
 =?us-ascii?Q?AQ4ge+WD8UEAQiSCs7SoNH89r1aYvZyTJQJ5b9G/ik2/zWWc1B710c+tyWV5?=
 =?us-ascii?Q?+S6aVGfSv4anGrxlEy8Uc6nj10d3pnK17o7n360Tdq1EIabH13/g3DcFytLP?=
 =?us-ascii?Q?AHZicxi+ytOms90WxVp344FOlt9r7vT1IMHY1o8rlTjbOHOiOTYiEs4KRbEM?=
 =?us-ascii?Q?b7MoZ/4jgKso6F0tVP/GQ6LK7QRvG9kHHrD5PPpQJz7aO8SPD3zv96w3PIcA?=
 =?us-ascii?Q?l4kY5ZOFIAPrEEWsky7xbb4Da+MIhg5yzaLenNq6JHzhTRi9/TRv7O9l9hRb?=
 =?us-ascii?Q?AN9WFjwYKwLKfOCe1rAj+CwLoGLSDw740Au9x7a+R/zE9WbiWSjOiFayPh3t?=
 =?us-ascii?Q?opEuHEnDONb0oEA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 09:42:26.0326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d2898a-6b16-4c5b-dfec-08dd62dc879d
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB2966

Changes since v1:
* Drop binding
* Configure LPCR only if power-off-time-sec property is set

Ian Ray (1):
  Input: snvs_pwrkey - support power-off-time-sec

 drivers/input/keyboard/snvs_pwrkey.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.39.5


