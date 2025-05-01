Return-Path: <linux-input+bounces-12094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF51AA5BB9
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 09:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9984C4191
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 07:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5953B270EA2;
	Thu,  1 May 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hboeck.de header.i=@hboeck.de header.b="AGMR+XP5"
X-Original-To: linux-input@vger.kernel.org
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB90B26461E;
	Thu,  1 May 2025 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.68.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086162; cv=none; b=fm3OK6Aa1YRVo349QVIJ9YFwewLvOrur56hf0D85NwDP4AEuc8fDUxJFcXldp9ba8HcukIufaD3qv21q1FbuvQZmpC7hhng2oXslP4fmrn9drN3VlIrjph9qQGj7JxnhDjZvvrBM8NFpHeqCJzeRXWdCDsA558DzsDF7ENrQ2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086162; c=relaxed/simple;
	bh=3JpI2h+JaXBJqcBXdP/ulKk63LrZlOc9+jxsluPLie0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type; b=t7bsHOsQSkcMFHzMB4quYoYEnPCmc4qHICECzKp/4sSHj0xL/YdFd6chMCPIWWJ2yQtBThZBirneCvA8Hw9JLm/XZG3a8tvEBEtpni0ys3CnRRcrt+6vLRHGnnpJasWJw5uSb0uNan+LKgeDQqEe0IpsZhCSGEWLs2f5ZWIds0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hboeck.de; spf=pass smtp.mailfrom=hboeck.de; dkim=pass (2048-bit key) header.d=hboeck.de header.i=@hboeck.de header.b=AGMR+XP5; arc=none smtp.client-ip=178.63.68.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hboeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hboeck.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hboeck.de; s=key1;
	t=1746085851; bh=r790qTIxW6Vi4FwA4eCDF57v2tQ+E+jwFHfnSKDI3Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type;
	b=AGMR+XP5TUYaVyaeQ3jg42f9m57ZbBR1B8NGhb/IJMTdgDLRX/ClExB727JmWUjbZ
	 wYyMMRx8isrsQ1/ftAduqUsDQDeg+lCLLoAhJG1kxAiFaFs2lIcDPePoYX1HRfcS6O
	 //iiT4AX+dG5PGeQxbJHGGBflWTU7Qlrny/9GNR2ByLvXab/xjfQdfZJhYVerUdpj/
	 F/OC6GEFitYFEsr2KRhwXPleTbkpVAg5fhzUSLBXQUx+Cg2xSy4UcyN59dhuZaLKdg
	 1wEFDa1xulRI5SyOD6ZOAH4El5yt1C5M4fFDBeJe1nXG9CJvOnIiSfxQ5VkNsW2s6s
	 0NdSQI3ZyGUtw==
Original-Subject: Re: linux/rmi4 driver: "BUG: kernel NULL pointer dereference" when
 accessing update_fw_status or bootloader_id
Author: Hanno =?UTF-8?B?QsO2Y2s=?= <hanno@hboeck.de>
Original-Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz
Date: Thu, 1 May 2025 09:50:49 +0200
From: Hanno =?UTF-8?B?QsO2Y2s=?= <hanno@hboeck.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
  david@ixit.cz
Subject: Re: linux/rmi4 driver: "BUG: kernel NULL pointer dereference" when
 accessing update_fw_status or bootloader_id
Message-ID: <20250501095049.156c5d8d@hboeck.de>
In-Reply-To: <u7x6ckgtetuvgxaalqcxwsv25xvvcjdcehpsysbvxjqygzjokz@bwogeb2ne2cw>
References: <20250430213816.7527e190@hboeck.de>
	<u7x6ckgtetuvgxaalqcxwsv25xvvcjdcehpsysbvxjqygzjokz@bwogeb2ne2cw>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_zucker.schokokeks.org-3262-1746085851-0001-2"

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_zucker.schokokeks.org-3262-1746085851-0001-2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, 30 Apr 2025 20:03:11 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Do you have anything earlier in your dmesg referencing "F34" by
> chance?

Probably this?

