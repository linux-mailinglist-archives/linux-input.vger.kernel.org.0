Return-Path: <linux-input+bounces-10844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E7A613FB
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 15:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830113B6B03
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 14:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5917E1FF7BB;
	Fri, 14 Mar 2025 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="IXVbpurK"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4E21990BA;
	Fri, 14 Mar 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741963680; cv=fail; b=ShzJkviAJU/et0jzYNYFltcEdgRS9wkji2CGorf4gTluVwqZcfBJy6DyBfJqJizd1QCgdix+rQVkFOFX6ZqMh/Ns/1eFISgP4vlQlKl363FpL7ZS3cPxlmwWH45zGuFn5bXrMAl19xMxfMJENmtFhLhuULdHXJ5PBQQgDc5FCfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741963680; c=relaxed/simple;
	bh=veYCNP82rNEg718cYCYz3XaKJcyW0+969rkaEXYyvK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9+7huL9w3NJzj/93at9iTRDbMkjiwnO8A+fvoAsGRQtfIygLZtg5fPOc/Q4F2yr2KWhMjoUuvhVrUY/bcF0k7yOPJA1Yu84J5YmBeB+g0bLFDAGGVXAt0GIKgMrEZbMAUp4b4jK70b9pZibPRXCup/9yfRFLkqMiAvWPGEMsaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=IXVbpurK; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLGZghhl+UdXJHrNG7jDdDhQKFOVjlzLdPF8NO8n7HOf2JSIDGl+D9BGLUUPLPZP4eJXBuRXq9TUvLyav3IcB725YZTURwPkNKeBC/3gQyfMGnNbWATYWAA62Kn/x1qycfLG3uf+RvHmbX9sd2gLlwYxZ963IXm3Up8S0DDd2nNCcwmC1yC+iXElEqSx35B2h45Ez/OnBc55uuxqDeIfP4+jn3JWbyoOfWlbiWGOZsDvIJ3fKtLNJBFeYWRO3Da4UZnhN5DJ5wLgXT0kLJz/2ls7tOZv2NagbeXEXw1FPL97oNB9hLYOC87R7KDAWEAuU+AVmPBjb/uqESBAey4Dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUBamJ54EdXPYW03SkJQHEqZiTZGzheXK+zQaYx0Hmo=;
 b=VhKZObECJ9zgqGtMh7JmZpCp3UYsOPrR7dXXFNJVJ3Y/6IkQX5botxn3bv6osXdSC17MOvfeXd4fQLFbPOTHlBO2AZ/nerSsKOuVj4eu+JHcWSPcm46w2AUVkM78YbedRx2YUrOTl1BlSuHeWZkFQnpSqRXMA1zid4VXiA4FEx39mIDZgIPdNOcjpkNUzWM2G8jz5FCg56WFny3DjnInnPzsFaUxWRrP38FVI7R2JTmWdI35s9WrIzJ50mrwN1vd4YCX/4Jd9dNKRVf7BWu47HCINfBiAhmfM3ajnT8/vtUNq04b8c6KY90RyrqtlkJcDPT1gWH8u93JJfoEJD+niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUBamJ54EdXPYW03SkJQHEqZiTZGzheXK+zQaYx0Hmo=;
 b=IXVbpurKMhdgExGkvj+6nUxmLTkC6HyieovDfEe9H84LM57lj0wUXlfpQm0aZ7JQ0ytTwdvEbDwDbLvoaXuEv3jeCyivDyTii5lqEthGFFKLpTV8/l+TropOPNa+JMx2M3UiUSoQjPFBPWZvyUbs7IpggUGRsNOgmQeRgmzb2zzMpuFvOwd/BHEQOFSHoz5/NMq4oLLhuHDJjXgC3AfEEZ9ID8flR7+ap2yrepz/ic2Eip4zPLUjgrMRvpoqAeSClqKtsBBUs7AsFldm/oVXgxZ8ZPiUqPPXOlliieV2QOuvI3N/VvmZ3M44HBaEVx9CUz/viveFc9gJJ0zZE8SAgQ==
