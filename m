Return-Path: <linux-input+bounces-5109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A757793842B
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2024 11:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40538281339
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2024 09:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F44EC2C8;
	Sun, 21 Jul 2024 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hixontech.com header.i=linux-kernel-bugs@hixontech.com header.b="hKkxH5kS"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4769A9460;
	Sun, 21 Jul 2024 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721553203; cv=pass; b=HkulAHLX3EP1giThCbMHWWjuWDVpQ667/DqmDjDLYvAZ10M1fOym8hQ2XJwbVP7yDBsuxy9vhsIa2tk9SsEVepB53ga831XzxVv8Djk0hhSAcsWSUJRTucdKbtkfakJm13foPKMuL33YaTQbBIDx374THDHaikqV6yQIcoju7E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721553203; c=relaxed/simple;
	bh=ln86F7EszCjPNEpqM33jiMnRwlnqAWaUCdwr53KPB7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cba945M2JhQADcc3PInhx6am6OEes4mk/Glnxa9Vo2J5kPwIvkonM1MgCn5fdwUoOH2R4xZ8nLegIHSpyR7KAH4VIKKfhpqhIWevH+XFU9ubwdyQRcszshZA9K7pmgBGMImPk02TslKdaEqvEZ93xPxOubY5/DRwBwlNJT2eP/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hixontech.com; spf=pass smtp.mailfrom=hixontech.com; dkim=pass (1024-bit key) header.d=hixontech.com header.i=linux-kernel-bugs@hixontech.com header.b=hKkxH5kS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hixontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hixontech.com
ARC-Seal: i=1; a=rsa-sha256; t=1721553187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J//PMDQFQSr465+gQn0h5MODqyVGk5pStW0n7luHkyP1Enpgv3UYANy3ND0YxHStBbwt/DX0HkM8DYgs9Cg0OseYDgRBh/W0isM46mIGelKdoE5hK6e9DIZv0EB3lfu6GyufRnWpf/HK4+Hyz07/fuIH33wTbNge3mEwnuaA9i8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721553187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Reply-To:References:Subject:Subject:To:To:Message-Id; 
	bh=svhPVmEuuAsD4Udugr8va0rxUGLKtmIaQhVkyP5c8Fs=; 
	b=WNvm90jqie8uKg3aD5MqvqUvzaXOYid/TeGn6woLQMi3fqBYgQBGKzZuKq10ruBCctq29zd0PbVnQJimEkUaaYhMvmUVO1xjYaJfYW43N/ZcVwTqv6x8Q9gS28g5F8qEz0zD3AWV8eCpjbplSXJwxldGCDsGoMxiXEAKsZFbpjY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hixontech.com;
	spf=pass  smtp.mailfrom=linux-kernel-bugs@hixontech.com;
	dmarc=pass header.from=<linux-kernel-bugs@hixontech.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721553187;
	s=zoho; d=hixontech.com; i=linux-kernel-bugs@hixontech.com;
	h=Message-ID:Date:Date:MIME-Version:Reply-To:Reply-To:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id;
	bh=svhPVmEuuAsD4Udugr8va0rxUGLKtmIaQhVkyP5c8Fs=;
	b=hKkxH5kSZWk94og+lAwFIXbB93b1gAXMe/Xo+6ycTfq8gCAwb4LIfQZ0E5XP8R9J
	UhF+PieUyYQIOVkhbIpvgUlAKUH4CnkXkalaoTHy3mdr3/0jcC40YKOzDQ90rRS60BP
	hdtgU7i9nRpugMjyeIaftZO61NWzGuFnjRE1W7YU=
Received: by mx.zohomail.com with SMTPS id 1721553186054613.0468153753609;
	Sun, 21 Jul 2024 02:13:06 -0700 (PDT)
Message-ID: <f6162b22-c6c6-47d7-9bda-dd702fcc5b4b@hixontech.com>
Date: Sun, 21 Jul 2024 03:13:03 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: linux-kernel-bugs@hixontech.com
Subject: Re: [BUG] HID: amd_sfh (drivers/hid/amd-sfh-hid/): memory/page
 corruption
To: Basavaraj Natikar <bnatikar@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Li Ma <li.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 yifan1.zhang@amd.com, linux-input@vger.kernel.org,
 Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
 <ade43b5b-9b93-40a8-acbf-99df944b45f9@leemhuis.info>
 <11fdf362-8fa5-4d44-904b-c0c9867ebd07@amd.com>
Content-Language: en-US
From: Chris Hixon <linux-kernel-bugs@hixontech.com>
In-Reply-To: <11fdf362-8fa5-4d44-904b-c0c9867ebd07@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/21/24 00:20, Basavaraj Natikar wrote:

> On 7/17/2024 4:51 PM, Linux regression tracking (Thorsten Leemhuis) wro=
te:
>> On 15.07.24 06:39, Chris Hixon wrote:
>>> System: HP ENVY x360 Convertible 15-ds1xxx; AMD Ryzen 7 4700U with
>>> Radeon Graphics
>>>
>>> Problem commits (introduced in v6.9-rc1):
>>> 6296562f30b1 HID: amd_sfh: Extend MP2 register access to SFH
>>> 2105e8e00da4 HID: amd_sfh: Improve boot time when SFH is available
>>>> It appears amd_sfh commits 6296562f30b1 and 2105e8e00da4 correlate w=
ith
>>> some form of memory/page corruption.=20
>> Hi! From a quick search on lore it looks like Basavaraj Natikar who
>> authored those two commits is inactive since a few days. This is total=
ly
>> fine, but given the nature of the problem slightly unfortunate. That's=

>> why I'm trying to raise awareness to this report by adding the
>> subsystems maintainers, a few lists, and a few people to the list of
>> recipients that were involved in the submission of those two patches.
>> With a bit of luck somebody might be able to help out. Ciao, Thorsten
>>
>>> On my system, this typically
>>> presents itself as a page dump followed by BTRFS errors, usually
>>> involving "corrupt leaf" (see dmesg output below); often the BTRFS
>>> filesystem becomes read-only afterwards. Note that the underlying NVM=
E
>>> disk seems fine, and the BTRFS filesystem does not actually appear to=
 be
>>> corrupt when booted/checked from kernels without this bug (no BTRFS
>>> errors or I/O errors reported on non-problem kernels).
>>>
>>> I have no problems when I blacklist the amd_sfh module (any kernel
>>> version), or revert both commits 6296562f30b1 and 2105e8e00da4 (on
>>> stable, linux-6.9.y). I have no problems on any recent linux-mainline=

>>> (v6.10{,-rc*}) when reverting these two commits (in addition to
>>> reverting 7902ec988a9a and 6856f079cd45 to successfully build the
>>> kernel). I have had no problems with any 6.6.y, v6.7.y, or v6.8.y ver=
sion.
>>>
>>> It is curious BTRFS always seems involved, but problems go away with
>>> these amd_sfh commits reverted (or amd_afh disabled).
>>>
>>> Further notes:
>>>
>>> I have not specifically used the amd_sfh module for anything. As far
>>> I've been able to determine, my system has the "Sensor Fusion Hub" mp=
2
>>> chip, but has no supported sensors/sub-devices (or I need to do
>>> something to enable them), (or there is an error while detecting
>>> sensors?). All logs I've checked contain something like:
>>>
>>> Jul 09 04:14:37 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling devi=
ce
>>> (0000 -> 0002)
>>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to
>>> discover, sensors not enabled is 0
>>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7:
>>> amd_sfh_hid_client_init failed err -95
>>>
>>> Excerpt from lshw:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *-generi=
c:1 UNCLAIMED
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 description: Signal processing controller
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 product: Sensor Fusion Hub
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 vendor: Advanced Micro Devices, Inc. [AMD]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 physical id: 0.7
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bus info: pci@0000:04:00.7
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 version: 00
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 width: 32 bits
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 clock: 33MHz
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 capabilities: pm pciexpress msi msix cap_list
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 configuration: latency=3D0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 resources: memory:fe000000-fe0fffff
>>> memory:fe4cc000-fe4cdfff
>=20
> Could you please check with the latest version, including the patch bel=
ow?
>=20
> https://lore.kernel.org/all/20240718111616.3012155-1-Basavaraj.Natikar@=
amd.com/
>=20
> Thanks,
> --
> Basavaraj
>=20

