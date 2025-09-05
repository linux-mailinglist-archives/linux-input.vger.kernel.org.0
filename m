Return-Path: <linux-input+bounces-14513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B98B4620A
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 20:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8CF77A98D3
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 18:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88975305943;
	Fri,  5 Sep 2025 18:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cleverdomain.org header.i=@cleverdomain.org header.b="t+HfBBLu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YeMvipES"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBD6B640
	for <linux-input@vger.kernel.org>; Fri,  5 Sep 2025 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757096245; cv=none; b=ZhvNZ8Gk8q1gHbgvurPGQtMUBtWshPH2YtHxkDVk/H87uUfW3/Se0MWScEDnzRY8wf/YNM3ZBqQuMEeghGciA20lPZHWra95cb/kOFA08AM424w6vLgkZyfNeFoUfsff0HYk2aHajWVRDlyyBQIUN1zUAvwiR4bKkNITieN3qQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757096245; c=relaxed/simple;
	bh=MGBwXtwBN2Tjr++6oFNqG8pVZZ02S2aDnyog3u90fKo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qZXAzOzX2Xlv2zhuSIoNtaE4zSiSuwyW+o81vkonfQO0QK1yqaInCGhakC1iyQsOx4weHFc0RU88MOBR7l3GWW5W849prqSjiSHIXeLyFVzBnhMKXlJe26ME2NE0mCO8Br67E8IqLffqcfLgXXyUgpSI5M/D1/sCoiFwp6bY3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cleverdomain.org; spf=pass smtp.mailfrom=cleverdomain.org; dkim=pass (2048-bit key) header.d=cleverdomain.org header.i=@cleverdomain.org header.b=t+HfBBLu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YeMvipES; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cleverdomain.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cleverdomain.org
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7ACA7EC00A0
	for <linux-input@vger.kernel.org>; Fri,  5 Sep 2025 14:17:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Sep 2025 14:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	cleverdomain.org; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1757096241; x=1757182641; bh=3xsVlhCFHfaqEKlHGT4+Qp9TCHkA48pCsA4
	E0bgmrJ0=; b=t+HfBBLud+8vrlvRlVoll24h48/I6s1f6sJlYth28j95XEnTwZM
	7vjVBKTQvPOFKStoMitEvgYkUup8aoWqAGAAqDgLClZYmB3S/xQWRw59KNr5U/3z
	+LM3ss5EDYTVQz9wt3lxn/gJaeYSrTJ4m1l/ixS45VcrS+NBJMdwj+cJa46eUo2x
	Jet6+V1T/Ia/ls65ZsVFZAxHizZ+j6Z7ajT2ZIi6BRjv4np2vPN7e51SnutneZdp
	EN/MCQGsZPgDK/+a/Ng4nLSMp3ofDjnmyb1YpNtxKT45p0Dpjl6KWevI2Y/qTpdK
	WRrydjSUv/A6U6lk2WiJK67FV9kQkdmvZZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757096241; x=1757182641; bh=3xsVlhCFHfaqEKlHGT4+Qp9TCHkA48pCsA4
	E0bgmrJ0=; b=YeMvipESMXgrz8WG/dXxivpUF4sTk2x5CJl7LZaDV4PZe/S/jGg
	oRjgbvVMOLvQNPvy8tIdaOCeEMLvejeioSl7d0KgZg3PUoB/j2W/ioOpfMWF4zZu
	3m74iVklCRdP8ws8qLe2NHkT/1/ttFJ+mb5ur6XKd5onMeGslTu/oJ1Vz8UO3bP8
	YfeG/nYGTJklHpiEThF3cqcuyEBdG88e0w9gv1iZVkcd6QEsIVPSRvPG5vu3MBZ2
	dAgFgqCsnajVq4jSptyv2AqALRW5QfHGoGrXec6v2gotWpO2AkCP3Nv3GPDleBGb
	6w7t66xtBTS9PUcjbipWMQmCD8ISLuhhDfw==
