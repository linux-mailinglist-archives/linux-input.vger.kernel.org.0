Return-Path: <linux-input+bounces-13126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFAAEB551
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 12:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2194517F34A
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 10:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009922609F0;
	Fri, 27 Jun 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I56FFDrG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE271DDC1E;
	Fri, 27 Jun 2025 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021374; cv=none; b=H4DvfH0EFOdN2Vo98yAozxbh9wKHaT3fyZBOlaUtot6l0r0nfIRWbZYly1aFeYOtJMPAVZd9OHN925TE7hc6EpFZRAKyataUcGUMQS7V+A+Q3/ZO+Wx+KmXjrOGw4Bvh2zGd4bFTuoE+Y6Bq70q1Ud7iA4e1iOYK27V/kGPumDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021374; c=relaxed/simple;
	bh=sk54/sA42u9F/YCJlZI6YOrjXzJO80244uRlHpMQIgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjNGt2hNxG/xE5asgcbc771s4Plpf26vU9UWduvCfSZNbHrpZHfOjIuYv9kowXxMgvnYy8mM9NCb+6MID98Lg9krLMJoQHi8A95R/llOFli/lkwHAcwPc0mG6vz7dXx/NqPMBnf4+KMp4/JzslySv/77gyw0sKRXX34bB1dhLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I56FFDrG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453647147c6so22176335e9.2;
        Fri, 27 Jun 2025 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021371; x=1751626171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgT/GDBpY98J1rn4y63rCnTUDG5J/s3VU13Cjs2CFNE=;
        b=I56FFDrGRUB5dQjAKzIfmoUY/V9yK4xqc+B4ah8z8h/XF0RMXtV9enXSnGFR1N4C1A
         nL8+uYGRo1EGv1TfsIIPoLSJfKfeL8C+so0/SUhwHHpFbi39OwKw9k+a8G95efX8E3Bj
         cpwCqidmjfTI0TUAkJzPMAeHSCgfW9QRK/EGe90/KFkZkdGT9+YQbFlYts7nVH2LBACW
         zUImySQprXouD0CW0CtcurWvOiGMdjY6J9YphIpsfw6yWdU5ZPj0SHN7sTwGmsv80csm
         2o+DQ0r6Uygo7cwMhg/l1aP1q4uSseG8R8G0czB62SPo8hmplpvB1Q9MSdJdVA+E3wDb
         BPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021371; x=1751626171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgT/GDBpY98J1rn4y63rCnTUDG5J/s3VU13Cjs2CFNE=;
        b=Sfbrgkre8+KLFiG/etqjab+/h2Yy++zzWg6wEhDpuQ9tSRTtyVvLpoFha+5YiYoOpY
         TuhxXLQ5sKeEsfpr6TSfSqlIRo1EAsIP9NumyfXctJB8Ta5e3MhWko0s6MTlDzDrWwU4
         j6F4o93fgfXnTDiHsGBtIw8IiIZ8blwoARdRJhXzDHUTQIshUZFUvDxxB6aczQ+CINxK
         QUbuHRW+bPwhJL1Kdi+ajcyahhSsBYoMoQccv0EefEgZJDQONioSl0VJqLcLmBnnciX+
         pOjbR9ed7v7xphvEIYYR9IFb5DOKFVU86ofkioOH8KP343pPQEslwfgXX7Hy0p9eIQaE
         qdYg==
X-Forwarded-Encrypted: i=1; AJvYcCU/9DUFzW2MCe7Ik5uj6km8TncdCJZJQFt320r4g9jJZA99UstDv+fewXCLbs8nnnXwa725nJpKcAOBxgi+@vger.kernel.org, AJvYcCUtVRSSnU93sHqiW+FlH9pQZ0JJusDPpcHHCIqGm1tjbdFdhYNDe31skreYIW0Jf3ApZDIrcWJX@vger.kernel.org, AJvYcCWGh2XBDVxQpmyy6xTWc8+3fj03M9CzHV2I8cSqYCjgOXbk6Rbo2NzOhGmQ/QeldzH0bA/DypqWCxBR5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YydF7SDKHKQVUJ47am/xgMLMn07G29/WS6WJ0rnZQmF2ERqLDNl
	vS4xFLcuETCNDB3bN6Db9r3u9P/AC6GBpQJiyQa7khIbYYqYtOiJK2Xk
