Return-Path: <linux-input+bounces-8668-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE09F79F8
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 12:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E56A18922D5
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 11:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB4A223C62;
	Thu, 19 Dec 2024 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXxtjReZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5DC223706;
	Thu, 19 Dec 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605985; cv=none; b=VUReGlKrTtmAmACSsEdzwwU52G8XehL5SNW8KTXqbt36GpF0HRFEgMjyy2rnkKREB6TZKcS0q4lFFjTr6oInquT+sfq24G7yHh5aYgaOvbQbELf1FTiZHq7zh4Bl5lyRxs0Y9S/hKZq4gbndOTi1IjrH1ZCJwDC70TzCMJc9cUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605985; c=relaxed/simple;
	bh=GaJHo2Ji0aySnbFhDSNFfMkKsoNQhHW2F+2Bsx3veW4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=riX/gJ/TH9NOBsixBs+6w8CzjN4RjZ1eAL2oAWT3pQQf2OMcFbL/+SEXIqrquNHTHphqjI7g/8hn/MLPSP5xDVkYIh7Ou0SG7TZha/QcqEEnYakNCArSUgSLC9dq8kzCfE4wPc4ldpcIcAXIODapGjhAYTrxwTN8JVG8w5+i12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXxtjReZ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30227c56b11so7397951fa.3;
        Thu, 19 Dec 2024 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734605981; x=1735210781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=skWOzFUpV8y2cWiTVQhxzENX7htMz6G2hrdRd7DJu+g=;
        b=bXxtjReZFWbP3w1QJK5OPp+bTPiXNG9+o2RXZWI2l8QCTJp0tY8qS7YEPwPgC2oom9
         UsjP8OGtLeY2TjGyhYUc+AGwzWuv382uy3Mc84eKeTAAzDvdRcuRLMLfSZH2B/9yplgt
         c3Iu9wEelLIMlz96toZw9VKIvIA8wQgHBHqz0k6janoCF+R3c2zUTfgBL2rxKqDsKDzP
         +uC/M3EATh1K2PqkJtwTcoXMGVRF2axuSvrn6Zow8BnI+0R+EXGJKkejhppY+VTo/5oO
         0bbxeN6VSaxeg804K3qTvNqOgaWJ9EJxDzOpGOo3Xwlj1PzVQxC8VwZBG3eIiIEXPmZS
         CLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605981; x=1735210781;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skWOzFUpV8y2cWiTVQhxzENX7htMz6G2hrdRd7DJu+g=;
        b=lTaxhFC8r87okc2pnIUsYNvjuFB33KR4lHqlwRQdKtwRoSAakf4XpiwipECmI8occu
         6//h5u9vbrhDK+9/GbYM6EFr2YdBctlh2iyYtO2asFC3KJZAUxaPPcR6ZDlgd5ls06GK
         CgbAC0HTCtb/940nBsN5Gu3h6DEJBcXHV+UEVhaz2zYs/98PaoZ1uP443K5q/6/dxBoJ
         NuQVwiz9h5JYqT8xKP9ko3fArFmNwUgojeEh3ojW5eMHqKuD+7VCToHdvHntqN4xmDad
         ykyMtpiQ7jhjBoQXI7GkvhuhSwk2z5f8ufKipUv8bODJLL8eqNzRUkrNIexG2V5ASxRy
         tXTg==
X-Forwarded-Encrypted: i=1; AJvYcCXGePx9834S5jo5vFrtz3QlocZ4ebgSeut5Pp5Hk3psLiSQnbxIdvUTHtVq8ABIz+Pz0C02ZeDqvXCvLhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQSgsnYSoQ0qlLCHhXyPunbixR4uuKd5aRkO6Mm5fJzbtqCeY
	02ZrnB3XvSNYJOAAeG/xW/m/nFi/h66SX0fDkMbyMcEGgxjf9bRZ390MvbfXDxqRZT9DrZElVsS
	3Do/uSpI+gWtLBnoQRiBFSqsVTvo=
