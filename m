Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C1D1382F
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2019 10:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfEDIFd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 May 2019 04:05:33 -0400
Received: from vmd37850.contaboserver.net ([173.212.236.241]:35452 "EHLO
        mail.devpi.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbfEDIFc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 4 May 2019 04:05:32 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.devpi.de (Postfix) with ESMTPA id 4EE606E2903;
        Sat,  4 May 2019 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devpi.de; s=dkim;
        t=1556957122; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=26+C+n70Q6mLbvBCW3iBe6XAyTnxPNbg/ANc8cY/3sU=;
        b=X6Ng0jJbPgqX013cQZHlwgRki9iFkVbhg7xBJiNaH/SMRx7dc/5GaWHibW2UU2nffM2kTE
        LZOY/TLE7G2zMYcwaCh58k8x93s0zRldXl2r81aGoozjcntANNLY0V0iQ7ud21iiduM3QM
        UUY8J9oCgHvRmIDUw5IoVjcReXVOIK4=
Message-ID: <2ec76db035ad2083f8709c15d33e8f8a9da12577.camel@devpi.de>
Subject: Re: [BUG] HID: ELAN active stylus has wrong button behavior
From:   Julius Lehmann <julius@devpi.de>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Date:   Sat, 04 May 2019 10:06:02 +0200
In-Reply-To: <9a22f65e3357e73594bfc46b2e14ac87e705aef5.camel@devpi.de>
References: <9a22f65e3357e73594bfc46b2e14ac87e705aef5.camel@devpi.de>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=devpi.de;
        s=dkim; t=1556957122; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=26+C+n70Q6mLbvBCW3iBe6XAyTnxPNbg/ANc8cY/3sU=;
        b=r0Zy6DGjOtdDXQQaeUhA4w8QKinunbQ9WSW9TBi+JGWtweegPBd065EmksbsMqmbZjowGn
        3dWTIb/VXeaa4Vekl9GsgJsV3ma9HyxX319gMuo1t+kEOImcMu62qZv4ws56yHLXDESmQH
        4HH1/JufSO9zXzlfi2KhZw37KSfy7/0=
ARC-Seal: i=1; s=dkim; d=devpi.de; t=1556957122; a=rsa-sha256; cv=none;
        b=PS7LHTHLADCM7SW4Lcry7mStlwh/frxqF0kVxGhOE6uFbib+exczl1Ri2R79EXMOsz09mPdl7iJ5c9DoSOSJw+phVI4Cf9u4QG9Xn/WYZlIZxt8V63v7Yl42U7WAhKrAg+NAAfp+APw+339OFaU1tu5dAD4QXlVzPWtsF2XVTJI=
ARC-Authentication-Results: i=1; mail.devpi.de;
        auth=pass smtp.auth=julius@devpi.de smtp.mailfrom=julius@devpi.de
Authentication-Results: mail.devpi.de;
        auth=pass smtp.auth=julius@devpi.de smtp.mailfrom=julius@devpi.de
X-Spamd-Bar: -------
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I am so sorry, in the midst of concentrating on my report I totally
forgot to include some system information :):

[1.] One line summary of the problem:
ELAN active stylus has wrong button behavior

[2.] Full description of the problem/report:
(see previous mail)

[3.] Keywords (i.e., modules, networking, kernel):
hid, input

[4.] Kernel information
[4.1.] Kernel version (from /proc/version):
Linux version 5.0.9-2-MANJARO (builduser@lancaster) (gcc version 8.3.0
(GCC)) #1 SMP PREEMPT Sun Apr 21 07:11:08 UTC 2019

[4.2.] Kernel .config file:
https://pastebin.com/zmmNbk7y
[5.] Most recent kernel version which did not have the bug:
[6.] Output of Oops.. message (if applicable) with symbolic information
     resolved (see Documentation/admin-guide/oops-tracing.rst)
[7.] A small shell script or example program which triggers the
     problem (if possible)
[8.] Environment
[8.1.] Software (add the output of the ver_linux script here)
Linux julius-notebook 5.0.9-2-MANJARO #1 SMP PREEMPT Sun Apr 21
07:11:08 UTC 2019 x86_64 GNU/Linux

