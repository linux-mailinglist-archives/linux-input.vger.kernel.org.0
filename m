Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BBA3ED8BF
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 16:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhHPOOU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 10:14:20 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56448 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhHPOOU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 10:14:20 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 89BEF1FEC8;
        Mon, 16 Aug 2021 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1629123227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LmYQtFY9vZkOT+WFU3QdNowIvuh3YRm1nrG1HorZCIY=;
        b=eZZRssye5ejKMJ5oyIt+XoWIzU6IUtqgRzRjHW0dNT7/mFqpizMwaCNyrl0vnNXGKgzvd6
        5ipn3Jf8MuoGMHDnHUMHYuuMxez+TK1KTPL0Uy2TRKSj0U6rExB+KEiuQrj9YA3N1AY+li
        DPK2+uecrLSloc7Ie6TPDD8GVgSHTOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1629123227;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LmYQtFY9vZkOT+WFU3QdNowIvuh3YRm1nrG1HorZCIY=;
        b=MPMY+LK3SiYZ+QSONFciycRTqTd9yr285652pDl4W14F2DlKuRAsVv8Y67b74Pl+cohxIO
        ViN/6D95c/vbu2DA==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 42E0CA3B85;
        Mon, 16 Aug 2021 14:13:47 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id 2A79F6082D; Mon, 16 Aug 2021 16:13:47 +0200 (CEST)