Hi,

Unfortunately, that patch doesn't fix the issue. I do get different crash=
es...

Test #1, patch applied to linux-mainline 720261cfc732:
------------------------------------------------------

Jul 19 03:07:52 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device (=
0000 -> 0002)
=2E..
Jul 19 03:08:22 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to discove=
r, sensors not enabled is 0
Jul 19 03:08:22 arch kernel: pcie_mp2_amd 0000:04:00.7: amd_sfh_hid_clien=
t_init failed err -95
=2E..
Jul 19 03:08:33 arch kernel: journalctl: Corrupted page table at address =
7f364f200098
Jul 19 03:08:33 arch kernel: PGD 12532c067 P4D 12532c067 PUD 1277e7067 PM=
D 110dd1067 PTE ffffdbdefffffd9f
Jul 19 03:08:33 arch kernel: Oops: Bad pagetable: 000d [#1] PREEMPT SMP N=
OPTI
Jul 19 03:08:33 arch kernel: CPU: 4 PID: 2366 Comm: journalctl Not tainte=
d 6.10.0-08676-g720261cfc732-dirty #1 323ec4760c6f8b2d83974caae365d400b43=
e1fa0
Jul 19 03:08:33 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 19 03:08:33 arch kernel: RIP: 0033:0x7f365b0f22fa
Jul 19 03:08:33 arch kernel: Code: 45 c0 00 00 00 00 48 c7 45 b8 00 00 00=
 00 4d 85 e4 0f 84 81 06 00 00 4c 89 e6 48 89 df e8 ae 51 00 00 49 8b 94 =
24 d0 00 00 00 <48> 8b 82 98 00 00 00 45 3b 6c 24 1c 0f 84 9c 01 00 00 49=
 89 44 24
Jul 19 03:08:33 arch kernel: RSP: 002b:00007ffe3bed6020 EFLAGS: 00010206
Jul 19 03:08:33 arch kernel: RAX: 0000000000000000 RBX: 0000560c079673c0 =
RCX: 0000000000000001
Jul 19 03:08:33 arch kernel: RDX: 00007f364f200000 RSI: 0000560c0797f040 =
RDI: 0000560c079673c0
Jul 19 03:08:33 arch kernel: RBP: 00007ffe3bed60a0 R08: 0000560c07966010 =
R09: 0000000000000007
Jul 19 03:08:33 arch kernel: R10: 0000560c07968e40 R11: 0000560c07968ad0 =
R12: 0000560c0797f040
Jul 19 03:08:33 arch kernel: R13: 0000000000000001 R14: 0000560c07968858 =
R15: 0000000000000000
Jul 19 03:08:33 arch kernel: FS:  00007f365ab69880 GS:  0000000000000000
Jul 19 03:08:33 arch kernel: Modules linked in: nft_masq nft_chain_nat nf=
_nat bridge stp llc vhost_vsock vmw_vsock_virtio_transport_common vsock v=
host vhost_iotlb ccm snd_seq_dummy snd_hrtimer rfcomm snd_seq snd_seq_dev=
ice uhid cmac algif_hash algif_skcipher af_alg nft_ct nf_conntrack nf_def=
rag_ipv6 nf_defrag_ipv4 nf_tables bnep snd_ctl_led iwlmvm mac80211 snd_ac=
p3x_pdm_dma snd_acp3x_rn snd_soc_dmic snd_sof_amd_vangogh snd_sof_amd_rem=
brandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_xtensa_dsp snd_sof_pci =
snd_sof snd_hda_codec_realtek intel_rapl_msr snd_sof_utils intel_rapl_com=
mon btusb uvcvideo snd_hda_codec_generic btrtl snd_soc_core libarc4 kvm_a=
md snd_hda_scodec_component btintel videobuf2_vmalloc btbcm snd_hda_codec=
_hdmi videobuf2_memops btmtk uvc iwlwifi snd_compress snd_hda_intel snd_p=
ci_ps videobuf2_v4l2 snd_intel_dspcfg kvm snd_rpl_pci_acp6x bluetooth snd=
_hda_codec videodev snd_acp_pci cfg80211 snd_hwdep snd_hda_core snd_acp_l=
egacy_common snd_pci_acp6x videobuf2_common mc snd_pcm rapl hp_wmi snd_pc=
i_acp5x sparse_keymap pcspkr
Jul 19 03:08:33 arch kernel:  snd_timer ucsi_acpi snd_rn_pci_acp3x wmi_bm=
of platform_profile acpi_cpufreq snd typec_ucsi snd_acp_config amd_sfh rf=
kill snd_soc_acpi sp5100_tco k10temp roles soundcore snd_pci_acp3x i2c_pi=
ix4 typec hp_accel wireless_hotkey lis3lv02d acpi_tad amd_pmc joydev mous=
edev mac_hid nls_iso8859_1 vfat fat usbip_host usbip_core crypto_user loo=
p nfnetlink zram ip_tables x_tables btrfs blake2b_generic libcrc32c crc32=
c_generic xor raid6_pq dm_crypt cbc encrypted_keys trusted asn1_encoder t=
ee dm_mod amdgpu amdxcp i2c_algo_bit crct10dif_pclmul crc32_pclmul drm_tt=
m_helper crc32c_intel ttm polyval_clmulni polyval_generic rtsx_pci_sdmmc =
gf128mul mmc_core ghash_clmulni_intel drm_exec sha512_ssse3 nvme gpu_sche=
d serio_raw sha256_ssse3 atkbd sha1_ssse3 nvme_core drm_suballoc_helper l=
ibps2 aesni_intel drm_buddy vivaldi_fmap drm_display_helper crypto_simd c=
cp cryptd rtsx_pci video xhci_pci i8042 nvme_auth xhci_pci_renesas crc16 =
wmi serio 9pnet_virtio 9p 9pnet netfs virtio_net net_failover failover vi=
rtio_blk hid_multitouch
Jul 19 03:08:33 arch kernel:  i2c_hid_acpi i2c_hid
Jul 19 03:08:33 arch kernel: ---[ end trace 0000000000000000 ]---
Jul 19 03:08:33 arch kernel: RIP: 0033:0x7f365b0f22fa
Jul 19 03:08:33 arch kernel: RSP: 002b:00007ffe3bed6020 EFLAGS: 00010206
Jul 19 03:08:33 arch kernel: RAX: 0000000000000000 RBX: 0000560c079673c0 =
RCX: 0000000000000001
Jul 19 03:08:33 arch kernel: RDX: 00007f364f200000 RSI: 0000560c0797f040 =
RDI: 0000560c079673c0
Jul 19 03:08:33 arch kernel: RBP: 00007ffe3bed60a0 R08: 0000560c07966010 =
R09: 0000000000000007
Jul 19 03:08:33 arch kernel: R10: 0000560c07968e40 R11: 0000560c07968ad0 =
R12: 0000560c0797f040
Jul 19 03:08:33 arch kernel: R13: 0000000000000001 R14: 0000560c07968858 =
R15: 0000000000000000
Jul 19 03:08:33 arch kernel: FS:  00007f365ab69880(0000) GS:ffff9641bf600=
000(0000) knlGS:0000000000000000
Jul 19 03:08:33 arch kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Jul 19 03:08:33 arch kernel: CR2: 00007f364f200098 CR3: 00000001224c2000 =
CR4: 0000000000350ef0
Jul 19 03:08:33 arch kernel: note: journalctl[2366] exited with irqs disa=
bled
Jul 19 03:08:33 arch kernel: BUG: Bad page map in process journalctl  pte=
:ffffdbdefffffd9f pmd:110dd1067
Jul 19 03:08:33 arch kernel: addr:00007f364f200000 vm_flags:080000d1 anon=
_vma:0000000000000000 mapping:ffff963ec4ef7be8 index:0
Jul 19 03:08:33 arch kernel: file:system@4b2ed14e1df74095b272f6fbd1a5cf90=
-000000000063dc49-000615f60b98c78b.journal fault:filemap_fault mmap:btrfs=
_file_mmap [btrfs] read_folio:btrfs_read_folio [btrfs]
Jul 19 03:08:33 arch kernel: CPU: 4 PID: 2366 Comm: journalctl Tainted: G=
      D            6.10.0-08676-g720261cfc732-dirty #1 323ec4760c6f8b2d83=
974caae365d400b43e1fa0
Jul 19 03:08:33 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 19 03:08:33 arch kernel: Call Trace:
Jul 19 03:08:33 arch kernel:  <TASK>
Jul 19 03:08:33 arch kernel:  dump_stack_lvl+0x5d/0x80
Jul 19 03:08:33 arch kernel:  print_bad_pte.cold+0x76/0xd9
Jul 19 03:08:33 arch kernel:  vm_normal_page+0xd6/0xf0
Jul 19 03:08:33 arch kernel:  unmap_page_range+0x5d7/0x17f0
Jul 19 03:08:33 arch kernel:  unmap_vmas+0xbd/0x1a0
Jul 19 03:08:33 arch kernel:  exit_mmap+0xf6/0x3b0
Jul 19 03:08:33 arch kernel:  __mmput+0x3e/0x130
Jul 19 03:08:33 arch kernel:  do_exit+0x2ce/0xad0
Jul 19 03:08:33 arch kernel:  make_task_dead+0x90/0x90
Jul 19 03:08:33 arch kernel:  rewind_stack_and_make_dead+0x16/0x20
Jul 19 03:08:33 arch kernel: RIP: 0033:0x7f365b0f22fa
Jul 19 03:08:33 arch kernel: Code: Unable to access opcode bytes at 0x7f3=
65b0f22d0.
Jul 19 03:08:33 arch kernel: RSP: 002b:00007ffe3bed6020 EFLAGS: 00010206
Jul 19 03:08:33 arch kernel: RAX: 0000000000000000 RBX: 0000560c079673c0 =
RCX: 0000000000000001
Jul 19 03:08:33 arch kernel: RDX: 00007f364f200000 RSI: 0000560c0797f040 =
RDI: 0000560c079673c0
Jul 19 03:08:33 arch kernel: RBP: 00007ffe3bed60a0 R08: 0000560c07966010 =
R09: 0000000000000007
Jul 19 03:08:33 arch kernel: R10: 0000560c07968e40 R11: 0000560c07968ad0 =
R12: 0000560c0797f040
Jul 19 03:08:33 arch kernel: R13: 0000000000000001 R14: 0000560c07968858 =
R15: 0000000000000000
Jul 19 03:08:33 arch kernel:  </TASK>
Jul 19 03:08:33 arch kernel: BUG: Bad page map in process journalctl  pte=
:200000e1d pmd:110dd1067
Jul 19 03:08:33 arch kernel: addr:00007f364f201000 vm_flags:080000d1 anon=
_vma:0000000000000000 mapping:ffff963ec4ef7be8 index:1
Jul 19 03:08:33 arch kernel: file:system@4b2ed14e1df74095b272f6fbd1a5cf90=
-000000000063dc49-000615f60b98c78b.journal fault:filemap_fault mmap:btrfs=
_file_mmap [btrfs] read_folio:btrfs_read_folio [btrfs]
Jul 19 03:08:33 arch kernel: CPU: 4 PID: 2366 Comm: journalctl Tainted: G=
    B D            6.10.0-08676-g720261cfc732-dirty #1 323ec4760c6f8b2d83=
974caae365d400b43e1fa0
Jul 19 03:08:33 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 19 03:08:33 arch kernel: Call Trace:
Jul 19 03:08:33 arch kernel:  <TASK>
Jul 19 03:08:33 arch kernel:  dump_stack_lvl+0x5d/0x80
Jul 19 03:08:33 arch kernel:  print_bad_pte.cold+0x76/0xd9
Jul 19 03:08:33 arch kernel:  vm_normal_page+0xd6/0xf0
Jul 19 03:08:33 arch kernel:  unmap_page_range+0x5d7/0x17f0
Jul 19 03:08:33 arch kernel:  unmap_vmas+0xbd/0x1a0
Jul 19 03:08:33 arch kernel:  exit_mmap+0xf6/0x3b0
Jul 19 03:08:33 arch kernel:  __mmput+0x3e/0x130
Jul 19 03:08:33 arch kernel:  do_exit+0x2ce/0xad0
Jul 19 03:08:33 arch kernel:  make_task_dead+0x90/0x90
Jul 19 03:08:33 arch kernel:  rewind_stack_and_make_dead+0x16/0x20
Jul 19 03:08:33 arch kernel: RIP: 0033:0x7f365b0f22fa
Jul 19 03:08:33 arch kernel: Code: Unable to access opcode bytes at 0x7f3=
65b0f22d0.
Jul 19 03:08:33 arch kernel: RSP: 002b:00007ffe3bed6020 EFLAGS: 00010206
Jul 19 03:08:33 arch kernel: RAX: 0000000000000000 RBX: 0000560c079673c0 =
RCX: 0000000000000001
Jul 19 03:08:33 arch kernel: RDX: 00007f364f200000 RSI: 0000560c0797f040 =
RDI: 0000560c079673c0
Jul 19 03:08:33 arch kernel: RBP: 00007ffe3bed60a0 R08: 0000560c07966010 =
R09: 0000000000000007
Jul 19 03:08:33 arch kernel: R10: 0000560c07968e40 R11: 0000560c07968ad0 =
R12: 0000560c0797f040
Jul 19 03:08:33 arch kernel: R13: 0000000000000001 R14: 0000560c07968858 =
R15: 0000000000000000
Jul 19 03:08:33 arch kernel:  </TASK>
Jul 19 03:08:33 arch kernel: BUG: Bad page map in process journalctl  pte=
:30ffffff8f pmd:120674067
Jul 19 03:08:33 arch kernel: addr:00007f364f600000 vm_flags:080000d1 anon=
_vma:0000000000000000 mapping:ffff963ec4ef7be8 index:400
Jul 19 03:08:33 arch kernel: file:system@4b2ed14e1df74095b272f6fbd1a5cf90=
-000000000063dc49-000615f60b98c78b.journal fault:filemap_fault mmap:btrfs=
_file_mmap [btrfs] read_folio:btrfs_read_folio [btrfs]
Jul 19 03:08:33 arch kernel: CPU: 4 PID: 2366 Comm: journalctl Tainted: G=
    B D            6.10.0-08676-g720261cfc732-dirty #1 323ec4760c6f8b2d83=
974caae365d400b43e1fa0
Jul 19 03:08:33 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 19 03:08:33 arch kernel: Call Trace:
Jul 19 03:08:33 arch kernel:  <TASK>
Jul 19 03:08:33 arch kernel:  dump_stack_lvl+0x5d/0x80
Jul 19 03:08:33 arch kernel:  print_bad_pte.cold+0x76/0xd9
Jul 19 03:08:33 arch kernel:  vm_normal_page+0xd6/0xf0
Jul 19 03:08:33 arch kernel:  unmap_page_range+0x5d7/0x17f0
Jul 19 03:08:33 arch kernel:  unmap_vmas+0xbd/0x1a0
Jul 19 03:08:33 arch kernel:  exit_mmap+0xf6/0x3b0
Jul 19 03:08:33 arch kernel:  __mmput+0x3e/0x130
Jul 19 03:08:33 arch kernel:  do_exit+0x2ce/0xad0
Jul 19 03:08:33 arch kernel:  make_task_dead+0x90/0x90
Jul 19 03:08:33 arch kernel:  rewind_stack_and_make_dead+0x16/0x20
Jul 19 03:08:33 arch kernel: RIP: 0033:0x7f365b0f22fa
Jul 19 03:08:33 arch kernel: Code: Unable to access opcode bytes at 0x7f3=
65b0f22d0.
Jul 19 03:08:33 arch kernel: RSP: 002b:00007ffe3bed6020 EFLAGS: 00010206
Jul 19 03:08:33 arch kernel: RAX: 0000000000000000 RBX: 0000560c079673c0 =
RCX: 0000000000000001
Jul 19 03:08:33 arch kernel: RDX: 00007f364f200000 RSI: 0000560c0797f040 =
RDI: 0000560c079673c0
Jul 19 03:08:33 arch kernel: RBP: 00007ffe3bed60a0 R08: 0000560c07966010 =
R09: 0000000000000007
Jul 19 03:08:33 arch kernel: R10: 0000560c07968e40 R11: 0000560c07968ad0 =
R12: 0000560c0797f040
Jul 19 03:08:33 arch kernel: R13: 0000000000000001 R14: 0000560c07968858 =
R15: 0000000000000000
Jul 19 03:08:33 arch kernel:  </TASK>
Jul 19 03:08:33 arch kernel: BUG: Bad page map in process journalctl  pte=
:ffffffe6 pmd:120674067
Jul 19 03:08:33 arch kernel: addr:00007f364f601000 vm_flags:080000d1 anon=
_vma:0000000000000000 mapping:ffff963ec4ef7be8 index:401
Jul 19 03:08:33 arch kernel: file:system@4b2ed14e1df74095b272f6fbd1a5cf90=
-000000000063dc49-000615f60b98c78b.journal fault:filemap_fault mmap:btrfs=
_file_mmap [btrfs] read_folio:btrfs_read_folio [btrfs]
Jul 19 03:08:33 arch kernel: CPU: 4 PID: 2366 Comm: journalctl Tainted: G=
    B D            6.10.0-08676-g720261cfc732-dirty #1 323ec4760c6f8b2d83=
974caae365d400b43e1fa0
Jul 19 03:08:33 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 19 03:08:33 arch kernel: Call Trace:
Jul 19 03:08:33 arch kernel:  <TASK>
Jul 19 03:08:33 arch kernel:  dump_stack_lvl+0x5d/0x80
Jul 19 03:08:33 arch kernel:  print_bad_pte.cold+0x76/0xd9
Jul 19 03:08:33 arch kernel:  vm_normal_page+0xd6/0xf0
Jul 19 03:08:33 arch kernel:  unmap_page_range+0x5d7/0x17f0
Jul 19 03:08:33 arch kernel:  unmap_vmas+0xbd/0x1a0
Jul 19 03:08:33 arch kernel:  exit_mmap+0xf6/0x3b0
Jul 19 03:08:33 arch kernel:  __mmput+0x3e/0x130
Jul 19 03:08:33 arch kernel:  do_exit+0x2ce/0xad0
Jul 19 03:08:33 arch kernel:  make_task_dead+0x90/0x90
Jul 19 03:08:33 arch kernel:  rewind_stack_and_make_dead+0x16/0x20
Jul 19 03:08:33 arch kernel: RIP: 0033:0x7f365b0f22fa
Jul 19 03:08:33 arch kernel: Code: Unable to access opcode bytes at 0x7f3=
65b0f22d0.
Jul 19 03:08:33 arch kernel: RSP: 002b:00007ffe3bed6020 EFLAGS: 00010206
Jul 19 03:08:33 arch kernel: RAX: 0000000000000000 RBX: 0000560c079673c0 =
RCX: 0000000000000001
Jul 19 03:08:33 arch kernel: RDX: 00007f364f200000 RSI: 0000560c0797f040 =
RDI: 0000560c079673c0
Jul 19 03:08:33 arch kernel: RBP: 00007ffe3bed60a0 R08: 0000560c07966010 =
R09: 0000000000000007
Jul 19 03:08:33 arch kernel: R10: 0000560c07968e40 R11: 0000560c07968ad0 =
R12: 0000560c0797f040
Jul 19 03:08:33 arch kernel: R13: 0000000000000001 R14: 0000560c07968858 =
R15: 0000000000000000
Jul 19 03:08:33 arch kernel:  </TASK>
Jul 19 03:08:33 arch kernel: BUG: Bad rss-counter state mm:0000000043d542=
9f type:MM_FILEPAGES val:1

Test #2, patch applied to linux-mainline 2c9b3512402e:
------------------------------------------------------

Jul 21 02:45:19 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device (=
0000 -> 0002)
=2E..
Jul 21 02:45:49 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to discove=
r, sensors not enabled is 0
Jul 21 02:45:49 arch kernel: pcie_mp2_amd 0000:04:00.7: amd_sfh_hid_clien=
t_init failed err -95
Jul 21 02:45:50 arch kernel: BUG: unable to handle page fault for address=
: 000000b4ffffed39
Jul 21 02:45:50 arch kernel: #PF: supervisor read access in kernel mode
Jul 21 02:45:50 arch kernel: #PF: error_code(0x0000) - not-present page
Jul 21 02:45:50 arch kernel: PGD 0 P4D 0=20
Jul 21 02:45:50 arch kernel: Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
Jul 21 02:45:50 arch kernel: CPU: 2 PID: 1648 Comm: gnome-shell Not taint=
ed 6.10.0-11185-g2c9b3512402e-dirty #1 909b642174274273e9a5ff42844d49a454=
a06a9d
Jul 21 02:45:50 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 21 02:45:50 arch kernel: RIP: 0010:poll_freewait+0x58/0xa0
Jul 21 02:45:50 arch kernel: Code: 83 c3 40 e8 9a c4 ce ff 48 8b 7b b0 e8=
 21 33 fe ff 41 39 6d 28 7f de 4d 85 e4 74 40 49 8b 5c 24 08 49 8d 6c 24 =
10 48 83 eb 40 <48> 8b 7b 38 48 8d 73 10 e8 6b c4 ce ff 48 8b 3b e8 f3 32=
 fe ff 48
Jul 21 02:45:50 arch kernel: RSP: 0018:ffffafd196e578e8 EFLAGS: 00010202
Jul 21 02:45:50 arch kernel: RAX: dead000000000122 RBX: 000000b4ffffed01 =
RCX: 0000000000000001
Jul 21 02:45:50 arch kernel: RDX: ffffa09a0bc10590 RSI: 0000000000000292 =
RDI: ffffa09a00e95700
Jul 21 02:45:50 arch kernel: RBP: ffffa09a09197010 R08: 0000000000000001 =
R09: 0000000000000001
Jul 21 02:45:50 arch kernel: R10: 0000000000000002 R11: 0000000000000001 =
R12: ffffa09a09197000
Jul 21 02:45:50 arch kernel: R13: ffffafd196e57a70 R14: 0000000000000011 =
R15: 0000000000000001
Jul 21 02:45:50 arch kernel: FS:  00007f90be94ed80(0000) GS:ffffa09cff700=
000(0000) knlGS:0000000000000000
Jul 21 02:45:50 arch kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Jul 21 02:45:50 arch kernel: CR2: 000000b4ffffed39 CR3: 000000010dfbc000 =
CR4: 0000000000350ef0
Jul 21 02:45:50 arch kernel: Call Trace:
Jul 21 02:45:50 arch kernel:  <TASK>
Jul 21 02:45:50 arch kernel:  ? __die_body.cold+0x19/0x27
Jul 21 02:45:50 arch kernel:  ? page_fault_oops+0x15a/0x2d0
Jul 21 02:45:50 arch kernel:  ? exc_page_fault+0x81/0x190
Jul 21 02:45:50 arch kernel:  ? asm_exc_page_fault+0x26/0x30
Jul 21 02:45:50 arch kernel:  ? poll_freewait+0x58/0xa0
Jul 21 02:45:50 arch kernel:  ? poll_freewait+0x3f/0xa0
Jul 21 02:45:50 arch kernel:  do_sys_poll+0x4e4/0x600
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pfx_pollwake+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:50 arch kernel:  __x64_sys_poll+0xd0/0x180
Jul 21 02:45:50 arch kernel:  do_syscall_64+0x82/0x190
Jul 21 02:45:50 arch kernel:  ? __pfx_read_tsc+0x10/0x10
Jul 21 02:45:50 arch kernel:  ? __pm_runtime_suspend+0x69/0xc0
Jul 21 02:45:50 arch kernel:  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu 706919=
ea96bf2f5c4d15446a617826d78535f0ff]
Jul 21 02:45:50 arch kernel:  ? syscall_exit_to_user_mode+0x10/0x200
Jul 21 02:45:50 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:50 arch kernel:  ? syscall_exit_to_user_mode+0x10/0x200
Jul 21 02:45:50 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:50 arch kernel:  ? syscall_exit_to_user_mode+0x10/0x200
Jul 21 02:45:50 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:50 arch kernel:  ? __irq_exit_rcu+0x4a/0xb0
Jul 21 02:45:50 arch kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Jul 21 02:45:50 arch kernel: RIP: 0033:0x7f90c2f1c39d
Jul 21 02:45:50 arch kernel: Code: e5 48 83 ec 20 89 55 ec 48 89 75 f0 48=
 89 7d f8 e8 08 6a f8 ff 8b 55 ec 48 8b 75 f0 41 89 c0 48 8b 7d f8 b8 07 =
