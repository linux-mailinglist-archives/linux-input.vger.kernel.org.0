Return-Path: <linux-input+bounces-9501-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E8A1B180
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 09:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31A0F188A006
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 08:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADBA218AA2;
	Fri, 24 Jan 2025 08:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rpBFKDIB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DAB14A0A3;
	Fri, 24 Jan 2025 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706684; cv=none; b=JyqiaBppaaEEzpdDyJ+GWRPUJramhUyklMsPkUdCxDtEtXWt5TQiSxve+x1WNJ94zxuUp56qDSriV06A/Xfpffn33l/5yh31ixV2RURXDRUWzHRcz23hjdAFiBdYqCSDpjoIiK0A8Oig4/x3ldL41QqOX6Q6AJhAgQxwQ+vZ4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706684; c=relaxed/simple;
	bh=iWfiitNVzcylV3xWbBii5RBIe9brMghrSx4suq54Snc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdEEo4mRg9RfyYew5pOcTX/0LZHs++kuVoBvr0dhhNcH4/mjTEevdYMXm5sFqPXQcOJZbzlIGVhU4IXTMIdQ/AudevKlodl8ECHqtshf818hD6/DwP0wilnJD8CFRNdAqsqbfg7Fu054P2sP95ne5bm0FuePDQWiYsjsRb978tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rpBFKDIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB23C4CED2;
	Fri, 24 Jan 2025 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737706683;
	bh=iWfiitNVzcylV3xWbBii5RBIe9brMghrSx4suq54Snc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpBFKDIBTx5mJaioFoLa/458s1jOZCuJahO9pq+YQVic7KnSKudtFJI7TYWEdlSEj
	 NWtNGkMJMLFrokReAyDp0IhWVXqes6kBJ72in3yUueKW9YJGP71WHRLNZ8B5aF52FW
	 KeWAuFIL7Ng6vLEcQClMNp/3z+GbNmSKrU9f3wUM=
Date: Fri, 24 Jan 2025 09:18:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com,
	bentiss@kernel.org, jikos@kernel.org, jkosina@suse.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rafael@kernel.org,
	stuart.a.hayhurst@gmail.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: corsair-void: cancel delayed status work if device
 removed
Message-ID: <2025012452-deceiving-ladybug-77ab@gregkh>
References: <67923cb2.050a0220.2eae65.0006.GAE@google.com>
 <20250124080915.419680-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124080915.419680-1-lizhi.xu@windriver.com>

On Fri, Jan 24, 2025 at 04:09:15PM +0800, Lizhi Xu wrote:
> syzbot reported a WARNING: ODEBUG bug in devres_release_group. [1]
> 
> Missing a cancel delayed work for the "delayed_status_work" in
> corsair_void_remove.
> 
> [1]
> ODEBUG: free active (active state 0) object: ffff8880286e09a8 object type: timer_list hint: corsair_void_status_work_handler+0x0/0x190
> WARNING: CPU: 1 PID: 5847 at lib/debugobjects.c:615 debug_print_object+0x17a/0x1f0 lib/debugobjects.c:612
> Modules linked in:
> CPU: 1 UID: 0 PID: 5847 Comm: kworker/1:4 Not tainted 6.13.0-syzkaller-02526-gc4b9570cfb63 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:debug_print_object+0x17a/0x1f0 lib/debugobjects.c:612
> Code: e8 4b 10 38 fd 4c 8b 0b 48 c7 c7 40 1e 60 8c 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f8 ff 34 24 e8 bb 3e 92 fc 48 83 c4 08 90 <0f> 0b 90 90 ff 05 28 de 4c 0b 48 83 c4 10 5b 41 5c 41 5d 41 5e 41
> RSP: 0018:ffffc90003e3eeb8 EFLAGS: 00010286
> RAX: 3d29b0c77a543200 RBX: ffffffff8c0ca540 RCX: ffff88801213da00
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
> RBP: ffffffff8c601fc0 R08: ffffffff81603132 R09: fffffbfff1cfa638
> R10: dffffc0000000000 R11: fffffbfff1cfa638 R12: 0000000000000000
> R13: ffffffff8c601ed8 R14: dffffc0000000000 R15: ffff8880286e09a8
> FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fff5312cda0 CR3: 0000000034840000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
>  debug_check_no_obj_freed+0x45b/0x580 lib/debugobjects.c:1129
>  slab_free_hook mm/slub.c:2284 [inline]
>  slab_free mm/slub.c:4613 [inline]
>  kfree+0x115/0x430 mm/slub.c:4761
>  release_nodes drivers/base/devres.c:506 [inline]
>  devres_release_group+0x328/0x350 drivers/base/devres.c:689
>  hid_device_remove+0x250/0x370 drivers/hid/hid-core.c:2779
>  device_remove drivers/base/dd.c:567 [inline]
>  __device_release_driver drivers/base/dd.c:1273 [inline]
>  device_release_driver_internal+0x4a9/0x7c0 drivers/base/dd.c:1296
>  bus_remove_device+0x34f/0x420 drivers/base/bus.c:576
>  device_del+0x57a/0x9b0 drivers/base/core.c:3854
>  hid_remove_device drivers/hid/hid-core.c:2958 [inline]
>  hid_destroy_device+0x6a/0x1b0 drivers/hid/hid-core.c:2980
>  usbhid_disconnect+0x9e/0xc0 drivers/hid/usbhid/hid-core.c:1458
>  usb_unbind_interface+0x25b/0x940 drivers/usb/core/driver.c:458
>  device_remove drivers/base/dd.c:569 [inline]
>  __device_release_driver drivers/base/dd.c:1273 [inline]
>  device_release_driver_internal+0x503/0x7c0 drivers/base/dd.c:1296
>  bus_remove_device+0x34f/0x420 drivers/base/bus.c:576
>  device_del+0x57a/0x9b0 drivers/base/core.c:3854
>  usb_disable_device+0x3bf/0x850 drivers/usb/core/message.c:1418
>  usb_disconnect+0x340/0x950 drivers/usb/core/hub.c:2304
>  hub_port_connect drivers/usb/core/hub.c:5363 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
>  port_event drivers/usb/core/hub.c:5823 [inline]
>  hub_event+0x1ebc/0x5150 drivers/usb/core/hub.c:5905
>  process_one_work kernel/workqueue.c:3236 [inline]
>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3398
>  kthread+0x7a9/0x920 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
> Reported-by: syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  drivers/hid/hid-corsair-void.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
> index 6ece56b850fc..bd8f3d849b58 100644
> --- a/drivers/hid/hid-corsair-void.c
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -726,6 +726,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
>  	if (drvdata->battery)
>  		power_supply_unregister(drvdata->battery);
>  
> +	cancel_delayed_work_sync(&drvdata->delayed_status_work);
>  	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
>  	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
>  }
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

