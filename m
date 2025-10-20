Return-Path: <linux-input+bounces-15617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A288FBF159D
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 14:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F6E18A5CE9
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 12:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0EC2F7460;
	Mon, 20 Oct 2025 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqK0GNaG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07830214F
	for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760964800; cv=none; b=pEOMmiWcoC0ZYu4VKJKodzZBW+OZS5zv8PUzvTWnKW/7/6gwimEClV3Zu1qzqVS03Y7bjI+1SnO6TgRCiutMqGxT2HcbpVYR2407FAoYIcXmQ2h4Pf+OkRNTXUPkNsfKuiebX9QGXtxXZUapxYf63u556yZM5wcB5TiK8nCcVSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760964800; c=relaxed/simple;
	bh=tpnvt2Tgg2ifeQXSGg4Bzhybjfhv7AP1NYx9/4WvoOw=;
	h=From:Date:Message-ID:To:Cc:Subject; b=GsPqlLeTUJtFCbOr2BWwznQQ9581Cr1CKWREnMQ6AJEG3YiqlgSc6JRTIf5Y603zUrsavicVJWtPAalltqCuZUdQHuXhvs2OSrPSw5fBDHIuPQOJfi0iAzNOGOS/FiWfojJcKufZ9ktMPftLJE1oXfuqacUvsh+HB958EBYQO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqK0GNaG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso18682235e9.0
        for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 05:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760964790; x=1761569590; darn=vger.kernel.org;
        h=subject:cc:to:message-id:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VLuvrUn2Yjtxvran9NFZdYIaRfPObkrbXOqM8VC/nA=;
        b=MqK0GNaG+VjkMrbj9ShHyHJOmtyO3bdWMJzLP6qEJGL7a7P5mKwPtswBMWJMX/EhZA
         3IE320nlKusH0GRxhJrRCXkN+IE2nlvTS1EQzKAHmadkTkF0t12TzCIedIm24H/EfA+y
         /YrFoMTh/vJXW42SRBmIFDY27wKRnvgYUOlanIjKerojzv7ndE/u/hY+Y0zx9NLhjnL4
         GmUQkRwyq3KOEhds5iYxxXu3aU8xoLjwOUkLcqjUHb4e3zmWB0RddCo7eqn8RkH15SlR
         OWuLle7GYco5+DQA1uKGMDPl1doDXFnCKE9c0acq87R671ZCZIA64HykISy/iMH9m5Ex
         P6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760964790; x=1761569590;
        h=subject:cc:to:message-id:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VLuvrUn2Yjtxvran9NFZdYIaRfPObkrbXOqM8VC/nA=;
        b=NbB/xVQPsBaiNVbjJTnk+gC/VmR7K46e+Y06QK/Oqlfik3Obvn9yDOM7wbbxGg+Nso
         pIFOncQa/XZNwU5r+v5iH5SoNcAdcTe0/hKuxhi7JkhwuMhQEIyqQAl6JI5tZgfjtGRs
         wCOb2L1O8ftVpFvnaHGRiOzkCY8sz3Xt71tVr1nPADKylS2nPTTXfPyynmOuMRsEBlqb
         hbhpk2YvprejxHcvIJnlF+JmYtDiajfYc+0c61y3Ptl06BqIspTF2u8whpO+W6pe55AF
         HP7Gf2bxdMgri95J8eEMBouln/hZGYKpsHujcUFhAm0lYwmssLWOgP2azcuSJjoSiLJT
         UvRw==
X-Gm-Message-State: AOJu0Yzlix1CrCH8wTFiUjbr3zFuvIecIsoH5FIZwp14SD6xicb1ZJ9r
	4AYzfKKCOWAKWUJ08t93tv8CEKipdhI95Mfznr4hwXBqd/bjKyMnescJXa6QD9sT
X-Gm-Gg: ASbGncsU0p35bxzRwXSJ24uCpXSm8dSj2dmyiUSFbwBhbyBxv707P1C0YqDAYzcrUVD
	Dmf3MrMyoc5lei1YTJTXWtozSUsadBklB8jyCfXilC+iwUv9YlplQotbUdKTS+sPeO66+a5gnXN
	1X5MalCf8gZb6FyECC+FeBRdixEoRLKlCfOoyn1UFASKH/ACO82DzfA1EmD4lg6OGnrQoqilrAZ
	rSuvtpGKVCQN2LoylgGOXntrcxZ+HIOALv7i4VS/FO4jglK9uOlCnxcAlq75Fqm25CRacn5L9pK
	Pek7M501WQ3s3IbG7n893qr7nNoDHlQSAqqiQGoBlEKVicUXBzDC0WuBY3fOp1TM6AdDjUhu2tj
	t1gfirrHkVRAQSdNRSJ0ll6oc1LXJBXemJmigwOS2Kgs7EKlj4WUNrmER4mDAUXqvUUIxwrdBRu
	PzjcfD4TZjXJF4Rsr158nbzIyiZZAiFmcZwBkeUS3TkJrRa2AADFE18/up76QMAee3rH5T//h5
X-Google-Smtp-Source: AGHT+IHxLkqv66k1ir1IpVPhpX5+L+J9ca326GEyutcMeya8I5y8J3ILE6Vy4mviYby/z74TuGdX/A==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr107613985e9.30.1760964788781;
        Mon, 20 Oct 2025 05:53:08 -0700 (PDT)
Received: from localhost (cpc78661-glfd7-2-0-cust32.6-2.cable.virginm.net. [81.108.41.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e267fsm62248005e9.12.2025.10.20.05.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:53:07 -0700 (PDT)
From: jdtournier@gmail.com
Date: Mon, 20 Oct 2025 13:53:07 +0100
Message-ID: <557f4ad5c5e67e23a9959c6724430239@gmail.com>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: linux-input@vger.kernel.org
Subject: [BUG] HID: amd_sfh: accelerometer not detected at boot time on Lenovo Yoga 7 2-in-1 14AKP10
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

On my Lenovo Yoga 7 2-in-1 14AKP10 laptop, the accelerometer is not detected at
boot time, but it does become available (and fully functional, as far as I can
tell) after unloading and reloading the amd_sfh module manually after boot.
This occurs with the default latest Arch kernel (6.17.3-arch2-1), as well as a
fresh build of 6.18-rc2. 

I've included as much information as I can think of about the issue below, but
this is probably as far as I can take it on my own. I'm happy to provide any
further information required, or try out any patches for testing, etc.

All the best,
Donald.



---

The output of monitor-sensor shows no accelerometer detected after boot:

$ monitor-sensor
    Waiting for iio-sensor-proxy to appear
+++ iio-sensor-proxy appeared
=== No accelerometer
=== Has ambient light sensor (value: 51.500000, unit: lux)
=== No proximity sensor
=== No compass
    Light changed: 32.400000 (lux)
    Light changed: 47.900000 (lux)
...

---

And no accelerometer device in the /sys/bus/iio/devices folder:

$ ls /sys/bus/iio/devices/iio\:device*

'/sys/bus/iio/devices/iio:device0':
buffer                   firmware_node                       in_illuminance_raw                 in_intensity_hysteresis           in_intensity_scale  scan_elements  waiting_for_supplier
buffer0                  in_illuminance_hysteresis           in_illuminance_sampling_frequency  in_intensity_hysteresis_relative  name                subsystem
current_timestamp_clock  in_illuminance_hysteresis_relative  in_illuminance_scale               in_intensity_offset               physical_location   trigger
dev                      in_illuminance_offset               in_intensity_both_raw              in_intensity_sampling_frequency   power               uevent

'/sys/bus/iio/devices/iio:device1':
buffer   firmware_node             in_proximity0_raw                 in_proximity1_hysteresis  in_proximity1_sampling_frequency  physical_location  subsystem  waiting_for_supplier
buffer0  in_proximity0_hysteresis  in_proximity0_sampling_frequency  in_proximity1_offset      in_proximity1_scale               power              trigger
dev      in_proximity0_offset      in_proximity0_scale               in_proximity1_raw         name                              scan_elements      uevent

'/sys/bus/iio/devices/iio:device2':
buffer         in_attention_hysteresis          in_attention_scale        in_proximity0_sampling_frequency  in_proximity1_raw                 physical_location  trigger
buffer0        in_attention_input               in_proximity0_hysteresis  in_proximity0_scale               in_proximity1_sampling_frequency  power              uevent
dev            in_attention_offset              in_proximity0_offset      in_proximity1_hysteresis          in_proximity1_scale               scan_elements      waiting_for_supplier
firmware_node  in_attention_sampling_frequency  in_proximity0_raw         in_proximity1_offset              name                              subsystem

---


Reloading the amd_sfh module allows the accelerometer to be detected (this also 
requires unloading & reloading the amd_pmf module):

$ modprobe -r amd_pmf amd_sfh ; sleep 1; sudo modprobe amd_sfh amd_pmf


---

After a few seconds (but not immediately), the accelerometer then shows up as 
/sys/bus/iio/devices/iio:device3:


$ ls /sys/bus/iio/devices/iio\:device*

'/sys/bus/iio/devices/iio:device0':
buffer                   firmware_node                       in_illuminance_raw                 in_intensity_hysteresis           in_intensity_scale  scan_elements  waiting_for_supplier
buffer0                  in_illuminance_hysteresis           in_illuminance_sampling_frequency  in_intensity_hysteresis_relative  name                subsystem
current_timestamp_clock  in_illuminance_hysteresis_relative  in_illuminance_scale               in_intensity_offset               physical_location   trigger
dev                      in_illuminance_offset               in_intensity_both_raw              in_intensity_sampling_frequency   power               uevent

'/sys/bus/iio/devices/iio:device1':
buffer   firmware_node             in_proximity0_raw                 in_proximity1_hysteresis  in_proximity1_sampling_frequency  physical_location  subsystem  waiting_for_supplier
buffer0  in_proximity0_hysteresis  in_proximity0_sampling_frequency  in_proximity1_offset      in_proximity1_scale               power              trigger
dev      in_proximity0_offset      in_proximity0_scale               in_proximity1_raw         name                              scan_elements      uevent

'/sys/bus/iio/devices/iio:device2':
buffer         in_attention_hysteresis          in_attention_scale        in_proximity0_sampling_frequency  in_proximity1_raw                 physical_location  trigger
buffer0        in_attention_input               in_proximity0_hysteresis  in_proximity0_scale               in_proximity1_sampling_frequency  power              uevent
dev            in_attention_offset              in_proximity0_offset      in_proximity1_hysteresis          in_proximity1_scale               scan_elements      waiting_for_supplier
firmware_node  in_attention_sampling_frequency  in_proximity0_raw         in_proximity1_offset              name                              subsystem

'/sys/bus/iio/devices/iio:device3':
buffer   current_timestamp_clock  in_accel_hysteresis  in_accel_sampling_frequency  in_accel_x_raw  in_accel_z_raw  power          subsystem  uevent
buffer0  dev                      in_accel_offset      in_accel_scale               in_accel_y_raw  name            scan_elements  trigger

---


This is also confirmed by monitor-sensor (and tilt events now show up when 
running 'sudo libinput debug-events'):

$ monitor-sensor

    Waiting for iio-sensor-proxy to appear
+++ iio-sensor-proxy appeared
=== Has accelerometer (orientation: normal, tilt: tilted-down)
=== Has ambient light sensor (value: 47.900000, unit: lux)
=== No proximity sensor
=== No compass
    Light changed: 84.100000 (lux)tgvvhkccazkrliyc
...

---


I've included some information that may be relevant below:

---

$ sudo lscpi -vv

04:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AMD] Sensor Fusion Hub
        Subsystem: Lenovo Device 3840
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin C routed to IRQ 86
        IOMMU group: 22
        Region 2: Memory at 80300000 (32-bit, non-prefetchable) [size=1M]
        Region 5: Memory at 805cc000 (32-bit, non-prefetchable) [size=8K]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
                LnkSta: Speed 16GT/s, Width x16
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
                         10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
        Capabilities: [a0] MSI: Enable- Count=1/2 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] MSI-X: Enable- Count=2 Masked-
                Vector table: BAR=5 offset=00000000
                PBA: BAR=5 offset=00001000
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Kernel driver in use: pcie_mp2_amd
        Kernel modules: amd_sfh

---


$ sudo dmesg 