GNU C               	8.3.0
GNU Make            	4.2.1
Binutils            	2.32
Util-linux          	2.33.2
Mount               	2.33.2
Module-init-tools   	26
E2fsprogs           	1.45.0
Jfsutils            	1.1.15
Reiserfsprogs       	3.6.27
Xfsprogs            	4.20.0
PPP                 	2.4.7
Nfs-utils           	2.3.3
Linux C Library     	2.29
Dynamic linker (ldd)	2.29
Linux C++ Library   	6.0.25
Procps              	3.3.15
Kbd                 	2.0.4
Console-tools       	2.0.4
Sh-utils            	8.31
Udev                	242
Wireless-tools      	30
Modules Loaded      	8250_dw ac ac97_bus acpi_thermal_rel
aesni_intel aes_x86_64 agpgart ahci arc4 asus_nb_wmi asus_wmi atkbd
battery bluetooth bmc150_accel_core bmc150_accel_i2c bnep btbcm btintel
btrtl btusb ccm cfg80211 coretemp crc16 crc32c_generic crc32c_intel
crc32_pclmul crct10dif_pclmul cryptd crypto_simd crypto_user drm
drm_kms_helper ecdh_generic evdev ext4 fat fb_sys_fops fscrypto fuse
ghash_clmulni_intel glue_helper hid hid_generic hid_multitouch
i2c_algo_bit i2c_hid i2c_i801 i8042 i915 idma64 industrialio
industrialio_triggered_buffer input_leds int3400_thermal
int3403_thermal int340x_thermal_zone intel_cstate intel_gtt intel_hid
intel_lpss intel_lpss_pci intel_pch_thermal intel_powerclamp intel_rapl
intel_rapl_perf intel_soc_dts_iosf intel_uncore intel_vbtn
intel_xhci_usb_role_switch ip_tables irqbypass iTCO_vendor_support
iTCO_wdt iwlmvm iwlwifi jbd2 joydev kfifo_buf kvm kvmgt kvm_intel
ledtrig_audio libahci libata libps2 mac80211 mac_hid mbcache mdev media
mei mei_me mousedev nls_cp437 nls_iso8859_1 pcc_cpufreq pcspkr
processor_thermal_device rfcomm rfkill rng_core roles scsi_mod sd_mod
serio serio_raw sg snd snd_compress snd_hda_codec snd_hda_codec_generic
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_core snd_hda_ext_core
snd_hda_intel snd_hwdep snd_pcm snd_pcm_dmaengine snd_soc_acpi
snd_soc_acpi_intel_match snd_soc_core snd_soc_hdac_hda snd_soc_skl
snd_soc_skl_ipc snd_soc_sst_dsp snd_soc_sst_ipc snd_timer soundcore
sparse_keymap spi_pxa2xx_platform syscopyarea sysfillrect sysimgblt tpm
tpm_crb tpm_tis tpm_tis_core uvcvideo vfat vfio vfio_iommu_type1
vfio_mdev videobuf2_common videobuf2_memops videobuf2_v4l2
videobuf2_vmalloc videodev wmi wmi_bmof x86_pkg_temp_thermal xhci_hcd
xhci_pci x_tables

[8.2.] Processor information (from /proc/cpuinfo):
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 794.223
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 800.031
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 800.061
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 4
initial apicid	: 4
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 793.772
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 6
initial apicid	: 6
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 4
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 800.007
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 5
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 800.058
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 6
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 800.027
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 5
initial apicid	: 5
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 7
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
stepping	: 10
microcode	: 0x96
cpu MHz		: 799.846
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 7
initial apicid	: 7
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes
xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf
bogomips	: 3601.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

