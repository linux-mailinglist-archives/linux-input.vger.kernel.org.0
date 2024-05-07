Return-Path: <linux-input+bounces-3564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9388BE720
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 17:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842DC282848
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 15:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DB7161318;
	Tue,  7 May 2024 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="jW3s4YV8"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2110.outbound.protection.outlook.com [40.107.102.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2D161336;
	Tue,  7 May 2024 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094880; cv=fail; b=BAgw7fzzLELeCbP7tSfyx51/gr47elDlTEoTgTus/Olkk6quFt8rC+NzkcgsEGIRvvFxzh8uGMnk6BeRxrUaKj22tK6QOtnwRtu4lsdqi4Ogl1fQO8iMRkG+CXkihjcukNSC/tDYIQVW8/fowAEOxFN2Y7+A9rWcoHSDvGtgCgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094880; c=relaxed/simple;
	bh=G/mMd+xpGtoIaUgrpJNrhOnH4buTBAqRjD+n1ldQW7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DBDFCxiFcP6MQnscJSAIO/lpyZ/wG6pR3gLXMAsC8kSBUsy+3DPZcbuysPV+QZtRVRD8eS7T/dFMu2TFA6kewamkJshHwsS9wSjyakJq97NrkvYkE43mVFe8rSJy9aFCn7xkg2yNMakLTZDoTynQI9dotzKinLEGT57BcV0c1L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=jW3s4YV8; arc=fail smtp.client-ip=40.107.102.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaWHusYKnNi3qD9QlHTFluhiOpTaOaHVsQW/5yMFC7V7cYeSiuPBfFh/hdkqlY+ze91Q+chgYj7YUcMxV31GqTexmrbZ38Eeofxb/TOqpGTWT9LduvzYLMQY3T1ciK4ND1In5ZHaeg0DCopbot/+kGiLF67zk++Rn+IjDQIvsVYf95N1fMe96gAvGo2lCHTAP6DXkC38lU91h6F7g9tlXh6d0c/v3DfXQ8pKGpBnJKDQskKBiUaCz7El3uYL4MrCpYnmm29RzT1DTxe6syyzcS0oO2n9HmjmNjtSdp8bTaMNmtZVrAjAFSCybPAYsuP9lsNJDQVvN/3YUPn5Iefgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH1tGvi5MPr0bZwwSERzA+oE7jtLok8cxXfH/ez+0bg=;
 b=D3ukJ09xsgxhpId5Zdb2Ho7zslftNY3U0CaAlYFUqprJHzCOxxcB8qDkTu52zKbrE4hvEMjZOlclM0QSvpx0rk1hQvLvSN8wwRvN3aYxKsynSurOhoXDy3jCZJ6qU9itk4W+baJQT/pwgtlNi2NyHAaX8LH0qzP/2MDsOd2DILcwwRdgt2JQgkMLAZyHbkTXI0DrmIBiE+lxj3ArW/xhv9HR7/lilxw5+WHQy1dKFH0LY8YdGZWoEacdrSCEv6AsQyTFT2S7douHCPNRPB8Tq89umN9b/r1EBIjZ+4aKh3SOjMCdF5XUIRheLSrpeCTUoWbzFVJQbEH97NYB/CYqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH1tGvi5MPr0bZwwSERzA+oE7jtLok8cxXfH/ez+0bg=;
 b=jW3s4YV8ezCA0Oz0EEypqcMZCXh5yvcScPI4tXpoplmYRN0FCnVyQ7ZLzRnuSJlG+3M4Ffb6Bqld/xJnRnVCspbNzTtCZdXu0EmXjT5Q+moVtFEeYnZc8x/7p9rUeUJVHbvkJ+Oy6gtK+n2+mkW19HKFYF83zJI5cXgyBJiw9vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CO1PR08MB6817.namprd08.prod.outlook.com
 (2603:10b6:303:9c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 15:14:35 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::dbac:96f4:6fea:efd8]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::dbac:96f4:6fea:efd8%4]) with mapi id 15.20.7452.049; Tue, 7 May 2024
 15:14:35 +0000
Date: Tue, 7 May 2024 10:14:28 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
	Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjpFVGw6PgjRcZY3@nixie71>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
 <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk>
