Return-Path: <linux-input+bounces-12011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 873B4A9D932
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 10:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C09E01BC7924
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 08:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9241CAA98;
	Sat, 26 Apr 2025 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="DnT/rlz5"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B6C86348;
	Sat, 26 Apr 2025 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745654548; cv=fail; b=HwWiCCVKPky3FinEfhvYknc2vDsecUiQ/lEZtKGyUrK4JHc/+O/BkYblwVEHLgj91U+bTExpJ4EJvPEyfWPha04sWLaWQJy0xOPJKf7q/CbhYP4lTwNjmTCLDiO6s9gHfe6XCdUmVkCgytvkmrgivRWdnjWy+oiwEwojdsQGAE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745654548; c=relaxed/simple;
	bh=U+8FP/x9LZle2iCgbYh1dEAD3pb/exuq8lkYcBj1G4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/987j0milhU6KTJmFH5X86iV4R7uVyQu1c4HdcZg6j5AH0CbDBI97IRsJDw5S3jn7giTiZXr2OwHS9043P1lbwDqhxMDZTXnZVBHvCRMcn/Q/1fpTHzocXShF6rYrmFZGq/UYZFKASWJG1YOiSiPOvumrD/hXRLDyCzCAdfODw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=DnT/rlz5; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAyHeJVsxD2h5TJ9fRF2FFgTYIfNW9KeD0uZgY5dy1iHAN544FETYN99/GOZPJuk86D7ZcR48IxxKbmUnIN8ciM676uGQsBiq7LFnU8zMvTAKKyXSZkBvAn9ETCpykJGVCJy6vFihsT5CITlBtq0UR7lHhCXtG9mCaVuqyxpUX3rsXZtCrfzvAjY+YbqtKviwPzeQT+/dRZEKraZjr9WOKFHf12zKm3CC/ECyLv+CHvNs7NRpt/dbeXIZdyoCVVYkidSjRoHIqNfriVs9kJIdD0S+lAEiy0hb9407iYW9lKpbhAwL67ovyfe47BsmHWCJyRRakKO+p7qkS3coKvQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9iKqXQnkMA6z5k7QiSf/jiqjOgw71113zOXIOODwtE=;
 b=NSF+3x9isyeiWK8GcCu3Fg1A/4qAFlxn7IJsO/EXqYWuxFhOIjWXjK54ZaCez1FRQactUhs6SidP2egDekDbTk3VYaTK7lsWKiCMqwwFnmAGST3su4QvF3BKWv8acCwe1CCMf0d6ZgKLjw8YIPPIvndSiRP0UBgfCFfzb42lzuxmkx2xvy+35HpqJkDpAPHT6BJhVmviIFAKCAl2pNmfuaWExLJEDWt/H9toeHdiIJ5456xhFGjJcWThbWjhWkkE1MZ+MYlQMo4GraULv84YqkDLqB2VM+Sf5QQBZX7GMJTdONb6SL1sJyePuuvkja8PmjnpqhFz/x6ZIhZaqs7Jmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9iKqXQnkMA6z5k7QiSf/jiqjOgw71113zOXIOODwtE=;
 b=DnT/rlz51BDfYf8pF24YA97t+FVPriFbQB0JM80AlW5s41xzuHiaVYD9jkZqiV2SkucqoLSrT51SpX36w6aPBbXhVUmQ1uXbMAd6h5fWPPMWSFvEmMDCjwA/3iSPKhlreHxNzQ1i/1Fn6H7sT6zMNqXIEjVi8W+do/IIYyNAMK7noprL9sfRTgO8O2HoXZy1RWcCQfuGeJmFf9lQKbrj/4E8b9mckjHDX0bMT+hcLH+FfoMs2aRcKVmFjRJO+GTjp+MpYh4ZeG5S2WX642ZEiqevR0ju6QplJPMh8Azg7msSCACo87ynVc/mm8qy14dyu8oq1g1PBSEyxZokfNGa1w==
