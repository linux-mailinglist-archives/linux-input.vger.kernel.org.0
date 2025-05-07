Return-Path: <linux-input+bounces-12222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6EDAAEE8E
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 00:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD6A27BC586
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 22:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBFB26B2D6;
	Wed,  7 May 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esNjGnOA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0133722F17A;
	Wed,  7 May 2025 22:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656075; cv=none; b=h54unmn/HWWiqEMfq41WPoBHNFHCATQccnnr7P8HWf9ZKNrmd4AFD3yhnW67mgTuZ+UxWICPIiFVPQP01d5vwq51WASSvQA8voX/G7hRHxUai7jLPQ2RAwEj4LMRZIdYbz2iDsqtBFqUhymuZnfwK/5gKFNy5RRo5hYdOQQY+no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656075; c=relaxed/simple;
	bh=hKLdHqvZGZ1rIlZHZz3k/6YuTkWBI9XYvnTnbwL5kBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avYhIiXx6/suXLPWyuOhlu+yeJmmUM0DpjFcSKwaA0Xm8Eq39+tRAfizyN3O0MmO1S0onhO+e6zTI7aDYgJTcQDDziuAxBjAETvyfC4Y/Z4mSh9SyuyHv1MuFOF9hRHygVopCUrSoT8uEfbjSUSHfRUs0y4iY16MCV8IyP2zTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esNjGnOA; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-326b9930730so1525081fa.0;
        Wed, 07 May 2025 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746656071; x=1747260871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzjZ5IbSGObxOJZotgeiIqTB+w7PiI+1UvNtr4ZXbG0=;
        b=esNjGnOAa7QNq4gXGpwa4XM53pKgF+6WHMgsTOiI5KdsrePTZpow+QUsqq9BtzUOyy
         BHuY6MCyVuqXNjo11a0KOjInkgRDcEp4OikhCxeKd7DgiSVXHOSMMFetuXrfkulwzQPA
         4xYa0E6es1knhGVqlUM9N5JRb0QmBZ/Aetw+dZ/2XKKLidHlRVlYOD032gmuC/egwbzV
         KC1YC3LVXUz1Hhg9taK3EK5209+OQwmvZTkIyRUoCsz+ASYxPhrOMF1AYZ43a/vJ8ur5
         vK351RBYZQUhrhZmirvFd5N9PmRpUGYBr7QX0AzPFN/6Q33QluEgnk5S153NBb+su+sU
         JFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746656071; x=1747260871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzjZ5IbSGObxOJZotgeiIqTB+w7PiI+1UvNtr4ZXbG0=;
        b=sSMFEcjwEunkK5ymaqSsn6D72wXbJVjGYWoicO58fgtvrOTqIE9XTfKCz2eFTYv+BE
         ZPUIw8LkY7qH4EsW68JjIZTZ0yCY6Dz5N3QMIlV8hHgMsy8IvxfThBTY6Oc3PN2pAEMt
         b1ugrcsEJnWy4EgLdH4c+Nx6r1JEGwMnrVyFrECuR2DPZXNepXT2PV2iJ9kF44jUsUed
         jHVPYN/S/shYw4kD6PcsIEdc2qHr2IdXQLX9jCiA5+Ew/5X2vd6CWJqwqtvh8H6vVMKb
         LTQ/3Bq050LAv3ZJwy7ewSt+2e0PHgxbp3iRGU9YmIjaNgbj2omyO+Ll4vCVGEy2PAZp
         nExg==
X-Forwarded-Encrypted: i=1; AJvYcCUB3rClWN/zxE/QAoOyQx/I96Ka/GrHJnwuSs7JyOPIDBd3XwsjnP2ujl9sQhyRA5VvSz+ryVbwN6wPwu4k@vger.kernel.org, AJvYcCUFEFQttJ+bB0pHMb1plWetoI8BOvJw73EsxjB7I+QJuKFf977TAPlKNe2EqFOw5KWruQ366aefQD89pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJLqx9y8l8xo6NQPN8fR9bkCI2Z6iabxCHYZoxkUR5XZULk0N4
	akEFgrYDKr2QliggLU+yz6CgXOHCa2sE/620dZj7toUBB4No6Wz0R/dyFtOKl4fugVIqIyzMrM4
	hJEQypB+Sbw0QDO7YblOWUVrkhZlKZfI=