00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 2b 44 89 c7 89 45 f8 e8 60 6a f8 ff=
 8b 45 f8
Jul 21 02:45:50 arch kernel: RSP: 002b:00007fffaf5d0530 EFLAGS: 00000293 =
ORIG_RAX: 0000000000000007
Jul 21 02:45:50 arch kernel: RAX: ffffffffffffffda RBX: 000000007fffffff =
RCX: 00007f90c2f1c39d
Jul 21 02:45:50 arch kernel: RDX: 0000000000000334 RSI: 0000000000000011 =
RDI: 000055a4c9873340
Jul 21 02:45:50 arch kernel: RBP: 00007fffaf5d0550 R08: 0000000000000000 =
R09: 000000007fffffff
Jul 21 02:45:50 arch kernel: R10: 000055a4c6b95c80 R11: 0000000000000293 =
R12: 0000000000000334
Jul 21 02:45:50 arch kernel: R13: 0000000000000011 R14: 000055a4c9873340 =
R15: 000055a4c6b95c80
Jul 21 02:45:50 arch kernel:  </TASK>
Jul 21 02:45:50 arch kernel: Modules linked in: nft_masq nft_chain_nat nf=
_nat bridge stp llc vhost_vsock vmw_vsock_virtio_transport_common vsock v=
host vhost_iotlb ccm snd_seq_dummy snd_hrtimer rfcomm snd_seq snd_seq_dev=
ice uhid cmac algif_hash algif_skcipher af_alg snd_ctl_led nft_ct nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bnep iwlmvm mac80211 snd_ac=
p3x_pdm_dma snd_acp3x_rn snd_soc_dmic snd_sof_amd_vangogh snd_sof_amd_rem=
brandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_xtensa_dsp snd_sof_pci =
snd_sof intel_rapl_msr intel_rapl_common uvcvideo btusb kvm_amd libarc4 s=
nd_hda_codec_realtek btrtl snd_sof_utils videobuf2_vmalloc btintel snd_hd=
a_codec_generic videobuf2_memops uvc snd_soc_core iwlwifi snd_hda_scodec_=
component snd_hda_codec_hdmi btbcm videobuf2_v4l2 snd_compress btmtk kvm =
snd_hda_intel snd_pci_ps videodev snd_rpl_pci_acp6x snd_intel_dspcfg snd_=
acp_pci bluetooth snd_hda_codec videobuf2_common snd_acp_legacy_common cf=
g80211 snd_hwdep mc snd_pci_acp6x snd_hda_core snd_pci_acp5x rapl snd_pcm=
 pcspkr snd_rn_pci_acp3x