Date:   Mon, 16 Aug 2021 16:13:47 +0200
From:   Michal Kubecek <mkubecek@suse.cz>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
Message-ID: <20210816141347.zougsudwe5tqgkpt@lion.mk-sys.cz>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <YRpnfJ719DwPu2B0@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7xn6ljvnskvplpnk"
Content-Disposition: inline
In-Reply-To: <YRpnfJ719DwPu2B0@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--7xn6ljvnskvplpnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 03:26:20PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 16, 2021 at 03:00:59PM +0200, Michal Kubecek wrote:
> > Hello,
> >=20
> > starting with v5.14-rc1, my kernel log gets flooded with messages
> >=20
> >   hid-generic 0003:051D:0002.0002: control queue full
> >=20
> > at rate of ~33 per second. Device 051d:0002 is an APC UPS (BR-650 VA).
> > I bisected the issue to commit
> >=20
> >   7652dd2c5cb7 ("USB: core: Check buffer length matches wLength for con=
trol transfers")
> >=20
> > Reverting this commit on top of v5.14-rc6 resolves the issue. I suspect
> > the problem is some missing cleanup when usb_submit_urb() bails out on
> > the newly added check but I'm not familiar enough with the code to see
> > what is missing or if the problem is on USB or HID side.
>=20
> But the message in the above commit does not match the message you are
> seeing in your log.
>=20
> Your message is coming from the hid-core.c file, where it checks to
> verify if you have enough room in the buffer.  Ah, is the buffer filling
> up because a driver is trying to send the wrong amount of data?

Yes, that seems to be the case, I just wasn't sure if it's USB or HID
side who is responsible for discarding the message.

I replaced the dev_dbg() in usb_submit_urb() with dev_WARN_ONCE() and
got this stack trace:

  [   31.402146] ------------[ cut here ]------------
  [   31.402148] usb 5-1: BOGUS control len 4 doesn't match transfer length=
 64
  [   31.402176] WARNING: CPU: 10 PID: 2906 at drivers/usb/core/urb.c:414 u=
sb_submit_urb+0x676/0x6f0 [usbcore]
  [   31.402188] Modules linked in: af_packet(E) deflate(E) twofish_generic=
(E) twofish_avx_x86_64(E) twofish_x86_64_3way(E) twofish_x86_64(E) twofish_=
common(E) camellia_generic(E) camellia_aesni_avx2(E) camellia_aesni_avx_x86=
_64(E) camellia_x86_64(E) ppdev(E) parport_pc(E) parport(E) vmw_vsock_vmci_=
transport(E) vsock(E) serpent_avx2(E) serpent_avx_x86_64(E) vmw_vmci(E) ser=
pent_sse2_x86_64(E) serpent_generic(E) xt_REDIRECT(E) blowfish_generic(E) x=
t_MASQUERADE(E) blowfish_x86_64(E) blowfish_common(E) xt_nat(E) iptable_nat=
(E) nf_nat(E) cast5_avx_x86_64(E) cast5_generic(E) cast_common(E) des_gener=
ic(E) libdes(E) cmac(E) xcbc(E) xt_LOG(E) rmd160(E) nf_log_syslog(E) af_key=
(E) xfrm_algo(E) xt_state(E) xt_conntrack(E) nf_conntrack(E) nf_defrag_ipv6=
(E) nf_defrag_ipv4(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_tcpudp(E) xt_set(E=
) iptable_filter(E) ip_tables(E) x_tables(E) bpfilter(E) ip_set_hash_ip(E) =
ip_set(E) nfnetlink(E) 8021q(E) garp(E) stp(E) mrp(E) llc(E) iscsi_ibft(E) =
iscsi_boot_sysfs(E) rfkill(E)
  [   31.402208]  snd_seq_dummy(E) snd_seq_oss(E) snd_emu10k1_synth(E) snd_=
emux_synth(E) snd_seq_midi_emul(E) snd_seq_virmidi(E) snd_seq_midi(E) snd_s=
eq_midi_event(E) snd_seq(E) dmi_sysfs(E) msr(E) dm_crypt(E) essiv(E) authen=
c(E) trusted(E) asn1_encoder(E) tee(E) xfs(E) libcrc32c(E) amdgpu(E) i2c_de=
v(E) drm_ttm_helper(E) ttm(E) intel_rapl_msr(E) iommu_v2(E) intel_rapl_comm=
on(E) gpu_sched(E) crct10dif_pclmul(E) uvcvideo(E) crc32_pclmul(E) videobuf=
2_vmalloc(E) drm_kms_helper(E) videobuf2_memops(E) videobuf2_v4l2(E) syscop=
yarea(E) ghash_clmulni_intel(E) videobuf2_common(E) sysfillrect(E) sysimgbl=
t(E) fb_sys_fops(E) snd_usb_audio(E) aesni_intel(E) videodev(E) cec(E) snd_=
usbmidi_lib(E) wmi_bmof(E) gigabyte_wmi(E) crypto_simd(E) sp5100_tco(E) mc(=
E) joydev(E) tiny_power_button(E) cryptd(E) pcspkr(E) k10temp(E) i2c_piix4(=
E) rc_core(E) ccp(E) igb(E) i2c_algo_bit(E) dca(E) thermal(E) wmi(E) acpi_c=
pufreq(E) button(E) fuse(E) drm(E) configfs(E) uas(E) usb_storage(E) ext4(E=
) mbcache(E) jbd2(E)
  [   31.402228]  hid_generic(E) usbhid(E) xhci_pci(E) xhci_pci_renesas(E) =
xhci_hcd(E) crc32c_intel(E) usbcore(E) nvme(E) nvme_core(E) snd_emu10k1(E) =
snd_hwdep(E) snd_util_mem(E) snd_ac97_codec(E) ac97_bus(E) snd_pcm(E) snd_t=
imer(E) snd_rawmidi(E) snd_seq_device(E) snd(E) soundcore(E) sg(E) dm_multi=
path(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E)
  [   31.402237] CPU: 10 PID: 2906 Comm: apcupsd Kdump: loaded Tainted: G  =
          E     5.14.0-rc6-10.debug-default+ #1 b12577106199f9209d99a871373=
24dbe7cab048c
  [   31.402239] Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS EL=
ITE/X570 AORUS ELITE, BIOS F35 07/08/2021
  [   31.402240] RIP: 0010:usb_submit_urb+0x676/0x6f0 [usbcore]
  [   31.402247] Code: 49 8d bc 24 a8 00 00 00 44 89 04 24 e8 33 3c a1 fb 4=
4 8b 04 24 44 89 f9 4c 89 ea 48 89 c6 48 c7 c7 d8 be 2c c0 e8 d5 c9 ce fb <=
0f> 0b b8 cb ff ff ff e9 db fc ff ff 41 0f b6 4b 02 45 85 d2 48 c7
  [   31.402248] RSP: 0018:ffffbbcd02117d70 EFLAGS: 00010082
  [   31.402249] RAX: 0000000000000000 RBX: ffff9e0e8382b808 RCX: 000000000=
0000027
  [   31.402250] RDX: ffff9e1d7ec9a788 RSI: 0000000000000001 RDI: ffff9e1d7=
ec9a780
  [   31.402251] RBP: ffff9e0e8a296840 R08: ffff9e1d7e7fffe8 R09: 00000000f=
ffeffff
  [   31.402251] R10: ffff9e1d7e100000 R11: ffff9e1d7e100000 R12: ffff9e0e8=
9a2e000
  [   31.402252] R13: ffff9e0e8382b838 R14: 0000000000000000 R15: 000000000=
0000004
  [   31.402252] FS:  00007f4f62617740(0000) GS:ffff9e1d7ec80000(0000) knlG=
S:0000000000000000
  [   31.402253] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [   31.402254] CR2: 0000564fbf9f1e5c CR3: 0000000182c2e000 CR4: 000000000=
0750ee0
  [   31.402255] PKRU: 55555554
  [   31.402255] Call Trace:
  [   31.402258]  hid_submit_ctrl+0x123/0x1f0 [usbhid 8e8ad5bc7e5bd3500c844=
ee14fe819990cb19781]
  [   31.402261]  usbhid_restart_ctrl_queue.isra.0+0x6a/0xd0 [usbhid 8e8ad5=
bc7e5bd3500c844ee14fe819990cb19781]
  [   31.402264]  usbhid_init_reports+0x54/0x140 [usbhid 8e8ad5bc7e5bd3500c=
844ee14fe819990cb19781]
  [   31.402266]  hiddev_ioctl+0x3e0/0x660 [usbhid 8e8ad5bc7e5bd3500c844ee1=
4fe819990cb19781]
  [   31.402268]  ? do_syscall_64+0x69/0x80
  [   31.402271]  ? exit_to_user_mode_prepare+0x77/0x190
  [   31.402273]  ? syscall_exit_to_user_mode+0x18/0x40
  [   31.402274]  ? do_syscall_64+0x69/0x80
  [   31.402274]  ? exit_to_user_mode_prepare+0x129/0x190
  [   31.402275]  __x64_sys_ioctl+0x82/0xb0
  [   31.402278]  do_syscall_64+0x5c/0x80
  [   31.402279]  entry_SYSCALL_64_after_hwframe+0x44/0xae
  [   31.402281] RIP: 0033:0x7f4f61900807
  [   31.402282] Code: b3 66 90 48 8b 05 89 76 2d 00 64 c7 00 26 00 00 00 4=
8 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 59 76 2d 00 f7 d8 64 89 01 48
  [   31.402283] RSP: 002b:00007ffec9317e48 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
  [   31.402284] RAX: ffffffffffffffda RBX: 0000556e717a8a20 RCX: 00007f4f6=
1900807
  [   31.402284] RDX: 0000000000000000 RSI: 0000000000004805 RDI: 000000000=
0000007
  [   31.402285] RBP: 0000556e6f837c34 R08: 0000556e717a89d0 R09: 000000000=
0000000
  [   31.402286] R10: 0000000000000000 R11: 0000000000000246 R12: 0000556e6=
f837da8
  [   31.402286] R13: 0000556e6f837df0 R14: 0000556e6f837dd0 R15: 0000556e7=
17a8a20
  [   31.402287] ---[ end trace 1571b19144fa6b81 ]---

followed by 255 messages like

  [   31.402288] hid-generic 0003:051D:0002.0002: usb_submit_urb(ctrl) fail=
ed: -53

and then continous flood of

  [   37.417079] hid-generic 0003:051D:0002.0002: control queue full

Looking at the code, the primary problem seems to be that the "else"
branch in hid_submit_ctrl() recalculates transfer_buffer_length to
a rounded up value but assigns the original length to wLength.

Michal

--7xn6ljvnskvplpnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmEacpUACgkQ538sG/LR
dpUGywf+Oe8rrAJ/zR7+brdMxJ+hwGCNHzPga90rfMQqf/VZSs5rTIl4iSDNAqEF
ik5pEBBkEsXR70P8fQ4CHReIpiO4Z5N1zsqGpRleLxUFdGYGgraJM5Ppd8XxYB7E
rFBKvn+aBx44ZFBndBvTQDadW2Vk+gsg9m3MaUM6/OIqjn/APNOqcVnIJJOBuzQk
/ZVDjOXoeslO1etoePILUcsp86bRtSwRfUujC1I7A9Qw2eIDMub+RzUrNe6VTVx1
QJygPGgaiIFI5NfpVd0b22BJe7MiwC6TmAn/wDU/oIo5cj+B0iAAhsTOcHlWvS05
xZJYlX6RCC/YTGvvuwRzqzge1KLtqw==
=OqtY
-----END PGP SIGNATURE-----

--7xn6ljvnskvplpnk--