X-Gm-Gg: ASbGncuHzFRJ10CwcoSGio18/lUXYAQVW9cvSa+hrlrKw/P+CJZkBVwqUw2Y8MKeKUl
	RZVEXoSpjRQ7F9MSEc4ezHbdGrDSMBJWY6/VFK5sBecgEq5XI8M6HfEIL0TcK9W9a3z/87bE4Bt
	gD5YXISesLWieNhe/FjAPK+k7kiUzYLuzKZehb
X-Google-Smtp-Source: AGHT+IE/TC7y21tmZDyJzEuCTEOGg6KgFEbMUqBq8yKVAbKKQKpBKCilmM9RBm2cL3uD1YLy+puWD6Dn3fPDYW2lVpY=
X-Received: by 2002:a2e:a9ab:0:b0:300:5c57:526b with SMTP id
 38308e7fff4ca-326ad17d8d1mr18296321fa.11.1746656070707; Wed, 07 May 2025
 15:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220083-6385@https.bugzilla.kernel.org/> <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>
 <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq> <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
In-Reply-To: <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 7 May 2025 18:14:18 -0400
X-Gm-Features: ATxdqUH8Uad1L_ExKp90Ej_L4_iqnhPQpo_BfwId5ei4A_AtX3bLYRlFWXz5qDQ
Message-ID: <CAMzpN2hb7DHX_CEddxdJDzDpNhrPRct3FcnVOBeeFtMqj=cuog@mail.gmail.com>
Subject: Re: [Bug 220083] New: [REGRESSION, BISECTED] x86 ASM changes make
 dispatch_hid_bpf_output_report access not-present page
To: Rong Zhang <i@rong.moe>
Cc: Benjamin Tissoires <bentiss@kernel.org>, bugzilla-daemon@kernel.org, 
	Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 7:06=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Benjamin,
>
> On Tue, 2025-05-06 at 17:35 +0200, Benjamin Tissoires wrote:
> > Hi Boris,
> >
> > On May 06 2025, Borislav Petkov wrote:
> > > Switching to mail.
> > >
> > > Hi Benjamin,
> > >
> > > take a look at the below pls.
> > >
> > > The RIP points to:
> > >
> > >   22:   48 c1 e6 04             shl    $0x4,%rsi
> > >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> > >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- t=
rapping instruction
> > >   2f:   c3                      ret
> > >
> > > which really is a %gs-based access and the reporter has bisected this=
 to
> > >
> > >   9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> > >
> > > which looks related.
> > >
> > > My silly guess would be some bpf program does per-cpu accesses but it=
 doesn't
> > > know about this change so it tramples over registers. I mean, my fix =
would be
> > > to disable BPF but you young kids love to play with that...
> >
> > Heh. Well, I would like to know if any HID-BPF program is loaded first.
> > These can be seen by running `sudo tree /sys/fs/bpf/hid/`.
>
> Nothing is there.

[snip]