[    0.000000] Linux version 6.18.0-rc2 (donald@donald-laptop) (gcc (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #5 SMP PREEMPT_DYNAMIC Mon Oct 20 12:38:36 BST 2025
[    0.000000] Command line: initrd=\initramfs-linux6.18-rc2.img root=PARTUUID=c946bb65-c19d-4e98-a8de-71dc77e4af51 zswap.enabled=0 rw rootfstype=ext4
[    0.000000] x86/split lock detection: #DB: warning on user-space bus_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009b00000-0x0000000009dfffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000009e00000-0x0000000009efffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000009f3c000-0x0000000069efdfff] usable
[    0.000000] BIOS-e820: [mem 0x0000000069efe000-0x00000000754fdfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000754fe000-0x00000000756fdfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000756fe000-0x00000000757fdfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000757fe000-0x0000000077573fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000077574000-0x00000000775a2fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000775a3000-0x0000000077ff6fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000077ff7000-0x0000000077ffcfff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000077ffd000-0x0000000077ffefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000077fff000-0x000000007bffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000007d675000-0x000000007fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000085e27ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000085e280000-0x00000008a01fffff] reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.7 by Phoenix Technologies
[    0.000000] efi: ACPI=0x757fd000 ACPI 2.0=0x757fd014 SMBIOS=0x6ff6d000 SMBIOS 3.0=0x6ff60000 TPMFinalLog=0x7564a000 MEMATTR=0x57d81018 ESRT=0x5a9f9d18 RNG=0x757fbf18 INITRD=0x36efd098 TPMEventLog=0x757ef018 
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem61: MMIO range=[0xfd000000-0xffffffff] (48MB) from e820 map
[    0.000000] e820: remove [mem 0xfd000000-0xffffffff] reserved
[    0.000000] efi: Remove mem63: MMIO range=[0x880000000-0x8a01fffff] (514MB) from e820 map
[    0.000000] e820: remove [mem 0x880000000-0x8a01fffff] reserved
[    0.000000] SMBIOS 3.4.0 present.
[    0.000000] DMI: LENOVO 83JR/LNVNB161216, BIOS QXCN18WW 07/16/2025
[    0.000000] DMI: Memory slots populated: 4/4
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 1996.280 MHz processor
[    0.000006] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000007] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000012] last_pfn = 0x85e280 max_arch_pfn = 0x400000000
[    0.000017] MTRR map: 5 entries (1 fixed + 4 variable; max 18), built from 9 variable MTRRs
[    0.000019] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000260] last_pfn = 0x77fff max_arch_pfn = 0x400000000
[    0.003302] esrt: Reserving ESRT space from 0x000000005a9f9d18 to 0x000000005a9f9df0.
[    0.003307] e820: update [mem 0x5a9f9000-0x5a9f9fff] usable ==> reserved
[    0.003318] Using GB pages for direct mapping
[    0.003446] Secure boot disabled
[    0.003447] RAMDISK: [mem 0x1e951000-0x296fffff]
[    0.003559] ACPI: Early table checksum verification disabled
[    0.003562] ACPI: RSDP 0x00000000757FD014 000024 (v02 LENOVO)
[    0.003565] ACPI: XSDT 0x00000000757FC228 000194 (v01 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003569] ACPI: FACP 0x000000006FE35000 000114 (v06 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003572] ACPI: DSDT 0x000000006FE1F000 015573 (v02 LENOVO AMD_EDK2 00000000 INTL 20210930)
[    0.003574] ACPI: FACS 0x000000007562B000 000040
[    0.003575] ACPI: SSDT 0x000000006FF9F000 0012C9 (v01 LENOVO UsbCTabl 00000001 INTL 20210930)
[    0.003577] ACPI: SSDT 0x000000006FF71000 007F20 (v02 LENOVO AmdTable 00000002 MSFT 05000000)
[    0.003578] ACPI: SSDT 0x000000006FF41000 000047 (v01 LENOVO HQSBTabl 00000001 INTL 20210930)
[    0.003579] ACPI: APIC 0x000000006FE37000 0000DE (v04 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003580] ACPI: MCFG 0x000000006FE36000 00003C (v01 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003581] ACPI: SSDT 0x000000006FE01000 000314 (v02 LENOVO Tpm2Tabl 00001000 INTL 20210930)
[    0.003582] ACPI: POAT 0x000000006FDFF000 000055 (v03 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003583] ACPI: BATB 0x000000006FDEA000 00004A (v02 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003584] ACPI: VFCT 0x000000006D9BE000 005484 (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003586] ACPI: SSDT 0x000000006D995000 00021A (v02 LENOVO Hetero   00000001 INTL 20210930)
[    0.003587] ACPI: PCCT 0x000000006D994000 0000D4 (v02 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003588] ACPI: SSDT 0x000000006D98E000 00547E (v02 LENOVO AMD CPU  00000001 AMD  00000001)
[    0.003589] ACPI: SDEV 0x000000006D98D000 0001F2 (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003590] ACPI: ABLT 0x000000006D98C000 0002C2 (v00 LENOVO CB-01    00000000 PTEC 00000002)
[    0.003591] ACPI: FPDT 0x000000006D98B000 000034 (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003592] ACPI: HPET 0x000000006D98A000 000038 (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003593] ACPI: WSMT 0x000000006D989000 000028 (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003594] ACPI: SSDT 0x000000006D954000 03419F (v02 LENOVO OEMACP   00000001 INTL 20210930)
[    0.003596] ACPI: SSDT 0x000000006D953000 000A70 (v02 LENOVO OEMPMF   00000001 INTL 20210930)
[    0.003597] ACPI: SSDT 0x000000006D951000 001DB7 (v02 LENOVO CPMPMF   00000001 INTL 20210930)
[    0.003598] ACPI: SSDT 0x000000006D950000 000782 (v02 LENOVO CPMEC    00000001 INTL 20210930)
[    0.003599] ACPI: SSDT 0x000000006D94E000 00169E (v02 LENOVO CPMDFIG2 00000001 INTL 20210930)
[    0.003600] ACPI: SSDT 0x000000006D94B000 002AA6 (v02 LENOVO CDFAAIG2 00000001 INTL 20210930)
[    0.003601] ACPI: SSDT 0x000000006D941000 009A47 (v02 LENOVO CPMCMN   00000001 INTL 20210930)
[    0.003602] ACPI: BGRT 0x000000006D940000 000038 (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003603] ACPI: SSDT 0x000000006D93E000 001B4C (v02 LENOVO AOD      00000001 INTL 20210930)
[    0.003604] ACPI: SSDT 0x000000006D93D000 000A13 (v02 LENOVO SDCR     00000001 INTL 20210930)
[    0.003605] ACPI: SSDT 0x000000006D93B000 001018 (v02 LENOVO WLAN     00000001 INTL 20210930)
[    0.003607] ACPI: SSDT 0x000000006D93A000 000DAB (v02 LENOVO NVME     00000001 INTL 20210930)
[    0.003608] ACPI: SSDT 0x000000006D938000 001302 (v02 LENOVO GpMsSsdt 00000001 INTL 20210930)
[    0.003609] ACPI: SSDT 0x000000006D936000 001811 (v02 LENOVO UPEP     00000001 INTL 20210930)
[    0.003610] ACPI: SSDT 0x000000006D935000 000995 (v02 LENOVO THERMAL0 00000001 INTL 20210930)
[    0.003611] ACPI: SSDT 0x000000006D933000 00101C (v02 LENOVO GPP_PME_ 00000001 INTL 20210930)
[    0.003612] ACPI: SSDT 0x000000006D929000 00972B (v02 LENOVO INTGPPC_ 00000001 INTL 20210930)
[    0.003613] ACPI: SSDT 0x000000006D924000 004608 (v02 LENOVO INTGPPA_ 00000001 INTL 20210930)
[    0.003614] ACPI: SSDT 0x000000006D923000 000941 (v02 LENOVO CPMGPIO0 00000001 INTL 20210930)
[    0.003615] ACPI: UEFI 0x000000007562A000 0000EE (v01 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003616] ACPI: SSDT 0x000000006D922000 00010D (v02 LENOVO MHSP     00000004 INTL 20210930)
[    0.003618] ACPI: TPM2 0x000000006D921000 000050 (v05 LENOVO CB-01    20505348 PTEC 00000002)
[    0.003619] ACPI: SSDT 0x000000006D920000 000051 (v02 LENOVO DRTM     00000001 INTL 20210930)
[    0.003620] ACPI: IVRS 0x000000006D91F000 000216 (v02 LENOVO CB-01    00000001 PTEC 00000002)
[    0.003621] ACPI: SSDT 0x000000006FF9E000 00096A (v02 LENOVO CPMMSOSC 00000001 INTL 20210930)
[    0.003622] ACPI: SSDT 0x000000006FF9D000 00008D (v02 LENOVO CPMMSLPI 00000001 INTL 20210930)
[    0.003623] ACPI: SSDT 0x000000006FF9C000 000509 (v02 LENOVO CPMSFAML 00000001 INTL 20210930)
[    0.003624] ACPI: SSDT 0x000000006FF9B000 000F5C (v02 LENOVO CPMACPV8 00000001 INTL 20210930)
[    0.003625] ACPI: Reserving FACP table memory at [mem 0x6fe35000-0x6fe35113]
[    0.003626] ACPI: Reserving DSDT table memory at [mem 0x6fe1f000-0x6fe34572]
[    0.003626] ACPI: Reserving FACS table memory at [mem 0x7562b000-0x7562b03f]
[    0.003626] ACPI: Reserving SSDT table memory at [mem 0x6ff9f000-0x6ffa02c8]
[    0.003627] ACPI: Reserving SSDT table memory at [mem 0x6ff71000-0x6ff78f1f]
[    0.003627] ACPI: Reserving SSDT table memory at [mem 0x6ff41000-0x6ff41046]
[    0.003627] ACPI: Reserving APIC table memory at [mem 0x6fe37000-0x6fe370dd]
[    0.003627] ACPI: Reserving MCFG table memory at [mem 0x6fe36000-0x6fe3603b]
[    0.003627] ACPI: Reserving SSDT table memory at [mem 0x6fe01000-0x6fe01313]
[    0.003628] ACPI: Reserving POAT table memory at [mem 0x6fdff000-0x6fdff054]
[    0.003628] ACPI: Reserving BATB table memory at [mem 0x6fdea000-0x6fdea049]
[    0.003628] ACPI: Reserving VFCT table memory at [mem 0x6d9be000-0x6d9c3483]
[    0.003628] ACPI: Reserving SSDT table memory at [mem 0x6d995000-0x6d995219]
[    0.003629] ACPI: Reserving PCCT table memory at [mem 0x6d994000-0x6d9940d3]
[    0.003629] ACPI: Reserving SSDT table memory at [mem 0x6d98e000-0x6d99347d]
[    0.003629] ACPI: Reserving SDEV table memory at [mem 0x6d98d000-0x6d98d1f1]
[    0.003629] ACPI: Reserving ABLT table memory at [mem 0x6d98c000-0x6d98c2c1]
[    0.003630] ACPI: Reserving FPDT table memory at [mem 0x6d98b000-0x6d98b033]
[    0.003630] ACPI: Reserving HPET table memory at [mem 0x6d98a000-0x6d98a037]
[    0.003630] ACPI: Reserving WSMT table memory at [mem 0x6d989000-0x6d989027]
[    0.003630] ACPI: Reserving SSDT table memory at [mem 0x6d954000-0x6d98819e]
[    0.003631] ACPI: Reserving SSDT table memory at [mem 0x6d953000-0x6d953a6f]
[    0.003631] ACPI: Reserving SSDT table memory at [mem 0x6d951000-0x6d952db6]
[    0.003631] ACPI: Reserving SSDT table memory at [mem 0x6d950000-0x6d950781]
[    0.003631] ACPI: Reserving SSDT table memory at [mem 0x6d94e000-0x6d94f69d]
[    0.003631] ACPI: Reserving SSDT table memory at [mem 0x6d94b000-0x6d94daa5]
[    0.003632] ACPI: Reserving SSDT table memory at [mem 0x6d941000-0x6d94aa46]
[    0.003632] ACPI: Reserving BGRT table memory at [mem 0x6d940000-0x6d940037]
[    0.003632] ACPI: Reserving SSDT table memory at [mem 0x6d93e000-0x6d93fb4b]
[    0.003632] ACPI: Reserving SSDT table memory at [mem 0x6d93d000-0x6d93da12]
[    0.003633] ACPI: Reserving SSDT table memory at [mem 0x6d93b000-0x6d93c017]
[    0.003633] ACPI: Reserving SSDT table memory at [mem 0x6d93a000-0x6d93adaa]
[    0.003633] ACPI: Reserving SSDT table memory at [mem 0x6d938000-0x6d939301]
[    0.003633] ACPI: Reserving SSDT table memory at [mem 0x6d936000-0x6d937810]
[    0.003634] ACPI: Reserving SSDT table memory at [mem 0x6d935000-0x6d935994]
[    0.003634] ACPI: Reserving SSDT table memory at [mem 0x6d933000-0x6d93401b]
[    0.003634] ACPI: Reserving SSDT table memory at [mem 0x6d929000-0x6d93272a]
[    0.003634] ACPI: Reserving SSDT table memory at [mem 0x6d924000-0x6d928607]
[    0.003635] ACPI: Reserving SSDT table memory at [mem 0x6d923000-0x6d923940]
[    0.003635] ACPI: Reserving UEFI table memory at [mem 0x7562a000-0x7562a0ed]
[    0.003635] ACPI: Reserving SSDT table memory at [mem 0x6d922000-0x6d92210c]
[    0.003635] ACPI: Reserving TPM2 table memory at [mem 0x6d921000-0x6d92104f]
[    0.003636] ACPI: Reserving SSDT table memory at [mem 0x6d920000-0x6d920050]
[    0.003636] ACPI: Reserving IVRS table memory at [mem 0x6d91f000-0x6d91f215]
[    0.003636] ACPI: Reserving SSDT table memory at [mem 0x6ff9e000-0x6ff9e969]
[    0.003636] ACPI: Reserving SSDT table memory at [mem 0x6ff9d000-0x6ff9d08c]
[    0.003637] ACPI: Reserving SSDT table memory at [mem 0x6ff9c000-0x6ff9c508]
[    0.003637] ACPI: Reserving SSDT table memory at [mem 0x6ff9b000-0x6ff9bf5b]
[    0.003687] No NUMA configuration found
[    0.003688] Faking a node at [mem 0x0000000000000000-0x000000085e27ffff]
[    0.003692] NODE_DATA(0) allocated [mem 0x85e255280-0x85e27ffff]
[    0.003802] Zone ranges:
[    0.003803]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.003804]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.003804]   Normal   [mem 0x0000000100000000-0x000000085e27ffff]
[    0.003805]   Device   empty
[    0.003805] Movable zone start for each node
[    0.003806] Early memory node ranges
[    0.003806]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.003807]   node   0: [mem 0x0000000000100000-0x0000000009afffff]
[    0.003808]   node   0: [mem 0x0000000009e00000-0x0000000009efffff]
[    0.003808]   node   0: [mem 0x0000000009f3c000-0x0000000069efdfff]
[    0.003808]   node   0: [mem 0x00000000757fe000-0x0000000077573fff]
[    0.003809]   node   0: [mem 0x00000000775a3000-0x0000000077ff6fff]
[    0.003809]   node   0: [mem 0x0000000077ffd000-0x0000000077ffefff]
[    0.003809]   node   0: [mem 0x0000000100000000-0x000000085e27ffff]
[    0.003811] Initmem setup node 0 [mem 0x0000000000001000-0x000000085e27ffff]
[    0.003815] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.003821] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.003867] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.004512] On node 0, zone DMA32: 60 pages in unavailable ranges
[    0.004640] On node 0, zone DMA32: 47360 pages in unavailable ranges
[    0.004647] On node 0, zone DMA32: 47 pages in unavailable ranges
[    0.004647] On node 0, zone DMA32: 6 pages in unavailable ranges
[    0.019632] On node 0, zone Normal: 1 pages in unavailable ranges
[    0.019649] On node 0, zone Normal: 7552 pages in unavailable ranges
[    0.020424] ACPI: PM-Timer IO Port: 0x408
[    0.020432] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    0.020444] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0-23
[    0.020449] IOAPIC[1]: apic_id 34, version 33, address 0xfd280000, GSI 24-55
[    0.020450] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.020451] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.020453] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.020454] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.020462] e820: update [mem 0x578aa000-0x579b8fff] usable ==> reserved
[    0.020473] CPU topo: Max. logical packages:   1
[    0.020474] CPU topo: Max. logical dies:       1
[    0.020474] CPU topo: Max. dies per package:   1
[    0.020476] CPU topo: Max. threads per core:   2
[    0.020476] CPU topo: Num. cores per package:     8
[    0.020477] CPU topo: Num. threads per package:  16
[    0.020477] CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.020490] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.020491] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.020492] PM: hibernation: Registered nosave memory: [mem 0x09b00000-0x09dfffff]
[    0.020492] PM: hibernation: Registered nosave memory: [mem 0x09f00000-0x09f3bfff]
[    0.020493] PM: hibernation: Registered nosave memory: [mem 0x578aa000-0x579b8fff]
[    0.020493] PM: hibernation: Registered nosave memory: [mem 0x5a9f9000-0x5a9f9fff]
[    0.020494] PM: hibernation: Registered nosave memory: [mem 0x69efe000-0x757fdfff]
[    0.020495] PM: hibernation: Registered nosave memory: [mem 0x77574000-0x775a2fff]
[    0.020495] PM: hibernation: Registered nosave memory: [mem 0x77ff7000-0x77ffcfff]
[    0.020496] PM: hibernation: Registered nosave memory: [mem 0x77fff000-0xffffffff]
[    0.020497] [mem 0x80000000-0xdfffffff] available for PCI devices
[    0.020498] Booting paravirtualized kernel on bare hardware
[    0.020500] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.024229] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
[    0.024422] percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u262144
[    0.024425] pcpu-alloc: s217088 r8192 d28672 u262144 alloc=1*2097152
[    0.024426] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.024437] Kernel command line: initrd=\initramfs-linux6.18-rc2.img root=PARTUUID=c946bb65-c19d-4e98-a8de-71dc77e4af51 zswap.enabled=0 rw rootfstype=ext4
[    0.024478] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
[    0.025503] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.026026] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.026127] software IO TLB: area num 16.
[    0.030048] Fallback order for Node 0: 0 
[    0.030054] Built 1 zonelists, mobility grouping on.  Total pages: 8168876
[    0.030055] Policy zone: Normal
[    0.030136] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.055239] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
[    0.064054] ftrace: allocating 56848 entries in 224 pages
[    0.064055] ftrace: allocated 224 pages with 3 groups
[    0.064105] Dynamic Preempt: full
[    0.064144] rcu: Preemptible hierarchical RCU implementation.
[    0.064145] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=16.
[    0.064145] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.064146] 	Trampoline variant of Tasks RCU enabled.
[    0.064147] 	Rude variant of Tasks RCU enabled.
[    0.064147] 	Tracing variant of Tasks RCU enabled.
[    0.064148] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.064148] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
[    0.064155] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.064157] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.064158] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.066597] NR_IRQS: 524544, nr_irqs: 1096, preallocated irqs: 16
[    0.066778] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.066872] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.066894] Console: colour dummy device 80x25
[    0.066897] printk: legacy console [tty0] enabled
[    0.066922] ACPI: Core revision 20250807
[    0.067146] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.067163] APIC: Switch to symmetric I/O mode setup
[    0.067342] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    0.067343] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    0.067344] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    0.067344] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0x98
[    0.067345] AMD-Vi: ivrs, add hid:MSFT0201, uid:1, rdevid:0x60
[    0.067345] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0x98
[    0.067346] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x10
[    0.068486] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.073167] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x398ce811d86, max_idle_ns: 881590489199 ns
[    0.073169] Calibrating delay loop (skipped), value calculated using timer frequency.. 3992.56 BogoMIPS (lpj=1996280)
[    0.073185] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.073219] LVT offset 1 assigned for vector 0xf9
[    0.073377] LVT offset 2 assigned for vector 0xf4
[    0.073457] Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
[    0.073458] Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
[    0.073459] process: using mwait in idle threads
[    0.073461] mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.073463] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.073465] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.073465] Spectre V2 : User space: Mitigation: STIBP always-on protection
[    0.073466] Speculative Return Stack Overflow: Mitigation: IBPB on VMEXIT only
[    0.073466] VMSCAPE: Mitigation: IBPB on VMEXIT
[    0.073467] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.073468] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.073474] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.073475] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.073475] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.073476] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.073476] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.073477] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.073477] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.073478] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.073478] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kernel registers (KVM only)'
[    0.073479] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.073480] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.073480] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.073481] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.073481] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.073482] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.073482] x86/fpu: xstate_offset[12]: 2456, xstate_sizes[12]:   24
[    0.073483] x86/fpu: Enabled xstate features 0x1ae7, context size is 2480 bytes, using 'compacted' format.
[    0.096892] Freeing SMP alternatives memory: 56K
[    0.096894] pid_max: default: 32768 minimum: 301
[    0.096919] LSM: initializing lsm=capability,landlock,lockdown,yama,bpf
[    0.096969] landlock: Up and running.
[    0.096971] Yama: becoming mindful.
[    0.097091] LSM support for eBPF active
[    0.097117] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.097135] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.199467] smpboot: CPU0: AMD Ryzen AI 7 350 w/ Radeon 860M (family: 0x1a, model: 0x60, stepping: 0x0)
[    0.199555] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD PMU driver.
[    0.199575] ... version:                   2
[    0.199576] ... bit width:                 48
[    0.199576] ... generic counters:          6
[    0.199577] ... generic bitmap:            000000000000003f
[    0.199577] ... fixed-purpose counters:    0
[    0.199577] ... fixed-purpose bitmap:      0000000000000000
[    0.199578] ... value mask:                0000ffffffffffff
[    0.199578] ... max period:                00007fffffffffff
[    0.199578] ... global_ctrl mask:          000000000000003f
[    0.199645] signal: max sigframe size: 3376
[    0.199657] rcu: Hierarchical SRCU implementation.
[    0.199657] rcu: 	Max phase no-delay instances is 400.
[    0.199685] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.199823] MCE: In-kernel MCE decoding enabled.
[    0.199847] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.199894] smp: Bringing up secondary CPUs ...
[    0.199936] smpboot: x86: Booting SMP configuration:
[    0.199936] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
[    0.202295] Spectre V2 : Update user space SMT mitigation: STIBP always-on
[    0.203182] smp: Brought up 1 node, 16 CPUs
[    0.203183] smpboot: Total of 16 processors activated (63880.96 BogoMIPS)
[    0.204269] Memory: 31778804K/32675504K available (20202K kernel code, 2942K rwdata, 16952K rodata, 4704K init, 4832K bss, 873152K reserved, 0K cma-reserved)
[    0.205169] devtmpfs: initialized
[    0.205200] x86/mm: Memory block size: 128MB
[    0.206107] ACPI: PM: Registering ACPI NVS region [mem 0x09b00000-0x09dfffff] (3145728 bytes)
[    0.206175] ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f3bfff] (245760 bytes)
[    0.206176] ACPI: PM: Registering ACPI NVS region [mem 0x754fe000-0x756fdfff] (2097152 bytes)
[    0.206206] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.206206] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.206206] futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
[    0.206239] pinctrl core: initialized pinctrl subsystem
[    0.206320] PM: RTC time: 11:50:37, date: 2025-10-20
[    0.206537] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.206704] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.206826] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.206955] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.206959] audit: initializing netlink subsys (disabled)
[    0.206964] audit: type=2000 audit(1760961037.000:1): state=initialized audit_enabled=0 res=1
[    0.206964] thermal_sys: Registered thermal governor 'fair_share'
[    0.206964] thermal_sys: Registered thermal governor 'bang_bang'
[    0.206964] thermal_sys: Registered thermal governor 'step_wise'
[    0.206964] thermal_sys: Registered thermal governor 'user_space'
[    0.206964] thermal_sys: Registered thermal governor 'power_allocator'
[    0.206964] cpuidle: using governor ladder
[    0.206964] cpuidle: using governor menu
[    0.207182] Detected 1 PCC Subspaces
[    0.207183] Registering PCC driver as Mailbox controller
[    0.207262] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.207262] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for domain 0000 [bus 00-ff]
[    0.207262] PCI: Using configuration type 1 for base access
[    0.207312] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.213276] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.213277] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.213278] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.213279] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.213910] raid6: skipped pq benchmark and selected avx512x4
[    0.213911] raid6: using avx512x2 recovery algorithm
[    0.213958] ACPI: Added _OSI(Module Device)
[    0.213959] ACPI: Added _OSI(Processor Device)
[    0.213959] ACPI: Added _OSI(Processor Aggregator Device)
[    0.225740] ACPI: 31 ACPI AML tables successfully acquired and loaded
[    0.229956] ACPI: EC: EC started
[    0.229956] ACPI: EC: interrupt blocked
[    0.230340] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.230342] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle transactions
[    0.230343] ACPI: Interpreter enabled
[    0.230352] ACPI: PM: (supports S0 S4 S5)
[    0.230353] ACPI: Using IOAPIC for interrupt routing
[    0.230660] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.230661] PCI: Ignoring E820 reservations for host bridge windows
[    0.230841] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.231451] ACPI: \_SB_.PCI0.GPP0.PWRS: New power resource
[    0.231687] ACPI: \_SB_.PCI0.GPP0.SWUS.PWRS: New power resource
[    0.231912] ACPI: \_SB_.PCI0.GPP1.PWRS: New power resource
[    0.232142] ACPI: \_SB_.PCI0.GPP1.SWUS.PWRS: New power resource
[    0.232261] ACPI: \_SB_.PCI0.GPP3.P0NV: New power resource
[    0.232588] ACPI: \_SB_.PCI0.GPP4.PWSR: New power resource
[    0.233033] ACPI: \_SB_.PCI0.GPP5.PWSR: New power resource
[    0.233258] ACPI: \_SB_.PCI0.GPP5.WLAN.WRST: New power resource
[    0.233451] ACPI: \_SB_.PCI0.GPPA.PWRS: New power resource
[    0.233544] ACPI: \_SB_.PCI0.GPPA.VGA_.PWRS: New power resource
[    0.233659] ACPI: \_SB_.PCI0.GPPA.ACP_.PWRS: New power resource
[    0.233854] ACPI: \_SB_.PCI0.GPPA.AZAL.PWRS: New power resource
[    0.233999] ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    0.234168] ACPI: \_SB_.PCI0.GPPA.XHC1.PWRS: New power resource
[    0.234534] ACPI: \_SB_.PCI0.GPPC.XHC0.PWRS: New power resource
[    0.234770] ACPI: \_SB_.PCI0.GPPC.XHC0.RHUB.PRT5.BRST: New power resource
[    0.235022] ACPI: \_SB_.PCI0.GPPC.NHI0.PWRS: New power resource
[    0.235253] ACPI: \_SB_.PCI0.GPPC.XHC3.PWRS: New power resource
[    0.235613] ACPI: \_SB_.PCI0.GPPC.NHI1.PWRS: New power resource
[    0.235840] ACPI: \_SB_.PCI0.GPPC.XHC4.PWRS: New power resource
[    0.238323] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.238327] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.238353] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER]
[    0.238397] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability LTR DPC]
[    0.238559] PCI host bridge to bus 0000:00
[    0.238561] pci_bus 0000:00: root bus resource [mem 0x80000000-0xdfffffff window]
[    0.238562] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfcffffff window]
[    0.238562] pci_bus 0000:00: root bus resource [mem 0x8a0200000-0x833fffffff window]
[    0.238563] pci_bus 0000:00: root bus resource [io  0x1000-0xffff window]
[    0.238563] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.238564] pci_bus 0000:00: root bus resource [io  0x0d00-0x0fff window]
[    0.238565] pci_bus 0000:00: root bus resource [mem 0xfec00000-0xfec01fff window]
[    0.238565] pci_bus 0000:00: root bus resource [mem 0xfed45000-0xfed811ff window]
[    0.238565] pci_bus 0000:00: root bus resource [mem 0xfed81900-0xfed81fff window]
[    0.238566] pci_bus 0000:00: root bus resource [mem 0xfedc0000-0xfedc0fff window]
[    0.238566] pci_bus 0000:00: root bus resource [mem 0xfedc6000-0xfedc6fff window]
[    0.238567] pci_bus 0000:00: root bus resource [mem 0xfee01000-0xffffffff window]
[    0.238568] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.238579] pci 0000:00:00.0: [1022:1122] type 00 class 0x060000 conventional PCI endpoint
[    0.238649] pci 0000:00:00.2: [1022:1123] type 00 class 0x080600 conventional PCI endpoint
[    0.238713] pci 0000:00:01.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.238762] pci 0000:00:02.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.238809] pci 0000:00:02.1: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.238825] pci 0000:00:02.1: PCI bridge to [bus 01]
[    0.238831] pci 0000:00:02.1:   bridge window [mem 0x80f00000-0x80ffffff]
[    0.238899] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.239008] pci 0000:00:02.2: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.239024] pci 0000:00:02.2: PCI bridge to [bus 02]
[    0.239029] pci 0000:00:02.2:   bridge window [mem 0x80e00000-0x80efffff]
[    0.239113] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    0.239219] pci 0000:00:02.3: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.239235] pci 0000:00:02.3: PCI bridge to [bus 03]
[    0.239240] pci 0000:00:02.3:   bridge window [mem 0x80600000-0x808fffff]
[    0.239306] pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
[    0.239412] pci 0000:00:03.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.239466] pci 0000:00:08.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.239514] pci 0000:00:08.1: [1022:1110] type 01 class 0x060400 PCIe Root Port
[    0.239538] pci 0000:00:08.1: PCI bridge to [bus 04]
[    0.239541] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.239542] pci 0000:00:08.1:   bridge window [mem 0x80000000-0x805fffff]
[    0.239546] pci 0000:00:08.1:   bridge window [mem 0x8c0000000-0x8e07fffff 64bit pref]
[    0.239551] pci 0000:00:08.1: enabling Extended Tags
[    0.239583] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.239698] pci 0000:00:08.2: [1022:1111] type 01 class 0x060400 PCIe Root Port
[    0.239718] pci 0000:00:08.2: PCI bridge to [bus 05]
[    0.239721] pci 0000:00:08.2:   bridge window [mem 0x80c00000-0x80dfffff]
[    0.239726] pci 0000:00:08.2:   bridge window [mem 0x8e0800000-0x8e08fffff 64bit pref]
[    0.239730] pci 0000:00:08.2: enabling Extended Tags
[    0.239762] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.239820] pci 0000:00:08.3: [1022:1112] type 01 class 0x060400 PCIe Root Port
[    0.239831] pci 0000:00:08.3: PCI bridge to [bus 06]
[    0.239834] pci 0000:00:08.3:   bridge window [mem 0x80900000-0x80bfffff]
[    0.239843] pci 0000:00:08.3: enabling Extended Tags
[    0.239874] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.240010] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conventional PCI endpoint
[    0.240083] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conventional PCI endpoint
[    0.240167] pci 0000:00:18.0: [1022:1248] type 00 class 0x060000 conventional PCI endpoint
[    0.240184] pci 0000:00:18.1: [1022:1249] type 00 class 0x060000 conventional PCI endpoint
[    0.240203] pci 0000:00:18.2: [1022:124a] type 00 class 0x060000 conventional PCI endpoint
[    0.240221] pci 0000:00:18.3: [1022:124b] type 00 class 0x060000 conventional PCI endpoint
[    0.240238] pci 0000:00:18.4: [1022:124c] type 00 class 0x060000 conventional PCI endpoint
[    0.240255] pci 0000:00:18.5: [1022:124d] type 00 class 0x060000 conventional PCI endpoint
[    0.240272] pci 0000:00:18.6: [1022:124e] type 00 class 0x060000 conventional PCI endpoint
[    0.240289] pci 0000:00:18.7: [1022:124f] type 00 class 0x060000 conventional PCI endpoint
[    0.240860] pci 0000:01:00.0: [144d:a80d] type 00 class 0x010802 PCIe Endpoint
[    0.240898] pci 0000:01:00.0: BAR 0 [mem 0x80f00000-0x80f03fff 64bit]
[    0.241161] pci 0000:00:02.1: PCI bridge to [bus 01]
[    0.241228] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000 PCIe Endpoint
[    0.241273] pci 0000:02:00.0: BAR 0 [mem 0x80e00000-0x80e00fff]
[    0.241356] pci 0000:02:00.0: supports D1 D2
[    0.241357] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.241509] pci 0000:00:02.2: PCI bridge to [bus 02]
[    0.241564] pci 0000:03:00.0: [14c3:7925] type 00 class 0x028000 PCIe Endpoint
[    0.241610] pci 0000:03:00.0: BAR 0 [mem 0x80600000-0x807fffff 64bit]
[    0.241613] pci 0000:03:00.0: BAR 2 [mem 0x80800000-0x80807fff 64bit]
[    0.241691] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.241869] pci 0000:00:02.3: PCI bridge to [bus 03]
[    0.241924] pci 0000:04:00.0: [1002:1114] type 00 class 0x038000 PCIe Legacy Endpoint
[    0.242318] pci 0000:04:00.0: BAR 0 [mem 0x8c0000000-0x8dfffffff 64bit pref]
[    0.242320] pci 0000:04:00.0: BAR 2 [mem 0x80000000-0x801fffff 64bit pref]
[    0.242321] pci 0000:04:00.0: BAR 4 [io  0x1000-0x10ff]
[    0.242322] pci 0000:04:00.0: BAR 5 [mem 0x80500000-0x8057ffff]
[    0.242327] pci 0000:04:00.0: enabling Extended Tags
[    0.242380] pci 0000:04:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.242709] pci 0000:04:00.1: [1002:1640] type 00 class 0x040300 PCIe Legacy Endpoint
[    0.242731] pci 0000:04:00.1: BAR 0 [mem 0x805c8000-0x805cbfff]
[    0.242738] pci 0000:04:00.1: enabling Extended Tags
[    0.242770] pci 0000:04:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.242870] pci 0000:04:00.2: [1022:17e0] type 00 class 0x108000 PCIe Endpoint
[    0.242893] pci 0000:04:00.2: BAR 2 [mem 0x80400000-0x804fffff]
[    0.242895] pci 0000:04:00.2: BAR 5 [mem 0x805ce000-0x805cffff]
[    0.242900] pci 0000:04:00.2: enabling Extended Tags
[    0.242985] pci 0000:04:00.4: [1022:1128] type 00 class 0x0c0330 PCIe Endpoint
[    0.243008] pci 0000:04:00.4: BAR 0 [mem 0x80200000-0x802fffff 64bit]
[    0.243014] pci 0000:04:00.4: enabling Extended Tags
[    0.243048] pci 0000:04:00.4: PME# supported from D0 D3hot D3cold
[    0.243235] pci 0000:04:00.5: [1022:15e2] type 00 class 0x048000 PCIe Endpoint
[    0.243257] pci 0000:04:00.5: BAR 0 [mem 0x80580000-0x805bffff]
[    0.243259] pci 0000:04:00.5: BAR 2 [mem 0x8e0000000-0x8e07fffff 64bit pref]
[    0.243264] pci 0000:04:00.5: enabling Extended Tags
[    0.243296] pci 0000:04:00.5: PME# supported from D0 D3hot D3cold
[    0.243397] pci 0000:04:00.6: [1022:15e3] type 00 class 0x040300 PCIe Endpoint
[    0.243419] pci 0000:04:00.6: BAR 0 [mem 0x805c0000-0x805c7fff]
[    0.243426] pci 0000:04:00.6: enabling Extended Tags
[    0.243458] pci 0000:04:00.6: PME# supported from D0 D3hot D3cold
[    0.243557] pci 0000:04:00.7: [1022:164a] type 00 class 0x118000 PCIe Endpoint
[    0.243581] pci 0000:04:00.7: BAR 2 [mem 0x80300000-0x803fffff]
[    0.243583] pci 0000:04:00.7: BAR 5 [mem 0x805cc000-0x805cdfff]
[    0.243587] pci 0000:04:00.7: enabling Extended Tags
[    0.243700] pci 0000:00:08.1: PCI bridge to [bus 04]
[    0.243731] pci 0000:05:00.0: [1022:1116] type 00 class 0x130000 PCIe Endpoint
[    0.243759] pci 0000:05:00.0: enabling Extended Tags
[    0.243868] pci 0000:05:00.1: [1022:17f0] type 00 class 0x118000 PCIe Endpoint
[    0.243894] pci 0000:05:00.1: BAR 0 [mem 0x80c00000-0x80cfffff]
[    0.243895] pci 0000:05:00.1: BAR 1 [mem 0x80d00000-0x80d01fff]
[    0.243897] pci 0000:05:00.1: BAR 2 [mem 0x8e0800000-0x8e087ffff 64bit pref]
[    0.243898] pci 0000:05:00.1: BAR 4 [mem 0x80d03000-0x80d03fff]
[    0.243899] pci 0000:05:00.1: BAR 5 [mem 0x80d02000-0x80d02fff]
[    0.243903] pci 0000:05:00.1: enabling Extended Tags
[    0.244007] pci 0000:00:08.2: PCI bridge to [bus 05]
[    0.244045] pci 0000:06:00.0: [1022:1118] type 00 class 0x0c0330 PCIe Endpoint
[    0.244067] pci 0000:06:00.0: BAR 0 [mem 0x80900000-0x809fffff 64bit]
[    0.244074] pci 0000:06:00.0: enabling Extended Tags
[    0.244117] pci 0000:06:00.0: PME# supported from D0 D3hot D3cold
[    0.244316] pci 0000:06:00.3: [1022:111c] type 00 class 0x0c0330 PCIe Endpoint
[    0.244338] pci 0000:06:00.3: BAR 0 [mem 0x80a00000-0x80afffff 64bit]
[    0.244345] pci 0000:06:00.3: enabling Extended Tags
[    0.244379] pci 0000:06:00.3: PME# supported from D0 D3hot D3cold
[    0.244554] pci 0000:06:00.4: [1022:111e] type 00 class 0x0c0330 PCIe Endpoint
[    0.244577] pci 0000:06:00.4: BAR 0 [mem 0x80b00000-0x80bfffff 64bit]
[    0.244583] pci 0000:06:00.4: enabling Extended Tags
[    0.244617] pci 0000:06:00.4: PME# supported from D0 D3hot D3cold
[    0.244802] pci 0000:00:08.3: PCI bridge to [bus 06]
[    0.248521] Low-power S0 idle used by default for system suspend
[    0.248796] ACPI: EC: interrupt unblocked
[    0.248796] ACPI: EC: event unblocked
[    0.248804] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.248804] ACPI: EC: GPE=0xb
[    0.248805] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization complete
[    0.248806] ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle transactions and events
[    0.249195] iommu: Default domain type: Translated
[    0.249195] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.249225] SCSI subsystem initialized
[    0.249227] libata version 3.00 loaded.
[    0.249227] ACPI: bus type USB registered
[    0.249227] usbcore: registered new interface driver usbfs
[    0.249227] usbcore: registered new interface driver hub
[    0.249227] usbcore: registered new device driver usb
[    0.251847] i2c_designware AMDI0010:03: [Firmware Bug]: DSDT uses known not-working I2C bus speed 400000, forcing it to 100000
[    0.252408] EDAC MC: Ver: 3.0.0
[    0.253270] efivars: Registered efivars operations
[    0.253270] NetLabel: Initializing
[    0.253270] NetLabel:  domain hash size = 128
[    0.253270] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.253270] NetLabel:  unlabeled traffic allowed by default
[    0.253270] mctp: management component transport protocol core
[    0.253270] NET: Registered PF_MCTP protocol family
[    0.253270] PCI: Using ACPI for IRQ routing
[    0.261021] PCI: pci_cache_line_size set to 64 bytes
[    0.261213] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.261214] e820: reserve RAM buffer [mem 0x09b00000-0x0bffffff]
[    0.261215] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    0.261215] e820: reserve RAM buffer [mem 0x578aa000-0x57ffffff]
[    0.261216] e820: reserve RAM buffer [mem 0x5a9f9000-0x5bffffff]
[    0.261216] e820: reserve RAM buffer [mem 0x69efe000-0x6bffffff]
[    0.261216] e820: reserve RAM buffer [mem 0x77574000-0x77ffffff]
[    0.261217] e820: reserve RAM buffer [mem 0x77ff7000-0x77ffffff]
[    0.261217] e820: reserve RAM buffer [mem 0x77fff000-0x77ffffff]
[    0.261217] e820: reserve RAM buffer [mem 0x85e280000-0x85fffffff]
[    0.261231] vgaarb: loaded
[    0.261231] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.261231] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.264168] clocksource: Switched to clocksource tsc-early
[    0.264178] VFS: Disk quotas dquot_6.6.0
[    0.264178] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.264338] pnp: PnP ACPI init
[    0.272642] system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
[    0.273072] system 00:02: [io  0x0400-0x04cf] has been reserved
[    0.273073] system 00:02: [io  0x04d0-0x04d1] has been reserved
[    0.273074] system 00:02: [io  0x04d6] has been reserved
[    0.273074] system 00:02: [io  0x0c00-0x0c01] has been reserved
[    0.273075] system 00:02: [io  0x0c14] has been reserved
[    0.273075] system 00:02: [io  0x0c50-0x0c52] has been reserved
[    0.273076] system 00:02: [io  0x0c6c] has been reserved
[    0.273076] system 00:02: [io  0x0c6f] has been reserved
[    0.273077] system 00:02: [io  0x0cd0-0x0cdb] has been reserved
[    0.273086] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
[    0.273500] pnp: PnP ACPI: found 5 devices
[    0.278842] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.278866] NET: Registered PF_INET protocol family
[    0.278939] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.286166] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.286189] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.286259] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.286395] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.286450] TCP: Hash tables configured (established 262144 bind 65536)
[    0.286507] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.286558] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.286616] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.286671] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.286676] NET: Registered PF_XDP protocol family
[    0.286683] pci 0000:00:02.2: bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
[    0.286686] pci 0000:00:02.2: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 02] add_size 200000 add_align 100000
[    0.286694] pci 0000:00:02.2: bridge window [mem 0x8a0200000-0x8a03fffff 64bit pref]: assigned
[    0.286695] pci 0000:00:02.2: bridge window [io  0x2000-0x2fff]: assigned
[    0.286697] pci 0000:00:02.1: PCI bridge to [bus 01]
[    0.286705] pci 0000:00:02.1:   bridge window [mem 0x80f00000-0x80ffffff]
[    0.286711] pci 0000:00:02.2: PCI bridge to [bus 02]
[    0.286712] pci 0000:00:02.2:   bridge window [io  0x2000-0x2fff]
[    0.286715] pci 0000:00:02.2:   bridge window [mem 0x80e00000-0x80efffff]
[    0.286717] pci 0000:00:02.2:   bridge window [mem 0x8a0200000-0x8a03fffff 64bit pref]
[    0.286720] pci 0000:00:02.3: PCI bridge to [bus 03]
[    0.286722] pci 0000:00:02.3:   bridge window [mem 0x80600000-0x808fffff]
[    0.286728] pci 0000:00:08.1: PCI bridge to [bus 04]
[    0.286734] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.286735] pci 0000:00:08.1:   bridge window [mem 0x80000000-0x805fffff]
[    0.286737] pci 0000:00:08.1:   bridge window [mem 0x8c0000000-0x8e07fffff 64bit pref]
[    0.286739] pci 0000:00:08.2: PCI bridge to [bus 05]
[    0.286741] pci 0000:00:08.2:   bridge window [mem 0x80c00000-0x80dfffff]
[    0.286742] pci 0000:00:08.2:   bridge window [mem 0x8e0800000-0x8e08fffff 64bit pref]
[    0.286745] pci 0000:00:08.3: PCI bridge to [bus 06]
[    0.286746] pci 0000:00:08.3:   bridge window [mem 0x80900000-0x80bfffff]
[    0.286750] pci_bus 0000:00: resource 4 [mem 0x80000000-0xdfffffff window]
[    0.286751] pci_bus 0000:00: resource 5 [mem 0xf0000000-0xfcffffff window]
[    0.286752] pci_bus 0000:00: resource 6 [mem 0x8a0200000-0x833fffffff window]
[    0.286752] pci_bus 0000:00: resource 7 [io  0x1000-0xffff window]
[    0.286752] pci_bus 0000:00: resource 8 [io  0x0000-0x0cf7 window]
[    0.286753] pci_bus 0000:00: resource 9 [io  0x0d00-0x0fff window]
[    0.286753] pci_bus 0000:00: resource 10 [mem 0xfec00000-0xfec01fff window]
[    0.286754] pci_bus 0000:00: resource 11 [mem 0xfed45000-0xfed811ff window]
[    0.286754] pci_bus 0000:00: resource 12 [mem 0xfed81900-0xfed81fff window]
[    0.286755] pci_bus 0000:00: resource 13 [mem 0xfedc0000-0xfedc0fff window]
[    0.286755] pci_bus 0000:00: resource 14 [mem 0xfedc6000-0xfedc6fff window]
[    0.286755] pci_bus 0000:00: resource 15 [mem 0xfee01000-0xffffffff window]
[    0.286756] pci_bus 0000:01: resource 1 [mem 0x80f00000-0x80ffffff]
[    0.286757] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    0.286757] pci_bus 0000:02: resource 1 [mem 0x80e00000-0x80efffff]
[    0.286758] pci_bus 0000:02: resource 2 [mem 0x8a0200000-0x8a03fffff 64bit pref]
[    0.286758] pci_bus 0000:03: resource 1 [mem 0x80600000-0x808fffff]
[    0.286759] pci_bus 0000:04: resource 0 [io  0x1000-0x1fff]
[    0.286759] pci_bus 0000:04: resource 1 [mem 0x80000000-0x805fffff]
[    0.286759] pci_bus 0000:04: resource 2 [mem 0x8c0000000-0x8e07fffff 64bit pref]
[    0.286760] pci_bus 0000:05: resource 1 [mem 0x80c00000-0x80dfffff]
[    0.286760] pci_bus 0000:05: resource 2 [mem 0x8e0800000-0x8e08fffff 64bit pref]
[    0.286761] pci_bus 0000:06: resource 1 [mem 0x80900000-0x80bfffff]
[    0.287370] pci 0000:04:00.1: D0 power state depends on 0000:04:00.0
[    0.287436] pci 0000:04:00.4: enabling device (0000 -> 0002)
[    0.287494] pci 0000:06:00.0: enabling device (0000 -> 0002)
[    0.287528] pci 0000:06:00.3: enabling device (0000 -> 0002)
[    0.287559] pci 0000:06:00.4: enabling device (0000 -> 0002)
[    0.287590] PCI: CLS 0 bytes, default 64
[    0.287620] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.287627] Trying to unpack rootfs image as initramfs...
[    0.287661] platform MSFT0201:00: Adding to iommu group 0
[    0.287759] pci 0000:00:01.0: Adding to iommu group 1
[    0.287771] pci 0000:00:02.0: Adding to iommu group 2
[    0.287779] pci 0000:00:02.1: Adding to iommu group 3
[    0.287786] pci 0000:00:02.2: Adding to iommu group 4
[    0.287792] pci 0000:00:02.3: Adding to iommu group 5
[    0.287800] pci 0000:00:03.0: Adding to iommu group 6
[    0.287816] pci 0000:00:08.0: Adding to iommu group 7
[    0.287823] pci 0000:00:08.1: Adding to iommu group 8
[    0.287829] pci 0000:00:08.2: Adding to iommu group 9
[    0.287836] pci 0000:00:08.3: Adding to iommu group 10
[    0.287847] pci 0000:00:14.0: Adding to iommu group 11
[    0.287853] pci 0000:00:14.3: Adding to iommu group 11
[    0.287879] pci 0000:00:18.0: Adding to iommu group 12
[    0.287885] pci 0000:00:18.1: Adding to iommu group 12
[    0.287891] pci 0000:00:18.2: Adding to iommu group 12
[    0.287896] pci 0000:00:18.3: Adding to iommu group 12
[    0.287903] pci 0000:00:18.4: Adding to iommu group 12
[    0.287909] pci 0000:00:18.5: Adding to iommu group 12
[    0.287915] pci 0000:00:18.6: Adding to iommu group 12
[    0.287920] pci 0000:00:18.7: Adding to iommu group 12
[    0.287932] pci 0000:01:00.0: Adding to iommu group 13
[    0.287939] pci 0000:02:00.0: Adding to iommu group 14
[    0.287946] pci 0000:03:00.0: Adding to iommu group 15
[    0.287976] pci 0000:04:00.0: Adding to iommu group 16
[    0.287983] pci 0000:04:00.1: Adding to iommu group 17
[    0.287991] pci 0000:04:00.2: Adding to iommu group 18
[    0.287999] pci 0000:04:00.4: Adding to iommu group 19
[    0.288006] pci 0000:04:00.5: Adding to iommu group 20
[    0.288013] pci 0000:04:00.6: Adding to iommu group 21
[    0.288020] pci 0000:04:00.7: Adding to iommu group 22
[    0.288028] pci 0000:05:00.0: Adding to iommu group 23
[    0.288037] pci 0000:05:00.1: Adding to iommu group 24
[    0.288046] pci 0000:06:00.0: Adding to iommu group 25
[    0.288053] pci 0000:06:00.3: Adding to iommu group 26
[    0.288060] pci 0000:06:00.4: Adding to iommu group 27
[    0.289857] AMD-Vi: Extended features (0x246577efa2254afa, 0x10): PPR NX GT [5] IA GA PC GA_vAPIC
[    0.289863] AMD-Vi: Interrupt remapping enabled
[    0.289954] AMD-Vi: Virtual APIC enabled
[    0.289989] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.290013] software IO TLB: mapped [mem 0x0000000053047000-0x0000000057047000] (64MB)
[    0.290037] LVT offset 0 assigned for vector 0x400
[    0.291539] perf: AMD IBS detected (0x00081bff)
[    0.291541] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
[    0.304398] Initialise system trusted keyrings
[    0.304408] Key type blacklist registered
[    0.304433] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.304545] fuse: init (API version 7.45)
[    0.304593] integrity: Platform Keyring initialized
[    0.304594] integrity: Machine keyring initialized
[    0.309241] xor: automatically using best checksumming function   avx       
[    0.309242] Key type asymmetric registered
[    0.309243] Asymmetric key parser 'x509' registered
[    0.309253] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.309279] io scheduler mq-deadline registered
[    0.309279] io scheduler kyber registered
[    0.309284] io scheduler bfq registered
[    0.310490] ledtrig-cpu: registered to indicate activity on CPUs
[    0.310624] pcieport 0000:00:02.1: PME: Signaling with IRQ 31
[    0.310769] pcieport 0000:00:02.2: PME: Signaling with IRQ 32
[    0.310780] pcieport 0000:00:02.2: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.310987] pcieport 0000:00:02.3: PME: Signaling with IRQ 33
[    0.311115] pcieport 0000:00:08.1: PME: Signaling with IRQ 34
[    0.311249] pcieport 0000:00:08.2: PME: Signaling with IRQ 35
[    0.311354] pcieport 0000:00:08.3: PME: Signaling with IRQ 36
[    0.313782] ACPI: AC: AC Adapter [ACAD] (off-line)
[    0.313807] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.313816] ACPI: button: Power Button [PWRB]
[    0.313833] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
[    0.313840] ACPI: button: Lid Switch [LID0]
[    0.313849] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
[    0.313855] ACPI: button: Sleep Button [SLPB]
[    0.314011] Monitor-Mwait will be used to enter C-1 state
[    0.315394] Estimated ratio of average max frequency by base frequency (times 1024): 1815
[    0.321549] thermal LNXTHERM:00: registered as thermal_zone0
[    0.321550] ACPI: thermal: Thermal Zone [TZ01] (37 C)
[    0.321698] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.322616] Non-volatile memory driver v1.3
[    0.322617] Linux agpgart interface v0.103
[    0.337976] Freeing initrd memory: 177852K
[    0.417509] ACPI: battery: Slot [BAT0] (battery present)
[    1.315602] tsc: Refined TSC clocksource calibration: 1996.277 MHz
[    1.315619] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x398ce337d3f, max_idle_ns: 881590769522 ns
[    1.315669] clocksource: Switched to clocksource tsc
[    1.886519] tpm_crb MSFT0101:00: Disabling hwrng
[    1.887086] ACPI: bus type drm_connector registered
[    1.889313] xhci_hcd 0000:04:00.4: xHCI Host Controller
[    1.889321] xhci_hcd 0000:04:00.4: new USB bus registered, assigned bus number 1
[    1.889772] xhci_hcd 0000:04:00.4: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.890097] xhci_hcd 0000:04:00.4: xHCI Host Controller
[    1.890100] xhci_hcd 0000:04:00.4: new USB bus registered, assigned bus number 2
[    1.890102] xhci_hcd 0000:04:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    1.890156] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.890158] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.890160] usb usb1: Product: xHCI Host Controller
[    1.890161] usb usb1: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.890162] usb usb1: SerialNumber: 0000:04:00.4
[    1.890280] hub 1-0:1.0: USB hub found
[    1.890304] hub 1-0:1.0: 1 port detected
[    1.890463] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.890482] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.890484] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.890486] usb usb2: Product: xHCI Host Controller
[    1.890488] usb usb2: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.890489] usb usb2: SerialNumber: 0000:04:00.4
[    1.890584] hub 2-0:1.0: USB hub found
[    1.890594] hub 2-0:1.0: 1 port detected
[    1.890768] xhci_hcd 0000:06:00.0: xHCI Host Controller
[    1.890772] xhci_hcd 0000:06:00.0: new USB bus registered, assigned bus number 3
[    1.891218] xhci_hcd 0000:06:00.0: hcc params 0x0128ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.891500] xhci_hcd 0000:06:00.0: xHCI Host Controller
[    1.891502] xhci_hcd 0000:06:00.0: new USB bus registered, assigned bus number 4
[    1.891503] xhci_hcd 0000:06:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    1.891529] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.891531] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.891532] usb usb3: Product: xHCI Host Controller
[    1.891533] usb usb3: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.891534] usb usb3: SerialNumber: 0000:06:00.0
[    1.891617] hub 3-0:1.0: USB hub found
[    1.891637] hub 3-0:1.0: 5 ports detected
[    1.892292] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.892308] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.892309] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.892310] usb usb4: Product: xHCI Host Controller
[    1.892311] usb usb4: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.892312] usb usb4: SerialNumber: 0000:06:00.0
[    1.892382] hub 4-0:1.0: USB hub found
[    1.892391] hub 4-0:1.0: 2 ports detected
[    1.892775] xhci_hcd 0000:06:00.3: xHCI Host Controller
[    1.892778] xhci_hcd 0000:06:00.3: new USB bus registered, assigned bus number 5
[    1.893144] xhci_hcd 0000:06:00.3: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.893525] xhci_hcd 0000:06:00.3: xHCI Host Controller
[    1.893527] xhci_hcd 0000:06:00.3: new USB bus registered, assigned bus number 6
[    1.893529] xhci_hcd 0000:06:00.3: Host supports USB 3.1 Enhanced SuperSpeed
[    1.893552] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.893554] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.893555] usb usb5: Product: xHCI Host Controller
[    1.893556] usb usb5: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.893556] usb usb5: SerialNumber: 0000:06:00.3
[    1.893626] hub 5-0:1.0: USB hub found
[    1.893643] hub 5-0:1.0: 1 port detected
[    1.893825] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.893840] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.893841] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.893842] usb usb6: Product: xHCI Host Controller
[    1.893843] usb usb6: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.893844] usb usb6: SerialNumber: 0000:06:00.3
[    1.893908] hub 6-0:1.0: USB hub found
[    1.893926] hub 6-0:1.0: 1 port detected
[    1.894290] xhci_hcd 0000:06:00.4: xHCI Host Controller
[    1.894293] xhci_hcd 0000:06:00.4: new USB bus registered, assigned bus number 7
[    1.894654] xhci_hcd 0000:06:00.4: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.895003] xhci_hcd 0000:06:00.4: xHCI Host Controller
[    1.895004] xhci_hcd 0000:06:00.4: new USB bus registered, assigned bus number 8
[    1.895006] xhci_hcd 0000:06:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    1.895029] usb usb7: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.895031] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.895032] usb usb7: Product: xHCI Host Controller
[    1.895033] usb usb7: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.895034] usb usb7: SerialNumber: 0000:06:00.4
[    1.895105] hub 7-0:1.0: USB hub found
[    1.895124] hub 7-0:1.0: 1 port detected
[    1.895294] usb usb8: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.895309] usb usb8: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.895310] usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.895311] usb usb8: Product: xHCI Host Controller
[    1.895312] usb usb8: Manufacturer: Linux 6.18.0-rc2 xhci-hcd
[    1.895313] usb usb8: SerialNumber: 0000:06:00.4
[    1.895381] hub 8-0:1.0: USB hub found
[    1.895397] hub 8-0:1.0: 1 port detected
[    1.895744] usbcore: registered new interface driver usbserial_generic
[    1.895750] usbserial: USB Serial support registered for generic
[    1.895781] i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0x64 irq 1
[    1.895783] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.896381] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.896668] rtc_cmos 00:01: RTC can wake from S4
[    1.896935] rtc_cmos 00:01: registered as rtc0
[    1.896987] rtc_cmos 00:01: setting system clock to 2025-10-20T11:50:38 UTC (1760961038)
[    1.897016] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram
[    1.897464] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    1.898599] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 planes with drm panic
[    1.898605] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 on minor 0
[    1.899412] fbcon: Deferring console take-over
[    1.899414] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
[    1.899448] hid: raw HID events driver (C) Jiri Kosina
[    1.899457] usbcore: registered new interface driver usbhid
[    1.899458] usbhid: USB HID core driver
[    1.899678] drop_monitor: Initializing network drop monitor service
[    1.899740] NET: Registered PF_INET6 protocol family
[    1.899935] Segment Routing with IPv6
[    1.899935] RPL Segment Routing with IPv6
[    1.899938] In-situ OAM (IOAM) with IPv6
[    1.899947] NET: Registered PF_PACKET protocol family
[    1.900917] x86/amd: Previous system reset reason [0x00080800]: software wrote 0x6 to reset control register 0xCF9
[    1.900924] microcode: Current revision: 0x0b60000e
[    1.901552] resctrl: L3 allocation detected
[    1.901553] resctrl: MB allocation detected
[    1.901553] resctrl: SMBA allocation detected
[    1.901554] resctrl: L3 monitoring detected
[    1.901569] IPI shorthand broadcast: enabled
[    1.902591] sched_clock: Marking stable (1901001039, 1365910)->(1902707735, -340786)
[    1.902724] registered taskstats version 1
[    1.903474] Loading compiled-in X.509 certificates
[    1.907838] Loaded X.509 cert 'Build time autogenerated kernel key: e38d82df6aa5f73c9cb88eb9d2562307c6f66d0a'
[    1.908929] Demotion targets for Node 0: null
[    1.908997] Key type .fscrypt registered
[    1.908998] Key type fscrypt-provisioning registered
[    1.909158] Btrfs loaded, zoned=yes, fsverity=yes
[    1.909181] Key type big_key registered
[    1.909273] integrity: Loading X.509 certificate: UEFI:db
[    1.909287] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.909288] integrity: Loading X.509 certificate: UEFI:db
[    1.909295] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.909295] integrity: Loading X.509 certificate: UEFI:db
[    1.909301] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.909301] integrity: Loading X.509 certificate: UEFI:db
[    1.909306] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    1.910635] PM:   Magic number: 13:481:833
[    1.910659] pcie_bwctrl 0000:00:02.1:pcie010: hash matches
[    1.911364] RAS: Correctable Errors collector initialized.
[    1.914468] clk: Disabling unused clocks
[    1.914471] PM: genpd: Disabling unused power domains
[    1.915264] Freeing unused decrypted memory: 2036K
[    1.915665] Freeing unused kernel image (initmem) memory: 4704K
[    1.915675] Write protecting the kernel read-only data: 38912k
[    1.915824] Freeing unused kernel image (text/rodata gap) memory: 276K
[    1.916002] Freeing unused kernel image (rodata/data gap) memory: 1480K
[    1.942031] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.942036] rodata_test: all tests were successful
[    1.942039] Run /init as init process
[    1.942040]   with arguments:
[    1.942041]     /init
[    1.942041]   with environment:
[    1.942042]     HOME=/
[    1.942042]     TERM=linux
[    1.956302] fbcon: Taking over console
[    1.957608] Console: switching to colour frame buffer device 240x75
[    2.089736] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
[    2.090677] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:16/LNXVIDEO:00/input/input4
[    2.117886] Key type psk registered
[    2.123287] rtsx_pci 0000:02:00.0: enabling device (0000 -> 0002)
[    2.131381] usb 3-5: new high-speed USB device number 2 using xhci_hcd
[    2.131402] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    2.134694] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    2.134784] nvme nvme0: pci function 0000:01:00.0
[    2.149382] nvme nvme0: D3 entry latency set to 10 seconds
[    2.159949] nvme nvme0: allocated 64 MiB host memory buffer (1 segment).
[    2.191232] nvme nvme0: 16/0/0 default/read/poll queues
[    2.198099]  nvme0n1: p1 p2
[    2.257953] usb 3-5: New USB device found, idVendor=0489, idProduct=e111, bcdDevice= 1.00
[    2.257966] usb 3-5: New USB device strings: Mfr=5, Product=6, SerialNumber=7
[    2.257968] usb 3-5: Product: Wireless_Device
[    2.257971] usb 3-5: Manufacturer: MediaTek Inc.
[    2.257972] usb 3-5: SerialNumber: 000000000
[    2.291493] usb 1-1: New USB device found, idVendor=04f2, idProduct=b83c, bcdDevice=80.04
[    2.291504] usb 1-1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    2.291507] usb 1-1: Product: Integrated Camera
[    2.291509] usb 1-1: Manufacturer: Chicony Electronics Co.,Ltd.
[    2.291511] usb 1-1: SerialNumber: 0001
[    2.344042] hid-generic 0003:04F2:B83C.0001: hiddev96,hidraw0: USB HID v1.11 Device [Chicony Electronics Co.,Ltd. Integrated Camera] on usb-0000:04:00.4-1/input4
[    2.352588] hid-sensor-hub 0003:04F2:B83C.0001: hiddev96,hidraw0: USB HID v1.11 Device [Chicony Electronics Co.,Ltd. Integrated Camera] on usb-0000:04:00.4-1/input4
[    4.055781] [drm] amdgpu kernel modesetting enabled.
[    4.057180] amdgpu: Virtual CRAT table created for CPU
[    4.057192] amdgpu: Topology: Add CPU node
[    4.057283] amdgpu 0000:04:00.0: enabling device (0006 -> 0007)
[    4.057328] amdgpu 0000:04:00.0: amdgpu: initializing kernel modesetting (IP DISCOVERY 0x1002:0x1114 0x17AA:0x3803 0xC2).
[    4.068812] amdgpu 0000:04:00.0: amdgpu: register mmio base: 0x80500000
[    4.068814] amdgpu 0000:04:00.0: amdgpu: register mmio size: 524288
[    4.071613] amdgpu 0000:04:00.0: amdgpu: detected ip block number 0 <common_v1_0_0> (soc21_common)
[    4.071615] amdgpu 0000:04:00.0: amdgpu: detected ip block number 1 <gmc_v11_0_0> (gmc_v11_0)
[    4.071616] amdgpu 0000:04:00.0: amdgpu: detected ip block number 2 <ih_v6_0_0> (ih_v6_1)
[    4.071618] amdgpu 0000:04:00.0: amdgpu: detected ip block number 3 <psp_v13_0_0> (psp)
[    4.071619] amdgpu 0000:04:00.0: amdgpu: detected ip block number 4 <smu_v14_0_0> (smu)
[    4.071620] amdgpu 0000:04:00.0: amdgpu: detected ip block number 5 <dce_v1_0_0> (dm)
[    4.071621] amdgpu 0000:04:00.0: amdgpu: detected ip block number 6 <gfx_v11_0_0> (gfx_v11_0)
[    4.071622] amdgpu 0000:04:00.0: amdgpu: detected ip block number 7 <sdma_v6_0_0> (sdma_v6_0)
[    4.071623] amdgpu 0000:04:00.0: amdgpu: detected ip block number 8 <vcn_v4_0_5> (vcn_v4_0_5)
[    4.071624] amdgpu 0000:04:00.0: amdgpu: detected ip block number 9 <jpeg_v4_0_5> (jpeg_v4_0_5)
[    4.071625] amdgpu 0000:04:00.0: amdgpu: detected ip block number 10 <mes_v11_0_0> (mes_v11_0)
[    4.071626] amdgpu 0000:04:00.0: amdgpu: detected ip block number 11 <vpe_v6_1_0> (vpe_v6_1)
[    4.071643] amdgpu 0000:04:00.0: amdgpu: Fetched VBIOS from VFCT
[    4.071645] amdgpu: ATOM BIOS: 113-STRIXEMU-001
[    4.074750] amdgpu 0000:04:00.0: amdgpu: VPE: collaborate mode false
[    4.090323] Console: switching to colour dummy device 80x25
[    4.095108] amdgpu 0000:04:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
[    4.095181] amdgpu 0000:04:00.0: amdgpu: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    4.095204] amdgpu 0000:04:00.0: amdgpu: VRAM: 512M 0x0000008000000000 - 0x000000801FFFFFFF (512M used)
[    4.095207] amdgpu 0000:04:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
[    4.095245] [drm] Detected VRAM RAM=512M, BAR=512M
[    4.095250] [drm] RAM width 128bits LPDDR5
[    4.096001] amdgpu 0000:04:00.0: amdgpu: amdgpu: 512M of VRAM memory ready
[    4.096002] amdgpu 0000:04:00.0: amdgpu: amdgpu: 15619M of GTT memory ready.
[    4.096019] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    4.096349] [drm] PCIE GART of 512M enabled (table at 0x0000008000900000).
[    4.096699] amdgpu 0000:04:00.0: amdgpu: [drm] Loading DMUB firmware via PSP: version=0x09002E00
[    4.096944] amdgpu 0000:04:00.0: amdgpu: [VCN instance 0] Found VCN firmware Version ENC: 1.24 DEC: 9 VEP: 0 Revision: 22
[    4.120089] amdgpu 0000:04:00.0: amdgpu: reserve 0x1100000 from 0x801c000000 for PSP TMR
[    4.266085] amdgpu 0000:04:00.0: amdgpu: RAS: optional ras ta ucode is not available
[    4.270371] amdgpu 0000:04:00.0: amdgpu: RAP: optional rap ta ucode is not available
[    4.270373] amdgpu 0000:04:00.0: amdgpu: SECUREDISPLAY: optional securedisplay ta ucode is not available
[    4.293514] amdgpu 0000:04:00.0: amdgpu: SMU is initialized successfully!
[    4.294907] amdgpu 0000:04:00.0: amdgpu: [drm] Display Core v3.2.351 initialized on DCN 3.5
[    4.294909] amdgpu 0000:04:00.0: amdgpu: [drm] DP-HDMI FRL PCON supported
[    4.296815] amdgpu 0000:04:00.0: amdgpu: [drm] DMUB hardware initialized: version=0x09002E00
[    4.395637] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 1, DC PSR ver 0, sink PSR ver 1 DPCD caps 0x76 su_y_granularity 4
[    4.395802] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.395929] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.396032] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.396135] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.396174] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.396208] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.396239] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.396273] amdgpu 0000:04:00.0: amdgpu: [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    4.402562] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    4.402571] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    4.402725] amdgpu: Virtual CRAT table created for GPU
[    4.402816] amdgpu: Topology: Add dGPU node [0x1114:0x1002]
[    4.402817] kfd kfd: amdgpu: added device 1002:1114
[    4.402826] amdgpu 0000:04:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 4, active_cu_number 8
[    4.402829] amdgpu 0000:04:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[    4.402830] amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[    4.402830] amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[    4.402831] amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[    4.402831] amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[    4.402832] amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[    4.402832] amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[    4.402832] amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[    4.402833] amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[    4.402833] amdgpu 0000:04:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[    4.402833] amdgpu 0000:04:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[    4.402834] amdgpu 0000:04:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng 1 on hub 8
[    4.402834] amdgpu 0000:04:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
[    4.402834] amdgpu 0000:04:00.0: amdgpu: ring vpe uses VM inv eng 4 on hub 8
[    4.408076] amdgpu 0000:04:00.0: amdgpu: Runtime PM not available
[    4.420526] amdgpu 0000:04:00.0: amdgpu: [drm] Using custom brightness curve
[    4.420836] amdgpu 0000:04:00.0: [drm] Registered 4 planes with drm panic
[    4.420837] [drm] Initialized amdgpu 3.64.0 for 0000:04:00.0 on minor 1
[    4.424536] fbcon: amdgpudrmfb (fb0) is primary device
[    4.424660] [drm] pre_validate_dsc:1667 MST_DSC dsc precompute is not needed
[    5.706221] Console: switching to colour frame buffer device 180x56
[    5.725855] amdgpu 0000:04:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    5.954514] EXT4-fs (nvme0n1p2): mounted filesystem c1006a57-6007-47c4-9de4-b407ada9faa3 r/w with ordered data mode. Quota mode: none.
[    6.037070] systemd[1]: systemd 258.1-1-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP -SYSVINIT +LIBARCHIVE)
[    6.037079] systemd[1]: Detected architecture x86-64.
[    6.038565] systemd[1]: Hostname set to <donald-laptop>.
[    6.103700] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    6.208974] zram: Added device: zram0
[    6.255297] systemd[1]: Queued start job for default target Graphical Interface.
[    6.274689] systemd[1]: Created slice CUPS Slice.
[    6.274907] systemd[1]: Created slice Slice /system/dirmngr.
[    6.275144] systemd[1]: Created slice Slice /system/getty.
[    6.275314] systemd[1]: Created slice Slice /system/gpg-agent.
[    6.275496] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    6.275632] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    6.275759] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    6.275889] systemd[1]: Created slice Slice /system/keyboxd.
[    6.276016] systemd[1]: Created slice Slice /system/modprobe.
[    6.276145] systemd[1]: Created slice Slice /system/systemd-zram-setup.
[    6.276260] systemd[1]: Created slice User and Session Slice.
[    6.276298] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    6.276454] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    6.276472] systemd[1]: Expecting device /dev/disk/by-uuid/9E47-AC50...
[    6.276504] systemd[1]: Expecting device /dev/zram0...
[    6.276518] systemd[1]: Reached target Login Prompts.
[    6.276545] systemd[1]: Reached target Image Downloads.
[    6.276561] systemd[1]: Reached target Local Integrity Protected Volumes.
[    6.276588] systemd[1]: Reached target Remote File Systems.
[    6.276602] systemd[1]: Reached target Slice Units.
[    6.276642] systemd[1]: Reached target Local Verity Protected Volumes.
[    6.276710] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    6.277165] systemd[1]: Listening on Query the User Interactively for a Password.
[    6.277683] systemd[1]: Listening on Process Core Dump Socket.
[    6.277974] systemd[1]: Listening on Credential Encryption/Decryption.
[    6.278358] systemd[1]: Listening on Factory Reset Management.
[    6.278411] systemd[1]: Listening on Journal Socket (/dev/log).
[    6.278456] systemd[1]: Listening on Journal Sockets.
[    6.278602] systemd[1]: TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.278609] systemd[1]: Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.278641] systemd[1]: Listening on udev Control Socket.
[    6.278660] systemd[1]: Listening on udev Kernel Socket.
[    6.278682] systemd[1]: Listening on udev Varlink Socket.
[    6.278716] systemd[1]: Listening on User Database Manager Socket.
[    6.279419] systemd[1]: Mounting Huge Pages File System...
[    6.279765] systemd[1]: Mounting POSIX Message Queue File System...
[    6.280074] systemd[1]: Mounting Kernel Debug File System...
[    6.281059] systemd[1]: Mounting Kernel Trace File System...
[    6.281813] systemd[1]: Starting Create List of Static Device Nodes...
[    6.281857] systemd[1]: Load Kernel Module configfs was skipped because of an unmet condition check (ConditionKernelModuleLoaded=!configfs).
[    6.282473] systemd[1]: Mounting Kernel Configuration File System...
[    6.283139] systemd[1]: Starting Load Kernel Module dm_mod...
[    6.283176] systemd[1]: Load Kernel Module drm was skipped because of an unmet condition check (ConditionKernelModuleLoaded=!drm).
[    6.283204] systemd[1]: Load Kernel Module fuse was skipped because of an unmet condition check (ConditionKernelModuleLoaded=!fuse).
[    6.283745] systemd[1]: Mounting FUSE Control File System...
[    6.284536] systemd[1]: Starting Load Kernel Module loop...
[    6.284629] systemd[1]: File System Check on Root Device was skipped because of an unmet condition check (ConditionPathIsReadWrite=!/).
[    6.284678] systemd[1]: Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    6.286464] systemd[1]: Starting Journal Service...
[    6.287558] systemd[1]: Starting Load Kernel Modules...
[    6.287591] systemd[1]: TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.288288] systemd[1]: Starting Remount Root and Kernel File Systems...
[    6.288373] systemd[1]: Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.289144] systemd[1]: Starting Load udev Rules from Credentials...
[    6.289622] systemd[1]: Starting Coldplug All udev Devices...
[    6.290085] systemd[1]: Starting Virtual Console Setup...
[    6.291385] systemd[1]: Mounted Huge Pages File System.
[    6.291477] systemd[1]: Mounted POSIX Message Queue File System.
[    6.292204] systemd[1]: Mounted Kernel Debug File System.
[    6.292319] systemd[1]: Mounted Kernel Trace File System.
[    6.292844] systemd[1]: Finished Create List of Static Device Nodes.
[    6.292995] systemd[1]: Mounted Kernel Configuration File System.
[    6.293738] systemd[1]: Mounted FUSE Control File System.
[    6.294376] systemd[1]: Starting Create Static Device Nodes in /dev gracefully...
[    6.294452] loop: module loaded
[    6.295178] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    6.295328] systemd[1]: Finished Load Kernel Module loop.
[    6.295967] systemd[1]: Finished Load udev Rules from Credentials.
[    6.300090] systemd-journald[424]: Collecting audit messages is disabled.
[    6.303235] systemd[1]: Finished Virtual Console Setup.
[    6.303975] i2c_dev: i2c /dev entries driver
[    6.305151] systemd[1]: Starting User Database Manager...
[    6.305509] EXT4-fs (nvme0n1p2): re-mounted c1006a57-6007-47c4-9de4-b407ada9faa3.
[    6.306248] device-mapper: uevent: version 1.0.3
[    6.306331] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
[    6.306480] systemd[1]: Finished Remount Root and Kernel File Systems.
[    6.306684] systemd[1]: modprobe@dm_mod.service: Deactivated successfully.
[    6.306791] systemd[1]: Finished Load Kernel Module dm_mod.
[    6.307353] systemd[1]: Rebuild Hardware Database was skipped because of an unmet condition check (ConditionNeedsUpdate=/etc).
[    6.308081] systemd[1]: Starting Load/Save OS Random Seed...
[    6.308130] systemd[1]: Repartition Root Disk was skipped because no trigger condition checks were met.
[    6.308149] systemd[1]: TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.308743] Asymmetric key parser 'pkcs8' registered
[    6.309320] systemd[1]: Finished Load Kernel Modules.
[    6.310044] systemd[1]: Starting Apply Kernel Variables...
[    6.316530] systemd[1]: Started User Database Manager.
[    6.316933] systemd[1]: Finished Load/Save OS Random Seed.
[    6.317841] systemd[1]: Finished Apply Kernel Variables.
[    6.324831] systemd[1]: Finished Create Static Device Nodes in /dev gracefully.
[    6.325025] systemd[1]: Create System Users was skipped because no trigger condition checks were met.
[    6.326288] systemd[1]: Starting Network Time Synchronization...
[    6.326666] systemd[1]: Starting Create Static Device Nodes in /dev...
[    6.328099] systemd[1]: Started Journal Service.
[    6.335385] systemd-journald[424]: Received client request to flush runtime journal.
[    6.430406] zram0: detected capacity change from 0 to 8388608
[    6.458490] Adding 4194300k swap on /dev/zram0.  Priority:100 extents:1 across:4194300k SSDsc
[    6.478907] pcie_mp2_amd 0000:04:00.7: enabling device (0000 -> 0002)
[    6.490587] ccp 0000:04:00.2: enabling device (0000 -> 0002)
[    6.491941] ccp 0000:04:00.2: tee enabled
[    6.491944] ccp 0000:04:00.2: psp enabled
[    6.503340] ACPI: bus type thunderbolt registered
[    6.520940] input: PC Speaker as /devices/platform/pcspkr/input/input5
[    6.522915] RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 163840 ms ovfl timer
[    6.522923] RAPL PMU: hw unit of domain package 2^-16 Joules
[    6.522925] RAPL PMU: hw unit of domain core 2^-16 Joules
[    6.524385] ACPI: battery: new hook: Ideapad Battery Extension
[    6.525183] input: Ideapad extra buttons as /devices/pci0000:00/0000:00:14.3/PNP0C09:00/VPC2004:00/input/input6
[    6.525674] amdxdna 0000:05:00.1: enabling device (0000 -> 0002)
[    6.600173] input: ELAN06FA:00 04F3:327E Mouse as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN06FA:00/0018:04F3:327E.0002/input/input7
[    6.600232] input: ELAN06FA:00 04F3:327E Touchpad as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN06FA:00/0018:04F3:327E.0002/input/input9
[    6.600293] hid-generic 0018:04F3:327E.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN06FA:00 04F3:327E] on i2c-ELAN06FA:00
[    6.604831] input: WACF2200:00 056A:53FD Touchscreen as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input10
[    6.604877] input: WACF2200:00 056A:53FD as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input11
[    6.604910] input: WACF2200:00 056A:53FD Stylus as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input12
[    6.604943] input: WACF2200:00 056A:53FD as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input13
[    6.604971] input: WACF2200:00 056A:53FD Mouse as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input14
[    6.605013] hid-generic 0018:056A:53FD.0003: input,hidraw2: I2C HID v1.00 Mouse [WACF2200:00 056A:53FD] on i2c-WACF2200:00
[    6.609548] input: Lenovo Yoga Tablet Mode Control switch as /devices/platform/PNP0C14:02/wmi_bus/wmi_bus-PNP0C14:02/06129D99-6083-4164-81AD-F092F9D773A6-7/input/input15
[    6.614361] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[    6.614375] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[    6.617197] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[    6.617850] i2c i2c-21: Successfully instantiated SPD at 0x50
[    6.618495] i2c i2c-21: Successfully instantiated SPD at 0x51
[    6.619057] i2c i2c-21: Successfully instantiated SPD at 0x52
[    6.619444] i2c i2c-21: Successfully instantiated SPD at 0x53
[    6.621342] mc: Linux media interface: v0.10
[    6.625143] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    6.625407] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    6.625504] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    6.628028] [drm] Initialized amdxdna_accel_driver 0.1.0 for 0000:05:00.1 on minor 0
[    6.649559] videodev: Linux video capture interface: v2.00
[    6.686837] snd_acp_pci 0000:04:00.5: enabling device (0000 -> 0002)
[    6.687231] Bluetooth: Core ver 2.22
[    6.687246] NET: Registered PF_BLUETOOTH protocol family
[    6.687247] Bluetooth: HCI device and connection manager initialized
[    6.687249] Bluetooth: HCI socket layer initialized
[    6.687251] Bluetooth: L2CAP socket layer initialized
[    6.687254] Bluetooth: SCO socket layer initialized
[    6.707773] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    6.709340] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    6.709492] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    6.737528] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
[    6.737557] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio client
[    6.737590] snd_hda_intel 0000:04:00.6: enabling device (0000 -> 0002)
[    6.739572] amd-pmf AMDI0107:00: No Smart PC policy present
[    6.739576] amd-pmf AMDI0107:00: registered PMF device successfully
[    6.739919] usbcore: registered new interface driver btusb
[    6.743000] Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20250825220109
[    6.744284] uvcvideo 1-1:1.0: Found UVC 1.50 device Integrated Camera (04f2:b83c)
[    6.745977] input: ELAN06FA:00 04F3:327E Mouse as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN06FA:00/0018:04F3:327E.0002/input/input16
[    6.749920] kvm_amd: TSC scaling supported
[    6.749923] kvm_amd: Nested Virtualization enabled
[    6.749924] kvm_amd: Nested Paging enabled
[    6.749925] kvm_amd: LBR virtualization supported
[    6.749931] kvm_amd: AVIC enabled
[    6.749932] kvm_amd: x2AVIC enabled
[    6.749932] kvm_amd: Virtual VMLOAD VMSAVE supported
[    6.749932] kvm_amd: Virtual GIF supported
[    6.749933] kvm_amd: Virtual NMI enabled
[    6.753546] snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[    6.754550] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input19
[    6.765499] input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input20
[    6.765503] input: ELAN06FA:00 04F3:327E Touchpad as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN06FA:00/0018:04F3:327E.0002/input/input18
[    6.771732] snd_hda_codec_alc269 hdaudioC1D0: ALC287: picked fixup alc287-yoga9-bass-spk-pin (model specified)
[    6.772127] snd_hda_codec_alc269 hdaudioC1D0: autoconfig for ALC287: line_outs=2 (0x14/0x17/0x0/0x0/0x0) type:speaker
[    6.772129] snd_hda_codec_alc269 hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    6.772130] snd_hda_codec_alc269 hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    6.772130] snd_hda_codec_alc269 hdaudioC1D0:    mono: mono_out=0x0
[    6.772131] snd_hda_codec_alc269 hdaudioC1D0:    inputs:
[    6.772132] snd_hda_codec_alc269 hdaudioC1D0:      Mic=0x19
[    6.812543] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:04:00.6/sound/card1/input21
[    6.817532] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:04:00.6/sound/card1/input22
[    6.817551] hid-multitouch 0018:04F3:327E.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN06FA:00 04F3:327E] on i2c-ELAN06FA:00
[    6.817920] wacom 0018:056A:53FD.0003: hidraw2: I2C HID v1.00 Mouse [WACF2200:00 056A:53FD] on i2c-WACF2200:00
[    6.817951] input: Wacom HID 53FD Pen as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input23
[    6.817993] input: Wacom HID 53FD Finger as /devices/platform/AMDI0010:02/i2c-0/i2c-WACF2200:00/0018:056A:53FD.0003/input/input24
[    6.820902] uvcvideo 1-1:1.2: Found UVC 1.50 device Integrated Camera (04f2:b83c)
[    6.828538] usbcore: registered new interface driver uvcvideo
[    6.842061] mousedev: PS/2 mouse device common for all mice
[    6.847611] intel_rapl_common: Found RAPL domain package
[    6.847617] intel_rapl_common: Found RAPL domain core
[    6.848891] amd_atl: AMD Address Translation Library initialized
[    6.896067] mt7925e 0000:03:00.0: enabling device (0000 -> 0002)
[    6.900423] mt7925e 0000:03:00.0: ASIC revision: 79250000
[    6.976252] mt7925e 0000:03:00.0: HW/SW Version: 0x8a108a10, Build Time: 20250825215832a

