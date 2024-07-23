Return-Path: <linux-input+bounces-5124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA0939D00
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 10:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 925E51F2269A
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 08:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBE214B94E;
	Tue, 23 Jul 2024 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBJnoXox"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F73DDDC;
	Tue, 23 Jul 2024 08:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721724904; cv=none; b=iElSj40HOP11wV7aJz3MSuW+OcK2O2ar0KSaL3JTyJlwF6lA762K89xgIyOrXKn8E76bBrYL7PP/Q5wEUiApetJh663HV4ZO5WanbzurxZmXO6n71KYaFBCG3xbbrGBtV/rcyYiS2Y6X4JGwcm5zVnywBdb6BWvq5/HjtjEBgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721724904; c=relaxed/simple;
	bh=xjxoGXNuG4KovIaLwK1/2VEZTywjWzQpfrlZ3R8p/4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jY73R8ZtzuImxS0hcte0UxFVAF2xWKwMcRhhR/8VeOi6rGkkjYwfnAIreBdnzlsYbRjMHyd2oHX3q+PBOWvOFIfcXRJvteAUZfMx0aV+2537BcWDvkmPlCe1V51uZL8hVMCHDv1zDvYjnsMELMHDA80NMCEzO7/9flTlRJs9gKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sobrie.be; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBJnoXox; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sobrie.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso2811779f8f.3;
        Tue, 23 Jul 2024 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721724900; x=1722329700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/YKndxqizZQfpWps21OfPg+tynATR96Jrf/UOjKGl10=;
        b=ZBJnoXoxQGln0ConLvOc0PxCoS6AbOzI3HJfLAHUQwh2x8MDW5XP10WMtiX7Uu0bXH
         fAvLQwoyFD3L6pcaPh2pYnOGt+zAt0ZaD012BEEij6JB0EAUOghE10nrEhfMnnoYfMRs
         XCkj2Rv5knlFx6E9dectaVZQH6gAPceC9LLkmYFOcNVL06T0amt5U9iaQyTZouwDQDNu
         T0o6QVqia+PH+MNGYFVPEwyNHl2fqQZZvpTQHEIMmGtX/yYkX1QZcANM5QI/9nbBc2Lx
         2OE5iX8BUiR7kGsyyQkPyfaE83SONrCXaeN7K2ksvnPGhJO0DO4U0/zmtW/CifdUVhkf
         hViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721724900; x=1722329700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YKndxqizZQfpWps21OfPg+tynATR96Jrf/UOjKGl10=;
        b=U5QnSJREPksyvUJVSXUzNIpM+pSrW1frka2fr9dGd1jkLpwBxRyRMyYRg8WQqA4T2H
         qkhr6qCT9U5XA8lqJpz/FOPD6dZvxlvYDUBTZKHQhiFylX9ZZ8HM7FUdWs/u7J1sIIQD
         fkTon6CUczngYZ/WrL8CWLRFsD/T5oNLiO7y07Wb6WXaLRH5E/KnvkGRVjmaJFOuCvcR
         oYrdUoQ5lmDP3FIJaemexaxoPbYStaouPNF96WFXI6LEoyGstWwpkKdQ9btpvZA5Fj8D
         TMnRnEZySqPB3lglISenVFXPcsyqudmpgCqLZFqTsjr8l4uVKp3vkEEQ+CbxL3kt5ZBV
         LTFA==
X-Forwarded-Encrypted: i=1; AJvYcCX0oUO4uw6v/vHz/BlC/dgcvH2YAifJtzhe5LfZQm8CcsbsEjCJRhx0OJN4diMY8INMGQg9QMqMu86J4YkSEZCgJtYLiCDhIXp2U8Ozwk0T7iofqwIVW/HGrD5HvRaXGMlO9a+tbejsGtI=
X-Gm-Message-State: AOJu0YxM3Or8eV3RR8KiisIeBk2sSDi11v75KJHo9LhOoR/bdGTcieBS
	91J2lUac4JTaFvZWWTjsgBVMnNlTZ0f10GCFwuD3Wpe9m0nYsHgGuMKuBA==
