Return-Path: <linux-input+bounces-10871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE6A64153
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 07:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7DC3AF1F8
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 06:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B542192EE;
	Mon, 17 Mar 2025 06:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="DimBurDb"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7821507F;
	Mon, 17 Mar 2025 06:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742192577; cv=fail; b=hAvlzmEdn9UC9aEAH0XDy+30xvHpvgmQ+b0oAnJbTgFp/xBRgTqEhH+M/dhT917sQCUJlz6Yd2xm6VUS5wzzZnEbl1wJZ6hsIvB5OTCLIpLLyGr0wBjWWUHUumG8ymcWaQKrfGNPiTK/OQMPW7IWq4Qc9Gg+z6JCxCgBPpfVEMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742192577; c=relaxed/simple;
	bh=f4593QtVg7E7viyq54Q1wQlyw7qSuGWU3sZnOxroTG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8fz7dvLNP5Fix1KYs7z28gNB3diGqSZGubQbISn7UeHlz7KR6UxORqv7OfKauWn7NlsUNg0A4TK2tInRGQUuxF11zlQ8XPPj7KBed908iXyoUSBACelWRavq+6QPpK5eHvb13K0k9xGPr9iVAQ67EfX3BhGv9vZZDYSbPo/SFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=DimBurDb; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdvN2Mn0ICkMGzxeUsfiTQ5ZNcHgh1ZG7GHy49pAYOOTvpOzW1l2YQagrD3jQ2wv+EC8wUYErdHDxjfxgIrZxgCs+18gu8E8dr3eBBTnJyQygJyKYHGhVIlZ/TxBUhn/VSaW9I3iQO46hnNTbVRhXfU1vyEt+2ZctuHUMvbJ0zeqeeZectk/CyHDiuaFW7fBrcjsD8bDcsRW2eaLcJeIBellnGivvThGweLHTrV8FtLp64GTWt0rY7qYCUT+eSRV8tegssmLoV0cnge7zKuEpAGJ/mh6KieP6pYlaoTeHZSiFcF0cfh79Oo84PE9Cdhzsif7XbSfQG2nmMotYBzNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYbCSNqZ88ZykJcjGQLGiBU9yUodSz7w+NaeStsU994=;
 b=hisgMzD9MMvw63k97FBNfQ6e6ei5QiG80/Y4l583C4ay+EOF4WBjMkxPznLltOVlYA3HOHFQ/1rALNJxeLV4vzftQfFdulFsiD5EDThwgRjHRaO9nZP3XZ/9sC1GJ1vsGASkN/n23TV3K85iPH3mL16cdX4GzytV+0Hw/wNG25s1kUnJG+yRhnkaZ1bi7XRX0ILWSKDpuiIutiVoyB80mUFe8NncRJYhuDtsfFu2BSWJReyWZF8WpoBtWCyDkgDWw9gjSJejj1Qt+cK3Y91M9CFwHbY5O7kBPAvVyic+XhPQzxaKUM1INYn6X2I42lOS/r1UHWw4YAVWjzeyxU6New==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYbCSNqZ88ZykJcjGQLGiBU9yUodSz7w+NaeStsU994=;
 b=DimBurDbhs5CHXUyEOanVPRVwvZHujcTA8i+rjB+c3TQELtYnqMm8rS0Qw7v9qk32agIXLz3R7a6UPhZSEd0FUer49+3Ssaet4bSUNv1zwiMc13MmRhD1nkl7SmTa0APjdiwJaZis8mDZq9Vi3gTeqyRsVscj2dfWY/RJkix8o4YiBgV/soXY7Bh0CMCRVT6NoCYIb+cJEaQgFwihRVmjlobqUbYc3lZ8YxCoub5vFkbVfhmXPftkNooR9/OymDyvhm5tGOalVmRATk692qiXzYLB4aDynylv7wxU4faM0QCt3G9n1r8G1Jtopx7+ers7yyq5uaJ8qRnz2AnSZPjHw==
