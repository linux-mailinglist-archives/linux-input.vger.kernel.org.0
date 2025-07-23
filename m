Return-Path: <linux-input+bounces-13665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F063FB0EE90
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 11:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 325F2172353
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 09:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8969C283C9F;
	Wed, 23 Jul 2025 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DypZetei"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9C19C54B;
	Wed, 23 Jul 2025 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263385; cv=none; b=ZR2CyPkryFqgan7yGm93O76lV31tXsqPBZmwXgsEwvjj6rl5mNRYkBCo3Sm7oMdDXEIEpFUnUCMg9o4B/Hsde4BtzpoODcAl4S6zB9mVS1Eza0Dz9QwMehJCll2jn7H/PhhzXmMTs5OC5dOYU0DOxdYbUDWSDVkV9HlQur1gUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263385; c=relaxed/simple;
	bh=pYy6ryWOqe7ctLxlpAUv0mJfc4zPW9hhl8qCJspUpzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnPQ+gtklZSnbt33E68YdQDg7GhIXCzADon8ArbJBbvNx6mZMUXSjQGv/TOALfIdenrGEJl27lKSRC/Md9djklOpsd2IIdFuksBhx/XIMRIskswMNAH+DLtx3ahc76GgEmZaB3cM1oel5hpFkwKzT+iS7j9gBd49w/CiXmKygoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DypZetei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A31C4CEE7;
	Wed, 23 Jul 2025 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753263385;
	bh=pYy6ryWOqe7ctLxlpAUv0mJfc4zPW9hhl8qCJspUpzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DypZeteiGQcFhgi/OJ7BrjWZzXpXabrWqcgpSk4gJNlJLJfFW+ITHz/AUht24S/RJ
	 87eaqULYlOW8IjBJPMTZXH1cQsvvZq0GebzEEwLAICuka2j8NtpM9HVpVm6GlSsjzv
	 9OWKEk0vR5bSNiSD0AyHByl4sK8xkhblKtczQnr+YOjKRUEb+thyO52lbGjrBYPAAZ
	 eb8lijOdFns4HGkSHM5NrQxp0XE+ENjjocVuTHE/FZoGTvme9ftb4PhD+WqxcbbFyb
	 PQMVWVzVSVGPjg4bi59emp6MAIorxxyUbmBZMcES2vePm5TtARHPUffq86/i4B4UlZ
	 rYIJnGhfF8fOw==
Date: Wed, 23 Jul 2025 11:36:20 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: (subset) [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in
 s32ton (2)
Message-ID: <gdbdodhtc2ibzfzjtniawzamz7iqhcdhyiubviy27vypszfhc3@cypc7pfbib6z>
References: <68753a08.050a0220.33d347.0008.GAE@google.com>
 <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>
 <ea7f1f42-273b-4c07-8bf2-769992dd9ced@rowland.harvard.edu>
 <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
 <175285492024.272050.11219945704830043047.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175285492024.272050.11219945704830043047.b4-ty@kernel.org>

On Jul 18 2025, Benjamin Tissoires wrote:
> On Tue, 15 Jul 2025 15:29:25 -0400, Alan Stern wrote:
> > On Mon, Jul 14, 2025 at 10:10:32AM -0700, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    b4b4dbfa96de media: stk1160: use usb_alloc_noncoherent/usb..
> > > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=15a830f0580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=28729dff5d03ad1
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
> > > compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1614418c580000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1257dd82580000
> > >
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/7301552ad828/disk-b4b4dbfa.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/c559b38fa1b6/vmlinux-b4b4dbfa.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/9c1da8b2a83f/bzImage-b4b4dbfa.xz
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > >
> > > usb 4-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
> > > usb 4-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
> > > usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > > usb 4-1: config 0 descriptor??
> > > microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> > > microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> > > ------------[ cut here ]------------
> > > UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> > > shift exponent 4294967295 is too large for 32-bit type 'int'
> > > CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.16.0-rc4-syzkaller-00314-gb4b4dbfa96de #0 PREEMPT(voluntary)
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> > > Workqueue: usb_hub_wq hub_event
> > > Call Trace:
> > >  <TASK>
> > >  __dump_stack lib/dump_stack.c:94 [inline]
> > >  dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
> > >  ubsan_epilogue lib/ubsan.c:233 [inline]
> > >  __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
> > >  s32ton.cold+0x37/0x9c drivers/hid/hid-core.c:69
> > >  hid_output_field drivers/hid/hid-core.c:1841 [inline]
> > >  hid_output_report+0x36f/0x4a0 drivers/hid/hid-core.c:1874
> > >  __hid_request+0x1e0/0x3c0 drivers/hid/hid-core.c:1987
> > >  hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
> > >  hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327
> > 
> > [...]
> 
> Applied to hid/hid.git (for-6.17/core), thanks!
> 
> [1/1] HID: core: Reject report fields with a size or count of 0
>       https://git.kernel.org/hid/hid/c/bcf266ca2779

FTR, the patch has been dropped from for-next, it broke existing
devices. A better patch is being worked on.

Cheers,
Benjamin

