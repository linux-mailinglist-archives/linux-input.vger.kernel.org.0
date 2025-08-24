Return-Path: <linux-input+bounces-14291-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8EB33127
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 17:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29994189B1E2
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DC31E5B72;
	Sun, 24 Aug 2025 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="Sqh/uUA2"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2094.outbound.protection.outlook.com [40.107.95.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614731553A3;
	Sun, 24 Aug 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756049017; cv=fail; b=ej80XVIoEhJS5vBEN1sh+CtVCUm+AnaT/NPAh+CuzEn+3QZQGAAw8HrxZdfgG92IQns6VBByNO732hMMS1Hncj6OlGNZ3RM293FJ85n7wNoiXQGUk40gfXF0+U0YBP4kXGNDbDUxdvT1H9MH3RJoyngTwo7M76/b94CpGczhzHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756049017; c=relaxed/simple;
	bh=z4FEHHCvCfUXSgvJhfiPjXFy6le5j7jkHydZlJbjKII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uzHRaIcrAN+s20FnRMWMJYxdVWiJ/nDWi3vvOEwVC0mnC0eUIAXJ2Rz3tEMBZBziUQLPM+RIfBVKuAs8MIz72MJ3OUH37fC1uppa2jF9zTEv7ke0UPMWGp8s65FeDSX0y56SrWKEtbIpbUYXpqj7AiUZkOkEUWMnA5xhlRnwoxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=Sqh/uUA2; arc=fail smtp.client-ip=40.107.95.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc4qz8LNkoCox7Vcm9yGanquyiXkECUUjqqJGKtSbUefUrmASKZAnXvDftX4D4WQZuHTZ+E4Pufrqji9PBJ/7DsLpGdFTyWdP2Z6VVioHNosmgU0XnAe4DWISRxApb6GJVekKHHePKuAfAkUdDSkZKt1nSCyC1byV+zMXFwiDyZrDVtLjoYxDszTaOx7FQdYp4xJCBLEI1jsJLPAtTFCKXqjg+k9h3m+0Xu3MWu0xIdDNYQJQQLuHIv12tHmTx9GUfPBd5NoHPT3y2DhTOeNBjH0NDua+A+uDNiVVZvFZPkvjvDcExot/Er6Pd+0x5EIFVIgwnDymfH5WN7GDKKKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwdhmAqgsDxcTQwtpwm1FPzJpC9F5tDeaSHpmAiqyaM=;
 b=orn+Ve6dpDCrrV0PepA1erzu4mQDwRuoSamt8rxFwu8BIklj0a+EciaXZfV1YgWY4rG0aYctRzGJSDrIEt9nxPwiii4lZigI2UmUfe9wzXihzEXyHsgSYVdb+NULQelIRviafshd8K9F8VD+ot80up/Y8iIqGZdA/I1LySVS2/IXzkhIX01tIGwYT1nkaTySIc+gCWMpVtJxsh9CZArV2Ik4Y8m2Dj+lEVrpx2Yuqs0jodxzPr8WbChAuCBnQ8AuW9K5Zc57WcfyzeLJrXzDVMXl4akFvMzf5BC0MzV0SycIOBRPEjfW/oF4zsyWyAHNDoh5iqtEQjvZSBPwdcpc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwdhmAqgsDxcTQwtpwm1FPzJpC9F5tDeaSHpmAiqyaM=;
 b=Sqh/uUA2B3LZA2jGe3qgRoe05i80M7oP+KMIPImglnOFTsOm1d3Ez0XcO2Yp4bmzKZbvgpY0ztsXmOwoBVxcuqS18NE0+QeBMxEzf+/QCxXlF823bcFaiXv6BPmouIPFAAO4N1H8cJVTGg2eaAgteNQRFAU6BbyL8xtugjvY3V0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN6PR08MB10386.namprd08.prod.outlook.com (2603:10b6:208:4f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 15:23:32 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c%6]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 15:23:32 +0000
Date: Sun, 24 Aug 2025 10:23:25 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: krzk+dt@kernel.org
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: input: Remove bindings for Azoteq
 IQS269A and IQS626A
Message-ID: <aKsubYdxKKUHe8N6@nixie71>
References: <Z89ugIeYkJ7rAzJP@nixie71>
 <Z89u5UBMDXtMw/Hq@nixie71>
 <553c738b-123c-4b79-81f7-de1a89c1572b@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553c738b-123c-4b79-81f7-de1a89c1572b@linaro.org>
X-ClientProxiedBy: SN7PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:806:f2::9) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN6PR08MB10386:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e45b36-2eaa-4941-ee8c-08dde3222efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hpXYp+rwfRegodCbcy+MpjfuZ8VtShEsZLKH334bxeXaXdkhl7r6aOmNJkf5?=
 =?us-ascii?Q?RPX8RHQhDt3cT7DszqSSm5ISOw3CRfI+GIBAHMJqsoV177t2rk67nF2SIVdV?=
 =?us-ascii?Q?FQ6JHmSU/fy07w438F3lQSH+bd4wCbgpSFCJ0gF8OYbeyoHlVv7ajHp51Rkf?=
 =?us-ascii?Q?mMjBHsM3qmVvofZD34uMRLCLjT2cYWriFzwqtZHYp+95ml+sW6w/HFerfq8/?=
 =?us-ascii?Q?Qx3Gg9OQOa7ThkobvjlM7Jq4g0SKWocCiIb3xLz0bwCrIvrkcOqP1D//GHmM?=
 =?us-ascii?Q?JXlfOmfgcUS7+A382sfIGO9VOGSt0Z2esWXyN99IhtL+MpKGSxJSufAbN4qi?=
 =?us-ascii?Q?jtvSwdSB04VHQbTBmZVjSg496CUA6H9cmaRKH9gl5PCx+r4Fb7+J2Gc3ljia?=
 =?us-ascii?Q?T0rWfSXqllLtSliDhwwCAyFEsSjSRZYgdziIORHJVAbsliRRFQHtAtfHFMMY?=
 =?us-ascii?Q?Tf0Kl36XMDeC71KgWg2SZt8CJkjKe/PoJ4IrTYMX+gnoka0LjJGT18RULqQc?=
 =?us-ascii?Q?iZSangAAqQUMasZV6+rjPmuERoYb2RirQwnL2G5ncBHYLuY2SF6bdKzAIrOF?=
 =?us-ascii?Q?Yp78YaTizyHzt7WWb7JurSjpDe5Eo4bV7KtsEalSTA4qqAvv9REIxj6XWJtU?=
 =?us-ascii?Q?34eZYmax4zr2GTLWJ6BCv8r3mAb3rApwOGKttIx33vJyxK9tAhd+abs0+GtP?=
 =?us-ascii?Q?TX+ZIo1YrpXS1/Cm33ZWHgC5IWlONKS8nANe/vHlcbzGvwa5+CU/IaPQ7Uh/?=
 =?us-ascii?Q?EMPyN7r4UGMHk9EhLpDqJF1a+bZfcRconKXjjzMg1foIzNYOKggjD6HPWFPm?=
 =?us-ascii?Q?3FjgsvbKzJ6w3zvX41RT9L1a+WDtpNYBoKNEqzmYupvNEtXgmXfXx6Z/cpO3?=
 =?us-ascii?Q?EmkCZOhLz+BlGJ+BjwTwDPtf0ERKv/tIZEgYNKwGcgWRmPtAdIYxGs16/31p?=
 =?us-ascii?Q?8Fq6ayqmkwaJKvFl9f/MkEysIsIkDHMMFcakiKtRw+jRqamW76w0xahMHxoV?=
 =?us-ascii?Q?ClVN8ijI4xtV7eDKmuGDo0FQyJ6CCq9XeQ5BdocKcixn+yRVlKc571afZIsP?=
 =?us-ascii?Q?5s27v9hoQL2c9PKEZsozzx9U59QlYJHvWvKctDZg1gDMo9g0jYqyIGHqInCo?=
 =?us-ascii?Q?26HYzsG7aUmFUgRcKAfbE8bDbGBAGa54rf6a4O/rYfNWQhouVWR9v021Fmbk?=
 =?us-ascii?Q?evo79rXjf7/h2G9peEgaqnXGHGj/a8j+/vfUO5OOeglUPAp8i8/E/7zsbL8t?=
 =?us-ascii?Q?xploG5hp1ikm/Sb0QXuhCZt6JbveJymdRWlJEeXjBFL3e9ZipJwM51zi0meh?=
 =?us-ascii?Q?to3x9zJ6u9o0Drd0gJca+SvBYiqGwZpSNuF59wjkaKiavcLw8fRNYotPuo2K?=
 =?us-ascii?Q?OD3ok7R99eNGzsh/ez775CRD8Phw9fz5gWsE16ceh9rkTkP3/npOuY4l4mUN?=
 =?us-ascii?Q?tb4K9c9vUO8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cf6QhhhIHqWh4Ha4CT6XoiWJwL66zV+AF3BDDhuah2O7NvB3YVIii3fRNrGu?=
 =?us-ascii?Q?txkvyDslcPEtlqnNrnVmIz+bRggr6QC+6Y/dKOIUOZyKKGRNZBWpT4HjUwAC?=
 =?us-ascii?Q?x7+drVdoULqx7EZcOKYrnp+gcIOVdWFTw7jnCB1tcsBCT80K+ApvCzeSw3VC?=
 =?us-ascii?Q?/RD32gudFTHCt/40lQcoAxTxspzcpxKfe0DOC+0yWbKWRlBBqEHsC8pvBORX?=
 =?us-ascii?Q?QAP2cWDVK8kWvsFvo77h+5fHXqwc2yy2ckdEQqNsuq7rrkEMXUQNr+2USCkf?=
 =?us-ascii?Q?hoesp0gOEVEYagLvm2cUNKANISWkdhobl2lPI0snJV/EfNPn5irJRbhNAp7I?=
 =?us-ascii?Q?bvK6pu2cVVMPBz6+tY++yGJpbCtwPhZ+32IxqmUZWqBCLIrP4J/jRwO8dEPP?=
 =?us-ascii?Q?3X/Vy0oNGRj7RHIgYwtaqyqxsB6z8Jn4IPpORTm4bf6MYpdwNqssbakqCXxR?=
 =?us-ascii?Q?HD7gdtpopeKFI5ZJxKCzHSOEEFpTa8zHsm9pu+CJiss004KeS21Nh6TvR+lr?=
 =?us-ascii?Q?8NtWrcYGt2mWVEuaCxkg0kpaL7uF5sYuZJyiai1pqo4f7vuFnsU3Lb0nnFhr?=
 =?us-ascii?Q?/vMRBKavGxb1tARjKTaXzXG/lVJCsBmAYG9bA4NOTFN+/sAIZnkUP2h6aCSH?=
 =?us-ascii?Q?MkUWamnmbD+lkeP62n2MaWjYSrURy8+uVfr8nVCscEOI29k6f3O5u8DNZTtj?=
 =?us-ascii?Q?O+er1kYKGuPvTFtolGVwekLuindFiZIqfoaO6r/sVslq+tH7cQ2lL+1roSVT?=
 =?us-ascii?Q?sbShXC6yNDomkRs9nX/6YX8lcJC6DOvy4NNKE0M9cfF7qW5NJvzzAigVG6cK?=
 =?us-ascii?Q?tcMBRHoNNxcQwgfeXbezXn/cWUtELYBEWpI46kaQaDzO0tVErg8eD7INxGgg?=
 =?us-ascii?Q?AuYV/oocaAO1EyxOteI4fgAN0qXKJy87DNE1NiVmyFMU6jouOlglfe3M8/zU?=
 =?us-ascii?Q?04Fxvyzv7/8Y9env/ZynR+h/oHiaWvKnchCQrWk9rtW0XJyuvdmwUBh8asdA?=
 =?us-ascii?Q?EN0N52cHlSw0m/JLi9cni267ZTXmapDS4u3zZ8J2aajiBHiUHsrnxafYtxHp?=
 =?us-ascii?Q?o0U4wq8ZSNkMu/gLkZlrOluEMmTYZHp9AKLJsbHDGEpo0DK3qv2GNRZlKdw8?=
 =?us-ascii?Q?bRQ4G2zo/23zAaIFwGOdPM8Mkr4Zk3ZDtSKrW1Sue1rDZpEWSFuwLuXP3/Y6?=
 =?us-ascii?Q?LLRNuQIzTa/aUZ2HJfKCoueOVPe+sLEpwPQaTDvBbiw2DbtxUh+MmZG0hbWW?=
 =?us-ascii?Q?452JJTU+M5wQgQccqUlRDQK5a8FOFsTbE7hnSW2X1mgCkZCqvZNz1cLHoZas?=
 =?us-ascii?Q?06XdmrDXXT2ac7Ivtfu3KGuEZQOxAQQtmF0zelOlPUvrrXmYJg5/uJwzV35r?=
 =?us-ascii?Q?IhPwN/nvHXPNso8Bp8PKcYIVfblAaJs3qB3KhTm5aCkGlF/RWOi4kjh2zgp9?=
 =?us-ascii?Q?g3hbDSQiOKsDYl+HXcjYEPECsnIst8WIHs8csZYRY2XaJxuFyxWCoC2U28G5?=
 =?us-ascii?Q?d0IqrNegmOkG750tZrVdjTIVtDezwRBWut0mAfrmQc5Udtb1cxdFcNiJ9emj?=
 =?us-ascii?Q?zogE+4SWUVZKSUxdVdwaG2+bLWR43BbISGKjbkxm?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e45b36-2eaa-4941-ee8c-08dde3222efa
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 15:23:32.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtOM/uvXDAwZRbHu6FjFLZFWGm0LJgaT+4cr53AgZOSNH+81DV4oda4bTW60GU8sbmA9uhP8LXs6kOlIcGI8ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR08MB10386

Hi Krzysztof,

Thank you for your feedback; I'm sorry for the exceedingly long delay
to reply, as well as the email mishap.

On Tue, Mar 11, 2025 at 02:16:35PM +0100, Krzysztof Kozlowski wrote:
> On 10/03/2025 23:59, Jeff LaBundy wrote:
> > The vendor no longer recommends IQS269A for new designs, and no
> > longer manufacturers the highly similar IQS626A. No new product
> > development will use either device.
> 
> What about all existing users? It does not metter if vendor recommends
> if we have users. Intel does not recommend any of its CPUs older than
> two years, so shall we drop support for the instruction set in my 3
> years old laptop?

There are no upstream or known downstream users of either device; their
manufacturing status was simply the catalyst for finally removing these
drivers. I will speak to these details further in v2's commit message.

> 
> > 
> > Remove both bindings to prune unused documentation and avoid the
> > need for any further maintenance.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> 
> You CC-ed an address, which suggests you do not work on mainline kernel
> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
> work on mainline or start using mentioned tools, so correct addresses
> will be used.
> 
> 
> Best regards,
> Krzysztof

Kind regards,
Jeff LaBundy