Received: from MW4PR03CA0062.namprd03.prod.outlook.com (2603:10b6:303:b6::7)
 by PH0PR22MB3955.namprd22.prod.outlook.com (2603:10b6:510:2a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 06:22:53 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::a2) by MW4PR03CA0062.outlook.office365.com
 (2603:10b6:303:b6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.25 via Frontend Transport; Mon,
 17 Mar 2025 06:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 06:22:52 +0000
Received: from 9d87bb81463c (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 46B95AD528;
	Mon, 17 Mar 2025 08:22:50 +0200 (EET)
Date: Mon, 17 Mar 2025 08:22:44 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Input: snvs_pwrkey - support power-off-time-sec
Message-ID: <Z9e_tDOj60JZx350@9d87bb81463c>
References: <20250314094213.902-1-ian.ray@gehealthcare.com>
 <20250314094213.902-2-ian.ray@gehealthcare.com>
 <aa893df6-fe40-49a8-920d-7d7240bb18b8@kernel.org>
 <Z9QuC7tZoXj3DRZs@9e5302bffcb7>
 <e58f5851-9988-463b-824e-ad3da1137c33@kernel.org>
 <Z9RBmVQ1l6wx_WJf@c052f8094844>
 <97cc25c3-4538-4f28-a551-309943ba0768@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97cc25c3-4538-4f28-a551-309943ba0768@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|PH0PR22MB3955:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec35656-5f3b-44ad-8a8d-08dd651c2645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ff8S2zqV5zMwMeoTN0+cBnh3/Pmm7OFD3GyJrBGuElP+azQNh58AgitsfNkH?=
 =?us-ascii?Q?5evxjFOpQ2Xz+/t/M9RYNOD4whYyM6smBlRx5s4B1nIkwJWjAdJwm9HtPTYT?=
 =?us-ascii?Q?vmaM8cssRhq4PB3wVrQKacokLBDwPKSOarZP34KT3xhIISACuRAq0iqOxuos?=
 =?us-ascii?Q?LQdohuR8Bs+Z5vwvje0r/NK08Emhy/SIJSiuvDO5BxDkybeDw1hudmIyFOf0?=
 =?us-ascii?Q?VaeHwtHed3sqACVaUJXfhqfpAg+cZOL2F/7NTO1g6gU1wR0B/O+6ZIopp0uo?=
 =?us-ascii?Q?5Wnpu7Ls91IO+zuv9ZohiI7xUUE5vJOsiZ+C4JNxqyfgvuKZ836oxUkh5Oku?=
 =?us-ascii?Q?jpM0JaGeYD2ekrsbIBsoXFMebpFK25QX47P2aa3rfp+1d/DulDiAqZXE0+Au?=
 =?us-ascii?Q?h9R8pBohixeAloPfCWDRPizC7VwAOPFvJwy1vf2V2PXQJAg/xkDY6RtASmDU?=
 =?us-ascii?Q?Z/Ku0b4f8LeBNFKu3Jic82K/+nmGW7d7E1er80AGsKMbWEue2jF44URTyvVw?=
 =?us-ascii?Q?d2rfDqCx41D4bjLG38XPPwg3l65t0WX0lNU7rRObpFd5XITZS7FW3b1TZ4ON?=
 =?us-ascii?Q?Ijr7+wMAGSkcfNQ8Dbx1uCzXBtCQqU3DcE3lg9Y3qxEsyU1c0oGgOkcRokzr?=
 =?us-ascii?Q?xY1llxtgdeDXOto2gTp056WK3rnF2yy7FV/mJXFAllJINP6rGol0kaCU9AJz?=
 =?us-ascii?Q?dMEkplYs003KrvUJp3t9GMjyqjKcR9gh1IC2bv4oWBk2tNn1WShVKAjLEwQd?=
 =?us-ascii?Q?c8RO3+mlkd1FH5NFbklv3Emlub+VfHnzrwGXAMpe6g0dOOfj2K6Qu0V9mCT9?=
 =?us-ascii?Q?FATsb5lrEcyLt4bPq94eJuJyk2xkxHWm4KkTUVR0s5b2ZalQ/cXgl9fp7pwI?=
 =?us-ascii?Q?5dEsvLwITUfOKJdsrG642FUQRSLjI1V83W3CGZxLJ6/GvtUcmFjb31a4Bd8O?=
 =?us-ascii?Q?JgY0kjNgiZvcW3jmnCyABhW9KptUCgGa5mBAm2Pc6Buw+75vHADETJpfL8DW?=
 =?us-ascii?Q?cQLnqm0Y/y7rPeB4RHLWYSFRTEX0kBVDk4ohhQPhvvP0gcvbL4ee6OlXVOt2?=
 =?us-ascii?Q?Y08MYS+TTdHMbgnF578A2eGOich0wVlge0XkrR/fWil8uYyHmnJUbxCcn1p5?=
 =?us-ascii?Q?bpbgRuTuG7qYGZij4Nj898bck6uJ5HuF02JCNk5Ka3M6UXWkD88Fh7aaGjn1?=
 =?us-ascii?Q?WP44hX2Yn3Jb8Fo55/U4W6iQJVREaAsKs/6Tr9DVbC0UZu+40rAkIoW5KGNQ?=
 =?us-ascii?Q?J41kxTbj96FmDAY1dpc2IcXclXpNHP7RZMEddyk6jt2kXWAAIArPQ/SPVcBB?=
 =?us-ascii?Q?AEMH5n3FKQG3Nq/1frgJ74CIm6mCZjzE5lYy79rFQHnZ1xzclTi/LvJh/cTQ?=
 =?us-ascii?Q?fxiG0/n9hJCT1KAMnbNDioLG7nC9qV1gSL8G0pZyokTUPV3EIjiPL3USqDys?=
 =?us-ascii?Q?7n12p0GD+ws=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 06:22:52.7841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec35656-5f3b-44ad-8a8d-08dd651c2645
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB3955

On Sun, Mar 16, 2025 at 02:03:52PM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2025 15:47, Ian Ray wrote:
> > On Fri, Mar 14, 2025 at 02:31:12PM +0100, Krzysztof Kozlowski wrote:
> >> On 14/03/2025 14:24, Ian Ray wrote:
> >>> On Fri, Mar 14, 2025 at 01:55:47PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 14/03/2025 10:42, Ian Ray wrote:
> >>>>>
> >>>>>       /* Get SNVS register Page */
> >>>>> @@ -148,6 +152,24 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
> >>>>>       if (pdata->irq < 0)
> >>>>>               return -EINVAL;
> >>>>>
> >>>>> +     if (!of_property_read_u32(np, "power-off-time-sec", &val)) {
> >>>>
> >>>> And when you test your DTS against binding what do you see? I suspect
> >>>> new warning.
> >>>
> >>> I checked the build logs (from a clean workarea), plus run-time dmesg,
> >>> both with the DTS change -- and without it.  There are no new warnings
> >>> (specifically nothing mentioning snvs-pwrkey or dts or power-off-time).
> >>>
> >>> If an invalid value (such as "42") is chosen then the probe fails with
> >>> -EINVAL as expected.
> >>>
> >>> Is there something else that I should have checked?
> >>
> >> I don't know what your build logs process has. I meant dtbs_check
> >> against the bindings.
> >
> > $ dt-validate -s Documentation/devicetree/bindings/input/input.yaml \
> >   arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dtb
> 
> 
> input.yaml is not your binding, unless something changed. Did it? Is it
> being applied here?
> 

Ah, I see (finally); thank you for this!  Submitted v3 at [1].

[1] https://lore.kernel.org/lkml/20250315093455.1100-1-ian.ray@gehealthcare.com/


> Test all bindings, so your schema will be applied.
> 
> <form letter>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> </form letter>
> 
> Best regards,
> Krzysztof

Best regards,
Ian