X-Google-Smtp-Source: AGHT+IGlQRw/wirbBvnzE4m9PGFKnJ9eoJD0r0sW/t3Ua2AGuGN2vrsjIHXaKTqEYAQ7deVvpkb6Zg==
X-Received: by 2002:adf:f951:0:b0:35f:122e:bd8c with SMTP id ffacd0b85a97d-369dec1e07emr1601451f8f.17.1721724899293;
        Tue, 23 Jul 2024 01:54:59 -0700 (PDT)
Received: from localhost ([2a02:a03f:b7dc:2b00:a97a:8551:7733:cb60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878811899sm10727457f8f.116.2024.07.23.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 01:54:58 -0700 (PDT)
Sender: Olivier Sobrie <olivier.sobrie@gmail.com>
From: Olivier Sobrie <olivier@sobrie.be>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Olivier Sobrie <olivier@sobrie.be>
Subject: [PATCH] HID: amd_sfh: free driver_data after destroying hid device
Date: Tue, 23 Jul 2024 10:44:35 +0200
Message-ID: <20240723084827.11773-1-olivier@sobrie.be>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

HID driver callbacks aren't called anymore once hid_destroy_device() has
been called. Hence, hid driver_data should be freed only after the
hid_destroy_device() function returned as driver_data is used in several
callbacks.

I observed a crash with kernel 6.10.0 on my T14s Gen 3, after enabling
KASAN to debug memory allocation, I got this output:

  [   13.050438] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [   13.054060] BUG: KASAN: slab-use-after-free in amd_sfh_get_report+0x3e=
c/0x530 [amd_sfh]
  [   13.054809] psmouse serio1: trackpoint: Synaptics TrackPoint firmware:=
 0x02, buttons: 3/3
  [   13.056432] Read of size 8 at addr ffff88813152f408 by task (udev-work=
er)/479

  [   13.060970] CPU: 5 PID: 479 Comm: (udev-worker) Not tainted 6.10.0-arc=
h1-2 #1 893bb55d7f0073f25c46adbb49eb3785fefd74b0
  [   13.063978] Hardware name: LENOVO 21CQCTO1WW/21CQCTO1WW, BIOS R22ET70W=
 (1.40 ) 03/21/2024
  [   13.067860] Call Trace:
  [   13.069383] input: TPPS/2 Synaptics TrackPoint as /devices/platform/i8=
042/serio1/input/input8
  [   13.071486]  <TASK>
  [   13.071492]  dump_stack_lvl+0x5d/0x80
  [   13.074870] snd_hda_intel 0000:33:00.6: enabling device (0000 -> 0002)
  [   13.078296]  ? amd_sfh_get_report+0x3ec/0x530 [amd_sfh 05f43221435b520=
5f734cd9da29399130f398a38]
  [   13.082199]  print_report+0x174/0x505
  [   13.085776]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  [   13.089367]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.093255]  ? amd_sfh_get_report+0x3ec/0x530 [amd_sfh 05f43221435b520=
5f734cd9da29399130f398a38]
  [   13.097464]  kasan_report+0xc8/0x150
  [   13.101461]  ? amd_sfh_get_report+0x3ec/0x530 [amd_sfh 05f43221435b520=
5f734cd9da29399130f398a38]
  [   13.105802]  amd_sfh_get_report+0x3ec/0x530 [amd_sfh 05f43221435b5205f=
734cd9da29399130f398a38]
  [   13.110303]  amdtp_hid_request+0xb8/0x110 [amd_sfh 05f43221435b5205f73=
4cd9da29399130f398a38]
  [   13.114879]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.119450]  sensor_hub_get_feature+0x1d3/0x540 [hid_sensor_hub 3f13be=
3016ff415bea03008d45d99da837ee3082]
  [   13.124097]  hid_sensor_parse_common_attributes+0x4d0/0xad0 [hid_senso=
r_iio_common c3a5cbe93969c28b122609768bbe23efe52eb8f5]
  [   13.127404]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.131925]  ? __pfx_hid_sensor_parse_common_attributes+0x10/0x10 [hid=
_sensor_iio_common c3a5cbe93969c28b122609768bbe23efe52eb8f5]
  [   13.136455]  ? _raw_spin_lock_irqsave+0x96/0xf0
  [   13.140197]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  [   13.143602]  ? devm_iio_device_alloc+0x34/0x50 [industrialio 3d261d5e5=
765625d2b052be40e526d62b1d2123b]
  [   13.147234]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.150446]  ? __devm_add_action+0x167/0x1d0
  [   13.155061]  hid_gyro_3d_probe+0x120/0x7f0 [hid_sensor_gyro_3d 63da36a=
143b775846ab2dbb86c343b401b5e3172]
  [   13.158581]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.161814]  platform_probe+0xa2/0x150
  [   13.165029]  really_probe+0x1e3/0x8a0
  [   13.168243]  __driver_probe_device+0x18c/0x370
  [   13.171500]  driver_probe_device+0x4a/0x120
  [   13.175000]  __driver_attach+0x190/0x4a0
  [   13.178521]  ? __pfx___driver_attach+0x10/0x10
  [   13.181771]  bus_for_each_dev+0x106/0x180
  [   13.185033]  ? __pfx__raw_spin_lock+0x10/0x10
  [   13.188229]  ? __pfx_bus_for_each_dev+0x10/0x10
  [   13.191446]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.194382]  bus_add_driver+0x29e/0x4d0
  [   13.197328]  driver_register+0x1a5/0x360
  [   13.200283]  ? __pfx_hid_gyro_3d_platform_driver_init+0x10/0x10 [hid_s=
ensor_gyro_3d 63da36a143b775846ab2dbb86c343b401b5e3172]
  [   13.203362]  do_one_initcall+0xa7/0x380
  [   13.206432]  ? __pfx_do_one_initcall+0x10/0x10
  [   13.210175]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.213211]  ? kasan_unpoison+0x44/0x70
  [   13.216688]  do_init_module+0x238/0x750
  [   13.219696]  load_module+0x5011/0x6af0
  [   13.223096]  ? kasan_save_stack+0x30/0x50
  [   13.226743]  ? kasan_save_track+0x14/0x30
  [   13.230080]  ? kasan_save_free_info+0x3b/0x60
  [   13.233323]  ? poison_slab_object+0x109/0x180
  [   13.236778]  ? __pfx_load_module+0x10/0x10
  [   13.239703]  ? poison_slab_object+0x109/0x180
  [   13.243070]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.245924]  ? init_module_from_file+0x13d/0x150
  [   13.248745]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.251503]  ? init_module_from_file+0xdf/0x150
  [   13.254198]  init_module_from_file+0xdf/0x150
  [   13.256826]  ? __pfx_init_module_from_file+0x10/0x10
  [   13.259428]  ? kasan_save_track+0x14/0x30
  [   13.261959]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.264471]  ? kasan_save_free_info+0x3b/0x60
  [   13.267026]  ? poison_slab_object+0x109/0x180
  [   13.269494]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.271949]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.274324]  ? _raw_spin_lock+0x85/0xe0
  [   13.276671]  ? __pfx__raw_spin_lock+0x10/0x10
  [   13.278963]  ? __rseq_handle_notify_resume+0x1a6/0xad0
  [   13.281193]  idempotent_init_module+0x23b/0x650
  [   13.283420]  ? __pfx_idempotent_init_module+0x10/0x10
  [   13.285619]  ? __pfx___seccomp_filter+0x10/0x10
  [   13.287714]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.289828]  ? __fget_light+0x57/0x420
  [   13.291870]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.293880]  ? security_capable+0x74/0xb0
  [   13.295820]  __x64_sys_finit_module+0xbe/0x130
  [   13.297874]  do_syscall_64+0x82/0x190
  [   13.299898]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.301905]  ? irqtime_account_irq+0x3d/0x1f0
  [   13.303877]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.305753]  ? __irq_exit_rcu+0x4e/0x130
  [   13.307577]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.309489]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  [   13.311371] RIP: 0033:0x7a21f96ade9d
  [   13.313234] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 de 0c 00 f7 d8 64 89 01 48
  [   13.317051] RSP: 002b:00007ffeae934e78 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
  [   13.319024] RAX: ffffffffffffffda RBX: 00005987276bfcf0 RCX: 00007a21f=
