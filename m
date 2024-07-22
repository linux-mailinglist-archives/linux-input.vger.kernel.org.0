Return-Path: <linux-input+bounces-5117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A119193928A
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 18:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF431C2150F
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 16:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A8E16DC0C;
	Mon, 22 Jul 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DardbNI0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05426ACD;
	Mon, 22 Jul 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721665849; cv=none; b=MUXerL9S1M+bj4DLZiPKhGoLSiFhrvpauCTnG30Zfsg36jd0Wf2ygI8AIyEZD6sN2FRssaWKdPPDgTI+0PoH2ZVj+qksvoho1AVP1t804aQxOHZxP1V/OZubaoWUZQRLWDpVXjJZIB+V5E5A/fGhaqGbemsTwHNL5BTBiFoP6MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721665849; c=relaxed/simple;
	bh=iy+DHszSYzVd/2RQ3w/4OKIj+1QnSngPdSBIBoonwvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEsHPMeOwvDg/UUVekH4OgsFK0OW8JwQ6Ye1wpDxl2O9CxzD0cBihjiMLu18sx5pDtkROnexfdL31AvskQigov6chCis5NxJE6sIb9IP/DmAMrQuPew3TZarfa1HTQ9kk/Nkc7/qRMQ5lSq4nS6mUl/K6WrnN2e3eYGdy5E5nHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DardbNI0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792BAC32782;
	Mon, 22 Jul 2024 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721665848;
	bh=iy+DHszSYzVd/2RQ3w/4OKIj+1QnSngPdSBIBoonwvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DardbNI0Zi+RDgiJERVOwi5alDu4PtEZH0sFLoddTiENZ55EbDexeoAcOfqHVvglk
	 /MXT8RiVqvx7VkKtnCWluzn1ycZhiD+EEz82YPRWKOSt7H9ZMgBQXEjVHNhgXC44YV
	 pfBzYsQYIoUraJ9xm93Tig6NG8PH2XK1oGLEf1eqJL4oj8mN5yeaYBz5qrP2zCU6af
	 a3gubOF6zHJ2mYvpsc8EsKMQubuLDrmgmREaSL4NqlDBtYtpkrykwI4oaT0FVtNDbh
	 8iTk+rUpXIu+zkdfMo4axtftmQoHqUx8Sq8CYJ+FIzopdcldIAtkCMeYojAr7/wyhy
	 JNstCBkcNlmcg==
Date: Mon, 22 Jul 2024 18:30:44 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Chris Hixon <linux-kernel-bugs@hixontech.com>, 
	Basavaraj Natikar <bnatikar@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	Jiri Kosina <jkosina@suse.com>, LKML <linux-kernel@vger.kernel.org>, Li Ma <li.ma@amd.com>, 
	amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, yifan1.zhang@amd.com, 
	linux-input@vger.kernel.org, Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: [BUG] HID: amd_sfh (drivers/hid/amd-sfh-hid/): memory/page
 corruption
Message-ID: <kkenglf5lkvu2um3o44umdxaoeh5zgsaus73kauc6vwcqpnsfv@5i6xtjnxtb5c>
References: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
 <ade43b5b-9b93-40a8-acbf-99df944b45f9@leemhuis.info>
 <11fdf362-8fa5-4d44-904b-c0c9867ebd07@amd.com>
 <f6162b22-c6c6-47d7-9bda-dd702fcc5b4b@hixontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6162b22-c6c6-47d7-9bda-dd702fcc5b4b@hixontech.com>

