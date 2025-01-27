Return-Path: <linux-input+bounces-9586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEDA1DA05
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2025 16:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36AC5162033
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2025 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E268814E2E8;
	Mon, 27 Jan 2025 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lyjvegeF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F2D60B8A
	for <linux-input@vger.kernel.org>; Mon, 27 Jan 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737993558; cv=none; b=Qx14R7jYtq2mxZlmNNeRKJDrpV2cSh+5NRdRLaoFaw1cdREfA3QCHmhfeuaS7drHOmaCFARtoRCpo13I3nGDVUv1wGdxr1YENc7Neo+Iu3/VPiHbpbbgc7vu3ZU/27uQmIQ6H6fzoNpOtRcSUMbpSLKHqivE8OT1CLBzyN4k0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737993558; c=relaxed/simple;
	bh=KiZpbSe+YKq2dVtM9Hv+gkb12+2RcrmxiwO1F8vXcS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAOGKEvnbflPKOn8ykJnO3Qrdoto101vbadaZNyurJIpB1hHwmrlxyWzpq1gCGcX/vpoXeJKvOIJOAAk6Azv/H4zLMSQOSNEE6Ln922BVUXcWSYEwNbjRMYA7aXi9CZOubX/3mP6XnoXmCZ6SEDKxKREnmhQq2HuNtxz046rlFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lyjvegeF; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d92cd1e811so49140756d6.1
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2025 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737993556; x=1738598356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEc9c8A+QfAwPXoTPFk0q427bu8TxsL6y6XWG2ckD+4=;
        b=lyjvegeF/pM/Nhf5RDjqmyb4fAchyna87PXwKVGJm3lrNhP9KMSaWr4AecDEpyjf+K
         yyDAx3/VxUw04STWXTPtnwwJ/PyqCWx296AtqE8Wi2a7ovjWJJ8ggH+w3+R9xM3Am3hx
         vqI66lgAbZyi9cuX5YCbMusAT0mx3aUBA0FFf8iw4hLVoZ2h0G71lPwCikZRJv3aMved
         EjmEJtyORoqjv7L6NP1LS3vYA2kOzcQTrxcdAI3ahqG+8B+RgYwLirePmufk4BEn1JYr
         wcnbwA8JkNFZzEw17zH5/kRoWzQPNnF9r2+abKgN1QZarF/064BS36vkYTs3ApzTiE7g
         OSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737993556; x=1738598356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEc9c8A+QfAwPXoTPFk0q427bu8TxsL6y6XWG2ckD+4=;
        b=DuwbTfoLfwZk4W4x5iRHgUw5kW2LCc8Xk8jKhnmHBUahI2jab7IMvIfcXEvjSDiTWa
         zGn0pKp1dUlbphZdLI3GtQly+ddjZf5TONmQZGmeqoLO1MGFmWpC5VCgigcgEcOMyayG
         MD7ilwG8uATNgWNYr6hGK+0qra/bLtBnMM5+ndkIbSXsIhKDI/qkbmILuCV9ZT1VKQOO
         Z+6ALt6PP4TGjktCMFj0zfZAfCCv0d23YHXrIDfZeOki4SGvNtuCLDxaRELG4olGeFYM
         a9TFT1P1NygiU5uHNhKw7EJUe2/caY8zXAMESdFwNC9EWNV3Kn1xtP/AJMS5Tui/g6wa
         EkxA==
X-Forwarded-Encrypted: i=1; AJvYcCWmNqrVesrBDVi+nh5251RCybxbi7EliyLs0PDzXbpHdhHVZxjoxXVfzFh8kFoiYzvKWb+Moi14QxEb2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3a6odceMpdfbEDfrKCrEXnvuNZr5GOpF/NbmavPu1OuJiW4y
	pSPK1SaO1NS9fd3E5Y1wLS4zGXEOUQCDR9Je0yfbIE8gNWfaqy276blvTf0XgQ==