96ade9d
  [   13.321100] RDX: 0000000000000004 RSI: 00007a21f8eda376 RDI: 000000000=
000001c
  [   13.323314] RBP: 00007a21f8eda376 R08: 0000000000000001 R09: 00007ffea=
e934ec0
  [   13.325505] R10: 0000000000000050 R11: 0000000000000246 R12: 000000000=
0020000
  [   13.327637] R13: 00005987276c1250 R14: 0000000000000000 R15: 000059872=
76c4530
  [   13.329737]  </TASK>

  [   13.333945] Allocated by task 139:
  [   13.336111]  kasan_save_stack+0x30/0x50
  [   13.336121]  kasan_save_track+0x14/0x30
  [   13.336125]  __kasan_kmalloc+0xaa/0xb0
  [   13.336129]  amdtp_hid_probe+0xb1/0x440 [amd_sfh]
  [   13.336138]  amd_sfh_hid_client_init+0xb8a/0x10f0 [amd_sfh]
  [   13.336144]  sfh_init_work+0x47/0x120 [amd_sfh]
  [   13.336150]  process_one_work+0x673/0xeb0
  [   13.336155]  worker_thread+0x795/0x1250
  [   13.336160]  kthread+0x290/0x350
  [   13.336164]  ret_from_fork+0x34/0x70
  [   13.336169]  ret_from_fork_asm+0x1a/0x30

  [   13.338175] Freed by task 139:
  [   13.340064]  kasan_save_stack+0x30/0x50
  [   13.340072]  kasan_save_track+0x14/0x30
  [   13.340076]  kasan_save_free_info+0x3b/0x60
  [   13.340081]  poison_slab_object+0x109/0x180
  [   13.340085]  __kasan_slab_free+0x32/0x50
  [   13.340089]  kfree+0xe5/0x310
  [   13.340094]  amdtp_hid_remove+0xb2/0x160 [amd_sfh]
  [   13.340102]  amd_sfh_hid_client_deinit+0x324/0x640 [amd_sfh]
  [   13.340107]  amd_sfh_hid_client_init+0x94a/0x10f0 [amd_sfh]
  [   13.340113]  sfh_init_work+0x47/0x120 [amd_sfh]
  [   13.340118]  process_one_work+0x673/0xeb0
  [   13.340123]  worker_thread+0x795/0x1250
  [   13.340127]  kthread+0x290/0x350
  [   13.340132]  ret_from_fork+0x34/0x70
  [   13.340136]  ret_from_fork_asm+0x1a/0x30

  [   13.342482] The buggy address belongs to the object at ffff88813152f400
                  which belongs to the cache kmalloc-64 of size 64
  [   13.347357] The buggy address is located 8 bytes inside of
                  freed 64-byte region [ffff88813152f400, ffff88813152f440)

  [   13.347367] The buggy address belongs to the physical page:
  [   13.355409] page: refcount:1 mapcount:0 mapping:0000000000000000 index=
