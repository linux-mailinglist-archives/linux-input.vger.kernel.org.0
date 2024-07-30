Return-Path: <linux-input+bounces-5215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC29421E2
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 22:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7321F24F9E
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 20:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A567188003;
	Tue, 30 Jul 2024 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="Apy7UCqw"
X-Original-To: linux-input@vger.kernel.org
Received: from submarine.notk.org (62-210-214-84.rev.poneytelecom.eu [62.210.214.84])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E178A1AA3C3
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722372847; cv=none; b=K0oHLfI0d7SdLn3hH0eR/uimlxt5Eaye28eZNxPNnOcvZHH8ron4RIU+KJ5he6vqroQC+lYOpJDD3vrXFKFan/rRHVaHEM9a5SRESyTOWX55q09iFltq8LuBEncWsTXoLIt+CHumOghM8+nMyjfJgpsLE2uxPYUHgumIBs5ndUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722372847; c=relaxed/simple;
	bh=DfbQbe/0HJhCm0l7QHt3+EL9v7HBLos8Yqv3JrTTL08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xq+DbcUpM0HeC4ljdksNagAmAxFh6uhvtcySeGW+efocSRb+/KYbueFTyCKei7qT4mPE3OQojjEygAzo6kefhN03ZxZVUSsk6C5QT+hJcsTQ24SDE5XRh/UiZnGtF6PgZ5mfcmgJT/7hmjponi2JZd/qWzb7yn7fvb03LiOQiiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=Apy7UCqw; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 7A29F14C2DC;
	Tue, 30 Jul 2024 22:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1722372835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qc/5jgK4xS3OIhoxCJfQw3fkB+WYleGotHOjPrfp+fc=;
	b=Apy7UCqwtVkcyO21KEWscflHXi3pRn0u2k2vYI7CVpyStSBnu+EzmrN4x+ywGKcQW6Pyjj
	Aqfwvj0sDHr3fTyowy1YWPfXh6Bub6AV7M6l5nG7OOCvKcwKTY707MxLfIF0OJSWx45Knm
	ThvT+ESPMeaoGnlUbgkhws8LRRLlTnXv9hqXtHy+UBsnPd5qvCncKnwjHv82BnIJftgKq5
	mYe/dS1LJ8wMbxOIkQDR4wD4gVkWrbE6y2IsU4yWUzW2lR2hYLHXlLLVRUGykYIHsTLSjr
	27s9biOyYqrT5BXGBA9YtR6Gu3BlE6Oh8PtHkV476VccVtsLXb8yMCeLp1hPsw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 5c173803;
	Tue, 30 Jul 2024 20:53:51 +0000 (UTC)
Date: Wed, 31 Jul 2024 05:53:36 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Jiri Kosina <jkosina@suse.cz>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Nehal Shah <nehal-bakulchandra.shah@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	linux-input@vger.kernel.org
Subject: BUG in amd_sfh_get_report
Message-ID: <ZqlS0MWxFDsIj_Sf@codewreck.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just rebooted my server this morning and was greeted by this bug:
--------------
[    9.251535] BUG: unable to handle page fault for address: ffffffff856000=
00
[    9.254214] #PF: supervisor read access in kernel mode
[    9.257295] #PF: error_code(0x0000) - not-present page
[    9.259928] PGD 181a25067 P4D 181a25067 PUD 181a26063 PMD 0=20
[    9.259940] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    9.259945] CPU: 11 PID: 723 Comm: (udev-worker) Tainted: P           O =
      6.6.42 #1-NixOS