>
> In case you need it, I decoded a stacktrace (I've upgraded to 6.15-rc5
> BTW):
>
> [14591.438053] usb 7-1.4.4: USB disconnect, device number 7
> [14591.541666] BUG: unable to handle page fault for address: ffff8efd88e6=
5018
> [14591.541674] #PF: supervisor write access in kernel mode
> [14591.541676] #PF: error_code(0x0002) - not-present page
> [14591.541677] PGD 220801067 P4D 220801067 PUD 0
> [14591.541681] Oops: Oops: 0002 [#1] SMP NOPTI
> [14591.541684] CPU: 0 UID: 0 PID: 56816 Comm: kworker/0:2 Not tainted 6.1=
5.0-rc5 #1 PREEMPT(lazy)  0538d36f9cfa2dbc3c98efb2730490d8b2399dc4
> [14591.541687] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW 03/1=
1/2025
> [14591.541689] Workqueue: events hidinput_led_worker
> [14591.541693] RIP: 0010:__srcu_read_unlock (kernel/rcu/srcutree.c:768 (d=
iscriminator 1))
> [14591.541697] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0=
f 1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 <=
65> 48 ff 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   c3                      ret
>    1:   cc                      int3
>    2:   cc                      int3
>    3:   cc                      int3
>    4:   cc                      int3
>    5:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
>    c:   00 00 00 00
>   10:   f3 0f 1e fa             endbr64
>   14:   0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
>   19:   f0 83 44 24 fc 00       lock addl $0x0,-0x4(%rsp)
>   1f:   48 63 f6                movslq %esi,%rsi
>   22:   48 c1 e6 04             shl    $0x4,%rsi
>   26:   48 03 77 08             add    0x8(%rdi),%rsi
>   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- trapp=
ing instruction
>   2f:   c3                      ret
>   30:   cc                      int3
>   31:   cc                      int3
>   32:   cc                      int3
>   33:   cc                      int3
>   34:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
>   3b:   00 00 00 00
>   3f:   90                      nop
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   65 48 ff 46 08          incq   %gs:0x8(%rsi)
>    5:   c3                      ret
>    6:   cc                      int3
>    7:   cc                      int3
>    8:   cc                      int3
>    9:   cc                      int3
>    a:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
>   11:   00 00 00 00
>   15:   90                      nop
> [14591.541698] RSP: 0018:ffffd0c6094f7d88 EFLAGS: 00010202
> [14591.541700] RAX: 0000000000000000 RBX: ffff8ef67492be08 RCX: 000000000=
0000000
> [14591.541701] RDX: 0000000000000002 RSI: 0000000000000010 RDI: ffff8ef67=
492be38
> [14591.541702] RBP: ffffd0c6094f7df8 R08: 0000000000000000 R09: 00000000f=
ffffffd
> [14591.541703] R10: 0000000000000001 R11: 00000000ffffffff R12: 000000000=
0000000
> [14591.541703] R13: ffff8ef70d8143d0 R14: 0000000000000001 R15: 000000000=
0000000
> [14591.541704] FS:  0000000000000000(0000) GS:ffff8efd88e65000(0000) knlG=
S:0000000000000000
> [14591.541705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [14591.541706] CR2: ffff8efd88e65018 CR3: 00000001d0184000 CR4: 000000000=
0f50ef0
> [14591.541707] PKRU: 55555554
> [14591.541708] Call Trace:
> [14591.541710]  <TASK>
> [14591.541711] dispatch_hid_bpf_output_report (drivers/hid/bpf/hid_bpf_di=
spatch.c:148)
> [14591.541716] hid_hw_output_report (drivers/hid/hid-core.c:2500 drivers/=
hid/hid-core.c:2520)
> [14591.541717] hidinput_led_worker (drivers/hid/hid-input.c:1838)
> [14591.541719] process_one_work (kernel/workqueue.c:3238)
> [14591.541721] worker_thread (kernel/workqueue.c:3313 (discriminator 2) k=
ernel/workqueue.c:3400 (discriminator 2))
> [14591.541723] ? rescuer_thread (kernel/workqueue.c:3346)
> [14591.541724] kthread (kernel/kthread.c:464)
> [14591.541727] ? kthreads_online_cpu (kernel/kthread.c:413)
> [14591.541729] ret_from_fork (arch/x86/kernel/process.c:153)
> [14591.541731] ? kthreads_online_cpu (kernel/kthread.c:413)
> [14591.541733] ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> [14591.541737]  </TASK>
> [14591.541738] Modules linked in: mmc_block rpmb_core udp_diag tcp_diag i=
net_diag xt_mark ccm snd_hrtimer snd_seq_dummy snd_seq_midi snd_seq_oss snd=
_seq_midi_event snd_rawmidi snd_seq snd_seq_device xt_CHECKSUM xt_MASQUERAD=
E xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat=
 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun bridge stp llc nf_ta=
bles qrtr uhid rfcomm cmac algif_hash algif_skcipher af_alg overlay bnep su=
nrpc vfat fat btusb uvcvideo btrtl videobuf2_vmalloc btintel uvc videobuf2_=
memops btbcm videobuf2_v4l2 btmtk videobuf2_common bluetooth videodev mc in=
tel_rapl_msr amd_atl intel_rapl_common snd_acp_legacy_mach snd_acp_mach snd=
_soc_nau8821 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm snd_soc_dmic sn=
d_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_a=
md_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_=
dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match snd_hda_codec_r=
ealtek snd_amd_sdw_acpi soundwire_amd snd_hda_codec_generic
> [14591.541775]  soundwire_generic_allocation snd_hda_scodec_component sou=
ndwire_bus snd_soc_sdca snd_hda_codec_hdmi snd_soc_core mt7925e snd_hda_int=
el snd_compress mt7925_common ac97_bus snd_intel_dspcfg kvm_amd mt792x_lib =
snd_pcm_dmaengine snd_intel_sdw_acpi snd_rpl_pci_acp6x mt76_connac_lib snd_=
hda_codec snd_acp_pci kvm mt76 snd_amd_acpi_mach snd_hda_core snd_acp_legac=
y_common irqbypass think_lmi snd_pci_acp6x snd_hwdep rapl snd_ctl_led pcspk=
r mac80211 snd_pcm_oss firmware_attributes_class lenovo_wmi_hotkey_utilitie=
s snd_mixer_oss snd_pci_acp5x libarc4 snd_pcm wmi_bmof snd_rn_pci_acp3x spd=
5118 snd_timer snd_acp_config cfg80211 snd snd_soc_acpi hid_sensor_als soun=
dcore amdxdna amd_pmf hid_sensor_trigger snd_pci_acp3x k10temp rfkill indus=
trialio_triggered_buffer amdtee kfifo_buf joydev hid_sensor_iio_common ccp =
industrialio mousedev platform_profile amd_pmc mac_hid sch_fq_codel uinput =
i2c_dev parport_pc ppdev lp parport nvme_fabrics nfnetlink ip_tables x_tabl=
es hid_logitech_hidpp hid_logitech_dj usbhid dm_crypt
> [14591.541811]  encrypted_keys trusted asn1_encoder tee dm_mod raid10 rai=
d456 async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0=
 linear md_mod igc ptp pps_core r8153_ecm r8152 cdc_ether usbnet mii amdgpu=
 i2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks polyval_clmulni=
 polyval_generic drm_exec drm_suballoc_helper ghash_clmulni_intel amdxcp sh=
a512_ssse3 drm_buddy sdhci_pci sha256_ssse3 sp5100_tco r8169 nvme sdhci_uhs=
2 gpu_sched sha1_ssse3 serio_raw hid_sensor_custom sdhci nvme_core realtek =
aesni_intel ucsi_acpi atkbd drm_display_helper cqhci libps2 crypto_simd typ=
ec_ucsi hid_multitouch i2c_piix4 nvme_keyring mdio_devres hid_sensor_hub hi=
d_generic thunderbolt vivaldi_fmap cryptd typec cec libphy mmc_core amd_sfh=
 video i8042 nvme_auth i2c_smbus roles i2c_hid_acpi serio wmi i2c_hid
> [14591.541846] CR2: ffff8efd88e65018
> [14591.541848] ---[ end trace 0000000000000000 ]---

So what we have here is a function that takes two parameters: what
looks like an index in RSI, and a pointer to a structure in RDI.
Looking at the register dump, RSI ends up with the value
0000000000000010, which could very likely be an index of 1 shifted and
added to a NULL pointer from the structure.  On the old zero-based
percpu, that would be a valid address, but would corrupt whatever was
there.  So I don't think this is a problem with the bisected commit,
it just exposed an existing bug.


Brian Gerst

