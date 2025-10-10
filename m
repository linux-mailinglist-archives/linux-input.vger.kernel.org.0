Return-Path: <linux-input+bounces-15363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBFBCD4C9
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 15:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C78983544E1
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 13:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64B0287271;
	Fri, 10 Oct 2025 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="C0CxyRTm"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDBC26A1BE;
	Fri, 10 Oct 2025 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760103401; cv=fail; b=ZzYoHEPIwHre7nn1wmVF0i5i+FJ6Kgz+c9yuKAzNqZlgMGd9uJpcfWdHUPT/29zaq93ca/F5Ps+jfrNxCMwXKpi/Y30m+R0jYksxgk/s9yYRz6CqHwfMB5ul1AHLjNr/5c7JXzEgVMk0/x53o/eRHYJfOJQlXzxVxDU3NKNKpZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760103401; c=relaxed/simple;
	bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f4Peiv8q545mD4yhxya/BuL2Wj7kOTy4sWtN1pEhDrQq+8c21lWXhHD/KDyCidQB6XyFAheur8jpusSgHwpF1zpJ5dLforQqJ9i3f3knc+hpz7U1ELgZKmK+WgW8qaOVzT2TjwHCNLjvjtUCsDjQx9gCjYDtgLOGLcUpuKmE9Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=C0CxyRTm; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATN8y8AJAnuyZEPjHbLGWOr2Nkb5OAt3R1xjEMbpK5fVpbgp3KXeuADy233DcgdxGNoRDEmnE8Sp0MFBkpvHa/PRcVk/4ypxeVcZBpNOj9tmMhjntYSZQdLDa15oxsavoa9bd/MJh+veaNadmLy3fedBByqn9qCryI1NkmNKM+n1U2pkd/Zh+4J5Nr+qZ0eDpIWGw1CI1zB6jk6z899HEi88Q//RhEMdZUjmRYJ7tDu1bQMDLEvsWQICRPYQYqwfSMWpBpUn2KYr8bJX/In2++Puztex38Zn83iJ7DplaB375FcAzsQS1sxxKV1I4sDARPC7F8Blqyvzaj6HAGP7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
 b=capW4F4gzIZzWXj4Mtq2q1gEu0OelPFtO/+HCwuwHEOR7LTq9hs2WXDuebeGtfqO2Pfl0JjIGL5skmYaGw05zwGae0smZSrKDpwKjjwTaYgVPm567PRXi1kM7AptChFan2PTbx7AiWi5rNFxSp7bWmYGhO6J09PuGF2z6ZkSI6GjOn8mXDbPvshLjfyf5Sbb8ftm+/XG8m0ZzAQ61NTjyWhEz9hVvsts/IBFvzEG6B2J3wGOY1ESNx57dd2xXhPMVDS1VVr7GqHyKyFLwBConaQSKcccxAjNCAhakV8OqMCna2dLM/bxiiUymw6wWTz5eA1uqcF2f0smLkshyTacXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
 b=C0CxyRTmvT/7n68oRAMmN1jf/9IjQbLS7SeAbfAnbkneRRlo0XZKudeXjf8LvU/OvMxygKBqN42258UEnodEE8182FzB+BtvxgmjG517Mm+A7WITBLVRus3dcOnBeRJD/M7LXLlG34zzSwpOQk1NHvZNLAYXgHKej/7ai7aI/Gg=
Received: from DB7PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:36::33)
 by AS5PR02MB11269.eurprd02.prod.outlook.com (2603:10a6:20b:6c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 13:36:35 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::71) by DB7PR05CA0020.outlook.office365.com
 (2603:10a6:10:36::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Fri,
 10 Oct 2025 13:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 13:36:35 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 10 Oct
 2025 15:36:34 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <kernel@axis.com>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] input: zforce_ts: Remove error print for
 devm_add_action_or_reset()