[    9.259949] Hardware name:  /Default string, BIOS FP7R2_B5D_04A.45 06/14=
/2023
[    9.259950] RIP: 0010:amd_sfh_get_report+0x43/0x140 [amd_sfh]
[    9.272030] Code: 00 48 8b 68 08 8b 45 10 85 c0 0f 84 d9 00 00 00 49 89 =
fc 41 89 f6 41 89 d7 31 db eb 0d 48 83 c3 01 48 39 c3 0f 84 bf 00 00 00 <4c=
> 39 64 dd 68 75 ec 48 8b 44 24 30 48 33 05 92 d3 c7 c2 be c0 0d
[    9.272037] RSP: 0018:ffffc90000f8fb40 EFLAGS: 00010287
[    9.272041] RAX: 0000000048000000 RBX: 0000000000545c2d RCX: 00000000000=
00000
[    9.272043] RDX: 0000000000000002 RSI: 0000000000000001 RDI: ffff88812ce=
84000
[    9.272045] RBP: ffffffff82bd1e30 R08: ffffc90000f8fbd8 R09: ffffc90000f=
8fbd8
[    9.272046] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88812ce=
84000
[    9.272047] R13: 0000000000000001 R14: 0000000000000001 R15: 00000000000=
00002
[    9.272049] FS:  00007f7175005100(0000) GS:ffff88838ff80000(0000) knlGS:=
0000000000000000
[    9.272050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.272051] CR2: ffffffff85600000 CR3: 0000000117900000 CR4: 0000000000f=
50ee0
[    9.297338] PKRU: 55555554
[    9.297345] Call Trace:
[    9.297353]  <TASK>
[    9.297360]  ? __die+0x23/0x80
[    9.297371]  ? page_fault_oops+0x171/0x500
[    9.297376]  ? srso_alias_return_thunk+0x5/0xfbef5
[    9.297382]  ? srso_alias_return_thunk+0x5/0xfbef5
[    9.297384]  ? search_bpf_extables+0x5f/0x90
[    9.319385]  ? exc_page_fault+0x158/0x160
[    9.319397]  ? asm_exc_page_fault+0x26/0x30
[    9.319403]  ? __pfx_css_release+0x10/0x10
[    9.319417]  ? amd_sfh_get_report+0x43/0x140 [amd_sfh]
[    9.319426]  amdtp_hid_request+0x3e/0x60 [amd_sfh]
[    9.319435]  sensor_hub_get_feature+0xad/0x180 [hid_sensor_hub]
[    9.319448]  hid_sensor_parse_common_attributes+0x217/0x320 [hid_sensor_=
iio_common]
[    9.319457]  hid_accel_3d_probe+0xb7/0x320 [hid_sensor_accel_3d]
[    9.319463]  ? srso_alias_return_thunk+0x5/0xfbef5
[    9.319466]  platform_probe+0x44/0xa0
[    9.319474]  really_probe+0x1ac/0x3f0
[    9.319478]  ? __pfx___driver_attach+0x10/0x10
[    9.319480]  __driver_probe_device+0x78/0x170
[    9.319482]  driver_probe_device+0x1f/0xa0
[    9.319485]  __driver_attach+0xea/0x1e0
[    9.319487]  bus_for_each_dev+0x8c/0xe0
[    9.319493]  bus_add_driver+0x14d/0x280
[    9.319497]  driver_register+0x5d/0x120
[    9.319500]  ? __pfx_hid_accel_3d_platform_driver_init+0x10/0x10 [hid_se=
nsor_accel_3d]
[    9.319504]  do_one_initcall+0x5d/0x330
[    9.319513]  do_init_module+0x90/0x270
[    9.319517]  __do_sys_init_module+0x18a/0x1c0
[    9.319520]  ? srso_alias_return_thunk+0x5/0xfbef5
[    9.319525]  do_syscall_64+0x39/0x90
[    9.319530]  entry_SYSCALL_64_after_hwframe+0x78/0xe2
[    9.319534] RIP: 0033:0x7f7174b1a61e
[    9.319579] Code: 48 8b 0d 0d 68 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 =
2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d da 67 0d 00 f7 d8 64 89 01 48
[    9.319581] RSP: 002b:00007ffda3136658 EFLAGS: 00000246 ORIG_RAX: 000000=
00000000af
[    9.319584] RAX: ffffffffffffffda RBX: 000055a3f7725040 RCX: 00007f7174b=
1a61e
[    9.319585] RDX: 00007f7175181304 RSI: 0000000000007fd0 RDI: 000055a3f77=
3edb0
[    9.319587] RBP: 000055a3f773edb0 R08: 0000000000000000 R09: 00000000000=
00000
[    9.319588] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f71751=
81304
[    9.319589] R13: 0000000000020000 R14: 000055a3f771fa40 R15: 00000000000=
00000
[    9.319593]  </TASK>
[    9.319594] Modules linked in: hid_sensor_gyro_3d hid_sensor_magn_3d snd=
_sof_amd_renoir intel_rapl_msr(+) edac_core nls_iso8859_1 hid_sensor_accel_=
3d(+) snd_sof_amd_acp rtw88_core intel_rapl_common hid_sensor_trigger nls_c=
p437 industrialio_triggered_buffer snd_sof_pci kfifo_buf snd_sof_xtensa_dsp=
 hid_sensor_iio_common vfat industrialio snd_sof fat kvm_amd mac80211 snd_s=
