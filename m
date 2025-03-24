Return-Path: <linux-input+bounces-11130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3CA6D39D
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 05:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2DD3A423A
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 04:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB0322339;
	Mon, 24 Mar 2025 04:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj4dqShK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F0F23A9
	for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 04:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742791318; cv=none; b=XYFUgDhCXG3dSqoH9GfDY4BWXDYZQmu++VbUCympvph70OKbtLQEH15kakFTvDs5rmstOgJM0cmVh3ldvW8/uil4cMYcpyrNK3ZIFhIc+uoMOJ5QZ3dFaFhGnBtLYfkBWlt96NVnOc94X3unkCnaKidq5JXruj6MieGzGX4VHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742791318; c=relaxed/simple;
	bh=GAq2SJFyBb+mM+odRBk7uz8zaw92GSH+DXPQwK0jap0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FLezL0ylQPlADQd8P0uaXxjnfPxyi1n2aIJEjnF3MYf0OVp6Q/dSqrlkcarQ4gggH1WeBFKXpdwkt6UrGRlhr9RlOB4/fdcCyEgYFpgpRHOhPDjRv8UZSnnu0OeGRa3n84tIBO2fX1jce345y0IuYk4PTgkZHok4UpjaUPKyt6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj4dqShK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224171d6826so54370635ad.3
        for <linux-input@vger.kernel.org>; Sun, 23 Mar 2025 21:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742791314; x=1743396114; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9+KDkt/86B+WQn1yKlyhMP89czH6HA/AQHFpgQHeao=;
        b=Bj4dqShKfxuXapusqbPAp1AcnGHlk3hfmDk+m3jqi/1eMA3Krvs+yHwvp89x0rhtc9
         HafZQpfaACHoIA4x8U/Gscb/cYkKlFx0u4WUCKn1lEBWIjQYo14mYQtKRDHloTQwKSuE
         nb28o8bazehCnDXWJxrbT1AdeOPIqQxahhAbd6KfCYdlSb+WRrowN+gbf/VioMX45JHz
         hKh1kgelk5a9Nv2jmcouqerrVjOfoQ5h6lUquVtyGoNIsBpr04M8MGO1TAF435a/79YQ
         KKvbqUilK3V2zgLX2h0Mlt6p6fKJCK+Zvg1F+h+7ftT0qvl6UJaefyKnB6bgFevsBG2N
         1KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742791314; x=1743396114;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o9+KDkt/86B+WQn1yKlyhMP89czH6HA/AQHFpgQHeao=;
        b=as5HntFm8d/hsyNoBlonFMZSm3mF4km89uUZaXAm7WfkIkMf0ASxhL/wyTZk54fpkA
         eeWaKAHA5tlYh1dIzxWbZreNUr/Ip7906+M62c68s9aLJR26E8zP5cI2T4romj4afsr6
         1r0q6NOKcrRQN/e4fg0poV16c/4lpKwZONPT5vp8NKI35TgO8lVSPfZnlABaPZJNwOG3
         k2S2OjSQNxUpvbvbqInA+t4k8sjcCGzR2EYN2meTCd+6TD41aurpNEqFNQJCfGXVI2y9
         OY3LchSnASggmFDNi0rrk3o3A5wHGfJiXenaUTKcCo/MuOmJEpTmDdnRc4E0vXY57V/r
         yjBQ==
X-Gm-Message-State: AOJu0YwWodk7loaFZFLHsdsTFLBTy77hXWSV+pSIr8nekx0tVve0voiQ
	o2iDLU54J0e01j6rOFgop2EKR8CCSOROXagDfIPn+dDsabysvRQAFrR+eJE8EYA=
X-Gm-Gg: ASbGncvU7aNmmqvVcf79mWDrYbRklpdJo/vaP3LoG9o+vRbR/1LE/rT6DDtfXdiFVlT
	8OB3M+EN4q4tkvHujpWMy4v/GMzUs3tny6BvNfH44xRroHHbKMrArlG7e1d7YGlQglOH4h7sKCj
	ab1qPgx8ydRRSqVBryJFTOkgxAWTekY/fvhVGWvRkBZkFRFxanueSy+P2xflPqjtTJP+YLiLBG1
	KNl1j2lpIqjjkwOrlASFZZDKTtdIhaWYNVI7UxumRrgTdtncK9LnNYDMVwhjzfaAGUE7ElENtP9
	tCr9b/+8IFwYh6muha+k1HdkSHaMUQVye9qFN//OAgE+GXBt8lfC+gBVmdztZCTi3mFp0g==