X-Gm-Gg: ASbGncs8LxHLJDZMcYqPvSAqEAl9mmLB26tIlepUMn8nE0p8FT8F0KvaxYayLEcyfdV
	4btAiXjvTh3zFOSLtd02k2LG521zNmOaVjy6Y
X-Google-Smtp-Source: AGHT+IHP5CB5MblSLuHsKoxrENbEg4Vl1xaO/BGticUNeOQo9OE2Boot9ZayRz1sIY14z/xmnywvWnjSP6LwFDmWQe4=
X-Received: by 2002:a2e:a555:0:b0:302:210d:3b44 with SMTP id
 38308e7fff4ca-3044db64b0dmr19678011fa.35.1734605980997; Thu, 19 Dec 2024
 02:59:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: wzs <wangzhengshu39@gmail.com>
Date: Thu, 19 Dec 2024 18:59:29 +0800
Message-ID: <CAGXGE_JpBY-+bbA3puzhF7ZSZpso3PenqSDmh8fmZ_=XkGJ14w@mail.gmail.com>
Subject: UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69 and 73
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
when fuzzing the Linux Kernel 6.13.0-rc3,
the following two crashes were triggered in the same function.

kernel config : https://pastebin.com/hGFvz9vz
console output1 : https://pastebin.com/Hr3wgmXV
console output2 : https://pastebin.com/z7jjWwYU

Basically, we use gadget module to simulate the connection and
interaction process of a USB device.

It seems that a shift overflow error occurred in the function s32ton.
If the value of n is greater than or equal to 32, it will result in
overflow or undefined behavior.

I have also encountered this issue on the latest stable version, Linux 6.12.0.

The crash reports are as follows:
crash1:
------------[ cut here ]------------
[ 7766.171762] UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
[ 7766.171780] shift exponent 4294967295 is too large for 32-bit type 'int'
[ 7766.175006] CPU: 11 UID: 0 PID: 7279 Comm: kworker/11:2 Tainted: G
         OE      6.13.0-rc3 #1