Jul 21 02:45:50 arch kernel:  hp_wmi snd_timer snd_acp_config sparse_keym=
ap ucsi_acpi sp5100_tco snd_soc_acpi platform_profile wmi_bmof acpi_cpufr=
eq typec_ucsi snd amd_sfh roles soundcore snd_pci_acp3x rfkill typec i2c_=
piix4 k10temp hp_accel lis3lv02d amd_pmc wireless_hotkey acpi_tad joydev =
mousedev mac_hid nls_iso8859_1 vfat fat usbip_host usbip_core crypto_user=
 loop nfnetlink zram ip_tables x_tables btrfs blake2b_generic libcrc32c c=
rc32c_generic xor raid6_pq dm_crypt cbc encrypted_keys trusted asn1_encod=
er tee dm_mod amdgpu crct10dif_pclmul crc32_pclmul amdxcp crc32c_intel i2=
c_algo_bit polyval_clmulni drm_ttm_helper rtsx_pci_sdmmc polyval_generic =
ttm mmc_core ghash_clmulni_intel nvme drm_exec sha512_ssse3 gpu_sched ser=
io_raw sha256_ssse3 nvme_core atkbd sha1_ssse3 drm_suballoc_helper libps2=
 aesni_intel drm_buddy ccp gf128mul vivaldi_fmap drm_display_helper crypt=
