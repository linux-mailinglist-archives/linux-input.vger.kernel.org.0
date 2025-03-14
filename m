Return-Path: <linux-input+bounces-10812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4354A60C06
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51D73B6E65
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 08:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27EA18FDDB;
	Fri, 14 Mar 2025 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="HMpPJkOJ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D713B29B;
	Fri, 14 Mar 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942104; cv=fail; b=AGYzUmVuUOhMxgGXmCON674K0yh92ZSPKVDuOcKIA4ZalWfh/4/4NlvMTs+ZFZRqGeSFTsI8lZaliCf1NNKHZrmL6Y+7JEeIIQgbANGH9KxzI+i9MIeaQ9v3hNvpIsrTjfSx8FMR0JomuQwjomWmVRRMsWuDhvBihZifR674TzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942104; c=relaxed/simple;
	bh=cke98aV3hsZ+qZR2l5JkqT2402lEfR6jjUA3et/kfUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPY2qiltw9gMiwo+9vchsw06JHpvgMzGlHjZFhgHZnIzvc0uOgipE6evjqSBk2YI0EURIeaVqNUKSD3HBMRv5C9RozZwh6ViUCTKsp4fB06kB5cFPTyrMx6LDcJ7jWhegE9C9O7llHK34EpDtml2EzO4U7QfSJd6hLM8AMxdrYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=HMpPJkOJ; arc=fail smtp.client-ip=40.107.102.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9RmsLe4RhpFBztzZdg56G13KX13ZBDN1hor7wLicoUQN3rnZopAf7FHwtFK+eXgB20+VjWSeohEWGDgP5epbxd9Zq1RJMLJnNIeYr1ZIpgoNTruDRC9Dz9RLIpC1A2O3Q+8GHYfxqbQKtQOigwEkSwaePJOgE7sK0R0qyast9tBG4OFAUAMBf40IbI/sIl1mX296Yorfs6QgytAq0TamCA4cNYztfIVyXJY8ZGxQUuJX0oUBogu9N/fYgqDGfjzn4FxzXZyQDtHGp5AGXqn165mk6PZ+o3QB9DWkuBsnC0UUtY8Aw6XhREnrOLdSdm14DYBoPRjouuYey6ex+2HLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/NsMyolPRjl8g8QWzPGHzwGh17LvMmQI8+xYLAjnvw=;
 b=SbkmX+CludwNsRbScIS5GpVCGTM+XKGns0Ma1NtBd7mWLa7cSEKGyNvQeBo5k3/WNxsasZbvduP4owgdh+riOTBHD8PVJShzZKmuhlo6Moy21xVAQ1gUupDc4cirjQnDCgnPXxuZXMtA4tjwnvBRXwQLNcnfWrZuYLQ7BzH7/LqDVH2HqWUu9179ph0iISZNUWKtlm1OjkLf5aL17NuiOL5Q5b8JDPfrTcQ0ZJ9e4UXTdbzSsM+CCul3C8Wwa8fu7sCDwzThIsxK5vdjaPFnYdHxLOLh0z+vRTLid4gFyjvo0R+l2uaN6PNG6Y+wKkkefLWkqWtfmVQ0LNtWIqvAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/NsMyolPRjl8g8QWzPGHzwGh17LvMmQI8+xYLAjnvw=;
 b=HMpPJkOJ3ebYzxOpqR8aP8LzEr4ZpDZC8ik9OhRQvSd/gztyJXYnj+Cfgb5+AdKB4C3bE55QFDho8Y6+f/2gpunv4K+GcqRrSJu151IX9Bih3zkr+IV0AM+t23We9VP9HCNyVl1BHXlzO88N1rujRApMkq939aug5f1NF7JnnC3PTO8B6Pntk0LzDCpxLBZTwRJ5WdK5nv6W+PSheUAUf16Lkw+cV/IDYQOGkLs8vhyymoTXEiGrai4Tz5ZI3S1vuOFEf+QCXn89w0w4ImRQiMnbACwuY2spltWqx9GmuM/483plGwjNAz2bnOKVr8geAOGnckruNjKl+CgrQXes2g==
