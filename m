Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF4B2E081D
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 10:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgLVJ2N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Dec 2020 04:28:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:53896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgLVJ2M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Dec 2020 04:28:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75AB23103;
        Tue, 22 Dec 2020 09:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608629251;
        bh=AL3WCu4oxAUizuQBbDECTDABTXF1YXeQpLp1etTPTMI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=n/XeeGCs7Vk/VDA8Jsx6w+BzZFZBbVnd4J81VCU717D8sdKuemU28zmQ5DtS/t8l4
         2GXoNJmwHJIco5Yu1U7WFKUCsb3Ux5ieF4HJ2MKTa56VU3WGPFgt2HpkHkJIECYhOh
         cX08OhdtcoZ7JTA22N/7AXHXjsuBOYYXTpFovkx24THdFtu/HS8uzYyFKl5n/F3glF
         /DeRJWPRiAfwjXwmOc/Wp19o3YlneyG4a5CfcxrqCnwkX2xAgbwYOP7VHKsXs60+pF
         nIVCtoYc9G9pZTZ4xXmjubC3A+aBNHihoIvefJT2cGxVmus8FDSVyGTMnab9JQJJv0
         fqgDxPiKkHEuw==
Date:   Tue, 22 Dec 2020 10:27:28 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org,
        syzbot+5b49c9695968d7250a26@syzkaller.appspotmail.com,
        benjamin.tissoires@gmail.com, Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Fix memory leakage caused by kfifo_alloc
In-Reply-To: <20201210045230.26343-1-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.2012221027080.25826@cbobk.fhfr.pm>
References: <20201210045230.26343-1-ping.cheng@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 9 Dec 2020, Ping Cheng wrote:

> As reported by syzbot below, kfifo_alloc'd memory would not be freed
> if a non-zero return value is triggered in wacom_probe. This patch
> creates and uses devm_kfifo_alloc to allocate and free itself.
> 
> BUG: memory leak
> unreferenced object 0xffff88810dc44a00 (size 512):
>   comm "kworker/1:2", pid 3674, jiffies 4294943617 (age 14.100s)
>   hex dump (first 32 bytes):
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>    [<0000000023e1afac>] kmalloc_array include/linux/slab.h:592 [inline]
>    [<0000000023e1afac>] __kfifo_alloc+0xad/0x100 lib/kfifo.c:43
>    [<00000000c477f737>] wacom_probe+0x1a1/0x3b0 drivers/hid/wacom_sys.c:2727
>    [<00000000b3109aca>] hid_device_probe+0x16b/0x210 drivers/hid/hid-core.c:2281
>    [<00000000aff7c640>] really_probe+0x159/0x480 drivers/base/dd.c:554
>    [<00000000778d0bc3>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
>    [<000000005108dbb5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
>    [<00000000efb7c59e>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
>    [<0000000024ab1590>] __device_attach+0x122/0x250 drivers/base/dd.c:912
>    [<000000004c7ac048>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
>    [<00000000b93050a3>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
>    [<00000000e5b46ea5>] hid_add_device+0x151/0x390 drivers/hid/hid-core.c:2437
>    [<00000000c6add147>] usbhid_probe+0x412/0x560 drivers/hid/usbhid/hid-core.c:1407
>    [<00000000c33acdb4>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
>    [<00000000aff7c640>] really_probe+0x159/0x480 drivers/base/dd.c:554
>    [<00000000778d0bc3>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
>    [<000000005108dbb5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
> 
> https://syzkaller.appspot.com/bug?extid=5b49c9695968d7250a26
> 
> Reported-by: syzbot+5b49c9695968d7250a26@syzkaller.appspotmail.com
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Now queued in for-5.11/upstream-fixes, sorry for the delay. Thanks,


-- 
Jiri Kosina
SUSE Labs

