Return-Path: <linux-input+bounces-7818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19319B8352
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 20:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6EFAB22AEF
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 19:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB61CB331;
	Thu, 31 Oct 2024 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sN8VEMR4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109451C9DD5
	for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730402704; cv=none; b=TMy/AWwyDZgamAFS+lC/8lc3r8dMekG6cy8qjLpCYvv9mOSgAJGr8V5xazaussAjSmnd8bcT0jVSpHFDg99bxG8eZz7bqMYA1zC3WhSMHwvQjJFgfbuFMDRu8i6Qs3cyg0SkWPXMjVE1X4hPcV6ncMaRNiJHZanq84pg34lA+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730402704; c=relaxed/simple;
	bh=rGuTVD1KWxFW/iVXJuMMGl1bde0QDjUWD3zqWMNpPpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezeu61c1gJloK3nLtbMFMNDZUMQ2XrAJSxtZYSHPvScdCPAQZKO+7qNq5VY4pW1borvd4MQhh8TQsXHopb7oBHTRIjCuEtQyQoeq35Vi1yEp0YaFzceD6IfTzbO48Fo+vi4WdkFcfo4qrkgR3WeMv6E6Z/FWcNNQTt71wINDorI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sN8VEMR4; arc=none smtp.client-ip=209.85.161.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-5ebc349204cso685428eaf.3
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730402701; x=1731007501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uhUAE7CiIIKadT6/yqK22wb65HeoOWbYs2QkpH1TFEc=;
        b=sN8VEMR417Sv2zxZVGodu5zpEft0CyrmVipctCPnfdFVkp4Mqx0L3F3o7bUmk5fco1
         i239eIOpNudzF4SqjzOmgEaRjv2rNlvl0kfX3WsCBy3aGi9rg3tDXCRb/cnreUZpeqOX
         l67u1aZ8tla0zgcWYzaxv7XL/UMskka9Wc9JwSj/JE/zlbAQ4O3iS7wRr8rNryRe2h1d
         tYfVkt94uWjRz+cd+9zCcJhGFcvUg/jcp1Vc4dj/l+BL+BByZrKgtLXYhHL9BA2iwonO
         /VrzSbimBPbz4lc5M1mMLGp+gfkqGHIxtcsuMCbRiXcoy04C05lEManarmsLeiLnZtpq
         6/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730402701; x=1731007501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhUAE7CiIIKadT6/yqK22wb65HeoOWbYs2QkpH1TFEc=;
        b=v2WnSNdAGQvPH44IKMc4Zo7yWZzIkoTKhXuhqW+MU3gH4+c5ZDl4V1jtpA///Gr+IS
         +7F5fgpMsnfouCNRpmHVd/byeDgHntr2wKmS05ki27hZfMnSc4iluUt8XVRIePbyfYGq
         Fy1lG10uvDiF1OJWUB95FMDB6+ivnBlAmTv37dQ2jcWAIDAfxbqHc53aURXX+q1P5CTh
         5Drl80NKhkROK5DpN2S6Mzc4qRNn998nHrffXp1u2xD76BtuRmytTTGSDWW+YE74Mw9K
         6oieK0iJMniy5SQa4pBtC6546cB20+GKAqfxyBeXTagcTqD4ZvDL41Hz527qrBH6hmh9
         73fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU65Irfopt2gcI+AkSS+nsnjtcn4YmCz0NgOPjsfHN0zHoabGb3DmikelpPriXpAwFwLk/+g7jJmtk10g==@vger.kernel.org
X-Gm-Message-State: AOJu0YykfRoYJhpcK/ksYOPzXUEPJCrnafNyXC32jwWwEzXVxVKvH9i+
	NqP6CvUoRf/ruZVagUbgwLvXop4V59uxQ/cJmeWH0T2bHOggVK0P/BIbCosBBhDfTI8ExMeZqkQ
	+ffF3
X-Google-Smtp-Source: AGHT+IE4RL0Dif6O3Ry2HBvWKw4OdWKQa4QtWRA9GyvNzx3ILrwjuqWLN3eWXUD22moyPASJ4KXWIQ==
X-Received: by 2002:a05:6358:9817:b0:1c2:fcd0:d20a with SMTP id e5c5f4694b2df-1c5f9a4b3bcmr97124455d.25.1730402701046;
        Thu, 31 Oct 2024 12:25:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1d6sm10958586d6.76.2024.10.31.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:25:00 -0700 (PDT)
Date: Thu, 31 Oct 2024 15:24:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>,
	akpm@linux-foundation.org, jannh@google.com,
	liam.howlett@oracle.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	vbabka@suse.cz
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk
 (2)
Message-ID: <c963fa8b-7892-4528-8ab7-a8a3a080afb7@rowland.harvard.edu>
References: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
 <6723b31e.050a0220.35b515.0165.GAE@google.com>
 <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>

On Thu, Oct 31, 2024 at 04:58:29PM +0000, Lorenzo Stoakes wrote:
> +Alan re: USB stalls
> 
> On Thu, Oct 31, 2024 at 09:41:02AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >
> > Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         cffcc47b mm/mlock: set the correct prev on failure
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1304a630580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=6648774f7c39d413
> > dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
> > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> >
> > Note: no patches were applied.
> > Note: testing is done by a robot and is best-effort only.
> 
> OK this seems likely to be intermittant (and unrelated to what's in
> mm-unstable-fixes honestly) and does make me wonder if the fix referenced
> in [0] really has sorted things out? Or whether it has perhaps help
> mitigate the issue but not sufficiently in conjunction with debug things
> that slow things down.

This looks very different from the issues that were addressed by the fix 
I mentioned in [0].  In particular, the log traces for this series of 
bug reports all start with something like this:

 serial_out drivers/tty/serial/8250/8250.h:142 [inline]
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3322 [inline]
 serial8250_console_write+0xf9e/0x17c0 drivers/tty/serial/8250/8250_port.c:3393
 console_emit_next_record kernel/printk/printk.c:3092 [inline]
 console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
 __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
 _printk+0xc8/0x100 kernel/printk/printk.c:2432
 printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]

indicating that perhaps the problem is related to the 8250 driver.  Or 
perhaps that driver just happens to wait for long periods and so is more 
likely to show up when the real problem occurs.

By contrast, the log traces for the [0] bug reports all show something 
like this:

 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 usb_kill_urb.part.0+0x1ca/0x250 drivers/usb/core/urb.c:713
 usb_kill_urb+0x83/0xa0 drivers/usb/core/urb.c:702
 usb_start_wait_urb+0x255/0x4c0 drivers/usb/core/message.c:65
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x327/0x4b0 drivers/usb/core/message.c:154

because that bug involved usb_kill_urb() waiting indefinitely for an 
event that never happens.

Alan Stern

> [0]:https://lore.kernel.org/all/967f3aa0-447a-4121-b80b-299c926a33f5@rowland.harvard.edu/

