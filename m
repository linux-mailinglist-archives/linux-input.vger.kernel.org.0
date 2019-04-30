Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0DBEF9B
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 06:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfD3E2W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 00:28:22 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:60801 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbfD3E2W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 00:28:22 -0400
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Apr 2019 00:28:21 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 86C0C14F12;
        Tue, 30 Apr 2019 00:21:38 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
  by compute6.internal (MEProxy); Tue, 30 Apr 2019 00:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outv.im; h=
        mime-version:message-id:date:from:to:cc:subject:content-type
        :content-transfer-encoding; s=fm1; bh=tCB6PUZcz5EXqtAx5NteG4K6Bh
        JjVjPTl402n8s4rZw=; b=DIv78+2c1AnYoLTF8rYwBME3nNZSMQDqB29CMHZGUC
        dmxbrTY2VjWHOSwDXgQBY1GcyoBh2GAxJz9s9WRwd9Cacj4Jk97MrBErKzhZK5u1
        vQ4aiepGUpOQxaiGhxJad5YaIqPUqb/NIMccGW+LQ7ofJNbk+S8oDDI7A91cltAB
        lMM/afpuL2DAEjXWQAyuFR4fC5q6i0ktI1LKiZFyDU/gtbrK5cE46vgP++NOXBw6
        uxsP2jtU1aZshXWdbqWuVADoVYPrPtibACS6GWJNXhHexeyh8jRQqhp/1f6yy3gZ
        ni4BcSKCd1zh+gt9/XKdovqZUTDmAqKds4jGSovEOvtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tCB6PU
        Zcz5EXqtAx5NteG4K6BhJjVjPTl402n8s4rZw=; b=j0nxRfLr1+TrDQJ1/2c2VL
        9ZNnWtx4jmWzYqrSrgwm77L9PYF+EptkCWz6WBPbep57F/C3nXrL0AGNPYHqxa6S
        rflOEiOh0URPzXJXsHMZVdA+ASAmXaRN6yigM+9h/gm9dBja695tPahq2U1+Cy3E
        /NFHXJqRy95x1x5DOENrbAfzHqsdBZANDF1O0Zvzg83PAtNhvISRH1+uDn23snz/
        RHs77VOf6Iq9Ee3GXwK8kbWADmLNkvQHAcewV5LTQ0i9FLmPEuvWgcE+2hnUNLlA
        3enkG0rXCoZTt3QJpD0oHJRBl+7TWn7eaO3vRQHPl6a+aRJYjZ08lCFW/NCHbC4A
        ==
X-ME-Sender: <xms:Uc3HXAXPE4QdGN5x7-aqEuCSsj1o919EGvMx5GkAkMhDBKvoM3wlWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgfgsehtqhertd
    erredtnecuhfhrohhmpedfqfhuthhvihcuggdfuceoihesohhuthhvrdhimheqnecuffho
    mhgrihhnpegrrhgthhhlihhnuhigrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hisehouhhtvhdrihhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Uc3HXCFT2Wah4oWbLk5IYeZIxZxFqIh-cwj5gKTB7dhT2db1WYiqow>
    <xmx:Uc3HXAchGVY1zNyuktJOhzwR2olehwInOWM2wDOfr5yfENHpFsWi-Q>
    <xmx:Uc3HXMlBRF-j2URcWQqUwfLTk82-1cUhKIQk8ACI7V4NLVzNhVZIVA>
    <xmx:Us3HXN_1fyUk9Rf4enUb3QzEzqmVw0__FBWmYFZJA47i2bQC_xQ2Vg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 83EF7211BA; Tue, 30 Apr 2019 00:21:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <0c87e12c-c964-40a3-b97e-af2286c318c4@www.fastmail.com>
Date:   Tue, 30 Apr 2019 00:20:56 -0400
From:   "Outvi V" <i@outv.im>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: PROBLEM: Elan touchpad regression on Kernel 5.0.10
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

[1.] One line summary of the problem: Elan touchpad regression on Kernel=
 5.0.10

[2.] Full description of the problem/report:
  Elan touchpad does not work on 5.0.10 while working on 5.0.9

[3.] Keywords: elan_i2c_core elan i2c touchpad 5.0.10

[4.] Kernel information
[4.1.] Kernel version:
  Linux version 5.0.10-arch1-1-ARCH (builduser@heftig-2592) (gcc version=
 8.3.0 (GCC)) #1 SMP PREEMPT Sat Apr 27 20:06:45 UTC 2019
[4.2.] Kernel .config file:
  I'm not sure, but I think it may be referring to
  https://git.archlinux.org/svntogit/packages.git/tree/trunk/config?h=3D=
packages/linux
[5.] Most recent kernel version which did not have the bug: 5.0.9

[6.] Output of Oops.. message (if applicable) with symbolic information
     resolved (Not appliable)
[7.] A small shell script or example program which triggers the
     problem: (Not appliable)

[8.] Environment
[8.1.] Software (add the output of the ver_linux script here)
 =20
Linux sheltty 5.0.10-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 27 20:06:45 UTC=
 2019 x86_64 GNU/Linux