Received: from CH0PR03CA0388.namprd03.prod.outlook.com (2603:10b6:610:119::30)
 by LV3PR22MB5231.namprd22.prod.outlook.com (2603:10b6:408:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 14:47:56 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::9d) by CH0PR03CA0388.outlook.office365.com
 (2603:10b6:610:119::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Fri,
 14 Mar 2025 14:47:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 14:47:55 +0000
Received: from c052f8094844 (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 8057CAD528;
	Fri, 14 Mar 2025 16:47:53 +0200 (EET)
Date: Fri, 14 Mar 2025 16:47:53 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Input: snvs_pwrkey - support power-off-time-sec
Message-ID: <Z9RBmVQ1l6wx_WJf@c052f8094844>
References: <20250314094213.902-1-ian.ray@gehealthcare.com>
 <20250314094213.902-2-ian.ray@gehealthcare.com>
 <aa893df6-fe40-49a8-920d-7d7240bb18b8@kernel.org>
 <Z9QuC7tZoXj3DRZs@9e5302bffcb7>
 <e58f5851-9988-463b-824e-ad3da1137c33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e58f5851-9988-463b-824e-ad3da1137c33@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|LV3PR22MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 9670a8cc-d753-41a2-f4ee-08dd630734d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YyUUhWIwKNn+VeBc+4DBMHhxlMSJS9OzhnC6wnDUTX1gK9aE4nOE6akwayxQ?=
 =?us-ascii?Q?wApirT/+95uQxoK2zCwd240HZSV3hfGhI7ErB3lt9AC//IoazhexDRUea1Uq?=
 =?us-ascii?Q?usLWkwjZA0pasFkPah+LgNLJTVhwuZefc/RDFfG7mdoeLqbbBy8vKVuK336Z?=
 =?us-ascii?Q?P2lJ6WTsRKWzl8w783KIw687ql16oI7dsSkw9PH6M/63Tk6QZ3Epn95OPFFz?=
 =?us-ascii?Q?23GiPlzO/9cMnSQlL0QQb1cvFFRHoV19QR6k5QfwAwHG5yQuJoKiTVO/4YSU?=
 =?us-ascii?Q?bzIsa+PfSbrrzymXBga0p1bMtgsMFzoWJN2fh9LYnJQeZhrxWNzI05eKzKfA?=
 =?us-ascii?Q?A4AKDgJ0iv3dRSgCD9CHnVNiQOWmrLnALXix1NsIHRtO5URY8+hKGz5ivJ0w?=
 =?us-ascii?Q?MYAMfvbZm/7pjWhFb8IxzsPTGe/Z+9GZHrt0IMyBSPhTadMWWD+jDB17kwCI?=
 =?us-ascii?Q?Jy9ANS4q4r/Qif9ibyQP86ymE7AoQowLMCcMTY+iZPJGd15MFsvVLkpBmOP3?=
 =?us-ascii?Q?SDkedr2HfWM+YonBjyXAmXIso1LyfUkIR0HrJKL+MLfQHeepT7VePwtk1NUv?=
 =?us-ascii?Q?fKaLx0KChHcsCIGrs+bL5xg83DIuZ+VM5x+dpf8HNqyzZaUFpTCt1rNvSoZo?=
 =?us-ascii?Q?yEQ3qzpMxkdvFRWJKgHDA4UzSRGFhDJnROlbDREAqLT4bu2/zHFsJrDC51Mm?=
 =?us-ascii?Q?VsNhbzl6sHVRWgwNXIQNcymihmxwyOfwStONOqcg+nDEcUbNAuUNre1Ygqjm?=
 =?us-ascii?Q?1YIl6PCD+dqCFdCj4lZNfBxxKxcGH7ZoPod9kI1Pc03srg95RCq4AhO9VxTk?=
 =?us-ascii?Q?OfHBNGfE+ptK7ZKfgDjlE7QNQtkqIV2L0s4Vi4FVfwx6IYTB6tyTSWPQMIrM?=
 =?us-ascii?Q?NXICZ8ZMbSC6bP8R+20/1S36SLMxcELdbhQYxz177HNo8Pjz3krWgptZ9qH5?=
 =?us-ascii?Q?5biWfMyK/9JWv8+Hx5pN0IJ9cEHsSoKFF9Q3UOHpjhilx6mWUt/PFvPsL6SS?=
 =?us-ascii?Q?nFtleaV+4zTk37c5xK7Zs9/NU9ug3EUn7fA22LQ6ft3J/vQM6gUNtkOZV4qL?=
 =?us-ascii?Q?KG0/U7a1M2JpUaVRCJ53ahi5Sn2/x0wHMJ8rMiMiigplYByaE0a899R3H5vz?=
 =?us-ascii?Q?SjJaWeo9CvO7ztn2lGkep/Zj7GYAPH7Yg+souUaSRkaImCAsLjETSDUmLHYQ?=
 =?us-ascii?Q?oYu2+5SCH3SSOXMe4t5UWigsPqJ0aK/q7VTBSAOTZ/f5NYm6NUzAVrb+V8k9?=
 =?us-ascii?Q?L8q+3VuV/YGtC18FaP+GPdMquEG2b/5+fbftQCrq7YwCzastcXlJ2RwZgRlS?=
 =?us-ascii?Q?YyaoAxMObWStorc9X5/kMje1UIDHjk5pcDqxTM/uo5SR8/Gpnye0zb3r0u6F?=
 =?us-ascii?Q?5XSwn6xxnDRb1cZ68hqOYRGpSKsDfCQ7ysVcvwdciuYQYUMOgEZKcDU6BjYP?=
 =?us-ascii?Q?PwO4Q+sf17dohvomydXkX1EKrzNToOtOS5AXTMf4vlahhpRC7NhfmXPI9S6/?=
 =?us-ascii?Q?Fn3h/YTbzj/FKUs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 14:47:55.6532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9670a8cc-d753-41a2-f4ee-08dd630734d8
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB5231

On Fri, Mar 14, 2025 at 02:31:12PM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2025 14:24, Ian Ray wrote:
> > On Fri, Mar 14, 2025 at 01:55:47PM +0100, Krzysztof Kozlowski wrote:
> >> On 14/03/2025 10:42, Ian Ray wrote:
> >>>
> >>>       /* Get SNVS register Page */
> >>> @@ -148,6 +152,24 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
> >>>       if (pdata->irq < 0)
> >>>               return -EINVAL;
> >>>
> >>> +     if (!of_property_read_u32(np, "power-off-time-sec", &val)) {
> >>
> >> And when you test your DTS against binding what do you see? I suspect
> >> new warning.
> >
> > I checked the build logs (from a clean workarea), plus run-time dmesg,
> > both with the DTS change -- and without it.  There are no new warnings
> > (specifically nothing mentioning snvs-pwrkey or dts or power-off-time).
> >
> > If an invalid value (such as "42") is chosen then the probe fails with
> > -EINVAL as expected.
> >
> > Is there something else that I should have checked?
> 
> I don't know what your build logs process has. I meant dtbs_check
> against the bindings.

$ dt-validate -s Documentation/devicetree/bindings/input/input.yaml \
  arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dtb 

Generated no warnings.  Which (IIUC) is as expected since there is no
change to the bindings in this (v2) series.

> 
> Best regards,
> Krzysztof

Thanks,
Ian

