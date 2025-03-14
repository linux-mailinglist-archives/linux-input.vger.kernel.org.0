Return-Path: <linux-input+bounces-10841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE5A6128A
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 14:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB7A91880156
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38F51FF5EB;
	Fri, 14 Mar 2025 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="XhL67BIz"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296501FF1BA;
	Fri, 14 Mar 2025 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958674; cv=fail; b=pVpV0r7A6uhu1srLYnw3Tnmwz0u6YlgnqeF7v5s1AO/QYri78uul8VwZMsc3KCOgDZSIfDbmD6dZ2U/bvywSMFvzHc8TRCeYyZPovepTHjP770ECkEzJ3fYlPEbs5NfJjwjw3R5rmILX+mKX4obDmzbHpfo4SZw0T3aqVD1PM/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958674; c=relaxed/simple;
	bh=qTDvMx271pSXovnkhzICygwVkJCKb0msz72xs96pUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCrbxSvRuVlzqcTeEQoNpJPokxDjans+1w472IhnfUV3cCOvAsnxw0pV2ri4rXjqCwQmbSro8UTIoCp/JCRofBd9O07/RO3KjuuQV8SsV91xZ0U7kbS+FT71NwvNegNvwLQh03NtrdYGRLbihCDH0qRzDR9xPP6rlEMcgl88Wtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=XhL67BIz; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZpmUWv6cy5QXKG9IrF/hD+8sLrd36ec4CgkiI+bn3v0lsDatpjvjgvliV/OYk3OVQ4jQyZ2yPsuqQtULoUxxut09+3++QC474JH9GDrRS9Wkfw+dhgUTvOIhQ7+YD3e4ngSsu1ik6iddWJFG2SA/plMu3EHvTSWWNIxep1BDPH6GRXPd+5D18zEFZt8TrcwCMbbL5BIYxHyQFvAG4NzvVmyklVjOj8vNRzNpfOoF9HadycJ+0zgdZCA+AY333kF3MF3zMSPWrhRzX5z9i26mBtpqUVAPVkf+dxGrwwcnqqB7NdaLbwAZ3S3wrl+Mu2/In3tai6eNv/aiyFKa35ZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAYy1hPH3xzgggkIDq8Q8YGvCjxcsLO5Uw0Cck2p1Qc=;
 b=R5DSJnljI+wx4roJYtqT1POMMDm+SjLuBx9QvxBuBQ18bJBRa2m7AXzbBgelwN2vZsWt+pVtF+/L/qtGA1HSPPfORs6bQiztg4PBDQMTiBdGVF/31aCtBixo8SeYNMUHb1S2QjoaPoukGmO/csrxVCWYz6DTHG7TLUc70hz80LGoDoEZiAFYHoISF2Ky+Ikvy4OU8MO2t3KUqtorPI9NIIdPHc8duz1fLU7TEpP/MJlxUBTlLX7A1Xu13d21TWT+Nza9er+qnmZ81/pDCG5BNd0L4+Zb99re8rYEaEXqjMbdFwvR2luu7QP7XxF76BPiEC8EVU2Bq0gvUWi0+flDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAYy1hPH3xzgggkIDq8Q8YGvCjxcsLO5Uw0Cck2p1Qc=;
 b=XhL67BIzDqwtFrJ3hsLuMC02dCzcWyM2g5G/CyaxWzzvYs/wt97yuzKX6ELsgqHkwk+iNE7omeSyRzwYB4lPdl5zKOBPF6yRkj3Tk/TTgNJlm+N6jXBzbwMgA9YcLtiXRpkiQv4IVsXKNhadDx+NP2sdJXuuSChpuX7I7Haa4LicLuYMNXY0goMH6PVaeUvXQw/enNTJX4iV+kx51Ofsq+693Q/LPHt58HkMkQopXcRR19XH4zhhxEkLmIhHDTrkhBAi6IqLoKO3HQTtc/lYeXZVaW5BJPLYU+IViTCF0HeUW1G7Os8gXK2p653HTALFv6dSkRf18Tzt0pFSR4EpGQ==