[ 7766.175036] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[ 7766.175042] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
[ 7766.175051] Workqueue: usb_hub_wq hub_event
[ 7766.175077] Call Trace:
[ 7766.175930]  <TASK>
[ 7766.175932]  dump_stack_lvl+0x76/0xa0
[ 7766.181221]  dump_stack+0x10/0x20
[ 7766.181240]  __ubsan_handle_shift_out_of_bounds+0x155/0x310
[ 7766.183312]  ? __wake_up+0x45/0x70
[ 7766.184850]  s32ton.cold+0x53/0x73 [hid]
[ 7766.184870]  hid_set_field+0x1c0/0x380 [hid]
[ 7766.184878]  ? __kasan_check_write+0x14/0x30
[ 7766.185999]  usbhid_start+0x1605/0x2890 [usbhid]
[ 7766.186010]  hid_hw_start+0x67/0x120 [hid]
[ 7766.186020]  hid_generic_probe+0x60/0x80 [hid_generic]
[ 7766.186023]  hid_device_probe+0x302/0x770 [hid]
[ 7766.186030]  ? sysfs_create_link+0x44/0xc0
[ 7766.187952]  really_probe+0x1fa/0x950
[ 7766.189437]  __driver_probe_device+0x307/0x410
[ 7766.189448]  driver_probe_device+0x4e/0x150
[ 7766.189456]  __device_attach_driver+0x1a7/0x2d0
[ 7766.189548]  bus_for_each_drv+0x115/0x1b0
[ 7766.189635]  ? __pfx___device_attach_driver+0x10/0x10
[ 7766.189645]  ? __pfx_bus_for_each_drv+0x10/0x10
[ 7766.189655]  __device_attach+0x250/0x470
[ 7766.189663]  ? _raw_spin_lock+0x82/0xf0
[ 7766.189864]  ? __pfx___device_attach+0x10/0x10
[ 7766.189873]  ? __kasan_check_write+0x14/0x30
[ 7766.189882]  ? kobject_get+0x55/0xf0
[ 7766.189890]  device_initial_probe+0x13/0x20
[ 7766.189898]  bus_probe_device+0x146/0x180
[ 7766.189905]  device_add+0xea0/0x1810
[ 7766.189914]  ? __pfx_device_add+0x10/0x10
[ 7766.189922]  ? __debugfs_create_file+0x392/0x5a0
[ 7766.190527]  hid_add_device+0x33c/0xab0 [hid]
[ 7766.190551]  ? __pfx_hid_add_device+0x10/0x10 [hid]
[ 7766.190570]  ? ___kmalloc_large_node+0xf7/0x170
[ 7766.192150]  usbhid_probe+0xb25/0x1180 [usbhid]
[ 7766.192173]  usb_probe_interface+0x266/0x950
[ 7766.192920]  ? sysfs_create_link+0x44/0xc0
[ 7766.192939]  really_probe+0x1fa/0x950
[ 7766.192949]  __driver_probe_device+0x307/0x410
[ 7766.192958]  driver_probe_device+0x4e/0x150
[ 7766.192966]  __device_attach_driver+0x1a7/0x2d0
[ 7766.192975]  bus_for_each_drv+0x115/0x1b0
[ 7766.192984]  ? __pfx___device_attach_driver+0x10/0x10
[ 7766.192992]  ? __pfx_bus_for_each_drv+0x10/0x10
[ 7766.193003]  __device_attach+0x250/0x470
[ 7766.193009]  ? _raw_spin_lock+0x82/0xf0
[ 7766.193018]  ? __pfx___device_attach+0x10/0x10
[ 7766.193026]  ? __kasan_check_write+0x14/0x30
[ 7766.193034]  ? kobject_get+0x55/0xf0
[ 7766.193042]  device_initial_probe+0x13/0x20
[ 7766.193050]  bus_probe_device+0x146/0x180
[ 7766.193057]  device_add+0xea0/0x1810
[ 7766.193067]  ? __pfx_device_add+0x10/0x10
[ 7766.193075]  ? __pfx_mutex_unlock+0x10/0x10
[ 7766.193178]  usb_set_configuration+0xa96/0x1b60
[ 7766.193195]  usb_generic_driver_probe+0x8e/0xc0
[ 7766.193301]  usb_probe_device+0xb7/0x320
[ 7766.193310]  really_probe+0x1fa/0x950
[ 7766.193318]  __driver_probe_device+0x307/0x410
[ 7766.193326]  driver_probe_device+0x4e/0x150
[ 7766.193333]  __device_attach_driver+0x1a7/0x2d0
[ 7766.193341]  bus_for_each_drv+0x115/0x1b0
[ 7766.193350]  ? __pfx___device_attach_driver+0x10/0x10
[ 7766.193357]  ? __pfx_bus_for_each_drv+0x10/0x10
[ 7766.193368]  __device_attach+0x250/0x470
[ 7766.193453]  ? _raw_spin_lock+0x82/0xf0
[ 7766.193465]  ? __pfx___device_attach+0x10/0x10
[ 7766.193473]  ? __kasan_check_write+0x14/0x30
[ 7766.193481]  ? kobject_get+0x55/0xf0
[ 7766.193488]  device_initial_probe+0x13/0x20
[ 7766.193495]  bus_probe_device+0x146/0x180
[ 7766.193502]  device_add+0xea0/0x1810
[ 7766.193511]  ? __pfx_device_add+0x10/0x10
[ 7766.193519]  ? add_device_randomness+0xb5/0xf0
[ 7766.194200]  ? __pfx_add_device_randomness+0x10/0x10
[ 7766.194209]  usb_new_device+0x81b/0x1360
[ 7766.194921]  ? __pfx_mutex_unlock+0x10/0x10
[ 7766.194929]  hub_event+0x2435/0x4370
[ 7766.194935]  ? __pfx_hub_event+0x10/0x10
[ 7766.194939]  ? srso_alias_untrain_ret+0x1/0x10
[ 7766.195802]  ? __kasan_check_write+0x14/0x30
[ 7766.195815]  ? _raw_spin_lock_irq+0x8b/0x100
[ 7766.195824]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[ 7766.195833]  process_one_work+0x5f7/0x1060
[ 7766.196636]  ? __kasan_check_write+0x14/0x30
[ 7766.196652]  worker_thread+0x779/0x1200
[ 7766.196661]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[ 7766.196673]  kthread+0x2b5/0x390
[ 7766.196786]  ? __pfx_worker_thread+0x10/0x10
[ 7766.196795]  ? __pfx_kthread+0x10/0x10
[ 7766.196804]  ret_from_fork+0x43/0x90
[ 7766.198261]  ? __pfx_kthread+0x10/0x10
[ 7766.198265]  ret_from_fork_asm+0x1a/0x30
[ 7766.199253]  </TASK>
[ 7766.199410] ---[ end trace ]---