X-ClientProxiedBy: SA9P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::25) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CO1PR08MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f31b79a-caf5-43c8-846d-08dc6ea867bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pzzX69pCwWH2PAMsVChbp5zz8WalwtLFv1nws27Xx+vpp2W4hs0IVLm77ADM?=
 =?us-ascii?Q?7PbTkKSgrDOpi10E7/poIkw2ywtpdJ5Mn2MDWqoUy0Y0HlS3YozhaurivhDL?=
 =?us-ascii?Q?EB9gpCrHPUJycEZcvzeGd5QonuHwe4+p7JZLrVGGimmmTwKgB+JfYBz7rXdM?=
 =?us-ascii?Q?Fb1gfyEi4RiuWCLRAbU7LrJNaMADLqU9nKHeYkIk4JKaKXXSKpUveMMAt0Jv?=
 =?us-ascii?Q?AgCzw/tan2EprFwP8VRGNj+N0JWVgtxNrxj+JcS7LFd49/6PTgTp/LWd9eIc?=
 =?us-ascii?Q?MC/Gdg0orqaKcOSmP1AFY+qFXvvJns7nf3Io9d2pEC7cVszGFKANQyO8M9AP?=
 =?us-ascii?Q?ndUu/5XfQ7gfuVbZ8j6x260ZGQ5/OaHIKFpJxL61rwtG09AnRK1U2RGkohJV?=
 =?us-ascii?Q?ubCj7WTxIfKW2UxkaTObHIFuHhQvvM5r6saxHVdyxDTjZjgYCgVJ3MSnKbIJ?=
 =?us-ascii?Q?/Ld3Tne49WFDl75x5aFt3AOtlAt0SB0f60z5bqR4qFF05dqxzarpyK+FV8+i?=
 =?us-ascii?Q?1x5rkkKcTevmg06wwJhVf7/AeiHOj8W1pvzrUflPqKJV468aABPlRbfIS0rm?=
 =?us-ascii?Q?7LDSw6KnjXfAOJYszZ+40vosbCeFjMjMynqvkNjpVGoC5DoUuP4NCc1IauEX?=
 =?us-ascii?Q?RVaO08mV56FMwGhAcWRwdYywrJKNW32R1QQU3RhaMBLv1nA4JlUKQE8J2uJ3?=
 =?us-ascii?Q?C/Glm01pOSdtJUtehfNsea5ccZB+IviFnw0WwxGrM11PgC3NTXPgKSVEwOFh?=
 =?us-ascii?Q?NbPjtJygMDtkbgZXVZSMFM1c2RWmsYZHBucc8kuX57WS7VudBPaDvuLFDeHf?=
 =?us-ascii?Q?rQ1ZilxqnEO7P9jHjTKftAlIEKEI60rrq9n2Bstf5z7XRuLYGvhV2f4Bo9LI?=
 =?us-ascii?Q?RdEyAiEI43k010DkrUxADb0KaBLSlfX61oFotQr3/cgMFKbJGgHmtWxm4xs4?=
 =?us-ascii?Q?zm/pXoc3ahToDC36a+N2xLTlZPyJPxNmGd8bqXLPjwYr9mPnR9A+bLmY6dFN?=
 =?us-ascii?Q?oapw+s1xiGHyWkAkbLqlUHE2hsRX1MHOcVt7D1XmLKzCozFxyKh8VApgowaD?=
 =?us-ascii?Q?DiRexSTwH1WffxURgYyTrtcdJoO5GyMA0dOWEWEs/4HWe+XNjNwWoNRzo2j+?=
 =?us-ascii?Q?cyn36NheFpHOoMG0XrCPvdrXneu2rYroIVfE3N8f9fig2SEAilNeFoOxtQXu?=
 =?us-ascii?Q?Xrx4NAaIpvU3BWcaZd8XCScvgqf3XdlWVl9FeLFa+0kcQNEbyLQ42e+NVe6D?=
 =?us-ascii?Q?WHIxLhKAyOTqWRv8Y7rVOl2l2Ki0JyEchZUrNLBbOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xxo4gYWm+4t2OrRmSZiIAO0FKEVgg+eT/D0CK4vk1mlVt+sVEpqOBtrIc1X2?=
 =?us-ascii?Q?bcPRV3qFixw1MKbJK7+3IpF09h+Ym0C6aUMVjsiVQJjpk/1Z4LA65jTH0tY1?=
 =?us-ascii?Q?Kt1vJ/O6exS2GxXLSCgKNkKBmAtK5xaZFKixIgtWGLjy9aUxvg4v/kiXIj04?=
 =?us-ascii?Q?ZzUUT2C1UwjUE5ygqbsyPztGt8UTgmAtG1aU6uAPUNFAx9UAmUvHN7yxlpO4?=
 =?us-ascii?Q?FgGsb8INABFZZZGrX/WLD8OZcHrUWpmLnsjq/MbVajIia98kgRzpVyHimVh4?=
 =?us-ascii?Q?7T/Pv5Lw7S4CMHosIxLzbG3+UIKWsK3Fj1sEHEiyWfSlS9Bu11Kjyjgn+BZl?=
 =?us-ascii?Q?rPhAgQOwswvhpBYvyak/vCbmZ45FBH8Nkh3PFeBTWBPONpMdikf6qJaWrjBy?=
 =?us-ascii?Q?dIjQR3Evg4yoCYkvSWndlbr6DBE0AV6kZUUxbb0fTnZ11U1QtCbvfd74WsG7?=
 =?us-ascii?Q?EywII5eydMxEB5iVQdf87CIyJax/GtYswhLkTjm2MJ3SACJQuQsOZcspUTEl?=
 =?us-ascii?Q?DLwLrXrG28RRFiHGS1SgBxPlVBpdby47j9ab+wl1TnC8l1SSotzwXCNEDr+x?=
 =?us-ascii?Q?ep2k04I3Pg1DmIE0ipfvqRNglyjsW82NkTQGm0WuN4xkDXvM4hbJ2wuJ5V+E?=
 =?us-ascii?Q?+VoI/KDkmEpZa0bGSdRo8QgdqC3M1C6XDhuN02FX+kwGoqO8LBFh5rUeWz54?=
 =?us-ascii?Q?BZf81xwYL8LoUoxmJm26xI1Tvcg0wfuva/il6C976mHjMUsGiLHNM+p6Iqrx?=
 =?us-ascii?Q?gZ1+AsGFeigx9SaP1mgwFLbxoGAIlPDYqUmWKbYSjSpiznbNQPDOwbR0F8/P?=
 =?us-ascii?Q?0Fih2ldHZZVzKlhDg4io7wZBz+EWON5FYtC5lwBE75pPJdQyO1yV8UrEsmHB?=
 =?us-ascii?Q?+JzC4Is8M8/9QBRToqZeNI5tejk3QVeKJFj+BcSX+mYdBUh3eT3MDpL1JwZB?=
 =?us-ascii?Q?HyoQhm1XugTPkRM1jbtxKDHNpEu6+MxMhWZhgFPkCdX/0EkubcJzOhHrS/n1?=
 =?us-ascii?Q?iPRIh01pzbgfS91b4BqUVmGOdtzX0+QncLRsJMA7E8r1ebH/ovizaxW2KBG0?=
 =?us-ascii?Q?SYkVJd36aysA7XZAwqMWApYgXP4pek93EZZKgMthvEQYeHOa0xGTTRCOwfsF?=
 =?us-ascii?Q?8+iDjQhTQ9qZwvDLyKiC+wNPAynIv0mzvtQqO/7+WC7J0G7iBkLnl7z2x51m?=
 =?us-ascii?Q?MQGVyCdnFMMwhx4hI1fqweR0c8/lkeVXnGddqqnNB3EiZQMf/tpZIDG8X2lf?=
 =?us-ascii?Q?cm2+rr1LbP7vP+euWX+kjBReHBMWwVwyB2DxxMLkow1OSDEECQPPWppluHjc?=
 =?us-ascii?Q?Agc0xEB0usxmwCR1FgptKsvHxeZNdfm2sHOeFkySIpRqni0BW4IxSHH4OHZZ?=
 =?us-ascii?Q?7RcmJ6ObuTdDpEKzD+2ukpyKJPbXZjd/lotcOnDR4JKVNxsgWFSh8BPVgbRz?=
 =?us-ascii?Q?RoJxrbYJc8h/uQI9AtQ97C6dqCM242m5ehBQ8Ht8LPGxgsxbKAtk3ZWztERj?=
 =?us-ascii?Q?uEAD20w9wuPs65ZJw+ZTRLFnKSjNPKsV7LYNsQVdp8jNWhqz9Rlnn/rPiCiq?=
 =?us-ascii?Q?NNh49tYXdOSKaGZW4QhQOyxfUA63DIGRsNP4SG+v?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f31b79a-caf5-43c8-846d-08dc6ea867bf
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 15:14:35.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40iJrL5TJ4YHt5TsfjaTzUeAUSVNELG/IcyoMBZ5wn7qZTLq8vaQgg2MPzdT+MY6/P6ZKZlTIItfszcbJMj2FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6817

