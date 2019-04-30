Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C951F063
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 08:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbfD3GQ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 02:16:56 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:44011 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbfD3GQ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 02:16:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 361A32B31;
        Tue, 30 Apr 2019 02:16:55 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
  by compute6.internal (MEProxy); Tue, 30 Apr 2019 02:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outv.im; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=03QS6RZPHtW8N3aqWEZwQJvrvEGYI5K
        PAoUcPMOtzvQ=; b=bujAN6lSzV9JQLAR+PVnZUoRAYzRlUUVfbitJlymTGt1Q96
        TPvjaELB9UGUiBop7Ivdd78vDLStHctV1FmhAa6iaGkzVawj0I+h6mK+FriKStX2
        7ZpLit9Ytik6m7Y4eZtMxZVcXwPN3zQZVDieCjmxQJOhU7xtV7ssX2EoygHE5VBa
        r7ba07ygEgZvZ8LOyXzvMyHuzyxahoKDkDjt5W7+W/lt7jaYNCP62gm7eiH14o3w
        AUauYO6F5JurPGvC9McH3Rd9yWIhwAFeyBwWHQ36W3OeMQkw0982OAbzmWht/dcO
        h7pp/i0zT3Vbcuw5uIOa2sF77mL0Mhi0UmBsLOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=03QS6R
        ZPHtW8N3aqWEZwQJvrvEGYI5KPAoUcPMOtzvQ=; b=yll4mLx8Yec6B0RVkYypxv
        oNRo0wd9RTtLBQMwB/910Hx9IVQzzTltN3OsQRXiHRjkREWx914JOUyk7YbeXjZd
        Zo8zzlhCN1ZrZaUv1tO/nf7aGrOPNnf6rl69UaLSkyi7Ma8oofz6B+TPxwV+HapH
        fQwasQeBSs2kNuUZHVx0otHNdWmQFYfimlVCVeVl/WxBemrYs4wq1dKn+LutJSYJ
        aQ9Gr5B1d+l8Rp3gY1nNVXpRQ5QIjXeu1fMpz9BArj1sJGzXdZLAXIEtzO+A0nP1
        mfPWj+aB99XLjP8YhOgNvd/vJi/dVf2DCmO3MhSCSPbaMXUF+tTIeH3ugzJ7MMzQ
        ==
X-ME-Sender: <xms:VejHXCKIVYD6506mJV0Sjn4if2pq99zTwLmsSzJR3Y5Nolb9O5mD-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfqfhuthhvihcuggdfuceoihesohhuthhvrdhimheqnecu
    ffhomhgrihhnpegrrhgthhhlihhnuhigrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehisehouhhtvhdrihhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:VejHXOZ3Nhk9pqIScxa7nngCRff4fqwasnpjRMWMMEXPmxCOcp6Phg>
    <xmx:VejHXNudnGlm3O0WCZDfrilweQoKy3H0GFFZvYv-nFCW6bDz44_utA>
    <xmx:VejHXLsBZSyGScsv5AdUBbMBYL92XljcXcH4CaJDpCGwHCxtVLJanQ>
    <xmx:VujHXFOPH7wpzCrcjwhs6RokuyLN32ujrY1nAaLEL3fmo_tXl60o3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 79A15211BA; Tue, 30 Apr 2019 02:16:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <9db8c26a-d9fd-4cc9-a3aa-bd593d8f73ac@www.fastmail.com>
In-Reply-To: <0c87e12c-c964-40a3-b97e-af2286c318c4@www.fastmail.com>
References: <0c87e12c-c964-40a3-b97e-af2286c318c4@www.fastmail.com>
Date:   Tue, 30 Apr 2019 02:16:32 -0400
From:   "Outvi V" <i@outv.im>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [SOLVED] PROBLEM: Elan touchpad regression on Kernel 5.0.10
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

  After a cold restart, this problems seem to be solved automatically on kernel 5.0.10.

Regards,