X-ME-Sender: <xms:MSm7aBsW76bhzxk99d11psYsUFtwnbo2Jh2fnSdhjSs4CN-WjNt59w>
    <xme:MSm7aMcWryje4d615BddYpD4ug2zezrtxs2RV6EZjMDge_VaMl7k0RV6jWFfrb-9M
    qoXcgM40-Rdk-_ccw>
X-ME-Received: <xmr:MSm7aOL97Jp-Jpg7tFwAbxu4E-sTrFAOnPdOWeIREsDemvSd5_nidM_XK-wZ4Z1HzFa5tbozIoeQTscV3gX1DJPIQKt5ix755G4h2_pXk6I4BmG1dy6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefkffggfgfvhffutgfgsehtkeertddtreejne
    cuhfhrohhmpeetnhgurhgvficutfhoughlrghnugcuoegrnhgurhgvfiestghlvghvvghr
    ughomhgrihhnrdhorhhgqeenucggtffrrghtthgvrhhnpeefgffggfdvvdfgffettdegie
    efvedtfeeuudejkeffteetjeeitedvheekkeejffenucffohhmrghinhepghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegtlhgvvhgvrhguohhmrghinhdrohhrghdpnhgspghrtghpthhtohep
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MSm7aKYafoxLOJjQQ7JUeZC0ck-9ZNquC9ZVvIv3oYEJQgXBReh_Pg>
    <xmx:MSm7aJtpVWQrEI3Roqi-WbCoyX-JpWq9KgdNozOGPPfa1zyoEuevWg>
    <xmx:MSm7aHtCIkkkVVBHw1EihKGCUUMkHOIT9L6Q83iV-emeH2H6BOElJg>
    <xmx:MSm7aOdvSLfq4PuHPGfpi47WNXxXV-pq8fgnSMPJk_qgIENCsbiMBg>
    <xmx:MSm7aBU1nc3khoPFtArucrCM8mmg8dgqdxOzSnJtfFrLaa9EhsnemGwP>
Feedback-ID: i75d34307:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-input@vger.kernel.org>; Fri, 5 Sep 2025 14:17:20 -0400 (EDT)
Message-ID: <97c773f3-1bd0-42eb-a6b2-ebb79854535e@cleverdomain.org>
Date: Fri, 5 Sep 2025 14:17:20 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
To: linux-input@vger.kernel.org
From: Andrew Rodland <andrew@cleverdomain.org>
Subject: Seeking help debugging a crash in hid-magicmouse
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I use an Apple Magic Trackpad 2 (2024 USB-C model) on my Linux desktop.

