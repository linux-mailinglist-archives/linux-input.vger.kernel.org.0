Return-Path: <linux-input+bounces-12230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 953FCAAF9A7
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 14:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052684A6CE8
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1499820B813;
	Thu,  8 May 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WtsvlyOb"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056C136A;
	Thu,  8 May 2025 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706756; cv=pass; b=mi6HWwh/Q40wI55JqNuJopMXOt3ac5S0XHKo2GMTHrJHO6Wcfp9IRyf4i8FX85lRTXPt4WEkT2e1NqCianOR9ZEDIyfrYYFIvPc1wcEW4q/NwG8nRbYUYIoucKnerBkmaeegeKdSCK7ObqaJGFBThdV0Gk2HWHpqjn3+ILh97Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706756; c=relaxed/simple;
	bh=kBtxAAVkgArtW382abMKQMtQLCuK2KcAn/5lbrFrdxY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RZMxvguo2vFNxRN9C39v6qigpuRqdUjpgv0h7k55n0yN57u/Wlprj10kpRVj6Eok1v+gyLELVzHF4LcPWMetgoTGP7nGjPwKfGO8uDoZeIxVu1bvaBIV2zltfksVT9LCwRC4POeCqu8i3NyCEZWklXB2FR2fltKlBLl8CNbs8n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WtsvlyOb; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1746706740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D7CvMaDALnWkWOCw2JgTGipR2nONGt2u6qkWFckijX1B9Ik2tsIatfvY8JQgDL4a6LOIxdstfe1/iQAf27sxcBmAjCF5DlkKRuLY1Te9ngDAQ/4NxLwbqSKr8D2JSDnHziazUttPAOo5tjgmI0pvITeAGFBlTNKAaCKWp8PBucE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746706740; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P8YaEZVdgNT/9Q9gwytDmcTVvyr/93974aoT78iProc=; 
	b=MYd/F0oVmdt+N65u6iIAACVb2rJ61BRmTI5fJsCfVPLx1hC3YTk9ZFkfmdS3zTPUMXnsMD5DHNdrBgKlU4piEmEUCFSxjO1uiY72/f+6pQx8UrWMStZFeJzWQufdX12kmUFoOjMc8fJcSe0Gl3ixn2gg0tmuUL51aNGs84hLtZw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746706739;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=P8YaEZVdgNT/9Q9gwytDmcTVvyr/93974aoT78iProc=;
	b=WtsvlyObQd+oZwOg1nShxF+PkJ//74sYO2dufsDeuCbSV5UuykJq0VWwK3G5vZuv
	w5aRr2yQvCEkI00ZReBekW4eb1ZsJpiXsjwFaQLyp/+O4x3To1KwjjwTRX12bLsJTK/
	fgERZ+VpxJzzLc7X3h7I1hHgS59B91js/XIuqTbY=
Received: by mx.zohomail.com with SMTPS id 1746706737681190.62744814839448;
	Thu, 8 May 2025 05:18:57 -0700 (PDT)
Message-ID: <211da98f4fcb211cab3310ffd9e70cdb634664cf.camel@rong.moe>
Subject: Re: [Bug 220083] New: [REGRESSION, BISECTED] x86 ASM changes make
 dispatch_hid_bpf_output_report access not-present page
From: Rong Zhang <i@rong.moe>
To: Brian Gerst <brgerst@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>
Cc: bugzilla-daemon@kernel.org, Jiri Kosina <jikos@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov
	 <bp@alien8.de>
In-Reply-To: <CAMzpN2hb7DHX_CEddxdJDzDpNhrPRct3FcnVOBeeFtMqj=cuog@mail.gmail.com>
References: <bug-220083-6385@https.bugzilla.kernel.org/>
		 <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>
		 <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq>
		 <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
		 <CAMzpN2hb7DHX_CEddxdJDzDpNhrPRct3FcnVOBeeFtMqj=cuog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 May 2025 20:17:48 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.1-1 
X-ZohoMailClient: External

Hi all,