:0x0 pfn:0x13152f
  [   13.355416] anon flags: 0x2ffff8000000000(node=3D0|zone=3D2|lastcpupid=
=3D0x1ffff)
  [   13.355423] page_type: 0xffffefff(slab)
  [   13.355429] raw: 02ffff8000000000 ffff8881000428c0 ffffea0004c43a00 00=
00000000000005
  [   13.355435] raw: 0000000000000000 0000000000200020 00000001ffffefff 00=
00000000000000
  [   13.355439] page dumped because: kasan: bad access detected

  [   13.357295] Memory state around the buggy address:
  [   13.357299]  ffff88813152f300: fa fb fb fb fb fb fb fb fc fc fc fc fc =
fc fc fc
  [   13.357303]  ffff88813152f380: fa fb fb fb fb fb fb fb fc fc fc fc fc =
fc fc fc
  [   13.357306] >ffff88813152f400: fa fb fb fb fb fb fb fb fc fc fc fc fc =
fc fc fc
  [   13.357309]                       ^
  [   13.357311]  ffff88813152f480: 00 00 00 00 00 fc fc fc fc fc fc fc fc =
fc fc fc
  [   13.357315]  ffff88813152f500: 00 00 00 00 00 00 00 06 fc fc fc fc fc =
fc fc fc
  [   13.357318] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [   13.357405] Disabling lock debugging due to kernel taint
  [   13.383534] Oops: general protection fault, probably for non-canonical=
 address 0xe0a1bc4140000013: 0000 [#1] PREEMPT SMP KASAN NOPTI
  [   13.383544] KASAN: maybe wild-memory-access in range [0x050e020a000000=
98-0x050e020a0000009f]
  [   13.383551] CPU: 3 PID: 479 Comm: (udev-worker) Tainted: G    B       =
       6.10.0-arch1-2 #1 893bb55d7f0073f25c46adbb49eb3785fefd74b0
  [   13.383561] Hardware name: LENOVO 21CQCTO1WW/21CQCTO1WW, BIOS R22ET70W=
 (1.40 ) 03/21/2024
  [   13.383565] RIP: 0010:amd_sfh_get_report+0x81/0x530 [amd_sfh]
  [   13.383580] Code: 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 78 03 00 00 48 b=
8 00 00 00 00 00 fc ff df 4c 8b 63 08 49 8d 7c 24 10 48 89 fa 48 c1 ea 03 <=
0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 1a 03 00 00 45 8b 74 24 10 45
  [   13.383585] RSP: 0018:ffff8881261f7388 EFLAGS: 00010212
  [   13.383592] RAX: dffffc0000000000 RBX: ffff88813152f400 RCX: 000000000=
0000002
  [   13.383597] RDX: 00a1c04140000013 RSI: 0000000000000008 RDI: 050e020a0=
000009b
  [   13.383600] RBP: ffff88814d010000 R08: 0000000000000002 R09: fffffbfff=
3ddb8c0
  [   13.383604] R10: ffffffff9eedc607 R11: ffff88810ce98000 R12: 050e020a0=
000008b
  [   13.383607] R13: ffff88814d010000 R14: dffffc0000000000 R15: 000000000=
0000004
  [   13.383611] FS:  00007a21f94d0880(0000) GS:ffff8887e7d80000(0000) knlG=
S:0000000000000000
  [   13.383615] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [   13.383618] CR2: 00007e0014c438f0 CR3: 000000012614c000 CR4: 000000000=
0f50ef0
  [   13.383622] PKRU: 55555554
  [   13.383625] Call Trace:
  [   13.383629]  <TASK>
  [   13.383632]  ? __die_body.cold+0x19/0x27
  [   13.383644]  ? die_addr+0x46/0x70
  [   13.383652]  ? exc_general_protection+0x150/0x240
  [   13.383664]  ? asm_exc_general_protection+0x26/0x30
  [   13.383674]  ? amd_sfh_get_report+0x81/0x530 [amd_sfh 05f43221435b5205=
f734cd9da29399130f398a38]
  [   13.383686]  ? amd_sfh_get_report+0x3ec/0x530 [amd_sfh 05f43221435b520=
5f734cd9da29399130f398a38]
  [   13.383697]  amdtp_hid_request+0xb8/0x110 [amd_sfh 05f43221435b5205f73=
4cd9da29399130f398a38]
  [   13.383706]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.383713]  sensor_hub_get_feature+0x1d3/0x540 [hid_sensor_hub 3f13be=
3016ff415bea03008d45d99da837ee3082]
  [   13.383727]  hid_sensor_parse_common_attributes+0x4d0/0xad0 [hid_senso=
r_iio_common c3a5cbe93969c28b122609768bbe23efe52eb8f5]
  [   13.383739]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.383745]  ? __pfx_hid_sensor_parse_common_attributes+0x10/0x10 [hid=
_sensor_iio_common c3a5cbe93969c28b122609768bbe23efe52eb8f5]
  [   13.383753]  ? _raw_spin_lock_irqsave+0x96/0xf0
  [   13.383762]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  [   13.383768]  ? devm_iio_device_alloc+0x34/0x50 [industrialio 3d261d5e5=
765625d2b052be40e526d62b1d2123b]
  [   13.383790]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.383795]  ? __devm_add_action+0x167/0x1d0
  [   13.383806]  hid_gyro_3d_probe+0x120/0x7f0 [hid_sensor_gyro_3d 63da36a=
143b775846ab2dbb86c343b401b5e3172]
  [   13.383818]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.383826]  platform_probe+0xa2/0x150
  [   13.383832]  really_probe+0x1e3/0x8a0
  [   13.383838]  __driver_probe_device+0x18c/0x370
  [   13.383844]  driver_probe_device+0x4a/0x120
  [   13.383851]  __driver_attach+0x190/0x4a0
  [   13.383857]  ? __pfx___driver_attach+0x10/0x10
  [   13.383863]  bus_for_each_dev+0x106/0x180
  [   13.383868]  ? __pfx__raw_spin_lock+0x10/0x10
  [   13.383874]  ? __pfx_bus_for_each_dev+0x10/0x10
  [   13.383880]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.383887]  bus_add_driver+0x29e/0x4d0
  [   13.383895]  driver_register+0x1a5/0x360
  [   13.383902]  ? __pfx_hid_gyro_3d_platform_driver_init+0x10/0x10 [hid_s=
ensor_gyro_3d 63da36a143b775846ab2dbb86c343b401b5e3172]
  [   13.383910]  do_one_initcall+0xa7/0x380
  [   13.383919]  ? __pfx_do_one_initcall+0x10/0x10
  [   13.383927]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.383933]  ? kasan_unpoison+0x44/0x70
  [   13.383943]  do_init_module+0x238/0x750
  [   13.383955]  load_module+0x5011/0x6af0
  [   13.383962]  ? kasan_save_stack+0x30/0x50
  [   13.383968]  ? kasan_save_track+0x14/0x30
  [   13.383973]  ? kasan_save_free_info+0x3b/0x60
  [   13.383980]  ? poison_slab_object+0x109/0x180
  [   13.383993]  ? __pfx_load_module+0x10/0x10
  [   13.384007]  ? poison_slab_object+0x109/0x180
  [   13.384012]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384018]  ? init_module_from_file+0x13d/0x150
  [   13.384025]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384032]  ? init_module_from_file+0xdf/0x150
  [   13.384037]  init_module_from_file+0xdf/0x150
  [   13.384044]  ? __pfx_init_module_from_file+0x10/0x10
  [   13.384050]  ? kasan_save_track+0x14/0x30
  [   13.384055]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384060]  ? kasan_save_free_info+0x3b/0x60
  [   13.384066]  ? poison_slab_object+0x109/0x180
  [   13.384071]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384080]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384085]  ? _raw_spin_lock+0x85/0xe0
  [   13.384091]  ? __pfx__raw_spin_lock+0x10/0x10
  [   13.384096]  ? __rseq_handle_notify_resume+0x1a6/0xad0
  [   13.384106]  idempotent_init_module+0x23b/0x650
  [   13.384114]  ? __pfx_idempotent_init_module+0x10/0x10
  [   13.384120]  ? __pfx___seccomp_filter+0x10/0x10
  [   13.384129]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384135]  ? __fget_light+0x57/0x420
  [   13.384142]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384147]  ? security_capable+0x74/0xb0
  [   13.384157]  __x64_sys_finit_module+0xbe/0x130
  [   13.384164]  do_syscall_64+0x82/0x190
  [   13.384174]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384179]  ? irqtime_account_irq+0x3d/0x1f0
  [   13.384188]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384193]  ? __irq_exit_rcu+0x4e/0x130
  [   13.384201]  ? srso_alias_return_thunk+0x5/0xfbef5
  [   13.384206]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  [   13.384212] RIP: 0033:0x7a21f96ade9d
  [   13.384263] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 de 0c 00 f7 d8 64 89 01 48
  [   13.384267] RSP: 002b:00007ffeae934e78 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
  [   13.384273] RAX: ffffffffffffffda RBX: 00005987276bfcf0 RCX: 00007a21f=
