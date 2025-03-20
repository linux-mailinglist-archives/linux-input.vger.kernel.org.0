Return-Path: <linux-input+bounces-11018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF549A6A76E
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 14:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F3F483789
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 13:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED08521CA0E;
	Thu, 20 Mar 2025 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tsNeL4sU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2EF21A443;
	Thu, 20 Mar 2025 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478107; cv=none; b=rl7F7iVC/ZGRIBlv8SDZT/Xfkl8iBaOhwmwSuHHOwWhhfVAOiP9qaguQqdTNOIdnHOGCNBwKzNjkgpDYBDwyavlO8BP8xiIQ/hb/a5jSnZSxVqpEYz8PlgRguePfBy8zN1uU4CfPfyGP7nI+kUfdSr8yPheU3exIghfKnD8J03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478107; c=relaxed/simple;
	bh=eauB5skVdP4C4/rnUi2ElCLdS0o2jOjhliPks4TrjIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC9lPkCHh4CbwjoNVWkqJBFzIcnwiFIxFvPNXYuDWYaOLT09IwGxwxOjyFB8IobDM6GN2ZVT13CeTRbqgVBifxxLyEDWV8bN59H7r7fqmP1THz5wxUy1IW/q9Yjt7Pi4nkFt93RxIhGf7m1gYREVaj6Xf9IooSGFvMfYOOsuu2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tsNeL4sU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E267C4CEDD;
	Thu, 20 Mar 2025 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742478107;
	bh=eauB5skVdP4C4/rnUi2ElCLdS0o2jOjhliPks4TrjIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsNeL4sUQZu+60+LkdEI3Kq21K1vMxJOUn01khcoISW2qgr12YLbAKSEcdDbUR8Cy
	 SjsuiLIGUVihyEALK9s4tzjKH6wGmgO4csB8yHQLHv/YDvUjsNkC0ccR4IDkGVHci+
	 01tkd+HUlnuw/b7wlEYV2fbu3xX7ucbXyGMwalfU=
Date: Thu, 20 Mar 2025 06:40:27 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
Message-ID: <2025032045-certified-pennant-2291@gregkh>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>

On Thu, Mar 20, 2025 at 12:39:24PM +0800, 白烁冉 wrote:
> Dear Maintainers,
> 
> When using our customized Syzkaller to fuzz the latest Linux kernel, the following crash (94th)was triggered.
> 
> 
> HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
> git tree: upstream
> Output:https://github.com/pghk13/Kernel-Bug/tree/main/0305_6.14rc5/94-INFO_%20rcu%20detected%20stall%20in%20dcache_dir_open
> Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0305_6.14rc5/config.txt
> C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0305_6.14rc5/94-INFO_%20rcu%20detected%20stall%20in%20dcache_dir_open/94repro.c
> Syzlang reproducer: https://github.com/pghk13/Kernel-Bug/blob/main/0305_6.14rc5/94-INFO_%20rcu%20detected%20stall%20in%20dcache_dir_open/94report
> 
> 
> The error occurs around line 379 of the urb.c file. The problem ends up in the cm109_urb_irq_callback function in the cm109.c file:In the cm109_urb_irq_callback function, the driver attempts to resubmit a URB that has not yet been processed. There may be a race condition in the driver that resubmits the URB in the URB completion callback, but the same URB may have already been committed to another location in the system. This issue seems to involve the creation of USB devices, the operation of TTY devices, and file descriptor copying. This complex interaction resulted in duplicate commits of the URB.
> We have reproduced this issue several times on 6.14-rc5 again.

Great!  Can you submit a fix for this as you have a reproducer you can
use to prove that it resolves the issue?

thanks,

greg k-h