X-Gm-Gg: ASbGncuZ5GNcAPVBkmso7AExJWkH1T5Zs1wVv+8LcuyU6EmhX1axXxOy9E5yi/b2vCO
	pIq9kUyiRlJoeWHKCjXXhhQAivOn6jc5kkn/QrFErwuEKGE8ZM5WyHTHxb7cfyBkOzSbUYobb1z
	n+D6aFVJsvJQcwhjbGNC6PM/kHZFUJcNxY2GzXfQH4MuoXt0beSCeCX4b55dmY217VAG4uz2mUq
	cE1mPVi4DATswU6Yqk8FX3sL0FvRGm8DKRb+tglYM3g1hZWsn2+dk0B57/ygyGBSuO7P+WEqFoq
	WdHjMI5Yj2kEYxzhN+hoF6s=
X-Google-Smtp-Source: AGHT+IHfNmKPV5UeHojXIwHd4RsLYy0KAUidQvsHi84UnE3xrAaBh3HiFV5nZx+d7JLw1W8STgZ/DA==
X-Received: by 2002:a05:6214:29c2:b0:6d4:1613:be3e with SMTP id 6a1803df08f44-6e20627c995mr231273476d6.22.1737993555613;
        Mon, 27 Jan 2025 07:59:15 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2051362b1sm35720756d6.19.2025.01.27.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 07:59:15 -0800 (PST)
Date: Mon, 27 Jan 2025 10:59:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com>,
	Karol Przybylski <karprzy7@gmail.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-input@vger.kernel.org
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Read in
 usb_check_int_endpoints
Message-ID: <bc2fb22a-f759-4664-b06c-4c30a535419a@rowland.harvard.edu>
References: <6797072e.050a0220.2eae65.003f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6797072e.050a0220.2eae65.003f.GAE@google.com>

On Sun, Jan 26, 2025 at 08:10:22PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    21266b8df522 Merge tag 'AT_EXECVE_CHECK-v6.14-rc1' of git:..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14bd9c24580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f9e008bfc27b14db
> dashboard link: https://syzkaller.appspot.com/bug?extid=9c9179ac46169c56c1ad
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5249b29d55f2/disk-21266b8d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/8413507597a1/vmlinux-21266b8d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9c84998b8cfb/bzImage-21266b8d.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com
> 
> hid-thrustmaster 0003:044F:B65D.0004: hidraw0: USB HID v0.00 Device [HID 044f:b65d] on usb-dummy_hcd.2-1/input0
> ==================================================================
> BUG: KASAN: stack-out-of-bounds in usb_check_int_endpoints+0x1fe/0x280 drivers/usb/core/usb.c:277
> Read of size 1 at addr ffffc9000213e831 by task kworker/1:1/80
> 
> CPU: 1 UID: 0 PID: 80 Comm: kworker/1:1 Not tainted 6.13.0-syzkaller-04858-g21266b8df522 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x169/0x550 mm/kasan/report.c:489
>  kasan_report+0x143/0x180 mm/kasan/report.c:602
>  usb_check_int_endpoints+0x1fe/0x280 drivers/usb/core/usb.c:277
>  thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:176 [inline]
>  thrustmaster_probe+0x47d/0xcb0 drivers/hid/hid-thrustmaster.c:347

Karol:

Your commit 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in 
thrustmaster_probe by adding endpoint check") does this:

+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+
+	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		hid_err(hdev, "Unexpected non-int endpoint\n");
+		return;
+	}

usb_check_int_endpoints() expects its second argument to be a 
0-terminated byte array (see the kerneldoc).  Lack of the terminating 0 
is what caused the syzbot error reported above.

Also, usb_check_int_endpoints() is meant to be used by drivers in which 
the endpoint number is a compile-time constant.  It's not appropriate 
here.  You should have written the test as:

	if (!usb_endpoint_is_int_out(&ep->desc)) {

Alternatively, you could have called usb_find_common_endpoints().

Would you like to submit a patch to fix this error?

Alan Stern