o_simd rtsx_pci cryptd xhci_pci nvme_auth video i8042 xhci_pci_renesas cr=
c16 serio wmi 9pnet_virtio 9p 9pnet netfs virtio_net net_failover failove=
r virtio_blk hid_multitouch
Jul 21 02:45:50 arch kernel:  i2c_hid_acpi i2c_hid
Jul 21 02:45:50 arch kernel: CR2: 000000b4ffffed39
Jul 21 02:45:50 arch kernel: ---[ end trace 0000000000000000 ]---
Jul 21 02:45:50 arch kernel: RIP: 0010:poll_freewait+0x58/0xa0
Jul 21 02:45:50 arch kernel: Code: 83 c3 40 e8 9a c4 ce ff 48 8b 7b b0 e8=
 21 33 fe ff 41 39 6d 28 7f de 4d 85 e4 74 40 49 8b 5c 24 08 49 8d 6c 24 =
10 48 83 eb 40 <48> 8b 7b 38 48 8d 73 10 e8 6b c4 ce ff 48 8b 3b e8 f3 32=
 fe ff 48
Jul 21 02:45:50 arch kernel: RSP: 0018:ffffafd196e578e8 EFLAGS: 00010202
Jul 21 02:45:50 arch kernel: RAX: dead000000000122 RBX: 000000b4ffffed01 =
RCX: 0000000000000001
Jul 21 02:45:50 arch kernel: RDX: ffffa09a0bc10590 RSI: 0000000000000292 =
RDI: ffffa09a00e95700
Jul 21 02:45:50 arch kernel: RBP: ffffa09a09197010 R08: 0000000000000001 =
R09: 0000000000000001
Jul 21 02:45:50 arch kernel: R10: 0000000000000002 R11: 0000000000000001 =
R12: ffffa09a09197000
Jul 21 02:45:50 arch kernel: R13: ffffafd196e57a70 R14: 0000000000000011 =
R15: 0000000000000001
Jul 21 02:45:50 arch kernel: FS:  00007f90be94ed80(0000) GS:ffffa09cff700=
000(0000) knlGS:0000000000000000
Jul 21 02:45:50 arch kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Jul 21 02:45:50 arch kernel: CR2: 000000b4ffffed39 CR3: 000000010dfbc000 =
CR4: 0000000000350ef0
Jul 21 02:45:50 arch kernel: note: gnome-shell[1648] exited with irqs dis=
abled
Jul 21 02:45:50 arch systemd-timesyncd[714]: Contacted time server 71.123=
=2E46.185:123 (2.arch.pool.ntp.org).
Jul 21 02:45:50 arch systemd-timesyncd[714]: Initial clock synchronizatio=
n to Sun 2024-07-21 02:45:50.385189 MDT.
Jul 21 02:45:54 arch kernel: BUG: unable to handle page fault for address=
: ffffafd196e57a88
Jul 21 02:45:54 arch kernel: #PF: supervisor read access in kernel mode
Jul 21 02:45:54 arch kernel: #PF: error_code(0x0000) - not-present page
Jul 21 02:45:54 arch kernel: PGD 100000067 P4D 100000067 PUD 10020d067 PM=
D 126169067 PTE 0
Jul 21 02:45:54 arch kernel: Oops: Oops: 0000 [#2] PREEMPT SMP NOPTI
Jul 21 02:45:54 arch kernel: CPU: 1 PID: 1656 Comm: gdbus Tainted: G     =
 D            6.10.0-11185-g2c9b3512402e-dirty #1 909b642174274273e9a5ff4=
2844d49a454a06a9d
Jul 21 02:45:54 arch kernel: Hardware name: HP HP ENVY x360 Convertible 1=
5-ds1xxx/87A9, BIOS F.14 10/13/2023
Jul 21 02:45:54 arch kernel: RIP: 0010:pollwake+0x57/0xa0
Jul 21 02:45:54 arch kernel: Code: 04 24 00 00 00 00 48 c7 44 24 08 00 00=
 00 00 48 c7 44 24 10 00 00 00 00 48 c7 44 24 18 00 00 00 00 48 c7 44 24 =
20 00 00 00 00 <48> 8b 78 18 48 c7 44 24 10 80 89 90 94 48 89 7c 24 08 c7=
 40 20 01
Jul 21 02:45:54 arch kernel: RSP: 0018:ffffafd196f6fd58 EFLAGS: 00010002
Jul 21 02:45:54 arch kernel: RAX: ffffafd196e57a70 RBX: ffffa09a443f7890 =
RCX: 0000000000000001
Jul 21 02:45:54 arch kernel: RDX: 0000000000000000 RSI: 0000000000000003 =
RDI: ffffa09a09197060
Jul 21 02:45:54 arch kernel: RBP: 0000000000000000 R08: ffffa09a443f7890 =
R09: 0000000000000000
Jul 21 02:45:54 arch kernel: R10: 0000000000000000 R11: 0000000000000000 =
R12: ffffa09a443f7878
Jul 21 02:45:54 arch kernel: R13: 0000000000000003 R14: 0000000000000000 =
R15: 0000000000000001
Jul 21 02:45:54 arch kernel: FS:  00007f90b9e006c0(0000) GS:ffffa09cff680=
000(0000) knlGS:0000000000000000
Jul 21 02:45:54 arch kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Jul 21 02:45:54 arch kernel: CR2: ffffafd196e57a88 CR3: 000000010dfbc000 =
CR4: 0000000000350ef0
Jul 21 02:45:54 arch kernel: Call Trace:
Jul 21 02:45:54 arch kernel:  <TASK>
Jul 21 02:45:54 arch kernel:  ? __die_body.cold+0x19/0x27
Jul 21 02:45:54 arch kernel:  ? page_fault_oops+0x15a/0x2d0
Jul 21 02:45:54 arch kernel:  ? search_bpf_extables+0x5f/0x80
Jul 21 02:45:54 arch kernel:  ? exc_page_fault+0x18a/0x190
Jul 21 02:45:54 arch kernel:  ? asm_exc_page_fault+0x26/0x30
Jul 21 02:45:54 arch kernel:  ? pollwake+0x57/0xa0
Jul 21 02:45:54 arch kernel:  ? __pfx_bpf_lsm_file_permission+0x10/0x10
Jul 21 02:45:54 arch kernel:  __wake_up_common+0x78/0xa0
Jul 21 02:45:54 arch kernel:  eventfd_write+0xc9/0x1f0
Jul 21 02:45:54 arch kernel:  ? __pfx_bpf_lsm_file_permission+0x10/0x10
Jul 21 02:45:54 arch kernel:  ? security_file_permission+0x36/0x50
Jul 21 02:45:54 arch kernel:  vfs_write+0xf8/0x460
Jul 21 02:45:54 arch kernel:  ? syscall_exit_to_user_mode+0x10/0x200
Jul 21 02:45:54 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:54 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:54 arch kernel:  ksys_write+0x6d/0xf0
Jul 21 02:45:54 arch kernel:  do_syscall_64+0x82/0x190
Jul 21 02:45:54 arch kernel:  ? do_syscall_64+0x8e/0x190
Jul 21 02:45:54 arch kernel:  ? exc_page_fault+0x81/0x190
Jul 21 02:45:54 arch kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Jul 21 02:45:54 arch kernel: RIP: 0033:0x7f90c2f1d53d
Jul 21 02:45:54 arch kernel: Code: e5 48 83 ec 20 48 89 55 e8 48 89 75 f0=
 89 7d f8 e8 68 58 f8 ff 48 8b 55 e8 48 8b 75 f0 41 89 c0 8b 7d f8 b8 01 =
00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 45 f8 e8 bf 58 f8=
 ff 48 8b
Jul 21 02:45:54 arch kernel: RSP: 002b:00007f90b9dfe3d0 EFLAGS: 00000293 =
ORIG_RAX: 0000000000000001
Jul 21 02:45:54 arch kernel: RAX: ffffffffffffffda RBX: 000055a4ca48d790 =
RCX: 00007f90c2f1d53d
Jul 21 02:45:54 arch kernel: RDX: 0000000000000008 RSI: 00007f90b9dfe400 =
RDI: 000000000000003b
Jul 21 02:45:54 arch kernel: RBP: 00007f90b9dfe3f0 R08: 0000000000000000 =
R09: 0000000000000001
Jul 21 02:45:54 arch kernel: R10: 00007f8ff400dda0 R11: 0000000000000293 =
R12: 00007f90b9dfe400
Jul 21 02:45:54 arch kernel: R13: 000055a4c6baff70 R14: 0000000000000001 =
R15: 00007f90a0046b20
Jul 21 02:45:54 arch kernel:  </TASK>
Jul 21 02:45:54 arch kernel: Modules linked in: nft_masq nft_chain_nat nf=
_nat bridge stp llc vhost_vsock vmw_vsock_virtio_transport_common vsock v=
host vhost_iotlb ccm snd_seq_dummy snd_hrtimer rfcomm snd_seq snd_seq_dev=
ice uhid cmac algif_hash algif_skcipher af_alg snd_ctl_led nft_ct nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bnep iwlmvm mac80211 snd_ac=
p3x_pdm_dma snd_acp3x_rn snd_soc_dmic snd_sof_amd_vangogh snd_sof_amd_rem=
brandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_xtensa_dsp snd_sof_pci =
snd_sof intel_rapl_msr intel_rapl_common uvcvideo btusb kvm_amd libarc4 s=
nd_hda_codec_realtek btrtl snd_sof_utils videobuf2_vmalloc btintel snd_hd=
a_codec_generic videobuf2_memops uvc snd_soc_core iwlwifi snd_hda_scodec_=
component snd_hda_codec_hdmi btbcm videobuf2_v4l2 snd_compress btmtk kvm =
snd_hda_intel snd_pci_ps videodev snd_rpl_pci_acp6x snd_intel_dspcfg snd_=
acp_pci bluetooth snd_hda_codec videobuf2_common snd_acp_legacy_common cf=
g80211 snd_hwdep mc snd_pci_acp6x snd_hda_core snd_pci_acp5x rapl snd_pcm=
 pcspkr snd_rn_pci_acp3x
Jul 21 02:45:54 arch kernel:  hp_wmi snd_timer snd_acp_config sparse_keym=
ap ucsi_acpi sp5100_tco snd_soc_acpi platform_profile wmi_bmof acpi_cpufr=
eq typec_ucsi snd amd_sfh roles soundcore snd_pci_acp3x rfkill typec i2c_=
piix4 k10temp hp_accel lis3lv02d amd_pmc wireless_hotkey acpi_tad joydev =
mousedev mac_hid nls_iso8859_1 vfat fat usbip_host usbip_core crypto_user=
 loop nfnetlink zram ip_tables x_tables btrfs blake2b_generic libcrc32c c=
rc32c_generic xor raid6_pq dm_crypt cbc encrypted_keys trusted asn1_encod=
er tee dm_mod amdgpu crct10dif_pclmul crc32_pclmul amdxcp crc32c_intel i2=
c_algo_bit polyval_clmulni drm_ttm_helper rtsx_pci_sdmmc polyval_generic =
ttm mmc_core ghash_clmulni_intel nvme drm_exec sha512_ssse3 gpu_sched ser=
io_raw sha256_ssse3 nvme_core atkbd sha1_ssse3 drm_suballoc_helper libps2=
 aesni_intel drm_buddy ccp gf128mul vivaldi_fmap drm_display_helper crypt=
o_simd rtsx_pci cryptd xhci_pci nvme_auth video i8042 xhci_pci_renesas cr=
c16 serio wmi 9pnet_virtio 9p 9pnet netfs virtio_net net_failover failove=
r virtio_blk hid_multitouch
Jul 21 02:45:54 arch kernel:  i2c_hid_acpi i2c_hid
Jul 21 02:45:54 arch kernel: CR2: ffffafd196e57a88
Jul 21 02:45:54 arch kernel: ---[ end trace 0000000000000000 ]---
Jul 21 02:45:54 arch kernel: RIP: 0010:poll_freewait+0x58/0xa0
Jul 21 02:45:54 arch kernel: Code: 83 c3 40 e8 9a c4 ce ff 48 8b 7b b0 e8=
 21 33 fe ff 41 39 6d 28 7f de 4d 85 e4 74 40 49 8b 5c 24 08 49 8d 6c 24 =
10 48 83 eb 40 <48> 8b 7b 38 48 8d 73 10 e8 6b c4 ce ff 48 8b 3b e8 f3 32=
 fe ff 48
Jul 21 02:45:54 arch kernel: RSP: 0018:ffffafd196e578e8 EFLAGS: 00010202
Jul 21 02:45:54 arch kernel: RAX: dead000000000122 RBX: 000000b4ffffed01 =
RCX: 0000000000000001
Jul 21 02:45:54 arch kernel: RDX: ffffa09a0bc10590 RSI: 0000000000000292 =
RDI: ffffa09a00e95700
Jul 21 02:45:54 arch kernel: RBP: ffffa09a09197010 R08: 0000000000000001 =
R09: 0000000000000001
Jul 21 02:45:54 arch kernel: R10: 0000000000000002 R11: 0000000000000001 =
R12: ffffa09a09197000
Jul 21 02:45:54 arch kernel: R13: ffffafd196e57a70 R14: 0000000000000011 =
R15: 0000000000000001
Jul 21 02:45:54 arch kernel: FS:  00007f90b9e006c0(0000) GS:ffffa09cff680=
000(0000) knlGS:0000000000000000
Jul 21 02:45:54 arch kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Jul 21 02:45:54 arch kernel: CR2: ffffafd196e57a88 CR3: 000000010dfbc000 =
CR4: 0000000000350ef0
Jul 21 02:45:54 arch kernel: note: gdbus[1656] exited with irqs disabled
Jul 21 02:45:54 arch kernel: note: gdbus[1656] exited with preempt_count =
1

Thanks!

>>>
>>> How I tracked down the problem commits:
>>>
>>> I was not able to successfully "git bisect" this bug - I seemed to ru=
n
>>> into a mess of unrelated problems/errors that sent me down a rabbit h=
ole
>>> chasing who knows what. I had already manually narrowed down the bug =
to
>>> amd_sfh by blacklisting modules, so I reverted each
>>> drivers/hid/amd-sfh-hid commit on the stable linux-6.9.y branch (v6.9=
=2E8
>>> known "bad"), back to v6.6 (known "good"), and then manually bisected=

>>> the revert commits, landing on "HID: amd_sfh: Improve boot time when =
SFH
>>> is available" (2105e8e00da4) as the first "bad" commit.
>>>
>>> I wanted to be able to test with only the "bad" commit(s) removed; it=

>>> turns out 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to
>>> SFH") needs to be reverted to do that. Everything seems fine with the=
se
>>> two commits reverted (again, this in on the stable linux-6.9.y branch=
).
>>>
>>> When testing, "bad" commits usually quickly display some variation of=

>>> the page dump/BTRFS errors, similar to the dmesg output below. I
>>> consider commits "good" if the system survives "stress-ng --all 2
>>> --vm-bytes 50% --minimize --syslog --status 10 -t 5m" (run as a non-r=
oot
>>> user), which was usually followed by building the next test kernel. T=
he
>>> "bad" commits often show errors before I even get to the stress test.=