In-Reply-To: <pndbjoum7td.a.out@axis.com> (Waqar Hameed's message of "Tue, 5
	Aug 2025 11:33:34 +0200")
References: <pndbjoum7td.a.out@axis.com>
User-Agent: a.out
Date: Fri, 10 Oct 2025 15:36:33 +0200
Message-ID: <pndfrbqj2u6.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|AS5PR02MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: db229a59-113b-4fec-94ff-08de08020850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6eCd7NkHhJXcGdCH+jrVo9dzzONGt/4uXOFfBgBwrgxkYNhuOpdSoBA9GQuB?=
 =?us-ascii?Q?BYfYONlaUkeMKp2O+wt+aMfTYFUk+zAGsoq0K6HUTU+l9fQdW1KkkYQkpepB?=
 =?us-ascii?Q?0yPIpf2GE+wxWHzq/9jguZETDQgywGUhDBDLzinSaV2qNITHIh5sfR9qMKKw?=
 =?us-ascii?Q?ZsMBVRsGobIW6Im4v3+y3SV+3W4pj42M4ywYWkGAni+dbcFv07fcmFXQRB/g?=
 =?us-ascii?Q?M0IRjfY9vPbFQZJhae6SPFkZNYzJU5/Zgq69Rtvi+OVqNPxdbHRqf5XIUAO0?=
 =?us-ascii?Q?7gyuqlwMivoHYNoEwiG3yVpFwjZhc9HGJBhjM7BTPMwrY7D2ChAD383r+Fto?=
 =?us-ascii?Q?gf1ayglrz91W5XUXO7h87GADoNT+yVKAIM6nXYh8dl9zOTkTrNOxSuoysJme?=
 =?us-ascii?Q?quPZrV610LRpVYF7/JcXiF+dgsgHwod8NcTKFaiL+ZoHpTKhVbP5deA1vZzV?=
 =?us-ascii?Q?OV1c4uSPkatxlqEKCCLm70y5NXYUDlhZOTEst7F1EyM7FHNjegSblMdBlCms?=
 =?us-ascii?Q?LCZJP4NPcCMtMuPUN5F1GcL/r1fn85nW6si5B2kkTDD4i2/rOf2RSjJ4SHsO?=
 =?us-ascii?Q?+Of/vH3elm6OrfqYOyBFsvGZvgtkpqcSH45mSp0ITmJOiFmPX9zJ7jFZmT9q?=
 =?us-ascii?Q?tbpTonWnAV5lo9aSTwdfy+CToKJfxSDg1fRc7g91NdVp6nz2p/ubWAJHEk8m?=
 =?us-ascii?Q?ax5+nC2VzrpJgtmvHyHHz+3eS5AjSYejBS8UgVsK1xDEFUb213u5zEnUtG/P?=
 =?us-ascii?Q?AgMJuY1C7SgwqPPk1S0CJbuStCdiiMggZrJ8abBE0nNDzUO7Sq/edxahaZHI?=
 =?us-ascii?Q?a9ScEcU/RnFkTGiuO3jtXF4mFrH9tueNHptPYjoyPCT9KKfXSYNvqXjgB+yH?=
 =?us-ascii?Q?PBflTmVotfic7XwyBtz+gbE9NH4bmO1sEp1xpQZvxhQ5x4sWVW8kp4v2g3WF?=
 =?us-ascii?Q?CLuHdhzMXg1mxyOdJjOv4OhscEEosNtHQElsIYrhNAzO8O1V/3rJ9DultbFT?=
 =?us-ascii?Q?YqaI2D3GYc39DHtgdN6nQpsvrPS7bygi1jqux00vEIjAAanmckQAfL+dqWxN?=
 =?us-ascii?Q?Jr9FMfFQcf8gKZDvowNl6ICRpBUDtHFK+LI4PenrFWtrmIQgWsB3S1F0Lc0t?=
 =?us-ascii?Q?S7SV3iL/xhIXHJKn7JWSWkGS5OeRAsoyMe43fgLKyBjl0u8VpdM7A70XFO4+?=
 =?us-ascii?Q?i225bUt+a/nwD0nTg+9kRIu9SiweOyo9OcPTvA7sP4o+bn08D46XbaMQUWqG?=
 =?us-ascii?Q?/HRhIORL4IVFlV90pr7BKNYCQfNT1IheOsFTRxWRJ4oTN9bRoHDs2uPySbGu?=
 =?us-ascii?Q?2nwAxZD4yILWj/6LNbRUPt5zriRqD6BCjTkfJr2ylF3ifx4yzUkGk0W9TO2k?=
 =?us-ascii?Q?yaCrbz+Hhim53ups+iy5YMLvTwnifqZd1B33ibgYLbPNwOYzL45WroFLKwbP?=
 =?us-ascii?Q?/foMTqmHyjQUTDSQxK/TTwHOHVlKors6KWbcc3FDFWx98lbpBeT7i9AOUyNd?=
 =?us-ascii?Q?gykonpoqGtA2myZmUrN0qjHKYxM/SDkjNLlKniLe0Un6qNEpSKi1lOTQrZKi?=
 =?us-ascii?Q?raTbYyLYKHl7uIB/PZc=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 13:36:35.4452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db229a59-113b-4fec-94ff-08de08020850
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR02MB11269

On Tue, Aug 05, 2025 at 11:33 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:

> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Friendly ping incoming!

