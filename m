Return-Path: <linux-input+bounces-3674-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F18C30B8
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 12:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49A121F23479
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 10:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762D94F5EA;
	Sat, 11 May 2024 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF16qTfm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC582F26;
	Sat, 11 May 2024 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424512; cv=none; b=B7A14JQiR8n9UQlbarLV+NOy5jswKvCNf7cRwalX6kGgibBEjiD066xT24Z/dUVjsOBznb7ZdcD2M1D/KQzbx5H2vhXCMr/zEIzU8uMquNFaxvusuZBs3yadwRFBi3ZCCB0Y+v4AR/4p1o7IeRsZlaqR98gHog8ymX3YvcsLmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424512; c=relaxed/simple;
	bh=hiFLWmeAgYpuw6Qw19ujTQ3aCkQGSUx6ApcDoCGhjs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrVJa0NsXuD6s5CouAgJk4kpwpudqHfMJW57Idd6KRlqf/s8EDmVik6X2CqgcYhsGf/qNZwg4dg1C42X3nbvgvdyrLkYlANZtKQ77ZwDTV8Yick1Vz54ykIZigpObQpLOU8uF8fomFp2rL08aGEctJXEf+AM0Zv1d9STFxdz09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF16qTfm; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so3373577e87.1;
        Sat, 11 May 2024 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715424508; x=1716029308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpN/wP0T1qJiF1GYnpeHO3l3mKkjKbq4/xitsIJNPwg=;
        b=OF16qTfmiTpqS2BENT4fRp1k1vL1WRYfdCvKbWIf67Jc4Zc0GHKq7V/nHqBD5ZazJR
         fBl98zfpQul17tQNu5t4EhbRQpyKRK3lJqOVbtAFBsXpK9oA0wMJeZOt038J7UHAUlxB
         V7IelBqDUfxjrQD+7jA+FIZyIP7Dx4qRicESuVDjLj0vpNZn1M8kS7iZVldHw1GHXtQ+
         1j7ss68Q4XFcz9/WKq8GlRk2Gqe0l+G974hwU+q93TF7fshd1gkwGq6VhSpGs/x+4/jB
         xTOhJrG6T3uoA/2/RA6K4FTP4J24vsLEsD/NEdXKXViKd+WofSz1clnn/lrSDVVa0ckM
         tXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715424508; x=1716029308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpN/wP0T1qJiF1GYnpeHO3l3mKkjKbq4/xitsIJNPwg=;
        b=r7dBiIflCr0XS95zjoDkWDVjOKWoD40iMJkNgZ6OG9Pml5o38/7ZMQQmY121VNvU+o
         V713OgvVTtAcc9ST+AYZGkKTXAlWZaqCghg6Glxb/g19wt8pvRV+4gAK4XeHFBuRxjwO
         LBAZwueNgyD4gXbexNh2IY3VJHXqnCPzQrldEG8VFsUv1vbnCkF7u1ZX0wV5PgkyUmzX
         5pOQM6YYtGCFxXtiFmGSkcuzK3F46YKwMte2Rx0kKBZP3gr+0KU/e1MV9dw7l8bMvpLN
         BWguYu6vu1yLnqvav27JBVFodme7ciGe+RklXv4viWBx0OzL1M8cuahCgPY6mfHZ3v05
         7O4w==
X-Forwarded-Encrypted: i=1; AJvYcCV+wNqG4tbhXdLs1ZOvxirbFlLVIUjwEzbljClLx3Ay7Qt0NbllOvjXz01BSAcoOA6L6gOnCOKf40KKFB5ooZDj7jVckRC9yCh6ivIE
X-Gm-Message-State: AOJu0YwbTMz429U7L52uYKIwx4zRmwwP0iCPoxWGYo01wN64xr5K0Chq
	QBD0gd0O1xM/ojCdcnmRlkgnRXtuT+PQrRXAGzF94FLetzgeS0MDuFnONwcPF9/mLP+S0O7qLV6
	JV1SdIBGwTBlJ+5lrJrU8we9WMmGXP46TLosJmg==
X-Google-Smtp-Source: AGHT+IGWYU/Ppi0sQPQ6dPLpN9oFPYSybY5Uf9NueHwW3ryAcQUZNYP6ih9RTCYFZcurXADVLUq0Q0h4DZoyiW5SZtc=
X-Received: by 2002:a05:6512:451:b0:51e:ff32:16a8 with SMTP id
 2adb3069b0e04-52210273f01mr3186339e87.62.1715424508046; Sat, 11 May 2024
 03:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMA0xaTSMN+p4xUXkzrtR5r6k7hgoswcaXx7baR_z9r5jjskw@mail.gmail.com>