[    3.297406] hub 2-1.2:1.0: 4 ports detected
[    3.324410] rmi4_f34 rmi4-00.fn34: rmi_f34v7_probe: Unrecognized bootloa=
der v) 16 (\x10)(
[    3.326641] rmi4_f34 rmi4-00.fn34: probe with driver rmi4_f34 failed wit=
h error -22
[    3.350673] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
Synaptics, product: TM3288-011, fw id: 2812761

I'm attaching the full dmesg output.

--=20
Hanno B=C3=B6ck
https://hboeck.de/

--=_zucker.schokokeks.org-3262-1746085851-0001-2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg-bootloader_id.txt

[    0.000000] Linux version 6.14.4 (hanno@computer) (gcc (Gentoo 14.2.1_p20250301 p8) 14.2.1 20250301, GNU ld (Gentoo 2.44 p1) 2.44.0) #2 SMP Wed Apr 30 16:00:36 CEST 2025
[    0.000000] Command line: BOOT_IMAGE=/bzImage root=/dev/nvme0n1p3 rootfstype=ext4 net.ifnames=0 mitigations=off usb-storage.quirks=0bda:0328:i i915.enable_psr=0 ia32_emulation=true thinkpad_acpi.fan_control=1
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000008bfff] usable
[    0.000000] BIOS-e820: [mem 0x000000000008c000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040000000-0x00000000403fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000040400000-0x000000004f20ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000004f210000-0x000000004f211fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000004f212000-0x000000004ff0bfff] usable
[    0.000000] BIOS-e820: [mem 0x000000004ff0c000-0x000000004ff0cfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000004ff0d000-0x0000000094f51fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000094f52000-0x0000000094f52fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000094f53000-0x0000000094f53fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000094f54000-0x000000009e8b8fff] usable
[    0.000000] BIOS-e820: [mem 0x000000009e8b9000-0x000000009ff1bfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000009ff1c000-0x000000009ff99fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000009ff9a000-0x000000009fffefff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000009ffff000-0x000000009fffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000a0000000-0x00000000a7ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000a8600000-0x00000000ac7fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000004527fffff] usable
[    0.000000] Kernel compiled without mitigations, ignoring 'mitigations'; system may still be vulnerable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x91ad2018-0x91ae2057] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x0000000000057fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000058000-0x0000000000058fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000059000-0x000000000008bfff] usable
[    0.000000] reserve setup_data: [mem 0x000000000008c000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000003fffffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000040000000-0x00000000403fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000040400000-0x000000004f20ffff] usable
[    0.000000] reserve setup_data: [mem 0x000000004f210000-0x000000004f211fff] reserved
[    0.000000] reserve setup_data: [mem 0x000000004f212000-0x000000004ff0bfff] usable
[    0.000000] reserve setup_data: [mem 0x000000004ff0c000-0x000000004ff0cfff] reserved
[    0.000000] reserve setup_data: [mem 0x000000004ff0d000-0x0000000091ad2017] usable
[    0.000000] reserve setup_data: [mem 0x0000000091ad2018-0x0000000091ae2057] usable
[    0.000000] reserve setup_data: [mem 0x0000000091ae2058-0x0000000094f51fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000094f52000-0x0000000094f52fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000094f53000-0x0000000094f53fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000094f54000-0x000000009e8b8fff] usable
[    0.000000] reserve setup_data: [mem 0x000000009e8b9000-0x000000009ff1bfff] reserved
[    0.000000] reserve setup_data: [mem 0x000000009ff1c000-0x000000009ff99fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000009ff9a000-0x000000009fffefff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000009ffff000-0x000000009fffffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000a0000000-0x00000000a7ffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000a8600000-0x00000000ac7fffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fe010000-0x00000000fe010fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x00000004527fffff] usable
[    0.000000] efi: EFI v2.5 by Lenovo
[    0.000000] efi: TPMFinalLog=0x9ff92000 SMBIOS=0x9f01d000 SMBIOS 3.0=0x9f01a000 ACPI=0x9fffe000 ACPI 2.0=0x9fffe014 ESRT=0x9ea78000 MEMATTR=0x99947018 RNG=0x9ffa8018 TPMEventLog=0x9ffa2018 
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem67: MMIO range=[0xf0000000-0xf7ffffff] (128MB) from e820 map
[    0.000000] e820: remove [mem 0xf0000000-0xf7ffffff] reserved
[    0.000000] efi: Not removing mem68: MMIO range=[0xfe010000-0xfe010fff] (4KB) from e820 map
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: LENOVO 20KHCTO1WW/20KHCTO1WW, BIOS N23ET90W (1.65 ) 11/07/2024
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] tsc: Detected 2000.000 MHz processor
[    0.000000] tsc: Detected 1999.968 MHz TSC
[    0.000688] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000692] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000704] last_pfn = 0x452800 max_arch_pfn = 0x400000000
[    0.000709] MTRR map: 5 entries (3 fixed + 2 variable; max 23), built from 10 variable MTRRs
[    0.000712] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.001194] last_pfn = 0xa0000 max_arch_pfn = 0x400000000
[    0.012148] esrt: Reserving ESRT space from 0x000000009ea78000 to 0x000000009ea780b0.
[    0.012161] Using GB pages for direct mapping
[    0.013697] Secure boot disabled
[    0.013701] ACPI: Early table checksum verification disabled
[    0.013704] ACPI: RSDP 0x000000009FFFE014 000024 (v02 LENOVO)
[    0.013709] ACPI: XSDT 0x000000009FFB2188 000124 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013716] ACPI: FACP 0x000000009FFEB000 0000F4 (v05 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013723] ACPI: DSDT 0x000000009FFC0000 026DC4 (v02 LENOVO SKL      00000000 INTL 20160527)
[    0.013727] ACPI: FACS 0x000000009FF3E000 000040
[    0.013730] ACPI: SSDT 0x000000009FFF3000 0099B2 (v02 LENOVO DptfTabl 00001000 INTL 20160527)
[    0.013734] ACPI: SSDT 0x000000009FFF2000 0003DB (v02 LENOVO Tpm2Tabl 00001000 INTL 20160527)
[    0.013737] ACPI: TPM2 0x000000009FFF1000 000034 (v03 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013740] ACPI: UEFI 0x000000009FF53000 000042 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013743] ACPI: SSDT 0x000000009FFED000 0030E4 (v02 LENOVO SaSsdt   00003000 INTL 20160527)
[    0.013747] ACPI: SSDT 0x000000009FFEC000 0005C6 (v02 LENOVO PerfTune 00001000 INTL 20160527)
[    0.013750] ACPI: HPET 0x000000009FFEA000 000038 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013754] ACPI: APIC 0x000000009FFE9000 00012C (v03 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013757] ACPI: MCFG 0x000000009FFE8000 00003C (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013760] ACPI: ECDT 0x000000009FFE7000 000053 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013763] ACPI: SSDT 0x000000009FFBE000 001D1D (v02 LENOVO RVP7Rtd3 00001000 INTL 20160527)
[    0.013767] ACPI: SSDT 0x000000009FFBC000 0017D7 (v02 LENOVO ProjSsdt 00000010 INTL 20160527)
[    0.013770] ACPI: BOOT 0x000000009FFBB000 000028 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013773] ACPI: BATB 0x000000009FFBA000 00004A (v02 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013777] ACPI: SLIC 0x000000009FFB9000 000176 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013780] ACPI: SSDT 0x000000009FFB7000 0017AE (v02 LENOVO CpuSsdt  00003000 INTL 20160527)
[    0.013783] ACPI: SSDT 0x000000009FFB6000 00056D (v02 LENOVO CtdpB    00001000 INTL 20160527)
[    0.013787] ACPI: SSDT 0x000000009FFB5000 0006BF (v02 LENOVO UsbCTabl 00001000 INTL 20160527)
[    0.013790] ACPI: LPIT 0x000000009FFB4000 000094 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013793] ACPI: WSMT 0x000000009FFB3000 000028 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013797] ACPI: SSDT 0x000000009FFFD000 0001D8 (v02 LENOVO HdaDsp   00000000 INTL 20160527)
[    0.013800] ACPI: SSDT 0x000000009FFB1000 000590 (v02 LENOVO TbtTypeC 00000000 INTL 20160527)
[    0.013803] ACPI: SSDT 0x000000009FFB0000 0002D1 (v02 LENOVO Wwan     00000001 INTL 20160527)
[    0.013807] ACPI: DBGP 0x000000009FFAF000 000034 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013810] ACPI: DBG2 0x000000009FFAE000 000054 (v00 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013813] ACPI: MSDM 0x000000009FFAD000 000055 (v03 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013816] ACPI: DMAR 0x000000009FFAC000 0000A8 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013820] ACPI: NHLT 0x000000009FFAB000 00002D (v00 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013823] ACPI: ASF! 0x000000009FFAA000 0000A0 (v32 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013826] ACPI: FPDT 0x000000009FFA9000 000044 (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013830] ACPI: UEFI 0x000000009FF2C000 00013E (v01 LENOVO TP-N23   00001650 PTEC 00000002)
[    0.013832] ACPI: Reserving FACP table memory at [mem 0x9ffeb000-0x9ffeb0f3]
[    0.013835] ACPI: Reserving DSDT table memory at [mem 0x9ffc0000-0x9ffe6dc3]
[    0.013836] ACPI: Reserving FACS table memory at [mem 0x9ff3e000-0x9ff3e03f]
[    0.013837] ACPI: Reserving SSDT table memory at [mem 0x9fff3000-0x9fffc9b1]
[    0.013838] ACPI: Reserving SSDT table memory at [mem 0x9fff2000-0x9fff23da]
[    0.013839] ACPI: Reserving TPM2 table memory at [mem 0x9fff1000-0x9fff1033]
[    0.013840] ACPI: Reserving UEFI table memory at [mem 0x9ff53000-0x9ff53041]
[    0.013841] ACPI: Reserving SSDT table memory at [mem 0x9ffed000-0x9fff00e3]
[    0.013842] ACPI: Reserving SSDT table memory at [mem 0x9ffec000-0x9ffec5c5]
[    0.013843] ACPI: Reserving HPET table memory at [mem 0x9ffea000-0x9ffea037]
[    0.013844] ACPI: Reserving APIC table memory at [mem 0x9ffe9000-0x9ffe912b]
[    0.013845] ACPI: Reserving MCFG table memory at [mem 0x9ffe8000-0x9ffe803b]
[    0.013846] ACPI: Reserving ECDT table memory at [mem 0x9ffe7000-0x9ffe7052]
[    0.013847] ACPI: Reserving SSDT table memory at [mem 0x9ffbe000-0x9ffbfd1c]
[    0.013848] ACPI: Reserving SSDT table memory at [mem 0x9ffbc000-0x9ffbd7d6]
[    0.013849] ACPI: Reserving BOOT table memory at [mem 0x9ffbb000-0x9ffbb027]
[    0.013850] ACPI: Reserving BATB table memory at [mem 0x9ffba000-0x9ffba049]
[    0.013851] ACPI: Reserving SLIC table memory at [mem 0x9ffb9000-0x9ffb9175]
[    0.013852] ACPI: Reserving SSDT table memory at [mem 0x9ffb7000-0x9ffb87ad]
[    0.013853] ACPI: Reserving SSDT table memory at [mem 0x9ffb6000-0x9ffb656c]
[    0.013854] ACPI: Reserving SSDT table memory at [mem 0x9ffb5000-0x9ffb56be]
[    0.013855] ACPI: Reserving LPIT table memory at [mem 0x9ffb4000-0x9ffb4093]
[    0.013856] ACPI: Reserving WSMT table memory at [mem 0x9ffb3000-0x9ffb3027]
[    0.013857] ACPI: Reserving SSDT table memory at [mem 0x9fffd000-0x9fffd1d7]
[    0.013859] ACPI: Reserving SSDT table memory at [mem 0x9ffb1000-0x9ffb158f]
[    0.013860] ACPI: Reserving SSDT table memory at [mem 0x9ffb0000-0x9ffb02d0]
[    0.013861] ACPI: Reserving DBGP table memory at [mem 0x9ffaf000-0x9ffaf033]
[    0.013862] ACPI: Reserving DBG2 table memory at [mem 0x9ffae000-0x9ffae053]
[    0.013863] ACPI: Reserving MSDM table memory at [mem 0x9ffad000-0x9ffad054]
[    0.013864] ACPI: Reserving DMAR table memory at [mem 0x9ffac000-0x9ffac0a7]
[    0.013865] ACPI: Reserving NHLT table memory at [mem 0x9ffab000-0x9ffab02c]
[    0.013866] ACPI: Reserving ASF! table memory at [mem 0x9ffaa000-0x9ffaa09f]
[    0.013867] ACPI: Reserving FPDT table memory at [mem 0x9ffa9000-0x9ffa9043]
[    0.013868] ACPI: Reserving UEFI table memory at [mem 0x9ff2c000-0x9ff2c13d]
[    0.013892] No NUMA configuration found
[    0.013893] Faking a node at [mem 0x0000000000000000-0x00000004527fffff]
[    0.013899] NODE_DATA(0) allocated [mem 0x4527fc2c0-0x4527fffff]
[    0.013930] Zone ranges:
[    0.013931]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.013934]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.013936]   Normal   [mem 0x0000000100000000-0x00000004527fffff]
[    0.013938] Movable zone start for each node
[    0.013939] Early memory node ranges
[    0.013939]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.013941]   node   0: [mem 0x0000000000059000-0x000000000008bfff]
[    0.013942]   node   0: [mem 0x0000000000100000-0x000000003fffffff]
[    0.013944]   node   0: [mem 0x0000000040400000-0x000000004f20ffff]
[    0.013945]   node   0: [mem 0x000000004f212000-0x000000004ff0bfff]
[    0.013946]   node   0: [mem 0x000000004ff0d000-0x0000000094f51fff]
[    0.013947]   node   0: [mem 0x0000000094f54000-0x000000009e8b8fff]
[    0.013948]   node   0: [mem 0x000000009ffff000-0x000000009fffffff]
[    0.013949]   node   0: [mem 0x0000000100000000-0x00000004527fffff]
[    0.013951] Initmem setup node 0 [mem 0x0000000000001000-0x00000004527fffff]
[    0.013962] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.013964] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.014003] On node 0, zone DMA: 116 pages in unavailable ranges
[    0.017601] On node 0, zone DMA32: 1024 pages in unavailable ranges
[    0.017640] On node 0, zone DMA32: 2 pages in unavailable ranges
[    0.020852] On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.021279] On node 0, zone DMA32: 2 pages in unavailable ranges
[    0.021381] On node 0, zone DMA32: 5958 pages in unavailable ranges
[    0.061208] On node 0, zone Normal: 22528 pages in unavailable ranges
[    0.061219] Reserving Intel graphics memory at [mem 0xaa800000-0xac7fffff]
[    0.061948] ACPI: PM-Timer IO Port: 0x1808
[    0.061957] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.061960] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.061961] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.061962] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.061963] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.061964] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.061964] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.061965] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.061966] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.061967] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.061968] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.061969] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.061970] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.061970] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.061971] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.061972] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.061999] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.062003] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.062005] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.062011] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.062013] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.062016] TSC deadline timer available
[    0.062023] CPU topo: Max. logical packages:   1
[    0.062024] CPU topo: Max. logical dies:       1
[    0.062024] CPU topo: Max. dies per package:   1
[    0.062030] CPU topo: Max. threads per core:   2
[    0.062031] CPU topo: Num. cores per package:     4
[    0.062032] CPU topo: Num. threads per package:   8
[    0.062033] CPU topo: Allowing 8 present CPUs plus 0 hotplug CPUs
[    0.062061] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.062064] PM: hibernation: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.062067] PM: hibernation: Registered nosave memory: [mem 0x0008c000-0x000fffff]
[    0.062069] PM: hibernation: Registered nosave memory: [mem 0x40000000-0x403fffff]
[    0.062072] PM: hibernation: Registered nosave memory: [mem 0x4f210000-0x4f211fff]
[    0.062074] PM: hibernation: Registered nosave memory: [mem 0x4ff0c000-0x4ff0cfff]
[    0.062076] PM: hibernation: Registered nosave memory: [mem 0x94f52000-0x94f53fff]
[    0.062078] PM: hibernation: Registered nosave memory: [mem 0x9e8b9000-0x9fffefff]
[    0.062081] PM: hibernation: Registered nosave memory: [mem 0xa0000000-0xffffffff]
[    0.062082] [mem 0xac800000-0xfe00ffff] available for PCI devices
[    0.062086] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.062096] setup_percpu: NR_CPUS:64 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.062553] percpu: Embedded 48 pages/cpu s157528 r8192 d30888 u262144
[    0.062563] pcpu-alloc: s157528 r8192 d30888 u262144 alloc=1*2097152
[    0.062566] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.062591] Kernel command line: BOOT_IMAGE=/bzImage root=/dev/nvme0n1p3 rootfstype=ext4 net.ifnames=0 mitigations=off usb-storage.quirks=0bda:0328:i i915.enable_psr=0 ia32_emulation=true thinkpad_acpi.fan_control=1
[    0.062654] Setting dangerous option i915.enable_psr - tainting kernel
[    0.062675] Unknown kernel command line parameters "BOOT_IMAGE=/bzImage", will be passed to user space.
[    0.062722] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.065248] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.066553] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.066674] Fallback order for Node 0: 0 
[    0.066677] Built 1 zonelists, mobility grouping on.  Total pages: 4131903
[    0.066679] Policy zone: Normal
[    0.067057] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.067066] software IO TLB: area num 8.
[    0.137261] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.137392] rcu: Hierarchical RCU implementation.
[    0.137393] rcu: 	RCU event tracing is enabled.
[    0.137393] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=8.
[    0.137395] 	Tracing variant of Tasks RCU enabled.
[    0.137396] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.137397] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.137407] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.137415] NR_IRQS: 4352, nr_irqs: 2048, preallocated irqs: 16
[    0.137658] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.137935] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.137977] Console: colour dummy device 80x25
[    0.137981] printk: legacy console [tty0] enabled
[    0.138436] ACPI: Core revision 20240827
[    0.138816] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.138853] APIC: Switch to symmetric I/O mode setup
[    0.142715] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x39a8208cdd2, max_idle_ns: 881590748921 ns
[    0.142726] Calibrating delay loop (skipped), value calculated using timer frequency.. 3999.93 BogoMIPS (lpj=1999968)
[    0.142777] CPU0: Thermal monitoring enabled (TM1)
[    0.142852] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.142856] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
[    0.142864] process: using mwait in idle threads
[    0.142871] Spectre V2 : User space: Vulnerable
[    0.142874] Speculative Store Bypass: Vulnerable
[    0.142881] SRBDS: Vulnerable
[    0.142891] GDS: Vulnerable
[    0.142899] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.142903] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.142906] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.142909] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.142912] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.142915] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.142919] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.142922] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.142925] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.143723] Freeing SMP alternatives memory: 60K
[    0.143723] pid_max: default: 32768 minimum: 301
[    0.143723] LSM: initializing lsm=capability
[    0.143723] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.143723] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.143723] smpboot: CPU0: Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[    0.143723] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.143723] ... version:                4
[    0.143723] ... bit width:              48
[    0.143723] ... generic registers:      4
[    0.143723] ... value mask:             0000ffffffffffff
[    0.143723] ... max period:             00007fffffffffff
[    0.143723] ... fixed-purpose events:   3
[    0.143723] ... event mask:             000000070000000f
[    0.143723] signal: max sigframe size: 2032
[    0.143723] Estimated ratio of average max frequency by base frequency (times 1024): 1894
[    0.143723] rcu: Hierarchical SRCU implementation.
[    0.143723] rcu: 	Max phase no-delay instances is 400.
[    0.143723] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.143723] smp: Bringing up secondary CPUs ...
[    0.143723] smpboot: x86: Booting SMP configuration:
[    0.143723] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.151748] smp: Brought up 1 node, 8 CPUs
[    0.151757] smpboot: Total of 8 processors activated (31999.48 BogoMIPS)
[    0.152806] Memory: 16136180K/16527612K available (19143K kernel code, 1716K rwdata, 5428K rodata, 1292K init, 860K bss, 386316K reserved, 0K cma-reserved)
[    0.153381] devtmpfs: initialized
[    0.154020] ACPI: PM: Registering ACPI NVS region [mem 0x94f52000-0x94f52fff] (4096 bytes)
[    0.154020] ACPI: PM: Registering ACPI NVS region [mem 0x9ff1c000-0x9ff99fff] (516096 bytes)
[    0.154020] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.154020] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.154028] PM: RTC time: 17:54:08, date: 2025-04-30
[    0.154094] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.154240] audit: initializing netlink subsys (disabled)
[    0.154249] audit: type=2000 audit(1746035648.000:1): state=initialized audit_enabled=0 res=1
[    0.154249] thermal_sys: Registered thermal governor 'bang_bang'
[    0.154249] thermal_sys: Registered thermal governor 'step_wise'
[    0.154249] thermal_sys: Registered thermal governor 'user_space'
[    0.154249] cpuidle: using governor ladder
[    0.154249] cpuidle: using governor menu
[    0.154770] Simple Boot Flag at 0x47 set to 0x1
[    0.154807] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.155186] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (base 0xf0000000) for domain 0000 [bus 00-7f]
[    0.155205] PCI: Using configuration type 1 for base access
[    0.155350] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.155350] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.155350] cryptd: max_cpu_qlen set to 1000
[    0.172725] raid6: avx2x4   gen() 19028 MB/s
[    0.189724] raid6: avx2x2   gen() 19296 MB/s
[    0.206724] raid6: avx2x1   gen() 16325 MB/s
[    0.206727] raid6: using algorithm avx2x2 gen() 19296 MB/s
[    0.223724] raid6: .... xor() 10700 MB/s, rmw enabled
[    0.223732] raid6: using avx2x2 recovery algorithm
[    0.223793] ACPI: Added _OSI(Module Device)
[    0.223798] ACPI: Added _OSI(Processor Device)
[    0.223800] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.223803] ACPI: Added _OSI(Processor Aggregator Device)
[    0.290814] ACPI: 13 ACPI AML tables successfully acquired and loaded
[    0.291987] ACPI: EC: EC started
[    0.291991] ACPI: EC: interrupt blocked
[    0.292798] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.292802] ACPI: EC: Boot ECDT EC used to handle transactions
[    0.294401] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.356889] ACPI: Dynamic OEM Table Load:
[    0.356909] ACPI: SSDT 0xFFFFA31780BC3800 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160527)
[    0.358214] ACPI: Dynamic OEM Table Load:
[    0.358230] ACPI: SSDT 0xFFFFA31780BB8000 0005CD (v02 PmRef  Cpu0Ist  00003000 INTL 20160527)
[    0.359556] ACPI: Dynamic OEM Table Load:
[    0.359570] ACPI: SSDT 0xFFFFA31780B7E000 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160527)
[    0.360657] ACPI: Dynamic OEM Table Load:
[    0.360670] ACPI: SSDT 0xFFFFA31780BBC800 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160527)
[    0.362530] ACPI: Dynamic OEM Table Load:
[    0.362548] ACPI: SSDT 0xFFFFA31780BC8000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160527)
[    0.364476] ACPI: Dynamic OEM Table Load:
[    0.364490] ACPI: SSDT 0xFFFFA31780BC7C00 000317 (v02 PmRef  ApHwp    00003000 INTL 20160527)
[    0.365756] ACPI: Dynamic OEM Table Load:
[    0.365769] ACPI: SSDT 0xFFFFA31780BC0800 00030A (v02 PmRef  ApCst    00003000 INTL 20160527)
[    0.372565] ACPI: Interpreter enabled
[    0.372641] ACPI: PM: (supports S0 S3 S4 S5)
[    0.372644] ACPI: Using IOAPIC for interrupt routing
[    0.372704] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.372708] PCI: Ignoring E820 reservations for host bridge windows
[    0.373466] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.379044] ACPI: \_SB_.PCI0.LPCB.EC__.PUBS: New power resource
[    0.394017] ACPI: \_SB_.PCI0.RP01.PXSX.WRST: New power resource
[    0.396797] ACPI: \_SB_.PCI0.RP09.PXP_: New power resource
[    0.418608] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
[    0.418621] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.420793] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.421469] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapability LTR]
[    0.421474] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.422399] PCI host bridge to bus 0000:00
[    0.422406] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.422412] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.422417] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.422421] pci_bus 0000:00: root bus resource [mem 0xac800000-0xefffffff window]
[    0.422425] pci_bus 0000:00: root bus resource [mem 0x2000000000-0x2fffffffff window]
[    0.422429] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[    0.422433] pci_bus 0000:00: root bus resource [bus 00-7e]
[    0.422458] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000 conventional PCI endpoint
[    0.422585] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.422613] pci 0000:00:02.0: BAR 0 [mem 0x2ffe000000-0x2ffeffffff 64bit]
[    0.422619] pci 0000:00:02.0: BAR 2 [mem 0xc0000000-0xdfffffff 64bit pref]
[    0.422623] pci 0000:00:02.0: BAR 4 [io  0xe000-0xe03f]
[    0.422645] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.422854] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000 conventional PCI endpoint
[    0.422885] pci 0000:00:04.0: BAR 0 [mem 0x2fff010000-0x2fff017fff 64bit]
[    0.423273] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000 conventional PCI endpoint
[    0.423304] pci 0000:00:08.0: BAR 0 [mem 0x2fff020000-0x2fff020fff 64bit]
[    0.423428] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330 conventional PCI endpoint
[    0.423474] pci 0000:00:14.0: BAR 0 [mem 0xe0420000-0xe042ffff 64bit]
[    0.423520] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.424165] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000 conventional PCI endpoint
[    0.424212] pci 0000:00:14.2: BAR 0 [mem 0x2fff01f000-0x2fff01ffff 64bit]
[    0.424464] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000 conventional PCI endpoint
[    0.424971] pci 0000:00:15.0: BAR 0 [mem 0x2fff01e000-0x2fff01efff 64bit]
[    0.425899] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000 conventional PCI endpoint
[    0.425956] pci 0000:00:16.0: BAR 0 [mem 0x2fff01d000-0x2fff01dfff 64bit]
[    0.426012] pci 0000:00:16.0: PME# supported from D3hot
[    0.426391] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400 PCIe Root Port
[    0.426425] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.426434] pci 0000:00:1c.0:   bridge window [mem 0xe0300000-0xe03fffff]
[    0.426519] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.426543] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
[    0.427037] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400 PCIe Root Port
[    0.427070] pci 0000:00:1c.4: PCI bridge to [bus 04]
[    0.427078] pci 0000:00:1c.4:   bridge window [mem 0xe0200000-0xe02fffff]
[    0.427157] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.427178] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
[    0.427652] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400 PCIe Root Port
[    0.427677] pci 0000:00:1d.0: PCI bridge to [bus 05-6f]
[    0.427684] pci 0000:00:1d.0:   bridge window [mem 0xe0000000-0xe01fffff]
[    0.427752] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.427769] pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
[    0.428246] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100 conventional PCI endpoint
[    0.428705] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000 conventional PCI endpoint
[    0.428754] pci 0000:00:1f.2: BAR 0 [mem 0xe0430000-0xe0433fff]
[    0.429105] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380 conventional PCI endpoint
[    0.429162] pci 0000:00:1f.3: BAR 0 [mem 0x2fff018000-0x2fff01bfff 64bit]
[    0.429171] pci 0000:00:1f.3: BAR 4 [mem 0x2fff000000-0x2fff00ffff 64bit]
[    0.429220] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.429703] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500 conventional PCI endpoint
[    0.429831] pci 0000:00:1f.4: BAR 0 [mem 0x2fff01c000-0x2fff01c0ff 64bit]
[    0.429845] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.430216] pci 0000:00:1f.6: [8086:15d8] type 00 class 0x020000 conventional PCI endpoint
[    0.430272] pci 0000:00:1f.6: BAR 0 [mem 0xe0400000-0xe041ffff]
[    0.430332] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.430867] pci 0000:02:00.0: [8086:24fd] type 00 class 0x028000 PCIe Endpoint
[    0.431298] pci 0000:02:00.0: BAR 0 [mem 0xe0300000-0xe0301fff 64bit]
[    0.431868] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.433310] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.433558] pci 0000:04:00.0: [144d:a808] type 00 class 0x010802 PCIe Endpoint
[    0.433610] pci 0000:04:00.0: BAR 0 [mem 0xe0200000-0xe0203fff 64bit]
[    0.434079] pci 0000:00:1c.4: PCI bridge to [bus 04]
[    0.434152] pci 0000:05:00.0: [8086:15d3] type 01 class 0x060400 PCIe Switch Upstream Port
[    0.434188] pci 0000:05:00.0: PCI bridge to [bus 06-6f]
[    0.434200] pci 0000:05:00.0:   bridge window [mem 0xe0000000-0xe01fffff]
[    0.434227] pci 0000:05:00.0: enabling Extended Tags
[    0.434332] pci 0000:05:00.0: supports D1 D2
[    0.434335] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.434529] pci 0000:00:1d.0: PCI bridge to [bus 05-6f]
[    0.434609] pci 0000:06:00.0: [8086:15d3] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.434645] pci 0000:06:00.0: PCI bridge to [bus 07]
[    0.434656] pci 0000:06:00.0:   bridge window [mem 0xe0100000-0xe01fffff]
[    0.434687] pci 0000:06:00.0: enabling Extended Tags
[    0.434793] pci 0000:06:00.0: supports D1 D2
[    0.434796] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.434969] pci 0000:06:01.0: [8086:15d3] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.435005] pci 0000:06:01.0: PCI bridge to [bus 08-3a]
[    0.435043] pci 0000:06:01.0: enabling Extended Tags
[    0.435151] pci 0000:06:01.0: supports D1 D2
[    0.435154] pci 0000:06:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.435321] pci 0000:06:02.0: [8086:15d3] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.435357] pci 0000:06:02.0: PCI bridge to [bus 3b]
[    0.435370] pci 0000:06:02.0:   bridge window [mem 0xe0000000-0xe00fffff]
[    0.435400] pci 0000:06:02.0: enabling Extended Tags
[    0.435503] pci 0000:06:02.0: supports D1 D2
[    0.435506] pci 0000:06:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.435706] pci 0000:06:04.0: [8086:15d3] type 01 class 0x060400 PCIe Switch Downstream Port
[    0.435743] pci 0000:06:04.0: PCI bridge to [bus 3c-6f]
[    0.435783] pci 0000:06:04.0: enabling Extended Tags
[    0.435893] pci 0000:06:04.0: supports D1 D2
[    0.435895] pci 0000:06:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.436073] pci 0000:05:00.0: PCI bridge to [bus 06-6f]
[    0.436163] pci 0000:07:00.0: [8086:15d2] type 00 class 0x088000 PCIe Endpoint
[    0.436226] pci 0000:07:00.0: BAR 0 [mem 0xe0100000-0xe013ffff]
[    0.436232] pci 0000:07:00.0: BAR 1 [mem 0xe0140000-0xe0140fff]
[    0.436251] pci 0000:07:00.0: enabling Extended Tags
[    0.436370] pci 0000:07:00.0: supports D1 D2
[    0.436373] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.436561] pci 0000:06:00.0: PCI bridge to [bus 07]
[    0.436622] pci 0000:06:01.0: PCI bridge to [bus 08-3a]
[    0.436717] pci 0000:3b:00.0: [8086:15d4] type 00 class 0x0c0330 PCIe Endpoint
[    0.436786] pci 0000:3b:00.0: BAR 0 [mem 0xe0000000-0xe000ffff]
[    0.436810] pci 0000:3b:00.0: enabling Extended Tags
[    0.436942] pci 0000:3b:00.0: supports D1 D2
[    0.436945] pci 0000:3b:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.437191] pci 0000:06:02.0: PCI bridge to [bus 3b]
[    0.437252] pci 0000:06:04.0: PCI bridge to [bus 3c-6f]
[    0.441010] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[    0.441067] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    0.441118] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.441168] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    0.441217] ACPI: PCI: Interrupt link LNKE configured for IRQ 11
[    0.441266] ACPI: PCI: Interrupt link LNKF configured for IRQ 11
[    0.441315] ACPI: PCI: Interrupt link LNKG configured for IRQ 11
[    0.441365] ACPI: PCI: Interrupt link LNKH configured for IRQ 11
[    0.442363] ACPI: EC: interrupt unblocked
[    0.442367] ACPI: EC: event unblocked
[    0.442375] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.442378] ACPI: EC: GPE=0x16
[    0.442381] ACPI: \_SB_.PCI0.LPCB.EC__: Boot ECDT EC initialization complete
[    0.442386] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle transactions and events
[    0.442484] iommu: Default domain type: Translated
[    0.442488] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.442611] SCSI subsystem initialized
[    0.442735] libata version 3.00 loaded.
[    0.442739] ACPI: bus type USB registered
[    0.442756] usbcore: registered new interface driver usbfs
[    0.442766] usbcore: registered new interface driver hub
[    0.442776] usbcore: registered new device driver usb
[    0.442804] videodev: Linux video capture interface: v2.00
[    0.442804] EDAC MC: Ver: 3.0.0
[    0.444124] efivars: Registered efivars operations
[    0.444124] Advanced Linux Sound Architecture Driver Initialized.
[    0.444124] Bluetooth: Core ver 2.22
[    0.444124] NET: Registered PF_BLUETOOTH protocol family
[    0.444124] Bluetooth: HCI device and connection manager initialized
[    0.444124] Bluetooth: HCI socket layer initialized
[    0.444124] Bluetooth: L2CAP socket layer initialized
[    0.444124] Bluetooth: SCO socket layer initialized
[    0.444124] NetLabel: Initializing
[    0.444124] NetLabel:  domain hash size = 128
[    0.444124] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.444124] NetLabel:  unlabeled traffic allowed by default
[    0.444124] PCI: Using ACPI for IRQ routing
[    0.450230] PCI: pci_cache_line_size set to 64 bytes
[    0.451241] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.451244] e820: reserve RAM buffer [mem 0x0008c000-0x0008ffff]
[    0.451246] e820: reserve RAM buffer [mem 0x4f210000-0x4fffffff]
[    0.451248] e820: reserve RAM buffer [mem 0x4ff0c000-0x4fffffff]
[    0.451250] e820: reserve RAM buffer [mem 0x91ad2018-0x93ffffff]
[    0.451251] e820: reserve RAM buffer [mem 0x94f52000-0x97ffffff]
[    0.451253] e820: reserve RAM buffer [mem 0x9e8b9000-0x9fffffff]
[    0.451255] e820: reserve RAM buffer [mem 0x452800000-0x453ffffff]
[    0.451302] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.451302] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.451302] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.451302] vgaarb: loaded
[    0.452055] clocksource: Switched to clocksource tsc-early
[    0.452150] VFS: Disk quotas dquot_6.6.0
[    0.452160] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.452260] pnp: PnP ACPI init
[    0.452342] system 00:00: [mem 0x40000000-0x403fffff] has been reserved
[    0.452497] system 00:01: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.452503] system 00:01: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.452508] system 00:01: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.452511] system 00:01: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.452516] system 00:01: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.452520] system 00:01: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.452525] system 00:01: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.452622] system 00:02: [io  0xff00-0xfffe] has been reserved
[    0.453141] system 00:03: [io  0x0680-0x069f] has been reserved
[    0.453146] system 00:03: [io  0xffff] has been reserved
[    0.453150] system 00:03: [io  0xffff] has been reserved
[    0.453153] system 00:03: [io  0xffff] has been reserved
[    0.453156] system 00:03: [io  0x1800-0x18fe] has been reserved
[    0.453160] system 00:03: [io  0x164e-0x164f] has been reserved
[    0.453341] system 00:05: [io  0x1854-0x1857] has been reserved
[    0.453508] system 00:08: [io  0x1800-0x189f] could not be reserved
[    0.453513] system 00:08: [io  0x0800-0x087f] has been reserved
[    0.453516] system 00:08: [io  0x0880-0x08ff] has been reserved
[    0.453520] system 00:08: [io  0x0900-0x097f] has been reserved
[    0.453523] system 00:08: [io  0x0980-0x09ff] has been reserved
[    0.453526] system 00:08: [io  0x0a00-0x0a7f] has been reserved
[    0.453530] system 00:08: [io  0x0a80-0x0aff] has been reserved
[    0.453533] system 00:08: [io  0x0b00-0x0b7f] has been reserved
[    0.453536] system 00:08: [io  0x0b80-0x0bff] has been reserved
[    0.453539] system 00:08: [io  0x15e0-0x15ef] has been reserved
[    0.453543] system 00:08: [io  0x1600-0x167f] could not be reserved
[    0.453546] system 00:08: [io  0x1640-0x165f] could not be reserved
[    0.453551] system 00:08: [mem 0xf0000000-0xf7ffffff] has been reserved
[    0.453555] system 00:08: [mem 0xfed10000-0xfed13fff] has been reserved
[    0.453559] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.453563] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.453567] system 00:08: [mem 0xfeb00000-0xfebfffff] has been reserved
[    0.453571] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.453575] system 00:08: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.453579] system 00:08: [mem 0xeffe0000-0xefffffff] has been reserved
[    0.456056] system 00:0a: [mem 0xfed10000-0xfed17fff] could not be reserved
[    0.456063] system 00:0a: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.456067] system 00:0a: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.456071] system 00:0a: [mem 0xf0000000-0xf7ffffff] has been reserved
[    0.456075] system 00:0a: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.456079] system 00:0a: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.456083] system 00:0a: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.456087] system 00:0a: [mem 0xff000000-0xffffffff] has been reserved
[    0.456091] system 00:0a: [mem 0xfee00000-0xfeefffff] has been reserved
[    0.456095] system 00:0a: [mem 0xeffe0000-0xefffffff] has been reserved
[    0.456383] pnp 00:0b: disabling [mem 0x000c0000-0x000c3fff] because it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.456391] pnp 00:0b: disabling [mem 0x000c8000-0x000cbfff] because it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.456396] pnp 00:0b: disabling [mem 0x000d0000-0x000d3fff] because it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.456401] pnp 00:0b: disabling [mem 0x000d8000-0x000dbfff] because it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.456434] system 00:0b: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.456439] system 00:0b: [mem 0x000e0000-0x000e3fff] could not be reserved
[    0.456442] system 00:0b: [mem 0x000e8000-0x000ebfff] could not be reserved
[    0.456446] system 00:0b: [mem 0x000f0000-0x000fffff] could not be reserved
[    0.456449] system 00:0b: [mem 0x00100000-0xac7fffff] could not be reserved
[    0.456453] system 00:0b: [mem 0xfec00000-0xfed3ffff] could not be reserved
[    0.456457] system 00:0b: [mem 0xfed4c000-0xffffffff] could not be reserved
[    0.456616] pnp: PnP ACPI: found 12 devices
[    0.462922] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.463010] NET: Registered PF_INET protocol family
[    0.463222] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.467700] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.467733] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.467749] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.468011] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.468465] TCP: Hash tables configured (established 131072 bind 65536)
[    0.468495] UDP hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.468598] UDP-Lite hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.468750] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.469114] pci 0000:06:01.0: bridge window [io  0x1000-0x0fff] to [bus 08-3a] add_size 1000
[    0.469124] pci 0000:06:01.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 08-3a] add_size 200000 add_align 100000
[    0.469130] pci 0000:05:00.0: Assigned bridge window [mem 0xe0000000-0xe01fffff] to [bus 06-6f] cannot fit 0x200000 required for 0000:06:01.0 bridging to [bus 08-3a]
[    0.469137] pci 0000:06:01.0: bridge window [mem 0x00000000] to [bus 08-3a] requires relaxed alignment rules
[    0.469142] pci 0000:06:01.0: bridge window [mem 0x00100000-0x000fffff] to [bus 08-3a] add_size 200000 add_align 100000
[    0.469148] pci 0000:06:04.0: bridge window [io  0x1000-0x0fff] to [bus 3c-6f] add_size 1000
[    0.469153] pci 0000:06:04.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 3c-6f] add_size 200000 add_align 100000
[    0.469158] pci 0000:05:00.0: Assigned bridge window [mem 0xe0000000-0xe01fffff] to [bus 06-6f] cannot fit 0x200000 required for 0000:06:04.0 bridging to [bus 3c-6f]
[    0.469164] pci 0000:06:04.0: bridge window [mem 0x00000000] to [bus 3c-6f] requires relaxed alignment rules
[    0.469168] pci 0000:06:04.0: bridge window [mem 0x00100000-0x000fffff] to [bus 3c-6f] add_size 200000 add_align 100000
[    0.469174] pci 0000:05:00.0: bridge window [io  0x1000-0x0fff] to [bus 06-6f] add_size 2000
[    0.469180] pci 0000:05:00.0: bridge window [mem 0x00100000-0x002fffff 64bit pref] to [bus 06-6f] add_size 400000 add_align 100000
[    0.469185] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus 05-6f] add_size 3000
[    0.469190] pci 0000:00:1d.0: bridge window [mem 0x00100000-0x002fffff 64bit pref] to [bus 05-6f] add_size 400000 add_align 100000
[    0.469206] pci 0000:00:1d.0: bridge window [mem 0x2000000000-0x20005fffff 64bit pref]: assigned
[    0.469212] pci 0000:00:1d.0: bridge window [io  0x2000-0x4fff]: assigned
[    0.469217] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.469225] pci 0000:00:1c.0:   bridge window [mem 0xe0300000-0xe03fffff]
[    0.469235] pci 0000:00:1c.4: PCI bridge to [bus 04]
[    0.469242] pci 0000:00:1c.4:   bridge window [mem 0xe0200000-0xe02fffff]
[    0.469253] pci 0000:05:00.0: bridge window [mem 0x2000000000-0x20005fffff 64bit pref]: assigned
[    0.469257] pci 0000:05:00.0: bridge window [io  0x2000-0x3fff]: assigned
[    0.469263] pci 0000:06:01.0: bridge window [mem size 0x00200000]: can't assign; no space
[    0.469267] pci 0000:06:01.0: bridge window [mem size 0x00200000]: failed to assign
[    0.469272] pci 0000:06:01.0: bridge window [mem 0x2000000000-0x20001fffff 64bit pref]: assigned
[    0.469276] pci 0000:06:04.0: bridge window [mem size 0x00200000]: can't assign; no space
[    0.469280] pci 0000:06:04.0: bridge window [mem size 0x00200000]: failed to assign
[    0.469284] pci 0000:06:04.0: bridge window [mem 0x2000200000-0x20003fffff 64bit pref]: assigned
[    0.469288] pci 0000:06:01.0: bridge window [io  0x2000-0x2fff]: assigned
[    0.469291] pci 0000:06:04.0: bridge window [io  0x3000-0x3fff]: assigned
[    0.469296] pci 0000:06:04.0: bridge window [mem size 0x00200000]: can't assign; no space
[    0.469300] pci 0000:06:04.0: bridge window [mem size 0x00200000]: failed to assign
[    0.469303] pci 0000:06:01.0: bridge window [mem size 0x00200000]: can't assign; no space
[    0.469307] pci 0000:06:01.0: bridge window [mem size 0x00200000]: failed to assign
[    0.469311] pci 0000:06:00.0: PCI bridge to [bus 07]
[    0.469318] pci 0000:06:00.0:   bridge window [mem 0xe0100000-0xe01fffff]
[    0.469330] pci 0000:06:01.0: PCI bridge to [bus 08-3a]
[    0.469334] pci 0000:06:01.0:   bridge window [io  0x2000-0x2fff]
[    0.469344] pci 0000:06:01.0:   bridge window [mem 0x2000000000-0x20001fffff 64bit pref]
[    0.469354] pci 0000:06:02.0: PCI bridge to [bus 3b]
[    0.469361] pci 0000:06:02.0:   bridge window [mem 0xe0000000-0xe00fffff]
[    0.469372] pci 0000:06:04.0: PCI bridge to [bus 3c-6f]
[    0.469376] pci 0000:06:04.0:   bridge window [io  0x3000-0x3fff]
[    0.469386] pci 0000:06:04.0:   bridge window [mem 0x2000200000-0x20003fffff 64bit pref]
[    0.469395] pci 0000:05:00.0: PCI bridge to [bus 06-6f]
[    0.469399] pci 0000:05:00.0:   bridge window [io  0x2000-0x3fff]
[    0.469406] pci 0000:05:00.0:   bridge window [mem 0xe0000000-0xe01fffff]
[    0.469412] pci 0000:05:00.0:   bridge window [mem 0x2000000000-0x20005fffff 64bit pref]
[    0.469421] pci 0000:00:1d.0: PCI bridge to [bus 05-6f]
[    0.469425] pci 0000:00:1d.0:   bridge window [io  0x2000-0x4fff]
[    0.469430] pci 0000:00:1d.0:   bridge window [mem 0xe0000000-0xe01fffff]
[    0.469435] pci 0000:00:1d.0:   bridge window [mem 0x2000000000-0x20005fffff 64bit pref]
[    0.469443] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.469447] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.469451] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.469454] pci_bus 0000:00: resource 7 [mem 0xac800000-0xefffffff window]
[    0.469457] pci_bus 0000:00: resource 8 [mem 0x2000000000-0x2fffffffff window]
[    0.469461] pci_bus 0000:00: resource 9 [mem 0xfd000000-0xfe7fffff window]
[    0.469465] pci_bus 0000:02: resource 1 [mem 0xe0300000-0xe03fffff]
[    0.469468] pci_bus 0000:04: resource 1 [mem 0xe0200000-0xe02fffff]
[    0.469472] pci_bus 0000:05: resource 0 [io  0x2000-0x4fff]
[    0.469475] pci_bus 0000:05: resource 1 [mem 0xe0000000-0xe01fffff]
[    0.469478] pci_bus 0000:05: resource 2 [mem 0x2000000000-0x20005fffff 64bit pref]
[    0.469482] pci_bus 0000:06: resource 0 [io  0x2000-0x3fff]
[    0.469485] pci_bus 0000:06: resource 1 [mem 0xe0000000-0xe01fffff]
[    0.469488] pci_bus 0000:06: resource 2 [mem 0x2000000000-0x20005fffff 64bit pref]
[    0.469492] pci_bus 0000:07: resource 1 [mem 0xe0100000-0xe01fffff]
[    0.469495] pci_bus 0000:08: resource 0 [io  0x2000-0x2fff]
[    0.469498] pci_bus 0000:08: resource 2 [mem 0x2000000000-0x20001fffff 64bit pref]
[    0.469502] pci_bus 0000:3b: resource 1 [mem 0xe0000000-0xe00fffff]
[    0.469505] pci_bus 0000:3c: resource 0 [io  0x3000-0x3fff]
[    0.469508] pci_bus 0000:3c: resource 2 [mem 0x2000200000-0x20003fffff 64bit pref]
[    0.470550] pci 0000:05:00.0: enabling device (0002 -> 0003)
[    0.470804] PCI: CLS 128 bytes, default 64
[    0.470849] pci 0000:00:1f.1: [8086:9d20] type 00 class 0x058000 conventional PCI endpoint
[    0.470994] pci 0000:00:1f.1: BAR 0 [mem 0xfd000000-0xfdffffff 64bit]
[    0.471141] DMAR: Host address width 39
[    0.471145] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.471161] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[    0.471167] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.471177] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.471182] DMAR: RMRR base: 0x0000009f46f000 end: 0x0000009f48efff
[    0.471186] DMAR: RMRR base: 0x000000aa000000 end: 0x000000ac7fffff
[    0.471199] DMAR: No ATSR found
[    0.471202] DMAR: No SATC found
[    0.471207] DMAR: dmar0: Using Queued invalidation
[    0.471214] DMAR: dmar1: Using Queued invalidation
[    0.471821] pci 0000:00:02.0: Adding to iommu group 0
[    0.472211] pci 0000:00:00.0: Adding to iommu group 1
[    0.472228] pci 0000:00:04.0: Adding to iommu group 2
[    0.472242] pci 0000:00:08.0: Adding to iommu group 3
[    0.472269] pci 0000:00:14.0: Adding to iommu group 4
[    0.472282] pci 0000:00:14.2: Adding to iommu group 4
[    0.472302] pci 0000:00:15.0: Adding to iommu group 5
[    0.472322] pci 0000:00:16.0: Adding to iommu group 6
[    0.472340] pci 0000:00:1c.0: Adding to iommu group 7
[    0.472358] pci 0000:00:1c.4: Adding to iommu group 8
[    0.472378] pci 0000:00:1d.0: Adding to iommu group 9
[    0.472422] pci 0000:00:1f.0: Adding to iommu group 10
[    0.472436] pci 0000:00:1f.2: Adding to iommu group 10
[    0.472451] pci 0000:00:1f.3: Adding to iommu group 10
[    0.472465] pci 0000:00:1f.4: Adding to iommu group 10
[    0.472479] pci 0000:00:1f.6: Adding to iommu group 10
[    0.472497] pci 0000:02:00.0: Adding to iommu group 11
[    0.472514] pci 0000:04:00.0: Adding to iommu group 12
[    0.472529] pci 0000:05:00.0: Adding to iommu group 13
[    0.472545] pci 0000:06:00.0: Adding to iommu group 14
[    0.472561] pci 0000:06:01.0: Adding to iommu group 15
[    0.472577] pci 0000:06:02.0: Adding to iommu group 16
[    0.472593] pci 0000:06:04.0: Adding to iommu group 17
[    0.472600] pci 0000:07:00.0: Adding to iommu group 14
[    0.472606] pci 0000:3b:00.0: Adding to iommu group 16
[    0.473821] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.473825] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.473828] software IO TLB: mapped [mem 0x000000008c0ba000-0x00000000900ba000] (64MB)
[    0.473838] ACPI: bus type thunderbolt registered
[    0.629079] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[    0.629085] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    0.629089] RAPL PMU: hw unit of domain package 2^-14 Joules
[    0.629091] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    0.629094] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    0.629096] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    0.629149] resource: resource sanity check: requesting [mem 0x00000000fed10000-0x00000000fed15fff], which spans more than pnp 00:08 [mem 0xfed10000-0xfed13fff]
[    0.629157] caller snb_uncore_imc_init_box+0x6a/0xa0 mapping multiple BARs
[    0.636385] AES CTR mode by8 optimization enabled
[    0.636963] Initialise system trusted keyrings
[    0.637011] workingset: timestamp_bits=40 max_order=22 bucket_order=0
[    0.637417] Key type cifs.idmap registered
[    0.637462] fuse: init (API version 7.42)
[    0.656949] NET: Registered PF_ALG protocol family
[    0.656955] xor: automatically using best checksumming function   avx       
[    0.656959] Key type asymmetric registered
[    0.656962] Asymmetric key parser 'x509' registered
[    0.656964] Asymmetric key parser 'pkcs8' registered
[    0.656984] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    0.657027] io scheduler mq-deadline registered
[    0.657032] io scheduler kyber registered
[    0.657350] pcieport 0000:00:1c.0: PME: Signaling with IRQ 139
[    0.657616] pcieport 0000:00:1c.4: PME: Signaling with IRQ 140
[    0.657764] pcieport 0000:00:1d.0: PME: Signaling with IRQ 141
[    0.658023] pcieport 0000:06:01.0: enabling device (0002 -> 0003)
[    0.658275] pcieport 0000:06:04.0: enabling device (0002 -> 0003)
[    0.659599] ACPI: AC: AC Adapter [AC] (on-line)
[    0.659687] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
[    0.659745] ACPI: button: Sleep Button [SLPB]
[    0.659788] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
[    0.659839] ACPI: button: Lid Switch [LID]
[    0.659881] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    0.659930] ACPI: button: Power Button [PWRF]
[    0.664745] thermal LNXTHERM:00: registered as thermal_zone0
[    0.664752] ACPI: thermal: Thermal Zone [THM0] (48 C)
[    0.664999] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.665832] hpet_acpi_add: no address or irqs in _CRS
[    0.665898] Non-volatile memory driver v1.3
[    0.665902] Linux agpgart interface v0.103
[    0.666019] ACPI: bus type drm_connector registered
[    0.666347] i915 0000:00:02.0: [drm] Found kabylake (device ID 5917) integrated display version 9.00 stepping C0
[    0.667481] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    0.667498] i915 0000:00:02.0: vgaarb: deactivate vga console
[    0.667548] i915 0000:00:02.0: [drm] Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!
[    0.671236] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    0.671926] i915 0000:00:02.0: Direct firmware load for i915/kbl_dmc_ver1_04.bin failed with error -2
[    0.671944] i915 0000:00:02.0: [drm] Failed to load DMC firmware i915/kbl_dmc_ver1_04.bin (-2). Disabling runtime power management.
[    0.671951] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
[    0.691405] ACPI: battery: Slot [BAT0] (battery present)
[    0.711802] i915 0000:00:02.0: [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
[    0.730203] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    0.734195] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    0.734408] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input3
[    0.872429] fbcon: i915drmfb (fb0) is primary device
[    1.646497] tsc: Refined TSC clocksource calibration: 1991.999 MHz
[    1.646507] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x396d4ffc055, max_idle_ns: 881590662783 ns
[    1.646576] clocksource: Switched to clocksource tsc
[    1.954474] Console: switching to colour frame buffer device 320x90
[    1.971227] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    1.973815] loop: module loaded
[    1.974496] nvme nvme0: pci function 0000:04:00.0
[    1.974526] tun: Universal TUN/TAP device driver, 1.6
[    1.974712] e1000e: Intel(R) PRO/1000 Network Driver
[    1.974728] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.975228] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[    1.985695] nvme nvme0: D3 entry latency set to 8 seconds
[    1.995665] nvme nvme0: 8/0/0 default/read/poll queues
[    2.000315]  nvme0n1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
[    2.265453] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 8c:16:45:50:d2:60
[    2.265493] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
[    2.265566] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: 1000FF-0FF
[    2.265854] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.265878] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    2.267069] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[    2.267537] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.267558] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    2.267581] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    2.267898] hub 1-0:1.0: USB hub found
[    2.267934] hub 1-0:1.0: 12 ports detected
[    2.270094] hub 2-0:1.0: USB hub found
[    2.270129] hub 2-0:1.0: 6 ports detected
[    2.271243] xhci_hcd 0000:3b:00.0: xHCI Host Controller
[    2.271274] xhci_hcd 0000:3b:00.0: new USB bus registered, assigned bus number 3
[    2.272504] xhci_hcd 0000:3b:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[    2.272814] xhci_hcd 0000:3b:00.0: xHCI Host Controller
[    2.272842] xhci_hcd 0000:3b:00.0: new USB bus registered, assigned bus number 4
[    2.272868] xhci_hcd 0000:3b:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    2.273124] hub 3-0:1.0: USB hub found
[    2.273157] hub 3-0:1.0: 2 ports detected
[    2.273973] hub 4-0:1.0: USB hub found
[    2.274004] hub 4-0:1.0: 2 ports detected
[    2.274838] usbcore: registered new interface driver uas
[    2.274877] usbcore: registered new interface driver usb-storage
[    2.274955] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    2.276867] serio: i8042 KBD port at 0x60,0x64 irq 1
[    2.276894] serio: i8042 AUX port at 0x60,0x64 irq 12
[    2.277520] rtc_cmos 00:04: RTC can wake from S4
[    2.278399] rtc_cmos 00:04: registered as rtc0
[    2.278471] rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes nvram
[    2.278513] i2c_dev: i2c /dev entries driver
[    2.278873] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
[    2.278974] usbcore: registered new interface driver uvcvideo
[    2.278985] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[    2.279179] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.279264] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.284473] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    2.287441] intel_rapl_common: Found RAPL domain package
[    2.287464] intel_rapl_common: Found RAPL domain dram
[    2.287753] intel_tcc_cooling: Programmable TCC Offset detected
[    2.288280] device-mapper: ioctl: 4.49.0-ioctl (2025-01-17) initialised: dm-devel@lists.linux.dev
[    2.288731] device-mapper: multipath round-robin: version 1.2.0 loaded
[    2.288783] usbcore: registered new interface driver btusb
[    2.288804] intel_pstate: Intel P-state driver initializing
[    2.289560] intel_pstate: HWP enabled
[    2.290460] pstore: Using crash dump compression: deflate
[    2.291339] pstore: Registered efi_pstore as persistent store backend
[    2.292231] hid: raw HID events driver (C) Jiri Kosina
[    2.293166] usbcore: registered new interface driver usbhid
[    2.294063] usbhid: USB HID core driver
[    2.294922] hdaps: supported laptop not found!
[    2.295794] hdaps: driver init failed (ret=-19)!
[    2.296693] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[    2.297560] thinkpad_acpi: http://ibm-acpi.sf.net/
[    2.298459] thinkpad_acpi: ThinkPad BIOS N23ET90W (1.65 ), EC N23HT37W
[    2.299324] thinkpad_acpi: Lenovo ThinkPad X1 Carbon 6th, model 20KHCTO1WW
[    2.300430] thinkpad_acpi: radio switch found; radios are enabled
[    2.301263] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
[    2.302165] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
[    2.303718] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
[    2.318717] thinkpad_acpi: battery 1 registered (start 0, stop 100, behaviours: 0x7)
[    2.319588] ACPI: battery: new hook: ThinkPad Battery Extension
[    2.322557] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input7
[    2.323613] intel_rapl_common: Found RAPL domain package
[    2.324603] intel_rapl_common: Found RAPL domain core
[    2.325819] intel_rapl_common: Found RAPL domain uncore
[    2.326763] intel_rapl_common: Found RAPL domain dram
[    2.327745] intel_rapl_common: Found RAPL domain psys
[    2.329679] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 0xffffffffb670bc40)
[    2.330582] u32 classifier
[    2.331420]     input device check on
[    2.332249]     Actions configured
[    2.333466] IPVS: Registered protocols (TCP, UDP)
[    2.334302] IPVS: Connection hash table configured (size=4096, memory=32Kbytes)
[    2.335160] IPVS: ipvs loaded.
[    2.335989] IPVS: [rr] scheduler registered.
[    2.336869] Initializing XFRM netlink socket
[    2.337714] NET: Registered PF_INET6 protocol family
[    2.338959] Segment Routing with IPv6
[    2.339789] In-situ OAM (IOAM) with IPv6
[    2.340633] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.341536] NET: Registered PF_PACKET protocol family
[    2.342364] Bridge firewalling registered
[    2.343322] Bluetooth: RFCOMM TTY layer initialized
[    2.344147] Bluetooth: RFCOMM socket layer initialized
[    2.344990] Bluetooth: RFCOMM ver 1.11
[    2.345768] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    2.346541] Bluetooth: BNEP filters: protocol multicast
[    2.347354] Bluetooth: BNEP socket layer initialized
[    2.348260] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    2.349132] Bluetooth: HIDP socket layer initialized
[    2.349977] 8021q: 802.1Q VLAN Support v1.8
[    2.350865] Key type dns_resolver registered
[    2.352239] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    2.353100] snd_hda_codec_realtek hdaudioC0D0: ALC285: picked fixup  (pin match)
[    2.353315] microcode: Current revision: 0x000000f6
[    2.354453] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC285: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    2.355792] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    2.356614] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    2.357434] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    2.358264] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    2.359050] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[    2.359858] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
[    2.360942] IPI shorthand broadcast: enabled
[    2.364130] sched_clock: Marking stable (2359001049, 4938082)->(2379977096, -16037965)
[    2.365105] registered taskstats version 1
[    2.365923] Loading compiled-in X.509 certificates
[    2.368016] Demotion targets for Node 0: null
[    2.369078] Btrfs loaded, zoned=no, fsverity=no
[    2.369987] PM:   Magic number: 5:936:947
[    2.370842] tty tty4: hash matches
[    2.371659] processor cpu2: hash matches
[    2.372475] printk: legacy console [netcon0] enabled
[    2.373248] netconsole: network logging started
[    2.374107] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    2.375566] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.376534] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    2.377352] clk: Disabling unused clocks
[    2.378168] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    2.378947] cfg80211: failed to load regulatory.db
[    2.378990] ALSA device list:
[    2.380640]   No soundcards found.
[    2.510074] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    2.642025] hub 1-1:1.0: USB hub found
[    2.644557] hub 1-1:1.0: 4 ports detected
[    2.749237] usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd
[    2.769990] hub 2-1:1.0: USB hub found
[    2.772411] hub 2-1:1.0: 4 ports detected
[    2.877099] usb 1-2: new full-speed USB device number 3 using xhci_hcd
[    3.009453] snd_hda_codec_generic hdaudioC0D2: autoconfig for Generic: line_outs=0 (0x0/0x0/0x0/0x0/0x0) type:line
[    3.010167] hid-generic 0003:0483:CDAB.0001: hiddev96,hidraw0: USB HID v1.10 Device [Gl.Sergei U2F-token (EFM32)] on usb-0000:00:14.0-2/input0
[    3.010378] snd_hda_codec_generic hdaudioC0D2:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    3.012250] snd_hda_codec_generic hdaudioC0D2:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    3.013088] snd_hda_codec_generic hdaudioC0D2:    mono: mono_out=0x0
[    3.013927] snd_hda_codec_generic hdaudioC0D2:    dig-out=0x3/0x0
[    3.014748] snd_hda_codec_generic hdaudioC0D2:    inputs:
[    3.017686] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input8
[    3.018638] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9
[    3.019614] input: HDA Intel PCH HDMI as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[    3.090115] usb 1-1.1: new low-speed USB device number 4 using xhci_hcd
[    3.165790] psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4758]
[    3.202296] psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1094..]
[    3.204488] psmouse serio1: synaptics: Trying to set up SMBus access
[    3.216504] input: PixArt Cherry USB Optical Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.0/0003:046A:B091.0002/input/input11
[    3.218842] hid-generic 0003:046A:B091.0002: input,hidraw1: USB HID v1.11 Mouse [PixArt Cherry USB Optical Mouse] on usb-0000:00:14.0-1.1/input0
[    3.242112] rmi4_smbus 6-002c: registering SMbus-connected sensor
[    3.273731] usb 2-1.2: new SuperSpeed USB device number 3 using xhci_hcd
[    3.294657] hub 2-1.2:1.0: USB hub found
[    3.297406] hub 2-1.2:1.0: 4 ports detected
[    3.324410] rmi4_f34 rmi4-00.fn34: rmi_f34v7_probe: Unrecognized bootloader version: 13 (
) 16 (\x10)
[    3.326641] rmi4_f34 rmi4-00.fn34: probe with driver rmi4_f34 failed with error -22
[    3.350673] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3288-011, fw id: 2812761
[    3.400071] usb 1-7: new full-speed USB device number 5 using xhci_hcd
[    3.436245] input: Synaptics TM3288-011 as /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input12
[    3.452449] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
[    3.468136] EXT4-fs (nvme0n1p3): mounted filesystem 1ff92163-d95e-4c91-bbb9-29b1f07f0a74 ro with ordered data mode. Quota mode: none.
[    3.470319] VFS: Mounted root (ext4 filesystem) readonly on device 259:3.
[    3.473003] devtmpfs: mounted
[    3.475848] Freeing unused kernel image (initmem) memory: 1292K
[    3.478068] Write protecting the kernel read-only data: 26624k
[    3.481550] Freeing unused kernel image (text/rodata gap) memory: 1336K
[    3.484288] Freeing unused kernel image (rodata/data gap) memory: 716K
[    3.486426] Run /sbin/init as init process
[    3.488550]   with arguments:
[    3.488552]     /sbin/init
[    3.488554]   with environment:
[    3.488556]     HOME=/
[    3.488558]     TERM=linux
[    3.488560]     BOOT_IMAGE=/bzImage
[    3.530559] Bluetooth: hci0: Bootloader revision 0.0 build 26 week 38 2015
[    3.533528] Bluetooth: hci0: Device revision is 16
[    3.535190] Bluetooth: hci0: Secure boot is enabled
[    3.536822] Bluetooth: hci0: OTP lock is enabled
[    3.538441] Bluetooth: hci0: API lock is enabled
[    3.539598] Bluetooth: hci0: Debug lock is disabled
[    3.540562] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    3.542811] Bluetooth: hci0: Found device firmware: intel/ibt-12-16.sfi
[    3.577123] psmouse serio2: trackpoint: Elan TrackPoint firmware: 0x06, buttons: 3/3
[    3.612947] usb 1-1.2: new high-speed USB device number 6 using xhci_hcd
[    3.615741] input: TPPS/2 Elan TrackPoint as /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/rmi4-00.fn03/serio2/input/input13
[    3.727239] hub 1-1.2:1.0: USB hub found
[    3.728490] hub 1-1.2:1.0: 4 ports detected
[    3.836999] usb 1-8: new high-speed USB device number 7 using xhci_hcd
[    3.977071] usb 1-8: Found UVC 1.00 device Integrated Camera (5986:2115)
[    4.050958] usb 1-1.3: new low-speed USB device number 8 using xhci_hcd
[    4.169440] input: Cherry USB keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:B090.0003/input/input14
[    4.241444] usb 1-1.2.3: new full-speed USB device number 9 using xhci_hcd
[    4.256328] hid-generic 0003:046A:B090.0003: input,hidraw2: USB HID v1.11 Keyboard [Cherry USB keyboard] on usb-0000:00:14.0-1.3/input0
[    4.280625] input: Cherry USB keyboard System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.1/0003:046A:B090.0004/input/input15
[    4.348100] input: Cherry USB keyboard Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.1/0003:046A:B090.0004/input/input16
[    4.352105] hid-generic 0003:046A:B090.0004: input,hiddev97,hidraw3: USB HID v1.11 Device [Cherry USB keyboard] on usb-0000:00:14.0-1.3/input1
[    4.388458] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.3/1-1.2.3:1.0/0003:046D:C538.0005/input/input17
[    4.482025] hid-generic 0003:046D:C538.0005: input,hidraw4: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:00:14.0-1.2.3/input0
[    4.482980] usb 1-9: new full-speed USB device number 10 using xhci_hcd
[    4.509352] hid-generic 0003:046D:C538.0006: hiddev98,hidraw5: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-1.2.3/input1
[    5.252089] Intel(R) Wireless WiFi driver for Linux
[    5.257180] iwlwifi 0000:02:00.0: Detected crf-id 0xbadcafe, cnv-id 0x10 wfpm id 0x80000000
[    5.257236] iwlwifi 0000:02:00.0: PCI dev 24fd/0010, rev=0x230, rfid=0xd55555d5
[    5.257240] iwlwifi 0000:02:00.0: Detected Intel(R) Dual Band Wireless AC 8265
[    5.260688] iwlwifi 0000:02:00.0: loaded firmware version 36.ca7b901d.0 8265-36.ucode op_mode iwlmvm
[    5.283655] Bluetooth: hci0: Waiting for firmware download to complete
[    5.284412] Bluetooth: hci0: Firmware loaded in 1700780 usecs
[    5.284445] Bluetooth: hci0: Waiting for device to boot
[    5.297420] Bluetooth: hci0: Device booted in 12686 usecs
[    5.297555] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-12-16.ddc
[    5.300542] Bluetooth: hci0: Applying Intel DDC parameters completed
[    5.301426] Bluetooth: hci0: Firmware revision 0.1 build 19 week 44 2021
[    5.303420] Bluetooth: hci0: Reading supported features failed (-16)
[    5.303426] Bluetooth: hci0: Error reading debug features
[    5.303429] Bluetooth: hci0: HCI LE Coded PHY feature bit is set, but its usage is not supported.
[    5.349856] iwlwifi 0000:02:00.0: base HW address: d4:6d:6d:62:4b:8e, OTP minor version: 0x0
[    5.441054] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[    5.492894] EXT4-fs (nvme0n1p3): re-mounted 1ff92163-d95e-4c91-bbb9-29b1f07f0a74 r/w. Quota mode: none.
[    5.519996] EXT4-fs (nvme0n1p3): re-mounted 1ff92163-d95e-4c91-bbb9-29b1f07f0a74 r/w. Quota mode: none.
[    5.628500] Adding 140602688k swap on /dev/nvme0n1p10.  Priority:-2 extents:1 across:140602688k SS
[    5.713922] BTRFS: device fsid b0a56f49-cc48-41eb-9a83-2e91201b5e7d devid 1 transid 5032 /dev/nvme0n1p9 (259:9) scanned by mount (2139)
[    5.714657] BTRFS info (device nvme0n1p9): first mount of filesystem b0a56f49-cc48-41eb-9a83-2e91201b5e7d
[    5.714690] BTRFS info (device nvme0n1p9): using crc32c (crc32c-x86) checksum algorithm
[    5.714705] BTRFS info (device nvme0n1p9): using free-space-tree
[    7.831151] usb 1-7: USB disconnect, device number 5
[    8.130496] Consider using thermal netlink events interface
[   11.839931] wlan0: authenticate with 68:02:b8:9d:55:97 (local address=d4:6d:6d:62:4b:8e)
[   11.841023] wlan0: send auth to 68:02:b8:9d:55:97 (try 1/3)
[   11.851114] wlan0: authenticated
[   11.852038] wlan0: associate with 68:02:b8:9d:55:97 (try 1/3)
[   11.860989] wlan0: RX AssocResp from 68:02:b8:9d:55:97 (capab=0x1511 status=0 aid=3)
[   11.864569] wlan0: associated
[   12.021298] wlan0: Limiting TX power to 27 (30 - 3) dBm as advertised by 68:02:b8:9d:55:97
[   16.534789] EXT4-fs (dm-0): mounted filesystem e0d14dc0-1dac-49b3-9ca7-7e3c355d7c37 r/w with ordered data mode. Quota mode: none.
[   18.318979] EXT4-fs (dm-1): mounted filesystem 2afd40be-8b58-4414-aba9-52b208973235 r/w with ordered data mode. Quota mode: none.
[   22.108378] BTRFS: device fsid 2929fef4-f650-4303-ac99-fa58f3f517ff devid 1 transid 1318 /dev/mapper/_dev_nvme0n1p6 (254:2) scanned by mount (4391)
[   22.108795] BTRFS info (device dm-2): first mount of filesystem 2929fef4-f650-4303-ac99-fa58f3f517ff
[   22.108808] BTRFS info (device dm-2): using crc32c (crc32c-x86) checksum algorithm
[   22.108812] BTRFS info (device dm-2): using free-space-tree
[   24.122018] nvme nvme0: using unchecked data buffer
[   68.184846] BUG: kernel NULL pointer dereference, address: 0000000000000008
[   68.184866] #PF: supervisor read access in kernel mode
[   68.184875] #PF: error_code(0x0000) - not-present page
[   68.184882] PGD 0 P4D 0 
[   68.184892] Oops: Oops: 0000 [#1] SMP
[   68.184902] CPU: 6 UID: 1000 PID: 4704 Comm: cat Tainted: G     U             6.14.4 #2
[   68.184915] Tainted: [U]=USER
[   68.184919] Hardware name: LENOVO 20KHCTO1WW/20KHCTO1WW, BIOS N23ET90W (1.65 ) 11/07/2024
[   68.184926] RIP: 0010:rmi_driver_bootloader_id_show+0x1d/0x60
[   68.184964] Code: 98 c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 d7 48 8b 40 78 48 8b 50 20 31 c0 48 85 d2 74 3f 55 48 8b 82 90 00 00 00 <80> 78 08 05 0f b6 70 09 0f b6 50 0a 48 89 e5 74 12 89 f1 48 c7 c6
[   68.184973] RSP: 0018:ffffac4e419ebc28 EFLAGS: 00010286
[   68.184982] RAX: 0000000000000000 RBX: ffffffffb6d78700 RCX: 0000000000000000
[   68.184989] RDX: ffffa31782c28000 RSI: ffffffffb6d78700 RDI: ffffa31784150000
[   68.184995] RBP: ffffac4e419ebc48 R08: ffffa31782c22400 R09: ffffa31784150000
[   68.185000] R10: 0000000000001000 R11: ffffffffb56f8b0b R12: ffffffffb672c590
[   68.185006] R13: ffffac4e419ebd30 R14: 0000000000000001 R15: ffffa31785211348
[   68.185013] FS:  00007f75e3a5a740(0000) GS:ffffa31ac2780000(0000) knlGS:0000000000000000
[   68.185021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.185028] CR2: 0000000000000008 CR3: 00000001a0448006 CR4: 00000000003726f0
[   68.185034] Call Trace:
[   68.185039]  <TASK>
[   68.185044]  ? dev_attr_show+0x15/0x40
[   68.185054]  sysfs_kf_seq_show+0x9c/0xe0
[   68.185065]  kernfs_seq_show+0x1c/0x20
[   68.185073]  seq_read_iter+0xf8/0x410
[   68.185082]  kernfs_fop_read_iter+0x12b/0x180
[   68.185091]  vfs_read+0x236/0x300
[   68.185102]  ksys_read+0x56/0xc0
[   68.185112]  __x64_sys_read+0x14/0x20
[   68.185122]  x64_sys_call+0x9f2/0xa00
[   68.185129]  do_syscall_64+0x63/0xf0
[   68.185141]  ? __count_memcg_events+0x49/0xe0
[   68.185152]  ? handle_mm_fault+0x1b1/0x2d0
[   68.185162]  ? irqentry_exit+0x19/0x30
[   68.185169]  ? exc_page_fault+0x190/0x5b0
[   68.185181]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   68.185189] RIP: 0033:0x7f75e3aeaad7
[   68.185196] Code: 20 49 89 d0 48 89 fa 4c 89 df e8 24 b4 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 16 5b c3 0f 1f 40 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 e2 e8 23 ff ff ff
[   68.185204] RSP: 002b:00007ffe9e258720 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[   68.185213] RAX: ffffffffffffffda RBX: 00007f75e3a5a740 RCX: 00007f75e3aeaad7
[   68.185220] RDX: 0000000000040000 RSI: 00007f75e36d0000 RDI: 0000000000000003
[   68.185226] RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
[   68.185231] R10: 0000000000000000 R11: 0000000000000202 R12: 00007f75e36d0000
[   68.185237] R13: 0000000000000003 R14: 00007f75e3cb1000 R15: 0000000000000000
[   68.185244]  </TASK>
[   68.185248] Modules linked in: iwlmvm iwlwifi
[   68.185261] CR2: 0000000000000008
[   68.185267] ---[ end trace 0000000000000000 ]---
[   68.199705] pstore: backend (efi_pstore) writing error (-28)
[   68.199709] RIP: 0010:rmi_driver_bootloader_id_show+0x1d/0x60
[   68.199715] Code: 98 c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 d7 48 8b 40 78 48 8b 50 20 31 c0 48 85 d2 74 3f 55 48 8b 82 90 00 00 00 <80> 78 08 05 0f b6 70 09 0f b6 50 0a 48 89 e5 74 12 89 f1 48 c7 c6
[   68.199718] RSP: 0018:ffffac4e419ebc28 EFLAGS: 00010286
[   68.199721] RAX: 0000000000000000 RBX: ffffffffb6d78700 RCX: 0000000000000000
[   68.199723] RDX: ffffa31782c28000 RSI: ffffffffb6d78700 RDI: ffffa31784150000
[   68.199724] RBP: ffffac4e419ebc48 R08: ffffa31782c22400 R09: ffffa31784150000
[   68.199726] R10: 0000000000001000 R11: ffffffffb56f8b0b R12: ffffffffb672c590
[   68.199727] R13: ffffac4e419ebd30 R14: 0000000000000001 R15: ffffa31785211348
[   68.199729] FS:  00007f75e3a5a740(0000) GS:ffffa31ac2780000(0000) knlGS:0000000000000000
[   68.199731] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.199733] CR2: 0000000000000008 CR3: 00000001a0448006 CR4: 00000000003726f0
[   68.199735] note: cat[4704] exited with irqs disabled

--=_zucker.schokokeks.org-3262-1746085851-0001-2--