>>>
>>> Examples of error messages from dmesg:
>>>
>>> [=C2=A0 653.364343] page: refcount:4 mapcount:0 mapping:00000000b1592=
89f
>>> index:0x585a7cec pfn:0x10b5c1
>>> [=C2=A0 653.364353] memcg:ffff8f2600918000
>>> [=C2=A0 653.364354] aops:btree_aops ino:1
>>> [=C2=A0 653.364358] flags:
>>> 0x17ffffd000802a(uptodate|lru|private|writeback|node=3D0|zone=3D2|las=
tcpupid=3D0x1fffff)
>>> [=C2=A0 653.364361] page_type: 0xffffffff()
>>> [=C2=A0 653.364363] raw: 0017ffffd000802a fffff1da87ee3288 fffff1da84=
2d70c8
>>> ffff8f260c719458
>>> [=C2=A0 653.364365] raw: 00000000585a7cec ffff8f26cd09e0f0 00000004ff=
ffffff
>>> ffff8f2600918000
>>> [=C2=A0 653.364366] page dumped because: eb page dump
>>> [=C2=A0 653.364367] BTRFS critical (device dm-0): corrupt leaf: root=3D=
7
>>> block=3D6071604133888 slot=3D159, unexpected item end, have 276825401=
0
>>> expect 13379
>>> [=C2=A0 653.364371] BTRFS info (device dm-0): leaf 6071604133888 gen =
679995
>>> total ptrs 353 free space 322 owner 7
>>> [=C2=A0 653.364373]=C2=A0=C2=A0=C2=A0=C2=A0 item 0 key (1844674407370=
9551606 128 1062871883776)
>>> itemoff 16271 itemsize 12
>>> [=C2=A0 653.364375]=C2=A0=C2=A0=C2=A0=C2=A0 item 1 key (1844674407370=
9551606 128 1062871896064)
>>> itemoff 16263 itemsize 8
>>> [=C2=A0 653.364376]=C2=A0=C2=A0=C2=A0=C2=A0 item 2 key (1844674407370=
9551606 128 1062871904256)
>>> itemoff 16255 itemsize 8
>>> ...
>>> [=C2=A0 653.364762]=C2=A0=C2=A0=C2=A0=C2=A0 item 350 key (18446744073=
709551606 128 1062879260672)
>>> itemoff 9227 itemsize 12
>>> [=C2=A0 653.364763]=C2=A0=C2=A0=C2=A0=C2=A0 item 351 key (18446744073=
709551606 128 1062879272960)
>>> itemoff 9223 itemsize 4
>>> [=C2=A0 653.364764]=C2=A0=C2=A0=C2=A0=C2=A0 item 352 key (18446744073=
709551606 128 1062879277056)
>>> itemoff 9147 itemsize 76
>>> [=C2=A0 653.364766] BTRFS error (device dm-0): block=3D6071604133888 =
write time
>>> tree block corruption detected
>>> [=C2=A0 653.375440] BTRFS: error (device dm-0) in
>>> btrfs_commit_transaction:2511: errno=3D-5 IO failure (Error while wri=
ting
>>> out transaction)
>>> [=C2=A0 653.375453] BTRFS info (device dm-0 state E): forced readonly=