X-Google-Smtp-Source: AGHT+IHOYkb67+tmj9zS2SWDCoQ8DkCCvBSSzX0ZO2VjVfG06XPSiiQJ2yPUesM+E9XWR6xxLMj/pw==
X-Received: by 2002:a05:6a20:2d20:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-1fe42f5315dmr20126861637.20.1742791313665;
        Sun, 23 Mar 2025 21:41:53 -0700 (PDT)
Received: from [127.0.0.1] ([185.220.238.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27db649sm6077424a12.10.2025.03.23.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 21:41:53 -0700 (PDT)
Message-ID: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
Date: Mon, 24 Mar 2025 12:41:41 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
From: chitaotao <chotaotao1qaz2wsx@gmail.com>
Subject: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[1.] One line summary:

Touchpad malfunctions under PS/2; requires 
psmouse.synaptics_intertouch=1 to switch to SMBus.

[2.] Full description:

Kernel log warns: "Your touchpad (PNP: TOS01f6 PNP0f13) says it can 
support a different bus. If i2c-hid and hid-rmi are not used, you might 
want to try setting psmouse.synaptics_intertouch to 1...".
Kernel log contains a lot of "lost sync at byte x" and "issuing 
reconnect request"
Touchpad is unresponsive and only recognizing input intermittently under 
PS/2. Setting psmouse.synaptics_intertouch=1 resolves the issue.
Touchpad is from laptop dynabook G83/FR. Dmesg log at the end.


[3.] Keywords:

psmouse, hid-rmi, i2c-hid, touchpad, SMBus, synaptics_intertouch

[4.] Kernel version:

Linux version 6.14.0-061400rc7-generic (kernel@kathleen) 
(x86_64-linux-gnu-gcc-14 (Ubuntu 14.2.0-4ubuntu2) 14.2.0, GNU ld (GNU 
Binutils for Ubuntu) 2.43.1) #202503170040 SMP PREEMPT_DYNAMIC Mon Mar 
17 01:11:13 UTC 2025

[6.] Reproduction:

Boot without psmouse.synaptics_intertouch=1.
Observe touchpad issues.
Check dmesg for the bus warning.

[7.] Environment:

[7.1] Software:

If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux CHI-U-WI 6.14.0-061400rc7-generic #202503170040 SMP 
PREEMPT_DYNAMIC Mon Mar 17 01:11:13 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

GNU C                   11
GNU Make                4.3
Binutils                2.38
Util-linux              2.37.2
Mount                   2.37.2
Module-init-tools       29
E2fsprogs               1.46.5
Pcmciautils             018
PPP                     2.4.9
Bison                   3.8.2
Flex                    2.6.4
Linux C++ Library       6.0.30
Dynamic linker (ldd)    2.35
Procps                  3.3.17
Net-tools               2.10
Kbd                     2.3.0
Console-tools           2.3.0
Sh-utils                8.32
Udev                    249
Wireless-tools          30
Modules Loaded          ac97_bus acpi_pad aesni_intel af_alg algif_hash 
algif_skcipher autofs4 binfmt_misc blake2b_generic bluetooth bnep btbcm 
btintel btmtk btrfs btrtl btusb cec cfg80211 cmac cmdlinepart coretemp 
cryptd crypto_simd drm_buddy drm_display_helper e1000e efi_pstore exfat 
ghash_clmulni_intel hid hwmon_vid i2c_algo_bit i2c_hid i2c_hid_acpi 
i2c_i801 i2c_mux i2c_smbus i915 industrialio input_leds intel_cstate 
intel_pch_thermal intel_pmc_core intel_powerclamp intel_rapl_common 
intel_rapl_msr intel_tcc_cooling intel_uncore_frequency 
intel_uncore_frequency_common intel_vsec intel_wmi_thunderbolt ip_tables 
iwlmvm iwlwifi joydev kvm kvm_intel libarc4 lp mac80211 mac_hid mc mei 
mei_me msr mtd nls_iso8859_1 nvme nvme_auth nvme_core parport parport_pc 
pinctrl_cannonlake pmt_class pmt_telemetry polyval_clmulni 
polyval_generic ppdev psmouse raid6_pq rapl rc_core rfcomm rmi_core 
rmi_smbus rtsx_pci rtsx_pci_sdmmc sch_fq_codel serio_raw sha1_ssse3 
sha256_ssse3 snd snd_compress snd_hda_codec snd_hda_codec_generic 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_core snd_hda_ext_core 
snd_hda_intel snd_hda_scodec_component snd_hwdep snd_intel_dspcfg 
snd_intel_sdw_acpi snd_pcm snd_pcm_dmaengine snd_rawmidi snd_seq 
snd_seq_device snd_seq_midi snd_seq_midi_event snd_soc_acpi 
snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks snd_soc_avs 
snd_soc_core snd_soc_hdac_hda snd_soc_hda_codec snd_soc_sdca snd_sof 
snd_sof_intel_hda snd_sof_intel_hda_common snd_sof_intel_hda_generic 
snd_sof_intel_hda_mlink snd_sof_pci snd_sof_pci_intel_cnl snd_sof_utils 
snd_sof_xtensa_dsp snd_timer soundcore soundwire_bus soundwire_cadence 
soundwire_generic_allocation soundwire_intel sparse_keymap spi_intel 
spi_intel_pci spi_nor toshiba_acpi ttm typec typec_ucsi uas ucsi_acpi 
usb_storage uvc uvcvideo video videobuf2_common videobuf2_memops 
videobuf2_v4l2 videobuf2_vmalloc videodev wmi wmi_bmof 
x86_pkg_temp_thermal xor x_tables

[7.3] Modules:

rmi_smbus 12288 0 - Live 0x0000000000000000
rmi_core 118784 1 rmi_smbus, Live 0x0000000000000000
psmouse 221184 0 - Live 0x0000000000000000
exfat 106496 1 - Live 0x0000000000000000
rfcomm 102400 4 - Live 0x0000000000000000
snd_hda_codec_realtek 212992 1 - Live 0x0000000000000000
snd_hda_codec_generic 122880 1 snd_hda_codec_realtek, Live 
0x0000000000000000
snd_hda_scodec_component 20480 1 snd_hda_codec_realtek, Live 
0x0000000000000000
cmac 12288 3 - Live 0x0000000000000000
algif_hash 16384 1 - Live 0x0000000000000000
algif_skcipher 16384 1 - Live 0x0000000000000000
af_alg 32768 6 algif_hash,algif_skcipher, Live 0x0000000000000000
bnep 32768 2 - Live 0x0000000000000000
snd_sof_pci_intel_cnl 20480 0 - Live 0x0000000000000000
snd_sof_intel_hda_generic 36864 1 snd_sof_pci_intel_cnl, Live 
0x0000000000000000
soundwire_intel 77824 1 snd_sof_intel_hda_generic, Live 0x0000000000000000
soundwire_cadence 45056 1 soundwire_intel, Live 0x0000000000000000
snd_sof_intel_hda_common 192512 2 
snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic, Live 0x0000000000000000
snd_soc_hdac_hda 24576 1 snd_sof_intel_hda_common, Live 0x0000000000000000
snd_sof_intel_hda_mlink 45056 3 
snd_sof_intel_hda_generic,soundwire_intel,snd_sof_intel_hda_common, Live 
0x0000000000000000
snd_sof_intel_hda 24576 2 
snd_sof_intel_hda_generic,snd_sof_intel_hda_common, Live 0x0000000000000000
snd_hda_codec_hdmi 98304 1 - Live 0x0000000000000000
snd_sof_pci 24576 2 snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic, 
Live 0x0000000000000000
snd_sof_xtensa_dsp 12288 1 snd_sof_intel_hda_generic, Live 
0x0000000000000000
snd_sof 401408 5 
snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic,snd_sof_intel_hda_common,snd_sof_intel_hda,snd_sof_pci, 
Live 0x0000000000000000
snd_sof_utils 16384 1 snd_sof, Live 0x0000000000000000
snd_soc_acpi_intel_match 131072 2 
snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic, Live 0x0000000000000000
snd_soc_acpi_intel_sdca_quirks 12288 1 snd_soc_acpi_intel_match, Live 
0x0000000000000000
soundwire_generic_allocation 24576 1 soundwire_intel, Live 
0x0000000000000000
snd_soc_acpi 16384 2 snd_sof_intel_hda_generic,snd_soc_acpi_intel_match, 
Live 0x0000000000000000
soundwire_bus 126976 3 
soundwire_intel,soundwire_cadence,soundwire_generic_allocation, Live 
0x0000000000000000
snd_soc_sdca 12288 2 snd_soc_acpi_intel_sdca_quirks,soundwire_bus, Live 
0x0000000000000000
snd_soc_avs 204800 0 - Live 0x0000000000000000
snd_soc_hda_codec 24576 1 snd_soc_avs, Live 0x0000000000000000
snd_hda_ext_core 32768 6 
snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_hda_mlink,snd_sof_intel_hda,snd_soc_avs,snd_soc_hda_codec, 
Live 0x0000000000000000
intel_rapl_msr 20480 0 - Live 0x0000000000000000
intel_rapl_common 53248 1 intel_rapl_msr, Live 0x0000000000000000
intel_uncore_frequency 16384 0 - Live 0x0000000000000000
snd_soc_core 434176 6 
soundwire_intel,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof,snd_soc_avs,snd_soc_hda_codec, 
Live 0x0000000000000000
intel_uncore_frequency_common 16384 1 intel_uncore_frequency, Live 
0x0000000000000000
intel_tcc_cooling 12288 0 - Live 0x0000000000000000
snd_compress 36864 2 snd_soc_avs,snd_soc_core, Live 0x0000000000000000
x86_pkg_temp_thermal 20480 0 - Live 0x0000000000000000
ac97_bus 12288 1 snd_soc_core, Live 0x0000000000000000
intel_powerclamp 24576 0 - Live 0x0000000000000000
snd_pcm_dmaengine 16384 1 snd_soc_core, Live 0x0000000000000000
coretemp 24576 0 - Live 0x0000000000000000
binfmt_misc 24576 1 - Live 0x0000000000000000
snd_hda_intel 61440 3 - Live 0x0000000000000000
snd_intel_dspcfg 45056 5 
snd_sof_intel_hda_generic,snd_sof_intel_hda_common,snd_sof,snd_soc_avs,snd_hda_intel, 
Live 0x0000000000000000
snd_intel_sdw_acpi 16384 2 snd_sof_intel_hda_generic,snd_intel_dspcfg, 
Live 0x0000000000000000
kvm_intel 483328 0 - Live 0x0000000000000000
snd_hda_codec 204800 8 
snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_hdac_hda,snd_sof_intel_hda,snd_hda_codec_hdmi,snd_soc_avs,snd_soc_hda_codec,snd_hda_intel, 
Live 0x0000000000000000
snd_hda_core 147456 11 
snd_hda_codec_realtek,snd_hda_codec_generic,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_hda,snd_hda_codec_hdmi,snd_soc_avs,snd_soc_hda_codec,snd_hda_ext_core,snd_hda_intel,snd_hda_codec, 
Live 0x0000000000000000
kvm 1429504 1 kvm_intel, Live 0x0000000000000000
iwlmvm 913408 0 - Live 0x0000000000000000
i915 4730880 4 - Live 0x0000000000000000
snd_hwdep 20480 1 snd_hda_codec, Live 0x0000000000000000
nls_iso8859_1 12288 1 - Live 0x0000000000000000
polyval_clmulni 12288 0 - Live 0x0000000000000000
mac80211 1822720 1 iwlmvm, Live 0x0000000000000000
snd_pcm 196608 13 
snd_sof_intel_hda_generic,soundwire_intel,snd_sof_intel_hda_common,snd_hda_codec_hdmi,snd_sof,snd_sof_utils,snd_soc_avs,snd_soc_core,snd_compress,snd_pcm_dmaengine,snd_hda_intel,snd_hda_codec,snd_hda_core, 
Live 0x0000000000000000
uvcvideo 147456 0 - Live 0x0000000000000000
polyval_generic 12288 1 polyval_clmulni, Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
snd_seq_midi 24576 0 - Live 0x0000000000000000
snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000
videobuf2_vmalloc 20480 2 rmi_core,uvcvideo, Live 0x0000000000000000
libarc4 12288 1 mac80211, Live 0x0000000000000000
sha256_ssse3 32768 0 - Live 0x0000000000000000
snd_rawmidi 57344 1 snd_seq_midi, Live 0x0000000000000000
sha1_ssse3 32768 0 - Live 0x0000000000000000
uvc 12288 1 uvcvideo, Live 0x0000000000000000
aesni_intel 122880 4 - Live 0x0000000000000000
videobuf2_memops 16384 1 videobuf2_vmalloc, Live 0x0000000000000000
drm_buddy 24576 1 i915, Live 0x0000000000000000
btusb 73728 0 - Live 0x0000000000000000
crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
videobuf2_v4l2 36864 2 rmi_core,uvcvideo, Live 0x0000000000000000
btrtl 36864 1 btusb, Live 0x0000000000000000
snd_seq 122880 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
ttm 118784 1 i915, Live 0x0000000000000000
videobuf2_common 90112 5 
rmi_core,uvcvideo,videobuf2_vmalloc,videobuf2_memops,videobuf2_v4l2, 
Live 0x0000000000000000
btintel 69632 1 btusb, Live 0x0000000000000000
cryptd 24576 3 ghash_clmulni_intel,crypto_simd, Live 0x0000000000000000
snd_seq_device 16384 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 
0x0000000000000000
btbcm 24576 1 btusb, Live 0x0000000000000000
input_leds 12288 0 - Live 0x0000000000000000
iwlwifi 659456 1 iwlmvm, Live 0x0000000000000000
rapl 20480 0 - Live 0x0000000000000000
drm_display_helper 282624 1 i915, Live 0x0000000000000000
videodev 364544 3 rmi_core,uvcvideo,videobuf2_v4l2, Live 0x0000000000000000
btmtk 36864 1 btusb, Live 0x0000000000000000
intel_cstate 20480 0 - Live 0x0000000000000000
snd_timer 53248 2 snd_pcm,snd_seq, Live 0x0000000000000000
cec 94208 2 i915,drm_display_helper, Live 0x0000000000000000
intel_wmi_thunderbolt 16384 0 - Live 0x0000000000000000
mc 86016 4 uvcvideo,videobuf2_v4l2,videobuf2_common,videodev, Live 
0x0000000000000000
bluetooth 1015808 34 rfcomm,bnep,btusb,btrtl,btintel,btbcm,btmtk, Live 
0x0000000000000000
serio_raw 20480 0 - Live 0x0000000000000000
cmdlinepart 16384 0 - Live 0x0000000000000000
cfg80211 1449984 3 iwlmvm,mac80211,iwlwifi, Live 0x0000000000000000
rc_core 73728 1 cec, Live 0x0000000000000000
toshiba_acpi 69632 0 - Live 0x0000000000000000
wmi_bmof 12288 0 - Live 0x0000000000000000
spi_nor 163840 0 - Live 0x0000000000000000
snd 143360 20 
snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_sof,snd_soc_core,snd_compress,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer, 
Live 0x0000000000000000
mei_me 53248 0 - Live 0x0000000000000000
sparse_keymap 12288 1 toshiba_acpi, Live 0x0000000000000000
mtd 102400 3 cmdlinepart,spi_nor, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
mei 176128 1 mei_me, Live 0x0000000000000000
i2c_algo_bit 20480 1 i915, Live 0x0000000000000000
intel_pch_thermal 20480 0 - Live 0x0000000000000000
industrialio 139264 1 toshiba_acpi, Live 0x0000000000000000
intel_pmc_core 126976 0 - Live 0x0000000000000000
pmt_telemetry 16384 1 intel_pmc_core, Live 0x0000000000000000
pmt_class 16384 1 pmt_telemetry, Live 0x0000000000000000
acpi_pad 184320 0 - Live 0x0000000000000000
intel_vsec 20480 1 intel_pmc_core, Live 0x0000000000000000
joydev 32768 0 - Live 0x0000000000000000
mac_hid 12288 0 - Live 0x0000000000000000
sch_fq_codel 24576 2 - Live 0x0000000000000000
hwmon_vid 12288 0 - Live 0x0000000000000000
msr 12288 0 - Live 0x0000000000000000
parport_pc 53248 0 - Live 0x0000000000000000
ppdev 24576 0 - Live 0x0000000000000000
lp 28672 0 - Live 0x0000000000000000
parport 73728 3 parport_pc,ppdev,lp, Live 0x0000000000000000
efi_pstore 12288 0 - Live 0x0000000000000000
ip_tables 36864 0 - Live 0x0000000000000000
x_tables 65536 1 ip_tables, Live 0x0000000000000000
autofs4 57344 2 - Live 0x0000000000000000
btrfs 2121728 0 - Live 0x0000000000000000
blake2b_generic 20480 0 - Live 0x0000000000000000
xor 20480 1 btrfs, Live 0x0000000000000000
raid6_pq 126976 1 btrfs, Live 0x0000000000000000
rtsx_pci_sdmmc 36864 0 - Live 0x0000000000000000
nvme 61440 0 - Live 0x0000000000000000
i2c_i801 36864 0 - Live 0x0000000000000000
spi_intel_pci 12288 0 - Live 0x0000000000000000
i2c_smbus 20480 1 i2c_i801, Live 0x0000000000000000
spi_intel 36864 1 spi_intel_pci, Live 0x0000000000000000
nvme_core 229376 1 nvme, Live 0x0000000000000000
e1000e 360448 0 - Live 0x0000000000000000
i2c_mux 16384 1 i2c_i801, Live 0x0000000000000000
nvme_auth 28672 1 nvme_core, Live 0x0000000000000000
ucsi_acpi 12288 0 - Live 0x0000000000000000
i2c_hid_acpi 12288 0 - Live 0x0000000000000000
rtsx_pci 143360 1 rtsx_pci_sdmmc, Live 0x0000000000000000
typec_ucsi 65536 1 ucsi_acpi, Live 0x0000000000000000
i2c_hid 40960 1 i2c_hid_acpi, Live 0x0000000000000000
typec 114688 1 typec_ucsi, Live 0x0000000000000000
hid 266240 1 i2c_hid, Live 0x0000000000000000
video 77824 2 i915,toshiba_acpi, Live 0x0000000000000000
wmi 28672 4 intel_wmi_thunderbolt,toshiba_acpi,wmi_bmof,video, Live 
0x0000000000000000
pinctrl_cannonlake 36864 0 - Live 0x0000000000000000
uas 32768 2 - Live 0x0000000000000000
usb_storage 86016 2 uas, Live 0x0000000000000000


[7.4] Hardware:

/proc/ioports:
0000-0000 : PCI Bus 0000:00
   0000-0000 : dma1
   0000-0000 : pic1
   0000-0000 : timer0
   0000-0000 : timer1
   0000-0000 : keyboard
   0000-0000 : PNP0C09:01
     0000-0000 : EC data
   0000-0000 : keyboard
   0000-0000 : PNP0C09:01
     0000-0000 : EC cmd
   0000-0000 : rtc0
   0000-0000 : dma page reg
   0000-0000 : pic2
   0000-0000 : dma2
   0000-0000 : fpu
   0000-0000 : iTCO_wdt
   0000-0000 : pnp 00:00
   0000-0000 : PNP0C09:01
   0000-0000 : PNP0C09:01
   0000-0000 : PNP0C09:01
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
   0000-0000 : pnp 00:00
   0000-0000 : ACPI PM1a_EVT_BLK
   0000-0000 : ACPI PM1a_CNT_BLK
   0000-0000 : ACPI PM_TMR
   0000-0000 : ACPI PM2_CNT_BLK
   0000-0000 : pnp 00:02
   0000-0000 : ACPI GPE0_BLK
   0000-0000 : pnp 00:06
   0000-0000 : 0000:00:02.0
   0000-0000 : 0000:00:1f.4
     0000-0000 : i801_smbus

/proc/iomem:
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
   00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : PCI Bus 0000:00
     00000000-00000000 : System ROM
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : System RAM
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : ACPI Tables
00000000-00000000 : ACPI Non-volatile Storage
   00000000-00000000 : USBC000:00
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
   00000000-00000000 : Graphics Stolen Memory
00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : PCI Bus 0000:03
     00000000-00000000 : 0000:03:00.0
       00000000-00000000 : nvme
   00000000-00000000 : PCI Bus 0000:02
     00000000-00000000 : 0000:02:00.0
       00000000-00000000 : iwlwifi
   00000000-00000000 : PCI Bus 0000:01
     00000000-00000000 : 0000:01:00.0
       00000000-00000000 : rtsx_pci
   00000000-00000000 : 0000:00:1f.6
     00000000-00000000 : e1000e
00000000-00000000 : PCI ECAM 0000 [bus 00-ff]
   00000000-00000000 : pnp 00:07
00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : pnp 00:05
   00000000-00000000 : INT34BB:00
     00000000-00000000 : INT34BB:00 INT34BB:00
   00000000-00000000 : pnp 00:05
   00000000-00000000 : INT34BB:00
     00000000-00000000 : INT34BB:00 INT34BB:00
   00000000-00000000 : INT34BB:00
     00000000-00000000 : INT34BB:00 INT34BB:00
   00000000-00000000 : pnp 00:05
   00000000-00000000 : Reserved
     00000000-00000000 : 0000:00:1f.5
       00000000-00000000 : 0000:00:1f.5 0000:00:1f.5
   00000000-00000000 : pnp 00:09
   00000000-00000000 : pnp 00:08
   00000000-00000000 : pnp 00:08
   00000000-00000000 : pnp 00:08
   00000000-00000000 : pnp 00:05
00000000-00000000 : Reserved
   00000000-00000000 : IOAPIC 0
00000000-00000000 : Reserved
   00000000-00000000 : HPET 0
     00000000-00000000 : PNP0103:00
00000000-00000000 : pnp 00:07
00000000-00000000 : pnp 00:07
00000000-00000000 : pnp 00:07
00000000-00000000 : pnp 00:07
00000000-00000000 : MSFT0101:00
   00000000-00000000 : MSFT0101:00 MSFT0101:00
00000000-00000000 : pnp 00:07
00000000-00000000 : dmar0
00000000-00000000 : dmar1
00000000-00000000 : Reserved
00000000-00000000 : pnp 00:05
00000000-00000000 : System RAM
   00000000-00000000 : Kernel code
   00000000-00000000 : Kernel rodata
   00000000-00000000 : Kernel data
   00000000-00000000 : Kernel bss
00000000-00000000 : RAM buffer
00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : 0000:00:02.0
   00000000-00000000 : 0000:00:02.0
   00000000-00000000 : 0000:00:1f.3
   00000000-00000000 : 0000:00:14.0
     00000000-00000000 : xhci-hcd
   00000000-00000000 : 0000:00:1f.3
     00000000-00000000 : ICH HD audio
   00000000-00000000 : 0000:00:14.2
   00000000-00000000 : 0000:00:1f.4
   00000000-00000000 : 0000:00:16.0
     00000000-00000000 : mei_me
   00000000-00000000 : 0000:00:14.2
   00000000-00000000 : 0000:00:12.0
     00000000-00000000 : Intel PCH thermal driver


[7.7] Other:

dmesg (reloaded using synaptics_intertouch, then reloaded without it, 
then reloaded it again using synaptics_intertouch):
[    0.857296] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] 
at 0x60,0x64 irq 1,12
[    0.863239] i8042: Detected active multiplexing controller, rev 1.0
[    0.866174] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.866183] serio: i8042 AUX0 port at 0x60,0x64 irq 12
[    0.866245] serio: i8042 AUX1 port at 0x60,0x64 irq 12
[    0.866280] serio: i8042 AUX2 port at 0x60,0x64 irq 12
[    0.866311] serio: i8042 AUX3 port at 0x60,0x64 irq 12
[    0.866502] mousedev: PS/2 mouse device common for all mice
[    2.707090] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[    2.754750] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[    2.754760] psmouse serio2: synaptics: Your touchpad (PNP: TOS01f6 
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are 
not used, you might want to try setting psmouse.synaptics_intertouch to 
1 and report this to linux-input@vger.kernel.org.
[    2.850896] psmouse serio2: synaptics: Touchpad model: 1, fw: 8.16, 
id: 0x1e2b1, caps: 0xf00a23/0x840300/0x12e800/0x400000, board id: 3266, 
fw id: 3150550
[    2.926424] input: SynPS/2 Synaptics TouchPad as 
/devices/platform/i8042/serio2/input/input10
[   11.963694] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[   11.975599] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[   11.988491] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[   12.010345] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[   12.011137] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[   12.011150] psmouse serio2: issuing reconnect request
[   12.928409] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[   12.991210] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  179.843750] psmouse serio2: synaptics: using relaxed packet validation
[  179.850679] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  179.873507] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  179.874503] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  179.882439] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  179.894353] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  179.894359] psmouse serio2: issuing reconnect request
[  180.808081] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  180.855699] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  181.055011] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  181.067372] psmouse serio2: TouchPad at isa0060/serio2/input0 - 
driver resynced.
[  181.081693] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  181.082627] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  181.102040] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  181.102419] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  181.103507] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  181.103519] psmouse serio2: issuing reconnect request
[  182.027030] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  182.074166] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  191.069512] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  191.135017] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  191.135030] psmouse serio2: synaptics: Trying to set up SMBus access
[  191.195737] rmi4_smbus 0-002c: registering SMbus-connected sensor
[  191.326608] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: 
Synaptics, product: TM3266-010, fw id: 3150550
[  191.422111] input: Synaptics TM3266-010 as 
/devices/pci0000:00/0000:00:1f.4/i2c-0/0-002c/rmi4-00/input/input25
[  896.690228] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  896.756082] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  896.756104] psmouse serio2: synaptics: Your touchpad (PNP: TOS01f6 
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are 
not used, you might want to try setting psmouse.synaptics_intertouch to 
1 and report this to linux-input@vger.kernel.org.
[  896.886081] psmouse serio2: synaptics: Touchpad model: 1, fw: 8.16, 
id: 0x1e2b1, caps: 0xf00a23/0x840300/0x12e800/0x400000, board id: 3266, 
fw id: 3150550
[  896.965261] input: SynPS/2 Synaptics TouchPad as 
/devices/platform/i8042/serio2/input/input28
[  896.981577] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  896.992171] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  897.014646] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  897.024540] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  897.036568] psmouse serio2: TouchPad at isa0060/serio2/input0 - 
driver resynced.
[  897.053668] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  897.054572] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  897.064571] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  897.065579] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  897.066224] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  897.066236] psmouse serio2: issuing reconnect request
[  898.121588] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  898.183146] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  898.448229] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  898.449100] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  898.450100] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  898.460059] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  898.461021] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  898.461032] psmouse serio2: issuing reconnect request
[  899.567133] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  899.615862] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  906.328212] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.329263] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.330263] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.334207] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.350228] psmouse serio2: TouchPad at isa0060/serio2/input0 - 
driver resynced.
[  906.388881] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.397231] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 4
[  906.401329] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.425975] psmouse serio2: TouchPad at isa0060/serio2/input0 - 
driver resynced.
[  906.442359] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.443322] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.447348] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.460307] psmouse serio2: TouchPad at isa0060/serio2/input0 - 
driver resynced.
[  906.476090] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.477272] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.487271] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.488039] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.489095] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  906.489107] psmouse serio2: issuing reconnect request
[  907.590323] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  907.653968] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[  996.762989] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  996.764224] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  996.766126] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  996.770891] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  996.772063] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[  996.772075] psmouse serio2: issuing reconnect request
[  997.792529] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[  997.849937] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[ 1234.955204] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[ 1234.956178] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[ 1234.957161] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[ 1234.964122] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[ 1234.965139] psmouse serio2: TouchPad at isa0060/serio2/input0 lost 
sync at byte 1
[ 1234.965148] psmouse serio2: issuing reconnect request
[ 1236.050182] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[ 1236.097170] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[ 1245.399587] psmouse serio2: synaptics: queried max coordinates: x 
[..5680], y [..4762]
[ 1245.456940] psmouse serio2: synaptics: queried min coordinates: x 
[1260..], y [1092..]
[ 1245.456954] psmouse serio2: synaptics: Trying to set up SMBus access
[ 1245.724761] input: Synaptics TM3266-010 as 
/devices/pci0000:00/0000:00:1f.4/i2c-0/0-002c/rmi4-01/input/input34

libinput list-devices (after setting synaptics_intertouch):
Device:           Synaptics TM3266-010
Kernel:           /dev/input/event5
Group:            7
Seat:             seat0, default
Size:             95x53mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge
Click methods:    *button-areas clickfinger
Disable-w-typing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a

libinput list-devices (after removing synaptics_intertouch):
Device:           SynPS/2 Synaptics TouchPad
Kernel:           /dev/input/event5
Group:            8
Seat:             seat0, default
Size:             96x53mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge
Click methods:    *button-areas clickfinger
Disable-w-typing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a