[    7.040406] Bluetooth: hci0: Device setup in 293372 usecs
[    7.040417] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
[    7.137833] Bluetooth: hci0: AOSP extensions version v1.00
[    7.137847] Bluetooth: hci0: AOSP quality report is supported
[    7.321586] mt7925e 0000:03:00.0: WM Firmware Version: ____000000, Build Time: 20250825215925
[    7.336516] FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[    7.473408] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    7.473411] Bluetooth: BNEP filters: protocol multicast
[    7.473415] Bluetooth: BNEP socket layer initialized
[    7.474166] Bluetooth: MGMT ver 1.23
[    7.479346] NET: Registered PF_ALG protocol family
[   10.848535] wlan0: authenticate with 00:eb:d8:f4:43:d3 (local address=f4:4e:b4:ab:0b:79)
[   11.210813] wlan0: send auth to 00:eb:d8:f4:43:d3 (try 1/3)
[   11.216369] wlan0: authenticated
[   11.221420] wlan0: associate with 00:eb:d8:f4:43:d3 (try 1/3)
[   11.250660] wlan0: RX AssocResp from 00:eb:d8:f4:43:d3 (capab=0x1511 status=0 aid=3)
[   11.293533] wlan0: associated
[   11.652387] wlan0: Limiting TX power to 20 (23 - 3) dBm as advertised by 00:eb:d8:f4:43:d3
[   19.427116] rfkill: input handler disabled
[   19.686095] Bluetooth: RFCOMM TTY layer initialized
[   19.686107] Bluetooth: RFCOMM socket layer initialized
[   19.686109] Bluetooth: RFCOMM ver 1.11
[   24.714572] rfkill: input handler enabled