>>> [=C2=A0 653.375458] BTRFS warning (device dm-0 state E): Skipping com=
mit of
>>> aborted transaction.
>>> [=C2=A0 653.375461] BTRFS error (device dm-0 state EA): Transaction a=
borted
>>> (error -5)
>>> [=C2=A0 653.375465] BTRFS: error (device dm-0 state EA) in
>>> cleanup_transaction:2005: errno=3D-5 IO failure
>>> [=C2=A0 653.375582] BTRFS warning (device dm-0 state EA): Skipping co=
mmit of
>>> aborted transaction.
>>> [=C2=A0 653.375586] BTRFS: error (device dm-0 state EA) in
>>> cleanup_transaction:2005: errno=3D-5 IO failure
>>>
>>> Another example:
>>>
>>> [ 5478.134046] page: refcount:4 mapcount:0 mapping:0000000010080c01
>>> index:0x5459ff30 pfn:0x168c7f
>>> [ 5478.134054] memcg:ffff89c240988000
>>> [ 5478.134056] aops:btree_aops ino:1
>>> [ 5478.134061] flags:
>>> 0x17ffffd800802a(uptodate|lru|private|writeback|node=3D0|zone=3D2|las=
tcpupid=3D0x1fffff)
>>> [ 5478.134064] page_type: 0xffffffff()
>>> [ 5478.134066] raw: 0017ffffd800802a ffffcc5d043e2bc8 ffffcc5d05a08c8=
8
>>> ffff89c249968338
>>> [ 5478.134068] raw: 000000005459ff30 ffff89c246fa22d0 00000004fffffff=
f
>>> ffff89c240988000
>>> [ 5478.134069] page dumped because: eb page dump
>>> [ 5478.134071] BTRFS critical (device dm-0): corrupt leaf: root=3D216=
1
>>> block=3D5796594384896 slot=3D84 ino=3D2434728, invalid inode generati=
on: has
>>> 72057594122450740 expect (0, 664473]
>>> [ 5478.134075] BTRFS info (device dm-0): leaf 5796594384896 gen 66447=
2
>>> total ptrs 120 free space 1223 owner 2161
>>> [ 5478.134077]=C2=A0 item 0 key (2434713 24 3817753667) itemoff 16210=