On Wed, 2025-05-07 at 18:14 -0400, Brian Gerst wrote:
> On Wed, May 7, 2025 at 7:06=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
> >=20
> > Hi Benjamin,
> >=20
> > On Tue, 2025-05-06 at 17:35 +0200, Benjamin Tissoires wrote:
> > > Hi Boris,
> > >=20
> > > On May 06 2025, Borislav Petkov wrote:
> > > > Switching to mail.
> > > >=20
> > > > Hi Benjamin,
> > > >=20
> > > > take a look at the below pls.
> > > >=20
> > > > The RIP points to:
> > > >=20
> > > >   22:   48 c1 e6 04             shl    $0x4,%rsi
> > > >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> > > >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <--=
 trapping instruction
> > > >   2f:   c3                      ret
> > > >=20
> > > > which really is a %gs-based access and the reporter has bisected th=
is to
> > > >=20
> > > >   9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> > > >=20
> > > > which looks related.
> > > >=20
> > > > My silly guess would be some bpf program does per-cpu accesses but =
it doesn't
> > > > know about this change so it tramples over registers. I mean, my fi=
x would be
> > > > to disable BPF but you young kids love to play with that...
> > >=20
> > > Heh. Well, I would like to know if any HID-BPF program is loaded firs=
t.
> > > These can be seen by running `sudo tree /sys/fs/bpf/hid/`.
> >=20
> > Nothing is there.
>=20
> [snip]
>=20
> >=20
> > In case you need it, I decoded a stacktrace (I've upgraded to 6.15-rc5
> > BTW):
> >=20
> > [14591.438053] usb 7-1.4.4: USB disconnect, device number 7
> > [14591.541666] BUG: unable to handle page fault for address: ffff8efd88=
e65018
> > [14591.541674] #PF: supervisor write access in kernel mode
> > [14591.541676] #PF: error_code(0x0002) - not-present page
> > [14591.541677] PGD 220801067 P4D 220801067 PUD 0
> > [14591.541681] Oops: Oops: 0002 [#1] SMP NOPTI
> > [14591.541684] CPU: 0 UID: 0 PID: 56816 Comm: kworker/0:2 Not tainted 6=
.15.0-rc5 #1 PREEMPT(lazy)  0538d36f9cfa2dbc3c98efb2730490d8b2399dc4
> > [14591.541687] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW 03=
/11/2025
> > [14591.541689] Workqueue: events hidinput_led_worker
> > [14591.541693] RIP: 0010:__srcu_read_unlock (kernel/rcu/srcutree.c:768 =
(discriminator 1))
> > [14591.541697] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 f3=
 0f 1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08=
 <65> 48 ff 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:   c3                      ret
> >    1:   cc                      int3
> >    2:   cc                      int3
> >    3:   cc                      int3
> >    4:   cc                      int3
> >    5:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> >    c:   00 00 00 00
> >   10:   f3 0f 1e fa             endbr64
> >   14:   0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> >   19:   f0 83 44 24 fc 00       lock addl $0x0,-0x4(%rsp)
> >   1f:   48 63 f6                movslq %esi,%rsi
> >   22:   48 c1 e6 04             shl    $0x4,%rsi
> >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- tra=
pping instruction
> >   2f:   c3                      ret
> >   30:   cc                      int3
> >   31:   cc                      int3
> >   32:   cc                      int3
> >   33:   cc                      int3
> >   34:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> >   3b:   00 00 00 00
> >   3f:   90                      nop
> >=20
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:   65 48 ff 46 08          incq   %gs:0x8(%rsi)
> >    5:   c3                      ret
> >    6:   cc                      int3
> >    7:   cc                      int3
> >    8:   cc                      int3
> >    9:   cc                      int3
> >    a:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> >   11:   00 00 00 00
> >   15:   90                      nop
> > [14591.541698] RSP: 0018:ffffd0c6094f7d88 EFLAGS: 00010202
> > [14591.541700] RAX: 0000000000000000 RBX: ffff8ef67492be08 RCX: 0000000=
000000000
> > [14591.541701] RDX: 0000000000000002 RSI: 0000000000000010 RDI: ffff8ef=
67492be38
> > [14591.541702] RBP: ffffd0c6094f7df8 R08: 0000000000000000 R09: 0000000=
0fffffffd
> > [14591.541703] R10: 0000000000000001 R11: 00000000ffffffff R12: 0000000=
000000000
> > [14591.541703] R13: ffff8ef70d8143d0 R14: 0000000000000001 R15: 0000000=
000000000
> > [14591.541704] FS:  0000000000000000(0000) GS:ffff8efd88e65000(0000) kn=
lGS:0000000000000000
> > [14591.541705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [14591.541706] CR2: ffff8efd88e65018 CR3: 00000001d0184000 CR4: 0000000=
000f50ef0
> > [14591.541707] PKRU: 55555554
> > [14591.541708] Call Trace:
> > [14591.541710]  <TASK>
> > [14591.541711] dispatch_hid_bpf_output_report (drivers/hid/bpf/hid_bpf_=
dispatch.c:148)
> > [14591.541716] hid_hw_output_report (drivers/hid/hid-core.c:2500 driver=
s/hid/hid-core.c:2520)
> > [14591.541717] hidinput_led_worker (drivers/hid/hid-input.c:1838)
> > [14591.541719] process_one_work (kernel/workqueue.c:3238)
> > [14591.541721] worker_thread (kernel/workqueue.c:3313 (discriminator 2)=
 kernel/workqueue.c:3400 (discriminator 2))
> > [14591.541723] ? rescuer_thread (kernel/workqueue.c:3346)
> > [14591.541724] kthread (kernel/kthread.c:464)
> > [14591.541727] ? kthreads_online_cpu (kernel/kthread.c:413)
> > [14591.541729] ret_from_fork (arch/x86/kernel/process.c:153)
> > [14591.541731] ? kthreads_online_cpu (kernel/kthread.c:413)
> > [14591.541733] ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> > [14591.541737]  </TASK>
> > [14591.541738] Modules linked in: mmc_block rpmb_core udp_diag tcp_diag=
 inet_diag xt_mark ccm snd_hrtimer snd_seq_dummy snd_seq_midi snd_seq_oss s=
nd_seq_midi_event snd_rawmidi snd_seq snd_seq_device xt_CHECKSUM xt_MASQUER=
ADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun bridge stp llc nf_=
tables qrtr uhid rfcomm cmac algif_hash algif_skcipher af_alg overlay bnep =
sunrpc vfat fat btusb uvcvideo btrtl videobuf2_vmalloc btintel uvc videobuf=
2_memops btbcm videobuf2_v4l2 btmtk videobuf2_common bluetooth videodev mc =
intel_rapl_msr amd_atl intel_rapl_common snd_acp_legacy_mach snd_acp_mach s=
nd_soc_nau8821 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm snd_soc_dmic =
snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof=
_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtens=
a_dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match snd_hda_codec=
_realtek snd_amd_sdw_acpi soundwire_amd snd_hda_codec_generic
> > [14591.541775]  soundwire_generic_allocation snd_hda_scodec_component s=
oundwire_bus snd_soc_sdca snd_hda_codec_hdmi snd_soc_core mt7925e snd_hda_i=
ntel snd_compress mt7925_common ac97_bus snd_intel_dspcfg kvm_amd mt792x_li=
b snd_pcm_dmaengine snd_intel_sdw_acpi snd_rpl_pci_acp6x mt76_connac_lib sn=
d_hda_codec snd_acp_pci kvm mt76 snd_amd_acpi_mach snd_hda_core snd_acp_leg=
acy_common irqbypass think_lmi snd_pci_acp6x snd_hwdep rapl snd_ctl_led pcs=
pkr mac80211 snd_pcm_oss firmware_attributes_class lenovo_wmi_hotkey_utilit=
ies snd_mixer_oss snd_pci_acp5x libarc4 snd_pcm wmi_bmof snd_rn_pci_acp3x s=
pd5118 snd_timer snd_acp_config cfg80211 snd snd_soc_acpi hid_sensor_als so=
undcore amdxdna amd_pmf hid_sensor_trigger snd_pci_acp3x k10temp rfkill ind=
ustrialio_triggered_buffer amdtee kfifo_buf joydev hid_sensor_iio_common cc=
p industrialio mousedev platform_profile amd_pmc mac_hid sch_fq_codel uinpu=
t i2c_dev parport_pc ppdev lp parport nvme_fabrics nfnetlink ip_tables x_ta=
bles hid_logitech_hidpp hid_logitech_dj usbhid dm_crypt
> > [14591.541811]  encrypted_keys trusted asn1_encoder tee dm_mod raid10 r=
aid456 async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 rai=
d0 linear md_mod igc ptp pps_core r8153_ecm r8152 cdc_ether usbnet mii amdg=
pu i2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks polyval_clmul=
ni polyval_generic drm_exec drm_suballoc_helper ghash_clmulni_intel amdxcp =
sha512_ssse3 drm_buddy sdhci_pci sha256_ssse3 sp5100_tco r8169 nvme sdhci_u=
hs2 gpu_sched sha1_ssse3 serio_raw hid_sensor_custom sdhci nvme_core realte=
k aesni_intel ucsi_acpi atkbd drm_display_helper cqhci libps2 crypto_simd t=
ypec_ucsi hid_multitouch i2c_piix4 nvme_keyring mdio_devres hid_sensor_hub =
hid_generic thunderbolt vivaldi_fmap cryptd typec cec libphy mmc_core amd_s=
fh video i8042 nvme_auth i2c_smbus roles i2c_hid_acpi serio wmi i2c_hid
> > [14591.541846] CR2: ffff8efd88e65018
> > [14591.541848] ---[ end trace 0000000000000000 ]---
>=20
> So what we have here is a function that takes two parameters: what
> looks like an index in RSI, and a pointer to a structure in RDI.
> Looking at the register dump, RSI ends up with the value
> 0000000000000010, which could very likely be an index of 1 shifted and
> added to a NULL pointer from the structure.  On the old zero-based
> percpu, that would be a valid address, but would corrupt whatever was
> there.  So I don't think this is a problem with the bisected commit,
> it just exposed an existing bug.

Brian,

Thanks for your explanation!

With your information, I think there is a race when unplugging as
Benjamin said. Thus, I double-checked the bpftrace output (in my
previous reply) and found:

   .bpf =3D {
      .device_data =3D 0x0, .allocated_data =3D 0, .destroyed =3D 1,=20
      [...]
      .srcu =3D {
         .srcu_ctrp =3D 0x61896b5b0290, .sda =3D 0x0, .dep_map =3D {  },
         .srcu_sup =3D 0x0
      }
   }

So yes, the device was destroyed with a dangling led work.

Benjemin,

I applied the patch below, and now my setup is usable without the need
to reboot again and again to make USB recover. The patch doesn't fix
the bug itself, but=C2=A0exposes race bugs in a gentle manner once they
exist, preventing the case we are currently dealing with - another low
level change exposed an existing bug in a destructive way.

Is the patch worth submitting? If so, do you have any opinion on it?

Will keep debugging to reveal more details and try to fix the root
cause...

> Brian Gerst

Thanks,
Rong

---
 drivers/hid/bpf/hid_bpf_dispatch.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_d=
ispatch.c
index 2e96ec6a3073..b9d19416c243 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/btf.h>
 #include <linux/btf_ids.h>
+#include <linux/bug.h>
 #include <linux/filter.h>
 #include <linux/hid.h>
 #include <linux/hid_bpf.h>
@@ -38,6 +39,9 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, en=
um hid_report_type type
 	struct hid_bpf_ops *e;
 	int ret;
=20
+	if (WARN_ON(hdev->bpf.destroyed))
+		return ERR_PTR(-ENODEV);
+
 	if (type >=3D HID_REPORT_TYPES)
 		return ERR_PTR(-EINVAL);
=20
@@ -93,6 +97,9 @@ int dispatch_hid_bpf_raw_requests(struct hid_device *hdev=
,
 	struct hid_bpf_ops *e;
 	int ret, idx;
=20
+	if (WARN_ON(hdev->bpf.destroyed))
+		return -ENODEV;
+
 	if (rtype >=3D HID_REPORT_TYPES)
 		return -EINVAL;
=20
@@ -130,6 +137,9 @@ int dispatch_hid_bpf_output_report(struct hid_device *h=
dev,
 	struct hid_bpf_ops *e;
 	int ret, idx;
=20
+	if (WARN_ON(hdev->bpf.destroyed))
+		return -ENODEV;
+
 	idx =3D srcu_read_lock(&hdev->bpf.srcu);
 	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
 				 srcu_read_lock_held(&hdev->bpf.srcu)) {
--=20

