Return-Path: <linux-input+bounces-17097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FBD1FA55
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 16:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3615D3011AAD
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 15:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9201C3191DE;
	Wed, 14 Jan 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DlcfvWi3"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1F3168EE;
	Wed, 14 Jan 2026 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403571; cv=fail; b=Rtpznp6B8L4I+ji9WAbgE5hkSRx3TfARQYJSQCLVhdZDtYxNoHf2Deung5KYxfbKCXHXUYOGf3bWEfJ+Wd1kjuKlWrx5u8rzxn/I1KBDyrm618eChjDAtgcZpOCnEY4ZX0Wfy4rGcXdYt1AA8BJ454iBSoTEjxUugt16VQajuvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403571; c=relaxed/simple;
	bh=f+RWK+Uk1dB/gjXBL6oUomtneVl89kmVoTPvLobzmGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f669wamIENDWY8tHCntrjQTQWqoo6tYFT37tqKFNIVFE4mPfjFazHZrMfDEB0w0HoaY9yrY6/Eik65FZ777E4NfNUOxeQaYLh/rJAsVbO43VPa2LlCKeYjGPkPvlzHN5TcoZ91wEtEEkEirwGFIO8pYB3U/8ujcYRE2KHAJDe60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DlcfvWi3; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKdMPCVJezpCfnkhFiet/+zEjDg2gWAA/jwbLf6ooC73NGQi87D36Uv8cuz3pjSDR7kEOM6QLlxGH9CsWA9GofHDyE33UyAmBBnhkiWRxyZvDyPs2ze+bodE6VzEmgs98xBn0tVCXccF+3tOH1+rRaaER2ApTkAyyrTRmU9cyut7ihF1RRS33vZXBC4VerIqb2b3Cvd9l3l/ydzdrDkLa8WNaLEOPgnbAs9a4y6JQRSy+HckA3dlSvLVcQzF7QIK10dFbUKWR2wDTMRtJUKHsKjiXrq4NpAE/cO1KLbHEecyDRLexDqdETiriqltay29JLDL8BX9tCkXOcHwRHdOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSahZ/A747o6D2t7r6eSx1yOcR2gB92gbT58Y4YVO2c=;
 b=vvZ2jprBY0hKUF4cu/KrRC18pMoxLKoIZvYhPShQ+S2rwc9NGYhHJzjqqUuL+sw8gZqGbJFwY8ommAFa/YTc9NYqqvbYWRE/yBMVxnf7kmkap9YJ8psaxYja50bFqfN29FmaH7lQjr6k2Cmlo1sevFhIgTHni0WVB2Gsywy9lQz4SyvqtuEAM0s4l+w1hvq29BRAg2RRpHoNFE9iutEtDz3K9ISTPiLtMl7oc1/EnN1K+gUfUkUoptfY71iLK8mQcM0iqaIGu3vpqu0woFT/sgrrl4pZ932K2QY/fA93/1QlF4G9LWzzvMVr/42jXR9U/hA01My9hHs0JxyFBv844g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSahZ/A747o6D2t7r6eSx1yOcR2gB92gbT58Y4YVO2c=;
 b=DlcfvWi3UVUIsMXNRZ2JPiqotd1n4TuweCIWf+vL8KsdjTGkelTghV39aHM412uec5iuU0kUObpTyqlY/GkXvReTe1dnWshd/nEJ9VTkvwFp6PotBCPCmbm/iJLlvZQw7NHSr9i6NPCqQxxrLR08Du5+4oB/zRLJbZ9289DEgqQsIavP4ftR/axbMSPunT2xhj3M3Ty32wuUM15auBFxEassjRu6J6cHAsASzlh2CWBZNZeKdAYfXzWo/SQMXARxjh/fcZx70a/UF+P8Bu7QLO5nEatMjDnWTfeh75SOPEiqJqIUactG+axtnyajhO8q4LyVKu8FHlPGAg9crnnPaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by GV2PR04MB11302.eurprd04.prod.outlook.com (2603:10a6:150:2ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:12:42 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Wed, 14 Jan 2026
 15:12:42 +0000
Date: Wed, 14 Jan 2026 10:12:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ili210x - add support for polling mode
Message-ID: <aWeyYFKt53+cYFUQ@lizhi-Precision-Tower-5810>
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
 <20260112234534.225954-2-marek.vasut+renesas@mailbox.org>
 <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
 <CAMuHMdXb3-EFy8WA9FTAqvyYHaF4nGch60bUQ6bbKu6Dzbh6YQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXb3-EFy8WA9FTAqvyYHaF4nGch60bUQ6bbKu6Dzbh6YQ@mail.gmail.com>
X-ClientProxiedBy: PH8PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::25) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|GV2PR04MB11302:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca9287b-f4c2-4ae4-1dbd-08de537f5d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zxh4riep7ENcahIVhX/OOoKcox3ZAV+iTuAOY8k6zwVdPkuqwO7Y1yZUaKIa?=
 =?us-ascii?Q?YWv0lZNk3uRfaxTvpwknxHFFiUVpTXcrRjKjlqSqMrMw1VSqcb8pU95zyNlU?=
 =?us-ascii?Q?9Vnaxp533nrIs8zp/9bOprGpBrgalzKrf8gx7i/Wt0pNHeL5gBYzdGAWcMhs?=
 =?us-ascii?Q?bNDeTakAj2Q8kQmijsMQpudPBKT0AhgMDFgoLqU7SxbN+LOTA3bU/54CKN4l?=
 =?us-ascii?Q?Ly/Wb9WOVwUgju+4jUS/VypdmRDzcHim1DbBPUvMTY4V1ZrJU50jOqUb+vPu?=
 =?us-ascii?Q?BFwyz4UschuhXEXOwJj0PoWBwBzv4Xa53tnTlZ1wtFKeOTsnwARluwHqnv3W?=
 =?us-ascii?Q?JAwNfdkJ6e3Eh3kMTuWd7HX+2zwqejo+FV7LsMJY9FME5RNYfbOhXBsUV22d?=
 =?us-ascii?Q?ZgNZPuSEBD7rjQ64s9vV7mPJI3VFkKOAnEuS56FDMWP2/GG2ZH8zhwzFvUeN?=
 =?us-ascii?Q?nJSkl1VkcF40WK6aZepD1b8G+Bzc2Abhggg3wPumy/o7J4H4RbWLu6yetZZc?=
 =?us-ascii?Q?FwgBRTOosxAYWV6sKaoUlqOFHToqojIZLFO4f6g+F+SSZASwtqSFgirXY4Ty?=
 =?us-ascii?Q?YLNCjc4z/FvKayACr+Dvf9lzVPjGlEuu13Wdlr2o4Dc2LwojdflZY0Llx6HB?=
 =?us-ascii?Q?tQo00TayQSgnS9xjuB6jhkW7a1Y1Dc19R+FUsNWEOjxUIXytD9T8iXoZlXZX?=
 =?us-ascii?Q?yqtqzTvF7GaUB/nMs9y5rtwG9m8aXVRe3lN31jvGrjmysb3e2HpYBMqTNl4U?=
 =?us-ascii?Q?6urvLj9+ATwR9PhlmxACO2RFhMlq66wTuuZoN7zHJqrNXgd8/QpZP9/GwjgM?=
 =?us-ascii?Q?SYjdXhgsMVRf5Xgw+igxxOV2zv5FCp0LUMdl8wZ/dmbQFP/6iDZ18ipXxCVx?=
 =?us-ascii?Q?d/dmRgOUs2jPwnvQbywRtx7HUvNODvAHSXu3102yHCAYRR1KAGnMQngWFpCs?=
 =?us-ascii?Q?QVC/Ly8+s1DdKaZJLMDWRO2T5gdQA5LRiwoosA9Wii7XMku6mEtT9998kVNj?=
 =?us-ascii?Q?+E6J8uEjaS3guf3vUjtCZOFd/E12cg/HZ6DPoMbVA/jyqlsJ+1sypr4WzYbP?=
 =?us-ascii?Q?WEmpgROtYMaYIXKWfcPcN3BJusaWeTHiWOBgKpOjpF5CwevVG1J9gTu4Tzn4?=
 =?us-ascii?Q?jUb06+8odMzHcETTkgyFtI5REx2euAC5VZqlLjYujSQX5IopZzd5baZYxpol?=
 =?us-ascii?Q?AlR1iqCTa4/G1hfY8wEQD0qz0hCcz9gS/+/ZkOeH9uZtjCOjtFG3b13aA4FT?=
 =?us-ascii?Q?dRQ/TSovsCc+7DNCMR+H0dn/rBT+mbIO1xLeTs/wyFA2zRiccRAAIpUNv6ku?=
 =?us-ascii?Q?ihVQR2alvcefHTrsrf3zxH31s5YpkMQkqpsrHaWGZ4G/26/UXsIoFMYq/Vjz?=
 =?us-ascii?Q?2yI/U5/6xQnu957hWWDLg8/rQ5dC7BXEjHBMabZ5hvpz+VZ1dsri8L7epqem?=
 =?us-ascii?Q?eng4rGlwDFLIjT+24Maw0GUq0jV1naX7Wf17qryiyliasUSwtV0JGdCErVEb?=
 =?us-ascii?Q?i0cKoHOvSWeC0ZF9A5rstntNwQQPh61LHJ8AKSbaRPYEkRnlQxhWh1un+TFJ?=
 =?us-ascii?Q?mZWqiwA14s+ZIrfhOlYZAJQdtACtfp8rlyWxhI5J6gOzk/Y7ky6ik7nSTBkX?=
 =?us-ascii?Q?H99Zg82tZHlJj6gOhOzpDGo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QSpYlwsNkXUT6lYvYgBnVqCOa/EK3WWEGEJaWkMCj2BPzTi86YUN/xkRBG48?=
 =?us-ascii?Q?DD3KhLl3A3wmAP7obYSjH6M742tY8kLg8/Z1OUMSQBNwBWhoRMncLVKb/3o/?=
 =?us-ascii?Q?p+TEtn56Plc4DMAiZJNNL4Bz00MOFyf3sYmVkgaXmJI05C/Zx5ynT5KYS0yP?=
 =?us-ascii?Q?Uj9/d3RSd/y71V2GZnVZu4OJw/Wbph6rTYlfL12/jQPQhUG4iQYb27KTKyK9?=
 =?us-ascii?Q?xBOvjg0piCduFlIYTFGt4HVW/p3IGk8vnMMA6T+UEnssq0SbSNC76rQQJBMW?=
 =?us-ascii?Q?P8fLHBoa2wIbFTh/DsHUGv0tGxOQfpTAazEBnlQuakeRwxGqgnobEAYn0O31?=
 =?us-ascii?Q?Rm3UV0uBThXK2c21rLLMuIX2buX65y9CX0wgid7fJti+1xv0Mfa2g0d/aPQv?=
 =?us-ascii?Q?PHNsBcJZKZr3WdRjsMtCj963Y9N4ABnqjlsfasVrmW5FG1ZjjlXO7SDKENBu?=
 =?us-ascii?Q?in8ErJoBCS30VYpqEB2x1hVa6ookaq2aXVL1qlbGp5pmNZ8kSYrl9EoUcHGH?=
 =?us-ascii?Q?0XanF/q3OTQ2U2umLWyXhro7/nMQQtW32SBSpnOIxMdtaIz2ajAbBHItu7o9?=
 =?us-ascii?Q?o6mz/vGLzdQRmAocq9qPOMwf1DnpkAix/uUgY4jei47KNeK/XImgMU7lCClY?=
 =?us-ascii?Q?9t1gQ5NkHSgtIuztDuFRIRDCH+QD2yNh0FxPoVybYEZwsvBXhs5U3QH5lQWm?=
 =?us-ascii?Q?ENQLLIboJJKsmG/v2+Sx5l/P62kOxysZrkbTV7G50T5x6rawM52chNXTH5kO?=
 =?us-ascii?Q?KGshEjcbuh1hwebyGJ/+if8gPBcGsb26ulunV8v1EaGve+ly5c1dqPJRWpAs?=
 =?us-ascii?Q?dIDbjH1xReV1CbcjBkAHUM8g3Rj0AEfNRTCOwdCxjf3ZVK1bfvsu+5bLxQGX?=
 =?us-ascii?Q?Rhn1noVT32YLnBVerkBaXJnOUkFe5Em+Ff1OBCyTQksOkvO5hBpgDxmAZj2U?=
 =?us-ascii?Q?GK3tXcwpmodlYjuFQAE1QKotuO0CLj1hErUZFex4quVhm4WDgn527H8e2gaF?=
 =?us-ascii?Q?IH7Je/3hC4NvraKTy+0DZZMtjEPKyIUSgIpjYyexeKLSbLlVVoTChA3HSU/d?=
 =?us-ascii?Q?rNwlaOMi7GkD95e5OkaImW64huDRU9jTHQoflglb8DpxCv6E5GhnErkpT4aM?=
 =?us-ascii?Q?zP/VFZZlCLlMYPnvKG1AF7moJKct3BkK5sW7OAVAmzJbV9CFE1ZBTgM2RmXi?=
 =?us-ascii?Q?n2uYshGAITVw8kJ7RP+IZzGw+OQzPiFYAQJbZpJORa3tgQsgeiQ3x3suIWq6?=
 =?us-ascii?Q?VXauGAZSnz7DIqoAyZeqbpH+XCfLPF9X4agmKSDNtzBIiklS7WmhA25rem1A?=
 =?us-ascii?Q?h6emOEzQjsTP1KJfPXXU6yuRPZ8PXX8R4eph4lrlcxJiGaVD+yMBJ/9K8aOJ?=
 =?us-ascii?Q?2BiREaCyugfLfIN+KcQyiKDjT0tharr/tcSbhxLWGxQVaLr9/EiQmPBH/n7v?=
 =?us-ascii?Q?Ake19eMQVYDwyRpmoeTM4jRO8qmpbQY6jaNFv6iTnPvZuD+N9olIEIe2rMKu?=
 =?us-ascii?Q?ze8g8eE4EFvQABa+FQgFuKxoJL5fd9N8Zkg0j4Yy3AqKE2EKogiF1mdc02g/?=
 =?us-ascii?Q?HvTwsY+ecX8xj4Y/eE3tI+TKvZ9TERAsnJtYsmEWckXdjpfDhuQyahHBISGA?=
 =?us-ascii?Q?0hv6qGRLHFP7wDGvCvDeBM2TCR1lFS9+YbbCyws2xK1HWQjtSRuTajHzEx1/?=
 =?us-ascii?Q?5pcH7b+KnLh2fiKdYbfqY3m5ziHcLMffAmk2a4zR5oB8fNAX+BpLOIdVFsoh?=
 =?us-ascii?Q?K4j2ryLNPw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca9287b-f4c2-4ae4-1dbd-08de537f5d54
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 15:12:42.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ALITHk3xpIGSFcNzb8aXH7OJtrhw/tLcnWAG/Ym6gtx0dr83pwG5TXmzLA+/PfTXmxjyiN92BV93y9/tFnkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11302

