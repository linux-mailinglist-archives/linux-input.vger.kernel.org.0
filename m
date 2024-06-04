Return-Path: <linux-input+bounces-4062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE28FAD44
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F211C21CB4
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320171420C8;
	Tue,  4 Jun 2024 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1W0rl+I"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAC13A876;
	Tue,  4 Jun 2024 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488939; cv=none; b=HKVi362+a+kfwFdXuk+INEYpDGGf1coSAWiOf7W1PIgt1mYe12ZPWaAaBn2q5ut7imXz/W4kE/Dcwx4/5ec8xFk9s/9sjtMXLPSphV0adG8dd/8BTa/O7Fnus9dNUfgRbDUA4pKyoQhCRSPkFa0IH5nvhbDozjCVRlISnDUgua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488939; c=relaxed/simple;
	bh=TzCDUb/3217QjH6pbXSRFhl3x/aLMjd5c64C2r/QBZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=chcUixtiUoDZ9neqHbpcCb+5ukFkXzxFgFMhMKo6iPFRrTGvnleVcKNPtL14/wD7VVd3fs8J04gRp/Rz2lWN33vhfo+Dgnj/Eq35q0POSPSH4Cm19x4lxZ3ANO6MdbDRm73xzQvVuCf9wcnkvZG34EAAAQqW2x8hdmMYMHhQbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1W0rl+I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C0FC2BBFC;
	Tue,  4 Jun 2024 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717488938;
	bh=TzCDUb/3217QjH6pbXSRFhl3x/aLMjd5c64C2r/QBZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G1W0rl+Iz2kEfVjpxX7pA3bbESGc3+m5vgaRu0maBEtWvPZ6GejCBKnC8ijZZfYNf
	 gg+OX4IqPaRL+N5YJJ8tCC/BEr7T5iO6hBjrGkR8Ok1U/ima3rMfuVcI9/GClATE7e
	 M4fLgtMaFOObMVfCG4GZm5qtcfP1nqNGcbC7oj9zD7skWuXRgMInEFlfnfK2iKusYB
	 QFvshVvbH/V9yNduUjMP22MYD/65ROV+8Z4ly0kVVtK2EtB8USfavEgurKrOgjkPNa
	 eJGFtsiPMlkUR6K9PA7PULBHjUZGvDguItLdibrFtVtZXoS/qPfjU7lC3Nt7U6CwBs
	 QbRt6MwBxCWLg==
Date: Tue, 4 Jun 2024 10:15:35 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
cc: Benjamin Tissoires <bentiss@kernel.org>, Kees Cook <keescook@chromium.org>, 
    linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
    syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, 
    syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
In-Reply-To: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
Message-ID: <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Nikita Zhandarovich wrote:

> Syzbot reports [1] a reemerging out-of-bounds bug regarding hid
> descriptors possibly having incorrect bNumDescriptors values in
> usbhid_parse().
> 
> Build on the previous fix in "HID: usbhid: fix out-of-bounds bug"
> and run a sanity-check ensuring that number of descriptors doesn't
> exceed the size of desc[] in struct hid_descriptor.
> 
> [1] Syzbot report:
> Link: https://syzkaller.appspot.com/bug?extid=c52569baf0c843f35495
> 
> UBSAN: array-index-out-of-bounds in drivers/hid/usbhid/hid-core.c:1024:7
> index 1 is out of range for type 'struct hid_class_descriptor[1]'
> CPU: 0 PID: 8 Comm: kworker/0:1 Not tainted 6.9.0-rc6-syzkaller-00290-gb9158815de52 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
>  ubsan_epilogue lib/ubsan.c:231 [inline]
>  __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
>  usbhid_parse+0x5a7/0xc80 drivers/hid/usbhid/hid-core.c:1024
>  hid_add_device+0x132/0x520 drivers/hid/hid-core.c:2790
>  usbhid_probe+0xb38/0xea0 drivers/hid/usbhid/hid-core.c:1429
>  usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
>  really_probe+0x2b8/0xad0 drivers/base/dd.c:656
>  __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
>  driver_probe_device+0x50/0x430 drivers/base/dd.c:828
>  __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
>  bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
>  __device_attach+0x333/0x520 drivers/base/dd.c:1028
>  bus_probe_device+0x189/0x260 drivers/base/bus.c:532
>  device_add+0x8ff/0xca0 drivers/base/core.c:3720
>  usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
>  usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
>  usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
> 
> Reported-and-tested-by: syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com
> Fixes: f043bfc98c19 ("HID: usbhid: fix out-of-bounds bug")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