[8.3.] Module information (from /proc/modules):
ccm 20480 6 - Live 0x0000000000000000
rfcomm 86016 4 - Live 0x0000000000000000
fuse 131072 5 - Live 0x0000000000000000
mousedev 24576 0 - Live 0x0000000000000000
joydev 28672 0 - Live 0x0000000000000000
snd_hda_codec_hdmi 65536 1 - Live 0x0000000000000000
snd_hda_codec_realtek 126976 1 - Live 0x0000000000000000
snd_hda_codec_generic 90112 1 snd_hda_codec_realtek, Live
0x0000000000000000
ledtrig_audio 16384 2 snd_hda_codec_realtek,snd_hda_codec_generic, Live
0x0000000000000000
arc4 16384 2 - Live 0x0000000000000000
bnep 28672 2 - Live 0x0000000000000000
i915 2166784 5 - Live 0x0000000000000000
snd_soc_skl 122880 0 - Live 0x0000000000000000
hid_multitouch 28672 0 - Live 0x0000000000000000
snd_soc_hdac_hda 24576 1 snd_soc_skl, Live 0x0000000000000000
intel_rapl 28672 0 - Live 0x0000000000000000
snd_hda_ext_core 32768 2 snd_soc_skl,snd_soc_hdac_hda, Live
0x0000000000000000
x86_pkg_temp_thermal 20480 0 - Live 0x0000000000000000
intel_powerclamp 20480 0 - Live 0x0000000000000000
snd_soc_skl_ipc 73728 1 snd_soc_skl, Live 0x0000000000000000
coretemp 20480 0 - Live 0x0000000000000000
iwlmvm 442368 0 - Live 0x0000000000000000
snd_soc_sst_ipc 20480 1 snd_soc_skl_ipc, Live 0x0000000000000000
nls_iso8859_1 16384 1 - Live 0x0000000000000000
kvm_intel 311296 0 - Live 0x0000000000000000
snd_soc_sst_dsp 40960 1 snd_soc_skl_ipc, Live 0x0000000000000000
nls_cp437 20480 1 - Live 0x0000000000000000
kvmgt 32768 0 - Live 0x0000000000000000
snd_soc_acpi_intel_match 28672 1 snd_soc_skl, Live 0x0000000000000000
vfio_mdev 16384 0 - Live 0x0000000000000000
snd_soc_acpi 16384 2 snd_soc_skl,snd_soc_acpi_intel_match, Live
0x0000000000000000
mdev 24576 2 kvmgt,vfio_mdev, Live 0x0000000000000000
vfat 20480 1 - Live 0x0000000000000000
vfio_iommu_type1 32768 0 - Live 0x0000000000000000
fat 81920 1 vfat, Live 0x0000000000000000
vfio 36864 3 kvmgt,vfio_mdev,vfio_iommu_type1, Live 0x0000000000000000
uvcvideo 114688 0 - Live 0x0000000000000000
mac80211 950272 1 iwlmvm, Live 0x0000000000000000
snd_soc_core 278528 2 snd_soc_skl,snd_soc_hdac_hda, Live
0x0000000000000000
hid_generic 16384 0 - Live 0x0000000000000000
kvm 749568 2 kvm_intel,kvmgt, Live 0x0000000000000000
8250_dw 28672 0 - Live 0x0000000000000000
spi_pxa2xx_platform 32768 0 - Live 0x0000000000000000
videobuf2_vmalloc 20480 1 uvcvideo, Live 0x0000000000000000
snd_compress 28672 1 snd_soc_core, Live 0x0000000000000000
videobuf2_memops 20480 1 videobuf2_vmalloc, Live 0x0000000000000000
ac97_bus 16384 1 snd_soc_core, Live 0x0000000000000000
videobuf2_v4l2 28672 1 uvcvideo, Live 0x0000000000000000
snd_pcm_dmaengine 16384 1 snd_soc_core, Live 0x0000000000000000
videobuf2_common 57344 2 uvcvideo,videobuf2_v4l2, Live
0x0000000000000000
irqbypass 16384 1 kvm, Live 0x0000000000000000
i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
videodev 229376 3 uvcvideo,videobuf2_v4l2,videobuf2_common, Live
0x0000000000000000
iwlwifi 352256 1 iwlmvm, Live 0x0000000000000000
snd_hda_intel 45056 3 - Live 0x0000000000000000
crct10dif_pclmul 16384 1 - Live 0x0000000000000000
btusb 57344 0 - Live 0x0000000000000000
drm_kms_helper 208896 1 i915, Live 0x0000000000000000
crc32_pclmul 16384 0 - Live 0x0000000000000000
media 57344 4 uvcvideo,videobuf2_v4l2,videobuf2_common,videodev, Live
0x0000000000000000
snd_hda_codec 155648 5
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_
hdac_hda,snd_hda_intel, Live 0x0000000000000000
btrtl 20480 1 btusb, Live 0x0000000000000000
btbcm 16384 1 btusb, Live 0x0000000000000000
btintel 28672 1 btusb, Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
bluetooth 651264 31 rfcomm,bnep,btusb,btrtl,btbcm,btintel, Live
0x0000000000000000
drm 499712 6 i915,drm_kms_helper, Live 0x0000000000000000
aesni_intel 372736 4 - Live 0x0000000000000000
snd_hda_core 98304 8
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_
skl,snd_soc_hdac_hda,snd_hda_ext_core,snd_hda_intel,snd_hda_codec, Live
0x0000000000000000
aes_x86_64 20480 1 aesni_intel, Live 0x0000000000000000
asus_nb_wmi 28672 0 - Live 0x0000000000000000
ecdh_generic 24576 1 bluetooth, Live 0x0000000000000000
snd_hwdep 16384 1 snd_hda_codec, Live 0x0000000000000000
iTCO_wdt 16384 0 - Live 0x0000000000000000
crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
cfg80211 798720 3 iwlmvm,mac80211,iwlwifi, Live 0x0000000000000000
iTCO_vendor_support 16384 1 iTCO_wdt, Live 0x0000000000000000
asus_wmi 32768 1 asus_nb_wmi, Live 0x0000000000000000
snd_pcm 135168 8
snd_hda_codec_hdmi,snd_soc_skl,snd_hda_ext_core,snd_soc_core,snd_pcm_dm
aengine,snd_hda_intel,snd_hda_codec,snd_hda_core, Live
0x0000000000000000
wmi_bmof 16384 0 - Live 0x0000000000000000
intel_gtt 24576 1 i915, Live 0x0000000000000000
bmc150_accel_i2c 16384 0 - Live 0x0000000000000000
bmc150_accel_core 32768 1 bmc150_accel_i2c, Live 0x0000000000000000
industrialio_triggered_buffer 16384 1 bmc150_accel_core, Live
0x0000000000000000
cryptd 28672 3 ghash_clmulni_intel,aesni_intel,crypto_simd, Live
0x0000000000000000
agpgart 53248 2 drm,intel_gtt, Live 0x0000000000000000
idma64 20480 2 - Live 0x0000000000000000
glue_helper 16384 1 aesni_intel, Live 0x0000000000000000
kfifo_buf 16384 1 industrialio_triggered_buffer, Live
0x0000000000000000
pcspkr 16384 0 - Live 0x0000000000000000
tpm_crb 20480 0 - Live 0x0000000000000000
input_leds 16384 0 - Live 0x0000000000000000
intel_cstate 16384 0 - Live 0x0000000000000000
syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
snd_timer 40960 1 snd_pcm, Live 0x0000000000000000
sysfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000
snd 102400 16
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_
core,snd_compress,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_tim
er, Live 0x0000000000000000
intel_uncore 135168 0 - Live 0x0000000000000000
tpm_tis 16384 0 - Live 0x0000000000000000
intel_xhci_usb_role_switch 16384 0 - Live 0x0000000000000000
sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
rfkill 28672 7 bluetooth,cfg80211,asus_wmi, Live 0x0000000000000000
i2c_hid 32768 0 - Live 0x0000000000000000
mei_me 45056 0 - Live 0x0000000000000000
intel_rapl_perf 16384 0 - Live 0x0000000000000000
processor_thermal_device 16384 0 - Live 0x0000000000000000
tpm_tis_core 24576 1 tpm_tis, Live 0x0000000000000000
roles 16384 1 intel_xhci_usb_role_switch, Live 0x0000000000000000
intel_lpss_pci 20480 0 - Live 0x0000000000000000
fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
i2c_i801 36864 0 - Live 0x0000000000000000
mei 118784 1 mei_me, Live 0x0000000000000000
intel_lpss 16384 1 intel_lpss_pci, Live 0x0000000000000000
int3403_thermal 16384 0 - Live 0x0000000000000000
intel_soc_dts_iosf 20480 1 processor_thermal_device, Live
0x0000000000000000
intel_pch_thermal 16384 0 - Live 0x0000000000000000
tpm 69632 3 tpm_crb,tpm_tis,tpm_tis_core, Live 0x0000000000000000
hid 147456 3 hid_multitouch,hid_generic,i2c_hid, Live
0x0000000000000000
industrialio 86016 3
bmc150_accel_core,industrialio_triggered_buffer,kfifo_buf, Live
0x0000000000000000
wmi 32768 2 asus_wmi,wmi_bmof, Live 0x0000000000000000
battery 24576 0 - Live 0x0000000000000000
int340x_thermal_zone 16384 2 processor_thermal_device,int3403_thermal,
Live 0x0000000000000000
ac 16384 0 - Live 0x0000000000000000
intel_vbtn 20480 0 - Live 0x0000000000000000
intel_hid 20480 0 - Live 0x0000000000000000
rng_core 16384 1 tpm, Live 0x0000000000000000
evdev 28672 18 - Live 0x0000000000000000
sparse_keymap 16384 3 asus_wmi,intel_vbtn,intel_hid, Live
0x0000000000000000
int3400_thermal 20480 0 - Live 0x0000000000000000
acpi_thermal_rel 16384 1 int3400_thermal, Live 0x0000000000000000
mac_hid 16384 0 - Live 0x0000000000000000
pcc_cpufreq 20480 0 - Live 0x0000000000000000
sg 40960 0 - Live 0x0000000000000000
crypto_user 16384 0 - Live 0x0000000000000000
ip_tables 32768 0 - Live 0x0000000000000000
x_tables 49152 1 ip_tables, Live 0x0000000000000000
ext4 749568 1 - Live 0x0000000000000000
crc32c_generic 16384 0 - Live 0x0000000000000000
crc16 16384 2 bluetooth,ext4, Live 0x0000000000000000
mbcache 16384 1 ext4, Live 0x0000000000000000
jbd2 131072 1 ext4, Live 0x0000000000000000
fscrypto 32768 1 ext4, Live 0x0000000000000000
sd_mod 57344 4 - Live 0x0000000000000000
ahci 40960 3 - Live 0x0000000000000000
serio_raw 20480 0 - Live 0x0000000000000000
atkbd 36864 0 - Live 0x0000000000000000
libahci 40960 1 ahci, Live 0x0000000000000000
libps2 20480 1 atkbd, Live 0x0000000000000000
libata 282624 2 ahci,libahci, Live 0x0000000000000000
xhci_pci 20480 0 - Live 0x0000000000000000
xhci_hcd 262144 1 xhci_pci, Live 0x0000000000000000
crc32c_intel 24576 2 - Live 0x0000000000000000
scsi_mod 253952 3 sg,sd_mod,libata, Live 0x0000000000000000
i8042 32768 1 asus_nb_wmi, Live 0x0000000000000000
serio 28672 4 serio_raw,atkbd,i8042, Live 0x0000000000000000