of_utils hid_sensor_hub snd_hda_codec_realtek snd_hda_codec_hdmi kvm snd_hd=
a_codec_generic drm_exec snd_soc_core amdxcp snd_usb_audio drm_buddy irqbyp=
ass snd_compress snd_hda_intel crc32_pclmul eeepc_wmi(-) polyval_clmulni ac=
97_bus snd_intel_dspcfg gpu_sched btusb asus_wmi snd_pcm_dmaengine polyval_=
generic snd_intel_sdw_acpi snd_usbmidi_lib gf128mul drm_suballoc_helper btr=
tl battery snd_pci_ps ghash_clmulni_intel snd_ump drm_ttm_helper snd_hda_co=
dec snd_rpl_pci_acp6x btintel snd_rawmidi ttm btbcm snd_acp_pci ledtrig_aud=
io input_leds sha512_ssse3 snd_seq_device snd_hda_core sparse_keymap btmtk =
evdev wmi_bmof snd_acp_legacy_common sha256_ssse3
[    9.319659]  drm_display_helper mc led_class snd_pci_acp6x snd_hwdep sha=
1_ssse3 cfg80211 mac_hid bluetooth r8169 aesni_intel snd_pcm cec crypto_sim=
d cryptd snd_pci_acp5x i2c_algo_bit sp5100_tco snd_rn_pci_acp3x realtek snd=
_timer tpm_crb snd_acp_config mdio_devres ecdh_generic uas watchdog video s=
nd tpm_tis amd_pmf snd_soc_acpi tiny_power_button rfkill ecc rapl usb_stora=
ge crc16 libphy libarc4 soundcore k10temp amd_sfh(+) i2c_piix4 ccp snd_pci_=
acp3x backlight wmi thermal tpm_tis_core platform_profile button acpi_tad s=
erio_raw zfs(PO+) nfsd spl(O) tun tap auth_rpcgss macvlan nfs_acl lockd bri=
dge grace stp llc fuse sunrpc efi_pstore configfs nfnetlink zram efivarfs t=
pm rng_core dmi_sysfs ip_tables x_tables autofs4 hid_generic sd_mod usbhid =
atkbd libps2 hid vivaldi_fmap ahci libahci libata nvme xhci_pci xhci_pci_re=
nesas nvme_core scsi_mod xhci_hcd nvme_common t10_pi crc64_rocksoft crc64 c=
rc_t10dif crct10dif_generic crct10dif_pclmul scsi_common crct10dif_common r=
tc_cmos i8042 serio dm_mod dax btrfs blake2b_generic
[    9.319743]  libcrc32c crc32c_generic crc32c_intel xor raid6_pq
[    9.319749] CR2: ffffffff85600000
[    9.319752] ---[ end trace 0000000000000000 ]---
[    9.444407] RIP: 0010:amd_sfh_get_report+0x43/0x140 [amd_sfh]
[    9.563701] Code: 00 48 8b 68 08 8b 45 10 85 c0 0f 84 d9 00 00 00 49 89 =
fc 41 89 f6 41 89 d7 31 db eb 0d 48 83 c3 01 48 39 c3 0f 84 bf 00 00 00 <4c=
> 39 64 dd 68 75 ec 48 8b 44 24 30 48 33 05 92 d3 c7 c2 be c0 0d
[    9.563707] RSP: 0018:ffffc90000f8fb40 EFLAGS: 00010287
[    9.563710] RAX: 0000000048000000 RBX: 0000000000545c2d RCX: 00000000000=
00000
[    9.563711] RDX: 0000000000000002 RSI: 0000000000000001 RDI: ffff88812ce=
84000
[    9.563713] RBP: ffffffff82bd1e30 R08: ffffc90000f8fbd8 R09: ffffc90000f=
8fbd8
[    9.563714] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88812ce=
84000
[    9.563715] R13: 0000000000000001 R14: 0000000000000001 R15: 00000000000=
00002
[    9.563716] FS:  00007f7175005100(0000) GS:ffff88838ff80000(0000) knlGS:=
0000000000000000
[    9.594612] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.594617] CR2: ffffffff85600000 CR3: 0000000117900000 CR4: 0000000000f=
50ee0
[    9.594619] PKRU: 55555554
[    9.594622] note: (udev-worker)[723] exited with irqs disabled
------

