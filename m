Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC3470F3BB
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 12:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjEXKI0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 06:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjEXKIZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 06:08:25 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C93EBF;
        Wed, 24 May 2023 03:08:24 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ae4e49727eso701925ad.1;
        Wed, 24 May 2023 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684922904; x=1687514904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTAewHea8YLSZbY5CEcCY/XV0QWSTJKfvdXloPN5U3Y=;
        b=VpvyEYNWoM/QzRL7GJrPCFIlXiCFkBHLLgV52n3fsf/5REkX+f/pn1OSw/6t8cQAec
         spB9nn6vMPeXpzgATqwDVuMmS8EZJ4+QBen5nHxdD9Gq1ez0YDgo0Xd5aNj7d21q1UFG
         +06qTeJwFgY83xpm4fGpm6a75oPVJwRz67rcAH1cfM3/e3UQiOE8Oj8P+Daw5pKtXApG
         L/SUuvDobYtDB8YUzDs7AbOTU/y6Rl7xh4A6MzlCik+NpfSowMhvRsiYkDTo90ekx2W5
         TDlHRu/7A+jgX1bPYDDOL/a3WZh4C4IHPLZeM9Wcr+Vcm0bn8kwgEnec1m4XkrJmiKQo
         fD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684922904; x=1687514904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTAewHea8YLSZbY5CEcCY/XV0QWSTJKfvdXloPN5U3Y=;
        b=Qec8DJCBloY3Rzyhz1Ipsw1grs/dWGX8itpHzpsKTVsFzUM8gce2btQw+4rjOk4pPt
         CL7U26o829bEAI4jLFxOj6W3nvDnVtIUvjHM+oJxh+Ox1PhEPf/YKk4Ief+lLI4Wd98p
         pFfXuzaaURfEZUhMyWJDUac0hdYCHDltWybO2U6doPdTnavQ7T8C7pT3xaXRvQEGbD8y
         aYEBTzh0anCrPuBXXhyCT2CHaicEkLXJvoNezL830krYDfCTuWnJlK9KZ0+X6dEu2ctW
         +O+4uucr22lIT6WYdd4G4dBcrkPyj+VqEE6qVB8wjPc6scYyFGLTo4wQMb88qD0d6qyb
         hOgQ==
X-Gm-Message-State: AC+VfDzJaqjYj2DVilKjE8zYXyJvEucnZMHAZ4r98PaQTboLvs3X7Yd1
        YH6nQhLwk87LpNsdxBhD0SQ=
X-Google-Smtp-Source: ACHHUZ40ZSsvLQqPLPbHUyxcFwxzuURtJnAHGAu8S/fFb6Xiyz9kkWfyuXAWna9+Y0Ni4X3vSqLWbQ==
X-Received: by 2002:a17:903:124a:b0:1ad:e198:c4f2 with SMTP id u10-20020a170903124a00b001ade198c4f2mr20306134plh.18.1684922903808;
        Wed, 24 May 2023 03:08:23 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902e54700b001aae625e422sm8363548plf.37.2023.05.24.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 03:08:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id E7904106AFC; Wed, 24 May 2023 17:08:19 +0700 (WIB)
Date:   Wed, 24 May 2023 17:08:19 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org
Cc:     Linux Regressions <regressions@lists.linux.dev>,
        Linux Input Devices <linux-input@vger.kernel.org>,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZG3iE4l5X0V4WMdI@debian.me>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2ItIkkIzs+ONvBcs"
Content-Disposition: inline
In-Reply-To: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--2ItIkkIzs+ONvBcs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 01:27:57AM +0800, Haochen Tong wrote:
> Hi,
>=20
> Since kernel 6.3.0 (and also 6.4rc3), on a ThinkPad Z13 system with Arch
> Linux, I've noticed that the amd_sfh driver spews a lot of stack traces
> during boot. Sometimes it is an oops:
>=20
> BUG: unable to handle page fault for address: 000000000001000f
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 8 PID: 457 Comm: (udev-worker) Not tainted 6.3.3-arch1-1 #1
> fa7b7e0107004b3021a57a74b951e0a25e7e8584
> Hardware name: LENOVO 21D2CTO1WW/21D2CTO1WW, BIOS N3GET47W (1.27 )
> 12/08/2022
> RIP: 0010:amd_sfh_get_report+0x1e/0x110 [amd_sfh]
> Code: 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 57
> 41 56 41 55 41 54 55 53 48 8b 87 60 1d 00 00 48 8b 68 08 <8b> 45 10 85 c0=
 0f
