Return-Path: <linux-input+bounces-10335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C11A43800
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 09:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E48D17A7BD
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6598725D537;
	Tue, 25 Feb 2025 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="S7c/o1pI"
X-Original-To: linux-input@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2D8F5E;
	Tue, 25 Feb 2025 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473230; cv=fail; b=MvmecHBNvIE3EJOmjQ1dmv5xRP7/dLSZH/1NmiHy4YO/QVWCt9a0nstMYNB1p5TQ58CCJMZ22ofzlE71K67ccMUu7atYKfUf32yiGihDRzP3ApgHFO/NNmr2hI79wx7Dk+qNV+3uPenweAxuq9CQE0RM008pieGay8/vJQRww7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473230; c=relaxed/simple;
	bh=hBk8ZLgBCpWp4NwGnl/bXZz+lMfXHKkC7YC7hBN3zfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I4hr7TdnYyhLFsHoNF9UlK8raspA6fAiDK4th4A+eWVAF8F8zkEaQNMnqi4yCfqu3rM68FZLSre6EPnFhNR0mFBtWn1TeRchIFA6osP2/r5xoeOgHXxSXLKnHe5BpdbIGz5XNgig3LloF0vPHyFFiVBeP6pNEBGslNdW8ZQLK9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=S7c/o1pI; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiNNhVlS8ibV+RbUZUfNIpkqTUjd/Dy4yFGXMVHTsJ/qfehmvfgKuhxqNtnGHXfT0LTgENqpPWsfiA3RhPYvGDMwnA7cS8zH1yDV7qiqWZbxyDfJu3DWK0n6chVypjaJfYWLomK1mMIBhNnSMFHNcfRYets6+MB2gTQTif6jR9LFuKQPzsA1sMS2hbN9TQDLenl7fMqkGd1kWqviOlJBkhi3DDm915QRVivN8Mz5KjGu3mxwHuvv+cjvQP6mvRFUMb0gqoV5j1wqqxRHC8C4M4uWaR6meCocAX6ALRAi1inWXCe+kS8HSUm1mepWtGXNraEh1q+kQ5M9BRC6KdCfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1qeogCuqXOTLjcQnlWFF1ilonhxti2VLvNFnYVO9VU=;
 b=dpKxvFf/vzS/qFaBmg90IvYVhJmJlEc7UoUFtVlgVIOZUcFNy7yPkqYxqhBoiqEal9rPXtQClgPTqU42W9Reaq9w++5IiYhuLGldmX3aM4Ela9WrgWV3XlCElACA3yD1N/fSs6Acd33U+Q4grBdgvWeTn3fTzHDyPUgaE/UI/Bv+2BIHSx2WKxeWrMionJTLOf9CO7M4OIlUK7qpniRImwcla1KebV8GNjBeguWX105RaIkhWHi7P640jeTT/W1m9GrUD5jYIsImGN9xkYdUYOnO2y9iuemWYxaAqkmiKraZF1Uf0HyO8ahyUXQggVF088YuhGzgftmKPFfacO6JTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1qeogCuqXOTLjcQnlWFF1ilonhxti2VLvNFnYVO9VU=;
 b=S7c/o1pIPwaiOMntGLd+Eqlt4YO9JxKk0Vz5jPmVUqvAnwNsmTNvnbiQ//0eUnDVls7fZ1KuiDs257qWve21MkcKklF7quUhg1c7Ro3M9iShROvyB/xHmiHJ1z++zURQhgNTmU3iX+UhWNOPLyjRwU7ZvSDWiFehwWl6TzUyjEfPhOvJgZ0rWOYHQ9Lgi8337C+GS8UnRdqo4emTrE5yF7nYYCPNdtd4+aH1mF40KsjXK9FDV9BtVI6eyn7hWmlTt4RI9t75tAvWQ3jsG6nigwyiFNQy7X2LSzntN/HFWXMNVldd/iCFdWsNpTvbUJebp7mExHrI3T0JgwtdNg+Bvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6261.eurprd03.prod.outlook.com (2603:10a6:20b:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 08:47:05 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Tue, 25 Feb 2025
 08:47:05 +0000