[8.4.] Loaded driver and hardware information (/proc/ioports,
/proc/iomem)
0000-0000 : PCI Bus 0000:00
  0000-0000 : dma1
  0000-0000 : pic1
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
  0000-0000 : iTCO_wdt
    0000-0000 : iTCO_wdt
  0000-0000 : pnp 00:00
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
  0000-0000 : pnp 00:00
  0000-0000 : pnp 00:00
    0000-0000 : ACPI PM1a_EVT_BLK
    0000-0000 : ACPI PM1a_CNT_BLK
    0000-0000 : ACPI PM_TMR
    0000-0000 : iTCO_wdt
      0000-0000 : iTCO_wdt
    0000-0000 : ACPI PM2_CNT_BLK
    0000-0000 : pnp 00:02
    0000-0000 : ACPI GPE0_BLK
  0000-0000 : 0000:00:02.0
  0000-0000 : 0000:00:1f.4
    0000-0000 : i801_smbus
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : pnp 00:06
  0000-0000 : pnp 00:00
    0000-0000 : pnp 00:00
      0000-0000 : pnp 00:00

00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
    00000000-00000000 : System ROM
00000000-00000000 : System RAM
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : ACPI Tables
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
  00000000-00000000 : Graphics Stolen Memory
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : 0000:00:02.0
  00000000-00000000 : 0000:00:02.0
  00000000-00000000 : PCI Bus 0000:01
    00000000-00000000 : 0000:01:00.0
      00000000-00000000 : iwlwifi
  00000000-00000000 : 0000:00:1f.3
    00000000-00000000 : ICH HD audio
  00000000-00000000 : 0000:00:14.0
    00000000-00000000 : xhci-hcd
      00000000-00000000 : intel_xhci_usb_sw
  00000000-00000000 : 0000:00:04.0
  00000000-00000000 : 0000:00:1f.3
    00000000-00000000 : ICH HD audio
  00000000-00000000 : 0000:00:1f.2
  00000000-00000000 : 0000:00:17.0
    00000000-00000000 : ahci
  00000000-00000000 : 0000:00:1f.4
  00000000-00000000 : 0000:00:1e.3
    00000000-00000000 : lpss_dev
      00000000-00000000 : lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.5
      00000000-00000000 : idma64.5
  00000000-00000000 : 0000:00:1e.0
    00000000-00000000 : lpss_dev
      00000000-00000000 : serial
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.4
      00000000-00000000 : idma64.4
  00000000-00000000 : 0000:00:19.0
    00000000-00000000 : lpss_dev
      00000000-00000000 : serial
    00000000-00000000 : lpss_priv
  00000000-00000000 : 0000:00:17.0
    00000000-00000000 : ahci
  00000000-00000000 : 0000:00:17.0
    00000000-00000000 : ahci
  00000000-00000000 : 0000:00:16.0
    00000000-00000000 : mei_me
  00000000-00000000 : 0000:00:15.2
    00000000-00000000 : lpss_dev
      00000000-00000000 : lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.2
      00000000-00000000 : idma64.2
  00000000-00000000 : 0000:00:15.1
    00000000-00000000 : lpss_dev
      00000000-00000000 : lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.1
      00000000-00000000 : idma64.1
  00000000-00000000 : 0000:00:15.0
    00000000-00000000 : lpss_dev
      00000000-00000000 : lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.0
      00000000-00000000 : idma64.0
  00000000-00000000 : 0000:00:14.2
    00000000-00000000 : Intel PCH thermal driver
  00000000-00000000 : 0000:00:08.0
  00000000-00000000 : pnp 00:04