On Wed, Jan 14, 2026 at 10:37:15AM +0100, Geert Uytterhoeven wrote:
> Hi Frank,
>
> On Tue, 13 Jan 2026 at 17:41, Frank Li <Frank.li@nxp.com> wrote:
> > On Tue, Jan 13, 2026 at 12:44:57AM +0100, Marek Vasut wrote:
> > > There are designs incorporating Ilitek ILI2xxx touch controller that
> > > do not connect interrupt pin, for example Waveshare 13.3" DSI display.
> > > To support such systems use polling mode for the input device when I2C
> > > client does not have interrupt assigned to it.
> > >
> > > Factor out ili210x_firmware_update_noirq() to allow conditional scoped
> > > guard around this code. The scoped guard has to be applied only in case
> > > the IRQ line is connected, and not applied otherwise.
> > >
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > --- a/drivers/input/touchscreen/ili210x.c
> > > +++ b/drivers/input/touchscreen/ili210x.c
>
> > > @@ -1003,12 +1027,24 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> > >               return error;
> > >       }
> > >
> > > -     error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> > > -                                       IRQF_ONESHOT, client->name, priv);
> > > -     if (error) {
> > > -             dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> > > -                     error);
> > > -             return error;
> > > +     input_set_drvdata(input, priv);
> > > +
> > > +     if (client->irq) {
> >
> > 0 is validated irq number
> >
> > https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L284
>
> Not anymore ;-)
>
> https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L299
>
> Gr{oetje,eeting}s,

Thanks, negative error number on failure

It should be

	if (client->irq > 0)

Frank

>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