crash2:
[ 7771.392834] ------------[ cut here ]------------
 [ 7771.392851] UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:73:21
 [ 7771.392868] shift exponent 32 is too large for 32-bit type 'int'
 [ 7771.392882] CPU: 11 UID: 0 PID: 7279 Comm: kworker/11:2 Tainted: G
          OE      6.13.0-rc3 #1
 [ 7771.392895] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
 [ 7771.392900] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
 [ 7771.392908] Workqueue: usb_hub_wq hub_event
 [ 7771.392929] Call Trace:
 [ 7771.392934]  <TASK>
 [ 7771.392940]  dump_stack_lvl+0x76/0xa0
 [ 7771.392961]  dump_stack+0x10/0x20
 [ 7771.392970]  __ubsan_handle_shift_out_of_bounds+0x155/0x310
 [ 7771.392986]  ? __wake_up+0x45/0x70
 [ 7771.393001]  s32ton.cold+0x6e/0x73 [hid]
 [ 7771.393027]  hid_set_field+0x1c0/0x380 [hid]
 [ 7771.393048]  ? __kasan_check_write+0x14/0x30
 [ 7771.393060]  usbhid_start+0x1605/0x2890 [usbhid]
 [ 7771.393079]  hid_hw_start+0x67/0x120 [hid]
 [ 7771.393112]  hid_generic_probe+0x60/0x80 [hid_generic]
 [ 7771.393120]  hid_device_probe+0x302/0x770 [hid]
 [ 7771.393140]  ? sysfs_create_link+0x44/0xc0
 [ 7771.393155]  really_probe+0x1fa/0x950
 [ 7771.393166]  __driver_probe_device+0x307/0x410
 [ 7771.393174]  driver_probe_device+0x4e/0x150
 [ 7771.393182]  __device_attach_driver+0x1a7/0x2d0
 [ 7771.393190]  bus_for_each_drv+0x115/0x1b0
 [ 7771.393201]  ? __pfx___device_attach_driver+0x10/0x10
 [ 7771.393208]  ? __pfx_bus_for_each_drv+0x10/0x10
 [ 7771.393219]  __device_attach+0x250/0x470
 [ 7771.393226]  ? _raw_spin_lock+0x82/0xf0
 [ 7771.393235]  ? __pfx___device_attach+0x10/0x10
 [ 7771.393243]  ? __kasan_check_write+0x14/0x30
 [ 7771.393251]  ? kobject_get+0x55/0xf0
 [ 7771.393258]  device_initial_probe+0x13/0x20
 [ 7771.393266]  bus_probe_device+0x146/0x180
 [ 7771.393273]  device_add+0xea0/0x1810
 [ 7771.393282]  ? __pfx_device_add+0x10/0x10
 [ 7771.393290]  ? __debugfs_create_file+0x392/0x5a0
 [ 7771.393302]  hid_add_device+0x33c/0xab0 [hid]
 [ 7771.393323]  ? __pfx_hid_add_device+0x10/0x10 [hid]
 [ 7771.393341]  ? ___kmalloc_large_node+0xf7/0x170
 [ 7771.393352]  usbhid_probe+0xb25/0x1180 [usbhid]
 [ 7771.393368]  usb_probe_interface+0x266/0x950
 [ 7771.393377]  ? sysfs_create_link+0x44/0xc0
 [ 7771.393520]  really_probe+0x1fa/0x950
 [ 7771.393532]  __driver_probe_device+0x307/0x410
 [ 7771.393540]  driver_probe_device+0x4e/0x150
 [ 7771.393548]  __device_attach_driver+0x1a7/0x2d0
 [ 7771.393696]  bus_for_each_drv+0x115/0x1b0
 [ 7771.393707]  ? __pfx___device_attach_driver+0x10/0x10
 [ 7771.393715]  ? __pfx_bus_for_each_drv+0x10/0x10
 [ 7771.393725]  __device_attach+0x250/0x470
 [ 7771.393732]  ? _raw_spin_lock+0x82/0xf0
 [ 7771.393740]  ? __pfx___device_attach+0x10/0x10
 [ 7771.393747]  ? __kasan_check_write+0x14/0x30
 [ 7771.393755]  ? kobject_get+0x55/0xf0
 [ 7771.393762]  device_initial_probe+0x13/0x20
 [ 7771.393769]  bus_probe_device+0x146/0x180
 [ 7771.393776]  device_add+0xea0/0x1810
 [ 7771.393785]  ? __pfx_device_add+0x10/0x10
 [ 7771.393792]  ? __pfx_mutex_unlock+0x10/0x10
 [ 7771.393803]  usb_set_configuration+0xa96/0x1b60
 [ 7771.393817]  usb_generic_driver_probe+0x8e/0xc0
 [ 7771.393827]  usb_probe_device+0xb7/0x320
 [ 7771.393834]  really_probe+0x1fa/0x950
 [ 7771.393842]  __driver_probe_device+0x307/0x410
 [ 7771.393849]  driver_probe_device+0x4e/0x150
 [ 7771.393857]  __device_attach_driver+0x1a7/0x2d0
 [ 7771.393864]  bus_for_each_drv+0x115/0x1b0
 [ 7771.393873]  ? __pfx___device_attach_driver+0x10/0x10
 [ 7771.393880]  ? __pfx_bus_for_each_drv+0x10/0x10
 [ 7771.393890]  __device_attach+0x250/0x470
 [ 7771.393897]  ? _raw_spin_lock+0x82/0xf0
 [ 7771.393905]  ? __pfx___device_attach+0x10/0x10
 [ 7771.393912]  ? __kasan_check_write+0x14/0x30
 [ 7771.393920]  ? kobject_get+0x55/0xf0
 [ 7771.393927]  device_initial_probe+0x13/0x20
 [ 7771.393934]  bus_probe_device+0x146/0x180
 [ 7771.393941]  device_add+0xea0/0x1810
 [ 7771.393949]  ? __pfx_device_add+0x10/0x10
 [ 7771.393957]  ? add_device_randomness+0xb5/0xf0
 [ 7771.393966]  ? __pfx_add_device_randomness+0x10/0x10
 [ 7771.393975]  usb_new_device+0x81b/0x1360
 [ 7771.393984]  ? __pfx_mutex_unlock+0x10/0x10
 [ 7771.393993]  hub_event+0x2435/0x4370
 [ 7771.394004]  ? __pfx_hub_event+0x10/0x10
 [ 7771.394011]  ? srso_alias_untrain_ret+0x1/0x10
 [ 7771.394022]  ? __kasan_check_write+0x14/0x30
 [ 7771.394029]  ? _raw_spin_lock_irq+0x8b/0x100
 [ 7771.394037]  ? __pfx__raw_spin_lock_irq+0x10/0x10
 [ 7771.394046]  process_one_work+0x5f7/0x1060
 [ 7771.394139]  ? __kasan_check_write+0x14/0x30
 [ 7771.394153]  worker_thread+0x779/0x1200
 [ 7771.394161]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 [ 7771.394171]  kthread+0x2b5/0x390
 [ 7771.394180]  ? __pfx_worker_thread+0x10/0x10
 [ 7771.394188]  ? __pfx_kthread+0x10/0x10
 [ 7771.394196]  ret_from_fork+0x43/0x90
 [ 7771.394206]  ? __pfx_kthread+0x10/0x10
 [ 7771.394214]  ret_from_fork_asm+0x1a/0x30
 [ 7771.394225]  </TASK>
 [ 7771.394390] ---[ end trace ]---