On Jul 21 2024, Chris Hixon wrote:
> On 7/21/24 00:20, Basavaraj Natikar wrote:
> 
> > On 7/17/2024 4:51 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 15.07.24 06:39, Chris Hixon wrote:
> >>> System: HP ENVY x360 Convertible 15-ds1xxx; AMD Ryzen 7 4700U with
> >>> Radeon Graphics
> >>>
> >>> Problem commits (introduced in v6.9-rc1):
> >>> 6296562f30b1 HID: amd_sfh: Extend MP2 register access to SFH
> >>> 2105e8e00da4 HID: amd_sfh: Improve boot time when SFH is available
> >>>> It appears amd_sfh commits 6296562f30b1 and 2105e8e00da4 correlate with
> >>> some form of memory/page corruption. 
> >> Hi! From a quick search on lore it looks like Basavaraj Natikar who
> >> authored those two commits is inactive since a few days. This is totally
> >> fine, but given the nature of the problem slightly unfortunate. That's
> >> why I'm trying to raise awareness to this report by adding the
> >> subsystems maintainers, a few lists, and a few people to the list of
> >> recipients that were involved in the submission of those two patches.
> >> With a bit of luck somebody might be able to help out. Ciao, Thorsten
> >>
> >>> On my system, this typically
> >>> presents itself as a page dump followed by BTRFS errors, usually
> >>> involving "corrupt leaf" (see dmesg output below); often the BTRFS
> >>> filesystem becomes read-only afterwards. Note that the underlying NVME
> >>> disk seems fine, and the BTRFS filesystem does not actually appear to be
> >>> corrupt when booted/checked from kernels without this bug (no BTRFS
> >>> errors or I/O errors reported on non-problem kernels).
> >>>
> >>> I have no problems when I blacklist the amd_sfh module (any kernel
> >>> version), or revert both commits 6296562f30b1 and 2105e8e00da4 (on
> >>> stable, linux-6.9.y). I have no problems on any recent linux-mainline
> >>> (v6.10{,-rc*}) when reverting these two commits (in addition to
> >>> reverting 7902ec988a9a and 6856f079cd45 to successfully build the
> >>> kernel). I have had no problems with any 6.6.y, v6.7.y, or v6.8.y version.
> >>>
> >>> It is curious BTRFS always seems involved, but problems go away with
> >>> these amd_sfh commits reverted (or amd_afh disabled).
> >>>
> >>> Further notes:
> >>>
> >>> I have not specifically used the amd_sfh module for anything. As far
> >>> I've been able to determine, my system has the "Sensor Fusion Hub" mp2
> >>> chip, but has no supported sensors/sub-devices (or I need to do
> >>> something to enable them), (or there is an error while detecting
> >>> sensors?). All logs I've checked contain something like:
> >>>
> >>> Jul 09 04:14:37 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device
> >>> (0000 -> 0002)
> >>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to
> >>> discover, sensors not enabled is 0
> >>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7:
> >>> amd_sfh_hid_client_init failed err -95
> >>>
> >>> Excerpt from lshw:
> >>>            *-generic:1 UNCLAIMED
> >>>                 description: Signal processing controller
> >>>                 product: Sensor Fusion Hub
> >>>                 vendor: Advanced Micro Devices, Inc. [AMD]
> >>>                 physical id: 0.7
> >>>                 bus info: pci@0000:04:00.7
> >>>                 version: 00
> >>>                 width: 32 bits
> >>>                 clock: 33MHz
> >>>                 capabilities: pm pciexpress msi msix cap_list
> >>>                 configuration: latency=0
> >>>                 resources: memory:fe000000-fe0fffff
> >>> memory:fe4cc000-fe4cdfff
> > 
> > Could you please check with the latest version, including the patch below?
> > 
> > https://lore.kernel.org/all/20240718111616.3012155-1-Basavaraj.Natikar@amd.com/
> > 
> > Thanks,
> > --
> > Basavaraj
> > 
> 
> Hi,
> 
> Unfortunately, that patch doesn't fix the issue. I do get different crashes...

Thanks for the quick testing.

Basavaraj, was the patch from above an attempt at fixing that particular
regression or was it emerging from some other means?

In other words: should I apply the fix even if it's still not the
correct one for Chris?

Cheers,
Benjamin