On Tue, Apr 30, 2019, at 12:21, Outvi V wrote:
> Hello,
> 
> [1.] One line summary of the problem: Elan touchpad regression on Kernel 5.0.10
> 
> [2.] Full description of the problem/report:
>   Elan touchpad does not work on 5.0.10 while working on 5.0.9
> 
> [3.] Keywords: elan_i2c_core elan i2c touchpad 5.0.10
> 
> [4.] Kernel information
> [4.1.] Kernel version:
>   Linux version 5.0.10-arch1-1-ARCH (builduser@heftig-2592) (gcc 
> version 8.3.0 (GCC)) #1 SMP PREEMPT Sat Apr 27 20:06:45 UTC 2019
> [4.2.] Kernel .config file:
>   I'm not sure, but I think it may be referring to
>   
> https://git.archlinux.org/svntogit/packages.git/tree/trunk/config?h=packages/linux
> [5.] Most recent kernel version which did not have the bug: 5.0.9
> 
> [6.] Output of Oops.. message (if applicable) with symbolic information
>      resolved (Not appliable)
> [7.] A small shell script or example program which triggers the
>      problem: (Not appliable)
> 
> [8.] Environment
> [8.1.] Software (add the output of the ver_linux script here)
>   
> Linux sheltty 5.0.10-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 27 20:06:45 
> UTC 2019 x86_64 GNU/Linux
> 
> GNU C                   8.3.0
> GNU Make                4.2.1
> Binutils                2.32
> Util-linux              2.33.2
> Mount                   2.33.2
> Module-init-tools       26
> E2fsprogs               1.45.0
> Jfsutils                1.1.15
> Reiserfsprogs           3.6.27
> Xfsprogs                4.20.0
> PPP                     2.4.7
> Linux C Library         2.29
> Dynamic linker (ldd)    2.29
> Linux C++ Library       6.0.25
> Procps                  3.3.15
> Kbd                     2.0.4
> Console-tools           2.0.4
> Sh-utils                8.31
> Udev                    242
> Modules Loaded          8021q 8250_dw ac ac97_bus acpi_thermal_rel 
> aesni_intel aes_x86_64 agpgart ahci arc4 atkbd battery bbswitch 
> bluetooth btbcm btintel btrtl btusb cfg80211 coretemp crc16 
> crc32c_generic crc32c_intel crc32_pclmul crct10dif_pclmul cryptd 
> crypto_simd crypto_user drm drm_kms_helper ecdh_generic elan_i2c evdev 
> ext4 fat fb_sys_fops fscrypto garp ghash_clmulni_intel glue_helper hid 
> hid_generic i2c_algo_bit i2c_hid i2c_i801 i8042 i915 idma64 input_leds 
> int3400_thermal int3403_thermal int340x_thermal_zone intel_cstate 
> intel_gtt intel_lpss intel_lpss_pci intel_pch_thermal intel_powerclamp 
> intel_rapl intel_rapl_perf intel_soc_dts_iosf intel_uncore 
> intel_wmi_thunderbolt ip_tables irqbypass iTCO_vendor_support iTCO_wdt 
> jbd2 joydev kvm kvmgt kvm_intel ledtrig_audio libahci libata libphy 
> libps2 llc mac80211 mac_hid mbcache mdev media mei mei_me mousedev mrp 
> nls_cp437 nls_iso8859_1 pcc_cpufreq processor_thermal_device r8169 
> r8822be realtek rfkill rng_core scsi_mod serio serio_raw snd 
> snd_compress snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi 
> snd_hda_codec_realtek snd_hda_core snd_hda_ext_core snd_hda_intel 
> snd_hwdep snd_pcm snd_pcm_dmaengine snd_soc_acpi 
> snd_soc_acpi_intel_match snd_soc_core snd_soc_hdac_hda snd_soc_skl 
> snd_soc_skl_ipc snd_soc_sst_dsp snd_soc_sst_ipc snd_timer soundcore stp 
> syscopyarea sysfillrect sysimgblt tpm tpm_crb tpm_tis tpm_tis_core 
> typec typec_ucsi ucsi_acpi usbhid uvcvideo vfat vfio vfio_iommu_type1 
> vfio_mdev videobuf2_common videobuf2_memops videobuf2_v4l2 
> videobuf2_vmalloc videodev wmi wmi_bmof x86_pkg_temp_thermal xhci_hcd 
> xhci_pci x_tables
> 
> [8.2.] Processor information (from /proc/cpuinfo): (Maybe not appliable)
> [8.3.] Module information (from /proc/modules): 
> 
> (Parts related to i2c and elan:)
> 
> i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
> i2c_hid 32768 0 - Live 0x0000000000000000
> hid 147456 3 hid_generic,usbhid,i2c_hid, Live 0x0000000000000000
> elan_i2c 49152 0 - Live 0x0000000000000000
> i2c_i801 36864 0 - Live 0x0000000000000000
> 
> [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
> 
> /proc/ioports:
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : dma1
>   0000-0000 : pic1
>   0000-0000 : iTCO_wdt
>   0000-0000 : timer0
>   0000-0000 : timer1
>   0000-0000 : keyboard
>   0000-0000 : PNP0C09:00
>     0000-0000 : EC data
>   0000-0000 : keyboard
>   0000-0000 : PNP0C09:00
>     0000-0000 : EC cmd
>   0000-0000 : rtc0
>   0000-0000 : dma page reg
>   0000-0000 : pic2
>   0000-0000 : dma2
>   0000-0000 : fpu
>     0000-0000 : PNP0C04:00
>   0000-0000 : iTCO_wdt
>   0000-0000 : pnp 00:02
> 0000-0000 : PCI conf1
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : pnp 00:02
>   0000-0000 : pnp 00:00
>     0000-0000 : ACPI PM1a_EVT_BLK
>     0000-0000 : ACPI PM1a_CNT_BLK
>     0000-0000 : ACPI PM_TMR
>     0000-0000 : ACPI CPU throttle
>     0000-0000 : ACPI PM2_CNT_BLK
>     0000-0000 : pnp 00:04
>     0000-0000 : ACPI GPE0_BLK
>   0000-0000 : pnp 00:01
>   0000-0000 : PCI Bus 0000:08
>     0000-0000 : 0000:08:00.0
>   0000-0000 : PCI Bus 0000:07
>     0000-0000 : 0000:07:00.0
>       0000-0000 : r8822be
>   0000-0000 : PCI Bus 0000:01
>     0000-0000 : 0000:01:00.0
>   0000-0000 : 0000:00:02.0
>   0000-0000 : 0000:00:1f.4
>     0000-0000 : i801_smbus
>   0000-0000 : 0000:00:17.0
>     0000-0000 : ahci
>   0000-0000 : 0000:00:17.0
>     0000-0000 : ahci
>   0000-0000 : 0000:00:17.0
>     0000-0000 : ahci
> 
> 
> [8.5.] PCI information
>   It seems to be long (over 700 lines) and unrelated to this 
> regression. Omitted to avoid flooding. I've kept an archive so feel 
> free to ask me to post it if needed.
> 
> [8.6.] SCSI information (from /proc/scsi/scsi): (Empty)
> [8.7.] Other information that might be relevant to the problem:
> 
>   dmesg is constantly showing "elan_i2c i2c-ELAN061B:00: invalid report 
> id data (d)".
>   I checked the git log and it is likely to be related to commit 
> "95df599f95f398b0a34d081dadfdee3126e58163".
>   I'm using Arch Linux, its kernel repository link: [1]
>   I checked the related file "elan_i2c_core.c" in Arch Linux's kernel 
> repository [2], and it is the same as in 5.0.10 on kernel.org.
>   My laptop is a Lenovo Legion Y7000.
> 
> Links:
> [1]. https://git.archlinux.org/linux.git
> [2]. 
> https://git.archlinux.org/linux.git/tree/drivers/input/mouse/elan_i2c_core.c?h=v5.0.10-arch1
> 
> Please don't hesitate if more information or operation is needed.