96ade9d
  [   13.384277] RDX: 0000000000000004 RSI: 00007a21f8eda376 RDI: 000000000=
000001c
  [   13.384280] RBP: 00007a21f8eda376 R08: 0000000000000001 R09: 00007ffea=
e934ec0
  [   13.384284] R10: 0000000000000050 R11: 0000000000000246 R12: 000000000=
0020000
  [   13.384288] R13: 00005987276c1250 R14: 0000000000000000 R15: 000059872=
76c4530
  [   13.384297]  </TASK>
  [   13.384299] Modules linked in: soundwire_amd(+) hid_sensor_gyro_3d(+) =
hid_sensor_magn_3d hid_sensor_accel_3d soundwire_generic_allocation amdxcp =
hid_sensor_trigger drm_exec industrialio_triggered_buffer soundwire_bus gpu=
_sched kvm_amd kfifo_buf qmi_helpers joydev drm_buddy hid_sensor_iio_common=
 mousedev snd_soc_core industrialio i2c_algo_bit mac80211 snd_compress drm_=
suballoc_helper kvm snd_hda_intel drm_ttm_helper ac97_bus snd_pcm_dmaengine=
 snd_intel_dspcfg ttm thinkpad_acpi(+) snd_intel_sdw_acpi hid_sensor_hub sn=