> 84 a9 00 00 00 49 89 fc 41 89 f7 41 89 d6 31 db
> RSP: 0018:ffffb164426f3a20 EFLAGS: 00010246
> RAX: ffff9b0ae6b7bd00 RBX: ffff9b0ac0f46000 RCX: 0000000000000000
> RDX: 0000000000000002 RSI: 0000000000000002 RDI: ffff9b0ac0f46000
> RBP: 000000000000ffff R08: ffffb164426f3ab8 R09: ffffb164426f3ab8
> R10: 000000000020031b R11: ffff9b0ace40ac00 R12: ffff9b0ace40ac00
> R13: 0000000000000002 R14: 0000000000000002 R15: ffff9b0acd213010
> FS:  00007fe9ceb82200(0000) GS:ffff9b1122000000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000001000f CR3: 000000010940c000 CR4: 0000000000750ee0
> PKRU: 55555554
> Call Trace:
>   <TASK>
>   amdtp_hid_request+0x36/0x50 [amd_sfh
> 2e3095779aada9fdb1764f08ca578ccb14e41fe4]
>   sensor_hub_get_feature+0xad/0x170 [hid_sensor_hub
> d6157999c9d260a1bfa6f27d4a0dc2c3e2c5654e]
>   hid_sensor_parse_common_attributes+0x217/0x310 [hid_sensor_iio_common
> 07a7935272aa9c7a28193b574580b3e953a64ec4]
>   hid_gyro_3d_probe+0x7f/0x2e0 [hid_sensor_gyro_3d
> 9f2eb51294a1f0c0315b365f335617cbaef01eab]
>   platform_probe+0x44/0xa0
>   really_probe+0x19e/0x3e0
>   ? __pfx___driver_attach+0x10/0x10
>   __driver_probe_device+0x78/0x160
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xd2/0x1c0
>   bus_for_each_dev+0x88/0xd0
>   bus_add_driver+0x116/0x220
>   driver_register+0x59/0x100
>   ? __pfx_init_module+0x10/0x10 [hid_sensor_gyro_3d
> 9f2eb51294a1f0c0315b365f335617cbaef01eab]
>   do_one_initcall+0x5d/0x240
>   do_init_module+0x4a/0x200
>   __do_sys_init_module+0x17f/0x1b0
>   do_syscall_64+0x60/0x90
>   ? ksys_read+0x6f/0xf0
>   ? syscall_exit_to_user_mode+0x1b/0x40
>   ? do_syscall_64+0x6c/0x90
>   ? exc_page_fault+0x7c/0x180
>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
> RIP: 0033:0x7fe9ce721f9e
> Code: 48 8b 0d bd ed 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00
> 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff=
 ff