Date: Tue, 25 Feb 2025 09:46:53 +0100
From: Markus Burri <markus.burri@mt.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <Z72DfSus6tn4Y8JV@Debian-VM-Markus.debian>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-2-markus.burri@mt.com>
 <Z7YIKaG0jBHV2FSE@mt.com>
 <Z71l9046XyjxicFf@google.com>
 <Z71paM0nDwVj85ls@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z71paM0nDwVj85ls@google.com>
X-ClientProxiedBy: ZR2P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::11) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcc8cd8-128b-4fe8-6929-08dd5578fad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5t2uwBCK7PDbFpDdQe7+USnk5LnzRA0qsZbwj/qo5DYQBavC/U+wZK0Oho/?=
 =?us-ascii?Q?CbywQW4+5JYmmx+wa/6mpJ0H1i32qpzk63/EVmSGiO7vri6R5h4/7AzE4mIv?=
 =?us-ascii?Q?JhpZF6UF94CvqdNszxr+r0J8m/g8MItmQljYjTYQ/2Qu42/n6BDrWre5Hct7?=
 =?us-ascii?Q?rMymGN4zkceJqcf9Eb7/C0ADSouE9CDWOQ8ulZ3Xn/jP55EF4cy/I7NIoDSq?=
 =?us-ascii?Q?H4GzDaMrr6WJ889lAm2F9vp7CMK0k6TeNEfuklbCaGnt8VIAnrB2/IS3EwyI?=
 =?us-ascii?Q?xBOqhSa4E6wHPB2UwWUhQrGCQrDhVcrl7al8KnzfnNT5rLZBFKZ6CH4yPnBV?=
 =?us-ascii?Q?n6r3hydD254G9oI0+I3d2R4RSJ3matC45khKhxdfddYlDz5siXxDpyi4rRTi?=
 =?us-ascii?Q?VaalUrqm77TUZlwbJ9IWAHiH66tXHXjlfozmepBDeL/v5aLZHhy3GR8Pw9KP?=
 =?us-ascii?Q?IBeNeDe2VBwL0VdZch9VqVEkmYSvjwj6rhIrGMNsJaKfiYgt3YgvuGexlO6M?=
 =?us-ascii?Q?qYr3ieHzypuWtPPRIR+b4zw4w6awqDuycqCCThe4ZuS7HCzum6flld0MsH9s?=
 =?us-ascii?Q?f4mx+IuXBjp0bRHRPmiLV7M+P/Rdt4ImQnspQMMwrjPobD7wDjpFBeH4ZRN2?=
 =?us-ascii?Q?boJK+jtjd8T/s3PlKEbz54iqx/RPTBYNP9QN+Xjk4E5RznyMbbrfRdELNu9Z?=
 =?us-ascii?Q?KCcldIMRo9REL7M1mVJKt0Q9FwubF+/vcWYn5If8LqjXbmoz+jcXfPdozVLk?=
 =?us-ascii?Q?eIfl5XsCbFHv7foADXmHnxyqHmH9uuKEFutBPSvsKRbXCrIIJp7GVlzJW+ha?=
 =?us-ascii?Q?EvKOuRqD47hi4RbSXPd3qHcnAiP23DdyU9K227lUJZ1bu00ws6Z17psSidpN?=
 =?us-ascii?Q?6lJUm9e8cNzowlN8H3Y55q4yAXut8x2rvLWE01qBReH6G8vPQi01z98XNmD0?=
 =?us-ascii?Q?yw/c+HF/+guaK40hCEGAUVRNjNtOWDKFp4B0Fojl/LiNoh3WLRLOaGa4z1vf?=
 =?us-ascii?Q?9lyrywlPLYOYGoySqSeB9LEsUd57jPqgp+bAPd30+6Y7R2s9JfQPFlyN6+m/?=
 =?us-ascii?Q?aaa3h/E8EZqch9jwVsYywigAxnahCXE/eFUIq9gk4vQzb9eICSjG+FjQE5U4?=
 =?us-ascii?Q?/OQ/YU2okAQqpsCzmLCs0wJl6FthbZjlXROKpn3vZb3Ovp049sbfE9wNZqv5?=
 =?us-ascii?Q?oBnNWulVWnvcEA1epgho98mp3Uay+0d85YKa3NuGfqbseusQVss8ThukVsPV?=
 =?us-ascii?Q?Zgn9S31t+vYr8hWavNNrEtXo9BfvTSTFSzRstg62c0U9wf6ce2JxR7A/oarq?=
 =?us-ascii?Q?dhjgmQEVBvuzkgyPuY+KquiPOfcxczavruBKg7QasCVSRZ0oNboFZVYfYcoV?=
 =?us-ascii?Q?/CPCKMH0jLZYyiji2Ga4PJ5Bqnp2w24ru35KuISCqMtqieg84B+5ivOUhxz4?=
 =?us-ascii?Q?3wWK2PL3LsU+Eyek27jisLutjJxzfTJX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3hKZBZBUUdpu1bns+bvY1eZp+GZJDr1Z00kUaYqB5exb3Ba2xsgbJFlc7uX/?=
 =?us-ascii?Q?9i+H1yro3Y04S+gFEhv+qR0xb/evc5mK0zWt97iV75PDhKGPqZjkbZWcL7UH?=
 =?us-ascii?Q?J3oA/wqELN9GlpF0yh0TjGQ9nVMp2AbGTALqfs0Srb7QZquUxg2sn5+zm01E?=
 =?us-ascii?Q?vv3/u+6FBSKSV8RD871ET+OfskcengJy0jSi36hxXjFbNaLfqie+mbvJn9Un?=
 =?us-ascii?Q?G04XwSQ0/CB2R8rnswaUmBFT5bSWh3K/0dNEvFgfuuwHTGfXZPEBDgXZ91cK?=
 =?us-ascii?Q?KAGInlyGFwKIVZMBX0UIxHbHi8MCSuh9QbU4ZnfxzTi1Gn8D8XSZVEqUEm6m?=
 =?us-ascii?Q?lMfNcc0uu2qZDX9SDUFQjh+JH6LhwTMuXKdqMEWBIPOVphWGmMdAg2qzNf6D?=
 =?us-ascii?Q?Ag+D9Ef4EelxgpiM4ze4C4aFGVNrtyAvL8V1cE2/zYXhYXIrxi0u3y4u/dbd?=
 =?us-ascii?Q?rzkCbeOAaHNW6lmZYZ7RPr3iSPWTV/OEIxKLi3gqfo91OQQVdXMUo1T0mq7H?=
 =?us-ascii?Q?TnhTikr9qCM4iMQe5kb/xeIeyrGPeVSo7kAwGJq1NZ8WEoKFwlh/ojnXCXkI?=
 =?us-ascii?Q?8jb4hfsyr0yyJcYiLm/x0/ZqFT5RNmcLznjXEgGvWzzttvh78fVKnmnAi/5P?=
 =?us-ascii?Q?l5Vzxziw7zt23B6ro6ntZkMZSNI5XgHpsFBFvbSIHKE+JGP1ccchKLFsMkNQ?=
 =?us-ascii?Q?P4cqlXUObYRXSVNd8/+WOLe4BfQQJOoRBk7sgtt/WF53F3+vMYUOTCI+5lIB?=
 =?us-ascii?Q?0lfgahvjehDNhrlOwRDRkmvE0W45cJEwp58a5m8V4hCktkp99fpziXSnX7Uf?=
 =?us-ascii?Q?50WuCS7d2A3iRiyiswplSjfv1H76+nCn4ddpZeAeBXmSuMme4b47bnmP1SHH?=
 =?us-ascii?Q?ICCP/V1Lr6j/RSRB9CuCqpvGDbeHgKcBCFJsQEz+WrlG8xaRngwk91iCCAfp?=
 =?us-ascii?Q?OI2p3FNNme+3itGDsccNA1a5gu1zEXZYciVL9dDHY+35uuAIy89K6tU3+Sgj?=
 =?us-ascii?Q?Zz9XlZXaff8t0zujC2vy/nJcfORCmrhPV+RPuderhkZ21jRYRBx7iffqp4am?=
 =?us-ascii?Q?A4wWCqXZQ+TQm6kRsHCAlJ5+jsj7KPB3xl3sAZd7APAlC7LG8Lj71USTu0ea?=
 =?us-ascii?Q?hJSgCqnbCZQ5/OYjktx+3Hq4LYp2WaWd5r9QBxLyD75HNPAnYeF99EHoWZUE?=
 =?us-ascii?Q?JB3LrNZfvfj8UlfcwexF3niodL/Rso/xjx1bxCvPK6g2HpU6Lj5yGzeWjbZz?=
 =?us-ascii?Q?pUaMApHIAiSoWdedose/s3vjSqGRUEEnCiJv95yBHts78JSVIkR+ikKcEZK9?=
 =?us-ascii?Q?cosi8r7VR1YJJ2pKqIU3UrLsQhm6akYjQ1CgDhJiOjCyn0ETx//SfsRSYm43?=
 =?us-ascii?Q?aw485R87ik0EPg+JWrrwFcwhBagOTthRyctfxnlvarlg0WTJGercT2XNg7ph?=
 =?us-ascii?Q?Crzi3NuD87XkwAhRK/Qey5Zo4GJ2/H2WQ69WxNf4EX9gzv+9elOTeecuQgQd?=
 =?us-ascii?Q?3oIAGWXd4Kw9MBo8ehVJyGASSNboAHKYNGVGK7CId7HoQpg3BJBWmbSkZjHu?=
 =?us-ascii?Q?cwcyNtVG6r1g3PJ62VWhn/AG1ogdgyA3QcsWpiiI?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcc8cd8-128b-4fe8-6929-08dd5578fad9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:47:05.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luQrZJ7g/PZ4i5j/nsIuTL8FGEMb844S4x7wCGlutbXssSYyaDgfW4iao0qt0sQPIiAz3V3rvyAzJpUiwE5uzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6261