Received: from DM6PR02CA0058.namprd02.prod.outlook.com (2603:10b6:5:177::35)
 by EA2PR22MB5357.namprd22.prod.outlook.com (2603:10b6:303:250::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 08:02:23 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::1b) by DM6PR02CA0058.outlook.office365.com
 (2603:10b6:5:177::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Sat,
 26 Apr 2025 08:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 08:02:23 +0000
Received: from adaf8b6b5b83 (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id B98B3CFB47;
	Sat, 26 Apr 2025 11:02:20 +0300 (EEST)
Date: Sat, 26 Apr 2025 11:02:20 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Input: snvs_pwrkey - add configurable force
 shutdown time
Message-ID: <aAyTDCEW47LzAxHR@adaf8b6b5b83>
References: <20250315093455.1100-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315093455.1100-1-ian.ray@gehealthcare.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|EA2PR22MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 99594bad-9c64-4d94-038a-08dd8498ad42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Iu10ODDjkbNfZ/0pJ7700vOK/wyMIUHN7Q9pkE3vDPKKYGJZEQYh8Tz2kUF?=
 =?us-ascii?Q?O5Y+ATfqbvFZKSwqkldp1G74W7Ql3euXhVmUq+kOV1CqYFscQOBaSY4SmPJZ?=
 =?us-ascii?Q?OVku4OJLBobFvfvAqKXmAlbcT2POrBDD76ksgsWdrcfa5EMRc08QLy0H5SeM?=
 =?us-ascii?Q?azAuOWLTkwcQ8VTLKrVyp+eIpd7J9wpVwEP+rWWPQCkD28IwPsgGCbdRoSO9?=
 =?us-ascii?Q?uMOinWXSeoTuUwG+whcV4ZUZV4XY8HiWmFHHOg7cZz4fyzo8WVagrIKp4esy?=
 =?us-ascii?Q?sXl8zoz4+B9lBlcIyupDjEgaU6+60p0rU4G5uRgk7k0ykwUUACJr/12PQM5F?=
 =?us-ascii?Q?CypONAJVMFLziUHQqhcEfcFPKj6mCjfZgdnnp8J78aM0+oo9QmDJFYiDY7W8?=
 =?us-ascii?Q?Wh3qQ33fOpiTFucYTXGFWgcgZi1X5i3rt87L9awh0vb67YyB7ctVxX/v/9YO?=
 =?us-ascii?Q?LL16hLzFf57N7HlSH39hcX/SJknTO0Bpb0ZZBVPnrLvgLL8requlWP3RnxRM?=
 =?us-ascii?Q?Itf4XKryOUCvfHgrGJe0qC3bLN2JrszbNasYngUPasGwR6wJ5thRYdEckhfa?=
 =?us-ascii?Q?zqzhJKHqrMam+CyGFmbMf3p1ZcgKrMjws/cqGXiecLFonJSoOpz5LzLItvqR?=
 =?us-ascii?Q?0MTdH2SezUMsMqRDW9tLGzGSXzd8EshB629C5G6tedbvhtuV51QK/0rCl/gg?=
 =?us-ascii?Q?8SXtDkFijAT3ZekUxm93qeyRhhbQy3qYAP8nq4p0SjzK1I8hIoenTNLHT+3y?=
 =?us-ascii?Q?zel89ykjW2wCAp3zt8u92gegwuWmh3j4rtFVRd69PsJfaxxsTfy/cy2uy5n3?=
 =?us-ascii?Q?hSgWpH09+0GE3cV23e+GsiblFrTWn4KwC4w+CYkl6U4Sj5FkR49BVGYkodlp?=
 =?us-ascii?Q?cll/YsPbxnla+0klE3xPXNxjRx/Y7OfXjEseTj+T+L2UCxG2dkxlS5mUpdoF?=
 =?us-ascii?Q?w7sT3gVl58B3cu38AHcOr4mkBAEDmf3Ir9VKTygvHL7FkPg+kjIXr/X7Fb/B?=
 =?us-ascii?Q?aiURKQrKIRXHCWl9aqH2LA4fOmrARwpOquAQr0IdpkYJMXJxuyezGxLmTk+9?=
 =?us-ascii?Q?NHdYiQj3FksAKQv+fHrri74rIsYWppsaBbA82K/7cTq8m671F4YJx/kTS41O?=
 =?us-ascii?Q?jQNmoZBCzfe3hr92A4l0xj58x5ls+VKYPMJXnhuRaNFqY5CaRnlUcE3AGMXN?=
 =?us-ascii?Q?Ypxa9TWEtVUihfThFWP6O7jMuz541TVpp8QDGRWKqnFtPNPIa9/yDtlu+pfb?=
 =?us-ascii?Q?XkA1iRbZ0m4oFqe8T/7c6Hh487tFGvw/nOZdQ6LUK6Mx5TOYfkExZfZ9ritc?=
 =?us-ascii?Q?Et0NobcqSYZKvFWDWmi7p0onv4PMVWnUXerSzXQzTFi8Fnu3/U49LespPLil?=
 =?us-ascii?Q?R3Qfr1mDSazGar5bjDHtJupIVazi5awFCh/uCyjiiKmNcKJBilT41A6CbEww?=
 =?us-ascii?Q?SMUFsNFycfnwd0LHwf7XMknKiKKi2xjrlu5VsjtqAhz7mLut4U/UYFUFj4Hh?=
 =?us-ascii?Q?VWuqW7Ca51/rLq1JTUDK1Pz5l9NNq0nyiPXW?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 08:02:23.0679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99594bad-9c64-4d94-038a-08dd8498ad42
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5357

On Sat, Mar 15, 2025 at 11:34:53AM +0200, Ian Ray wrote:
> PATCH 1 - update binding
> PATCH 2 - add support to driver

Hello there,

Would there be any more comments?

Thanks,
Ian


> 
> Changes since v2:
> * Fix dtbs_check (thank you, Krzysztof, for pointing this out)
> 
> Changes since v1:
> * Drop binding
> 
> Ian Ray (2):
>   dt-bindings: crypto: fsl,sec-v4.0-mon: Add "power-off-time-sec"
>   Input: snvs_pwrkey - support power-off-time-sec
> 
>  .../bindings/crypto/fsl,sec-v4.0-mon.yaml     |  5 +++++
>  drivers/input/keyboard/snvs_pwrkey.c          | 22 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> -- 
> 2.39.5