In-Reply-To: <CALMA0xaTSMN+p4xUXkzrtR5r6k7hgoswcaXx7baR_z9r5jjskw@mail.gmail.com>
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Sat, 11 May 2024 18:47:50 +0800
Message-ID: <CALMA0xYT9H7fZx2gnjf_8DrXpLPVHkuKtYbkm0MbqsSZTLf=NA@mail.gmail.com>
Subject: Re: kernel panic when build w/ CONFIG_HID_BPF=y
To: rcu@vger.kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

As described in the last email, I thought the kernel panic was related
to CONFIG_HID_BPF, but it seems not for today's panic.

Following panic log is found on a macmini7.1 w/ CONFIG_HID_BPF disabled,
the panic log is highly similar w/ the log with CONFIG_HID_BPF enabled.
It seems related to RCU?

[   T15] BUG: unable to handle page fault for address: ffffffffb411c8c8
[   T15] #PF: supervisor read access in kernel mode
[   T15] #PF: error_code(0x0000) - not-present page
[   T15] PGD 165a24067 P4D 165a24067 PUD 165a25063 PMD 166bff063 PTE
800ffffe99ee3062
[   T15] Oops: 0000 [#1] PREEMPT SMP PTI
[   T45] usb usb2: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 6.06
[   T15] CPU: 0 PID: 15 Comm: rcu_tasks_trace Tainted: G W
6.6.30-gentoo-ks #2 a5ce907d07a3642cbd0dd494822fdaf3f1e8cc1f
[   T15] Hardware name: Apple Inc. Macmini7,1/Mac-35C5E08120C7EEAF,
BIOS MM71.882.0220.B07.1602221546 02/22/2016
[   T15] RIP: 0010:rcu_tasks_need_gpcb+0x25d/0x2c0
[   T15] Code: 30 ff ff ff 49 8b 8f b0 00 00 00 48 c7 c0 a8 8c 92 b3
eb 10 48 83 c0 08 48 3d a0 9c 92 b3 0f 84 5a ff ff ff 48 8b 10 48 01
ca <48> 8b 52 48 48 85 d2 74 e1 0f 0b eb dd 49 8b b7 20 01 00 00 48 c7
[   T15] RSP: 0018:ffffafb5400afe60 EFLAGS: 00010082
[   T15] RAX: ffffffffb3928cc0 RBX: ffffffffb3b3b382 RCX: 0000000000021880
[   T15] RDX: ffffffffb411c880 RSI: 0000000000000000 RDI: 0000000000000000
[   T15] RBP: 0000000000000202 R08: 0000000000000000 R09: 0000000000000000
[   T15] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000003
[   T15] R13: 0000000000000000 R14: 0000000000000001 R15: ffffffffb3b3b320
[   T15] FS:  0000000000000000(0000) GS:ffff8c3ca7200000(0000)
knlGS:0000000000000000
[   T15] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   T15] CR2: ffffffffb411c8c8 CR3: 00000001000c0001 CR4: 00000000001706f0
[   T15] Call Trace:
[   T15]  <TASK>
[   T15]  ? __die+0x23/0x80
[   T15]  ? page_fault_oops+0xa4/0x180
[   T15]  ? exc_page_fault+0x152/0x180
[   T15]  ? asm_exc_page_fault+0x26/0x40
[   T15]  ? rcu_tasks_need_gpcb+0x25d/0x2c0
[   T15]  ? __pfx_rcu_tasks_kthread+0x40/0x40
[   T15]  rcu_tasks_one_gp+0x69/0x180
[   T15]  rcu_tasks_kthread+0x94/0xc0
[   T15]  kthread+0xe8/0x140
[   T15]  ? __pfx_kthread+0x40/0x40
[   T15]  ret_from_fork+0x34/0x80
[   T15]  ? __pfx_kthread+0x40/0x40
[   T15]  ret_from_fork_asm+0x1b/0x80
[   T15]  </TASK>
[   T15] Modules linked in: drm(+) loop fuse
drm_panel_orientation_quirks backlight nfnetlink efivarfs dmi_sysfs
ext4 crc32c_generic_crc16 mbcache jbd2 simplefb cfbfillrect cfbimgblt
cfbcopyarea fb fbdev hid_generic usbhid hid dm_mod sd_mod t10_pi
crc64_rocksoft crc64 crc_t10dif crct10dif_common ahci xhci_pci
xhci_pci_renesas libahci xhci_hcd libata usbcore scsi_mod crc32c_intel
usb_common scsi_common
[   T15] CR2: ffffffffb411c8c8
[   T15] ---[ end trace 0000000000000000 ]---
[   T15] RIP: 0010:rcu_tasks_need_gpcb+0x25d/0x2c0
[   T15] Code: 30 ff ff ff 49 8b 8f b0 00 00 00 48 c7 c0 a8 8c 92 b3
eb 10 48 83 c0 08 48 3d a0 9c 92 b3 0f 84 5a ff ff ff 48 8b 10 48 01
ca <48> 8b 52 48 48 85 d2 74 e1 0f 0b eb dd 49 8b b7 20 01 00 00 48 c7
[   T15] RSP: 0018:ffffafb5400afe60 EFLAGS: 00010082
[   T15] RAX: ffffffffb3928cc0 RBX: ffffffffb3b3b328 RCX: 0000000000021880
[   T15] RDX: ffffffffb411c880 RSI: 0000000000000000 RDI: 0000000000000000
[   T15] RBP: 0000000000000202 R08: 0000000000000000 R09: 0000000000000000
[   T15] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000003
[   T15] R13: 0000000000000000 R14: 0000000000000001 R15: ffffffffb3b3b320
[   T15] FS:  0000000000000000(0000) GS:ffff8c3ca7200000(0000)
knlGS:0000000000000000
[   T15] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   T15] CR2: ffffffffb411c8c8 CR3: 00000001000c0001 CR4: 00000000001706f0
[   T15] Kernel panic - not syncing: Fatal exception
[   T15] Kernel Offset: 0x31000000 from 0xffffffff81000000 (relocation
range: 0xffffffff80000000-0xffffffffbfffffff)
[   T15] ---[ end Kernel panic - not syncing: Fatal exception ]

