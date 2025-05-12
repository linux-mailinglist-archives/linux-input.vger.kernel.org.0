Return-Path: <linux-input+bounces-12301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 597C6AB3AEA
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 16:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1C3188EA1C
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 14:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DC8229B2A;
	Mon, 12 May 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgZNCa/f"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5851E2607;
	Mon, 12 May 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061032; cv=none; b=A2N5XIOnscpakkOGmOotLdsDN1tNWRMPP9hZeZ77Ys3Ug/WwlHqddzp1gaIoaZoCI74CqnUjnnh/cZiVEXKnh8ocwVFsLNxZhoompiYppjsE+TvesWSFFMbXCy0fhtHcqK3Gm527bRkyL5qQe/9siCMn/8VxTS264tCuJjES7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061032; c=relaxed/simple;
	bh=4v6leJuecejSA1q/5wY2Rf65eZwp41TDOvYdxGV1Imk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiRFZF8HxbHTXrSyL6wQ5sjXvXWMyQHVmI+AwmnQQMOXe+Rfc6aP4yOz+qhS2nkfaKQC2dUA+FXeaYOmuNwSFCQ96GUXwW7o0xasQV8cz91LUtCN8aJtcYv9rBSXZlfiXsIZQ0Ws66cb8gLyecejQ6/9XtXZOvjX2a+IZqbMdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgZNCa/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A99C4CEE7;
	Mon, 12 May 2025 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747061031;
	bh=4v6leJuecejSA1q/5wY2Rf65eZwp41TDOvYdxGV1Imk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgZNCa/fKRPlzdWOJSEj+z8W9iknE4kPq2vo9L6LuTVU3AJwyI77nPdDZaaj8QR2E
	 kVbk1s9GIcK1OIvST2me8JSgQ/HH9eSOZDPUpZb1pTgzvH9Dp13hal7Nkx0ClNLu0i
	 EXJ4VfH7V/yplkemEHsJ7hfRUP/Y9Icgp5AsCLBLqRIUCYuyPS7LaqHcMwetpaHllG
	 mBOmsKcCVlWp85x6mjojof2vsvGvZu+DhGb9mPeXbt/pFq4pTooRpyMwgZzzilItnT
	 ZJqlKLWN/bsP24BLAsU7lPlOWsoVMXT1996pvQAMy+qFweUq3woNUTyhWhcAkncb6K
	 1qGNrC+TYz5nA==
Date: Mon, 12 May 2025 16:43:47 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Brian Gerst <brgerst@gmail.com>, bugzilla-daemon@kernel.org, 
	Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [Bug 220083] New: [REGRESSION, BISECTED] x86 ASM changes make
 dispatch_hid_bpf_output_report access not-present page
Message-ID: <xyfdjeijtdt4sgb4zjmlibdbbvaaly3m3wiqhk7tu35cb2bpip@axziyhfcqx6w>
References: <bug-220083-6385@https.bugzilla.kernel.org/>
 <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>
 <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq>
 <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
 <CAMzpN2hb7DHX_CEddxdJDzDpNhrPRct3FcnVOBeeFtMqj=cuog@mail.gmail.com>
 <211da98f4fcb211cab3310ffd9e70cdb634664cf.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <211da98f4fcb211cab3310ffd9e70cdb634664cf.camel@rong.moe>

Hi Rong,

[adding in Cc Petr, who is fixing the same bug at the same time]

[also sorry for not answering earlier, beginning of May is a time with a
lot of public holidays and long week ends]


