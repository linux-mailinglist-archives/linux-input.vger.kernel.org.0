Return-Path: <linux-input+bounces-12175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC2AAC9A9
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C8953A61A1
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B42722D790;
	Tue,  6 May 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJUZqpOq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079B281508;
	Tue,  6 May 2025 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746545743; cv=none; b=rvI0lKT3N63t8LP300WcR2ThRjXuJRVABTqKcvYfLePgAdPy6JZK+w1mi7qxHJZkvMG7YvsoVu+vl846blpufxGX2Wp4ThdYRhAvujsdeIV3xbJ8sdpauZ0xgDtnGj0jPCmC8w+64Cuhc0FI+NlOahX6CYgNt8+wJV/GfrVbpxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746545743; c=relaxed/simple;
	bh=T4/pWCblJskd7Jmu5UAJOdQ/baJypxFkJ0hKNpiUEHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+mUfmMWsEjhbzSNLf9Ea6jBKjUHUk1S04zV+DkvrhvfTC3COipO+hmmg/6jH/q5HwcXAoGIcLxRpxux8e64+AlBdM8mUwPX49pIrsIeF0G3y+dLtvkjoPPo/nUWDDjgg3IjC+sgXDCq1JeQ00IlUN/qFra7eWCTEj3VAGmZ87E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJUZqpOq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CCEC4CEE4;
	Tue,  6 May 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746545742;
	bh=T4/pWCblJskd7Jmu5UAJOdQ/baJypxFkJ0hKNpiUEHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJUZqpOq3DDXz1s4Rwc0w8rl3IDe9A5+6iPGZ8DtnCib9KZPURAH6L5nP2ZCsy4bE
	 ECfSMaFl+K1mnFdKqNCa9xWYbe5nJBVZnrxLom9tcDn5qoGIHPR9rf/xdWIxzIeRiL
	 e/8p8FTbUg8dRv8qMunZdUngWPrqP6hyc68VQuQcR5P+l4QRT7M8OOF0kyGfYWo7Yn
	 HFHmP3E65/YPRlZWg71OFjiENqnTWGlxbEhRVhs/0EeStC178tihE0eFNk5jLqYraW
	 UxDAniTqp8zBFwI8gsPkFoTftxWrerKPE2CRwZ9ssNlAKh5R60Jpew6YHL2h+wybd2
	 Dx+VXOLDy8dQg==
Date: Tue, 6 May 2025 17:35:38 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: bugzilla-daemon@kernel.org, i@rong.moe, Jiri Kosina <jikos@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Bug 220083] New: [REGRESSION, BISECTED] x86 ASM changes make
 dispatch_hid_bpf_output_report access not-present page
Message-ID: <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq>
References: <bug-220083-6385@https.bugzilla.kernel.org/>
 <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>

Hi Boris,

On May 06 2025, Borislav Petkov wrote:
> Switching to mail.
> 
> Hi Benjamin,
> 
> take a look at the below pls.
> 
> The RIP points to:
> 
>   22:   48 c1 e6 04             shl    $0x4,%rsi
>   26:   48 03 77 08             add    0x8(%rdi),%rsi
>   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- trapping instruction
>   2f:   c3                      ret
> 
> which really is a %gs-based access and the reporter has bisected this to
> 
>   9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> 
> which looks related.
> 
> My silly guess would be some bpf program does per-cpu accesses but it doesn't
> know about this change so it tramples over registers. I mean, my fix would be
> to disable BPF but you young kids love to play with that...

Heh. Well, I would like to know if any HID-BPF program is loaded first.
These can be seen by running `sudo tree /sys/fs/bpf/hid/`.
`sudo bpftool prog` is another option in case udev-hid-bpf is not used.

If there is no hid-bpf program loaded, then it seems the code path in
drivers/hid/bpf/hid_bpf_dispatch.c:133 is:

```
	idx = srcu_read_lock(&hdev->bpf.srcu);
	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
				 srcu_read_lock_held(&hdev->bpf.srcu)) {
		// nothing happens here because the list is empty
	}
	ret = 0;

out:
	srcu_read_unlock(&hdev->bpf.srcu, idx);
```

So we are just in srcu_read_lock()/srcu_read_unlock() which is unlikely
to fail...

However, the fact that this happens in an unplug event makes me think
that there may be a race here at play.

Another option is that I completely missed the use of srcu, but it was
working fine previously, so I have no ideas :)

Anyway, we need to wait for the reporter to tell us if there were any
HID-BPF program first because this will likely give us a hint on where
the issue is.

Cheers,
Benjamin

> 
> :-)
> 
> Thx.
> 
> On Sat, May 03, 2025 at 06:40:41PM +0000, bugzilla-daemon@kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=220083
> > 
> >             Bug ID: 220083
> >            Summary: [REGRESSION, BISECTED] x86 ASM changes make
> >                     dispatch_hid_bpf_output_report access not-present page
> >            Product: Platform Specific/Hardware
> >            Version: 2.5
> >           Hardware: All
> >                 OS: Linux
> >             Status: NEW
> >           Severity: high
> >           Priority: P3
> >          Component: x86-64
> >           Assignee: platform_x86_64@kernel-bugs.osdl.org
> >           Reporter: i@rong.moe
> >         Regression: No
> > 
> > After upgrading from 6.14.x to 6.15-rc3, not-present page PF occurs each time I
> > unplug any of my Logitech Unifying receivers.
> > 
> > Upgrading to 6.15-rc4 did not fix the issue.
> > 
> > dmesg:
> > ```
> > [   48.726588] usb 7-1.4: USB disconnect, device number 7
> > [   48.856531] BUG: unable to handle page fault for address: ffff8a510ee72018
> > [   48.856543] #PF: supervisor write access in kernel mode
> > [   48.856547] #PF: error_code(0x0002) - not-present page
> > [   48.856550] PGD 365c01067 P4D 365c01067 PUD 0
> > [   48.856558] Oops: Oops: 0002 [#1] SMP NOPTI
> > [   48.856566] CPU: 0 UID: 0 PID: 7237 Comm: kworker/0:3 Tainted: G     U      
> >        6.15.0-rc4 #1 PREEMPT(lazy)  b3a8ad1950c71c15317e5ea614db6e274ecb0913
> > [   48.856574] Tainted: [U]=USER
> > [   48.856577] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW 03/11/2025
> > [   48.856579] Workqueue: events hidinput_led_worker
> > [   48.856589] RIP: 0010:__srcu_read_unlock+0x1a/0x30
> > [   48.856595] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e
> > fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 <65> 48 ff
> > 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> > [   48.856598] RSP: 0018:ffffd037cc29fd88 EFLAGS: 00010202
> > [   48.856602] RAX: 0000000000000000 RBX: ffff8a4c6b16fe08 RCX:
> > 0000000000000000
> > [   48.856604] RDX: 0000000000000002 RSI: 0000000000000010 RDI:
> > ffff8a4c6b16fe38
> > [   48.856606] RBP: ffffd037cc29fdf8 R08: 0000000000000000 R09:
> > 00000000fffffffd
> > [   48.856607] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > 0000000000000000
> > [   48.856609] R13: ffff8a4ac182dbc0 R14: 0000000000000001 R15:
> > 0000000000000000
> > [   48.856611] FS:  0000000000000000(0000) GS:ffff8a510ee72000(0000)
> > knlGS:0000000000000000
> > [   48.856613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   48.856614] CR2: ffff8a510ee72018 CR3: 0000000364c24000 CR4:
> > 0000000000f50ef0
> > [   48.856617] PKRU: 55555554
> > [   48.856618] Call Trace:
> > [   48.856621]  <TASK>
> > [   48.856623]  dispatch_hid_bpf_output_report+0xc5/0x100
> > [   48.856631]  hid_hw_output_report+0x46/0x90
> > [   48.856635]  hidinput_led_worker+0xa9/0xe0
> > [   48.856640]  process_one_work+0x18f/0x350
> > [   48.856646]  worker_thread+0x2d3/0x400
> > [   48.856650]  ? rescuer_thread+0x550/0x550
> > [   48.856654]  kthread+0xf9/0x240
> > [   48.856657]  ? kthreads_online_cpu+0x120/0x120
> > [   48.856661]  ret_from_fork+0x31/0x50
> > [   48.856665]  ? kthreads_online_cpu+0x120/0x120
> > [   48.856668]  ret_from_fork_asm+0x11/0x20
> > [   48.856674]  </TASK>
> > [   48.856675] Modules linked in: xt_mark tcp_diag inet_diag snd_hrtimer
> > snd_seq_dummy snd_seq_midi snd_seq_oss snd_seq_midi_event snd_seq uhid rfcomm
> > cmac algif_hash algif_skcipher af_alg xt_CHECKSUM xt_MASQUERADE xt_conntrack
> > ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat
> > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun snd_usb_audio snd_usbmidi_lib
> > snd_ump snd_rawmidi snd_seq_device bridge stp llc nf_tables qrtr bnep overlay
> > sunrpc vfat fat uvcvideo videobuf2_vmalloc uvc videobuf2_memops videobuf2_v4l2
> > videobuf2_common btusb videodev btrtl btintel mc btbcm btmtk bluetooth amd_atl
> > intel_rapl_msr intel_rapl_common snd_acp_legacy_mach snd_acp_mach
> > snd_soc_nau8821 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm snd_soc_dmic
> > snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh
> > snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci
> > snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match
> > snd_amd_sdw_acpi soundwire_amd snd_hda_codec_realtek
> > [   48.856732]  soundwire_generic_allocation soundwire_bus
> > snd_hda_codec_generic snd_soc_sdca snd_hda_scodec_component snd_hda_codec_hdmi
> > snd_soc_core mt7925e snd_compress mt7925_common snd_hda_intel ac97_bus
> > mt792x_lib snd_intel_dspcfg snd_pcm_dmaengine mt76_connac_lib
> > snd_intel_sdw_acpi snd_rpl_pci_acp6x kvm_amd mt76 snd_hda_codec snd_acp_pci
> > think_lmi snd_amd_acpi_mach kvm snd_hda_core snd_acp_legacy_common
> > snd_pci_acp6x snd_hwdep mac80211 snd_pcm_oss snd_mixer_oss irqbypass
> > snd_pci_acp5x snd_ctl_led snd_pcm libarc4 rapl pcspkr firmware_attributes_class
> > snd_timer lenovo_wmi_hotkey_utilities snd_rn_pci_acp3x wmi_bmof cfg80211
> > snd_acp_config snd snd_soc_acpi k10temp hid_sensor_als spd5118 amdxdna amd_pmf
> > snd_pci_acp3x rfkill soundcore hid_sensor_trigger industrialio_triggered_buffer
> > amdtee kfifo_buf joydev hid_sensor_iio_common ccp industrialio amd_pmc
> > platform_profile mousedev mac_hid sch_fq_codel uinput i2c_dev parport_pc ppdev
> > lp parport nvme_fabrics nfnetlink ip_tables x_tables dm_crypt encrypted_keys
> > trusted
> > [   48.856786]  asn1_encoder tee dm_mod raid10 raid456 async_raid6_recov
> > async_memcpy async_pq async_xor async_tx raid1 raid0 linear md_mod igc ptp
> > pps_core uas usb_storage hid_logitech_hidpp r8153_ecm cdc_ether usbnet
> > hid_logitech_dj r8152 mii usbhid amdgpu i2c_algo_bit drm_ttm_helper ttm
> > drm_panel_backlight_quirks polyval_clmulni polyval_generic drm_exec
> > ghash_clmulni_intel drm_suballoc_helper amdxcp sha512_ssse3 sdhci_pci drm_buddy
> > sha256_ssse3 thunderbolt hid_sensor_custom r8169 sha1_ssse3 serio_raw
> > sp5100_tco sdhci_uhs2 gpu_sched nvme sdhci hid_multitouch realtek
> > hid_sensor_hub aesni_intel atkbd ucsi_acpi drm_display_helper hid_generic
> > nvme_core cqhci crypto_simd mdio_devres libps2 video typec_ucsi i2c_piix4
> > vivaldi_fmap cryptd nvme_keyring typec libphy mmc_core i2c_smbus i8042 cec
> > i2c_hid_acpi amd_sfh nvme_auth roles wmi serio i2c_hid
> > [   48.856843] CR2: ffff8a510ee72018
> > [   48.856846] ---[ end trace 0000000000000000 ]---
> > [   50.304586] RIP: 0010:__srcu_read_unlock+0x1a/0x30
> > [   50.304601] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e
> > fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 <65> 48 ff
> > 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> > [   50.304603] RSP: 0018:ffffd037cc29fd88 EFLAGS: 00010202
> > [   50.304606] RAX: 0000000000000000 RBX: ffff8a4c6b16fe08 RCX:
> > 0000000000000000
> > [   50.304607] RDX: 0000000000000002 RSI: 0000000000000010 RDI:
> > ffff8a4c6b16fe38
> > [   50.304608] RBP: ffffd037cc29fdf8 R08: 0000000000000000 R09:
> > 00000000fffffffd
> > [   50.304609] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > 0000000000000000
> > [   50.304610] R13: ffff8a4ac182dbc0 R14: 0000000000000001 R15:
> > 0000000000000000
> > [   50.304611] FS:  0000000000000000(0000) GS:ffff8a510ee72000(0000)
> > knlGS:0000000000000000
> > [   50.304612] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   50.304613] CR2: ffff8a510ee72018 CR3: 0000000121904000 CR4:
> > 0000000000f50ef0
> > [   50.304615] PKRU: 55555554
> > [   50.304616] note: kworker/0:3[7237] exited with irqs disabled
> > ```
> > 
> > Bisect log:
> > 
> > ```
> > # good: [38fec10eb60d687e30c8c6b5420d86e8149f7557] Linux 6.14
> > git bisect good 38fec10eb60d687e30c8c6b5420d86e8149f7557
> > # bad: [9c32cda43eb78f78c73aee4aa344b777714e259b] Linux 6.15-rc3
> > git bisect bad 9c32cda43eb78f78c73aee4aa344b777714e259b
> > # bad: [4a4b30ea80d8cb5e8c4c62bb86201f4ea0d9b030] Merge tag
> > 'bcachefs-2025-03-24' of git://evilpiepirate.org/bcachefs
> > git bisect bad 4a4b30ea80d8cb5e8c4c62bb86201f4ea0d9b030
> > # bad: [1e1ba8d23dae91e6a9cfeb1236b02749e8a49ab3] Merge tag
> > 'timers-clocksource-2025-03-26' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect bad 1e1ba8d23dae91e6a9cfeb1236b02749e8a49ab3
> > # skip: [21e0ff5b10ec1b61fda435d42db4ba80d0cdfded] Merge tag 'acpi-6.15-rc1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> > git bisect skip 21e0ff5b10ec1b61fda435d42db4ba80d0cdfded
> > # good: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC control get and
> > put handlers
> > git bisect good 47c4f9b1722fd883c9745d7877cb212e41dd2715
> > # bad: [2899aa3973efa3b0a7005cb7fb60475ea0c3b8a0] Merge tag
> > 'x86_cache_for_v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect bad 2899aa3973efa3b0a7005cb7fb60475ea0c3b8a0
> > # good: [5a658afd468b0fb55bf5f45c9788ee8dc87ba463] Merge tag
> > 'objtool-core-2025-03-22' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect good 5a658afd468b0fb55bf5f45c9788ee8dc87ba463
> > # bad: [a49a879f0ac19ed0a562e220019741857b261551] Merge tag
> > 'x86-cleanups-2025-03-22' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect bad a49a879f0ac19ed0a562e220019741857b261551
> > # bad: [9a93e29f16bbba90a63faad0abbc6dea3b2f0c63] x86/syscall: Move
> > sys_ni_syscall()
> > git bisect bad 9a93e29f16bbba90a63faad0abbc6dea3b2f0c63
> > # bad: [cfdaa618defc5ebe1ee6aa5bd40a7ccedffca6de] Merge branch 'x86/cpu' into
> > x86/asm, to pick up dependent commits
> > git bisect bad cfdaa618defc5ebe1ee6aa5bd40a7ccedffca6de
> > # good: [c4a8b7116b9927f7b00bd68140e285662a03068e] perf/x86/intel: Use cache
> > cpu-type for hybrid PMU selection
> > git bisect good c4a8b7116b9927f7b00bd68140e285662a03068e
> > # good: [4f2a0b765c9731d2fa94e209ee9ae0e96b280f17] <linux/sizes.h>: Cover all
> > possible x86 CPU cache sizes
> > git bisect good 4f2a0b765c9731d2fa94e209ee9ae0e96b280f17
> > # bad: [95b0916118106054e1f3d5d7f8628ef3dc0b3c02] percpu: Remove
> > PER_CPU_FIRST_SECTION
> > git bisect bad 95b0916118106054e1f3d5d7f8628ef3dc0b3c02
> > # skip: [78c4374ef8b842c6abf195d6f963853c7ec464d2] x86/module: Deal with GOT
> > based stack cookie load on Clang < 17
> > git bisect skip 78c4374ef8b842c6abf195d6f963853c7ec464d2
> > # bad: [b5c4f95351a097a635c1a7fc8d9efa18308491b5] x86/percpu/64: Remove
> > fixed_percpu_data
> > git bisect bad b5c4f95351a097a635c1a7fc8d9efa18308491b5
> > # skip: [cb7927fda002ca49ae62e2782c1692acc7b80c67] x86/relocs: Handle
> > R_X86_64_REX_GOTPCRELX relocations
> > git bisect skip cb7927fda002ca49ae62e2782c1692acc7b80c67
> > # skip: [80d47defddc000271502057ebd7efa4fd6481542] x86/stackprotector/64:
> > Convert to normal per-CPU variable
> > git bisect skip 80d47defddc000271502057ebd7efa4fd6481542
> > # skip: [f58b63857ae38b4484185b799a2759274b930c92] x86/pvh: Use
> > fixed_percpu_data for early boot GSBASE
> > git bisect skip f58b63857ae38b4484185b799a2759274b930c92
> > # good: [0ee2689b9374d6fd5f43b703713a532278654749] x86/stackprotector: Remove
> > stack protector test scripts
> > git bisect good 0ee2689b9374d6fd5f43b703713a532278654749
> > # bad: [9d7de2aa8b41407bc96d89a80dc1fd637d389d42] x86/percpu/64: Use relative
> > percpu offsets
> > git bisect bad 9d7de2aa8b41407bc96d89a80dc1fd637d389d42
> > # good: [a9a76b38aaf577887103e3ebb41d70e6aa5a4b19] x86/boot: Disable stack
> > protector for early boot code
> > git bisect good a9a76b38aaf577887103e3ebb41d70e6aa5a4b19
> > # only skipped commits left to test
> > # possible first bad commit: [9d7de2aa8b41407bc96d89a80dc1fd637d389d42]
> > x86/percpu/64: Use relative percpu offsets
> > # possible first bad commit: [80d47defddc000271502057ebd7efa4fd6481542]
> > x86/stackprotector/64: Convert to normal per-CPU variable
> > # possible first bad commit: [78c4374ef8b842c6abf195d6f963853c7ec464d2]
> > x86/module: Deal with GOT based stack cookie load on Clang < 17
> > # possible first bad commit: [cb7927fda002ca49ae62e2782c1692acc7b80c67]
> > x86/relocs: Handle R_X86_64_REX_GOTPCRELX relocations
> > # possible first bad commit: [f58b63857ae38b4484185b799a2759274b930c92]
> > x86/pvh: Use fixed_percpu_data for early boot GSBASE
> > ```
> > 
> > There is a typo in commit f58b63857ae3 ("x86/pvh: Use fixed_percpu_data for
> > early boot GSBASE"), resulting in compilation failure.
> > With the patch below, I bisected again:
> > 
> > ```
> > diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> > index 723f181b222a..f1a8392a4835 100644
> > --- a/arch/x86/platform/pvh/head.S
> > +++ b/arch/x86/platform/pvh/head.S
> > @@ -180,7 +180,7 @@ SYM_CODE_START(pvh_start_xen)
> >          */
> >         movl $MSR_GS_BASE,%ecx
> >         leaq INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
> > -       movq %edx, %eax
> > +       movl %edx, %eax
> >         shrq $32, %rdx
> >         wrmsr
> > ```
> > 
> > New bisect log:
> > 
> > ```
> > [...]
> > # good: [a9a76b38aaf577887103e3ebb41d70e6aa5a4b19] x86/boot: Disable stack
> > protector for early boot code
> > git bisect good a9a76b38aaf577887103e3ebb41d70e6aa5a4b19
> > # good: [78c4374ef8b842c6abf195d6f963853c7ec464d2] x86/module: Deal with GOT
> > based stack cookie load on Clang < 17
> > git bisect good 78c4374ef8b842c6abf195d6f963853c7ec464d2
> > # good: [80d47defddc000271502057ebd7efa4fd6481542] x86/stackprotector/64:
> > Convert to normal per-CPU variable
> > git bisect good 80d47defddc000271502057ebd7efa4fd6481542
> > # first bad commit: [9d7de2aa8b41407bc96d89a80dc1fd637d389d42] x86/percpu/64:
> > Use relative percpu offsets
> > ```
> > 
> > The bad commit 9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> > first appeared in v6.15-rc1.
> > 
> > Got dmesg below by building and booting the bad commit, then unplugging the
> > receiver:
> > 
> > ```
> > [  560.223095] BUG: unable to handle page fault for address: ffff9acf2b889008
> > [  560.223174] #PF: supervisor write access in kernel mode
> > [  560.223299] #PF: error_code(0x0002) - not-present page
> > [  560.223332] PGD 43e401067 P4D 43e401067 PUD 0
> > [  560.223353] Oops: Oops: 0002 [#1] PREEMPT SMP NOPTI
> > [  560.223359] CPU: 0 UID: 0 PID: 8212 Comm: kworker/0:3 Tainted: G     U      
> >       6.14.0-rc3+ #1 ab962f3b7921227b62db2503d8ec7411fa694628
> > [  560.223364] Tainted: [U]=USER
> > [  560.223369] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW 03/11/2025
> > [  560.223378] Workqueue: events hidinput_led_worker
> > [  560.223382] RIP: 0010:__srcu_read_lock+0x14/0x30
> > [  560.223387] Code: 0f 0b eb bc 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00
> > 00 00 00 f3 0f 1e fa 0f 1f 44 00 00 8b 07 48 8b 57 08 83 e0 01 89 c1 <65> 48 ff
> > 04 ca f0 83 44 24 fc 00 c3 cc cc cc cc 66 66 2e 0f 1f 84
> > [  560.223392] RSP: 0018:ffffb7df8d24fd88 EFLAGS: 00010202
> > [  560.223396] RAX: 0000000000000001 RBX: ffff9ac82f80de08 RCX:
> > 0000000000000001
> > [  560.223401] RDX: 0000000000000000 RSI: ffff9ac8fd276f40 RDI:
> > ffff9ac82f80de38
> > [  560.223407] RBP: ffffb7df8d24fdf8 R08: 0000000000000000 R09:
> > 00000000fffffffd
> > [  560.223412] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > 0000000000000000
> > [  560.223417] R13: ffff9ac8fd276f40 R14: 000000000000000e R15:
> > 0000000000000000
> > [  560.223421] FS:  0000000000000000(0000) GS:ffff9acf2b889000(0000)
> > knlGS:0000000000000000
> > [  560.223426] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  560.223430] CR2: ffff9acf2b889008 CR3: 00000001e1c40000 CR4:
> > 0000000000f50ef0
> > [  560.223434] PKRU: 55555554
> > [  560.223439] Call Trace:
> > [  560.223444]  <TASK>
> > [  560.223449]  ? __die_body.cold+0x19/0x29
> > [  560.223453]  ? page_fault_oops+0x15a/0x2e0
> > [  560.223458]  ? search_bpf_extables+0x5f/0x80
> > [  560.223462]  ? exc_page_fault+0x1a3/0x1b0
> > [  560.223466]  ? asm_exc_page_fault+0x26/0x30
> > [  560.223471]  ? __srcu_read_lock+0x14/0x30
> > [  560.223475]  ? psi_task_switch+0xb7/0x200
> > [  560.223480]  dispatch_hid_bpf_output_report+0x73/0x100
> > [  560.223485]  hid_hw_output_report+0x46/0x90
> > [  560.223490]  hidinput_led_worker+0xa9/0xe0
> > [  560.223494]  process_one_work+0x17b/0x330
> > [  560.223498]  worker_thread+0x2ce/0x3f0
> > [  560.223503]  ? rescuer_thread+0x530/0x530
> > [  560.223507]  kthread+0xeb/0x230
> > [  560.223512]  ? kthreads_online_cpu+0x120/0x120
> > [  560.223516]  ret_from_fork+0x31/0x50
> > [  560.223522]  ? kthreads_online_cpu+0x120/0x120
> > [  560.223528]  ret_from_fork_asm+0x11/0x20
> > [  560.223532]  </TASK>
> > [  560.223538] Modules linked in: tcp_diag inet_diag xt_mark snd_hrtimer
> > snd_seq_dummy snd_seq_midi snd_seq_oss snd_seq_midi_event snd_seq uhid rfcomm
> > cmac algif_hash algif_skcipher af_alg xt_CHECKSUM xt_MASQUERADE xt_conntrack
> > ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat
> > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun bridge stp llc nf_tables
> > snd_usb_audio snd_usbmidi_lib snd_ump snd_rawmidi snd_seq_device qrtr bnep
> > overlay sunrpc vfat fat uvcvideo videobuf2_vmalloc uvc videobuf2_memops btusb
> > videobuf2_v4l2 btrtl videobuf2_common btintel btbcm videodev btmtk mc bluetooth
> > snd_acp_legacy_mach snd_acp_mach snd_soc_nau8821 snd_acp3x_rn snd_acp70
> > snd_acp_i2s snd_acp_pdm snd_soc_dmic snd_acp_pcm snd_sof_amd_acp70
> > snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir
> > snd_sof_amd_acp intel_rapl_msr amd_atl snd_sof_pci intel_rapl_common
> > snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match
> > snd_amd_sdw_acpi soundwire_amd soundwire_generic_allocation snd_ctl_led
> > [  560.223612]  soundwire_bus snd_soc_sdca snd_hda_codec_realtek
> > snd_hda_codec_generic snd_soc_core mt7925e snd_hda_scodec_component
> > mt7925_common snd_compress mt792x_lib snd_hda_codec_hdmi ac97_bus snd_hda_intel
> > mt76_connac_lib snd_pcm_dmaengine snd_intel_dspcfg mt76 snd_rpl_pci_acp6x
> > snd_intel_sdw_acpi snd_hda_codec kvm_amd snd_acp_pci think_lmi snd_hda_core
> > snd_acp_legacy_common mac80211 kvm snd_pci_acp6x snd_hwdep snd_pcm_oss
> > snd_mixer_oss snd_pci_acp5x libarc4 amd_pmf rapl pcspkr
> > firmware_attributes_class wmi_bmof hid_sensor_als amdtee snd_pcm
> > hid_sensor_trigger snd_rn_pci_acp3x cfg80211 industrialio_triggered_buffer
> > snd_timer joydev snd_acp_config kfifo_buf spd5118 snd snd_soc_acpi
> > hid_sensor_iio_common ccp soundcore snd_pci_acp3x rfkill platform_profile
> > amdxdna k10temp industrialio amd_pmc mousedev mac_hid sch_fq_codel uinput
> > i2c_dev parport_pc ppdev lp parport nvme_fabrics nvme_keyring nfnetlink
> > ip_tables x_tables dm_crypt encrypted_keys trusted asn1_encoder tee dm_mod
> > raid10 raid456 async_raid6_recov
> > [  560.223631]  async_memcpy async_pq async_xor async_tx raid1 raid0 linear
> > md_mod igc ptp pps_core uas usb_storage hid_logitech_hidpp r8153_ecm cdc_ether
> > usbnet hid_logitech_dj r8152 mii usbhid amdgpu i2c_algo_bit drm_ttm_helper ttm
> > drm_panel_backlight_quirks polyval_clmulni drm_exec polyval_generic
> > ghash_clmulni_intel drm_suballoc_helper sha512_ssse3 amdxcp hid_sensor_custom
> > serio_raw sha256_ssse3 drm_buddy sdhci_pci ucsi_acpi atkbd nvme hid_multitouch
> > r8169 sha1_ssse3 sp5100_tco hid_sensor_hub typec_ucsi libps2 gpu_sched
> > sdhci_uhs2 vivaldi_fmap aesni_intel nvme_core sdhci hid_generic realtek typec
> > drm_display_helper video i8042 crypto_simd i2c_piix4 mdio_devres cqhci cryptd
> > thunderbolt mmc_core libphy cec amd_sfh nvme_auth roles i2c_smbus serio
> > i2c_hid_acpi wmi i2c_hid
> > [  560.223646] CR2: ffff9acf2b889008
> > [  560.223650] ---[ end trace 0000000000000000 ]---
> > [  560.223655] RIP: 0010:__srcu_read_lock+0x14/0x30
> > [  560.223660] Code: 0f 0b eb bc 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00
> > 00 00 00 f3 0f 1e fa 0f 1f 44 00 00 8b 07 48 8b 57 08 83 e0 01 89 c1 <65> 48 ff
> > 04 ca f0 83 44 24 fc 00 c3 cc cc cc cc 66 66 2e 0f 1f 84
> > [  560.223664] RSP: 0018:ffffb7df8d24fd88 EFLAGS: 00010202
> > [  560.223670] RAX: 0000000000000001 RBX: ffff9ac82f80de08 RCX:
> > 0000000000000001
> > [  560.223674] RDX: 0000000000000000 RSI: ffff9ac8fd276f40 RDI:
> > ffff9ac82f80de38
> > [  560.223679] RBP: ffffb7df8d24fdf8 R08: 0000000000000000 R09:
> > 00000000fffffffd
> > [  560.223683] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > 0000000000000000
> > [  560.223687] R13: ffff9ac8fd276f40 R14: 000000000000000e R15:
> > 0000000000000000
> > [  560.223692] FS:  0000000000000000(0000) GS:ffff9acf2b889000(0000)
> > knlGS:0000000000000000
> > [  560.223696] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  560.223700] CR2: ffff9acf2b889008 CR3: 00000001e1c40000 CR4:
> > 0000000000f50ef0
> > [  560.223704] PKRU: 55555554
> > [  560.223709] note: kworker/0:3[8212] exited with irqs disabled
> > ```
> > 
> > -- 
> > You may reply to this email to add a comment.
> > 
> > You are receiving this mail because:
> > You are watching the assignee of the bug.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

