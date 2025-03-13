Return-Path: <linux-input+bounces-10755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B06A5F367
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 12:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A65688009F
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 11:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ABB26B0B2;
	Thu, 13 Mar 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="pXxktJjv"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7EA26A1C7;
	Thu, 13 Mar 2025 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866303; cv=fail; b=Ioywuvn7O0RUY7UFMlM61Qoc1VqkCV6gzP/4VasDl0MGEQc0GyFVrMiNd4/Cb67MkLwQLREDRXW+MxBFyyTdVO83ye4EkST9R5RaVD+/T7KVh5QzI9fvtxBdgAwzI1YF1FwrHZfptG3P0mLUg8tqLH7dSul0Iq79QQhhgh4PlGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866303; c=relaxed/simple;
	bh=BmDyOncfwoJF9QuS5fx4hUfvoClzoxAMz6AsrrP8dQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kzOWxXWXrVNMzBEA4nc7ay85rxKnyf+dJ5r6cyrHG5rgZm7gqgB3fYj8MlARma0152sza4T9q7Wt9byiRD+bonz+9Oy2uW/XpphrZWKxLvaAcB3rxcoBUnwPJTDyDRNejcdmaMegmsMCO9mu9+lzp50nr097eI3T3ldhmarRI7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=pXxktJjv; arc=fail smtp.client-ip=40.107.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br9yIe34eRvp94UMwHzGfwlreD/PUzDpLZFBz0tgVm+mCGz+SllrdL48D6aSsOaIPpSvqb95mcUHDIhVO+GM3oVj9Rr6f1KG9t3RKtRKF6mS/Wjl6VWQ93iX5Swu3pj0hS0a0lFxBF/N7Oglj/ECQLn/yijJva3g7y2jfqLW+LBlazOfihiULGicXyMKGpZ0k32W8+s5DZUpuHjS9CSQeN4wr0V+dKNglqh7nyQU05CEFXp5H7gVNNZiwpDwtPzgV41HOEmg7cEpjMOHHRo8jn2fBT4eakhWeHlPyRcMk/nSe5jttvntymvuv3Ff9Ay0TL8evjN6lMJacCPQlIdAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezU9T2xxKQb9Q8gnog14Fi2fMV3P+Fo12HWvQ2ue3u4=;
 b=BEF0lzIAJuFxOpF5zsYWpq60fSbWsoplDB9tC/GbX+OWnWtI9x9kOahgz2eV2NHFFlYxGcCuDeK4aAndBSF7dtGkE9ihO7dsRixU9s1QnxNXdS81GEjLkgcmH6C9+7nP/+Uo1GLnqcb2x9cDE4ntz5dAgb9lapw1vd7xuphSDqAlZ1/hkPeqm9Af/ZwfsPqx9h7xDT0wRy6vRshAWRoMomVUdSVueMl7aFkQ31aHmMxQ541DYYB2PR9KE5ykQHzfYjuloQ9TleEamxPMwqShJT5Vmy9EyHNOxmMjujXqfbD1I8TvNdEruOwP0Yjy4ofRGmRuSHOB6lQNaPHCN41ZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezU9T2xxKQb9Q8gnog14Fi2fMV3P+Fo12HWvQ2ue3u4=;
 b=pXxktJjv1eKQspr7F+3EfcAo350jNdsy6rcHn11lDQHsQfMbdjUvU5azTPgToCBdBBIzUQVnluJ75SJnUat3suouM/4boFxQGMZxwL8fJZyhkBN2fU6BeFAINFb8kGOIj/UyPkarT0A+b+jdpBICVC0nJ/+QHctxj1MMBZy524HqaUUCMjToc9rY4OgL9PzYZPfzE6wI9Bls4vxehxqwSR8P+7+GxI2Pjq9Il8pn55mGe1LSQh+CMiAE2IoGO6t0pU166hUjg/0cIbT90J8RcAxyVGgG5z/G2wZxUWjEHibp9VYAX1eZxIBSq6tN5SCkKx42V79d6hAiuV1mz5O+iA==
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by MW5PR22MB3536.namprd22.prod.outlook.com (2603:10b6:303:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.21; Thu, 13 Mar
 2025 11:44:59 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::f7) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Thu,
 13 Mar 2025 11:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 11:44:58 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 23385CFB75;
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
Subject: [PATCH 0/2] Input: snvs_pwrkey - add configurable force shutdown time
Date: Thu, 13 Mar 2025 13:44:51 +0200
Message-Id: <20250313114453.702-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|MW5PR22MB3536:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e1e709d4-a014-4cad-5846-08dd62247bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eoQWSVoQ/p62T6jnw+T4/D5Sa659Ce2hAlw8RCEPOq7ivnSPXH822TQIEIdE?=
 =?us-ascii?Q?jCnx1zIGNI1ewH/W3K+GvylMU0BbF1R/Vhuirm8ePe+7VBA+mB+53R+HpMng?=
 =?us-ascii?Q?S3ySqXjyV7ErTOz6qIC8094nF/lKKUInxLWJzwHr7HaKmkMUVld04V2WIMHG?=
 =?us-ascii?Q?SnxH/N122JsHNm27qx6w3UJcm1DAFOORrKMSgBst8+aG8WbU6Zmo/FVeLpUx?=
 =?us-ascii?Q?k5NEMBrdw8Sz5NaYIvWZJITYIHRGO1FDo5QX+wV6o7XVLWgcK6nG2Fd75xNL?=
 =?us-ascii?Q?vMKMBmsd8Bg0hDhHmLTi9G2kOeduBk4I8elLJlNIx50Cpo0OQcar79yLwLZ5?=
 =?us-ascii?Q?+y6OxLtzNxAA24gSRU7puy9CyCcLzqwgdx/eZK9kZxIAx3wjx38YdNJ7p2IK?=
 =?us-ascii?Q?AabP6SlSGtkZwRi/5M6V3PbCqiEhTga18VBE+e+0sCIQKiZV7QmE16w+B8K7?=
 =?us-ascii?Q?ZJXK6Su4WCsq3r8LQOBMfCbBGE5BVckGezDIOla4wcdwDerEoRQT4oZMacDB?=
 =?us-ascii?Q?MaVT6AwvuZwRrQSX22L/SIpNKj2hTikVSuRIcvIdJz5bpAn+NxH8/KQq3NEf?=
 =?us-ascii?Q?zK5GGq2ULVnMaY9RnDTIH8bOHHMkBqCRhd4/MlcLSfm2I2btw7qVzJNznOdK?=
 =?us-ascii?Q?YB73fOiWZZK4TacnCvj6cqkqKZb+OXvSA1zHhtBvO1jDrhk1JOCS3+4kKeDR?=
 =?us-ascii?Q?J/c2uu9wD2S0mNEvZcclQXGySy9IsGo6wNd/xyHVDeJNqwGiII175ZWSQW5I?=
 =?us-ascii?Q?PY2MACoirvJNFpeMrJVE3Fi3++9cBfM94H3W9lmxAuvhLTbaiE+KwPgwvEdM?=
 =?us-ascii?Q?DDl5DNcZTFYlKX6nqzsLohAffnLob4T6h1WEuQ9no6EacuCGg8dT1GwgPcVP?=
 =?us-ascii?Q?WN1HxtFGfZUUDy9gJDESh3dVh6PmZZkZtv1hTuraIDiMKSmU6cP961hSiZto?=
 =?us-ascii?Q?vyBuhGfkSHmPbD/h7HBkV3+ocJhjhPAkzyUIcOo0Gb9mGmpUqnJYjvM82buh?=
 =?us-ascii?Q?pyusTsIFooSIVr7Pci9wvThWUDtH0vWZVwaECg87p+aIiQZaFYSta49LpwdS?=
 =?us-ascii?Q?LxOWTnypWFYnY/5Wk9B/6yvXMyfrDKHcD/GQMq/5T8m1WJUCgBEL0ZVKrwE4?=
 =?us-ascii?Q?JZmONX7euJ6bLVc+UUtJ72zqNhI/lgESyb3krzOXce3X3jlw9PvDpNoj9aY3?=
 =?us-ascii?Q?EAA0vBw5zc6+1ZYzLt03fKdtLkuKttUmfIE9zYl0yh9YXflP5/iQziVVlQjD?=
 =?us-ascii?Q?JoyWGcIk6EazNiXgwEJj+xYQRaBpwQQA5aP5+XYFPH2jaOWgts6PpHvfjqLT?=
 =?us-ascii?Q?lbWLi9MovRrU1djyMJPkPVs6XZKYaxyCVdS+cR7WGW7GvVp4TlJc5NNgmstT?=
 =?us-ascii?Q?ZaX8s7QLwjicDTAMVSzTHWcgIYvji7gOzP9i4GLK/bTXuWt5xD9VEJg/5iMz?=
 =?us-ascii?Q?9q0449arbfUCgy/p58LgBgneuzbyESM+1uyD1JPpKl0dB713ZiYINA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:44:58.6036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e709d4-a014-4cad-5846-08dd62247bb9
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR22MB3536

PATCH 1 - add documentation for new option
PATCH 2 - add support to driver

Ian Ray (2):
  dt-bindings: crypto: fsl,sec-v4.0-mon: add optional force shutdown
    time property
  Input: snvs_pwrkey - add configurable force shutdown time

 .../bindings/crypto/fsl,sec-v4.0-mon.yaml     |  8 +++++++
 drivers/input/keyboard/snvs_pwrkey.c          | 24 +++++++++++++++++++
 2 files changed, 32 insertions(+)

-- 
2.39.5