Received: from CH5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:610:1f1::22)
 by CH3PR22MB5548.namprd22.prod.outlook.com (2603:10b6:610:1e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 08:48:20 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::d7) by CH5PR03CA0009.outlook.office365.com
 (2603:10b6:610:1f1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Fri,
 14 Mar 2025 08:48:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8558.0 via Frontend Transport; Fri, 14 Mar 2025 08:48:20 +0000
Received: from 147b7fdc759c (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 3FA52AD528;
	Fri, 14 Mar 2025 10:48:18 +0200 (EET)
Date: Fri, 14 Mar 2025 10:48:17 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: fsl,sec-v4.0-mon: add optional
 force shutdown time property
Message-ID: <Z9PtUcYfjq9SB7_W@147b7fdc759c>
References: <20250313114453.702-1-ian.ray@gehealthcare.com>
 <20250313114453.702-2-ian.ray@gehealthcare.com>
 <20250314-omniscient-screeching-lyrebird-d7ee1d@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-omniscient-screeching-lyrebird-d7ee1d@krzk-bin>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CH3PR22MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d74715-555f-4115-e29b-08dd62d4f909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3M/vgrNULPdv+DjQxcKbvTvyk09zFwNmxAYkWHj4sq8RlVPza6UGaNxobhgu?=
 =?us-ascii?Q?YYQXeKe6hlgvnOFGtIn3pC6yxvscoSppHjepfli12hSTvsfdZf8mFreU7TUN?=
 =?us-ascii?Q?6b7uHBJ/LSabS+b+hFDu4IUaKcoZvH2fcJxjz7PDrw8G3mqodDGHuDR3m+lg?=
 =?us-ascii?Q?M7CSciOVNyfDj9ohaN9KmTvjp0tfoDZdZyY2gy+X+WoTvCHEo4JEZhHgSvJI?=
 =?us-ascii?Q?9Px+RhKpYvHD8zeuptG5JT/IpRPn4fqrlwhQJCl/YkC+G1GWz6gxxGaJ83T3?=
 =?us-ascii?Q?JoXmXRo1pcH+F4tPOufa/E3Q16l846CXkJAb37W+od5JW46sueO+4M2XSOLx?=
 =?us-ascii?Q?PxAUqzz7ORnd3OnjRM8uDTWnZFZv34Akv9dYMcRW2ilyZ/97oCymVT4jpSNs?=
 =?us-ascii?Q?nqe6tPR8hxbE4JJUwY/mrc+V7+krX+otNgAocA/WOIFur3z4Bl64ViSP3GnE?=
 =?us-ascii?Q?AS8Fe69s0xACDRyfgiVAMg/B4k9S36LbpIEg+rUEhlcIFrjzHwlfCthzoLyI?=
 =?us-ascii?Q?Zs0oLCBEvCrCOzVjIhKM2I7QTn07yP9u3LQKyn9FQwu8sBIXlxByXkeH1Tdt?=
 =?us-ascii?Q?YygJ8ZzHonfNbr8dJ+aPoU6mxHBJcgOPOZMVOW/+0ARctYn7JIi8N7A2LGma?=
 =?us-ascii?Q?heggLYXYJGhlUez9X6biGAT+4m/VxPCXVw6kEapiB6GalTXIIqTpK1sSfOy/?=
 =?us-ascii?Q?gEtlQhfqn0x3oLN8zqoWMX+fjryX5ufZRLH4kHuhlqk+PizKlQ+QKrR5/zgL?=
 =?us-ascii?Q?r+pa07AmUiHCnx7cc3622vNI+DJS8OaxBjq0mjqqZqDQYkHZ7seVszKvOItX?=
 =?us-ascii?Q?jcMo9QbBhLMppyanvohxZWltVE6F/HsfhFbQgHENoFyeTdgq1T6eR9cZG6qW?=
 =?us-ascii?Q?RRyMCRticH7VftSrpZtOa1h6oKDrAm6Ea/GOSzOGBvgYoGS4k1fcmQaOMImo?=
 =?us-ascii?Q?zKrtrI15hjMrqSWTayr402aw02dETPvcJ73xxQUo2M8c7/qQ7XlN2N8q+dCs?=
 =?us-ascii?Q?XvFcALYIIHrStwkA8NNckuTGdFlEy37+4f21ZEb1/cLa/q3E+YGzpey/kJr5?=
 =?us-ascii?Q?olAiYBByzqRVTGpTrxwrrSFVuj2d4jqdU53I0ECKMmOTL2TysBWXVcDaHipZ?=
 =?us-ascii?Q?Q7xs/V1TvmA/TPBBwaWuYbeLvj3ZBnYSzIO+EgbILJma9P/IP+gqPKXDff37?=
 =?us-ascii?Q?uKKDQEFZaF5X4Z1pLGC5pI9Hs9745scZ2o9EdvKr+AQFWy2crCx5b682G+EF?=
 =?us-ascii?Q?Dwp4V73AVLXqWzpE1Vm+D0A0Xn19zPtJRNn1z8ovnTysfbgrcDIC67WnkH3k?=
 =?us-ascii?Q?pzjnx0GiEjTvjrcYJyp0ToKsp8wgozOCJ5QTjF6sYc2fqIuw7QVF1pphwLwe?=
 =?us-ascii?Q?w2PwjwbynoFqEbw5IyknraW1yIl41JWTyUQbsbh+diUmYDIquXNmziHpFKg8?=
 =?us-ascii?Q?1/KWLNcGhJKPK6ymdYc43/4kqKDS73nXpmHuaXRFYDjtC7CMyROVI+UWjECU?=
 =?us-ascii?Q?vcmvM/Jvr3Pr5QA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:48:20.4585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d74715-555f-4115-e29b-08dd62d4f909
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR22MB5548

On Fri, Mar 14, 2025 at 09:44:03AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 01:44:52PM +0200, Ian Ray wrote:
> > Add an optional property to configure the force shutdown time.
> 
> And why is this hardware property? You described the desired Linux
> feature or behavior, not the actual hardware. The bindings are about the
> latter, so instead you need to rephrase the property and its description
> to match actual hardware capabilities/features/configuration etc.
> 
> 
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  .../devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml      | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> > index e879bc0be8e2..ee282c352535 100644
> > --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> > @@ -111,6 +111,14 @@ properties:
> >          maxItems: 1
> >          default: 116
> >
> > +      force-shutdown-time:
> 
> Missing unit suffix
> 
> Missing vendor prefix
> 
> > +        description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
> > +          Configure the long-press force shutdown time.
> > +          Setting this value to zero disables the long-press detection.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 5, 10, 15]
> > +        default: 5
> 
> Why existing power-off-time-sec does not work? Isn't input schema
> already referenced for this node? Looks like you are duplicating things
> for no gain.

Thank you -- I somehow completely missed the existing property (which as
you note) is exactly what's needed.

I will send a V2 which uses the existing property.

> 
> Best regards,
> Krzysztof

Thank you for the review,
Ian