00000000-00000000 : PCI MMCONFIG 0000 [bus 00-ff]
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:04
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : pnp 00:05
  00000000-00000000 : INT344B:00
    00000000-00000000 : INT344B:00
  00000000-00000000 : pnp 00:05
  00000000-00000000 : INT344B:00
    00000000-00000000 : INT344B:00
  00000000-00000000 : INT344B:00
    00000000-00000000 : INT344B:00
  00000000-00000000 : pnp 00:05
    00000000-00000000 : iTCO_wdt
      00000000-00000000 : iTCO_wdt
  00000000-00000000 : Reserved
  00000000-00000000 : pnp 00:07
  00000000-00000000 : pnp 00:07
  00000000-00000000 : pnp 00:05
  00000000-00000000 : pnp 00:05
  00000000-00000000 : pnp 00:05
00000000-00000000 : Reserved
  00000000-00000000 : IOAPIC 0
00000000-00000000 : Reserved
  00000000-00000000 : HPET 0
    00000000-00000000 : PNP0103:00
00000000-00000000 : pnp 00:04
00000000-00000000 : pnp 00:04
00000000-00000000 : pnp 00:04
00000000-00000000 : pnp 00:04
00000000-00000000 : MSFT0101:00
  00000000-00000000 : MSFT0101:00