> 73 01 c3 48 8b 0d 8a ed 0c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffd280dd828 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> RAX: ffffffffffffffda RBX: 000055b72a37f630 RCX: 00007fe9ce721f9e
> RDX: 00007fe9cec7a343 RSI: 00000000000077f8 RDI: 000055b72a56c7f0
> RBP: 00007fe9cec7a343 R08: 00000000000077f8 R09: 0000000000000000
> R10: 000000000001a0a1 R11: 0000000000000246 R12: 0000000000020000
> R13: 000055b72a363b90 R14: 000055b72a37f630 R15: 000055b72a36a070
>   </TASK>
> Modules linked in: hid_sensor_accel_3d(+) hid_sensor_gyro_3d(+) qrtr
> hid_sensor_trigger snd_sof industrialio_triggered_buffer ath11k_pci(+)
> kfifo_buf snd_sof_utils hid_sensor_iio_common joydev ath11k industrialio
> snd_soc_core mousedev qmi_helpers snd_compress hid_sensor_hub
> snd_hda_scodec_cs35l41_spi ac97_bus snd_hda_codec_realtek(+)
> snd_pcm_dmaengine intel_rapl_msr snd_hda_codec_hdmi snd_hda_codec_generic
> intel_rapl_common mac80211 snd_pci_ps btusb snd_rpl_pci_acp6x btrtl
> snd_hda_intel edac_mce_amd uvcvideo btbcm snd_acp_pci snd_intel_dspcfg
> snd_pci_acp6x videobuf2_vmalloc snd_intel_sdw_acpi libarc4 uvc btintel
> snd_usb_audio(+) snd_pci_acp5x videobuf2_memops btmtk snd_hda_codec kvm_a=
md
> videobuf2_v4l2 snd_hda_scodec_cs35l41_i2c snd_usbmidi_lib
> snd_hda_scodec_cs35l41 snd_rn_pci_acp3x ucsi_acpi bluetooth videodev
> snd_hda_core typec_ucsi snd_acp_config snd_hda_cs_dsp_ctls wacom(+)
> hid_multitouch cfg80211 snd_rawmidi sp5100_tco kvm snd_seq_device cs_dsp
> videobuf2_common typec ecdh_generic snd_soc_acpi
>   think_lmi snd_hwdep snd_pcm irqbypass crc16 snd_soc_cs35l41_lib mhi
> thunderbolt firmware_attributes_class snd_pci_acp3x amd_sfh(+) k10temp
> psmouse roles rapl i2c_piix4 mc snd_timer wmi_bmof serial_multi_instantia=
te
> i2c_hid_acpi acpi_tad i2c_hid amd_pmf amd_pmc mac_hid sch_fq tcp_bbr
> dm_multipath i2c_dev crypto_user fuse loop zram ip_tables x_tables xfs
> libcrc32c crc32c_generic dm_crypt cbc encrypted_keys trusted asn1_encoder
> tee usbhid dm_mod amdgpu i2c_algo_bit serio_raw thinkpad_acpi drm_ttm_hel=
per
> atkbd libps2 crct10dif_pclmul vivaldi_fmap crc32_pclmul ledtrig_audio
> crc32c_intel polyval_clmulni ttm polyval_generic drm_buddy nvme gf128mul
> platform_profile gpu_sched ghash_clmulni_intel sha512_ssse3 snd aesni_int=
el
> soundcore drm_display_helper crypto_simd rfkill nvme_core xhci_pci cryptd
> cec ccp xhci_pci_renesas i8042 video nvme_common serio wmi
> CR2: 000000000001000f
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:amd_sfh_get_report+0x1e/0x110 [amd_sfh]
> Code: 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 57
> 41 56 41 55 41 54 55 53 48 8b 87 60 1d 00 00 48 8b 68 08 <8b> 45 10 85 c0=
 0f
> 84 a9 00 00 00 49 89 fc 41 89 f7 41 89 d6 31 db
> RSP: 0018:ffffb164426f3a20 EFLAGS: 00010246
> RAX: ffff9b0ae6b7bd00 RBX: ffff9b0ac0f46000 RCX: 0000000000000000
> RDX: 0000000000000002 RSI: 0000000000000002 RDI: ffff9b0ac0f46000
> RBP: 000000000000ffff R08: ffffb164426f3ab8 R09: ffffb164426f3ab8
> R10: 000000000020031b R11: ffff9b0ace40ac00 R12: ffff9b0ace40ac00
> R13: 0000000000000002 R14: 0000000000000002 R15: ffff9b0acd213010
> FS:  00007fe9ceb82200(0000) GS:ffff9b1122000000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000001000f CR3: 000000010940c000 CR4: 0000000000750ee0
> PKRU: 55555554
>=20
> Sometimes it is a list corruption in the same function with a similar sta=
ck:
>=20
> ------------[ cut here ]------------
> list_add corruption. next is NULL.
> WARNING: CPU: 5 PID: 433 at lib/list_debug.c:25 __list_add_valid+0x57/0xa0
> ...
> CPU: 5 PID: 433 Comm: (udev-worker) Not tainted 6.4.0-rc3-1-mainline #1
> b60166e85cb97a6631db26f9dcda0196ed7a0c93
> Hardware name: LENOVO 21D2CTO1WW/21D2CTO1WW, BIOS N3GET47W (1.27 )
> 12/08/2022
> RIP: 0010:__list_add_valid+0x57/0xa0
> Code: 01 00 00 00 c3 cc cc cc cc 48 c7 c7 58 91 e6 9a e8 1e b9 a8 ff 0f 0b
> 31 c0 c3 cc cc cc cc 48 c7 c7 80 91 e6 9a e8 09 b9 a8 ff <0f> 0b eb e9 48=
 89
