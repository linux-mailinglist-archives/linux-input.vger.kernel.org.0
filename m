Return-Path: <linux-input+bounces-2375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C087BF30
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 15:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9141F219C3
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 14:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AF86FE1F;
	Thu, 14 Mar 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="NV3XMN8V"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2112.outbound.protection.outlook.com [40.107.244.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CE6FE02;
	Thu, 14 Mar 2024 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710427369; cv=fail; b=iVqNEmsDmjExH8DeW0bJks11e6ISIiSmZEe1tCdaoGrWVGBAGJfRqUGJa1qOBNabYyFyLjCllzxgB8bXQY+OCGf9OBfBoxI93Zqc3m+9vrguo+R94PwZFO9hxdORwAf1uPEMTL/IJlm/Pat/iWlEEJTu7+AXGr2fM1yMj9Gz76s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710427369; c=relaxed/simple;
	bh=0n9oVvWzKEbWOdihUJv0amb2hqZdt9oTxgZNnUg5BrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TXiyOxLSstR4hjBO85MJLNfg9zInYv6INTZKWQOUIyG4i0YPqsNKP2GRO3GJYifsvC1ZwX+KldqXMBJ/w7zVW6dK44VBaCIH5LgW4da88H/zU6THoAU4Ybpj616L8DrIc+ZNvUrXd8jV30zfcFackaatSkh/UgY07APDBIgymmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=NV3XMN8V; arc=fail smtp.client-ip=40.107.244.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRjlXFBGuPeDT8xC1QAre7MdCDrux1dY801afEI4waqKyEWeynnh+r3IIdChtFJbQDijup7uGHDUaksCO5QVtE3ff1j/B8QxFW412b3D14cQqSsbfOQCDlYWhpBNi/l23GrSIGuJ4FI6MYlE5/YDLowMj6P63kHch4lN8WX1bNkvvRcpZqeknhPOb54XN+d2HGnGIykqbsbm89NSCwvBv8uJngERFVkZYJKv3Zy8qiUyJ4VrGgXmfIwibMr3eEf+OtkS7Gd8NY2cJeSM296Plh7pV7lf6jYa3PVO2LUQob/ClGcAnXxXBUmMm1zE9hYjE4Mxmm+Ad14vUmfEVDwuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ryjEQQ4hgnEHONpJlpXDiXHYr+WbyZzWWcF5RdWcdg=;
 b=lwhkSL0weBxyMJdGo9xHOwnWNNUOrHh+fdWI5d0qO/rgnhuPXdmvTMATvp6R200FdZ3Snimg3PV2YC923hTmD2jTmMhUZnyiXpx09KGAD46+6bacN4WUuxcVHULGrZ2E+yVnYt5hqk+uqfhP0CiMVAlmKFRw039L8Yd8/Jz7BaoeGSwRRb/4wnhsh1OIoY7nAtB1iID4RfRSzIKvXX7dlT1pEqOItGEgUMK9hYef1nphijIx/xPqBFfVJ3V3aClBjnFJecXrViRuuaIZsUwoVNPGzFr2K7t1z/mXOMiVFlXS9Rv+qYo0Fnii1hxcG+1zYfumWp1dNmLVaXkLHz9cXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ryjEQQ4hgnEHONpJlpXDiXHYr+WbyZzWWcF5RdWcdg=;
 b=NV3XMN8VvgSmNAJbgwx/OivGORFNSP0JuOCvM1LBtbYoxZpAWE7shX3ZnjaspeEmY079ZkYnKZnM0ZQ3WXuXr9CyYr6Tzpna2b1420fSHyzRfmZTPuRJBsLl1UiQYOWaMmNZ4SkqQAi99N0IqK02gVPL4jGSTwAXDtOfQzk7zhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7698.namprd08.prod.outlook.com
 (2603:10b6:510:d9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 14:42:43 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 14:42:42 +0000
Date: Thu, 14 Mar 2024 09:42:39 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 2/5] dt-bindings: input: cirrus,cs40l50: Add initial
 DT binding
Message-ID: <ZfMM39KRHDvRqcO9@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-3-jogletre@opensource.cirrus.com>
 <Ze4KNBEsK5juzpNR@nixie71>
 <2914e313-1fb1-41f5-9db9-ce44dcd4903c@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2914e313-1fb1-41f5-9db9-ce44dcd4903c@linaro.org>
X-ClientProxiedBy: SA1P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::33) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: d7481c7c-8a35-4233-69d3-08dc443500fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m1WhO6XotYmxqj8O+Pql9V8hPTECrKxVI8ut7rE9a/X+tJcG86WJwlFw7AdOLFlkdpuXbAFYbyk0MuOEoSDG0w92ImWntBhKNHucLuUeLsq5gtY6SKHlGKb/WAR932SHQgfa4mfIoKsuKzeAV8Pti2/Yf2/k7ieXDAN+2nPJ0xi3Lh3uWV8vfqZbYjSvbJ5CL9igyiUdwckNO8f2uLML/4gaJZ/mRNOWL1rph9DaRynMTdLnfQ2OMFJ8UgrJcRSWR1ExUupKKnZKen64zW25tO/suek5bg2hq9lBbbqEj1EfcDeNWYMNG1khZVwwxpwLXaIzlo+yp61HVOEVROHyIXEyhHFsHzEnsZ5TMteLW4K8ELJJA5ToEtH8vvxWROKvwdh33HqSaFnXj3sSyg/cRyoEiDUquY6aOmkB9VIhsapKzzRx7UmiIg+OozDFtTOhGVl3p8vP945tXfQeJIYbNgiVrnhmM4R4KYiakuN/v8Gu7jXHMFV31OsTq1BmOxmadfhSdf5ozafkEYHLQgQ47CxZtcN8pvC4XkkqYXHkADuhRB2rwbi2cIcleLvnhKVa2vDzQVeUfiBAO1NqtiByI4aHf2DnnMAsxM+sRWsPZgfZjj1z/TgFXg7dnW+M06LY8PLMmS1k0Tr4PB5g01D17A6fUSvcsvr0JJx4etb2JRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ERSdh2SEEn+cLSlRkCpqvHtssh3qyGXBgfItaRqnbfkq8zMLHgvPCF7fjsOs?=
 =?us-ascii?Q?OUl66EOwQVtBCquVAhoCHWIjcghoFWdqmOuqsQvu+2s9/Mc5Uhyc7zPIwfW+?=
 =?us-ascii?Q?vbsMSxhrqVRqsf6IR6ooKmXHiRNaOfv3+edchHcQkBzJb61broGFPBJslzt+?=
 =?us-ascii?Q?VJRHi+mwUdR6hmtNcoh1et2Hw/iZU2Chtlq4Ey6SogP0J33KeN3hargu4x/2?=
 =?us-ascii?Q?WX1pBFYjvWTlh1W4DNugREJpPPiwk5roZdXuGdxFGdCCq2UlcqNBh0AguTWx?=
 =?us-ascii?Q?tdbqecsB6ETaMiSSz2RtimmfOVcPMw/Af76lYMxQfGQyYAzoe9j+j/GAGPzU?=
 =?us-ascii?Q?IOeDSMOf+ULaAaC8Rx+rT52JJqGUH4WAMTYtxKRgU9pd2TSGWfCgsZa2UhTK?=
 =?us-ascii?Q?0WWLuJm1LqA3zkfvSHfpevY621iYNEZy2YOwr39C+obB84ybnRfGlExTSRVE?=
 =?us-ascii?Q?KnV/FN1YijPFb5zukr/+F9DDqmcXTZiCMUltWgvs3Bnj3EYJm154kK/ndP9A?=
 =?us-ascii?Q?drlxaA1/FCSMFkl40FcRHk85vtngPrTDYkALGMbkdDoqIgLL96OWu98unDLR?=
 =?us-ascii?Q?FCvmClB+BjGdui9HxIr1HRLLmZ3I67G/vdV0dU+7ti7yXssl7lGmduJ02zgL?=
 =?us-ascii?Q?ra+PuTpdCSYEgGH4UE8iWk/nRuWNks9qBgE6HLurzUJsF3Yu1WaRFTVvXHnw?=
 =?us-ascii?Q?2N6vHt3kYnEmqq0J4oIe8pu0QnHPPVWyFihO4/Y+UC3Ex7Va5r0jEkwAVe1v?=
 =?us-ascii?Q?i02cA2MMtw6vUl7en00BKFgPBmIe9fbD3kBKqlZDPZKUGlAn79wf+U5TWZNX?=
 =?us-ascii?Q?g1iqpjpg8lOqXJ5LYYhrtgNjVtzdMKFy7va563D3EXKD7qyOzWobmD+z5PcM?=
 =?us-ascii?Q?Lb98WenpkB30vJBWz6phCuyFIdfLG2YHc1BH+cOz/RsdeX9D06CCVlVbLXHD?=
 =?us-ascii?Q?W3QxAa62c1nAneuAsl4hyGRJfB//VLz3O4nh9vbHOVpB/a9pFeLIXFdPO1ma?=
 =?us-ascii?Q?L+3EgCIzfPTk2NTxWCIqY6r5fzs2bzAMXtB2QF/1UjeD5RTnICAzpA0LIS4v?=
 =?us-ascii?Q?j4WCKR1gk0XR2GB6Y59xQw/olmvSDALz07b/onDNvVDyoP1AnMHTWDPpNFMn?=
 =?us-ascii?Q?+fJbEikqJ77JEQ3M7de2zPm3hLdu2J4zpNfcU0BgMxwC+bAh2IJrifLYxcaK?=
 =?us-ascii?Q?rU2Fux6sjRCbX62V6WYR95Zfp8QkY21X8Qh4PMO1HIYSmWPJXA5hBAm4v+63?=
 =?us-ascii?Q?ORxtbManj+F1e7kLxnyLaHXvHG8xkgszFDZJei/ZiwTFBS74TS9dmuR7CAeE?=
 =?us-ascii?Q?60H4MNTk2OVwxha6McsPtyUWK73JvSj9X0dRwwCtXs9v+EttRFkyK2SX2nPY?=
 =?us-ascii?Q?QbXF1MWoGqlYuhaR5xI+XJc/HzrTvDmsGeGfKSq0GkZDsZwokHVbt/7fZj7s?=
 =?us-ascii?Q?c7NWJ/IRglJDJ7J5Dpgx/rfXJB+HCGbZULKoDYj4JtuaiWOIAx0H84vx0mDZ?=
 =?us-ascii?Q?Zl4LQzEGEP4nW5kMuQf7YzmdkPgFWn5k/AvLZW1cxjH85CfxlwyeKtTJkU64?=
 =?us-ascii?Q?gKZ9ztnHLUBHK2I9QHNEM8011abmrggfF2uwHAZG?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7481c7c-8a35-4233-69d3-08dc443500fa
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 14:42:42.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbytRG6Qe17ZSQRTTFEiT+YGirQU0yV2QJhUm7uD7CZO7L0e1mMvr6m/RIPtl+Lh4ouxz8BbhbL9Km03cU6R0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7698

Hi Krzysztof,

On Mon, Mar 11, 2024 at 07:31:36AM +0100, Krzysztof Kozlowski wrote:
> On 10/03/2024 20:29, Jeff LaBundy wrote:
> > 
> >> +  - vio-supply
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    i2c {
> >> +      #address-cells = <1>;
> >> +      #size-cells = <0>;
> > 
> > Nit: most device trees tend to use 8-column indentation as with kernel code.
> 
> If you meant DTS, then kernel coding style applies, which does not use
> spaces. But this is a binding, so please use indentation as defined by
> writing-schema: 2 or 4 spaces.

Good to know; I'll follow this definition moving forward.

> 
> 
> Best regards,
> Krzysztof
> 

Kind regards,
Jeff LaBundy