00000000-00000000 : pnp 00:04
00000000-00000000 : dmar0
00000000-00000000 : dmar1
00000000-00000000 : Local APIC
  00000000-00000000 : Reserved
00000000-00000000 : Reserved
  00000000-00000000 : INT0800:00
    00000000-00000000 : pnp 00:04
00000000-00000000 : System RAM
  00000000-00000000 : Kernel code
  00000000-00000000 : Kernel data
  00000000-00000000 : Kernel bss
00000000-00000000 : RAM buffer
00000000-00000000 : PCI Bus 0000:00

[8.5.] PCI information ('lspci -vvv' as root)
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v6/7th Gen Core
Processor Host Bridge/DRAM Registers (rev 08)
	Subsystem: ASUSTeK Computer Inc. Xeon E3-1200 v6/7th Gen Core
Processor Host Bridge/DRAM Registers
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Capabilities: [e0] Vendor Specific Information: Len=10 <?>
	Kernel driver in use: skl_uncore

00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 620
(rev 07) (prog-if 00 [VGA controller])
	DeviceName:  Onboard IGD
	Subsystem: ASUSTeK Computer Inc. UHD Graphics 620
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 127
	Region 0: Memory at de000000 (64-bit, non-prefetchable)
[size=16M]
	Region 2: Memory at c0000000 (64-bit, prefetchable) [size=256M]
	Region 4: I/O ports at f000 [size=64]
	[virtual] Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: [40] Vendor Specific Information: Len=0c <?>
	Capabilities: [70] Express (v2) Root Complex Integrated
Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis-
, LTR-, OBFF Not Supported
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, 
LTR-, OBFF Disabled
			 AtomicOpsCtl: ReqEn-
	Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee00018  Data: 0000
	Capabilities: [d0] Power Management version 2
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Process Address Space ID (PASID)
		PASIDCap: Exec- Priv-, Max PASID Width: 14
		PASIDCtl: Enable- Exec- Priv-
	Capabilities: [200 v1] Address Translation Service (ATS)
		ATSCap:	Invalidate Queue Depth: 00
		ATSCtl:	Enable-, Smallest Translation Unit: 00
	Capabilities: [300 v1] Page Request Interface (PRI)
		PRICtl: Enable- Reset-
		PRISta: RF- UPRGI- Stopped+
		Page Request Capacity: 00008000, Page Request