> c1 48 c7 c7 a8 91 e6 9a e8 f6 b8 a8 ff 0f 0b eb
> RSP: 0018:ffffad9dc0c7bb10 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: ffff92d5a8099448 RCX: 0000000000000027
> RDX: ffff92dbe1f61688 RSI: 0000000000000001 RDI: ffff92dbe1f61680
> RBP: ffff92d59ea93508 R08: 0000000000000000 R09: ffffad9dc0c7b9a0
> R10: 0000000000000003 R11: ffffffff9b6ca808 R12: 0000000000000000
> R13: ffff92d5a8099440 R14: ffff92d59ea93760 R15: 0000000000000002
> FS:  00007fbaf0262200(0000) GS:ffff92dbe1f40000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005651de666000 CR3: 000000011cfee000 CR4: 0000000000750ee0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  amd_sfh_get_report+0xba/0x110 [amd_sfh
> 78bf82e66cdb2ccf24cbe871a0835ef4eedddb17]
>  amdtp_hid_request+0x36/0x50 [amd_sfh
> 78bf82e66cdb2ccf24cbe871a0835ef4eedddb17]
>  sensor_hub_get_feature+0xad/0x170 [hid_sensor_hub
> 30e53e2c49ea1702e2482c0b3860e22265679e39]
>  hid_sensor_parse_common_attributes+0x217/0x310 [hid_sensor_iio_common
> ed7fba7a4d4147d48156e6a4b2a034ad3fc94350]
>  hid_gyro_3d_probe+0x7f/0x2e0 [hid_sensor_gyro_3d
> 10978a2cdfc8979f2a7366fcd005e0ea826088eb]
>  platform_probe+0x44/0xa0
>  really_probe+0x19e/0x3e0
>  ? __pfx___driver_attach+0x10/0x10
>  __driver_probe_device+0x78/0x160
>  driver_probe_device+0x1f/0x90
>  __driver_attach+0xd2/0x1c0
>  bus_for_each_dev+0x88/0xd0
>  bus_add_driver+0x116/0x220
>  driver_register+0x59/0x100
>  ? __pfx_hid_gyro_3d_platform_driver_init+0x10/0x10 [hid_sensor_gyro_3d
> 10978a2cdfc8979f2a7366fcd005e0ea826088eb]
>  do_one_initcall+0x5d/0x240
>  do_init_module+0x60/0x240
>  __do_sys_init_module+0x17f/0x1b0
>  do_syscall_64+0x60/0x90
>  ? exc_page_fault+0x7f/0x180
>  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> RIP: 0033:0x7fbaf06c0f9e
> Code: 48 8b 0d bd ed 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00
> 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff=
 ff
> 73 01 c3 48 8b 0d 8a ed 0c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffc5ce88528 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> RAX: ffffffffffffffda RBX: 00005651de36dff0 RCX: 00007fbaf06c0f9e
> RDX: 00007fbaf0ba9343 RSI: 00000000000079f0 RDI: 00005651de646fe0
> RBP: 00007fbaf0ba9343 R08: 00000000000079f0 R09: 0000000000000000
> R10: 0000000000019fb1 R11: 0000000000000246 R12: 0000000000020000
> R13: 00005651de45fb10 R14: 00005651de36dff0 R15: 00005651de44d5f0
>  </TASK>
> ---[ end trace 0000000000000000 ]---
>=20
> This occurs during almost every boot. When it happens there is usually a
> (udev-worker) process lingering forever, which is unkillable and even
> prevents shutdown.
>=20
> Looking at past journals it never happened before 6.3 so I believe it is a
> regression.
>=20
> Relevant device:
> 63:00.7 Signal processing controller [1180]: Advanced Micro Devices, Inc.
> [AMD] Sensor Fusion Hub [1022:15e4]
>         Subsystem: Lenovo Sensor Fusion Hub [17aa:22f1]
>         Kernel driver in use: pcie_mp2_amd
>         Kernel modules: amd_sfh
>=20

Thanks for the bug report. I'm adding it to regzbot:

#regzbot ^introduced: v6.2..v6.3
#regzbot title: amd_sfh driver causes kernel oops (udev-worker becomes zomb=
ie) on ThinkPad Z13

--=20
An old man doll... just what I always wanted! - Clara

--2ItIkkIzs+ONvBcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG3iDgAKCRD2uYlJVVFO
o7T4AP4tfdRbwAJr1D1pkhxYpLbcrKGB0AE4qJob/yNuNsFHGwD+PrjKScbHE3QZ
xBCP+Qyhwxgr0iuTAvRBndgTxKdWUg8=
=+22K
-----END PGP SIGNATURE-----

--2ItIkkIzs+ONvBcs--