After upgrading from Linux 6.16.3 to 6.16.4 (6.16.4-arch1-1: 
https://github.com/archlinux/linux/releases/tag/v6.16.4-arch1 -- I don't 
think there's anything terrible in the patchset), I was suffering from 
periodic crashes.

I rebuilt the kernel with debug symbols and enabled kdump and captured 
this dmesg:

[32607.193629] [      C7] BUG: kernel NULL pointer dereference, address: 
000000000000001c
[32607.193636] [      C7] #PF: supervisor read access in kernel mode
[32607.193637] [      C7] #PF: error_code(0x0000) - not-present page
[32607.193638] [      C7] PGD 910ad3067 P4D 910ad3067 PUD 9a49a3067 PMD 
6e1bc2067 PTE 0
[32607.193641] [      C7] Oops: Oops: 0000 [#1] SMP NOPTI
[32607.193644] [      C7] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Kdump: 
loaded Tainted: P S         OE       6.16.4-arch1-1-kdump #2 
PREEMPT(lazy)  a4265b7ab8b2a583c4532d85e7773a521cc6f594
[32607.193647] [      C7] Tainted: [P]=PROPRIETARY_MODULE, 
[S]=CPU_OUT_OF_SPEC, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[32607.193648] [      C7] Hardware name: Micro-Star International Co., 
Ltd. MS-7E59/MAG X870E TOMAHAWK WIFI (MS-7E59), BIOS 2.A84 08/05/2025
[32607.193649] [      C7] RIP: 0010:magicmouse_event+0x13/0x40 
[hid_magicmouse]
[32607.193654] [      C7] Code: 0f 1f 80 00 00 00 00 90 90 90 90 90 90 
90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 87 50 19 
00 00 48 8b 00 <0f> b7 40 1c 66 3d 69 02 74 0f 31 d2 66 3d 23 03 74 07 
89 d0 c3 cc
[32607.193655] [      C7] RSP: 0018:ffffd26900454d50 EFLAGS: 00010246
[32607.193656] [      C7] RAX: 0000000000000000 RBX: 0000000000000001 
RCX: 0000000000000001
[32607.193656] [      C7] RDX: ffff8ad502029e88 RSI: ffff8ad502029e00 
RDI: ffff8ad50cb9a000
[32607.193657] [      C7] RBP: 0000000000000001 R08: ffffffffc0431950 
R09: 0000000000000002
[32607.193657] [      C7] R10: ffff8ad50a101000 R11: 0000000000000064 
R12: ffff8ad50cb9a000
[32607.193658] [      C7] R13: ffff8ad502029e88 R14: ffffffffc03fd080 
R15: ffff8ad502029e00
[32607.193659] [      C7] FS:  0000000000000000(0000) 
GS:ffff8aebe30ea000(0000) knlGS:0000000000000000
[32607.193659] [      C7] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[32607.193660] [      C7] CR2: 000000000000001c CR3: 000000074f246000 
CR4: 0000000000f50ef0
[32607.193661] [      C7] DR0: 0000000141952b70 DR1: 0000000000000000 
DR2: 0000000000000000
[32607.193661] [      C7] DR3: 0000000000000000 DR6: 00000000ffff0ff0 
DR7: 0000000000000600
[32607.193662] [      C7] PKRU: 55555554
[32607.193662] [      C7] Call Trace:
[32607.193664] [      C7]  <IRQ>
[32607.193665] [      C7]  hid_process_event+0xb4/0x130
[32607.193671] [      C7]  hid_report_raw_event+0x323/0x4c0
[32607.193674] [      C7]  __hid_input_report+0x14d/0x200
[32607.193676] [      C7]  hid_input_report+0x15/0x20
[32607.193677] [      C7]  hid_irq_in+0x1a1/0x1d0
[32607.193679] [      C7]  __usb_hcd_giveback_urb+0x9d/0x120
[32607.193682] [      C7]  usb_giveback_urb_bh+0xc3/0x150
[32607.193684] [      C7]  process_one_work+0x190/0x350
[32607.193686] [      C7]  bh_worker+0x1ac/0x210
[32607.193688] [      C7]  ? sched_clock_cpu+0xf/0x200
[32607.193691] [      C7]  tasklet_hi_action+0x13/0x30
[32607.193693] [      C7]  handle_softirqs+0xe3/0x2a0
[32607.193694] [      C7]  __irq_exit_rcu+0xcb/0xf0
[32607.193696] [      C7]  common_interrupt+0x85/0xa0
[32607.193699] [      C7]  </IRQ>
[32607.193699] [      C7]  <TASK>
[32607.193699] [      C7]  asm_common_interrupt+0x26/0x40
[32607.193701] [      C7] RIP: 0010:cpuidle_enter_state+0xbb/0x410
[32607.193703] [      C7] Code: 00 00 e8 d8 86 0b ff e8 e3 f2 ff ff 48 
89 c5 0f 1f 44 00 00 31 ff e8 c4 ff 09 ff 45 84 ff 0f 85 33 02 00 00 fb 
0f 1f 44 00 00 <45> 85 f6 0f 88 7c 01 00 00 49 63 ce 48 2b 2c 24 48 6b 
d1 68 48 89
[32607.193704] [      C7] RSP: 0018:ffffd2690025fe78 EFLAGS: 00000246
[32607.193704] [      C7] RAX: ffff8aebe30ea000 RBX: 0000000000000002 
RCX: 0000000000000000
[32607.193705] [      C7] RDX: 00001da7f4314dff RSI: fffffff7ee2390e5 
RDI: 0000000000000000
[32607.193705] [      C7] RBP: 00001da7f4314dff R08: 0000000000000002 
R09: 000000000000adcb
[32607.193705] [      C7] R10: 00000000000002dd R11: ffffffffffffffff 
R12: ffff8ad501313400
[32607.193706] [      C7] R13: ffffffff9bffc440 R14: 0000000000000002 
R15: 0000000000000000
[32607.193708] [      C7]  ? cpuidle_enter_state+0xac/0x410
[32607.193709] [      C7]  cpuidle_enter+0x31/0x50
[32607.193711] [      C7]  do_idle+0x1b1/0x210
[32607.193714] [      C7]  cpu_startup_entry+0x29/0x30
[32607.193715] [      C7]  start_secondary+0x119/0x140
[32607.193718] [      C7]  common_startup_64+0x13e/0x141
[32607.193720] [      C7]  </TASK>

[32607.193721] [      C7] Modules linked in: xpad hid_playstation 
ff_memless led_class_multicolor uinput xt_MASQUERADE xt_tcpudp xt_mark 
snd_seq_dummy rfcomm snd_hrtimer snd_seq tun nf_tables ip6table_nat 
ip6table_filter ip6_tables iptable_nat nf_nat nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter uhid cmac algif_hash 
algif_skcipher af_alg bnep nct6683 amd_atl intel_rapl_msr 
intel_rapl_common btusb snd_usb_audio btrtl btintel snd_usbmidi_lib 
kvm_amd snd_ump btbcm snd_rawmidi btmtk apple_mfi_fastcharge kvm 
snd_seq_device bluetooth mousedev joydev mc irqbypass polyval_clmulni 
ghash_clmulni_intel rfkill snd_hda_codec_hdmi sha512_ssse3 snd_hda_intel 
sha1_ssse3 aesni_intel snd_intel_dspcfg spd5118 snd_intel_sdw_acpi 
wmi_bmof rapl pcspkr sp5100_tco snd_hda_codec zfs(POE) thunderbolt 
snd_hda_core i2c_piix4 k10temp ccp snd_hwdep r8169 i2c_smbus snd_pcm 
realtek mdio_devres snd_timer libphy snd soundcore spl(OE) mdio_bus 
gpio_amdpt gpio_generic mac_hid sg i2c_dev crypto_user dm_mod loop 
nfnetlink ip_tables x_tables amdgpu amdxcp
[32607.193749] [      C7]  i2c_algo_bit drm_ttm_helper ttm drm_exec 
gpu_sched drm_suballoc_helper drm_panel_backlight_quirks nvme uas 
drm_buddy nvme_core usb_storage hid_magicmouse drm_display_helper 
nvme_keyring cec nvme_auth video wmi
[32607.193755] [      C7] CR2: 000000000000001c

Unfortunately the core file itself was too large and was truncated, and 
can't be loaded.

If I rebuild with the following patch applied:

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 226682762db3..7be2daffc6fb 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -522,6 +522,11 @@ static int magicmouse_event(struct hid_device 
*hdev, struct hid_field *field,
                 struct hid_usage *usage, __s32 value)
  {
         struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+       if (!msc || !msc->input) {
+               hid_warn(hdev, "this would have crashed\n");
+               return 0;
+       }
+
         if ((msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
              msc->input->id.product == 
USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) &&
             field->report->id == MOUSE2_REPORT_ID) {

then I receive

[45398.145218] magicmouse 0003:05AC:0324.0003: this would have crashed

and the system does, in fact, not crash.

I have no idea what the cause is; in this instance the message appeared 
for the first time about 12 hours after system boot (but sometimes it's 
much faster), it printed several times a second for 42 minutes (I guess 
I should have used hid_warn_ratelimited), and then stopped again. The 
trackpad remained usable throughout.

Please let me know if there's anything I can do to help debug further. I 
know my way around the kernel tolerably well, but I don't have any 
particular knowledge of the HID subsystem.

Thanks,

Andrew