Allocation: 00000000
	Kernel driver in use: i915
	Kernel modules: i915

00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200
v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
	Subsystem: ASUSTeK Computer Inc. Xeon E3-1200 v5/E3-1500 v5/6th
Gen Core Processor Thermal Subsystem
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at df120000 (64-bit, non-prefetchable)
[size=32K]
	Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Capabilities: [d0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel driver in use: proc_thermal
	Kernel modules: processor_thermal_device

00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-
1500 v5 / 6th/7th Gen Core Processor Gaussian Mixture Model
	Subsystem: ASUSTeK Computer Inc. Xeon E3-1200 v5/v6 / E3-1500
v5 / 6th/7th Gen Core Processor Gaussian Mixture Model
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 255
	Region 0: Memory at df13d000 (64-bit, non-prefetchable)
[disabled] [size=4K]
	Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Capabilities: [dc] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [f0] PCI Advanced Features
		AFCap: TP+ FLR+
		AFCtrl: FLR-
		AFStatus: TP-

00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI
Controller (rev 21) (prog-if 30 [XHCI])
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP USB 3.0 xHCI
Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 123
	Region 0: Memory at df110000 (64-bit, non-prefetchable)
[size=64K]
	Capabilities: [70] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0-
,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
		Address: 00000000fee00298  Data: 0000
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:14.2 Signal processing controller: Intel Corporation Sunrise Point-
LP Thermal subsystem (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Thermal
subsystem
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin C routed to IRQ 18
	Region 0: Memory at df13c000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Kernel driver in use: intel_pch_thermal
	Kernel modules: intel_pch_thermal

00:15.0 Signal processing controller: Intel Corporation Sunrise Point-
LP Serial IO I2C Controller #0 (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO I2C
Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at df13b000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:15.1 Signal processing controller: Intel Corporation Sunrise Point-
LP Serial IO I2C Controller #1 (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO I2C
Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 17
	Region 0: Memory at df13a000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:15.2 Signal processing controller: Intel Corporation Sunrise Point-
LP Serial IO I2C Controller #2 (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO I2C
Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 18
	Region 0: Memory at df139000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:16.0 Communication controller: Intel Corporation Sunrise Point-LP
CSME HECI #1 (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP CSME HECI
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 125
	Region 0: Memory at df138000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot+,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee002f8  Data: 0000
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA
Controller [AHCI mode] (rev 21) (prog-if 01 [AHCI 1.0])
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP SATA
Controller [AHCI mode]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 124
	Region 0: Memory at df130000 (32-bit, non-prefetchable)
[size=8K]
	Region 1: Memory at df137000 (32-bit, non-prefetchable)
[size=256]
	Region 2: I/O ports at f090 [size=8]
	Region 3: I/O ports at f080 [size=4]
	Region 4: I/O ports at f060 [size=32]
	Region 5: Memory at df136000 (32-bit, non-prefetchable)
[size=2K]
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee002b8  Data: 0000
	Capabilities: [70] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot+,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004
	Kernel driver in use: ahci
	Kernel modules: ahci

00:19.0 Signal processing controller: Intel Corporation Sunrise Point-
LP Serial IO UART Controller #2 (rev 21)
	DeviceName:  Onboard LAN
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO
UART Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 32
	Region 0: Memory at df135000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root
Port #6 (rev f1) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 122
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: 0000f000-00000fff [empty]
	Memory behind bridge: df000000-df0fffff [size=1M]
	Prefetchable memory behind bridge: 00000000fff00000-
00000000000fffff [empty]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR- NoISA- VGA- VGA16+ MAbort- >Reset-
FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr+ TransPend-
		LnkCap:	Port #6, Speed 8GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <1us, L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+
ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled-
CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (downgraded), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+
ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
HotPlug- Surprise-
			Slot #9, PowerLimit 10.000W; Interlock-
NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown,
Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt-
PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
PMEIntEna+ CRSVisible-
		RootCap: CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+,
LTR+, OBFF Not Supported ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit-
128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, 
LTR+, OBFF Disabled ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
SpeedDis-
			 Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
			 EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee00258  Data: 0000
	Capabilities: [90] Subsystem: ASUSTeK Computer Inc. Sunrise
Point-LP PCI Express Root Port
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-
,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres-
HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
		RootCmd: CERptEn+ NFERptEn+ FERptEn+
		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
		ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=40us
PortTPowerOnTime=44us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+
			   T_CommonMode=40us LTR1.2_Threshold=163840ns
		L1SubCtl2: T_PwrOn=44us
	Capabilities: [220 v1] Secondary PCI Express <?>
	Kernel driver in use: pcieport

00:1e.0 Signal processing controller: Intel Corporation Sunrise Point-
LP Serial IO UART Controller #0 (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO
UART Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 20
	Region 0: Memory at df134000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:1e.3 Signal processing controller: Intel Corporation Sunrise Point-
LP Serial IO SPI Controller #1 (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO SPI
Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin D routed to IRQ 23
	Region 0: Memory at df133000 (64-bit, non-prefetchable)
[size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-
,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:1f.0 ISA bridge: Intel Corporation Sunrise Point LPC Controller/eSPI
Controller (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point LPC
Controller/eSPI Controller
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0

00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev
21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP PMC
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Region 0: Memory at df12c000 (32-bit, non-prefetchable)
[disabled] [size=16K]

00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev
21) (prog-if 80)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP HD Audio
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 128
	Region 0: Memory at df128000 (64-bit, non-prefetchable)
[size=16K]
	Region 4: Memory at df100000 (64-bit, non-prefetchable)
[size=64K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-
,D2-,D3hot+,D3cold+)
		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee003b8  Data: 0000
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel, snd_soc_skl

00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
	Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP SMBus
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at df132000 (64-bit, non-prefetchable)
[size=256]
	Region 4: I/O ports at f040 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

01:00.0 Network controller: Intel Corporation Wireless 8265 / 8275 (rev
78)
	Subsystem: Intel Corporation Wireless 8265 / 8275
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 126
	Region 0: Memory at df000000 (64-bit, non-prefetchable)
[size=8K]
	Capabilities: [c8] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-
,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee00318  Data: 0000
	Capabilities: [40] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<512ns, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+
FLReset-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L1, Exit
Latency L1 <8us
			ClockPM+ Surprise- LLActRep- BwNot-
ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled-
CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt-
ABWMgmt-
		DevCap2: Completion Timeout: Range B, TimeoutDis+,
LTR+, OBFF Via WAKE#
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis-, 
LTR+, OBFF Disabled
			 AtomicOpsCtl: ReqEn-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
SpeedDis-
			 Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
			 EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres-
HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Device Serial Number b4-69-21-ff-ff-de-
5e-9f
	Capabilities: [14c v1] Latency Tolerance Reporting
		Max snoop latency: 3145728ns
		Max no snoop latency: 3145728ns
	Capabilities: [154 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=30us
PortTPowerOnTime=18us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+
			   T_CommonMode=0us LTR1.2_Threshold=163840ns
		L1SubCtl2: T_PwrOn=44us
	Kernel driver in use: iwlwifi
	Kernel modules: iwlwifi

[8.6.] SCSI information (from /proc/scsi/scsi)
Attached devices:
Host: scsi2 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: SanDisk SD9SN8W2 Rev: 3002
  Type:   Direct-Access                    ANSI  SCSI revision: 05

Maybe it is not that bad to have all this in a separate mail ;).

Cheers
Julius