d_rpl_pci_acp6x drm_display_helper snd_hda_codec hid_multitouch libarc4 snd=
_acp_pci platform_profile think_lmi(+) hid_generic firmware_attributes_clas=
s wmi_bmof cec snd_acp_legacy_common sparse_keymap rapl snd_hda_core psmous=
e cfg80211 pcspkr snd_pci_acp6x snd_hwdep video snd_pcm snd_pci_acp5x snd_t=
imer snd_rn_pci_acp3x ucsi_acpi snd_acp_config snd sp5100_tco rfkill snd_so=
c_acpi typec_ucsi thunderbolt amd_sfh k10temp mhi soundcore i2c_piix4 snd_p=
ci_acp3x typec i2c_hid_acpi roles i2c_hid wmi acpi_tad amd_pmc
  [   13.384454]  mac_hid i2c_dev crypto_user loop nfnetlink zram ip_tables=
 x_tables dm_crypt cbc encrypted_keys trusted asn1_encoder tee dm_mod crct1=
0dif_pclmul crc32_pclmul polyval_clmulni polyval_generic gf128mul ghash_clm=
ulni_intel serio_raw sha512_ssse3 atkbd sha256_ssse3 libps2 sha1_ssse3 viva=
ldi_fmap nvme aesni_intel crypto_simd nvme_core cryptd ccp xhci_pci i8042 n=
vme_auth xhci_pci_renesas serio vfat fat btrfs blake2b_generic libcrc32c cr=
c32c_generic crc32c_intel xor raid6_pq
  [   13.384552] ---[ end trace 0000000000000000 ]---

KASAN reports a use-after-free of hid->driver_data in function
amd_sfh_get_report(). The backtrace indicates that the function is called
by amdtp_hid_request() which is one of the callbacks of hid device.
The current make sure that driver_data is freed only once
hid_destroy_device() returned.

Note that I observed the crash both on v6.9.9 and v6.10.0. The
code seems to be as it was from the early days of the driver.

Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hi=
d/amd_sfh_hid.c
index 705b52337068..81f3024b7b1b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -171,11 +171,13 @@ int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_=
data *cli_data)
 void amdtp_hid_remove(struct amdtp_cl_data *cli_data)
 {
 	int i;
+	struct amdtp_hid_data *hid_data;
=20
 	for (i =3D 0; i < cli_data->num_hid_devices; ++i) {
 		if (cli_data->hid_sensor_hubs[i]) {
-			kfree(cli_data->hid_sensor_hubs[i]->driver_data);
+			hid_data =3D cli_data->hid_sensor_hubs[i]->driver_data;
 			hid_destroy_device(cli_data->hid_sensor_hubs[i]);
+			kfree(hid_data);
 			cli_data->hid_sensor_hubs[i] =3D NULL;
 		}
 	}
--=20
2.45.2