Hi all,

On Tue, May 07, 2024 at 11:36:41PM +0900, Mark Brown wrote:
> On Mon, May 06, 2024 at 07:13:38PM -0700, Dmitry Torokhov wrote:
> > On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:
> 
> > > If raw register access is seen as a good solution, then I think this
> > > should use regmap + some generic helpers (to be written) to export
> > > regmap r/w access to userspace.
> 
> > I think the less code we have in kernel the better, especially if in
> > cases where firmware flashing is not essential for device to work (i.e.
> > it the controller has a flash memory). That said IIRC Mark felt very
> > strongly about allowing regmap writes from userspace... but maybe he
> > softened the stance or we could have this functionality opt-in?
> 
> I think unmediated raw register access is a terrible idea, you can't
> safely write a driver if userspace can just go in and randomly write to
> registers with no coordination with the running driver and for some
> devices the kernel needs to ensure that any writes don't damage or
> destabalise the system.  If a driver provides an interface that looks
> like raw register accesses that's of course fine (I mean, a lot of
> firmware formats basically boil down to register write sequences which
> is clearly fine) but it should be the driver doing that and it should be
> looking at what's going on and ensure that it's joined up with the needs
> of the rest of the system.

I happen to agree here; especially in the case of writing new FW to a
flash; this is a very hardware-centric and device-specific function,
which by definition belongs in a kernel driver.

For example, many devices must be placed in a bootloader mode during
the FW update, and may clamp or toggle an interrupt pin during this
mode switch. If user space initiates this sequence while the driver is
unaware of this process, it may attempt to read status registers from
an I2C address that is temporarily offline.

A much more common design pattern is for the driver to expose one W/O
sysfs attribute for accepting the FW file name, and one R/O attribute
for displaying the current FW version in flash. A small script runs at
start-up to check the version against what is stored on "disk", and if
what is stored in flash is deemed out of date, the script writes to the
W/O attribute. This is the extent of user space's involvement.

Kind regards,
Jeff LaBundy

