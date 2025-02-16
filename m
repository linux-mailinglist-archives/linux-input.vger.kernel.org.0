Return-Path: <linux-input+bounces-10081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0CA377B4
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 22:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C8E3A6B75
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 21:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5D71A0BE1;
	Sun, 16 Feb 2025 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="KmN06Efc"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2130.outbound.protection.outlook.com [40.107.244.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14F148318;
	Sun, 16 Feb 2025 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739740444; cv=fail; b=Ks9Z9fSr1W810TW7r0gt5cFaUd9IMAkXQ1bGTQyA3fRM8u29VLkrUqewMzCR3bf6I6YOS/pXfSHiYYz/te9zoNQ9XtM2wDsaP7+lpdySic2Bvo4VVK3W+nEV3TojZor+iC/kWFHDDNs0XiQ8hWRM8z42PwkMHgZEGEfO2irL2zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739740444; c=relaxed/simple;
	bh=vhYs8FqOPHBrdAsbSNy86LxnAQpsb4q2CFSPJQzjKBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LhxYPZxc4GR7pBOBpdQGdZVIy0QjkiJxiwOo7qjWhjbHxRsKK4VkvfCenCtUip4FyL9+jAamfRmCCb0hR+6PQ9KDZPlg/ld3ta7rWrPz0nmEGCbMF+HrvXXMrj+XFfvUVIopMsQ/81g7GOII3bFpxlxne+rmWrtvBQSc+JhS/Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=KmN06Efc; arc=fail smtp.client-ip=40.107.244.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brnmnO8XQZ+EEGJC6A0auFn4bOEDiDeNLW2KFJnMKEbT7xEh+KdNFv4MtttSJ7BnCwpVJmxovVoNULX8xhLPaITlbN3WgSwMb3csj7ifhxaRidMcfEIvI9QryA3IfTZWWJdZ13dP9hBztNajd1yNUNsL8Qzhd5kpigUuQeQQwPU0EsdNgr6Vt9k9misZzVyM+Xj+snRbddt6tPK4wHrgNrXJ5thycbMpqKSmgy/4bepGlqVrZztCPyKJrv5sKe5x6NxN/7y+YuV18tLVo07WgSDppTZGm3abFM3wlWWea+brZAzizp7Aat2Qe983jRImY75qLxjLHx/8dMRfo0fn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmiwwQbOqJknZ+v84xscacygZNtoF/ImO/oqT03xi3g=;
 b=dAwjNwGRDDK7p24SqC5/A9I7lsjmlQTFyBYH5YqXDHnFqUuk9kY1L1Ze6yqB6AsiSrrNdMFMmH3cWDdPjIoy3RmFu6SzIxL3IczxTqrGEsZonhOPm8a1yYIjbG8xRSTnplR6Z3Na8STtGtMqqmYA6FX9hYJCWCnT71+HCR7VBZQRQAoUXnSCOis4T6tjPhLm+D7SalUMImmxpYcWvqm3WiGQkLsUhJdhBWH2UtMesx6dubawTB5bU/D8EsMY7nb/tqqBzzfE9oQEOBanwiAUR+gOBw0P66O3M6gxgpWxKPVK+ETyofd8WazyvHtBydrZ3ddPEoQhLg80Yw6MYK+ZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmiwwQbOqJknZ+v84xscacygZNtoF/ImO/oqT03xi3g=;
 b=KmN06Efc/NppcHrkZeexD8BuKxg/h/vbJzjYW0zFGEI6Ndvm3v9IHU8265ST2FgJXgC80E7uuyEJEQ0aIe5Rxyl+8vf3f1ffz+mZVOo0IQcwS09BaeWZ/5t6K6gMAO26jWsLQfpp5zYOfardqX7xBnQStP/qCi+RUx5kRTctNYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by LV8PR08MB9079.namprd08.prod.outlook.com (2603:10b6:408:206::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sun, 16 Feb
 2025 21:13:58 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%3]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 21:13:56 +0000
Date: Sun, 16 Feb 2025 15:13:44 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Heiko Stuebner <heiko@sntech.de>, Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND 0/7] Initial Support for CS40L26
Message-ID: <Z7JVCANOhoUMnnzd@nixie71>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
X-ClientProxiedBy: SA1P222CA0141.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::8) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|LV8PR08MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c584710-08a6-41f8-3414-08dd4eced29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yo8jZQ8cWU7v0zxjI495e7hXgD3ILkS1sGffyBiBy7SKpg4kqTON8Hqmf03z?=
 =?us-ascii?Q?n/vFyCXq8U1tiQOfK8U6CKXhUMqae2by4O/Qkqh54m5uIeXj3XjQwM0VOci+?=
 =?us-ascii?Q?JuKdITupMLL0XXUdcibFNGCOq+GIKIyyxUSVtPAj1yBv35P8nDvbbNdluRB3?=
 =?us-ascii?Q?9EOWutqrvstgrs5oX+YkRphmM3TY3NNcqgEyC1Sh1vP3BZsGwwiRN/j1w0Us?=
 =?us-ascii?Q?n1bCBLas0qB4o/ScrsXxgyVqLXOY5xMX1e23zi4UP3EHndcID4WZ5PdnbHtS?=
 =?us-ascii?Q?aqYkOxv/hxL5K4VACyBSBZfjZOPbITdV5dyQcLMkBhcqEzuH/PnPKomFS81S?=
 =?us-ascii?Q?9wka69uDlNLx8IL7/kUpz4lYudKvuN7BW6ad1HlmuMbPZ3LzS1To9WSIm4GC?=
 =?us-ascii?Q?hC2j/dXNrbalSU7chAViu3EfdeGuAYVIhZCbnHw3XOStasq0Ko+idfMul5N4?=
 =?us-ascii?Q?lb534OXtqCg8/q1G/yR5vpl1ScaATx6lkw5O7mjuNILVvYlk3PgIOLB90BaA?=
 =?us-ascii?Q?4H5xt8+inqRKmCH87y/emCGF/pVRJOJ/RiUxWf6Uek9xpVJHfYHxaCBTPneO?=
 =?us-ascii?Q?yThhTy90J7Hzn0fq8/vVK4UXchYhDCT1OafzHm4kbCLgHShx/PvQUygQMKA2?=
 =?us-ascii?Q?XRUeO+Djrw9Wg/cI5FNs7z/hMBCwsyJiZp6OrnWKFK8MnjExvfus9UpaSs9n?=
 =?us-ascii?Q?0TBLm6O5YuiSrOcOgjygAdQR+WUoIdHGqYLkJ1OcGkDg+5Q4sp8nZGVJsVYB?=
 =?us-ascii?Q?GeRIoOD1nzDvavFKgb4pLxjCgd4Seyc3oMfIdTCHV0sRpqhtDrwoH4qiaEG1?=
 =?us-ascii?Q?ZRnniwix6C/6EWy9GvG6tuoqeWMXdhXCYtjl54UAsXIVKSWWCU6WsrdxaFsL?=
 =?us-ascii?Q?v0zyaa3zbOiqpJRmMfCnH3BqtwdKc4i1k0HE1fFiR5seAr65F/c0pJPZE+D2?=
 =?us-ascii?Q?oPzusT0ApiD5gIjM81xX7RfEUpAjU+BMnMBlRt7r46OuP6kkjRHubZ+ogQKe?=
 =?us-ascii?Q?BF2f5qfAwUS7yam0anJzhj5tEwPgZ2z0173/2Xxd+6k4r9DNDtLrNf8yGYsl?=
 =?us-ascii?Q?MPrY0bk+A3ax6lBgdc/SGKF+Jd10Q2to/fuMVqsfDdXS5T/ABEx2eu6wD6TZ?=
 =?us-ascii?Q?Jt7DnidYdkrJiPOoHXCfyd/z8ZpfpVHpgdk2f7UIvpxvgxzuB15QgSb4v2gt?=
 =?us-ascii?Q?Cn1sKopeXiyhOHjA6K6CSna0Dq+9R3eyFc2qm8oifDpPyKZCKc6ZRZJgVCyd?=
 =?us-ascii?Q?an1DwYXKZGDAQhfaC8+Z0ksC/qzYRuF4wlYuCirTXDFyyyWmTKkPCddIRCN5?=
 =?us-ascii?Q?yhlmoEUUNfAatcQahQ7LKLXvQ5WqRAWVuCxHlYFevEwhHrXsYPZP1guO5wlP?=
 =?us-ascii?Q?RMepDPtiSRQFw7MqFC8e7SO47+pt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AiTyy/fTRl5mWXdkmgVl4E0AFGQKXLcmEvawUQhKTWF+254IGGkww+RlMFNa?=
 =?us-ascii?Q?9RyBZwYJCMliAP2HgdiIGJ99Jv47soKttobwLayzX128Lweb5KWy7hSpAe5a?=
 =?us-ascii?Q?yGJQ06Vt/2auB4aUjEiRItYXDgc9rKto8DbuiHDURHrOBApc4KyhHBMnjUPg?=
 =?us-ascii?Q?3WmsQP8Xg31wbbsrmROpTlbJHnzp1PITq7rp17qjIOzA7Q5XzhE9gLERvrcX?=
 =?us-ascii?Q?ra5CQjtPZfcmb7zzekIlgg2+FEgF5rl7LQe6AC9oY8n5nKahDeAQnwSLPaHB?=
 =?us-ascii?Q?LEWBrhBjPQfDunLNNNPHUZASG4zx3beOCKGE/AK1NDTbbkChxUUiyFgZJa51?=
 =?us-ascii?Q?WB1wfj+hoFxI/8zcKsOPuTfSpSop+WR0e7t9lOLfSq94N3FTAqJyWPDjqngP?=
 =?us-ascii?Q?2q9eFPtqr4yOMEerkY28mL6sfrC7aAf5L9wBjGp+DkXAts5CIoNuMpOC1djh?=
 =?us-ascii?Q?hhhuQHfimrdPvt30aZF79Z2ON0vFyOMGSfqOALXdu6QEokcxIxfLiNeNOZY7?=
 =?us-ascii?Q?oqu8rpXIyRT4VBEjVoA0kv4+MtezlKzQVbULy6bw/qyh5TVkogR9rYlEtB6B?=
 =?us-ascii?Q?8K5KtVmRHipwSJ4IuHBPxFptTupL4LtVl5Tu8l0Wa4H1w8KGwQWthnkyFoNb?=
 =?us-ascii?Q?s2NVI7k+xdYEU/9Oend16gwKbbntME9KPDyMWzT0jCjqw7e7HX5QPMLAKtNx?=
 =?us-ascii?Q?mtxlyQ97ix5WC00vwWecXXBK/9bnnheZLAFgduDACHLcV/asTqO3KudstK3t?=
 =?us-ascii?Q?xTVJtb0jNLgC0p/KME+Q0KtnNzZbl93B3Yv+B/T9ImHY00soalGxJi0iNJD2?=
 =?us-ascii?Q?3ubRDuQjYiS/Zn/epUQLdTgkEmTZJenPdEbznDDoE5SyIj5g6Irt+xkrfEzT?=
 =?us-ascii?Q?cLKtBGOoPTWs4dbkmFxSvghuwlFLRGyJq2Qs9Nztixd6/5mWzbXCMEDZQtI0?=
 =?us-ascii?Q?D+LeNkDvqj3gh7Ud9UNbUSTx86+x8BCJMHFrtyeTA1eQLyoJpPMQGmS/ucS4?=
 =?us-ascii?Q?iF4UNRQKH+k8IWozAX/7SNfN5QysZdtB5F4rTraLQ4LGVvNgv3pZ8J/bE7Sa?=
 =?us-ascii?Q?rX0yHw9vZM817nXdq+ZlO8NGO1wsJb8T5KqH6FRBxF6UBdBzTos6VYVUbynM?=
 =?us-ascii?Q?DwWIE0W/FLrYQ2zYrX1Ts6QbDAy/sTBYmMGxIMFVzpcsswofSCBIRVGEXAkq?=
 =?us-ascii?Q?P1zl+ZNJ5XBvkK4bypWwjD8rYVWs18H3p4YWZ9yYPp26gE1ODfP5Y5LZQDit?=
 =?us-ascii?Q?WyPRu6eKcSDrAsqw9DF9KpgkkPNse4onvX1C6NGK2O5CMzbto8/NVCWuoqWW?=
 =?us-ascii?Q?eEj0ESLfhGcqyoajJ2ZIXdCa/kEhG4fePFv7sBMu1yz5DYLBVr9ChQX92XHk?=
 =?us-ascii?Q?GnfT4DaBCQ5dbPIC7xq6IPuFSX6YSydU0lfOTZ3MdZKDsrurjNQfBMFGZivJ?=
 =?us-ascii?Q?PwcBVJyLZAKuj2P2iWd8Ao1CrcTplB+dtyrDvXmZrS+UnGfqb9dh1WG2VfBn?=
 =?us-ascii?Q?zs+dVx+uoDATWdffG2vhiV+Kau0Q4UVkzxn2762UhAnxmOvHA8NNM7lQATLd?=
 =?us-ascii?Q?LzbxldI2dNVI/rWam/w8ZCan2KYm9bN3F5nk6pKQ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c584710-08a6-41f8-3414-08dd4eced29c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 21:13:56.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fN5NuzYMk0E5KnIaixdxYdthbpKOT+Sbryxa6SFoPUG/XoJVgiPY/HPsbZfZOklDlrJVXxVDeZOlTx5lbDHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB9079

