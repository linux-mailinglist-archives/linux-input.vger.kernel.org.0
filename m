Return-Path: <linux-input+bounces-13128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CDAEB55C
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 12:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472CB3A52A1
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9ACB2980A5;
	Fri, 27 Jun 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3RfjMH0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FE1DDC1E;
	Fri, 27 Jun 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021431; cv=none; b=aDSsUAPJuh2KjfvtWkq+TteWTb7ZYzeOHm1QVdYzqvQkBRsAAR+d9wWrcdabeR+vtKUJhipS3E/Bz01FZ10rXy3q2osR0TOGGQ8ViJl+0kiHpdxbJmdSDbknJdcNmzM7fDXvN0+zHlO6GljeaNwkPLNEoQJIcHCuqfaWJWMCENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021431; c=relaxed/simple;
	bh=9Aq8XbjkIgpNrrysZhYk5cPettPMi/uDN/rsldCuvqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sA0LVRfi6WZOu1LeJvpAho+4kAHhLdj7MLjGrkszZWAYUXpgDJY6yIyAFDOCYa7xsxb8ok125KdD3yOzRzIUUCRd1P3/sQnOH9rc9K8fRrfYuzzxqOHMJAxKEs/4ERW4RyXEEehMl3F8uqlpkiI6HSFIgdKEPshMY6myQ2qYIxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3RfjMH0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453647147c6so22186005e9.2;
        Fri, 27 Jun 2025 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021428; x=1751626228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1ZpjL0Lp6eU/A6zqN1msw2Q01683cOmW1BZ9ZHWO4Q=;
        b=Q3RfjMH0ds/0YvOX/iOK7gpTiV5jMvlq2gRUIuuxNSJwAYgKL3uylul97LbzKgIphE
         EpZv0t1CLsPhhD2uUnS7cIfHSLZhz+6zD1a0zkfzoqEDCF2d+oUTaY2U5PW0BAvkoM7G
         SdsygG7R2+mBm6bj+isoquCbAQg/kRBEG4IMISf/V/26Zveox6ApCrCfPUl2o6R1iTyB
         mPBP1exzv8SDt+Tqzio8mj1Uhw9vfrnmwTetLDDhdV7w8SlMsRxUzY1p28411aqjNK3A
         jE9CHQl752VDc2MFbsFbQmBAebzPUQ9KJ1jCc5P05Lk03Z2iV7+gz6yJMbK0TUnnpWIX
         hJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021428; x=1751626228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1ZpjL0Lp6eU/A6zqN1msw2Q01683cOmW1BZ9ZHWO4Q=;
        b=f/QlxaK56ILyKGWTi5+zagfzzV4kMPZxhgXWYtitoWe4MCSQ1t1/0cA+2EFlenuoF8
         aCaZacPTuBReJhDUxf5aVuVFNM85Em+tjyJHXbbw9flwmWVDr40Rv6bnKJBTP7K9rEJi
         C5i3eDRFVkKlOpU0zgUUEcQ41tSP4dCjlBFZr5jwSlF1jN8bvkOUxTIfBsva5xYP9A/r
         8uDELbQAwefuygJjkXHVTtbVEUbRLV8GN1MGC+v57HQy07Zhyh3Ye6oxKYqmQTuLd5VQ
         XfLTGG592Fly2sxLI1pPxcjgH2MH97fBhkMbLLMmMPVVWw2RJ+3QFVJiH+gbh0AAijQ9
         d4eA==
X-Forwarded-Encrypted: i=1; AJvYcCUYToKjllh7u4swe7PNcktbt2x7d7MPNXk+tpQn17S4SJo12KYSDMkR7yPZIugESwan/otbsyOR0A4K1w==@vger.kernel.org, AJvYcCWhUwTlOxQ6/W51lphBLDjSjd1588i8dA3e/HpkAnTN2Hojxplj5kamYZuEgQ1kBpg5C4hSuXOVceuA8Kkl@vger.kernel.org, AJvYcCXolBKpGaUrzmSNVsP/jmkqjA/+WcGbbeImD2gUmopdQtBwfDlzbWx8uxfxyLmwwOjrBypl+p90@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LRhZUMuRPrHhkGTMGR8+JK3t7Qe3yZ53s1D1Qj6zHUaNQurz
	YnBZb7pV58LdVLeO22oDQfox5SpZmRywizlCglCZcVQCR4zyZvJgOCXt4WM1tA==
X-Gm-Gg: ASbGncv4IoEOPnIYucPdkrTXBi/uCHpviGGl5cqjPa7BBseo70laOgEGDL4roeCswCK
	eVs7TeV5FjrrsYxcvjM6wC+9vS28knsWPJ6ypQ5f3F+icy89LmXRHLzew1Jm14J3HupoyCgjKts
	dAtQsxXt9ONj68dOjOEFK44tQqgTtgwNVGMv1Bym+eKzh+3m9ctkQpWu9wwFjktGp+sSkeQSRr1
	0cfOJ8CmObaM9NPKrAajm6zRjfogKvOw/baZlvjGlfg80N1eEQUhmvH8IZRF6HhHYYGAmavk+VX
	1WXJ2CvUsdXGQ4tr1ekL/WP/mGMxltrsF4ViHzMUtlMEPrY4hQtqy436CiI=
X-Google-Smtp-Source: AGHT+IHOZkIrGAHl6Mi1e4sLo4MZRABGHJviK0YyINGO9z9VGcaGw3D15JOJvEqyqru7MeACMEhs/A==
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4538ee55a30mr27347815e9.16.1751021428009;
        Fri, 27 Jun 2025 03:50:28 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:e68e:2662:b817:f55e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f2fec5fsm20795595e9.40.2025.06.27.03.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:50:27 -0700 (PDT)
Date: Fri, 27 Jun 2025 11:50:26 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, gargaditya08@live.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] HID: appletb-kbd: fix memory corruption of
 input_handler_list
Message-ID: <aF53cjGvnvT7RLsg@gmail.com>
References: <20250626224711.13980-1-qasdev00@gmail.com>
 <61aa98d3-9577-45cc-b464-7d7160f8b003@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61aa98d3-9577-45cc-b464-7d7160f8b003@kernel.org>

On Fri, Jun 27, 2025 at 07:33:04AM +0200, Jiri Slaby wrote:
> On 27. 06. 25, 0:47, Qasim Ijaz wrote:
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
> 
> If you are going to resend, could you prune that backtrace too? Like drop
> all '?' entries and everything after worker_thread.

good idea, will clean up the backtrace in v2.

Thanks,
Qasim
> 
> thanks,
> -- 
> js
> suse labs
> 