Thanksfully the system was able to boot but I'm not quite sure if it's
related udev got a thread stuck trying to remove the device (probably
the thread died with some lock held) and everything was very slow;
something else crashed again shortly after so I didn't have time to
investigate the bugged state all that much.

- 6.6.42 kernel from nixos unstable
- CPU identified as AMD Ryzen 7 7735HS with Radeon Graphics in
/proc/cpuinfo
- this card:
05:00.7 Signal processing controller [1180]: Advanced Micro Devices, Inc. [=
AMD] Sensor Fusion Hub [1022:15e4]


I'd offer to test mainline but I cannot reboot this machine easily, and
passing the card to qemu unfortunately didn't reproduce
(amd_sfh_dis_sts_v2() !=3D 0 so it doesn't load, and skipping that check
doesn't help), so I'm afraid I won't be of much help with further
debugging but hopefully it'll give a starting point..

I unfortunately have no way to easily get debug infos but a quick look
at the disassembly hints that amd_sfh_get_report+0x43 is the
access to cli_data->hid_sensor_hubs[i]:
('i++')
     aa6:       48 83 c3 01             add    $0x1,%rbx
('i < cli_data->num_hid_devices' check)
     aaa:       48 39 c3                cmp    %rax,%rbx
     aad:       0f 84 bf 00 00 00       je     b72 <amd_sfh_get_report+0x10=
2>
(amd_sfh_get_report+0x43;
'if (cli_data->hid_sensor_hubs[i] =3D=3D hid) {'
0x68 is the offset of hid_sensor_hubs in struct amdtp_cl_data;
the registers / bug address also match rbp+8*rbx+0x68 =3D ffffffff85600000)
     ab3:       4c 39 64 dd 68          cmp    %r12,0x68(%rbp,%rbx,8)
     ab8:       75 ec                   jne    aa6 <amd_sfh_get_report+0x36>

     ab3:       4c 39 64 dd 68          cmp    %r12,0x68(%rbp,%rbx,8)

So the problem would be that num_hid_device somehow holds 0x48000000 and
that let i run free to way too high values?
I can't fault num_hid_devices init for a given cli_data in
amd_sfh_hid_client_init, but amd_sfh_get_report() might have been called
on something that's not quite valid yet or is in the process of being
removed?...
I'm sorry my previous reboot was a while ago so I can't even tell if
it's reproducible, but the code hasn't changed all that much recently so
this is probably a race condition so that'd explain I hadn't seen this
before...

(... And I honestly have no idea what this driver is all for even after
having looked at the code so I've just blacklisted the module for now,
good luck!)
--=20
Dominique Martinet | Asmadeus