X-Gm-Gg: ASbGnctwnstkgTQf/M9jCRA3ebQCqDDXX0Ag+FoyKBVG/+wLseoKo5MZLs7Dc3h/UzN
	zHyqgOs+WmB77KTFC5R86U++yDuANcL0qPcDnTi75W+RzrVdjoGOcSPQ18hr4yMgSsBB3U04kpR
	KcqIhN1SCq+N+dlbULnOsgE8j8aUFhfsZClcIL6uEGTM0h8GXy5NWWFEJ4T5WyAwiB2NaWztWpc
	5u7RjGmFhLN7pnhQ7BU85gqMciWf8lDwRGfeEm0O1vJwIGHQ2eqiAfMmoiuyR1tAm1uno/VJnNE
	Pr4eTpZHk0EM9E7dqphg8HBGZE7YbGnqsspYRRfE/W9I4r/3bznydS6kqf8=
X-Google-Smtp-Source: AGHT+IGKrNbbMFTqFS1Ex71dCjzRAjzHxWNNFsfrGaFZ8p7dchEFrrEqWtf3R7zmGFUo7817v3ILXA==
X-Received: by 2002:a5d:4403:0:b0:3a5:1222:ac64 with SMTP id ffacd0b85a97d-3a9176038bbmr2301932f8f.38.1751021370899;
        Fri, 27 Jun 2025 03:49:30 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:e68e:2662:b817:f55e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013b3sm2371641f8f.39.2025.06.27.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:49:30 -0700 (PDT)
Date: Fri, 27 Jun 2025 11:49:23 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: appletb-kbd: fix memory corruption of
 input_handler_list
Message-ID: <aF53MxB_2QzDOq-B@gmail.com>
References: <20250626224711.13980-1-qasdev00@gmail.com>
 <PN3PR01MB9597EFD23199A2F2C7142801B845A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597EFD23199A2F2C7142801B845A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Fri, Jun 27, 2025 at 10:57:12AM +0530, Aditya Garg wrote:
> 
> 
> On 27-06-2025 04:17 am, Qasim Ijaz wrote:
> > In appletb_kbd_probe an input handler is initialised and then registered
> > with input core through input_register_handler(). When this happens input
> > core will add the input handler (specifically its node) to the global
> > input_handler_list. The input_handler_list is central to the functionality
> > of input core and is traversed in various places in input core. An example
> > of this is when a new input device is plugged in and gets registered with
> > input core.
> > 
> > The input_handler in probe is allocated as device managed memory. If a
> > probe failure occurs after input_register_handler() the input_handler
> > memory is freed, yet it will remain in the input_handler_list. This
> > effectively means the input_handler_list contains a dangling pointer
> > to data belonging to a freed input handler.
> > 
> > This causes an issue when any other input device is plugged in - in my
> > case I had an old PixArt HP USB optical mouse and I decided to
> > plug it in after a failure occurred after input_register_handler().
> > This lead to the registration of this input device via
> > input_register_device which involves traversing over every handler
> > in the corrupted input_handler_list and calling input_attach_handler(),
> > giving each handler a chance to bind to newly registered device.
> > 
> > The core of this bug is a UAF which causes memory corruption of
> > input_handler_list and to fix it we must ensure the input handler is
> > unregistered from input core, this is done through
> > input_unregister_handler().
> > 
> > [   63.191597] ==================================================================
> > [   63.192094] BUG: KASAN: slab-use-after-free in input_attach_handler.isra.0+0x1a9/0x1e0
> > [   63.192094] Read of size 8 at addr ffff888105ea7c80 by task kworker/0:2/54
> > [   63.192094] 
> > [   63.192094] CPU: 0 UID: 0 PID: 54 Comm: kworker/0:2 Not tainted 6.16.0-rc2-00321-g2aa6621d 
> > [   63.192094] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.164
> > [   63.192094] Workqueue: usb_hub_wq hub_event
> > [   63.192094] Call Trace:
> > [   63.192094]  <TASK>
> > [   63.192094]  dump_stack_lvl+0x53/0x70
> > [   63.192094]  print_report+0xce/0x670
> > [   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
> > [   63.192094]  kasan_report+0xce/0x100
> > [   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
> > [   63.192094]  input_attach_handler.isra.0+0x1a9/0x1e0
> > [   63.192094]  input_register_device+0x76c/0xd00
> > [   63.192094]  hidinput_connect+0x686d/0xad60
> > [   63.192094]  ? __pfx_hidinput_connect+0x10/0x10
> > [   63.192094]  ? xhci_urb_enqueue+0x523/0x930
> > [   63.192094]  hid_connect+0xf20/0x1b10
> > [   63.192094]  ? mutex_unlock+0x7d/0xd0
> > [   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
> > [   63.192094]  ? __pm_runtime_idle+0x95/0x1c0
> > [   63.192094]  ? __pfx_hid_connect+0x10/0x10
> > [   63.192094]  hid_hw_start+0x83/0x100
> > [   63.192094]  hid_device_probe+0x2d1/0x680
> > [   63.192094]  really_probe+0x1c3/0x690
> > [   63.192094]  __driver_probe_device+0x247/0x300
> > [   63.192094]  driver_probe_device+0x49/0x210
> > [   63.192094]  __device_attach_driver+0x160/0x320
> > [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> > [   63.192094]  bus_for_each_drv+0x10f/0x190
> > [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> > [   63.192094]  __device_attach+0x18e/0x370
> > [   63.192094]  ? __pfx___device_attach+0x10/0x10
> > [   63.192094]  ? kobject_get+0x50/0xe0
> > [   63.192094]  bus_probe_device+0x123/0x170
> > [   63.192094]  device_add+0xd4d/0x1460
> > [   63.192094]  ? __pfx_device_add+0x10/0x10
> > [   63.192094]  ? up_write+0x4d/0x90
> > [   63.192094]  ? __debugfs_create_file+0x377/0x5a0
> > [   63.192094]  hid_add_device+0x30b/0x910
> > [   63.192094]  ? __pfx_hid_add_device+0x10/0x10
> > [   63.192094]  usbhid_probe+0x920/0xe00
> > [   63.192094]  ? pm_runtime_enable+0xfa/0x2a0
> > [   63.192094]  usb_probe_interface+0x363/0x9a0
> > [   63.192094]  ? sysfs_do_create_link_sd+0x89/0x100
> > [   63.192094]  really_probe+0x1c3/0x690
> > [   63.192094]  __driver_probe_device+0x247/0x300
> > [   63.192094]  driver_probe_device+0x49/0x210
> > [   63.192094]  __device_attach_driver+0x160/0x320
> > [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> > [   63.192094]  bus_for_each_drv+0x10f/0x190
> > [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> > [   63.192094]  __device_attach+0x18e/0x370
> > [   63.192094]  ? __pfx___device_attach+0x10/0x10
> > [   63.192094]  ? kobject_get+0x50/0xe0
> > [   63.192094]  bus_probe_device+0x123/0x170
> > [   63.192094]  device_add+0xd4d/0x1460
> > [   63.192094]  ? __pfx_device_add+0x10/0x10
> > [   63.192094]  ? mutex_unlock+0x7d/0xd0
> > [   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
> > [   63.192094]  usb_set_configuration+0xd14/0x1880
> > [   63.192094]  usb_generic_driver_probe+0x78/0xb0
> > [   63.192094]  usb_probe_device+0xaa/0x2e0
> > [   63.192094]  really_probe+0x1c3/0x690
> > [   63.192094]  __driver_probe_device+0x247/0x300
> > [   63.192094]  ? usb_generic_driver_match+0x58/0x80
> > [   63.192094]  driver_probe_device+0x49/0x210
> > [   63.192094]  __device_attach_driver+0x160/0x320
> > [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> > [   63.192094]  bus_for_each_drv+0x10f/0x190
> > [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> > [   63.192094]  __device_attach+0x18e/0x370
> > [   63.192094]  ? __pfx___device_attach+0x10/0x10
> > [   63.192094]  ? kobject_get+0x50/0xe0
> > [   63.192094]  bus_probe_device+0x123/0x170
> > [   63.192094]  device_add+0xd4d/0x1460
> > [   63.192094]  ? __pfx_device_add+0x10/0x10
> > [   63.192094]  ? add_device_randomness+0xb2/0xe0
> > [   63.192094]  usb_new_device+0x7b4/0x1000
> > [   63.192094]  hub_event+0x234d/0x3fa0
> > [   63.192094]  ? __pfx_hub_event+0x10/0x10
> > [   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
> > [   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
> > [   63.192094]  ? mutex_unlock+0x7d/0xd0
> > [   63.192094]  ? _raw_spin_lock_irq+0x80/0xe0
> > [   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> > [   63.192094]  ? __pm_runtime_suspend+0x74/0x1c0
> > [   63.192094]  process_one_work+0x5bf/0xfe0
> > [   63.192094]  worker_thread+0x777/0x13a0
> > [   63.192094]  ? __kthread_parkme+0x99/0x180
> > [   63.192094]  ? __pfx_worker_thread+0x10/0x10
> > [   63.192094]  kthread+0x327/0x630
> > [   63.192094]  ? __pfx_kthread+0x10/0x10
> > [   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> > [   63.192094]  ? __pfx_kthread+0x10/0x10
> > [   63.192094]  ? __pfx_kthread+0x10/0x10
> > [   63.192094]  ret_from_fork+0xff/0x1a0
> > [   63.192094]  ? __pfx_kthread+0x10/0x10
> > [   63.192094]  ret_from_fork_asm+0x1a/0x30
> > [   63.192094]  </TASK>
> > [   63.192094] 
> > [   63.192094] Allocated by task 54:
> > [   63.192094]  kasan_save_stack+0x33/0x60
> > [   63.192094]  kasan_save_track+0x14/0x30
> > [   63.192094]  __kasan_kmalloc+0x8f/0xa0
> > [   63.192094]  __kmalloc_node_track_caller_noprof+0x195/0x420
> > [   63.192094]  devm_kmalloc+0x74/0x1e0
> > [   63.192094]  appletb_kbd_probe+0x39/0x440
> > [   63.192094]  hid_device_probe+0x2d1/0x680
> > [   63.192094]  really_probe+0x1c3/0x690
> > [   63.192094]  __driver_probe_device+0x247/0x300
> > [   63.192094]  driver_probe_device+0x49/0x210
> > [   63.192094]  __device_attach_driver+0x160/0x320
> > [...]
> > [   63.192094] 
> > [   63.192094] Freed by task 54:
> > [   63.192094]  kasan_save_stack+0x33/0x60
> > [   63.192094]  kasan_save_track+0x14/0x30
> > [   63.192094]  kasan_save_free_info+0x3b/0x60
> > [   63.192094]  __kasan_slab_free+0x37/0x50
> > [   63.192094]  kfree+0xcf/0x360
> > [   63.192094]  devres_release_group+0x1f8/0x3c0
> > [   63.192094]  hid_device_probe+0x315/0x680
> > [   63.192094]  really_probe+0x1c3/0x690
> > [   63.192094]  __driver_probe_device+0x247/0x300
> > [   63.192094]  driver_probe_device+0x49/0x210
> > [   63.192094]  __device_attach_driver+0x160/0x320
> > [...]
> > 
> > Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
> 
> The handler was introduced in 7d62ba8deacf ("HID: hid-appletb-kbd: add support for fn toggle between media and function mode")
>
Ah yea good spot, will fix this in v2.

Thanks,
Qasim
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> >  drivers/hid/hid-appletb-kbd.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
> > index d11c49665147..271d1b27b8dd 100644
> > --- a/drivers/hid/hid-appletb-kbd.c
> > +++ b/drivers/hid/hid-appletb-kbd.c
> > @@ -430,13 +430,15 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
> >  	ret = appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
> >  	if (ret) {
> >  		dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
> > -		goto close_hw;
> > +		goto unregister_handler;
> >  	}
> >  
> >  	hid_set_drvdata(hdev, kbd);
> >  
> >  	return 0;
> >  
> > +unregister_handler:
> > +	input_unregister_handler(&kbd->inp_handler);
> >  close_hw:
> >  	if (kbd->backlight_dev) {
> >  		put_device(&kbd->backlight_dev->dev);
> 
> This makes sense. With the "Fixes:" corrected in commit message,
> 
> Reviewed-by: Aditya Garg <gargaditya08@live.com>
> 

