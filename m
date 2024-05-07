Return-Path: <linux-input+bounces-3565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83698BEAA2
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 19:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C6D2867D9
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 17:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A6416C6BF;
	Tue,  7 May 2024 17:35:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9305A165FDA
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715103330; cv=none; b=nd4+HWTg2Q1dHxVd7gHFTjgLUNwlSPgqvMB9FJ5G/pqhXOno3tJZ4HDuZZQ353DTqf+faB93PljHSvJqt4m+MH6XRz3TdimVZ0wRUKj28qzh0H+Pt39zFmljqUA7qdBfNBJn6eSwAJwjsSZIhPtLhAyyWusduo7rbmyEADyTSVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715103330; c=relaxed/simple;
	bh=R6+CIXvzD7onNjVoPlm/Avc0hn/fGIYtQFm64yzV7Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvzZVsJsxkqCmyHxsU120IOC1jFA83pf8YTWDBgKxOM327Jthptw2G9ufQ9JyY/Bms2SHQAA6Vb6eDwtWyRKgBVVwYFMu+End1j1CG82oL3TR74ihxC3tqocQMWlp8o+uuWtPtPHUoa5/2XvOkfBNWJe1couGvqgyuM22cdkaI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 929094 invoked by uid 1000); 7 May 2024 13:35:22 -0400
Date: Tue, 7 May 2024 13:35:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] WARNING in hid_output_report
Message-ID: <0f5a27f2-b949-4d15-906e-552b44557f61@rowland.harvard.edu>
References: <0000000000005e57b10617bc951f@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000005e57b10617bc951f@google.com>

On Sun, May 05, 2024 at 03:36:27PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    18daea77cca6 Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=159f1f17180000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d2f00edef461175
> dashboard link: https://syzkaller.appspot.com/bug?extid=5186630949e3c55f0799
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13deb917180000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1035ae87180000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/4614372cf68b/disk-18daea77.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e118db95ea43/vmlinux-18daea77.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/998cf091eeb5/bzImage-18daea77.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com
> 
> keytouch 0003:0926:3333.0001: implement() called with too large value 8 (n: 1)! (kworker/0:0)
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 7 at drivers/hid/hid-core.c:1451 implement drivers/hid/hid-core.c:1451 [inline]
> WARNING: CPU: 0 PID: 7 at drivers/hid/hid-core.c:1451 hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863

I suspect the WARN_ON(1) call in implement() should simply be removed.

It looks like the keytouch driver is trying to write 8 to a 1-bit field 
in an output report.  It probably doesn't verify the field sizes and 
just assumes the device is reasonable.

Alan Stern