On Mon, Feb 24, 2025 at 10:55:36PM -0800, Dmitry Torokhov wrote:
> On Mon, Feb 24, 2025 at 10:40:55PM -0800, Dmitry Torokhov wrote:
> > On Wed, Feb 19, 2025 at 05:34:49PM +0100, Manuel Traut wrote:
> > > On Fri, Jan 10, 2025 at 06:49:00AM +0100, Markus Burri wrote:
> > > > The delay is retrieved from a device-tree property, so the duration is
> > > > variable. fsleep guesses the best delay function based on duration.
> > > > 
> > > > see Documentation/timers/delay_sleep_functions.rst
> > > > 
> > > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > > 
> > > Reviewed-by: Manuel Traut <manuel.traut@mt.com> 
> > 
> > As I mentioned in other review activate_col() may be called in atomic
> > context where we can not sleep:
> > 
> > "activate_col() may be called in atomic context, and if fsleep() turns
> > into usleep_range() or msleep() we are going to have a bad time.
> > 
> > We should either stop using request_any_context_irq() or figure out if
> > interrupt handler can sleep or not and adjust behavior properly."
> > 
> > Unfortunately this was completely ignored.
> 
> My apologies, it looks like it only is called from work handler, so my
> comment was wrong.
> 
> Thanks.

Yes sorry to ignore, it is only called in work handler
> 
> -- 
> Dmitry