Received: from SJ0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:2c2::11)
 by SJ2PR22MB4013.namprd22.prod.outlook.com (2603:10b6:a03:502::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 13:24:30 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2::4) by SJ0PR13CA0036.outlook.office365.com
 (2603:10b6:a03:2c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Fri,
 14 Mar 2025 13:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 13:24:30 +0000
Received: from 9e5302bffcb7 (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id BFFD99D4A8;
	Fri, 14 Mar 2025 15:24:27 +0200 (EET)
Date: Fri, 14 Mar 2025 15:24:27 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Input: snvs_pwrkey - support power-off-time-sec
Message-ID: <Z9QuC7tZoXj3DRZs@9e5302bffcb7>
References: <20250314094213.902-1-ian.ray@gehealthcare.com>
 <20250314094213.902-2-ian.ray@gehealthcare.com>
 <aa893df6-fe40-49a8-920d-7d7240bb18b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa893df6-fe40-49a8-920d-7d7240bb18b8@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SJ2PR22MB4013:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa6f635-2515-49ce-a7e5-08dd62fb8d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1MTGKfmLvWhltpIr4CTaK+hmlwcJPQPhPDY+AxfwVVgONc9GAf8HNtSM1xsQ?=
 =?us-ascii?Q?58c82bUVkbX0IPgI/E+DqVOiyl93UGY1FMCI8qoRnca5oLoEdgPl4dscp/Nb?=
 =?us-ascii?Q?zsFaqRJ9iqenSYehvPXp62Gyj0+aoaqcTLrEvUHBeDYLEnZ1IrGyrW/3W00x?=
 =?us-ascii?Q?TAMNa4iLuvOL3YLfmuyOjiC8YQQaQPm7cu8w6NqNKi9/IOsdSQNv2T+9yjzj?=
 =?us-ascii?Q?oZE1oD+bqhXs3Cb4ykFIXuukhlp5+KSXgl/BEHzydtmq29wJHlW1dTULmhJJ?=
 =?us-ascii?Q?wKrn4vqJoUI2m3bDUZzRQ8isM/QjNho6PIpFSmRKnwix4/2C/tLU2qOxMaoj?=
 =?us-ascii?Q?znl+vTqYh9d3a0clZ9tReBOx6BSeTT08SyH6pekR2bkCiDJfl84yqT7p1/ER?=
 =?us-ascii?Q?X5lX+oqfUXpJiiLeOexAWDv/tZyqDTD94CULVOpowLjNwrCaoo5SOvf8Dd/T?=
 =?us-ascii?Q?Es7YoXuq/p+KheLCqnW+ech/7MQgEOorTw7nii0CmLvzJf3fO1/q33y2l2th?=
 =?us-ascii?Q?P1pVqvXc+EDrx0/0+JuR8f5MvG5NLUKcgZVWC7JeeAqD9d74QHeOqcHgRtb2?=
 =?us-ascii?Q?m7Qi/D4YwbIZHL4/5TO4R2BxQeXlHo1LJJpruYZY/N4QVappPVOuLjCwr57S?=
 =?us-ascii?Q?dTgg11Iqqc7bVs2D6tbphk7WCrc4iaa69dhnil7o5dbWP1CRYDG5suli8oDh?=
 =?us-ascii?Q?/ZYNIIeTaXGOIA9lJ/aYBz6dTYnhgLAyvqSAX4jbI6/WHoPr9WwuZLqk2MMS?=
 =?us-ascii?Q?M7OZBXHJAJn97if4t2xhkSAEixqQ7nbnzVRJGB/6DI2CE474c3dT4JiwcH5Y?=
 =?us-ascii?Q?t1olUahi83M0YcHIqhMn25eH15EIcbGh04hdoBTVQ/qtX/t9R5fYtIcFTXJI?=
 =?us-ascii?Q?quMhi/xx60hmVakF9RLtjWn7IrnPmTTLtHFFZhQ6rVdMehhcgG4gmIaUOtb/?=
 =?us-ascii?Q?u3YvRBu9TyTTxdcDLS8mZHbNHnxEvwotY5YPK74XZ+xxdC/HdTlsVb4pn0VV?=
 =?us-ascii?Q?Wxfc8Y8vLqdvVbRQjR1+hS8yMM+JK7FLFajVkLUhVA2PhIvpo3LMF4M3AtFp?=
 =?us-ascii?Q?wb5NUyRA3MXL5hpZRoRnNUwEeRxh7U5k/HVYyDHh6ed2SM1W7V1uLYSPlDW3?=
 =?us-ascii?Q?SshJMN11g5pSUBIj/mHrxuXix9dD409ZjRlWjreJOfmKYvsTLq7tXJ1yT3E6?=
 =?us-ascii?Q?XSanrTTwKQZ2rDEKhSrPJvuhCU1djtQkni4jx8MX3hJYK+JAsFPDYJFiX9Jt?=
 =?us-ascii?Q?sWHkza6XtHqe3PTIusAaNs1RPku++PWA8efkZ5doFfjuCIifAMyxnXugULf6?=
 =?us-ascii?Q?VlbJAH5RXXO8VcJxjeVnoT1MWPsJ8p0dGYf3LgMb4XXb7Ln7V7+64mIQVIsh?=
 =?us-ascii?Q?Gd7kAkcDQGiOlFb7fDS/OScXHQrE1hdTuHPGCvLB9DbJ4sCCoExKqGCjNPfo?=
 =?us-ascii?Q?DzLmxc18CezqNkqqn6Axk2IP9FXwHiC1Cjr6Qqnb9HVTDTTnv/SjLFWewB96?=
 =?us-ascii?Q?gXnc2WYZllM04qY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 13:24:30.2698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa6f635-2515-49ce-a7e5-08dd62fb8d84
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB4013

On Fri, Mar 14, 2025 at 01:55:47PM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2025 10:42, Ian Ray wrote:
> >
> >       /* Get SNVS register Page */
> > @@ -148,6 +152,24 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
> >       if (pdata->irq < 0)
> >               return -EINVAL;
> >
> > +     if (!of_property_read_u32(np, "power-off-time-sec", &val)) {
> 
> And when you test your DTS against binding what do you see? I suspect
> new warning.

I checked the build logs (from a clean workarea), plus run-time dmesg,
both with the DTS change -- and without it.  There are no new warnings
(specifically nothing mentioning snvs-pwrkey or dts or power-off-time).

If an invalid value (such as "42") is chosen then the probe fails with
-EINVAL as expected.

Is there something else that I should have checked?

> 
> Best regards,
> Krzysztof

Blue skies,
Ian