Zhixu Liu <zhixu.liu@gmail.com> =E4=BA=8E2024=E5=B9=B44=E6=9C=8830=E6=97=A5=
=E5=91=A8=E4=BA=8C 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> For config.6.6.21 attached, the kernel panic when build w/
> CONFIG_HID_BPF=3Dy, and boot success after disable this option.
>
> In config.6.6.21, I enabled almost all modules, it take about 40
> minute to compile. The panic log shows nothing w/ hid-bpf directly,
> CONFIG_HID_BPF was found after days of compile and test. I'm still
> trying to show this panic w/ a much smaller config, but no success
> yet. :-(
>
> [    3.697008][   T15] #PF: supervisor read access in kernel mode
> [    3.697009][   T15] #PF: error_code(0x0000) - not-present page
> [    3.706233][   T45] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf7e3c000
> [    3.708152][   T15] PGD 40fa24067 P4D 40fa24067 PUD 40fa25063 PMD 410b=
ff063
> [    3.720380][   T45] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
> [    3.720430][   T15] PTE 800ffffbefee3062
> [    3.720431][   T15] Oops: 0000 [#1] PREEMPT SMP PTI
> [    3.727873][   T45] usb usb2: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 6.06
> [    3.734009][   T15] CPU: 0 PID: 15 Comm: rcu_tasks_trace Tainted: G
>        W          6.6.21-ks #1
> 5dc7acf91a5e8e9ac9dcfc35bee0245691283ea6
> [    3.734011][   T15] Hardware name: Dell Inc. OptiPlex 9020/005T15,
> BIOS A14 09/14/2015
> [    3.734012][   T15] RIP: 0010:rcu_tasks_need_gpcb+0x25d/0x2c0
> [    3.737962][   T45] usb usb2: New USB device strings: Mfr=3D3,
> Product=3D2, SerialNumber=3D1
> [    3.742876][   T15] Code: 30 ff ff ff 49 8b 8f b0 00 00 00 48 c7 c0
> 88 9c 92 98 eb 10 48 83 c0 08 48 3d 80 ac 92 98 0f 84 5a ff ff ff 48
> 8b 10 48 01 ca <48> 8b 52 48 48 85 d2 74 e1 0f 0b eb dd 49 8b b7 20 01
> 00 00 48 c7
> [    3.742877][   T15] RSP: 0018:ffffa371c00a3e60 EFLAGS: 00010082
> [    3.751891][   T45] usb usb2: Product: EHCI Host Controller
> [    3.764495][   T15]
> [    3.764496][   T15] RAX: ffffffff98929ca0 RBX: ffffffff98b3b328
> RCX: 0000000000021880
> [    3.764497][   T15] RDX: ffffffff9911c880 RSI: 0000000000000000
> RDI: 0000000000000000
> [    3.772461][   T45] usb usb2: Manufacturer: Linux 6.6.21-ks ehci_hcd
> [    3.778248][   T15] RBP: 0000000000000202 R08: 0000000000000000
> R09: 0000000000000000
> [    3.778249][   T15] R10: 0000000000000000 R11: 0000000000000000
> R12: 0000000000000003
> [    3.778249][   T15] R13: 0000000000000000 R14: 0000000000000001
> R15: ffffffff98b3b320
> [    3.786216][   T45] usb usb2: SerialNumber: 0000:00:1a.0
> [    3.805811][   T15] FS:  0000000000000000(0000)
> GS:ffff8c781ea00000(0000) knlGS:0000000000000000
> [    3.805813][   T15] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.811993][   T45] hub 2-0:1.0: USB hub found
> [    3.817383][   T15] CR2: ffffffff9911c8c8 CR3: 000000040fa20005
> CR4: 00000000001706f0
> [    3.817385][   T15] Call Trace:
> [    3.817386][   T15]  <TASK>
> [    3.817388][   T15]  ? __die+0x23/0x80
> [    3.819643][   T45] hub 2-0:1.0: 2 ports detected
> [    3.827481][   T15]  ? page_fault_oops+0xa4/0x180
> [    3.827485][   T15]  ? exc_page_fault+0x152/0x180
> [    3.922376][   T15]  ? asm_exc_page_fault+0x26/0x40
> [    3.927289][   T15]  ? rcu_tasks_need_gpcb+0x25d/0x2c0
> [    3.932459][   T15]  ? __pfx_rcu_tasks_kthread+0x40/0x40
> [    3.937806][   T15]  rcu_tasks_one_gp+0x69/0x180
> [    3.942451][   T15]  rcu_tasks_kthread+0x94/0xc0
> [    3.947096][   T15]  kthread+0xe8/0x140
> [    3.950956][   T15]  ? __pfx_kthread+0x40/0x40
> [    3.955425][   T15]  ret_from_fork+0x34/0x80
> [    3.959721][   T15]  ? __pfx_kthread+0x40/0x40
> [    3.964192][   T15]  ret_from_fork_asm+0x1b/0x80
> [    3.968841][   T15]  </TASK>
> [    3.971735][   T15] Modules linked in: libahci ehci_pci xhci_hcd
> ehci_hcd libata crc32c_intel scsi_mod usbcore scsi_common usb_common
> [    3.983818][   T15] CR2: ffffffff9911c8c8
> [    3.987853][   T15] ---[ end trace 0000000000000000 ]---
> [    3.993195][   T15] RIP: 0010:rcu_tasks_need_gpcb+0x25d/0x2c0
> [    3.998977][   T15] Code: 30 ff ff ff 49 8b 8f b0 00 00 00 48 c7 c0
> 88 9c 92 98 eb 10 48 83 c0 08 48 3d 80 ac 92 98 0f 84 5a ff ff ff 48
> 8b 10 48 01 ca <48> 8b 52 48 48 85 d2 74 e1 0f 0b eb dd 49 8b b7 20 01
> 00 00 48 c7
> [    4.018567][   T15] RSP: 0018:ffffa371c00a3e60 EFLAGS: 00010082
> [    4.024521][   T15] RAX: ffffffff98929ca0 RBX: ffffffff98b3b328
> RCX: 0000000000021880
> [    4.032411][   T15] RDX: ffffffff9911c880 RSI: 0000000000000000
> RDI: 0000000000000000
> [    4.040288][   T15] RBP: 0000000000000202 R08: 0000000000000000
> R09: 0000000000000000
> [    4.048167][   T15] R10: 0000000000000000 R11: 0000000000000000
> R12: 0000000000000003
> [    4.056043][   T15] R13: 0000000000000000 R14: 0000000000000001
> R15: ffffffff98b3b320
> [    4.063920][   T15] FS:  0000000000000000(0000)
> GS:ffff8c781ea00000(0000) knlGS:0000000000000000
> [    4.072761][   T15] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.079242][   T15] CR2: ffffffff9911c8c8 CR3: 000000040fa20005
> CR4: 00000000001706f0
> [    4.087119][   T15] Kernel panic - not syncing: Fatal exception
> [    4.093097][   T15] Kernel Offset: 0x16000000 from
> 0xffffffff81000000 (relocation range:
> 0xffffffff80000000-0xffffffffbfffffff)
> [    4.104648][   T15] ---[ end Kernel panic - not syncing: Fatal excepti=
on ]---
>
> --
> Z. Liu



--=20
Z. Liu

--=20
Z. Liu