>>> itemsize 73
>>> [ 5478.134078]=C2=A0 item 1 key (2434713 108 0) itemoff 15359 itemsiz=
e 851
>>> [ 5478.134080]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
inline extent data size 830
>>> [ 5478.134081]=C2=A0 item 2 key (2434714 1 0) itemoff 15199 itemsize =
160
>>> [ 5478.134082]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
inode generation 636724 size 758 mode 100644
>>> [ 5478.134083]=C2=A0 item 3 key (2434714 12 2348495) itemoff 15181 it=
emsize 18
>>> =C2=A0 ...
>>> [ 5478.134242]=C2=A0 item 117 key (2434733 108 0) itemoff 4398 itemsi=
ze 329
>>> [ 5478.134243]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
inline extent data size 308
>>> [ 5478.134244]=C2=A0 item 118 key (2434734 1 0) itemoff 4238 itemsize=
 160
>>> [ 5478.134245]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
inode generation 636724 size 30 mode 40755
>>> [ 5478.134245]=C2=A0 item 119 key (2434734 12 2434375) itemoff 4223 i=
temsize 15
>>> [ 5478.134247] BTRFS error (device dm-0): block=3D5796594384896 write=
 time
>>> tree block corruption detected
>>> [ 5478.263726] BTRFS: error (device dm-0) in
>>> btrfs_commit_transaction:2511: errno=3D-5 IO failure (Error while wri=
ting
>>> out transaction)
>>> [ 5478.263733] BTRFS info (device dm-0 state E): forced readonly
>>> [ 5478.263736] BTRFS warning (device dm-0 state E): Skipping commit o=
f
>>> aborted transaction.
>>> [ 5478.263737] BTRFS error (device dm-0 state EA): Transaction aborte=
d
>>> (error -5)
>>> [ 5478.263739] BTRFS: error (device dm-0 state EA) in
>>> cleanup_transaction:2005: errno=3D-5 IO failure
>>> [ 5478.264582] BTRFS warning (device dm-0 state EA): Skipping commit =
of
>>> aborted transaction.
>>> [ 5478.264595] BTRFS: error (device dm-0 state EA) in
>>> cleanup_transaction:2005: errno=3D-5 IO failure
>> #regzbot ^introduced: 6296562f30b1
>> #regzbot summary: hid: amd_sfh: memory/page corruption correlated with=

>> 6296562f30b1 or 2105e8e00da4
>> #regzbot ignore-activity
>=20
>=20