On May 08 2025, Rong Zhang wrote:
> Hi all,
>=20
> On Wed, 2025-05-07 at 18:14 -0400, Brian Gerst wrote:
> > On Wed, May 7, 2025 at 7:06=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
> > >=20
> > > Hi Benjamin,
> > >=20
> > > On Tue, 2025-05-06 at 17:35 +0200, Benjamin Tissoires wrote:
> > > > Hi Boris,
> > > >=20
> > > > On May 06 2025, Borislav Petkov wrote:
> > > > > Switching to mail.
> > > > >=20
> > > > > Hi Benjamin,
> > > > >=20
> > > > > take a look at the below pls.
> > > > >=20
> > > > > The RIP points to:
> > > > >=20
> > > > >   22:   48 c1 e6 04             shl    $0x4,%rsi
> > > > >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> > > > >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <=
-- trapping instruction
> > > > >   2f:   c3                      ret
> > > > >=20
> > > > > which really is a %gs-based access and the reporter has bisected =
this to
> > > > >=20
> > > > >   9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> > > > >=20
> > > > > which looks related.
> > > > >=20
> > > > > My silly guess would be some bpf program does per-cpu accesses bu=
t it doesn't
> > > > > know about this change so it tramples over registers. I mean, my =
fix would be
> > > > > to disable BPF but you young kids love to play with that...
> > > >=20
> > > > Heh. Well, I would like to know if any HID-BPF program is loaded fi=
rst.
> > > > These can be seen by running `sudo tree /sys/fs/bpf/hid/`.
> > >=20
> > > Nothing is there.
> >=20
> > [snip]
> >=20
> > >=20
> > > In case you need it, I decoded a stacktrace (I've upgraded to 6.15-rc5
> > > BTW):
> > >=20
> > > [14591.438053] usb 7-1.4.4: USB disconnect, device number 7
> > > [14591.541666] BUG: unable to handle page fault for address: ffff8efd=
88e65018
> > > [14591.541674] #PF: supervisor write access in kernel mode
> > > [14591.541676] #PF: error_code(0x0002) - not-present page
> > > [14591.541677] PGD 220801067 P4D 220801067 PUD 0
> > > [14591.541681] Oops: Oops: 0002 [#1] SMP NOPTI
> > > [14591.541684] CPU: 0 UID: 0 PID: 56816 Comm: kworker/0:2 Not tainted=
 6.15.0-rc5 #1 PREEMPT(lazy)  0538d36f9cfa2dbc3c98efb2730490d8b2399dc4
> > > [14591.541687] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW =
03/11/2025
> > > [14591.541689] Workqueue: events hidinput_led_worker
> > > [14591.541693] RIP: 0010:__srcu_read_unlock (kernel/rcu/srcutree.c:76=
8 (discriminator 1))
> > > [14591.541697] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 =
08 <65> 48 ff 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> > > All code
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:   c3                      ret
> > >    1:   cc                      int3
> > >    2:   cc                      int3
> > >    3:   cc                      int3
> > >    4:   cc                      int3
> > >    5:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> > >    c:   00 00 00 00
> > >   10:   f3 0f 1e fa             endbr64
> > >   14:   0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> > >   19:   f0 83 44 24 fc 00       lock addl $0x0,-0x4(%rsp)
> > >   1f:   48 63 f6                movslq %esi,%rsi
> > >   22:   48 c1 e6 04             shl    $0x4,%rsi
> > >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> > >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- t=
rapping instruction
> > >   2f:   c3                      ret
> > >   30:   cc                      int3
> > >   31:   cc                      int3
> > >   32:   cc                      int3
> > >   33:   cc                      int3
> > >   34:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> > >   3b:   00 00 00 00
> > >   3f:   90                      nop
> > >=20
> > > Code starting with the faulting instruction
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:   65 48 ff 46 08          incq   %gs:0x8(%rsi)
> > >    5:   c3                      ret
> > >    6:   cc                      int3
> > >    7:   cc                      int3
> > >    8:   cc                      int3
> > >    9:   cc                      int3
> > >    a:   66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> > >   11:   00 00 00 00
> > >   15:   90                      nop
> > > [14591.541698] RSP: 0018:ffffd0c6094f7d88 EFLAGS: 00010202
> > > [14591.541700] RAX: 0000000000000000 RBX: ffff8ef67492be08 RCX: 00000=
00000000000
> > > [14591.541701] RDX: 0000000000000002 RSI: 0000000000000010 RDI: ffff8=
ef67492be38
> > > [14591.541702] RBP: ffffd0c6094f7df8 R08: 0000000000000000 R09: 00000=
000fffffffd
> > > [14591.541703] R10: 0000000000000001 R11: 00000000ffffffff R12: 00000=
00000000000
> > > [14591.541703] R13: ffff8ef70d8143d0 R14: 0000000000000001 R15: 00000=
00000000000
> > > [14591.541704] FS:  0000000000000000(0000) GS:ffff8efd88e65000(0000) =
knlGS:0000000000000000
> > > [14591.541705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [14591.541706] CR2: ffff8efd88e65018 CR3: 00000001d0184000 CR4: 00000=
00000f50ef0
> > > [14591.541707] PKRU: 55555554
> > > [14591.541708] Call Trace:
> > > [14591.541710]  <TASK>
> > > [14591.541711] dispatch_hid_bpf_output_report (drivers/hid/bpf/hid_bp=
f_dispatch.c:148)
> > > [14591.541716] hid_hw_output_report (drivers/hid/hid-core.c:2500 driv=
ers/hid/hid-core.c:2520)
> > > [14591.541717] hidinput_led_worker (drivers/hid/hid-input.c:1838)
> > > [14591.541719] process_one_work (kernel/workqueue.c:3238)
> > > [14591.541721] worker_thread (kernel/workqueue.c:3313 (discriminator =
2) kernel/workqueue.c:3400 (discriminator 2))
> > > [14591.541723] ? rescuer_thread (kernel/workqueue.c:3346)
> > > [14591.541724] kthread (kernel/kthread.c:464)
> > > [14591.541727] ? kthreads_online_cpu (kernel/kthread.c:413)
> > > [14591.541729] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [14591.541731] ? kthreads_online_cpu (kernel/kthread.c:413)
> > > [14591.541733] ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> > > [14591.541737]  </TASK>
> > > [14591.541738] Modules linked in: mmc_block rpmb_core udp_diag tcp_di=
ag inet_diag xt_mark ccm snd_hrtimer snd_seq_dummy snd_seq_midi snd_seq_oss=
 snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device xt_CHECKSUM xt_MASQU=
ERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain=
_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun bridge stp llc n=
f_tables qrtr uhid rfcomm cmac algif_hash algif_skcipher af_alg overlay bne=
p sunrpc vfat fat btusb uvcvideo btrtl videobuf2_vmalloc btintel uvc videob=
uf2_memops btbcm videobuf2_v4l2 btmtk videobuf2_common bluetooth videodev m=
c intel_rapl_msr amd_atl intel_rapl_common snd_acp_legacy_mach snd_acp_mach=
 snd_soc_nau8821 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm snd_soc_dmi=
c snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_s=
of_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xte=
nsa_dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match snd_hda_cod=
ec_realtek snd_amd_sdw_acpi soundwire_amd snd_hda_codec_generic
> > > [14591.541775]  soundwire_generic_allocation snd_hda_scodec_component=
 soundwire_bus snd_soc_sdca snd_hda_codec_hdmi snd_soc_core mt7925e snd_hda=
_intel snd_compress mt7925_common ac97_bus snd_intel_dspcfg kvm_amd mt792x_=
lib snd_pcm_dmaengine snd_intel_sdw_acpi snd_rpl_pci_acp6x mt76_connac_lib =
snd_hda_codec snd_acp_pci kvm mt76 snd_amd_acpi_mach snd_hda_core snd_acp_l=
egacy_common irqbypass think_lmi snd_pci_acp6x snd_hwdep rapl snd_ctl_led p=
cspkr mac80211 snd_pcm_oss firmware_attributes_class lenovo_wmi_hotkey_util=
ities snd_mixer_oss snd_pci_acp5x libarc4 snd_pcm wmi_bmof snd_rn_pci_acp3x=
 spd5118 snd_timer snd_acp_config cfg80211 snd snd_soc_acpi hid_sensor_als =
soundcore amdxdna amd_pmf hid_sensor_trigger snd_pci_acp3x k10temp rfkill i=
ndustrialio_triggered_buffer amdtee kfifo_buf joydev hid_sensor_iio_common =
ccp industrialio mousedev platform_profile amd_pmc mac_hid sch_fq_codel uin=
put i2c_dev parport_pc ppdev lp parport nvme_fabrics nfnetlink ip_tables x_=
tables hid_logitech_hidpp hid_logitech_dj usbhid dm_crypt
> > > [14591.541811]  encrypted_keys trusted asn1_encoder tee dm_mod raid10=
 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 r=
aid0 linear md_mod igc ptp pps_core r8153_ecm r8152 cdc_ether usbnet mii am=
dgpu i2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks polyval_clm=
ulni polyval_generic drm_exec drm_suballoc_helper ghash_clmulni_intel amdxc=
p sha512_ssse3 drm_buddy sdhci_pci sha256_ssse3 sp5100_tco r8169 nvme sdhci=
_uhs2 gpu_sched sha1_ssse3 serio_raw hid_sensor_custom sdhci nvme_core real=
tek aesni_intel ucsi_acpi atkbd drm_display_helper cqhci libps2 crypto_simd=
 typec_ucsi hid_multitouch i2c_piix4 nvme_keyring mdio_devres hid_sensor_hu=
b hid_generic thunderbolt vivaldi_fmap cryptd typec cec libphy mmc_core amd=
_sfh video i8042 nvme_auth i2c_smbus roles i2c_hid_acpi serio wmi i2c_hid
> > > [14591.541846] CR2: ffff8efd88e65018
> > > [14591.541848] ---[ end trace 0000000000000000 ]---
> >=20
> > So what we have here is a function that takes two parameters: what
> > looks like an index in RSI, and a pointer to a structure in RDI.
> > Looking at the register dump, RSI ends up with the value
> > 0000000000000010, which could very likely be an index of 1 shifted and
> > added to a NULL pointer from the structure.  On the old zero-based
> > percpu, that would be a valid address, but would corrupt whatever was
> > there.  So I don't think this is a problem with the bisected commit,
> > it just exposed an existing bug.
>=20
> Brian,
>=20
> Thanks for your explanation!
>=20
> With your information, I think there is a race when unplugging as
> Benjamin said. Thus, I double-checked the bpftrace output (in my
> previous reply) and found:
>=20
>    .bpf =3D {
>       .device_data =3D 0x0, .allocated_data =3D 0, .destroyed =3D 1,=20

yep, that's the race I was expecting. Thankfully, the boolean is there,
so we can detect it.

>       [...]
>       .srcu =3D {
>          .srcu_ctrp =3D 0x61896b5b0290, .sda =3D 0x0, .dep_map =3D {  },
>          .srcu_sup =3D 0x0
>       }
>    }
>=20
> So yes, the device was destroyed with a dangling led work.
>=20
> Benjemin,
>=20
> I applied the patch below, and now my setup is usable without the need
> to reboot again and again to make USB recover. The patch doesn't fix
> the bug itself, but=C2=A0exposes race bugs in a gentle manner once they
> exist, preventing the case we are currently dealing with - another low
> level change exposed an existing bug in a destructive way.
>=20
> Is the patch worth submitting? If so, do you have any opinion on it?

Yes, definitely worth submitting, and it should be sent to the next -rc
HID batch.

More comments inlined

>=20
> Will keep debugging to reveal more details and try to fix the root
> cause...
>=20
> > Brian Gerst
>=20
> Thanks,
> Rong
>=20
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf=
_dispatch.c
> index 2e96ec6a3073..b9d19416c243 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/btf.h>
>  #include <linux/btf_ids.h>
> +#include <linux/bug.h>
>  #include <linux/filter.h>
>  #include <linux/hid.h>
>  #include <linux/hid_bpf.h>
> @@ -38,6 +39,9 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, =
enum hid_report_type type
>  	struct hid_bpf_ops *e;
>  	int ret;
> =20
> +	if (WARN_ON(hdev->bpf.destroyed))

I wonder if we really need to WARN_ON. The boolean is there to prevent
the races, so if think it's fine to silently return.

In Petr's patch, he used an 'unlikely()' which might help a bit
optimizing the code.

And thanks for fixing in raw_requests() and output_report(). In
device_event(), I'm not 100% sure we need the guard because the hook
should not be sent if a device is being removed, but I guess better be
safe.

Cheers,
Benjamin

> +		return ERR_PTR(-ENODEV);
> +
>  	if (type >=3D HID_REPORT_TYPES)
>  		return ERR_PTR(-EINVAL);
> =20
> @@ -93,6 +97,9 @@ int dispatch_hid_bpf_raw_requests(struct hid_device *hd=
ev,
>  	struct hid_bpf_ops *e;
>  	int ret, idx;
> =20
> +	if (WARN_ON(hdev->bpf.destroyed))
> +		return -ENODEV;
> +
>  	if (rtype >=3D HID_REPORT_TYPES)
>  		return -EINVAL;
> =20
> @@ -130,6 +137,9 @@ int dispatch_hid_bpf_output_report(struct hid_device =
*hdev,
>  	struct hid_bpf_ops *e;
>  	int ret, idx;
> =20
> +	if (WARN_ON(hdev->bpf.destroyed))
> +		return -ENODEV;
> +
>  	idx =3D srcu_read_lock(&hdev->bpf.srcu);
>  	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
>  				 srcu_read_lock_held(&hdev->bpf.srcu)) {
> --=20