GNU C                   8.3.0
GNU Make                4.2.1
Binutils                2.32
Util-linux              2.33.2
Mount                   2.33.2
Module-init-tools       26
E2fsprogs               1.45.0
Jfsutils                1.1.15
Reiserfsprogs           3.6.27
Xfsprogs                4.20.0
PPP                     2.4.7
Linux C Library         2.29
Dynamic linker (ldd)    2.29
Linux C++ Library       6.0.25
Procps                  3.3.15
Kbd                     2.0.4
Console-tools           2.0.4
Sh-utils                8.31
Udev                    242
Modules Loaded          8021q 8250_dw ac ac97_bus acpi_thermal_rel aesni=
_intel aes_x86_64 agpgart ahci arc4 atkbd battery bbswitch bluetooth btb=
cm btintel btrtl btusb cfg80211 coretemp crc16 crc32c_generic crc32c_int=
el crc32_pclmul crct10dif_pclmul cryptd crypto_simd crypto_user drm drm_=
kms_helper ecdh_generic elan_i2c evdev ext4 fat fb_sys_fops fscrypto gar=
p ghash_clmulni_intel glue_helper hid hid_generic i2c_algo_bit i2c_hid i=
2c_i801 i8042 i915 idma64 input_leds int3400_thermal int3403_thermal int=
340x_thermal_zone intel_cstate intel_gtt intel_lpss intel_lpss_pci intel=
_pch_thermal intel_powerclamp intel_rapl intel_rapl_perf intel_soc_dts_i=
osf intel_uncore intel_wmi_thunderbolt ip_tables irqbypass iTCO_vendor_s=
upport iTCO_wdt jbd2 joydev kvm kvmgt kvm_intel ledtrig_audio libahci li=
bata libphy libps2 llc mac80211 mac_hid mbcache mdev media mei mei_me mo=
usedev mrp nls_cp437 nls_iso8859_1 pcc_cpufreq processor_thermal_device =
r8169 r8822be realtek rfkill rng_core scsi_mod serio serio_raw snd snd_c=
ompress snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_c=
odec_realtek snd_hda_core snd_hda_ext_core snd_hda_intel snd_hwdep snd_p=
cm snd_pcm_dmaengine snd_soc_acpi snd_soc_acpi_intel_match snd_soc_core =
snd_soc_hdac_hda snd_soc_skl snd_soc_skl_ipc snd_soc_sst_dsp snd_soc_sst=
_ipc snd_timer soundcore stp syscopyarea sysfillrect sysimgblt tpm tpm_c=
rb tpm_tis tpm_tis_core typec typec_ucsi ucsi_acpi usbhid uvcvideo vfat =
vfio vfio_iommu_type1 vfio_mdev videobuf2_common videobuf2_memops videob=
uf2_v4l2 videobuf2_vmalloc videodev wmi wmi_bmof x86_pkg_temp_thermal xh=
ci_hcd xhci_pci x_tables

[8.2.] Processor information (from /proc/cpuinfo): (Maybe not appliable)=

[8.3.] Module information (from /proc/modules):=20

(Parts related to i2c and elan:)

i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
i2c_hid 32768 0 - Live 0x0000000000000000
hid 147456 3 hid_generic,usbhid,i2c_hid, Live 0x0000000000000000
elan_i2c 49152 0 - Live 0x0000000000000000
i2c_i801 36864 0 - Live 0x0000000000000000

[8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iome=
m)

/proc/ioports:
0000-0000 : PCI Bus 0000:00
  0000-0000 : dma1
  0000-0000 : pic1
  0000-0000 : iTCO_wdt
  0000-0000 : timer0
  0000-0000 : timer1
  0000-0000 : keyboard
  0000-0000 : PNP0C09:00
    0000-0000 : EC data
  0000-0000 : keyboard
  0000-0000 : PNP0C09:00
    0000-0000 : EC cmd
  0000-0000 : rtc0
  0000-0000 : dma page reg
  0000-0000 : pic2
  0000-0000 : dma2
  0000-0000 : fpu
    0000-0000 : PNP0C04:00
  0000-0000 : iTCO_wdt
  0000-0000 : pnp 00:02
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
  0000-0000 : pnp 00:02
  0000-0000 : pnp 00:00
    0000-0000 : ACPI PM1a_EVT_BLK
    0000-0000 : ACPI PM1a_CNT_BLK
    0000-0000 : ACPI PM_TMR
    0000-0000 : ACPI CPU throttle
    0000-0000 : ACPI PM2_CNT_BLK
    0000-0000 : pnp 00:04
    0000-0000 : ACPI GPE0_BLK
  0000-0000 : pnp 00:01
  0000-0000 : PCI Bus 0000:08
    0000-0000 : 0000:08:00.0
  0000-0000 : PCI Bus 0000:07
    0000-0000 : 0000:07:00.0
      0000-0000 : r8822be
  0000-0000 : PCI Bus 0000:01
    0000-0000 : 0000:01:00.0
  0000-0000 : 0000:00:02.0
  0000-0000 : 0000:00:1f.4
    0000-0000 : i801_smbus
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci


[8.5.] PCI information
  It seems to be long (over 700 lines) and unrelated to this regression.=
 Omitted to avoid flooding. I've kept an archive so feel free to ask me =
to post it if needed.

[8.6.] SCSI information (from /proc/scsi/scsi): (Empty)
[8.7.] Other information that might be relevant to the problem:

  dmesg is constantly showing "elan_i2c i2c-ELAN061B:00: invalid report =
id data (d)".
  I checked the git log and it is likely to be related to commit "95df59=
9f95f398b0a34d081dadfdee3126e58163".
  I'm using Arch Linux, its kernel repository link: [1]
  I checked the related file "elan_i2c_core.c" in Arch Linux's kernel re=
pository [2], and it is the same as in 5.0.10 on kernel.org.
  My laptop is a Lenovo Legion Y7000.

Links:
[1]. https://git.archlinux.org/linux.git
[2]. https://git.archlinux.org/linux.git/tree/drivers/input/mouse/elan_i=
2c_core.c?h=3Dv5.0.10-arch1

Please don't hesitate if more information or operation is needed.