Hi Fred,

On Tue, Feb 04, 2025 at 05:18:29PM -0600, Fred Treven wrote:
> Introduce driver for Cirrus Logic Device CS40L26:
> A boosted haptics driver with integrated DSP and
> waveform memory with advanced closed loop algorithms
> and LRA protection.
> 
> The core CS40L26 driver is in MFD and touches the
> Input Force Feedback subsystem for haptics and
> the ASoC subsystem for audio to haptics streaming.
> 
> This patchset includes changes to the CS DSP firmware
> driver which fixes two bugs and introduces support for
> multiple coefficient files.
> 
> Fred Treven (7):
>   firmware: cs_dsp: Fix error checking in wseq_write()
>   firmware: cs_dsp: Check for valid num_regs in
>     cs_dsp_wseq_multi_write()
>   firmware: cs_dsp: Add ability to load multiple coefficient files
>   dt-bindings: mfd: cirrus,cs40l26: Support for CS40L26
>   mfd: cs40l26: Add support for CS40L26 core driver
>   ASoC: cs40l26: Support I2S streaming to CS40L26
>   Input: cs40l26 - Add support for CS40L26 haptic driver
> 
>  .../bindings/mfd/cirrus,cs40l26.yaml          |   81 +
>  MAINTAINERS                                   |    4 +-
>  drivers/firmware/cirrus/cs_dsp.c              |   70 +-
>  drivers/input/misc/Kconfig                    |   10 +
>  drivers/input/misc/Makefile                   |    1 +
>  drivers/input/misc/cs40l26-vibra.c            |  669 ++++++++
>  drivers/mfd/Kconfig                           |   29 +
>  drivers/mfd/Makefile                          |    4 +
>  drivers/mfd/cs40l26-core.c                    | 1412 +++++++++++++++++
>  drivers/mfd/cs40l26-i2c.c                     |   63 +
>  drivers/mfd/cs40l26-spi.c                     |   63 +
>  include/linux/firmware/cirrus/cs_dsp.h        |   14 +
>  include/linux/mfd/cs40l26.h                   |  341 ++++
>  sound/soc/codecs/Kconfig                      |   12 +
>  sound/soc/codecs/Makefile                     |    2 +
>  sound/soc/codecs/cs40l26-codec.c              |  523 ++++++
>  16 files changed, 3281 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
>  create mode 100644 drivers/input/misc/cs40l26-vibra.c
>  create mode 100644 drivers/mfd/cs40l26-core.c
>  create mode 100644 drivers/mfd/cs40l26-i2c.c
>  create mode 100644 drivers/mfd/cs40l26-spi.c
>  create mode 100644 include/linux/mfd/cs40l26.h
>  create mode 100644 sound/soc/codecs/cs40l26-codec.c
> 
> -- 
> 2.34.1
> 

Thank you for this high-quality series!

When the CS40L50 MFD landed last year, I (probably naively) imagined that
CS40L26 and CS40L50 were close cousins. My understanding was that CS40L50
implements some basic DSP functionality in ROM, which can be overridden
with firmware uploaded at runtime, while CS40L26 requires firmware to be
uploaded at runtime in any circumstance.

To that end, I recall during the CS40L50 MFD review that there was some
hope the CS40L50 MFD could be gently extended to support both devices, and
a separate input driver may be required. At the very least, I was surprised
to see an all-new codec driver, since the codec child is essentially just a
stub driver in both cases.

If a completely new MFD and children are utlimately required here, then so
be it; I just wanted to ask whether you had considered if it's possible to
re-use and/or extend any existing driver(s) here. Assuming so, I think it
can be helpful to speak to this exercise in the cover letter and explain
your reasoning to the review audience.

Kind regards,
Jeff LaBundy

