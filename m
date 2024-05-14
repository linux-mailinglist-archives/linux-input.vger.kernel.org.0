Return-Path: <linux-input+bounces-3701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7848C4B5D
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 04:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9535C1C20D71
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 02:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9AF17C2;
	Tue, 14 May 2024 02:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="SCrSroQh";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="FKb1Zyig";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="A6fLdJZA"
X-Original-To: linux-input@vger.kernel.org
Received: from e242-7.smtp-out.us-west-1.amazonses.com (e242-7.smtp-out.us-west-1.amazonses.com [23.251.242.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C901C36
	for <linux-input@vger.kernel.org>; Tue, 14 May 2024 02:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715655501; cv=none; b=WXqlas9rQMzuhUMYcCH2jJylxCcNoTMNU4zcxTokKq/FmYlc8VNCqC735aRTotE8sxV/Y6OEkq/VUgkcqrtIKj2dvv8bFy+uoExNBMBYWYlRpFy9iGNOMhKk+J0JmHYM9Cryc6pekrXx3mMIAQnK3OtUISpFV6+zCAIFUE58gjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715655501; c=relaxed/simple;
	bh=CZAEEo5ajyJE2D8vCpxhjzptTU3xlHKh5FFY33j/eCY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=R8qWsPclIsQzPwt5GWSTRmpGu1AcJzCFK16WJSgyB6hn3O968bVgIOJW6g2veNWD04fs7RT1l7bicwJQSAyrk1BKcKqY5KDdLAGfQgd/HNYqok6E4M8VJWnUcI88ZWjVBpDU0RdchGaXtCnG41lsL+M3twfroTIeaGtZFi/9geU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net; spf=pass smtp.mailfrom=us-west-1.amazonses.com; dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=SCrSroQh; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=FKb1Zyig; dkim=fail (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=A6fLdJZA reason="signature verification failed"; arc=none smtp.client-ip=23.251.242.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=qo5nb3djytn6yyi2uek5wqamxnq536po; d=arazil.net; t=1715655471;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=CZAEEo5ajyJE2D8vCpxhjzptTU3xlHKh5FFY33j/eCY=;
	b=SCrSroQhNc8bkI1WOtaPijBTo2v8wEMqACzoQcn0dGRvJ/hXOVSzE6FDeV0j4JX/
	MjBz4DG6ZinmwA9oucP/+ct/50OLhqoiK5Ya2lFQMU7ATajJo0U1qbwVEiy26txVM9U
	xoouth3Qkh+Pa+KwXp5eloPiLMF4LoprhYnCpejq0bJZRbYYx5F3YKpVog+XrSDze3t
	de2RNwcrl99a4C0k2GYShG1P0ZXvUmdHZ7lnivfiB28iYzF2YHmV0oR2Jq5jOMBbgC8
	4Gtt1v8FBy5V7IfPcV/ZDNi/GwKgDEdtOp4f0PVpnMIGiiPxm6LN6ZDh8i69gMG8T8v
	baIdIwLthg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iek43urnex4zqv5t3opageoatkmhcael; d=amazonses.com; t=1715655471;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=CZAEEo5ajyJE2D8vCpxhjzptTU3xlHKh5FFY33j/eCY=;
	b=FKb1ZyigaPqdSispaUBj/3mHBdfk0Jxfqbi5fg3IxdhMf4K6SuvGk7ZbdBP8OSxl
	rc040JU8n9SGqC3gbEqxAVv2mK8jRScvFSOlyriYMxQ+EaorCYBhfVaJPq5nNv7Vjh2
	nQVFfGpOvDqZQ6x57YS2fcgmTTX/BOf4MT74AWj8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arazil.net; s=dkim;
	t=1715655468; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=trDkZ1MDA7fiynmABmLxeV1MHN8Z68+kASNxyfIuAfc=;
	b=A6fLdJZAKP/l8VKO1gDhULQ00bGAXr1Jln1AwOwLQLeyMA7v+SRtaEBhl9p2i6LhyJgpE9
	cvcSQ1D/pJJqn3XDwuYB5TjhqcBbnchRT9imKGYG7LkOJmUtw4gxjgu87PvLP1QSLKSigA
	fVyv+QgVQuPS99fhPrLrYHs8gRLIKgFFiMTv6asessqWwz+g2WRBNJ/z2u+75HWlosxEIM
	GxtW+RU3yj636XHsXbIt+/dB7MujL7cCh1TM+FoxaIFzyVAEOa+kZEPJlvnIfxkavlWd6F
	bMmKUpRtUPQfo44wCrmll4VHoBBg/IFyCWR6ko/snhfMr8ieERd3q8z4RMhJ5g==
Message-ID: <0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com>
Date: Tue, 14 May 2024 02:57:51 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arazil Songweaver <arazil@arazil.net>
Subject: BUG: Framework Laptop 16 i2c-hid Based Touchpad Sometimes Fails To
 Initialize Properly On Early Boot
Content-Language: en-US
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: 1.us-west-1.+ToUlskFmoAr0tQOMQW4CAabIYpBdjD9BBfO15fkT3E=:AmazonSES
X-SES-Outgoing: 2024.05.14-23.251.242.7

We are experiencing an issue where the touch pad on the Framework Laptop 
16 fails to initialize properly when the "i2c-hid" is loaded early in 
the boot process. This issue is especially prominent when "i2c-hid" is 
built directly into the kernel. When the "i2c-hid" module is built in, 
the issue occurs roughly 50% of the time. 
(https://community.frame.work/t/touchpad-not-working-since-update-archlinux/50304) 
Moving the module load to later in the boot process appears to resolve 
this issue by making initialization more likely to succeed. 
(https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/releases/v39.1)

Kernel version: Linux artemis 6.9.0-1-git-01560-ga7c840ba5fa7 #1 SMP 
PREEMPT_DYNAMIC Tue, 14 May 2024 01:49:25 +0000 x86_64 GNU/Linux

I'm using the standard Arch Linux AUR "linux-git" package with the 
following kernel configuration changes:

CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
CONFIG_I2C_HID=y
CONFIG_I2C_HID_ACPI=y
CONFIG_I2C_HID_OF=y
CONFIG_I2C_HID_CORE=y

We tried reverting the following patches without any behavior impact 
(good or bad):

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=fb49deec375aa5beca4a5d71d7a74ec951872f28

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=418c5575d56410c6e186ab727bf32ae32447d497

Impacted devices seem to include: "PIXA3854:00" and "i2c_designware 
AMDI0010:03"

Kernel log during initialization failure:

May 13 21:22:23 archlinux kernel: Linux version 
6.9.0-1-git-01560-ga7c840ba5fa7 (linux-git@archlinux) (gcc (GCC) 14.1.1 
20240507, GNU ld (GNU Binutils) 2.42.0) #1 SMP PREEMPT_DYNAMIC Tue, 14 
May 2024 01:49:25 +0000
May 13 21:22:23 archlinux kernel: Command line: 
rd.luks.name=496f2909-055b-49f7-9a43-b48647d757a9=root 
rd.luks.options=discard root=/dev/mapper/root quiet loglevel=3 
systemd.show_status=auto rd.udev.log_level=3 splash
May 13 21:22:23 archlinux kernel: BIOS-provided physical RAM map:
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000000000000-0x000000000009efff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000000009f000-0x00000000000bffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000000100000-0x0000000009afffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009b00000-0x0000000009dfffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009e00000-0x0000000009efffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009f3c000-0x0000000049b5ffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000049b60000-0x000000004bd5ffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd60000-0x000000004bd68fff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd69000-0x000000004bd6cfff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd6d000-0x000000004bd6efff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd6f000-0x000000004bd6ffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd70000-0x0000000057f7efff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000057f7f000-0x000000005a77efff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005a77f000-0x000000005af7efff] ACPI NVS
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005af7f000-0x000000005affefff] ACPI data
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005afff000-0x000000005affffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005b000000-0x000000005bffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005d790000-0x000000005d7effff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005d7f5000-0x000000005fffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000c0300000-0x00000000c03fffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000e0000000-0x00000000efffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fec00000-0x00000000fec01fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fec10000-0x00000000fec10fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fec20000-0x00000000fec20fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fed80000-0x00000000fed81fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fee00000-0x00000000fee00fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000ff000000-0x00000000ffffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000100000000-0x0000000f9e2fffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000fa0000000-0x00000010c01fffff] reserved
May 13 21:22:23 archlinux kernel: NX (Execute Disable) protection: active
May 13 21:22:23 archlinux kernel: APIC: Static calls initialized
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x4bd74018-0x4bd78257] usable ==> usable
May 13 21:22:23 archlinux kernel: extended physical RAM map:
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000000000000-0x000000000009efff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000000009f000-0x00000000000bffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000000100000-0x0000000009afffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009b00000-0x0000000009dfffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009e00000-0x0000000009efffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009f3c000-0x0000000049b5ffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000049b60000-0x000000004bd5ffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd60000-0x000000004bd68fff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd69000-0x000000004bd6cfff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd6d000-0x000000004bd6efff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd6f000-0x000000004bd6ffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd70000-0x000000004bd74017] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd74018-0x000000004bd78257] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd78258-0x0000000057f7efff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000057f7f000-0x000000005a77efff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005a77f000-0x000000005af7efff] ACPI NVS
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005af7f000-0x000000005affefff] ACPI data
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005afff000-0x000000005affffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005b000000-0x000000005bffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005d790000-0x000000005d7effff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005d7f5000-0x000000005fffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000c0300000-0x00000000c03fffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000e0000000-0x00000000efffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fec00000-0x00000000fec01fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fec10000-0x00000000fec10fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fec20000-0x00000000fec20fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fed80000-0x00000000fed81fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fee00000-0x00000000fee00fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000ff000000-0x00000000ffffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000100000000-0x0000000f9e2fffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000fa0000000-0x00000010c01fffff] reserved
May 13 21:22:23 archlinux kernel: efi: EFI v2.9 by INSYDE Corp.
May 13 21:22:23 archlinux kernel: efi: ACPI=0x5affe000 ACPI 
2.0=0x5affe014 TPMFinalLog=0x5af3f000 SMBIOS=0x58e77000 SMBIOS 
3.0=0x58e74000 MEMATTR=0x52d14018 ESRT=0x548cce18 RNG=0x5af90f18 
INITRD=0x4bd7ea98 TPMEventLog=0x4bd79018
May 13 21:22:23 archlinux kernel: random: crng init done
May 13 21:22:23 archlinux kernel: efi: Remove mem67: MMIO 
range=[0xc0300000-0xc03fffff] (1MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0xc0300000-0xc03fffff] reserved
May 13 21:22:23 archlinux kernel: efi: Remove mem68: MMIO 
range=[0xe0000000-0xefffffff] (256MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0xe0000000-0xefffffff] reserved
May 13 21:22:23 archlinux kernel: efi: Not removing mem69: MMIO 
range=[0xfec00000-0xfec01fff] (8KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem70: MMIO 
range=[0xfec10000-0xfec10fff] (4KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem71: MMIO 
range=[0xfec20000-0xfec20fff] (4KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem72: MMIO 
range=[0xfed80000-0xfed81fff] (8KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem73: MMIO 
range=[0xfee00000-0xfee00fff] (4KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Remove mem74: MMIO 
range=[0xff000000-0xffffffff] (16MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0xff000000-0xffffffff] reserved
May 13 21:22:23 archlinux kernel: efi: Remove mem76: MMIO 
range=[0x10a0000000-0x10c01fffff] (514MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0x10a0000000-0x10c01fffff] reserved
May 13 21:22:23 archlinux kernel: SMBIOS 3.6.0 present.
May 13 21:22:23 archlinux kernel: DMI: Framework Laptop 16 (AMD Ryzen 
7040 Series)/FRANMZCP09, BIOS 03.03 03/27/2024
May 13 21:22:23 archlinux kernel: tsc: Fast TSC calibration using PIT
May 13 21:22:23 archlinux kernel: tsc: Detected 3992.653 MHz processor
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x00000000-0x00000fff] usable ==> reserved
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0x000a0000-0x000fffff] usable
May 13 21:22:23 archlinux kernel: last_pfn = 0xf9e300 max_arch_pfn = 
0x400000000
May 13 21:22:23 archlinux kernel: MTRR map: 7 entries (3 fixed + 4 
variable; max 20), built from 9 variable MTRRs
May 13 21:22:23 archlinux kernel: x86/PAT: Configuration [0-7]: WB  WC  
UC- UC  WB  WP  UC- WT
May 13 21:22:23 archlinux kernel: last_pfn = 0x5b000 max_arch_pfn = 
0x400000000
May 13 21:22:23 archlinux kernel: esrt: Reserving ESRT space from 
0x00000000548cce18 to 0x00000000548cce50.
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x548cc000-0x548ccfff] usable ==> reserved
May 13 21:22:23 archlinux kernel: Using GB pages for direct mapping
May 13 21:22:23 archlinux kernel: Secure boot enabled
May 13 21:22:23 archlinux kernel: RAMDISK: [mem 0x43d94000-0x468f3fff]
May 13 21:22:23 archlinux kernel: ACPI: Early table checksum 
verification disabled
May 13 21:22:23 archlinux kernel: ACPI: RSDP 0x000000005AFFE014 000024 
(v02 INSYDE)
May 13 21:22:23 archlinux kernel: ACPI: XSDT 0x000000005AFA8228 0001B4 
(v01 INSYDE EDK2     00000002      01000013)
May 13 21:22:23 archlinux kernel: ACPI: FACP 0x000000005AFEE000 00010C 
(v05 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: DSDT 0x000000005AFDE000 009ADE 
(v02 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: FACS 0x000000005AEB1000 000040
May 13 21:22:23 archlinux kernel: ACPI: UEFI 0x000000005AF67000 0001CF 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFF4000 008416 
(v02 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFF3000 00033E 
(v01 INSYDE EDK2     00001000 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFF1000 000ABD 
(v02 INSYDE EDK2     00001000 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: ASF! 0x000000005AFF0000 0000A5 
(v32 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: BOOT 0x000000005AFEF000 000028 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: HPET 0x000000005AFED000 000038 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: APIC 0x000000005AFEC000 000138 
(v03 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: MCFG 0x000000005AFEB000 00003C 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SLIC 0x000000005AFEA000 000176 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: VFCT 0x000000005AFD9000 004284 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFD8000 0000F8 
(v02 INSYDE EDK2     00001000 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFD2000 00547E 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: CRAT 0x000000005AFD1000 000F10 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: CDIT 0x000000005AFD0000 000029 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCF000 000F8D 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCE000 000F41 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFFD000 0008CD 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCB000 001E78 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCA000 00077A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC9000 000737 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC7000 0015C8 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC4000 002AAB 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC3000 0008B2 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC1000 001C12 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC0000 000658 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFBE000 00106D 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFB4000 0098F6 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: FPDT 0x000000005AFB3000 000044 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: BGRT 0x000000005AFB2000 000038 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: WSMT 0x000000005AFB1000 000028 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: TPM2 0x000000005AFE9000 000050 
(v05 INSYDE EDK2     20505348 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAE000 002370 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: MHSP 0x000000005AFE8000 0000C8 
(v04 INSYDE EDK2     20505348 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAD000 0000E5 
(v02 INSYDE EDK2     00000004 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: IVRS 0x000000005AFAC000 000198 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAB000 000C44 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAA000 00074A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA9000 000C3A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCD000 000A3A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA6000 001743 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA5000 0001BC 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA4000 000FF7 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF9A000 0098BD 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF95000 004FEB 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF94000 000D41 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF93000 000968 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF92000 00008D 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF91000 000FF5 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: Reserving FACP table memory at 
[mem 0x5afee000-0x5afee10b]
May 13 21:22:23 archlinux kernel: ACPI: Reserving DSDT table memory at 
[mem 0x5afde000-0x5afe7add]
May 13 21:22:23 archlinux kernel: ACPI: Reserving FACS table memory at 
[mem 0x5aeb1000-0x5aeb103f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving UEFI table memory at 
[mem 0x5af67000-0x5af671ce]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5aff4000-0x5affc415]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5aff3000-0x5aff333d]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5aff1000-0x5aff1abc]
May 13 21:22:23 archlinux kernel: ACPI: Reserving ASF! table memory at 
[mem 0x5aff0000-0x5aff00a4]
May 13 21:22:23 archlinux kernel: ACPI: Reserving BOOT table memory at 
[mem 0x5afef000-0x5afef027]
May 13 21:22:23 archlinux kernel: ACPI: Reserving HPET table memory at 
[mem 0x5afed000-0x5afed037]
May 13 21:22:23 archlinux kernel: ACPI: Reserving APIC table memory at 
[mem 0x5afec000-0x5afec137]
May 13 21:22:23 archlinux kernel: ACPI: Reserving MCFG table memory at 
[mem 0x5afeb000-0x5afeb03b]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SLIC table memory at 
[mem 0x5afea000-0x5afea175]
May 13 21:22:23 archlinux kernel: ACPI: Reserving VFCT table memory at 
[mem 0x5afd9000-0x5afdd283]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afd8000-0x5afd80f7]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afd2000-0x5afd747d]
May 13 21:22:23 archlinux kernel: ACPI: Reserving CRAT table memory at 
[mem 0x5afd1000-0x5afd1f0f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving CDIT table memory at 
[mem 0x5afd0000-0x5afd0028]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afcf000-0x5afcff8c]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afce000-0x5afcef40]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5affd000-0x5affd8cc]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afcb000-0x5afcce77]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afca000-0x5afca779]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc9000-0x5afc9736]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc7000-0x5afc85c7]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc4000-0x5afc6aaa]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc3000-0x5afc38b1]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc1000-0x5afc2c11]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc0000-0x5afc0657]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afbe000-0x5afbf06c]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afb4000-0x5afbd8f5]
May 13 21:22:23 archlinux kernel: ACPI: Reserving FPDT table memory at 
[mem 0x5afb3000-0x5afb3043]
May 13 21:22:23 archlinux kernel: ACPI: Reserving BGRT table memory at 
[mem 0x5afb2000-0x5afb2037]
May 13 21:22:23 archlinux kernel: ACPI: Reserving WSMT table memory at 
[mem 0x5afb1000-0x5afb1027]
May 13 21:22:23 archlinux kernel: ACPI: Reserving TPM2 table memory at 
[mem 0x5afe9000-0x5afe904f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afae000-0x5afb036f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving MHSP table memory at 
[mem 0x5afe8000-0x5afe80c7]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afad000-0x5afad0e4]
May 13 21:22:23 archlinux kernel: ACPI: Reserving IVRS table memory at 
[mem 0x5afac000-0x5afac197]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afab000-0x5afabc43]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afaa000-0x5afaa749]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa9000-0x5afa9c39]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afcd000-0x5afcda39]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa6000-0x5afa7742]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa5000-0x5afa51bb]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa4000-0x5afa4ff6]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af9a000-0x5afa38bc]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af95000-0x5af99fea]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af94000-0x5af94d40]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af93000-0x5af93967]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af92000-0x5af9208c]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af91000-0x5af91ff4]
May 13 21:22:23 archlinux kernel: No NUMA configuration found
May 13 21:22:23 archlinux kernel: Faking a node at [mem 
0x0000000000000000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel: NODE_DATA(0) allocated [mem 
0xf9e2fb000-0xf9e2fffff]
May 13 21:22:23 archlinux kernel: Zone ranges:
May 13 21:22:23 archlinux kernel:   DMA      [mem 
0x0000000000001000-0x0000000000ffffff]
May 13 21:22:23 archlinux kernel:   DMA32    [mem 
0x0000000001000000-0x00000000ffffffff]
May 13 21:22:23 archlinux kernel:   Normal   [mem 
0x0000000100000000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel:   Device   empty
May 13 21:22:23 archlinux kernel: Movable zone start for each node
May 13 21:22:23 archlinux kernel: Early memory node ranges
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000000001000-0x000000000009efff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000000100000-0x0000000009afffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000009e00000-0x0000000009efffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000009f3c000-0x0000000049b5ffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000004bd60000-0x000000004bd68fff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000004bd6d000-0x000000004bd6efff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000004bd70000-0x0000000057f7efff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000005afff000-0x000000005affffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000100000000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel: Initmem setup node 0 [mem 
0x0000000000001000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel: On node 0, zone DMA: 1 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA: 97 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 768 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 60 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 8704 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 4 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 1 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 12416 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone Normal: 20480 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone Normal: 7424 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: ACPI: PM-Timer IO Port: 0x408
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: IOAPIC[0]: apic_id 33, version 33, 
address 0xfec00000, GSI 0-23
May 13 21:22:23 archlinux kernel: IOAPIC[1]: apic_id 34, version 33, 
address 0xfec01000, GSI 24-55
May 13 21:22:23 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 
global_irq 2 dfl dfl)
May 13 21:22:23 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 
global_irq 9 low level)
May 13 21:22:23 archlinux kernel: ACPI: Using ACPI (MADT) for SMP 
configuration information
May 13 21:22:23 archlinux kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x52bbb000-0x52c09fff] usable ==> reserved
May 13 21:22:23 archlinux kernel: CPU topo: Max. logical packages:   1
May 13 21:22:23 archlinux kernel: CPU topo: Max. logical dies:       1
May 13 21:22:23 archlinux kernel: CPU topo: Max. dies per package:   1
May 13 21:22:23 archlinux kernel: CPU topo: Max. threads per core:   2
May 13 21:22:23 archlinux kernel: CPU topo: Num. cores per package:     8
May 13 21:22:23 archlinux kernel: CPU topo: Num. threads per package:  16
May 13 21:22:23 archlinux kernel: CPU topo: Allowing 16 present CPUs 
plus 0 hotplug CPUs
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x00000000-0x00000fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x0009f000-0x000bffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x000c0000-0x000fffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09b00000-0x09dfffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09f00000-0x09f3bfff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x49b60000-0x4bd5ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd69000-0x4bd6cfff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd6f000-0x4bd6ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd74000-0x4bd74fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd78000-0x4bd78fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x52bbb000-0x52c09fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x548cc000-0x548ccfff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x57f7f000-0x5a77efff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5a77f000-0x5af7efff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5af7f000-0x5affefff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5b000000-0x5bffffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5c000000-0x5d78ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d790000-0x5d7effff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f0000-0x5d7f4fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f5000-0x5fffffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x60000000-0xfebfffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec00000-0xfec01fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec02000-0xfec0ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec10000-0xfec10fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec11000-0xfec1ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec20000-0xfec20fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec21000-0xfed7ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed80000-0xfed81fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed82000-0xfedfffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee00000-0xfee00fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee01000-0xffffffff]
May 13 21:22:23 archlinux kernel: [mem 0x60000000-0xfebfffff] available 
for PCI devices
May 13 21:22:23 archlinux kernel: Booting paravirtualized kernel on bare 
hardware
May 13 21:22:23 archlinux kernel: clocksource: refined-jiffies: mask: 
0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
May 13 21:22:23 archlinux kernel: setup_percpu: NR_CPUS:320 
nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
May 13 21:22:23 archlinux kernel: percpu: Embedded 66 pages/cpu s233472 
r8192 d28672 u524288
May 13 21:22:23 archlinux kernel: pcpu-alloc: s233472 r8192 d28672 
u524288 alloc=1*2097152
May 13 21:22:23 archlinux kernel: pcpu-alloc: [0] 00 01 02 03 [0] 04 05 
06 07
May 13 21:22:23 archlinux kernel: pcpu-alloc: [0] 08 09 10 11 [0] 12 13 
14 15
May 13 21:22:23 archlinux kernel: Kernel command line: 
rd.luks.name=496f2909-055b-49f7-9a43-b48647d757a9=root 
rd.luks.options=discard root=/dev/mapper/root quiet loglevel=3 
systemd.show_status=auto rd.udev.log_level=3 splash
May 13 21:22:23 archlinux kernel: Unknown kernel command line parameters 
"splash", will be passed to user space.
May 13 21:22:23 archlinux kernel: Dentry cache hash table entries: 
8388608 (order: 14, 67108864 bytes, linear)
May 13 21:22:23 archlinux kernel: Inode-cache hash table entries: 
4194304 (order: 13, 33554432 bytes, linear)
May 13 21:22:23 archlinux kernel: Fallback order for Node 0: 0
May 13 21:22:23 archlinux kernel: Built 1 zonelists, mobility grouping 
on.  Total pages: 15433546
May 13 21:22:23 archlinux kernel: Policy zone: Normal
May 13 21:22:23 archlinux kernel: mem auto-init: stack:all(zero), heap 
alloc:on, heap free:off
May 13 21:22:23 archlinux kernel: software IO TLB: area num 16.
May 13 21:22:23 archlinux kernel: Memory: 61338644K/62714740K available 
(18432K kernel code, 2189K rwdata, 13500K rodata, 3412K init, 3604K bss, 
1375836K reserved, 0K cma-reserved)
May 13 21:22:23 archlinux kernel: SLUB: HWalign=64, Order=0-3, 
MinObjects=0, CPUs=16, Nodes=1
May 13 21:22:23 archlinux kernel: ftrace: allocating 49950 entries in 
196 pages
May 13 21:22:23 archlinux kernel: ftrace: allocated 196 pages with 3 groups
May 13 21:22:23 archlinux kernel: Dynamic Preempt: full
May 13 21:22:23 archlinux kernel: rcu: Preemptible hierarchical RCU 
implementation.
May 13 21:22:23 archlinux kernel: rcu:         RCU restricting CPUs from 
NR_CPUS=320 to nr_cpu_ids=16.
May 13 21:22:23 archlinux kernel: rcu:         RCU priority boosting: 
priority 1 delay 500 ms.
May 13 21:22:23 archlinux kernel:         Trampoline variant of Tasks 
RCU enabled.
May 13 21:22:23 archlinux kernel:         Rude variant of Tasks RCU enabled.
May 13 21:22:23 archlinux kernel:         Tracing variant of Tasks RCU 
enabled.
May 13 21:22:23 archlinux kernel: rcu: RCU calculated value of 
scheduler-enlistment delay is 30 jiffies.
May 13 21:22:23 archlinux kernel: rcu: Adjusting geometry for 
rcu_fanout_leaf=16, nr_cpu_ids=16
May 13 21:22:23 archlinux kernel: RCU Tasks: Setting shift to 4 and lim 
to 1 rcu_task_cb_adjust=1.
May 13 21:22:23 archlinux kernel: RCU Tasks Rude: Setting shift to 4 and 
lim to 1 rcu_task_cb_adjust=1.
May 13 21:22:23 archlinux kernel: RCU Tasks Trace: Setting shift to 4 
and lim to 1 rcu_task_cb_adjust=1.
May 13 21:22:23 archlinux kernel: NR_IRQS: 20736, nr_irqs: 1096, 
preallocated irqs: 16
May 13 21:22:23 archlinux kernel: rcu: srcu_init: Setting srcu_struct 
sizes based on contention.
May 13 21:22:23 archlinux kernel: kfence: initialized - using 2097152 
bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
May 13 21:22:23 archlinux kernel: Console: colour dummy device 80x25
May 13 21:22:23 archlinux kernel: printk: legacy console [tty0] enabled
May 13 21:22:23 archlinux kernel: ACPI: Core revision 20230628
May 13 21:22:23 archlinux kernel: clocksource: hpet: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
May 13 21:22:23 archlinux kernel: APIC: Switch to symmetric I/O mode setup
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR0, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR1, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR2, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR3, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: Using global IVHD 
EFR:0x246577efa2054ada, EFR2:0x0
May 13 21:22:23 archlinux kernel: x2apic: IRQ remapping doesn't support 
X2APIC mode
May 13 21:22:23 archlinux kernel: APIC: Switched APIC routing to: 
physical flat
May 13 21:22:23 archlinux kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 
apic2=-1 pin2=-1
May 13 21:22:23 archlinux kernel: clocksource: tsc-early: mask: 
0xffffffffffffffff max_cycles: 0x731a806b6e8, max_idle_ns: 881590582644 ns
May 13 21:22:23 archlinux kernel: Calibrating delay loop (skipped), 
value calculated using timer frequency.. 7988.02 BogoMIPS (lpj=13308843)
May 13 21:22:23 archlinux kernel: x86/cpu: User Mode Instruction 
Prevention (UMIP) activated
May 13 21:22:23 archlinux kernel: LVT offset 1 assigned for vector 0xf9
May 13 21:22:23 archlinux kernel: LVT offset 2 assigned for vector 0xf4
May 13 21:22:23 archlinux kernel: Last level iTLB entries: 4KB 512, 2MB 
512, 4MB 256
May 13 21:22:23 archlinux kernel: Last level dTLB entries: 4KB 3072, 2MB 
3072, 4MB 1536, 1GB 0
May 13 21:22:23 archlinux kernel: process: using mwait in idle threads
May 13 21:22:23 archlinux kernel: Spectre V1 : Mitigation: 
usercopy/swapgs barriers and __user pointer sanitization
May 13 21:22:23 archlinux kernel: Spectre V2 : Mitigation: Enhanced / 
Automatic IBRS
May 13 21:22:23 archlinux kernel: Spectre V2 : Spectre v2 / SpectreRSB 
mitigation: Filling RSB on context switch
May 13 21:22:23 archlinux kernel: Spectre V2 : mitigation: Enabling 
conditional Indirect Branch Prediction Barrier
May 13 21:22:23 archlinux kernel: Spectre V2 : User space: Mitigation: 
STIBP always-on protection
May 13 21:22:23 archlinux kernel: Speculative Store Bypass: Mitigation: 
Speculative Store Bypass disabled via prctl
May 13 21:22:23 archlinux kernel: Speculative Return Stack Overflow: 
Mitigation: Safe RET
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x001: 'x87 floating point registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x002: 'SSE registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x004: 'AVX registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x020: 'AVX-512 opmask'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x040: 'AVX-512 Hi256'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x080: 'AVX-512 ZMM_Hi256'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x200: 'Protection Keys User registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x800: 'Control-flow User registers'
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[2]:  576, 
xstate_sizes[2]:  256
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[5]:  832, 
xstate_sizes[5]:   64
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[6]:  896, 
xstate_sizes[6]:  512
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[7]: 1408, 
xstate_sizes[7]: 1024
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[9]: 2432, 
xstate_sizes[9]:    8
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[11]: 2440, 
xstate_sizes[11]:   16
May 13 21:22:23 archlinux kernel: x86/fpu: Enabled xstate features 
0xae7, context size is 2456 bytes, using 'compacted' format.
May 13 21:22:23 archlinux kernel: Freeing SMP alternatives memory: 40K
May 13 21:22:23 archlinux kernel: pid_max: default: 32768 minimum: 301
May 13 21:22:23 archlinux kernel: LSM: initializing 
lsm=capability,landlock,lockdown,yama,bpf
May 13 21:22:23 archlinux kernel: landlock: Up and running.
May 13 21:22:23 archlinux kernel: Yama: becoming mindful.
May 13 21:22:23 archlinux kernel: LSM support for eBPF active
May 13 21:22:23 archlinux kernel: Mount-cache hash table entries: 131072 
(order: 8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: Mountpoint-cache hash table entries: 
131072 (order: 8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: smpboot: CPU0: AMD Ryzen 9 7940HS w/ 
Radeon 780M Graphics (family: 0x19, model: 0x74, stepping: 0x1)
May 13 21:22:23 archlinux kernel: Performance Events: Fam17h+ 16-deep 
LBR, core perfctr, AMD PMU driver.
May 13 21:22:23 archlinux kernel: ... version:                2
May 13 21:22:23 archlinux kernel: ... bit width:              48
May 13 21:22:23 archlinux kernel: ... generic registers:      6
May 13 21:22:23 archlinux kernel: ... value mask: 0000ffffffffffff
May 13 21:22:23 archlinux kernel: ... max period: 00007fffffffffff
May 13 21:22:23 archlinux kernel: ... fixed-purpose events:   0
May 13 21:22:23 archlinux kernel: ... event mask: 000000000000003f
May 13 21:22:23 archlinux kernel: signal: max sigframe size: 3376
May 13 21:22:23 archlinux kernel: rcu: Hierarchical SRCU implementation.
May 13 21:22:23 archlinux kernel: rcu:         Max phase no-delay 
instances is 1000.
May 13 21:22:23 archlinux kernel: NMI watchdog: Enabled. Permanently 
consumes one hw-PMU counter.
May 13 21:22:23 archlinux kernel: smp: Bringing up secondary CPUs ...
May 13 21:22:23 archlinux kernel: smpboot: x86: Booting SMP configuration:
May 13 21:22:23 archlinux kernel: .... node  #0, CPUs:        #2 #4  #6  
#8 #10 #12 #14  #1  #3  #5  #7  #9 #11 #13 #15
May 13 21:22:23 archlinux kernel: Spectre V2 : Update user space SMT 
mitigation: STIBP always-on
May 13 21:22:23 archlinux kernel: smp: Brought up 1 node, 16 CPUs
May 13 21:22:23 archlinux kernel: smpboot: Total of 16 processors 
activated (127816.43 BogoMIPS)
May 13 21:22:23 archlinux kernel: devtmpfs: initialized
May 13 21:22:23 archlinux kernel: x86/mm: Memory block size: 128MB
May 13 21:22:23 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x09f00000-0x09f3bfff] (245760 bytes)
May 13 21:22:23 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x5a77f000-0x5af7efff] (8388608 bytes)
May 13 21:22:23 archlinux kernel: clocksource: jiffies: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
May 13 21:22:23 archlinux kernel: futex hash table entries: 4096 (order: 
6, 262144 bytes, linear)
May 13 21:22:23 archlinux kernel: pinctrl core: initialized pinctrl 
subsystem
May 13 21:22:23 archlinux kernel: PM: RTC time: 02:22:23, date: 2024-05-14
May 13 21:22:23 archlinux kernel: NET: Registered PF_NETLINK/PF_ROUTE 
protocol family
May 13 21:22:23 archlinux kernel: DMA: preallocated 4096 KiB GFP_KERNEL 
pool for atomic allocations
May 13 21:22:23 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA pool for atomic allocations
May 13 21:22:23 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA32 pool for atomic allocations
May 13 21:22:23 archlinux kernel: audit: initializing netlink subsys 
(disabled)
May 13 21:22:23 archlinux kernel: audit: type=2000 
audit(1715653343.189:1): state=initialized audit_enabled=0 res=1
May 13 21:22:23 archlinux kernel: i2c-core: driver [dummy] registered
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'fair_share'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'bang_bang'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'step_wise'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'user_space'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'power_allocator'
May 13 21:22:23 archlinux kernel: cpuidle: using governor ladder
May 13 21:22:23 archlinux kernel: cpuidle: using governor menu
May 13 21:22:23 archlinux kernel: Simple Boot Flag at 0x44 set to 0x1
May 13 21:22:23 archlinux kernel: acpiphp: ACPI Hot Plug PCI Controller 
Driver version: 0.5
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:22:23 archlinux kernel: PCI: not using ECAM ([mem 
0xe0000000-0xefffffff] not reserved)
May 13 21:22:23 archlinux kernel: PCI: Using configuration type 1 for 
base access
May 13 21:22:23 archlinux kernel: PCI: Using configuration type 1 for 
extended access
May 13 21:22:23 archlinux kernel: kprobes: kprobe jump-optimization is 
enabled. All kprobes are optimized if possible.
May 13 21:22:23 archlinux kernel: HugeTLB: registered 1.00 GiB page 
size, pre-allocated 0 pages
May 13 21:22:23 archlinux kernel: HugeTLB: 16380 KiB vmemmap can be 
freed for a 1.00 GiB page
May 13 21:22:23 archlinux kernel: HugeTLB: registered 2.00 MiB page 
size, pre-allocated 0 pages
May 13 21:22:23 archlinux kernel: HugeTLB: 28 KiB vmemmap can be freed 
for a 2.00 MiB page
May 13 21:22:23 archlinux kernel: Demotion targets for Node 0: null
May 13 21:22:23 archlinux kernel: i2c-core: driver [sx150x-pinctrl] 
registered
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(Module Device)
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(Processor Device)
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(Processor Aggregator 
Device)
May 13 21:22:23 archlinux kernel: ACPI: 34 ACPI AML tables successfully 
acquired and loaded
May 13 21:22:23 archlinux kernel: ACPI: USB4 _OSC: OS supports USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:22:23 archlinux kernel: ACPI: USB4 _OSC: OS controls USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:22:23 archlinux kernel: ACPI: _OSC evaluation for CPUs failed, 
trying _PDC
May 13 21:22:23 archlinux kernel: ACPI: EC: EC started
May 13 21:22:23 archlinux kernel: ACPI: EC: interrupt blocked
May 13 21:22:23 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC used to handle transactions
May 13 21:22:23 archlinux kernel: ACPI: Interpreter enabled
May 13 21:22:23 archlinux kernel: ACPI: PM: (supports S0 S4 S5)
May 13 21:22:23 archlinux kernel: ACPI: Using IOAPIC for interrupt routing
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:22:23 archlinux kernel: PCI: [Firmware Info]: ECAM [mem 
0xe0000000-0xefffffff] not reserved in ACPI motherboard resources
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
is EfiMemoryMappedIO; assuming valid
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
reserved to work around lack of ACPI motherboard _CRS
May 13 21:22:23 archlinux kernel: PCI: Using host bridge windows from 
ACPI; if necessary, use "pci=nocrs" and report a bug
May 13 21:22:23 archlinux kernel: PCI: Ignoring E820 reservations for 
host bridge windows
May 13 21:22:23 archlinux kernel: ACPI: Enabled 4 GPEs in block 00 to 1F
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.M237: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: 
New power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP6.PWSR: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP8.P0NV: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.PWRS: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PRWL: New power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PRWB: New power resource
May 13 21:22:23 archlinux kernel: ACPI: PCI Root Bridge [PCI0] (domain 
0000 [bus 00-ff])
May 13 21:22:23 archlinux kernel: acpi PNP0A08:00: _OSC: OS supports 
[ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
May 13 21:22:23 archlinux kernel: acpi PNP0A08:00: _OSC: platform does 
not support [SHPCHotplug AER]
May 13 21:22:23 archlinux kernel: acpi PNP0A08:00: _OSC: OS now controls 
[PCIeHotplug PME PCIeCapability LTR DPC]
May 13 21:22:23 archlinux kernel: PCI host bridge to bus 0000:00
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0000-0x0cf7 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0d00-0xffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000a0000-0x000bffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000c0000-0x000cffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000d0000-0x000effff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x60000000-0x90ffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xf0000000-0xfec00000 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed45000-0xfed814ff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed81900-0xfed81fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc0000-0xfedc0fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc6000-0xfedc6fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x10c0200000-0x891fffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[bus 00-ff]
May 13 21:22:23 archlinux kernel: pci 0000:00:00.0: [1022:14e8] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:00.2: [1022:14e9] type 00 
class 0x080600 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:01.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: [1022:14ed] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:02.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:03.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:04.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:14.0: [1022:790b] type 00 
class 0x0c0500 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:14.3: [1022:790e] type 00 
class 0x060100 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.0: [1022:14f0] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.1: [1022:14f1] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.2: [1022:14f2] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.3: [1022:14f3] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.4: [1022:14f4] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.5: [1022:14f5] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.6: [1022:14f6] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.7: [1022:14f7] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: [1002:1478] type 01 
class 0x060400 PCIe Switch Upstream Port
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: BAR 0 [mem 
0x90e00000-0x90e03fff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: [1002:1479] type 01 
class 0x060400 PCIe Switch Downstream Port
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: [1002:7480] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 0 [mem 
0x8400000000-0x85ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 2 [mem 
0x8600000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 4 [io 0xa000-0xa0ff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 5 [mem 
0x90c00000-0x90cfffff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: [1002:ab30] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: BAR 0 [mem 
0x90d00000-0x90d03fff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: [14c3:0616] type 00 
class 0x028000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: BAR 0 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: BAR 2 [mem 
0x90b00000-0x90b07fff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:22:23 archlinux kernel: pci 0000:05:00.0: [144d:a80c] type 00 
class 0x010802 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:05:00.0: BAR 0 [mem 
0x90a00000-0x90a03fff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: [1002:15bf] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 0 [mem 
0x8610000000-0x861fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 2 [mem 
0x90000000-0x901fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 4 [io 0x1000-0x10ff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 5 [mem 
0x90500000-0x9057ffff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: [1002:1640] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: BAR 0 [mem 
0x905c8000-0x905cbfff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: [1022:15c7] type 00 
class 0x108000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: BAR 2 [mem 
0x90400000-0x904fffff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: BAR 5 [mem 
0x905cc000-0x905cdfff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: [1022:15b9] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: BAR 0 [mem 
0x90200000-0x902fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: [1022:15ba] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: BAR 0 [mem 
0x90300000-0x903fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: [1022:15e2] type 00 
class 0x048000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: BAR 0 [mem 
0x90580000-0x905bffff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: BAR 2 [mem 
0x8620000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: [1022:15e3] type 00 
class 0x040300 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: BAR 0 [mem 
0x905c0000-0x905c7fff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: PME# supported from 
D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: [1022:1502] type 00 
class 0x118000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 0 [mem 
0x90900000-0x9097ffff]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 1 [mem 
0x909c0000-0x909c1fff]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 2 [mem 
0x8620800000-0x862083ffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 4 [mem 
0x90980000-0x909bffff]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.0: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: [1022:15c0] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: BAR 0 [mem 
0x90600000-0x906fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: [1022:15c1] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: BAR 0 [mem 
0x90700000-0x907fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: [1022:1668] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: BAR 0 [mem 
0x90800000-0x9087ffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: [1022:1669] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: BAR 0 [mem 
0x90880000-0x908fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKA 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKA disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKB 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKB disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKC 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKC disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKD 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKD disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKE 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKE disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKF 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKF disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKG 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKG disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKH 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKH disabled
May 13 21:22:23 archlinux kernel: Low-power S0 idle used by default for 
system suspend
May 13 21:22:23 archlinux kernel: ACPI: EC: interrupt unblocked
May 13 21:22:23 archlinux kernel: ACPI: EC: event unblocked
May 13 21:22:23 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:22:23 archlinux kernel: ACPI: EC: GPE=0xb
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC initialization complete
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used 
to handle transactions and events
May 13 21:22:23 archlinux kernel: iommu: Default domain type: Translated
May 13 21:22:23 archlinux kernel: iommu: DMA domain TLB invalidation 
policy: lazy mode
May 13 21:22:23 archlinux kernel: i2c-core: driver [88PM860x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [WM8400] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [wm831x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [wm8350] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [tps65910] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [da903x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [da9052] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [lp8788] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [da9055-pmic] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max77843] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max8925] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max8997] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max8998] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [tps6586x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [tps65090] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [aat2870] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [palmas] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [rc5t583] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [as3711] registered
May 13 21:22:23 archlinux kernel: SCSI subsystem initialized
May 13 21:22:23 archlinux kernel: libata version 3.00 loaded.
May 13 21:22:23 archlinux kernel: ACPI: bus type USB registered
May 13 21:22:23 archlinux kernel: usbcore: registered new interface 
driver usbfs
May 13 21:22:23 archlinux kernel: usbcore: registered new interface 
driver hub
May 13 21:22:23 archlinux kernel: usbcore: registered new device driver usb
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
clock-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-rising-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-internal-delay-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-hold-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-digital-filter-width-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: ACPI slave 
is not supported yet
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: SDA Hold 
Time TX:RX = 48:48
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: Bus speed: 
Fast Mode (400 kHz)
May 13 21:22:23 archlinux kernel: i2c i2c-0: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:22:23 archlinux kernel: i2c i2c-0: client [FRMW0003:00] 
registered with bus id i2c-FRMW0003:00
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
clock-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-rising-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-internal-delay-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-hold-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-digital-filter-width-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: ACPI slave 
is not supported yet
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: SDA Hold 
Time TX:RX = 48:48
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: Bus speed: 
Fast Mode (400 kHz)
May 13 21:22:23 archlinux kernel: i2c i2c-1: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:22:23 archlinux kernel: i2c i2c-1: client [PIXA3854:00] 
registered with bus id i2c-PIXA3854:00
May 13 21:22:23 archlinux kernel: pps_core: LinuxPPS API ver. 1 registered
May 13 21:22:23 archlinux kernel: pps_core: Software ver. 5.3.6 - 
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
May 13 21:22:23 archlinux kernel: PTP clock support registered
May 13 21:22:23 archlinux kernel: EDAC MC: Ver: 3.0.0
May 13 21:22:23 archlinux kernel: efivars: Registered efivars operations
May 13 21:22:23 archlinux kernel: NetLabel: Initializing
May 13 21:22:23 archlinux kernel: NetLabel:  domain hash size = 128
May 13 21:22:23 archlinux kernel: NetLabel:  protocols = UNLABELED 
CIPSOv4 CALIPSO
May 13 21:22:23 archlinux kernel: NetLabel:  unlabeled traffic allowed 
by default
May 13 21:22:23 archlinux kernel: mctp: management component transport 
protocol core
May 13 21:22:23 archlinux kernel: NET: Registered PF_MCTP protocol family
May 13 21:22:23 archlinux kernel: PCI: Using ACPI for IRQ routing
May 13 21:22:23 archlinux kernel: PCI: pci_cache_line_size set to 64 bytes
May 13 21:22:23 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:22:23 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x0009f000-0x0009ffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x09b00000-0x0bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x09f00000-0x0bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x49b60000-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd69000-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd6f000-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd74018-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x52bbb000-0x53ffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x548cc000-0x57ffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x57f7f000-0x57ffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x5b000000-0x5bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0xf9e300000-0xf9fffffff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: vgaarb: setting as 
boot VGA device
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: vgaarb: bridge 
control possible
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: vgaarb: setting as 
boot VGA device (overriding previous)
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: vgaarb: bridge 
control possible
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:22:23 archlinux kernel: vgaarb: loaded
May 13 21:22:23 archlinux kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
May 13 21:22:23 archlinux kernel: hpet0: 3 comparators, 32-bit 14.318180 
MHz counter
May 13 21:22:23 archlinux kernel: clocksource: Switched to clocksource 
tsc-early
May 13 21:22:23 archlinux kernel: VFS: Disk quotas dquot_6.6.0
May 13 21:22:23 archlinux kernel: VFS: Dquot-cache hash table entries: 
512 (order 0, 4096 bytes)
May 13 21:22:23 archlinux kernel: pnp: PnP ACPI init
May 13 21:22:23 archlinux kernel: system 00:00: [mem 
0xfec00000-0xfec01fff] could not be reserved
May 13 21:22:23 archlinux kernel: system 00:00: [mem 
0xfee00000-0xfee00fff] has been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0400-0x04cf] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x04d0-0x04d1] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x04d6] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0c00-0x0c01] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x0c14] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0c50-0x0c52] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x0c6c] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x0c6f] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0cd0-0x0cdb] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:03: [mem 
0x000e0000-0x000fffff] could not be reserved
May 13 21:22:23 archlinux kernel: system 00:03: [mem 
0xfe000000-0xffffffff] could not be reserved
May 13 21:22:23 archlinux kernel: pnp: PnP ACPI: found 4 devices
May 13 21:22:23 archlinux kernel: clocksource: acpi_pm: mask: 0xffffff 
max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 13 21:22:23 archlinux kernel: NET: Registered PF_INET protocol family
May 13 21:22:23 archlinux kernel: IP idents hash table entries: 262144 
(order: 9, 2097152 bytes, linear)
May 13 21:22:23 archlinux kernel: tcp_listen_portaddr_hash hash table 
entries: 32768 (order: 7, 524288 bytes, linear)
May 13 21:22:23 archlinux kernel: Table-perturb hash table entries: 
65536 (order: 6, 262144 bytes, linear)
May 13 21:22:23 archlinux kernel: TCP established hash table entries: 
524288 (order: 10, 4194304 bytes, linear)
May 13 21:22:23 archlinux kernel: TCP bind hash table entries: 65536 
(order: 9, 2097152 bytes, linear)
May 13 21:22:23 archlinux kernel: TCP: Hash tables configured 
(established 524288 bind 65536)
May 13 21:22:23 archlinux kernel: MPTCP token hash table entries: 65536 
(order: 8, 1572864 bytes, linear)
May 13 21:22:23 archlinux kernel: UDP hash table entries: 32768 (order: 
8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: UDP-Lite hash table entries: 32768 
(order: 8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: NET: Registered PF_UNIX/PF_LOCAL 
protocol family
May 13 21:22:23 archlinux kernel: NET: Registered PF_XDP protocol family
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]: can't claim; no compatible bridge window
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0x90d20000-0x90d3ffff pref]: assigned
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 4 [io 
0x0000-0x0cf7 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 5 [io 
0x0d00-0xffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 6 [mem 
0x000a0000-0x000bffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 7 [mem 
0x000c0000-0x000cffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 8 [mem 
0x000d0000-0x000effff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 9 [mem 
0x60000000-0x90ffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 10 [mem 
0xf0000000-0xfec00000 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 11 [mem 
0xfed45000-0xfed814ff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 12 [mem 
0xfed81900-0xfed81fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 13 [mem 
0xfedc0000-0xfedc0fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 14 [mem 
0xfedc6000-0xfedc6fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 15 [mem 
0x10c0200000-0x891fffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:01: resource 0 [io 
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:01: resource 1 [mem 
0x90c00000-0x90efffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:01: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:02: resource 0 [io 
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:02: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:02: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:03: resource 0 [io 
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:03: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:03: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:04: resource 1 [mem 
0x90b00000-0x90bfffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:04: resource 2 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:05: resource 1 [mem 
0x90a00000-0x90afffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:06: resource 0 [io 
0x6000-0x9fff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:06: resource 1 [mem 
0x78000000-0x8fffffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:06: resource 2 [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:65: resource 0 [io 
0x2000-0x5fff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:65: resource 1 [mem 
0x60000000-0x77ffffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:65: resource 2 [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c4: resource 0 [io 
0x1000-0x1fff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c4: resource 1 [mem 
0x90000000-0x905fffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c4: resource 2 [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c5: resource 1 [mem 
0x90900000-0x909fffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c5: resource 2 [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c6: resource 1 [mem 
0x90600000-0x908fffff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: D0 power state 
depends on 0000:03:00.0
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: D0 power state 
depends on 0000:c4:00.0
May 13 21:22:23 archlinux kernel: PCI: CLS 64 bytes, default 64
May 13 21:22:23 archlinux kernel: pci 0000:00:00.2: AMD-Vi: IOMMU 
performance counters supported
May 13 21:22:23 archlinux kernel: pci 0000:00:01.0: Adding to iommu group 0
May 13 21:22:23 archlinux kernel: Trying to unpack rootfs image as 
initramfs...
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: Adding to iommu group 1
May 13 21:22:23 archlinux kernel: pci 0000:00:02.0: Adding to iommu group 2
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: Adding to iommu group 3
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: Adding to iommu group 4
May 13 21:22:23 archlinux kernel: pci 0000:00:03.0: Adding to iommu group 5
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: Adding to iommu group 5
May 13 21:22:23 archlinux kernel: pci 0000:00:04.0: Adding to iommu group 6
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: Adding to iommu group 6
May 13 21:22:23 archlinux kernel: pci 0000:00:08.0: Adding to iommu group 7
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: Adding to iommu group 8
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: Adding to iommu group 9
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: Adding to iommu group 10
May 13 21:22:23 archlinux kernel: pci 0000:00:14.0: Adding to iommu group 11
May 13 21:22:23 archlinux kernel: pci 0000:00:14.3: Adding to iommu group 11
May 13 21:22:23 archlinux kernel: pci 0000:00:18.0: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.1: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.2: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.3: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.4: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.5: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.6: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.7: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: Adding to iommu group 13
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: Adding to iommu group 14
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: Adding to iommu group 15
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: Adding to iommu group 16
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: Adding to iommu group 17
May 13 21:22:23 archlinux kernel: pci 0000:05:00.0: Adding to iommu group 18
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: Adding to iommu group 19
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: Adding to iommu group 20
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: Adding to iommu group 21
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: Adding to iommu group 22
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: Adding to iommu group 23
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: Adding to iommu group 24
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: Adding to iommu group 25
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: Adding to iommu group 26
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: Adding to iommu group 27
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.0: Adding to iommu group 28
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: Adding to iommu group 29
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: Adding to iommu group 30
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: Adding to iommu group 31
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: Adding to iommu group 32
May 13 21:22:23 archlinux kernel: AMD-Vi: Extended features 
(0x246577efa2054ada, 0x0): PPR NX GT IA GA PC
May 13 21:22:23 archlinux kernel: AMD-Vi: Interrupt remapping enabled
May 13 21:22:23 archlinux kernel: PCI-DMA: Using software bounce 
buffering for IO (SWIOTLB)
May 13 21:22:23 archlinux kernel: software IO TLB: mapped [mem 
0x000000003fd94000-0x0000000043d94000] (64MB)
May 13 21:22:23 archlinux kernel: LVT offset 0 assigned for vector 0x400
May 13 21:22:23 archlinux kernel: perf: AMD IBS detected (0x00000bff)
May 13 21:22:23 archlinux kernel: perf/amd_iommu: Detected AMD IOMMU #0 
(2 banks, 4 counters/bank).
May 13 21:22:23 archlinux kernel: Initialise system trusted keyrings
May 13 21:22:23 archlinux kernel: Key type blacklist registered
May 13 21:22:23 archlinux kernel: workingset: timestamp_bits=41 
max_order=24 bucket_order=0
May 13 21:22:23 archlinux kernel: zbud: loaded
May 13 21:22:23 archlinux kernel: integrity: Platform Keyring initialized
May 13 21:22:23 archlinux kernel: integrity: Machine keyring initialized
May 13 21:22:23 archlinux kernel: Key type asymmetric registered
May 13 21:22:23 archlinux kernel: Asymmetric key parser 'x509' registered
May 13 21:22:23 archlinux kernel: Block layer SCSI generic (bsg) driver 
version 0.4 loaded (major 242)
May 13 21:22:23 archlinux kernel: io scheduler mq-deadline registered
May 13 21:22:23 archlinux kernel: io scheduler kyber registered
May 13 21:22:23 archlinux kernel: io scheduler bfq registered
May 13 21:22:23 archlinux kernel: pcieport 0000:00:01.1: PME: Signaling 
with IRQ 38
May 13 21:22:23 archlinux kernel: pcieport 0000:00:01.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:22:23 archlinux kernel: pcieport 0000:00:02.2: PME: Signaling 
with IRQ 39
May 13 21:22:23 archlinux kernel: pcieport 0000:00:02.4: PME: Signaling 
with IRQ 40
May 13 21:22:23 archlinux kernel: pcieport 0000:00:03.1: PME: Signaling 
with IRQ 41
May 13 21:22:23 archlinux kernel: pcieport 0000:00:03.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:22:23 archlinux kernel: pcieport 0000:00:04.1: PME: Signaling 
with IRQ 42
May 13 21:22:23 archlinux kernel: pcieport 0000:00:04.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:22:23 archlinux kernel: pcieport 0000:00:08.1: PME: Signaling 
with IRQ 43
May 13 21:22:23 archlinux kernel: pcieport 0000:00:08.2: PME: Signaling 
with IRQ 44
May 13 21:22:23 archlinux kernel: pcieport 0000:00:08.3: PME: Signaling 
with IRQ 45
May 13 21:22:23 archlinux kernel: shpchp: Standard Hot Plug PCI 
Controller Driver version: 0.4
May 13 21:22:23 archlinux kernel: ACPI: AC: AC Adapter [ACAD] (on-line)
May 13 21:22:23 archlinux kernel: input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:4f/PNP0C09:00/PNP0C0D:00/input/input0
May 13 21:22:23 archlinux kernel: ACPI: button: Lid Switch [LID0]
May 13 21:22:23 archlinux kernel: input: Power Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
May 13 21:22:23 archlinux kernel: ACPI: button: Power Button [PWRB]
May 13 21:22:23 archlinux kernel: Estimated ratio of average max 
frequency by base frequency (times 1024): 1388
May 13 21:22:23 archlinux kernel: Monitor-Mwait will be used to enter 
C-1 state
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C000: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C001: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C002: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C003: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C004: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C005: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C006: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C007: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C008: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C009: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00A: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00B: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00C: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00D: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00E: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00F: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:00: registered as 
thermal_zone0
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ00] (45 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:01: registered as 
thermal_zone1
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ01] (47 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:02: registered as 
thermal_zone2
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ02] (49 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:03: registered as 
thermal_zone3
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ03] (79 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:04: registered as 
thermal_zone4
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ04] (37 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:05: registered as 
thermal_zone5
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ05] (37 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:06: registered as 
thermal_zone6
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ06] (37 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:07: registered as 
thermal_zone7
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ07] (0 C)
May 13 21:22:23 archlinux kernel: Serial: 8250/16550 driver, 32 ports, 
IRQ sharing enabled
May 13 21:22:23 archlinux kernel: ACPI: battery: Slot [BAT1] (battery 
present)
May 13 21:22:23 archlinux kernel: Non-volatile memory driver v1.3
May 13 21:22:23 archlinux kernel: Linux agpgart interface v0.103
May 13 21:22:23 archlinux kernel: Freeing initrd memory: 44416K
May 13 21:22:23 archlinux kernel: ACPI: bus type drm_connector registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [twl] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [twl6040] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [adp5520] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [crystal_cove_i2c] 
registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [CHT Whiskey Cove 
PMIC] registered
May 13 21:22:23 archlinux kernel: usbcore: registered new interface 
driver usbserial_generic
May 13 21:22:23 archlinux kernel: usbserial: USB Serial support 
registered for generic
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: RTC can wake from S4
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: registered as rtc0
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: setting system clock 
to 2024-05-14T02:22:23 UTC (1715653343)
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: alarms up to one 
month, 114 bytes nvram
May 13 21:22:23 archlinux kernel: ledtrig-cpu: registered to indicate 
activity on CPUs
May 13 21:22:23 archlinux kernel: [drm] Initialized simpledrm 1.0.0 
20200625 for simple-framebuffer.0 on minor 0
May 13 21:22:23 archlinux kernel: fbcon: Deferring console take-over
May 13 21:22:23 archlinux kernel: simple-framebuffer 
simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
May 13 21:22:23 archlinux kernel: hid: raw HID events driver (C) Jiri Kosina
May 13 21:22:23 archlinux kernel: i2c-core: driver [i2c_hid_acpi] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [i2c_hid_of] registered
May 13 21:22:23 archlinux kernel: drop_monitor: Initializing network 
drop monitor service
May 13 21:22:23 archlinux kernel: Initializing XFRM netlink socket
May 13 21:22:23 archlinux kernel: NET: Registered PF_INET6 protocol family
May 13 21:22:23 archlinux kernel: i2c_hid_acpi i2c-FRMW0003:00: probe
May 13 21:22:23 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: probe
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: Segment Routing with IPv6
May 13 21:22:23 archlinux kernel: RPL Segment Routing with IPv6
May 13 21:22:23 archlinux kernel: In-situ OAM (IOAM) with IPv6
May 13 21:22:23 archlinux kernel: NET: Registered PF_PACKET protocol family
May 13 21:22:23 archlinux kernel: microcode: Current revision: 0x0a704104
May 13 21:22:23 archlinux kernel: resctrl: L3 allocation detected
May 13 21:22:23 archlinux kernel: resctrl: MB allocation detected
May 13 21:22:23 archlinux kernel: resctrl: SMBA allocation detected
May 13 21:22:23 archlinux kernel: resctrl: L3 monitoring detected
May 13 21:22:23 archlinux kernel: IPI shorthand broadcast: enabled
May 13 21:22:23 archlinux kernel: sched_clock: Marking stable 
(651001927, 411081)->(654792400, -3379392)
May 13 21:22:23 archlinux kernel: Timer migration: 2 hierarchy levels; 8 
children per group; 2 crossnode level
May 13 21:22:23 archlinux kernel: registered taskstats version 1
May 13 21:22:23 archlinux kernel: Loading compiled-in X.509 certificates
May 13 21:22:23 archlinux kernel: Loaded X.509 cert 'Build time 
autogenerated kernel key: 161dd99ad2105d15c2e668632f302bd716d59ec5'
May 13 21:22:23 archlinux kernel: zswap: loaded using pool zstd/zsmalloc
May 13 21:22:23 archlinux kernel: Key type .fscrypt registered
May 13 21:22:23 archlinux kernel: Key type fscrypt-provisioning registered
May 13 21:22:23 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:22:23 archlinux kernel: integrity: Loaded X.509 cert 'Database 
Key: 00ce72b3aa39818d7d19c223fba64f8770'
May 13 21:22:23 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:22:23 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Corporation UEFI CA 2011: 
13adbf4309bd82709c8cd54f316ed522988a1bd4'
May 13 21:22:23 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:22:23 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Windows Production PCA 2011: 
a92902398e16c49778cd90f99e4f9ae17c55af53'
May 13 21:22:23 archlinux kernel: PM:   Magic number: 8:78:359
May 13 21:22:23 archlinux kernel: machinecheck machinecheck15: hash matches
May 13 21:22:23 archlinux kernel: acpi AMDI0063:00: hash matches
May 13 21:22:23 archlinux kernel: RAS: Correctable Errors collector 
initialized.
May 13 21:22:23 archlinux kernel: clk: Disabling unused clocks
May 13 21:22:23 archlinux kernel: PM: genpd: Disabling unused power domains
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x500
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: hid-generic 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:22:23 archlinux kernel: Freeing unused decrypted memory: 2028K
May 13 21:22:23 archlinux kernel: Freeing unused kernel image (initmem) 
memory: 3412K
May 13 21:22:23 archlinux kernel: Write protecting the kernel read-only 
data: 32768k
May 13 21:22:23 archlinux kernel: Freeing unused kernel image 
(rodata/data gap) memory: 836K
May 13 21:22:23 archlinux kernel: x86/mm: Checked W+X mappings: passed, 
no W+X pages found.
May 13 21:22:23 archlinux kernel: rodata_test: all tests were successful
May 13 21:22:23 archlinux kernel: Run /init as init process
May 13 21:22:23 archlinux kernel:   with arguments:
May 13 21:22:23 archlinux kernel:     /init
May 13 21:22:23 archlinux kernel:     splash
May 13 21:22:23 archlinux kernel:   with environment:
May 13 21:22:23 archlinux kernel:     HOME=/
May 13 21:22:23 archlinux kernel:     TERM=linux
May 13 21:22:23 archlinux systemd[1]: systemd 255.6-1-arch running in 
system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT 
+GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC 
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT 
default-hierarchy=unified)
May 13 21:22:23 archlinux systemd[1]: Detected architecture x86-64.
May 13 21:22:23 archlinux systemd[1]: Running in initrd.
May 13 21:22:23 archlinux systemd[1]: Initializing machine ID from 
random generator.
May 13 21:22:23 archlinux systemd[1]: Queued start job for default 
target Initrd Default Target.
May 13 21:22:23 archlinux systemd[1]: Created slice Slice 
/system/systemd-cryptsetup.
May 13 21:22:23 archlinux systemd[1]: Expecting device 
/dev/disk/by-uuid/496f2909-055b-49f7-9a43-b48647d757a9...
May 13 21:22:23 archlinux systemd[1]: Expecting device /dev/mapper/root...
May 13 21:22:23 archlinux systemd[1]: Reached target Slice Units.
May 13 21:22:23 archlinux systemd[1]: Reached target Swaps.
May 13 21:22:23 archlinux systemd[1]: Reached target Timer Units.
May 13 21:22:23 archlinux systemd[1]: Listening on Journal Socket 
(/dev/log).
May 13 21:22:23 archlinux systemd[1]: Listening on Journal Socket.
May 13 21:22:23 archlinux systemd[1]: Listening on udev Control Socket.
May 13 21:22:23 archlinux systemd[1]: Listening on udev Kernel Socket.
May 13 21:22:23 archlinux systemd[1]: Reached target Socket Units.
May 13 21:22:23 archlinux systemd[1]: Starting Create List of Static 
Device Nodes...
May 13 21:22:23 archlinux systemd[1]: Starting Journal Service...
May 13 21:22:23 archlinux systemd[1]: Starting Load Kernel Modules...
May 13 21:22:23 archlinux systemd[1]: Starting TPM2 PCR Barrier (initrd)...
May 13 21:22:23 archlinux systemd[1]: Starting Create Static Device 
Nodes in /dev...
May 13 21:22:23 archlinux systemd[1]: Starting Coldplug All udev Devices...
May 13 21:22:23 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:22:23 archlinux systemd[1]: Finished Create List of Static 
Device Nodes.
May 13 21:22:23 archlinux systemd-journald[201]: Collecting audit 
messages is disabled.
May 13 21:22:23 archlinux systemd[1]: Finished Create Static Device 
Nodes in /dev.
May 13 21:22:23 archlinux systemd[1]: Reached target Preparation for 
Local File Systems.
May 13 21:22:23 archlinux systemd[1]: Reached target Local File Systems.
May 13 21:22:23 archlinux systemd[1]: Starting Rule-based Manager for 
Device Events and Files...
May 13 21:22:23 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:22:23 archlinux systemd[1]: Started Rule-based Manager for 
Device Events and Files.
May 13 21:22:23 archlinux kernel: ACPI: video: Video Device [VGA] 
(multi-head: yes  rom: no  post: no)
May 13 21:22:23 archlinux kernel: input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1a/LNXVIDEO:00/input/input2
May 13 21:22:23 archlinux systemd-journald[201]: Journal started
May 13 21:22:23 archlinux systemd-journald[201]: Runtime Journal 
(/run/log/journal/f7353e9bdff648a29e5930fd55db0c2f) is 8.0M, max 1.1G, 
1.1G free.
May 13 21:22:23 archlinux systemd-vconsole-setup[207]: /usr/bin/setfont 
failed with a "system error" (EX_OSERR), ignoring.
May 13 21:22:23 archlinux systemd-vconsole-setup[207]: Setting source 
virtual console failed, ignoring remaining ones.
May 13 21:22:23 archlinux systemd-vconsole-setup[213]: setfont: ERROR 
kdfontop.c:183 put_font_kdfontop: Unable to load such font with such 
kernel version
May 13 21:22:23 archlinux systemd[1]: Started Journal Service.
May 13 21:22:23 archlinux systemd-pcrextend[203]: Extended PCR index 11 
with 'enter-initrd' (banks sha256).
May 13 21:22:23 archlinux systemd[1]: Finished Coldplug All udev Devices.
May 13 21:22:23 archlinux systemd[1]: Finished TPM2 PCR Barrier (initrd).
May 13 21:22:23 archlinux kernel: cryptd: max_cpu_qlen set to 1000
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 1
May 13 21:22:23 archlinux kernel: hid-sensor-hub 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: hcc params 
0x0128ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 2
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb1: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb1: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb1: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb1: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb1: SerialNumber: 0000:c4:00.3
May 13 21:22:23 archlinux kernel: hub 1-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 1-0:1.0: 5 ports detected
May 13 21:22:23 archlinux kernel: ccp 0000:c4:00.2: tee enabled
May 13 21:22:23 archlinux kernel: nvme 0000:05:00.0: platform quirk: 
setting simple suspend
May 13 21:22:23 archlinux kernel: nvme nvme0: pci function 0000:05:00.0
May 13 21:22:23 archlinux kernel: ccp 0000:c4:00.2: psp enabled
May 13 21:22:23 archlinux kernel: usb usb2: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb2: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb2: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb2: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb2: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb2: SerialNumber: 0000:c4:00.3
May 13 21:22:23 archlinux kernel: hub 2-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 2-0:1.0: 2 ports detected
May 13 21:22:23 archlinux kernel: AVX2 version of gcm_enc/dec engaged.
May 13 21:22:23 archlinux kernel: AES CTR mode by8 optimization enabled
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 3
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 4
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb3: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb3: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb3: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb3: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb3: SerialNumber: 0000:c4:00.4
May 13 21:22:23 archlinux kernel: hub 3-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 3-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: usb usb4: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb4: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb4: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb4: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb4: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb4: SerialNumber: 0000:c4:00.4
May 13 21:22:23 archlinux kernel: hub 4-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 4-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 5
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 6
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb5: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb5: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb5: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb5: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb5: SerialNumber: 0000:c6:00.3
May 13 21:22:23 archlinux kernel: hub 5-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 5-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: usb usb6: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb6: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb6: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb6: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb6: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb6: SerialNumber: 0000:c6:00.3
May 13 21:22:23 archlinux kernel: hub 6-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 6-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: nvme nvme0: D3 entry latency set to 10 
seconds
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 7
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 8
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb7: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb7: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb7: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb7: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb7: SerialNumber: 0000:c6:00.4
May 13 21:22:23 archlinux kernel: hub 7-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 7-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: usb usb8: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb8: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb8: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb8: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb8: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb8: SerialNumber: 0000:c6:00.4
May 13 21:22:23 archlinux kernel: hub 8-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 8-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: nvme nvme0: 16/0/0 default/read/poll 
queues
May 13 21:22:23 archlinux kernel:  nvme0n1: p1 p2
May 13 21:22:23 archlinux systemd[1]: Starting Show Plymouth Boot Screen...
May 13 21:22:23 archlinux systemd[1]: Received SIGRTMIN+20 from PID 277 
(plymouthd).
May 13 21:22:23 archlinux systemd[1]: Found device Samsung SSD 990 PRO 
4TB 2.
May 13 21:22:23 archlinux systemd[1]: Starting Cryptography Setup for 
root...
May 13 21:22:23 archlinux systemd[1]: systemd-vconsole-setup.service: 
Deactivated successfully.
May 13 21:22:23 archlinux systemd[1]: Stopped Virtual Console Setup.
May 13 21:22:23 archlinux systemd[1]: Stopping Virtual Console Setup...
May 13 21:22:23 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:22:23 archlinux systemd-vconsole-setup[284]: setfont: ERROR 
kdfontop.c:183 put_font_kdfontop: Unable to load such font with such 
kernel version
May 13 21:22:23 archlinux systemd-vconsole-setup[281]: /usr/bin/setfont 
failed with a "system error" (EX_OSERR), ignoring.
May 13 21:22:23 archlinux systemd[1]: Received SIGRTMIN+20 from PID 277 
(plymouthd).
May 13 21:22:23 archlinux systemd[1]: Started Show Plymouth Boot Screen.
May 13 21:22:23 archlinux systemd[1]: Dispatch Password Requests to 
Console Directory Watch was skipped because of an unmet condition check 
(ConditionPathExists=!/run/plymouth/pid).
May 13 21:22:23 archlinux systemd[1]: Started Forward Password Requests 
to Plymouth Directory Watch.
May 13 21:22:23 archlinux systemd[1]: Reached target Path Units.
May 13 21:22:23 archlinux systemd-vconsole-setup[281]: Setting source 
virtual console failed, ignoring remaining ones.
May 13 21:22:23 archlinux systemd[1]: Starting Check battery level 
during early boot...
May 13 21:22:23 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:22:23 archlinux systemd[1]: Finished Check battery level 
during early boot.
May 13 21:22:23 archlinux systemd[1]: Started Displays emergency message 
in full screen..
May 13 21:22:23 archlinux kernel: device-mapper: uevent: version 1.0.3
May 13 21:22:23 archlinux kernel: device-mapper: ioctl: 4.48.0-ioctl 
(2023-03-01) initialised: dm-devel@lists.linux.dev
May 13 21:22:24 archlinux kernel: usb 1-2: new high-speed USB device 
number 2 using xhci_hcd
May 13 21:22:24 archlinux kernel: tsc: Refined TSC clocksource 
calibration: 3992.499 MHz
May 13 21:22:24 archlinux kernel: clocksource: tsc: mask: 
0xffffffffffffffff max_cycles: 0x73195d51b0d, max_idle_ns: 881590506186 ns
May 13 21:22:24 archlinux kernel: clocksource: Switched to clocksource tsc
May 13 21:22:24 archlinux kernel: usb 1-2: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=34.04
May 13 21:22:24 archlinux kernel: usb 1-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:22:24 archlinux kernel: usb 1-2: Product: USB2.1 Hub
May 13 21:22:24 archlinux kernel: usb 1-2: Manufacturer: GenesysLogic
May 13 21:22:24 archlinux kernel: hub 1-2:1.0: USB hub found
May 13 21:22:24 archlinux kernel: hub 1-2:1.0: 4 ports detected
May 13 21:22:24 archlinux kernel: usb 2-2: new SuperSpeed Plus Gen 2x1 
USB device number 2 using xhci_hcd
May 13 21:22:24 archlinux kernel: usb 2-2: New USB device found, 
idVendor=05e3, idProduct=0625, bcdDevice=34.04
May 13 21:22:24 archlinux kernel: usb 2-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:22:24 archlinux kernel: usb 2-2: Product: USB3.2 Hub
May 13 21:22:24 archlinux kernel: usb 2-2: Manufacturer: GenesysLogic
May 13 21:22:24 archlinux kernel: hub 2-2:1.0: USB hub found
May 13 21:22:24 archlinux kernel: hub 2-2:1.0: 3 ports detected
May 13 21:22:24 archlinux kernel: usb 1-3: new high-speed USB device 
number 3 using xhci_hcd
May 13 21:22:24 archlinux kernel: [drm] amdgpu kernel modesetting enabled.
May 13 21:22:24 archlinux kernel: amdgpu: vga_switcheroo: detected 
switching method \_SB_.PCI0.GP17.VGA_.ATPX handle
May 13 21:22:24 archlinux kernel: amdgpu: ATPX version 1, functions 
0x00000801
May 13 21:22:24 archlinux kernel: amdgpu: ATPX Hybrid Graphics
May 13 21:22:24 archlinux kernel: Key type trusted registered
May 13 21:22:24 archlinux kernel: amdgpu: Virtual CRAT table created for CPU
May 13 21:22:24 archlinux kernel: amdgpu: Topology: Add CPU node
May 13 21:22:24 archlinux kernel: amdgpu 0000:03:00.0: enabling device 
(0000 -> 0003)
May 13 21:22:24 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x7480 0xF111:0x0007 0xC1).
May 13 21:22:24 archlinux kernel: [drm] register mmio base: 0x90C00000
May 13 21:22:24 archlinux kernel: [drm] register mmio size: 1048576
May 13 21:22:24 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:22:24 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ACPI VFCT 
table present but broken (too short #2),skipping
May 13 21:22:24 archlinux kernel: [drm] BIOS signature incorrect ee a3
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Fetched 
VBIOS from ROM BAR
May 13 21:22:25 archlinux kernel: amdgpu: ATOM BIOS: 113-BRT125778.001
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: CP RS64 
enable
May 13 21:22:25 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature not supported
May 13 21:22:25 archlinux kernel: [drm] GPU posting now...
May 13 21:22:25 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: VRAM: 
8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:22:25 archlinux kernel: [drm] Detected VRAM RAM=8176M, BAR=8192M
May 13 21:22:25 archlinux kernel: [drm] RAM width 128bits GDDR6
May 13 21:22:25 archlinux kernel: [drm] amdgpu: 8176M of VRAM memory ready
May 13 21:22:25 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:22:25 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:22:25 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000081FEB00000).
May 13 21:22:25 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x07002800
May 13 21:22:25 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:22:25 archlinux kernel: usb 1-3: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:22:25 archlinux kernel: usb 1-3: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:22:25 archlinux kernel: usb 1-3: Product: USB2.0 Hub
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: reserve 
0x1300000 from 0x81fc000000 for PSP TMR
May 13 21:22:25 archlinux kernel: hub 1-3:1.0: USB hub found
May 13 21:22:25 archlinux kernel: hub 1-3:1.0: 3 ports detected
May 13 21:22:25 archlinux kernel: usb 1-2.1: new low-speed USB device 
number 4 using xhci_hcd
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:22:25 archlinux kernel: Key type encrypted registered
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: smu 
driver if version = 0x00000035, smu fw if version = 0x00000040, smu fw 
program = 0, smu fw version = 0x00525800 (82.88.0)
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU 
driver if version not matched
May 13 21:22:25 archlinux systemd[1]: Found device /dev/mapper/root.
May 13 21:22:25 archlinux systemd[1]: Finished Cryptography Setup for root.
May 13 21:22:25 archlinux systemd[1]: Reached target Local Encrypted 
Volumes.
May 13 21:22:25 archlinux systemd[1]: Reached target Initrd Root Device.
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: [drm] Unsupported 
pwrseq engine id: 2!
May 13 21:22:25 archlinux kernel: ------------[ cut here ]------------
May 13 21:22:25 archlinux kernel: WARNING: CPU: 6 PID: 202 at 
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:22:25 archlinux kernel: Modules linked in: dm_crypt 
crct10dif_pclmul cbc crc32_pclmul crc32c_intel polyval_clmulni 
encrypted_keys polyval_generic gf128mul trusted ghash_clmulni_intel 
sha512_ssse3 asn1_encoder tee sha256_ssse3 dm_mod sha1_ssse3 aesni_intel 
nvme crypto_simd cryptd hid_sensor_hub xhci_pci ccp nvme_core 
xhci_pci_renesas amdgpu(+) video wmi amdxcp i2c_algo_bit drm_ttm_helper 
ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy drm_display_helper cec
May 13 21:22:25 archlinux kernel: CPU: 6 PID: 202 Comm: systemd-modules 
Not tainted 6.9.0-1-git-01560-ga7c840ba5fa7 #1 
96970f0beb2353c3fc8dc8c8e87ebf0f642b2644
May 13 21:22:25 archlinux kernel: Hardware name: Framework Laptop 16 
(AMD Ryzen 7040 Series)/FRANMZCP09, BIOS 03.03 03/27/2024
May 13 21:22:25 archlinux kernel: RIP: 
0010:dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:22:25 archlinux kernel: Code: b8 15 ef c0 e8 01 f6 85 f3 e9 2d 
89 f5 ff 48 8b 40 10 48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c7 c6 08 16 
ef c0 e8 e0 f5 85 f3 <0f> 0b ba 0f 00 00 00 e9 f5 8d f5 ff 48 8b 43 08 
48 8b 40 10 48 8b
May 13 21:22:25 archlinux kernel: RSP: 0018:ffffac484062f058 EFLAGS: 
00010246
May 13 21:22:25 archlinux kernel: RAX: 0000000000000000 RBX: 
ffff908114c7ac00 RCX: 0000000000000027
May 13 21:22:25 archlinux kernel: RDX: 0000000000000000 RSI: 
0000000000000001 RDI: ffff908f61d219c0
May 13 21:22:25 archlinux kernel: RBP: ffffac484062f090 R08: 
0000000000000000 R09: ffffac484062edd0
May 13 21:22:25 archlinux kernel: R10: ffffffffb54b2388 R11: 
0000000000000003 R12: ffff908107cb0800
May 13 21:22:25 archlinux kernel: R13: ffffffffc0d94940 R14: 
ffffac484062f448 R15: ffff90810dd55000
May 13 21:22:25 archlinux kernel: FS:  00007f816cae3640(0000) 
GS:ffff908f61d00000(0000) knlGS:0000000000000000
May 13 21:22:25 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
May 13 21:22:25 archlinux kernel: CR2: 000055ab69724788 CR3: 
0000000105462000 CR4: 0000000000f50ef0
May 13 21:22:25 archlinux kernel: PKRU: 55555554
May 13 21:22:25 archlinux kernel: Call Trace:
May 13 21:22:25 archlinux kernel:  <TASK>
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? __warn.cold+0x8e/0xe8
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? report_bug+0xff/0x140
May 13 21:22:25 archlinux kernel:  ? handle_bug+0x3c/0x80
May 13 21:22:25 archlinux kernel:  ? exc_invalid_op+0x17/0x70
May 13 21:22:25 archlinux kernel:  ? asm_exc_invalid_op+0x1a/0x20
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel: dcn32_panel_cntl_create+0x37/0x50 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  construct_phy+0x951/0xc10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? __alloc_pages+0x182/0x350
May 13 21:22:25 archlinux kernel:  link_create+0x1ba/0x200 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  create_links+0x134/0x420 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  dc_create+0x316/0x650 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel: amdgpu_dm_init.isra.0+0x32b/0x1d90 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? vprintk_emit+0x176/0x2a0
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? dev_vprintk_emit+0x181/0x1b0
May 13 21:22:25 archlinux kernel:  ? 
smu_cmn_send_smc_msg_with_param+0x21b/0x340 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  dm_hw_init+0x12/0x30 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel: amdgpu_device_init.cold+0x1ad3/0x20fb 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel: amdgpu_driver_load_kms+0x19/0x110 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  amdgpu_pci_probe+0x187/0x400 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  local_pci_probe+0x42/0x90
May 13 21:22:25 archlinux kernel:  pci_device_probe+0xbd/0x290
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? sysfs_do_create_link_sd+0x6e/0xe0
May 13 21:22:25 archlinux kernel:  really_probe+0xdb/0x340
May 13 21:22:25 archlinux kernel:  ? pm_runtime_barrier+0x54/0x90
May 13 21:22:25 archlinux kernel:  ? __pfx___driver_attach+0x10/0x10
May 13 21:22:25 archlinux kernel: __driver_probe_device+0x78/0x110
May 13 21:22:25 archlinux kernel:  driver_probe_device+0x1f/0xa0
May 13 21:22:25 archlinux kernel:  __driver_attach+0xba/0x1c0
May 13 21:22:25 archlinux kernel:  bus_for_each_dev+0x8c/0xe0
May 13 21:22:25 archlinux kernel:  bus_add_driver+0x116/0x1f0
May 13 21:22:25 archlinux kernel:  driver_register+0x72/0xd0
May 13 21:22:25 archlinux kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  do_one_initcall+0x58/0x310
May 13 21:22:25 archlinux kernel:  do_init_module+0x60/0x220
May 13 21:22:25 archlinux kernel:  init_module_from_file+0x89/0xe0
May 13 21:22:25 archlinux kernel: idempotent_init_module+0x121/0x2b0
May 13 21:22:25 archlinux kernel: __x64_sys_finit_module+0x5e/0xb0
May 13 21:22:25 archlinux kernel:  do_syscall_64+0x82/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? generic_update_time+0x4e/0x60
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? touch_atime+0xb5/0x120
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? filemap_read+0x343/0x370
May 13 21:22:25 archlinux kernel:  ? vfs_read+0x2a2/0x360
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? vfs_read+0x2a2/0x360
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel: entry_SYSCALL_64_after_hwframe+0x76/0x7e
May 13 21:22:25 archlinux kernel: RIP: 0033:0x7f816d59ee9d
May 13 21:22:25 archlinux kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 de 0c 00 
f7 d8 64 89 01 48
May 13 21:22:25 archlinux kernel: RSP: 002b:00007ffe7c38adb8 EFLAGS: 
00000246 ORIG_RAX: 0000000000000139
May 13 21:22:25 archlinux kernel: RAX: ffffffffffffffda RBX: 
000055975168a440 RCX: 00007f816d59ee9d
May 13 21:22:25 archlinux kernel: RDX: 0000000000000004 RSI: 
00007f816d6b8376 RDI: 0000000000000011
May 13 21:22:25 archlinux kernel: RBP: 00007f816d6b8376 R08: 
00007f816d66db20 R09: 00007ffe7c38ae00
May 13 21:22:25 archlinux kernel: R10: 000055975168f610 R11: 
0000000000000246 R12: 0000000000020000
May 13 21:22:25 archlinux kernel: R13: 000055975168a8e0 R14: 
0000000000000000 R15: 000055975168f5d0
May 13 21:22:25 archlinux kernel:  </TASK>
May 13 21:22:25 archlinux kernel: ---[ end trace 0000000000000000 ]---
May 13 21:22:25 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.2.1
May 13 21:22:25 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:22:25 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x07002800
May 13 21:22:25 archlinux systemd[1]: Starting File System Check on 
/dev/mapper/root...
May 13 21:22:25 archlinux kernel: usb 1-2.1: New USB device found, 
idVendor=046d, idProduct=c019, bcdDevice=43.01
May 13 21:22:25 archlinux kernel: usb 1-2.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:22:25 archlinux kernel: usb 1-2.1: Product: USB Optical Mouse
May 13 21:22:25 archlinux kernel: usb 1-2.1: Manufacturer: Logitech
May 13 21:22:25 archlinux systemd-fsck[330]: artemisfs: clean, 
1408603/244129792 files, 524325451/976487936 blocks
May 13 21:22:25 archlinux systemd[1]: Finished File System Check on 
/dev/mapper/root.
May 13 21:22:25 archlinux systemd[1]: Mounting /sysroot...
May 13 21:22:25 archlinux kernel: input: Logitech USB Optical Mouse as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-2/1-2.1/1-2.1:1.0/0003:046D:C019.0002/input/input3
May 13 21:22:25 archlinux kernel: hid-generic 0003:046D:C019.0002: 
input,hidraw1: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on 
usb-0000:c4:00.3-2.1/input0
May 13 21:22:25 archlinux kernel: usbcore: registered new interface 
driver usbhid
May 13 21:22:25 archlinux kernel: usbhid: USB HID core driver
May 13 21:22:25 archlinux kernel: usb 1-4: new high-speed USB device 
number 5 using xhci_hcd
May 13 21:22:25 archlinux systemd[1]: Mounted /sysroot.
May 13 21:22:25 archlinux systemd[1]: Reached target Initrd Root File 
System.
May 13 21:22:25 archlinux kernel: EXT4-fs (dm-0): orphan cleanup on 
readonly fs
May 13 21:22:25 archlinux kernel: EXT4-fs (dm-0): mounted filesystem 
fc8e5470-776d-4f4b-bc64-89a425bea162 ro with ordered data mode. Quota 
mode: none.
May 13 21:22:25 archlinux systemd[1]: Starting Mountpoints Configured in 
the Real Root...
May 13 21:22:25 archlinux systemd[1]: initrd-parse-etc.service: 
Deactivated successfully.
May 13 21:22:25 archlinux systemd[1]: Finished Mountpoints Configured in 
the Real Root.
May 13 21:22:25 archlinux systemd[1]: Reached target Initrd File Systems.
May 13 21:22:25 archlinux kernel: usb 1-4: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:22:25 archlinux kernel: usb 1-4: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:22:25 archlinux kernel: usb 1-4: Product: USB2.0 Hub
May 13 21:22:25 archlinux kernel: hub 1-4:1.0: USB hub found
May 13 21:22:25 archlinux kernel: hub 1-4:1.0: 4 ports detected
May 13 21:22:25 archlinux kernel: usb 1-3.2: new full-speed USB device 
number 6 using xhci_hcd
May 13 21:22:25 archlinux kernel: usb 1-3.2: unable to get BOS 
descriptor set
May 13 21:22:25 archlinux kernel: usb 1-3.2: New USB device found, 
idVendor=32ac, idProduct=0014, bcdDevice= 0.29
May 13 21:22:25 archlinux kernel: usb 1-3.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:22:25 archlinux kernel: usb 1-3.2: Product: Laptop 16 Numpad 
Module
May 13 21:22:25 archlinux kernel: usb 1-3.2: Manufacturer: Framework
May 13 21:22:25 archlinux kernel: usb 1-3.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:22:25 archlinux kernel: i2c i2c-2: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:22:25 archlinux kernel: usb 1-5: new high-speed USB device 
number 7 using xhci_hcd
May 13 21:22:25 archlinux kernel: input: Framework Laptop 16 Numpad 
Module as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.0/0003:32AC:0014.0003/input/input4
May 13 21:22:25 archlinux kernel: usb 1-5: New USB device found, 
idVendor=0e8d, idProduct=e616, bcdDevice= 1.00
May 13 21:22:25 archlinux kernel: usb 1-5: New USB device strings: 
Mfr=5, Product=6, SerialNumber=7
May 13 21:22:25 archlinux kernel: usb 1-5: Product: Wireless_Device
May 13 21:22:25 archlinux kernel: usb 1-5: Manufacturer: MediaTek Inc.
May 13 21:22:25 archlinux kernel: usb 1-5: SerialNumber: 000000000
May 13 21:22:25 archlinux kernel: hid-generic 0003:32AC:0014.0003: 
input,hidraw2: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input0
May 13 21:22:25 archlinux kernel: hid-generic 0003:32AC:0014.0004: 
hiddev96,hidraw3: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input1
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input5
May 13 21:22:26 archlinux kernel: usb 1-4.1: new full-speed USB device 
number 8 using xhci_hcd
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input6
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input7
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input8
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0014.0005: 
input,hidraw4: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input2
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0014.0006: 
hiddev97,hidraw5: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input3
May 13 21:22:26 archlinux kernel: usb 1-4.1: New USB device found, 
idVendor=27c6, idProduct=609c, bcdDevice= 1.00
May 13 21:22:26 archlinux kernel: usb 1-4.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:22:26 archlinux kernel: usb 1-4.1: Product: Goodix Fingerprint 
USB Device
May 13 21:22:26 archlinux kernel: usb 1-4.1: Manufacturer: Goodix 
Technology Co., Ltd.
May 13 21:22:26 archlinux kernel: usb 1-4.1: SerialNumber: 
UIDCBAC4037_XXXX_MOC_B0
May 13 21:22:26 archlinux kernel: usb 1-4.2: new full-speed USB device 
number 9 using xhci_hcd
May 13 21:22:26 archlinux kernel: usb 1-4.2: unable to get BOS 
descriptor set
May 13 21:22:26 archlinux kernel: usb 1-4.2: New USB device found, 
idVendor=32ac, idProduct=0012, bcdDevice= 0.29
May 13 21:22:26 archlinux kernel: usb 1-4.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:22:26 archlinux kernel: usb 1-4.2: Product: Laptop 16 Keyboard 
Module - ANSI
May 13 21:22:26 archlinux kernel: usb 1-4.2: Manufacturer: Framework
May 13 21:22:26 archlinux kernel: usb 1-4.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.0/0003:32AC:0012.0007/input/input9
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.0007: 
input,hidraw6: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input0
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.0008: 
hiddev98,hidraw7: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input1
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input10
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input11
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input12
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input13
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.0009: 
input,hidraw8: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input2
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.000A: 
hiddev99,hidraw9: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input3
May 13 21:22:27 archlinux kernel: i2c i2c-3: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:22:27 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:22:27 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:22:27 archlinux kernel: amdgpu: HMM registered 8176MB device 
memory
May 13 21:22:27 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:22:27 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:22:27 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:22:27 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x7480:0x1002]
May 13 21:22:27 archlinux kernel: kfd kfd: amdgpu: added device 1002:7480
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SE 2, SH 
per SE 2, CU per SH 8, active_cu_number 32
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma1 uses VM inv eng 13 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
May 13 21:22:27 archlinux kernel: [drm] ring gfx_32768.1.1 was added
May 13 21:22:27 archlinux kernel: [drm] ring compute_32768.2.2 was added
May 13 21:22:27 archlinux kernel: [drm] ring sdma_32768.3.3 was added
May 13 21:22:27 archlinux kernel: [drm] ring gfx_32768.1.1 ib test pass
May 13 21:22:27 archlinux kernel: [drm] ring compute_32768.2.2 ib test pass
May 13 21:22:27 archlinux kernel: [drm] ring sdma_32768.3.3 ib test pass
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Using 
BOCO for runtime pm
May 13 21:22:27 archlinux kernel: i2c i2c-4: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:22:27 archlinux kernel: i2c i2c-5: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:22:27 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:03:00.0 on minor 1
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: [drm] Cannot find 
any crtc or sizes
May 13 21:22:27 archlinux kernel: [drm] DSC precompute is not needed.
May 13 21:22:27 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x15BF 0xF111:0x0005 0xC1).
May 13 21:22:27 archlinux kernel: [drm] register mmio base: 0x90500000
May 13 21:22:27 archlinux kernel: [drm] register mmio size: 524288
May 13 21:22:27 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Fetched 
VBIOS from VFCT
May 13 21:22:27 archlinux kernel: amdgpu: ATOM BIOS: 113-PHXGENERIC-001
May 13 21:22:27 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: vgaarb: 
deactivate vga console
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature enabled
May 13 21:22:27 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: VRAM: 
4096M 0x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:22:27 archlinux kernel: [drm] Detected VRAM RAM=4096M, BAR=4096M
May 13 21:22:27 archlinux kernel: [drm] RAM width 128bits DDR5
May 13 21:22:27 archlinux kernel: [drm] amdgpu: 4096M of VRAM memory ready
May 13 21:22:27 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:22:27 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:22:27 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000080FFD00000).
May 13 21:22:27 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x08003700
May 13 21:22:27 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: reserve 
0x4000000 from 0x80f8000000 for PSP TMR
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:22:28 archlinux kernel: [drm] Seamless boot condition check passed
May 13 21:22:28 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.1.4
May 13 21:22:28 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:22:28 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x08003700
May 13 21:22:28 archlinux kernel: i2c i2c-6: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:22:28 archlinux kernel: [drm] PSR support 1, DC PSR ver 0, 
sink PSR ver 1 DPCD caps 0x2a su_y_granularity 0
May 13 21:22:28 archlinux kernel: i2c i2c-7: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:22:28 archlinux kernel: i2c i2c-8: adapter [AMDGPU DM i2c hw 
bus 2] registered
May 13 21:22:28 archlinux kernel: i2c i2c-9: adapter [AMDGPU DM i2c hw 
bus 3] registered
May 13 21:22:28 archlinux kernel: i2c i2c-10: adapter [AMDGPU DM i2c hw 
bus 4] registered
May 13 21:22:28 archlinux kernel: i2c i2c-11: adapter [AMDGPU DM i2c hw 
bus 5] registered
May 13 21:22:28 archlinux kernel: i2c i2c-12: adapter [AMDGPU DM i2c hw 
bus 6] registered
May 13 21:22:28 archlinux kernel: i2c i2c-13: adapter [AMDGPU DM i2c hw 
bus 7] registered
May 13 21:22:28 archlinux kernel: i2c i2c-14: adapter [AMDGPU DM i2c hw 
bus 8] registered
May 13 21:22:28 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:22:28 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:22:28 archlinux kernel: amdgpu: HMM registered 4096MB device 
memory
May 13 21:22:28 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:22:28 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:22:28 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:22:28 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x15bf:0x1002]
May 13 21:22:28 archlinux kernel: kfd kfd: amdgpu: added device 1002:15bf
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SE 1, SH 
per SE 2, CU per SH 6, active_cu_number 12
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
May 13 21:22:28 archlinux kernel: [drm] ring gfx_32770.1.1 was added
May 13 21:22:28 archlinux kernel: [drm] ring compute_32770.2.2 was added
May 13 21:22:28 archlinux kernel: [drm] ring sdma_32770.3.3 was added
May 13 21:22:28 archlinux kernel: [drm] ring gfx_32770.1.1 ib test pass
May 13 21:22:28 archlinux kernel: [drm] ring compute_32770.2.2 ib test pass
May 13 21:22:28 archlinux kernel: [drm] ring sdma_32770.3.3 ib test pass
May 13 21:22:28 archlinux kernel: i2c i2c-15: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:22:28 archlinux kernel: i2c i2c-16: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:22:28 archlinux kernel: i2c i2c-17: adapter [AMDGPU DM aux hw 
bus 2] registered
May 13 21:22:28 archlinux kernel: i2c i2c-18: adapter [AMDGPU DM aux hw 
bus 3] registered
May 13 21:22:28 archlinux kernel: i2c i2c-19: adapter [AMDGPU DM aux hw 
bus 4] registered
May 13 21:22:28 archlinux kernel: i2c i2c-20: adapter [AMDGPU DM aux hw 
bus 5] registered
May 13 21:22:28 archlinux kernel: i2c i2c-21: adapter [AMDGPU DM aux hw 
bus 6] registered
May 13 21:22:28 archlinux kernel: i2c i2c-22: adapter [AMDGPU DM aux hw 
bus 7] registered
May 13 21:22:28 archlinux kernel: i2c i2c-23: adapter [AMDGPU DM aux hw 
bus 8] registered
May 13 21:22:28 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:c4:00.0 on minor 2
May 13 21:22:28 archlinux kernel: fbcon: amdgpudrmfb (fb0) is primary device
May 13 21:22:28 archlinux kernel: fbcon: Deferring console take-over
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] fb0: 
amdgpudrmfb frame buffer device
May 13 21:22:28 archlinux systemd-modules-load[202]: Inserted module 
'amdgpu'
May 13 21:22:28 archlinux systemd-modules-load[202]: Module 'tpm_crb' is 
built in
May 13 21:22:28 archlinux systemd[1]: Finished Load Kernel Modules.
May 13 21:22:28 archlinux systemd[1]: Reached target System Initialization.
May 13 21:22:28 archlinux systemd[1]: Reached target Basic System.
May 13 21:22:28 archlinux systemd[1]: Reached target Initrd Default Target.
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:223
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:231
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:239
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:247
May 13 21:22:28 archlinux systemd[1]: Starting Cleaning Up and Shutting 
Down Daemons...
May 13 21:22:28 archlinux systemd[1]: Stopped target Initrd Default Target.
May 13 21:22:28 archlinux systemd[1]: Stopped target Basic System.
May 13 21:22:28 archlinux systemd[1]: Stopped target Initrd Root Device.
May 13 21:22:28 archlinux systemd[1]: Stopped target Path Units.
May 13 21:22:28 archlinux systemd[1]: Stopped target Slice Units.
May 13 21:22:28 archlinux systemd[1]: Stopped target Socket Units.
May 13 21:22:28 archlinux systemd[1]: Stopped target System Initialization.
May 13 21:22:28 archlinux systemd[1]: Stopped target Local Encrypted 
Volumes.
May 13 21:22:28 archlinux systemd[1]: Stopped target Local File Systems.
May 13 21:22:28 archlinux systemd[1]: Stopped target Preparation for 
Local File Systems.
May 13 21:22:28 archlinux systemd[1]: Stopped target Swaps.
May 13 21:22:28 archlinux systemd[1]: Stopped target Timer Units.
May 13 21:22:28 archlinux systemd[1]: kmod-static-nodes.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Create List of Static 
Device Nodes.
May 13 21:22:28 archlinux systemd[1]: Starting Plymouth switch root 
service...
May 13 21:22:28 archlinux systemd[1]: Stopping Displays emergency 
message in full screen....
May 13 21:22:28 archlinux systemd[1]: systemd-modules-load.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Load Kernel Modules.
May 13 21:22:28 archlinux systemd[1]: systemd-modules-load.service: 
Consumed 1.613s CPU time.
May 13 21:22:28 archlinux systemd[1]: Stopping TPM2 PCR Barrier (initrd)...
May 13 21:22:28 archlinux systemd[1]: systemd-udev-trigger.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Coldplug All udev Devices.
May 13 21:22:28 archlinux systemd[1]: Stopping Rule-based Manager for 
Device Events and Files...
May 13 21:22:28 archlinux systemd[1]: systemd-bsod.service: Deactivated 
successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Displays emergency message 
in full screen..
May 13 21:22:28 archlinux systemd[1]: initrd-cleanup.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Finished Cleaning Up and Shutting 
Down Daemons.
May 13 21:22:28 archlinux systemd[1]: systemd-battery-check.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Check battery level during 
early boot.
May 13 21:22:28 archlinux systemd[1]: systemd-udevd.service: Deactivated 
successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Rule-based Manager for 
Device Events and Files.
May 13 21:22:28 archlinux systemd[1]: systemd-udevd-control.socket: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Closed udev Control Socket.
May 13 21:22:28 archlinux systemd[1]: systemd-udevd-kernel.socket: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Closed udev Kernel Socket.
May 13 21:22:28 archlinux systemd[1]: Starting Cleanup udev Database...
May 13 21:22:28 archlinux systemd[1]: 
systemd-tmpfiles-setup-dev.service: Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Create Static Device Nodes 
in /dev.
May 13 21:22:28 archlinux systemd-pcrextend[382]: Extended PCR index 11 
with 'leave-initrd' (banks sha256).
May 13 21:22:28 archlinux systemd[1]: systemd-pcrphase-initrd.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped TPM2 PCR Barrier (initrd).
May 13 21:22:28 archlinux systemd[1]: initrd-udevadm-cleanup-db.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Finished Cleanup udev Database.
May 13 21:22:28 archlinux systemd[1]: Reached target Switch Root.
May 13 21:22:29 archlinux kernel: fbcon: Taking over console
May 13 21:22:29 archlinux kernel: Console: switching to colour frame 
buffer device 160x50
May 13 21:22:29 archlinux systemd[1]: Finished Plymouth switch root service.
May 13 21:22:29 archlinux systemd[1]: Starting Switch Root...
May 13 21:22:29 archlinux systemd[1]: Switching root.
May 13 21:22:29 archlinux systemd-journald[201]: Journal stopped
May 13 21:22:23 archlinux kernel: Linux version 
6.9.0-1-git-01560-ga7c840ba5fa7 (linux-git@archlinux) (gcc (GCC) 14.1.1 
20240507, GNU ld (GNU Binutils) 2.42.0) #1 SMP PREEMPT_DYNAMIC Tue, 14 
May 2024 01:49:25 +0000
May 13 21:22:23 archlinux kernel: Command line: 
rd.luks.name=496f2909-055b-49f7-9a43-b48647d757a9=root 
rd.luks.options=discard root=/dev/mapper/root quiet loglevel=3 
systemd.show_status=auto rd.udev.log_level=3 splash
May 13 21:22:23 archlinux kernel: BIOS-provided physical RAM map:
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000000000000-0x000000000009efff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000000009f000-0x00000000000bffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000000100000-0x0000000009afffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009b00000-0x0000000009dfffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009e00000-0x0000000009efffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000009f3c000-0x0000000049b5ffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000049b60000-0x000000004bd5ffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd60000-0x000000004bd68fff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd69000-0x000000004bd6cfff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd6d000-0x000000004bd6efff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd6f000-0x000000004bd6ffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000004bd70000-0x0000000057f7efff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000057f7f000-0x000000005a77efff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005a77f000-0x000000005af7efff] ACPI NVS
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005af7f000-0x000000005affefff] ACPI data
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005afff000-0x000000005affffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005b000000-0x000000005bffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005d790000-0x000000005d7effff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x000000005d7f5000-0x000000005fffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000c0300000-0x00000000c03fffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000e0000000-0x00000000efffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fec00000-0x00000000fec01fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fec10000-0x00000000fec10fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fec20000-0x00000000fec20fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fed80000-0x00000000fed81fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000fee00000-0x00000000fee00fff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x00000000ff000000-0x00000000ffffffff] reserved
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000100000000-0x0000000f9e2fffff] usable
May 13 21:22:23 archlinux kernel: BIOS-e820: [mem 
0x0000000fa0000000-0x00000010c01fffff] reserved
May 13 21:22:23 archlinux kernel: NX (Execute Disable) protection: active
May 13 21:22:23 archlinux kernel: APIC: Static calls initialized
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x4bd74018-0x4bd78257] usable ==> usable
May 13 21:22:23 archlinux kernel: extended physical RAM map:
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000000000000-0x000000000009efff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000000009f000-0x00000000000bffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000000100000-0x0000000009afffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009b00000-0x0000000009dfffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009e00000-0x0000000009efffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000009f3c000-0x0000000049b5ffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000049b60000-0x000000004bd5ffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd60000-0x000000004bd68fff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd69000-0x000000004bd6cfff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd6d000-0x000000004bd6efff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd6f000-0x000000004bd6ffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd70000-0x000000004bd74017] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd74018-0x000000004bd78257] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000004bd78258-0x0000000057f7efff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000057f7f000-0x000000005a77efff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005a77f000-0x000000005af7efff] ACPI NVS
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005af7f000-0x000000005affefff] ACPI data
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005afff000-0x000000005affffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005b000000-0x000000005bffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005d790000-0x000000005d7effff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x000000005d7f5000-0x000000005fffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000c0300000-0x00000000c03fffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000e0000000-0x00000000efffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fec00000-0x00000000fec01fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fec10000-0x00000000fec10fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fec20000-0x00000000fec20fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fed80000-0x00000000fed81fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000fee00000-0x00000000fee00fff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x00000000ff000000-0x00000000ffffffff] reserved
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000100000000-0x0000000f9e2fffff] usable
May 13 21:22:23 archlinux kernel: reserve setup_data: [mem 
0x0000000fa0000000-0x00000010c01fffff] reserved
May 13 21:22:23 archlinux kernel: efi: EFI v2.9 by INSYDE Corp.
May 13 21:22:23 archlinux kernel: efi: ACPI=0x5affe000 ACPI 
2.0=0x5affe014 TPMFinalLog=0x5af3f000 SMBIOS=0x58e77000 SMBIOS 
3.0=0x58e74000 MEMATTR=0x52d14018 ESRT=0x548cce18 RNG=0x5af90f18 
INITRD=0x4bd7ea98 TPMEventLog=0x4bd79018
May 13 21:22:23 archlinux kernel: random: crng init done
May 13 21:22:23 archlinux kernel: efi: Remove mem67: MMIO 
range=[0xc0300000-0xc03fffff] (1MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0xc0300000-0xc03fffff] reserved
May 13 21:22:23 archlinux kernel: efi: Remove mem68: MMIO 
range=[0xe0000000-0xefffffff] (256MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0xe0000000-0xefffffff] reserved
May 13 21:22:23 archlinux kernel: efi: Not removing mem69: MMIO 
range=[0xfec00000-0xfec01fff] (8KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem70: MMIO 
range=[0xfec10000-0xfec10fff] (4KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem71: MMIO 
range=[0xfec20000-0xfec20fff] (4KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem72: MMIO 
range=[0xfed80000-0xfed81fff] (8KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Not removing mem73: MMIO 
range=[0xfee00000-0xfee00fff] (4KB) from e820 map
May 13 21:22:23 archlinux kernel: efi: Remove mem74: MMIO 
range=[0xff000000-0xffffffff] (16MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0xff000000-0xffffffff] reserved
May 13 21:22:23 archlinux kernel: efi: Remove mem76: MMIO 
range=[0x10a0000000-0x10c01fffff] (514MB) from e820 map
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0x10a0000000-0x10c01fffff] reserved
May 13 21:22:23 archlinux kernel: SMBIOS 3.6.0 present.
May 13 21:22:23 archlinux kernel: DMI: Framework Laptop 16 (AMD Ryzen 
7040 Series)/FRANMZCP09, BIOS 03.03 03/27/2024
May 13 21:22:23 archlinux kernel: tsc: Fast TSC calibration using PIT
May 13 21:22:23 archlinux kernel: tsc: Detected 3992.653 MHz processor
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x00000000-0x00000fff] usable ==> reserved
May 13 21:22:23 archlinux kernel: e820: remove [mem 
0x000a0000-0x000fffff] usable
May 13 21:22:23 archlinux kernel: last_pfn = 0xf9e300 max_arch_pfn = 
0x400000000
May 13 21:22:23 archlinux kernel: MTRR map: 7 entries (3 fixed + 4 
variable; max 20), built from 9 variable MTRRs
May 13 21:22:23 archlinux kernel: x86/PAT: Configuration [0-7]: WB  WC  
UC- UC  WB  WP  UC- WT
May 13 21:22:23 archlinux kernel: last_pfn = 0x5b000 max_arch_pfn = 
0x400000000
May 13 21:22:23 archlinux kernel: esrt: Reserving ESRT space from 
0x00000000548cce18 to 0x00000000548cce50.
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x548cc000-0x548ccfff] usable ==> reserved
May 13 21:22:23 archlinux kernel: Using GB pages for direct mapping
May 13 21:22:23 archlinux kernel: Secure boot enabled
May 13 21:22:23 archlinux kernel: RAMDISK: [mem 0x43d94000-0x468f3fff]
May 13 21:22:23 archlinux kernel: ACPI: Early table checksum 
verification disabled
May 13 21:22:23 archlinux kernel: ACPI: RSDP 0x000000005AFFE014 000024 
(v02 INSYDE)
May 13 21:22:23 archlinux kernel: ACPI: XSDT 0x000000005AFA8228 0001B4 
(v01 INSYDE EDK2     00000002      01000013)
May 13 21:22:23 archlinux kernel: ACPI: FACP 0x000000005AFEE000 00010C 
(v05 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: DSDT 0x000000005AFDE000 009ADE 
(v02 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: FACS 0x000000005AEB1000 000040
May 13 21:22:23 archlinux kernel: ACPI: UEFI 0x000000005AF67000 0001CF 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFF4000 008416 
(v02 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFF3000 00033E 
(v01 INSYDE EDK2     00001000 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFF1000 000ABD 
(v02 INSYDE EDK2     00001000 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: ASF! 0x000000005AFF0000 0000A5 
(v32 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: BOOT 0x000000005AFEF000 000028 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: HPET 0x000000005AFED000 000038 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: APIC 0x000000005AFEC000 000138 
(v03 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: MCFG 0x000000005AFEB000 00003C 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SLIC 0x000000005AFEA000 000176 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: VFCT 0x000000005AFD9000 004284 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFD8000 0000F8 
(v02 INSYDE EDK2     00001000 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFD2000 00547E 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: CRAT 0x000000005AFD1000 000F10 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: CDIT 0x000000005AFD0000 000029 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCF000 000F8D 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCE000 000F41 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFFD000 0008CD 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCB000 001E78 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCA000 00077A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC9000 000737 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC7000 0015C8 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC4000 002AAB 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC3000 0008B2 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC1000 001C12 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFC0000 000658 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFBE000 00106D 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFB4000 0098F6 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: FPDT 0x000000005AFB3000 000044 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: BGRT 0x000000005AFB2000 000038 
(v01 INSYDE EDK2     00000002 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: WSMT 0x000000005AFB1000 000028 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: TPM2 0x000000005AFE9000 000050 
(v05 INSYDE EDK2     20505348 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAE000 002370 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: MHSP 0x000000005AFE8000 0000C8 
(v04 INSYDE EDK2     20505348 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAD000 0000E5 
(v02 INSYDE EDK2     00000004 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: IVRS 0x000000005AFAC000 000198 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAB000 000C44 
(v01 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFAA000 00074A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA9000 000C3A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFCD000 000A3A 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA6000 001743 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA5000 0001BC 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AFA4000 000FF7 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF9A000 0098BD 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF95000 004FEB 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF94000 000D41 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF93000 000968 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF92000 00008D 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: SSDT 0x000000005AF91000 000FF5 
(v02 INSYDE EDK2     00000001 ACPI 00040000)
May 13 21:22:23 archlinux kernel: ACPI: Reserving FACP table memory at 
[mem 0x5afee000-0x5afee10b]
May 13 21:22:23 archlinux kernel: ACPI: Reserving DSDT table memory at 
[mem 0x5afde000-0x5afe7add]
May 13 21:22:23 archlinux kernel: ACPI: Reserving FACS table memory at 
[mem 0x5aeb1000-0x5aeb103f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving UEFI table memory at 
[mem 0x5af67000-0x5af671ce]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5aff4000-0x5affc415]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5aff3000-0x5aff333d]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5aff1000-0x5aff1abc]
May 13 21:22:23 archlinux kernel: ACPI: Reserving ASF! table memory at 
[mem 0x5aff0000-0x5aff00a4]
May 13 21:22:23 archlinux kernel: ACPI: Reserving BOOT table memory at 
[mem 0x5afef000-0x5afef027]
May 13 21:22:23 archlinux kernel: ACPI: Reserving HPET table memory at 
[mem 0x5afed000-0x5afed037]
May 13 21:22:23 archlinux kernel: ACPI: Reserving APIC table memory at 
[mem 0x5afec000-0x5afec137]
May 13 21:22:23 archlinux kernel: ACPI: Reserving MCFG table memory at 
[mem 0x5afeb000-0x5afeb03b]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SLIC table memory at 
[mem 0x5afea000-0x5afea175]
May 13 21:22:23 archlinux kernel: ACPI: Reserving VFCT table memory at 
[mem 0x5afd9000-0x5afdd283]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afd8000-0x5afd80f7]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afd2000-0x5afd747d]
May 13 21:22:23 archlinux kernel: ACPI: Reserving CRAT table memory at 
[mem 0x5afd1000-0x5afd1f0f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving CDIT table memory at 
[mem 0x5afd0000-0x5afd0028]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afcf000-0x5afcff8c]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afce000-0x5afcef40]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5affd000-0x5affd8cc]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afcb000-0x5afcce77]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afca000-0x5afca779]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc9000-0x5afc9736]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc7000-0x5afc85c7]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc4000-0x5afc6aaa]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc3000-0x5afc38b1]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc1000-0x5afc2c11]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afc0000-0x5afc0657]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afbe000-0x5afbf06c]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afb4000-0x5afbd8f5]
May 13 21:22:23 archlinux kernel: ACPI: Reserving FPDT table memory at 
[mem 0x5afb3000-0x5afb3043]
May 13 21:22:23 archlinux kernel: ACPI: Reserving BGRT table memory at 
[mem 0x5afb2000-0x5afb2037]
May 13 21:22:23 archlinux kernel: ACPI: Reserving WSMT table memory at 
[mem 0x5afb1000-0x5afb1027]
May 13 21:22:23 archlinux kernel: ACPI: Reserving TPM2 table memory at 
[mem 0x5afe9000-0x5afe904f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afae000-0x5afb036f]
May 13 21:22:23 archlinux kernel: ACPI: Reserving MHSP table memory at 
[mem 0x5afe8000-0x5afe80c7]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afad000-0x5afad0e4]
May 13 21:22:23 archlinux kernel: ACPI: Reserving IVRS table memory at 
[mem 0x5afac000-0x5afac197]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afab000-0x5afabc43]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afaa000-0x5afaa749]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa9000-0x5afa9c39]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afcd000-0x5afcda39]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa6000-0x5afa7742]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa5000-0x5afa51bb]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5afa4000-0x5afa4ff6]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af9a000-0x5afa38bc]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af95000-0x5af99fea]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af94000-0x5af94d40]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af93000-0x5af93967]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af92000-0x5af9208c]
May 13 21:22:23 archlinux kernel: ACPI: Reserving SSDT table memory at 
[mem 0x5af91000-0x5af91ff4]
May 13 21:22:23 archlinux kernel: No NUMA configuration found
May 13 21:22:23 archlinux kernel: Faking a node at [mem 
0x0000000000000000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel: NODE_DATA(0) allocated [mem 
0xf9e2fb000-0xf9e2fffff]
May 13 21:22:23 archlinux kernel: Zone ranges:
May 13 21:22:23 archlinux kernel:   DMA      [mem 
0x0000000000001000-0x0000000000ffffff]
May 13 21:22:23 archlinux kernel:   DMA32    [mem 
0x0000000001000000-0x00000000ffffffff]
May 13 21:22:23 archlinux kernel:   Normal   [mem 
0x0000000100000000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel:   Device   empty
May 13 21:22:23 archlinux kernel: Movable zone start for each node
May 13 21:22:23 archlinux kernel: Early memory node ranges
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000000001000-0x000000000009efff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000000100000-0x0000000009afffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000009e00000-0x0000000009efffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000009f3c000-0x0000000049b5ffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000004bd60000-0x000000004bd68fff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000004bd6d000-0x000000004bd6efff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000004bd70000-0x0000000057f7efff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x000000005afff000-0x000000005affffff]
May 13 21:22:23 archlinux kernel:   node   0: [mem 
0x0000000100000000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel: Initmem setup node 0 [mem 
0x0000000000001000-0x0000000f9e2fffff]
May 13 21:22:23 archlinux kernel: On node 0, zone DMA: 1 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA: 97 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 768 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 60 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 8704 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 4 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 1 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone DMA32: 12416 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone Normal: 20480 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: On node 0, zone Normal: 7424 pages in 
unavailable ranges
May 13 21:22:23 archlinux kernel: ACPI: PM-Timer IO Port: 0x408
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high 
edge lint[0x1])
May 13 21:22:23 archlinux kernel: IOAPIC[0]: apic_id 33, version 33, 
address 0xfec00000, GSI 0-23
May 13 21:22:23 archlinux kernel: IOAPIC[1]: apic_id 34, version 33, 
address 0xfec01000, GSI 24-55
May 13 21:22:23 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 
global_irq 2 dfl dfl)
May 13 21:22:23 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 
global_irq 9 low level)
May 13 21:22:23 archlinux kernel: ACPI: Using ACPI (MADT) for SMP 
configuration information
May 13 21:22:23 archlinux kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
May 13 21:22:23 archlinux kernel: e820: update [mem 
0x52bbb000-0x52c09fff] usable ==> reserved
May 13 21:22:23 archlinux kernel: CPU topo: Max. logical packages:   1
May 13 21:22:23 archlinux kernel: CPU topo: Max. logical dies:       1
May 13 21:22:23 archlinux kernel: CPU topo: Max. dies per package:   1
May 13 21:22:23 archlinux kernel: CPU topo: Max. threads per core:   2
May 13 21:22:23 archlinux kernel: CPU topo: Num. cores per package:     8
May 13 21:22:23 archlinux kernel: CPU topo: Num. threads per package:  16
May 13 21:22:23 archlinux kernel: CPU topo: Allowing 16 present CPUs 
plus 0 hotplug CPUs
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x00000000-0x00000fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x0009f000-0x000bffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x000c0000-0x000fffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09b00000-0x09dfffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09f00000-0x09f3bfff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x49b60000-0x4bd5ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd69000-0x4bd6cfff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd6f000-0x4bd6ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd74000-0x4bd74fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd78000-0x4bd78fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x52bbb000-0x52c09fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x548cc000-0x548ccfff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x57f7f000-0x5a77efff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5a77f000-0x5af7efff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5af7f000-0x5affefff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5b000000-0x5bffffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5c000000-0x5d78ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d790000-0x5d7effff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f0000-0x5d7f4fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f5000-0x5fffffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x60000000-0xfebfffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec00000-0xfec01fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec02000-0xfec0ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec10000-0xfec10fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec11000-0xfec1ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec20000-0xfec20fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec21000-0xfed7ffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed80000-0xfed81fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed82000-0xfedfffff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee00000-0xfee00fff]
May 13 21:22:23 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee01000-0xffffffff]
May 13 21:22:23 archlinux kernel: [mem 0x60000000-0xfebfffff] available 
for PCI devices
May 13 21:22:23 archlinux kernel: Booting paravirtualized kernel on bare 
hardware
May 13 21:22:23 archlinux kernel: clocksource: refined-jiffies: mask: 
0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
May 13 21:22:23 archlinux kernel: setup_percpu: NR_CPUS:320 
nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
May 13 21:22:23 archlinux kernel: percpu: Embedded 66 pages/cpu s233472 
r8192 d28672 u524288
May 13 21:22:23 archlinux kernel: pcpu-alloc: s233472 r8192 d28672 
u524288 alloc=1*2097152
May 13 21:22:23 archlinux kernel: pcpu-alloc: [0] 00 01 02 03 [0] 04 05 
06 07
May 13 21:22:23 archlinux kernel: pcpu-alloc: [0] 08 09 10 11 [0] 12 13 
14 15
May 13 21:22:23 archlinux kernel: Kernel command line: 
rd.luks.name=496f2909-055b-49f7-9a43-b48647d757a9=root 
rd.luks.options=discard root=/dev/mapper/root quiet loglevel=3 
systemd.show_status=auto rd.udev.log_level=3 splash
May 13 21:22:23 archlinux kernel: Unknown kernel command line parameters 
"splash", will be passed to user space.
May 13 21:22:23 archlinux kernel: Dentry cache hash table entries: 
8388608 (order: 14, 67108864 bytes, linear)
May 13 21:22:23 archlinux kernel: Inode-cache hash table entries: 
4194304 (order: 13, 33554432 bytes, linear)
May 13 21:22:23 archlinux kernel: Fallback order for Node 0: 0
May 13 21:22:23 archlinux kernel: Built 1 zonelists, mobility grouping 
on.  Total pages: 15433546
May 13 21:22:23 archlinux kernel: Policy zone: Normal
May 13 21:22:23 archlinux kernel: mem auto-init: stack:all(zero), heap 
alloc:on, heap free:off
May 13 21:22:23 archlinux kernel: software IO TLB: area num 16.
May 13 21:22:23 archlinux kernel: Memory: 61338644K/62714740K available 
(18432K kernel code, 2189K rwdata, 13500K rodata, 3412K init, 3604K bss, 
1375836K reserved, 0K cma-reserved)
May 13 21:22:23 archlinux kernel: SLUB: HWalign=64, Order=0-3, 
MinObjects=0, CPUs=16, Nodes=1
May 13 21:22:23 archlinux kernel: ftrace: allocating 49950 entries in 
196 pages
May 13 21:22:23 archlinux kernel: ftrace: allocated 196 pages with 3 groups
May 13 21:22:23 archlinux kernel: Dynamic Preempt: full
May 13 21:22:23 archlinux kernel: rcu: Preemptible hierarchical RCU 
implementation.
May 13 21:22:23 archlinux kernel: rcu:         RCU restricting CPUs from 
NR_CPUS=320 to nr_cpu_ids=16.
May 13 21:22:23 archlinux kernel: rcu:         RCU priority boosting: 
priority 1 delay 500 ms.
May 13 21:22:23 archlinux kernel:         Trampoline variant of Tasks 
RCU enabled.
May 13 21:22:23 archlinux kernel:         Rude variant of Tasks RCU enabled.
May 13 21:22:23 archlinux kernel:         Tracing variant of Tasks RCU 
enabled.
May 13 21:22:23 archlinux kernel: rcu: RCU calculated value of 
scheduler-enlistment delay is 30 jiffies.
May 13 21:22:23 archlinux kernel: rcu: Adjusting geometry for 
rcu_fanout_leaf=16, nr_cpu_ids=16
May 13 21:22:23 archlinux kernel: RCU Tasks: Setting shift to 4 and lim 
to 1 rcu_task_cb_adjust=1.
May 13 21:22:23 archlinux kernel: RCU Tasks Rude: Setting shift to 4 and 
lim to 1 rcu_task_cb_adjust=1.
May 13 21:22:23 archlinux kernel: RCU Tasks Trace: Setting shift to 4 
and lim to 1 rcu_task_cb_adjust=1.
May 13 21:22:23 archlinux kernel: NR_IRQS: 20736, nr_irqs: 1096, 
preallocated irqs: 16
May 13 21:22:23 archlinux kernel: rcu: srcu_init: Setting srcu_struct 
sizes based on contention.
May 13 21:22:23 archlinux kernel: kfence: initialized - using 2097152 
bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
May 13 21:22:23 archlinux kernel: Console: colour dummy device 80x25
May 13 21:22:23 archlinux kernel: printk: legacy console [tty0] enabled
May 13 21:22:23 archlinux kernel: ACPI: Core revision 20230628
May 13 21:22:23 archlinux kernel: clocksource: hpet: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
May 13 21:22:23 archlinux kernel: APIC: Switch to symmetric I/O mode setup
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR0, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR1, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR2, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR3, rdevid:160
May 13 21:22:23 archlinux kernel: AMD-Vi: Using global IVHD 
EFR:0x246577efa2054ada, EFR2:0x0
May 13 21:22:23 archlinux kernel: x2apic: IRQ remapping doesn't support 
X2APIC mode
May 13 21:22:23 archlinux kernel: APIC: Switched APIC routing to: 
physical flat
May 13 21:22:23 archlinux kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 
apic2=-1 pin2=-1
May 13 21:22:23 archlinux kernel: clocksource: tsc-early: mask: 
0xffffffffffffffff max_cycles: 0x731a806b6e8, max_idle_ns: 881590582644 ns
May 13 21:22:23 archlinux kernel: Calibrating delay loop (skipped), 
value calculated using timer frequency.. 7988.02 BogoMIPS (lpj=13308843)
May 13 21:22:23 archlinux kernel: x86/cpu: User Mode Instruction 
Prevention (UMIP) activated
May 13 21:22:23 archlinux kernel: LVT offset 1 assigned for vector 0xf9
May 13 21:22:23 archlinux kernel: LVT offset 2 assigned for vector 0xf4
May 13 21:22:23 archlinux kernel: Last level iTLB entries: 4KB 512, 2MB 
512, 4MB 256
May 13 21:22:23 archlinux kernel: Last level dTLB entries: 4KB 3072, 2MB 
3072, 4MB 1536, 1GB 0
May 13 21:22:23 archlinux kernel: process: using mwait in idle threads
May 13 21:22:23 archlinux kernel: Spectre V1 : Mitigation: 
usercopy/swapgs barriers and __user pointer sanitization
May 13 21:22:23 archlinux kernel: Spectre V2 : Mitigation: Enhanced / 
Automatic IBRS
May 13 21:22:23 archlinux kernel: Spectre V2 : Spectre v2 / SpectreRSB 
mitigation: Filling RSB on context switch
May 13 21:22:23 archlinux kernel: Spectre V2 : mitigation: Enabling 
conditional Indirect Branch Prediction Barrier
May 13 21:22:23 archlinux kernel: Spectre V2 : User space: Mitigation: 
STIBP always-on protection
May 13 21:22:23 archlinux kernel: Speculative Store Bypass: Mitigation: 
Speculative Store Bypass disabled via prctl
May 13 21:22:23 archlinux kernel: Speculative Return Stack Overflow: 
Mitigation: Safe RET
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x001: 'x87 floating point registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x002: 'SSE registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x004: 'AVX registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x020: 'AVX-512 opmask'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x040: 'AVX-512 Hi256'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x080: 'AVX-512 ZMM_Hi256'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x200: 'Protection Keys User registers'
May 13 21:22:23 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x800: 'Control-flow User registers'
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[2]:  576, 
xstate_sizes[2]:  256
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[5]:  832, 
xstate_sizes[5]:   64
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[6]:  896, 
xstate_sizes[6]:  512
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[7]: 1408, 
xstate_sizes[7]: 1024
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[9]: 2432, 
xstate_sizes[9]:    8
May 13 21:22:23 archlinux kernel: x86/fpu: xstate_offset[11]: 2440, 
xstate_sizes[11]:   16
May 13 21:22:23 archlinux kernel: x86/fpu: Enabled xstate features 
0xae7, context size is 2456 bytes, using 'compacted' format.
May 13 21:22:23 archlinux kernel: Freeing SMP alternatives memory: 40K
May 13 21:22:23 archlinux kernel: pid_max: default: 32768 minimum: 301
May 13 21:22:23 archlinux kernel: LSM: initializing 
lsm=capability,landlock,lockdown,yama,bpf
May 13 21:22:23 archlinux kernel: landlock: Up and running.
May 13 21:22:23 archlinux kernel: Yama: becoming mindful.
May 13 21:22:23 archlinux kernel: LSM support for eBPF active
May 13 21:22:23 archlinux kernel: Mount-cache hash table entries: 131072 
(order: 8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: Mountpoint-cache hash table entries: 
131072 (order: 8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: smpboot: CPU0: AMD Ryzen 9 7940HS w/ 
Radeon 780M Graphics (family: 0x19, model: 0x74, stepping: 0x1)
May 13 21:22:23 archlinux kernel: Performance Events: Fam17h+ 16-deep 
LBR, core perfctr, AMD PMU driver.
May 13 21:22:23 archlinux kernel: ... version:                2
May 13 21:22:23 archlinux kernel: ... bit width:              48
May 13 21:22:23 archlinux kernel: ... generic registers:      6
May 13 21:22:23 archlinux kernel: ... value mask: 0000ffffffffffff
May 13 21:22:23 archlinux kernel: ... max period: 00007fffffffffff
May 13 21:22:23 archlinux kernel: ... fixed-purpose events:   0
May 13 21:22:23 archlinux kernel: ... event mask: 000000000000003f
May 13 21:22:23 archlinux kernel: signal: max sigframe size: 3376
May 13 21:22:23 archlinux kernel: rcu: Hierarchical SRCU implementation.
May 13 21:22:23 archlinux kernel: rcu:         Max phase no-delay 
instances is 1000.
May 13 21:22:23 archlinux kernel: NMI watchdog: Enabled. Permanently 
consumes one hw-PMU counter.
May 13 21:22:23 archlinux kernel: smp: Bringing up secondary CPUs ...
May 13 21:22:23 archlinux kernel: smpboot: x86: Booting SMP configuration:
May 13 21:22:23 archlinux kernel: .... node  #0, CPUs:        #2 #4  #6  
#8 #10 #12 #14  #1  #3  #5  #7  #9 #11 #13 #15
May 13 21:22:23 archlinux kernel: Spectre V2 : Update user space SMT 
mitigation: STIBP always-on
May 13 21:22:23 archlinux kernel: smp: Brought up 1 node, 16 CPUs
May 13 21:22:23 archlinux kernel: smpboot: Total of 16 processors 
activated (127816.43 BogoMIPS)
May 13 21:22:23 archlinux kernel: devtmpfs: initialized
May 13 21:22:23 archlinux kernel: x86/mm: Memory block size: 128MB
May 13 21:22:23 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x09f00000-0x09f3bfff] (245760 bytes)
May 13 21:22:23 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x5a77f000-0x5af7efff] (8388608 bytes)
May 13 21:22:23 archlinux kernel: clocksource: jiffies: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
May 13 21:22:23 archlinux kernel: futex hash table entries: 4096 (order: 
6, 262144 bytes, linear)
May 13 21:22:23 archlinux kernel: pinctrl core: initialized pinctrl 
subsystem
May 13 21:22:23 archlinux kernel: PM: RTC time: 02:22:23, date: 2024-05-14
May 13 21:22:23 archlinux kernel: NET: Registered PF_NETLINK/PF_ROUTE 
protocol family
May 13 21:22:23 archlinux kernel: DMA: preallocated 4096 KiB GFP_KERNEL 
pool for atomic allocations
May 13 21:22:23 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA pool for atomic allocations
May 13 21:22:23 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA32 pool for atomic allocations
May 13 21:22:23 archlinux kernel: audit: initializing netlink subsys 
(disabled)
May 13 21:22:23 archlinux kernel: audit: type=2000 
audit(1715653343.189:1): state=initialized audit_enabled=0 res=1
May 13 21:22:23 archlinux kernel: i2c-core: driver [dummy] registered
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'fair_share'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'bang_bang'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'step_wise'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'user_space'
May 13 21:22:23 archlinux kernel: thermal_sys: Registered thermal 
governor 'power_allocator'
May 13 21:22:23 archlinux kernel: cpuidle: using governor ladder
May 13 21:22:23 archlinux kernel: cpuidle: using governor menu
May 13 21:22:23 archlinux kernel: Simple Boot Flag at 0x44 set to 0x1
May 13 21:22:23 archlinux kernel: acpiphp: ACPI Hot Plug PCI Controller 
Driver version: 0.5
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:22:23 archlinux kernel: PCI: not using ECAM ([mem 
0xe0000000-0xefffffff] not reserved)
May 13 21:22:23 archlinux kernel: PCI: Using configuration type 1 for 
base access
May 13 21:22:23 archlinux kernel: PCI: Using configuration type 1 for 
extended access
May 13 21:22:23 archlinux kernel: kprobes: kprobe jump-optimization is 
enabled. All kprobes are optimized if possible.
May 13 21:22:23 archlinux kernel: HugeTLB: registered 1.00 GiB page 
size, pre-allocated 0 pages
May 13 21:22:23 archlinux kernel: HugeTLB: 16380 KiB vmemmap can be 
freed for a 1.00 GiB page
May 13 21:22:23 archlinux kernel: HugeTLB: registered 2.00 MiB page 
size, pre-allocated 0 pages
May 13 21:22:23 archlinux kernel: HugeTLB: 28 KiB vmemmap can be freed 
for a 2.00 MiB page
May 13 21:22:23 archlinux kernel: Demotion targets for Node 0: null
May 13 21:22:23 archlinux kernel: i2c-core: driver [sx150x-pinctrl] 
registered
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(Module Device)
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(Processor Device)
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 13 21:22:23 archlinux kernel: ACPI: Added _OSI(Processor Aggregator 
Device)
May 13 21:22:23 archlinux kernel: ACPI: 34 ACPI AML tables successfully 
acquired and loaded
May 13 21:22:23 archlinux kernel: ACPI: USB4 _OSC: OS supports USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:22:23 archlinux kernel: ACPI: USB4 _OSC: OS controls USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:22:23 archlinux kernel: ACPI: _OSC evaluation for CPUs failed, 
trying _PDC
May 13 21:22:23 archlinux kernel: ACPI: EC: EC started
May 13 21:22:23 archlinux kernel: ACPI: EC: interrupt blocked
May 13 21:22:23 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC used to handle transactions
May 13 21:22:23 archlinux kernel: ACPI: Interpreter enabled
May 13 21:22:23 archlinux kernel: ACPI: PM: (supports S0 S4 S5)
May 13 21:22:23 archlinux kernel: ACPI: Using IOAPIC for interrupt routing
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:22:23 archlinux kernel: PCI: [Firmware Info]: ECAM [mem 
0xe0000000-0xefffffff] not reserved in ACPI motherboard resources
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
is EfiMemoryMappedIO; assuming valid
May 13 21:22:23 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
reserved to work around lack of ACPI motherboard _CRS
May 13 21:22:23 archlinux kernel: PCI: Using host bridge windows from 
ACPI; if necessary, use "pci=nocrs" and report a bug
May 13 21:22:23 archlinux kernel: PCI: Ignoring E820 reservations for 
host bridge windows
May 13 21:22:23 archlinux kernel: ACPI: Enabled 4 GPEs in block 00 to 1F
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.M237: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: 
New power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP6.PWSR: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GPP8.P0NV: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.PWRS: New power 
resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New 
power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PRWL: New power resource
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PRWB: New power resource
May 13 21:22:23 archlinux kernel: ACPI: PCI Root Bridge [PCI0] (domain 
0000 [bus 00-ff])
May 13 21:22:23 archlinux kernel: acpi PNP0A08:00: _OSC: OS supports 
[ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
May 13 21:22:23 archlinux kernel: acpi PNP0A08:00: _OSC: platform does 
not support [SHPCHotplug AER]
May 13 21:22:23 archlinux kernel: acpi PNP0A08:00: _OSC: OS now controls 
[PCIeHotplug PME PCIeCapability LTR DPC]
May 13 21:22:23 archlinux kernel: PCI host bridge to bus 0000:00
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0000-0x0cf7 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0d00-0xffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000a0000-0x000bffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000c0000-0x000cffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000d0000-0x000effff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x60000000-0x90ffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xf0000000-0xfec00000 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed45000-0xfed814ff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed81900-0xfed81fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc0000-0xfedc0fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc6000-0xfedc6fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x10c0200000-0x891fffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: root bus resource 
[bus 00-ff]
May 13 21:22:23 archlinux kernel: pci 0000:00:00.0: [1022:14e8] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:00.2: [1022:14e9] type 00 
class 0x080600 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:01.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: [1022:14ed] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:02.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:03.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:04.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:14.0: [1022:790b] type 00 
class 0x0c0500 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:14.3: [1022:790e] type 00 
class 0x060100 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.0: [1022:14f0] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.1: [1022:14f1] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.2: [1022:14f2] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.3: [1022:14f3] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.4: [1022:14f4] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.5: [1022:14f5] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.6: [1022:14f6] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:00:18.7: [1022:14f7] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: [1002:1478] type 01 
class 0x060400 PCIe Switch Upstream Port
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: BAR 0 [mem 
0x90e00000-0x90e03fff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: [1002:1479] type 01 
class 0x060400 PCIe Switch Downstream Port
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: [1002:7480] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 0 [mem 
0x8400000000-0x85ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 2 [mem 
0x8600000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 4 [io 0xa000-0xa0ff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: BAR 5 [mem 
0x90c00000-0x90cfffff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: [1002:ab30] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: BAR 0 [mem 
0x90d00000-0x90d03fff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: [14c3:0616] type 00 
class 0x028000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: BAR 0 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: BAR 2 [mem 
0x90b00000-0x90b07fff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:22:23 archlinux kernel: pci 0000:05:00.0: [144d:a80c] type 00 
class 0x010802 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:05:00.0: BAR 0 [mem 
0x90a00000-0x90a03fff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: [1002:15bf] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 0 [mem 
0x8610000000-0x861fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 2 [mem 
0x90000000-0x901fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 4 [io 0x1000-0x10ff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: BAR 5 [mem 
0x90500000-0x9057ffff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: [1002:1640] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: BAR 0 [mem 
0x905c8000-0x905cbfff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: [1022:15c7] type 00 
class 0x108000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: BAR 2 [mem 
0x90400000-0x904fffff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: BAR 5 [mem 
0x905cc000-0x905cdfff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: [1022:15b9] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: BAR 0 [mem 
0x90200000-0x902fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: [1022:15ba] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: BAR 0 [mem 
0x90300000-0x903fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: [1022:15e2] type 00 
class 0x048000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: BAR 0 [mem 
0x90580000-0x905bffff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: BAR 2 [mem 
0x8620000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: [1022:15e3] type 00 
class 0x040300 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: BAR 0 [mem 
0x905c0000-0x905c7fff]
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: PME# supported from 
D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: [1022:1502] type 00 
class 0x118000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 0 [mem 
0x90900000-0x9097ffff]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 1 [mem 
0x909c0000-0x909c1fff]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 2 [mem 
0x8620800000-0x862083ffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: BAR 4 [mem 
0x90980000-0x909bffff]
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.0: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: [1022:15c0] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: BAR 0 [mem 
0x90600000-0x906fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: [1022:15c1] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: BAR 0 [mem 
0x90700000-0x907fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: [1022:1668] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: BAR 0 [mem 
0x90800000-0x9087ffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: [1022:1669] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: BAR 0 [mem 
0x90880000-0x908fffff 64bit]
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: enabling Extended Tags
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKA 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKA disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKB 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKB disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKC 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKC disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKD 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKD disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKE 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKE disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKF 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKF disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKG 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKG disabled
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKH 
configured for IRQ 0
May 13 21:22:23 archlinux kernel: ACPI: PCI: Interrupt link LNKH disabled
May 13 21:22:23 archlinux kernel: Low-power S0 idle used by default for 
system suspend
May 13 21:22:23 archlinux kernel: ACPI: EC: interrupt unblocked
May 13 21:22:23 archlinux kernel: ACPI: EC: event unblocked
May 13 21:22:23 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:22:23 archlinux kernel: ACPI: EC: GPE=0xb
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC initialization complete
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used 
to handle transactions and events
May 13 21:22:23 archlinux kernel: iommu: Default domain type: Translated
May 13 21:22:23 archlinux kernel: iommu: DMA domain TLB invalidation 
policy: lazy mode
May 13 21:22:23 archlinux kernel: i2c-core: driver [88PM860x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [WM8400] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [wm831x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [wm8350] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [tps65910] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [da903x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [da9052] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [lp8788] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [da9055-pmic] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max77843] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max8925] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max8997] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [max8998] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [tps6586x] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [tps65090] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [aat2870] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [palmas] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [rc5t583] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [as3711] registered
May 13 21:22:23 archlinux kernel: SCSI subsystem initialized
May 13 21:22:23 archlinux kernel: libata version 3.00 loaded.
May 13 21:22:23 archlinux kernel: ACPI: bus type USB registered
May 13 21:22:23 archlinux kernel: usbcore: registered new interface 
driver usbfs
May 13 21:22:23 archlinux kernel: usbcore: registered new interface 
driver hub
May 13 21:22:23 archlinux kernel: usbcore: registered new device driver usb
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
clock-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-rising-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-internal-delay-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-hold-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-digital-filter-width-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: ACPI slave 
is not supported yet
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: SDA Hold 
Time TX:RX = 48:48
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: Bus speed: 
Fast Mode (400 kHz)
May 13 21:22:23 archlinux kernel: i2c i2c-0: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:22:23 archlinux kernel: i2c i2c-0: client [FRMW0003:00] 
registered with bus id i2c-FRMW0003:00
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
clock-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-rising-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-internal-delay-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-falling-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-hold-time-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-digital-filter-width-ns: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: ACPI slave 
is not supported yet
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: SDA Hold 
Time TX:RX = 48:48
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: Bus speed: 
Fast Mode (400 kHz)
May 13 21:22:23 archlinux kernel: i2c i2c-1: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:22:23 archlinux kernel: i2c i2c-1: client [PIXA3854:00] 
registered with bus id i2c-PIXA3854:00
May 13 21:22:23 archlinux kernel: pps_core: LinuxPPS API ver. 1 registered
May 13 21:22:23 archlinux kernel: pps_core: Software ver. 5.3.6 - 
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
May 13 21:22:23 archlinux kernel: PTP clock support registered
May 13 21:22:23 archlinux kernel: EDAC MC: Ver: 3.0.0
May 13 21:22:23 archlinux kernel: efivars: Registered efivars operations
May 13 21:22:23 archlinux kernel: NetLabel: Initializing
May 13 21:22:23 archlinux kernel: NetLabel:  domain hash size = 128
May 13 21:22:23 archlinux kernel: NetLabel:  protocols = UNLABELED 
CIPSOv4 CALIPSO
May 13 21:22:23 archlinux kernel: NetLabel:  unlabeled traffic allowed 
by default
May 13 21:22:23 archlinux kernel: mctp: management component transport 
protocol core
May 13 21:22:23 archlinux kernel: NET: Registered PF_MCTP protocol family
May 13 21:22:23 archlinux kernel: PCI: Using ACPI for IRQ routing
May 13 21:22:23 archlinux kernel: PCI: pci_cache_line_size set to 64 bytes
May 13 21:22:23 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:22:23 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x0009f000-0x0009ffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x09b00000-0x0bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x09f00000-0x0bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x49b60000-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd69000-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd6f000-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd74018-0x4bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x52bbb000-0x53ffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x548cc000-0x57ffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x57f7f000-0x57ffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0x5b000000-0x5bffffff]
May 13 21:22:23 archlinux kernel: e820: reserve RAM buffer [mem 
0xf9e300000-0xf9fffffff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: vgaarb: setting as 
boot VGA device
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: vgaarb: bridge 
control possible
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: vgaarb: setting as 
boot VGA device (overriding previous)
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: vgaarb: bridge 
control possible
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:22:23 archlinux kernel: vgaarb: loaded
May 13 21:22:23 archlinux kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
May 13 21:22:23 archlinux kernel: hpet0: 3 comparators, 32-bit 14.318180 
MHz counter
May 13 21:22:23 archlinux kernel: clocksource: Switched to clocksource 
tsc-early
May 13 21:22:23 archlinux kernel: VFS: Disk quotas dquot_6.6.0
May 13 21:22:23 archlinux kernel: VFS: Dquot-cache hash table entries: 
512 (order 0, 4096 bytes)
May 13 21:22:23 archlinux kernel: pnp: PnP ACPI init
May 13 21:22:23 archlinux kernel: system 00:00: [mem 
0xfec00000-0xfec01fff] could not be reserved
May 13 21:22:23 archlinux kernel: system 00:00: [mem 
0xfee00000-0xfee00fff] has been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0400-0x04cf] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x04d0-0x04d1] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x04d6] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0c00-0x0c01] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x0c14] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0c50-0x0c52] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x0c6c] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io  0x0c6f] has been 
reserved
May 13 21:22:23 archlinux kernel: system 00:02: [io 0x0cd0-0x0cdb] has 
been reserved
May 13 21:22:23 archlinux kernel: system 00:03: [mem 
0x000e0000-0x000fffff] could not be reserved
May 13 21:22:23 archlinux kernel: system 00:03: [mem 
0xfe000000-0xffffffff] could not be reserved
May 13 21:22:23 archlinux kernel: pnp: PnP ACPI: found 4 devices
May 13 21:22:23 archlinux kernel: clocksource: acpi_pm: mask: 0xffffff 
max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 13 21:22:23 archlinux kernel: NET: Registered PF_INET protocol family
May 13 21:22:23 archlinux kernel: IP idents hash table entries: 262144 
(order: 9, 2097152 bytes, linear)
May 13 21:22:23 archlinux kernel: tcp_listen_portaddr_hash hash table 
entries: 32768 (order: 7, 524288 bytes, linear)
May 13 21:22:23 archlinux kernel: Table-perturb hash table entries: 
65536 (order: 6, 262144 bytes, linear)
May 13 21:22:23 archlinux kernel: TCP established hash table entries: 
524288 (order: 10, 4194304 bytes, linear)
May 13 21:22:23 archlinux kernel: TCP bind hash table entries: 65536 
(order: 9, 2097152 bytes, linear)
May 13 21:22:23 archlinux kernel: TCP: Hash tables configured 
(established 524288 bind 65536)
May 13 21:22:23 archlinux kernel: MPTCP token hash table entries: 65536 
(order: 8, 1572864 bytes, linear)
May 13 21:22:23 archlinux kernel: UDP hash table entries: 32768 (order: 
8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: UDP-Lite hash table entries: 32768 
(order: 8, 1048576 bytes, linear)
May 13 21:22:23 archlinux kernel: NET: Registered PF_UNIX/PF_LOCAL 
protocol family
May 13 21:22:23 archlinux kernel: NET: Registered PF_XDP protocol family
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]: can't claim; no compatible bridge window
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0x90d20000-0x90d3ffff pref]: assigned
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 4 [io 
0x0000-0x0cf7 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 5 [io 
0x0d00-0xffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 6 [mem 
0x000a0000-0x000bffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 7 [mem 
0x000c0000-0x000cffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 8 [mem 
0x000d0000-0x000effff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 9 [mem 
0x60000000-0x90ffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 10 [mem 
0xf0000000-0xfec00000 window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 11 [mem 
0xfed45000-0xfed814ff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 12 [mem 
0xfed81900-0xfed81fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 13 [mem 
0xfedc0000-0xfedc0fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 14 [mem 
0xfedc6000-0xfedc6fff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:00: resource 15 [mem 
0x10c0200000-0x891fffffff window]
May 13 21:22:23 archlinux kernel: pci_bus 0000:01: resource 0 [io 
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:01: resource 1 [mem 
0x90c00000-0x90efffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:01: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:02: resource 0 [io 
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:02: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:02: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:03: resource 0 [io 
0xa000-0xafff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:03: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:03: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:04: resource 1 [mem 
0x90b00000-0x90bfffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:04: resource 2 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:05: resource 1 [mem 
0x90a00000-0x90afffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:06: resource 0 [io 
0x6000-0x9fff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:06: resource 1 [mem 
0x78000000-0x8fffffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:06: resource 2 [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:65: resource 0 [io 
0x2000-0x5fff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:65: resource 1 [mem 
0x60000000-0x77ffffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:65: resource 2 [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c4: resource 0 [io 
0x1000-0x1fff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c4: resource 1 [mem 
0x90000000-0x905fffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c4: resource 2 [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c5: resource 1 [mem 
0x90900000-0x909fffff]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c5: resource 2 [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:22:23 archlinux kernel: pci_bus 0000:c6: resource 1 [mem 
0x90600000-0x908fffff]
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: D0 power state 
depends on 0000:03:00.0
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: D0 power state 
depends on 0000:c4:00.0
May 13 21:22:23 archlinux kernel: PCI: CLS 64 bytes, default 64
May 13 21:22:23 archlinux kernel: pci 0000:00:00.2: AMD-Vi: IOMMU 
performance counters supported
May 13 21:22:23 archlinux kernel: pci 0000:00:01.0: Adding to iommu group 0
May 13 21:22:23 archlinux kernel: Trying to unpack rootfs image as 
initramfs...
May 13 21:22:23 archlinux kernel: pci 0000:00:01.1: Adding to iommu group 1
May 13 21:22:23 archlinux kernel: pci 0000:00:02.0: Adding to iommu group 2
May 13 21:22:23 archlinux kernel: pci 0000:00:02.2: Adding to iommu group 3
May 13 21:22:23 archlinux kernel: pci 0000:00:02.4: Adding to iommu group 4
May 13 21:22:23 archlinux kernel: pci 0000:00:03.0: Adding to iommu group 5
May 13 21:22:23 archlinux kernel: pci 0000:00:03.1: Adding to iommu group 5
May 13 21:22:23 archlinux kernel: pci 0000:00:04.0: Adding to iommu group 6
May 13 21:22:23 archlinux kernel: pci 0000:00:04.1: Adding to iommu group 6
May 13 21:22:23 archlinux kernel: pci 0000:00:08.0: Adding to iommu group 7
May 13 21:22:23 archlinux kernel: pci 0000:00:08.1: Adding to iommu group 8
May 13 21:22:23 archlinux kernel: pci 0000:00:08.2: Adding to iommu group 9
May 13 21:22:23 archlinux kernel: pci 0000:00:08.3: Adding to iommu group 10
May 13 21:22:23 archlinux kernel: pci 0000:00:14.0: Adding to iommu group 11
May 13 21:22:23 archlinux kernel: pci 0000:00:14.3: Adding to iommu group 11
May 13 21:22:23 archlinux kernel: pci 0000:00:18.0: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.1: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.2: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.3: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.4: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.5: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.6: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:00:18.7: Adding to iommu group 12
May 13 21:22:23 archlinux kernel: pci 0000:01:00.0: Adding to iommu group 13
May 13 21:22:23 archlinux kernel: pci 0000:02:00.0: Adding to iommu group 14
May 13 21:22:23 archlinux kernel: pci 0000:03:00.0: Adding to iommu group 15
May 13 21:22:23 archlinux kernel: pci 0000:03:00.1: Adding to iommu group 16
May 13 21:22:23 archlinux kernel: pci 0000:04:00.0: Adding to iommu group 17
May 13 21:22:23 archlinux kernel: pci 0000:05:00.0: Adding to iommu group 18
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.0: Adding to iommu group 19
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.1: Adding to iommu group 20
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.2: Adding to iommu group 21
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.3: Adding to iommu group 22
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.4: Adding to iommu group 23
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.5: Adding to iommu group 24
May 13 21:22:23 archlinux kernel: pci 0000:c4:00.6: Adding to iommu group 25
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.0: Adding to iommu group 26
May 13 21:22:23 archlinux kernel: pci 0000:c5:00.1: Adding to iommu group 27
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.0: Adding to iommu group 28
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.3: Adding to iommu group 29
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.4: Adding to iommu group 30
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.5: Adding to iommu group 31
May 13 21:22:23 archlinux kernel: pci 0000:c6:00.6: Adding to iommu group 32
May 13 21:22:23 archlinux kernel: AMD-Vi: Extended features 
(0x246577efa2054ada, 0x0): PPR NX GT IA GA PC
May 13 21:22:23 archlinux kernel: AMD-Vi: Interrupt remapping enabled
May 13 21:22:23 archlinux kernel: PCI-DMA: Using software bounce 
buffering for IO (SWIOTLB)
May 13 21:22:23 archlinux kernel: software IO TLB: mapped [mem 
0x000000003fd94000-0x0000000043d94000] (64MB)
May 13 21:22:23 archlinux kernel: LVT offset 0 assigned for vector 0x400
May 13 21:22:23 archlinux kernel: perf: AMD IBS detected (0x00000bff)
May 13 21:22:23 archlinux kernel: perf/amd_iommu: Detected AMD IOMMU #0 
(2 banks, 4 counters/bank).
May 13 21:22:23 archlinux kernel: Initialise system trusted keyrings
May 13 21:22:23 archlinux kernel: Key type blacklist registered
May 13 21:22:23 archlinux kernel: workingset: timestamp_bits=41 
max_order=24 bucket_order=0
May 13 21:22:23 archlinux kernel: zbud: loaded
May 13 21:22:23 archlinux kernel: integrity: Platform Keyring initialized
May 13 21:22:23 archlinux kernel: integrity: Machine keyring initialized
May 13 21:22:23 archlinux kernel: Key type asymmetric registered
May 13 21:22:23 archlinux kernel: Asymmetric key parser 'x509' registered
May 13 21:22:23 archlinux kernel: Block layer SCSI generic (bsg) driver 
version 0.4 loaded (major 242)
May 13 21:22:23 archlinux kernel: io scheduler mq-deadline registered
May 13 21:22:23 archlinux kernel: io scheduler kyber registered
May 13 21:22:23 archlinux kernel: io scheduler bfq registered
May 13 21:22:23 archlinux kernel: pcieport 0000:00:01.1: PME: Signaling 
with IRQ 38
May 13 21:22:23 archlinux kernel: pcieport 0000:00:01.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:22:23 archlinux kernel: pcieport 0000:00:02.2: PME: Signaling 
with IRQ 39
May 13 21:22:23 archlinux kernel: pcieport 0000:00:02.4: PME: Signaling 
with IRQ 40
May 13 21:22:23 archlinux kernel: pcieport 0000:00:03.1: PME: Signaling 
with IRQ 41
May 13 21:22:23 archlinux kernel: pcieport 0000:00:03.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:22:23 archlinux kernel: pcieport 0000:00:04.1: PME: Signaling 
with IRQ 42
May 13 21:22:23 archlinux kernel: pcieport 0000:00:04.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:22:23 archlinux kernel: pcieport 0000:00:08.1: PME: Signaling 
with IRQ 43
May 13 21:22:23 archlinux kernel: pcieport 0000:00:08.2: PME: Signaling 
with IRQ 44
May 13 21:22:23 archlinux kernel: pcieport 0000:00:08.3: PME: Signaling 
with IRQ 45
May 13 21:22:23 archlinux kernel: shpchp: Standard Hot Plug PCI 
Controller Driver version: 0.4
May 13 21:22:23 archlinux kernel: ACPI: AC: AC Adapter [ACAD] (on-line)
May 13 21:22:23 archlinux kernel: input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:4f/PNP0C09:00/PNP0C0D:00/input/input0
May 13 21:22:23 archlinux kernel: ACPI: button: Lid Switch [LID0]
May 13 21:22:23 archlinux kernel: input: Power Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
May 13 21:22:23 archlinux kernel: ACPI: button: Power Button [PWRB]
May 13 21:22:23 archlinux kernel: Estimated ratio of average max 
frequency by base frequency (times 1024): 1388
May 13 21:22:23 archlinux kernel: Monitor-Mwait will be used to enter 
C-1 state
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C000: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C001: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C002: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C003: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C004: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C005: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C006: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C007: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C008: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C009: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00A: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00B: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00C: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00D: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00E: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: \_SB_.PLTF.C00F: Found 3 idle states
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:00: registered as 
thermal_zone0
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ00] (45 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:01: registered as 
thermal_zone1
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ01] (47 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:02: registered as 
thermal_zone2
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ02] (49 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:03: registered as 
thermal_zone3
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ03] (79 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:04: registered as 
thermal_zone4
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ04] (37 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:05: registered as 
thermal_zone5
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ05] (37 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:06: registered as 
thermal_zone6
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ06] (37 C)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:22:23 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:22:23 archlinux kernel: thermal LNXTHERM:07: registered as 
thermal_zone7
May 13 21:22:23 archlinux kernel: ACPI: thermal: Thermal Zone [TZ07] (0 C)
May 13 21:22:23 archlinux kernel: Serial: 8250/16550 driver, 32 ports, 
IRQ sharing enabled
May 13 21:22:23 archlinux kernel: ACPI: battery: Slot [BAT1] (battery 
present)
May 13 21:22:23 archlinux kernel: Non-volatile memory driver v1.3
May 13 21:22:23 archlinux kernel: Linux agpgart interface v0.103
May 13 21:22:23 archlinux kernel: Freeing initrd memory: 44416K
May 13 21:22:23 archlinux kernel: ACPI: bus type drm_connector registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [twl] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [twl6040] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [adp5520] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [crystal_cove_i2c] 
registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [CHT Whiskey Cove 
PMIC] registered
May 13 21:22:23 archlinux kernel: usbcore: registered new interface 
driver usbserial_generic
May 13 21:22:23 archlinux kernel: usbserial: USB Serial support 
registered for generic
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: RTC can wake from S4
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: registered as rtc0
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: setting system clock 
to 2024-05-14T02:22:23 UTC (1715653343)
May 13 21:22:23 archlinux kernel: rtc_cmos 00:01: alarms up to one 
month, 114 bytes nvram
May 13 21:22:23 archlinux kernel: ledtrig-cpu: registered to indicate 
activity on CPUs
May 13 21:22:23 archlinux kernel: [drm] Initialized simpledrm 1.0.0 
20200625 for simple-framebuffer.0 on minor 0
May 13 21:22:23 archlinux kernel: fbcon: Deferring console take-over
May 13 21:22:23 archlinux kernel: simple-framebuffer 
simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
May 13 21:22:23 archlinux kernel: hid: raw HID events driver (C) Jiri Kosina
May 13 21:22:23 archlinux kernel: i2c-core: driver [i2c_hid_acpi] registered
May 13 21:22:23 archlinux kernel: i2c-core: driver [i2c_hid_of] registered
May 13 21:22:23 archlinux kernel: drop_monitor: Initializing network 
drop monitor service
May 13 21:22:23 archlinux kernel: Initializing XFRM netlink socket
May 13 21:22:23 archlinux kernel: NET: Registered PF_INET6 protocol family
May 13 21:22:23 archlinux kernel: i2c_hid_acpi i2c-FRMW0003:00: probe
May 13 21:22:23 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: probe
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: Segment Routing with IPv6
May 13 21:22:23 archlinux kernel: RPL Segment Routing with IPv6
May 13 21:22:23 archlinux kernel: In-situ OAM (IOAM) with IPv6
May 13 21:22:23 archlinux kernel: NET: Registered PF_PACKET protocol family
May 13 21:22:23 archlinux kernel: microcode: Current revision: 0x0a704104
May 13 21:22:23 archlinux kernel: resctrl: L3 allocation detected
May 13 21:22:23 archlinux kernel: resctrl: MB allocation detected
May 13 21:22:23 archlinux kernel: resctrl: SMBA allocation detected
May 13 21:22:23 archlinux kernel: resctrl: L3 monitoring detected
May 13 21:22:23 archlinux kernel: IPI shorthand broadcast: enabled
May 13 21:22:23 archlinux kernel: sched_clock: Marking stable 
(651001927, 411081)->(654792400, -3379392)
May 13 21:22:23 archlinux kernel: Timer migration: 2 hierarchy levels; 8 
children per group; 2 crossnode level
May 13 21:22:23 archlinux kernel: registered taskstats version 1
May 13 21:22:23 archlinux kernel: Loading compiled-in X.509 certificates
May 13 21:22:23 archlinux kernel: Loaded X.509 cert 'Build time 
autogenerated kernel key: 161dd99ad2105d15c2e668632f302bd716d59ec5'
May 13 21:22:23 archlinux kernel: zswap: loaded using pool zstd/zsmalloc
May 13 21:22:23 archlinux kernel: Key type .fscrypt registered
May 13 21:22:23 archlinux kernel: Key type fscrypt-provisioning registered
May 13 21:22:23 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:22:23 archlinux kernel: integrity: Loaded X.509 cert 'Database 
Key: 00ce72b3aa39818d7d19c223fba64f8770'
May 13 21:22:23 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:22:23 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Corporation UEFI CA 2011: 
13adbf4309bd82709c8cd54f316ed522988a1bd4'
May 13 21:22:23 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:22:23 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Windows Production PCA 2011: 
a92902398e16c49778cd90f99e4f9ae17c55af53'
May 13 21:22:23 archlinux kernel: PM:   Magic number: 8:78:359
May 13 21:22:23 archlinux kernel: machinecheck machinecheck15: hash matches
May 13 21:22:23 archlinux kernel: acpi AMDI0063:00: hash matches
May 13 21:22:23 archlinux kernel: RAS: Correctable Errors collector 
initialized.
May 13 21:22:23 archlinux kernel: clk: Disabling unused clocks
May 13 21:22:23 archlinux kernel: PM: genpd: Disabling unused power domains
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x500
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:22:23 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:22:23 archlinux kernel: hid-generic 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:22:23 archlinux kernel: Freeing unused decrypted memory: 2028K
May 13 21:22:23 archlinux kernel: Freeing unused kernel image (initmem) 
memory: 3412K
May 13 21:22:23 archlinux kernel: Write protecting the kernel read-only 
data: 32768k
May 13 21:22:23 archlinux kernel: Freeing unused kernel image 
(rodata/data gap) memory: 836K
May 13 21:22:23 archlinux kernel: x86/mm: Checked W+X mappings: passed, 
no W+X pages found.
May 13 21:22:23 archlinux kernel: rodata_test: all tests were successful
May 13 21:22:23 archlinux kernel: Run /init as init process
May 13 21:22:23 archlinux kernel:   with arguments:
May 13 21:22:23 archlinux kernel:     /init
May 13 21:22:23 archlinux kernel:     splash
May 13 21:22:23 archlinux kernel:   with environment:
May 13 21:22:23 archlinux kernel:     HOME=/
May 13 21:22:23 archlinux kernel:     TERM=linux
May 13 21:22:23 archlinux systemd[1]: systemd 255.6-1-arch running in 
system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT 
+GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC 
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT 
default-hierarchy=unified)
May 13 21:22:23 archlinux systemd[1]: Detected architecture x86-64.
May 13 21:22:23 archlinux systemd[1]: Running in initrd.
May 13 21:22:23 archlinux systemd[1]: Initializing machine ID from 
random generator.
May 13 21:22:23 archlinux systemd[1]: Queued start job for default 
target Initrd Default Target.
May 13 21:22:23 archlinux systemd[1]: Created slice Slice 
/system/systemd-cryptsetup.
May 13 21:22:23 archlinux systemd[1]: Expecting device 
/dev/disk/by-uuid/496f2909-055b-49f7-9a43-b48647d757a9...
May 13 21:22:23 archlinux systemd[1]: Expecting device /dev/mapper/root...
May 13 21:22:23 archlinux systemd[1]: Reached target Slice Units.
May 13 21:22:23 archlinux systemd[1]: Reached target Swaps.
May 13 21:22:23 archlinux systemd[1]: Reached target Timer Units.
May 13 21:22:23 archlinux systemd[1]: Listening on Journal Socket 
(/dev/log).
May 13 21:22:23 archlinux systemd[1]: Listening on Journal Socket.
May 13 21:22:23 archlinux systemd[1]: Listening on udev Control Socket.
May 13 21:22:23 archlinux systemd[1]: Listening on udev Kernel Socket.
May 13 21:22:23 archlinux systemd[1]: Reached target Socket Units.
May 13 21:22:23 archlinux systemd[1]: Starting Create List of Static 
Device Nodes...
May 13 21:22:23 archlinux systemd[1]: Starting Journal Service...
May 13 21:22:23 archlinux systemd[1]: Starting Load Kernel Modules...
May 13 21:22:23 archlinux systemd[1]: Starting TPM2 PCR Barrier (initrd)...
May 13 21:22:23 archlinux systemd[1]: Starting Create Static Device 
Nodes in /dev...
May 13 21:22:23 archlinux systemd[1]: Starting Coldplug All udev Devices...
May 13 21:22:23 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:22:23 archlinux systemd[1]: Finished Create List of Static 
Device Nodes.
May 13 21:22:23 archlinux systemd-journald[201]: Collecting audit 
messages is disabled.
May 13 21:22:23 archlinux systemd[1]: Finished Create Static Device 
Nodes in /dev.
May 13 21:22:23 archlinux systemd[1]: Reached target Preparation for 
Local File Systems.
May 13 21:22:23 archlinux systemd[1]: Reached target Local File Systems.
May 13 21:22:23 archlinux systemd[1]: Starting Rule-based Manager for 
Device Events and Files...
May 13 21:22:23 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:22:23 archlinux systemd[1]: Started Rule-based Manager for 
Device Events and Files.
May 13 21:22:23 archlinux kernel: ACPI: video: Video Device [VGA] 
(multi-head: yes  rom: no  post: no)
May 13 21:22:23 archlinux kernel: input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1a/LNXVIDEO:00/input/input2
May 13 21:22:23 archlinux systemd-journald[201]: Journal started
May 13 21:22:23 archlinux systemd-journald[201]: Runtime Journal 
(/run/log/journal/f7353e9bdff648a29e5930fd55db0c2f) is 8.0M, max 1.1G, 
1.1G free.
May 13 21:22:23 archlinux systemd-vconsole-setup[207]: /usr/bin/setfont 
failed with a "system error" (EX_OSERR), ignoring.
May 13 21:22:23 archlinux systemd-vconsole-setup[207]: Setting source 
virtual console failed, ignoring remaining ones.
May 13 21:22:23 archlinux systemd-vconsole-setup[213]: setfont: ERROR 
kdfontop.c:183 put_font_kdfontop: Unable to load such font with such 
kernel version
May 13 21:22:23 archlinux systemd[1]: Started Journal Service.
May 13 21:22:23 archlinux systemd-pcrextend[203]: Extended PCR index 11 
with 'enter-initrd' (banks sha256).
May 13 21:22:23 archlinux systemd[1]: Finished Coldplug All udev Devices.
May 13 21:22:23 archlinux systemd[1]: Finished TPM2 PCR Barrier (initrd).
May 13 21:22:23 archlinux kernel: cryptd: max_cpu_qlen set to 1000
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 1
May 13 21:22:23 archlinux kernel: hid-sensor-hub 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: hcc params 
0x0128ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 2
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb1: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb1: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb1: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb1: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb1: SerialNumber: 0000:c4:00.3
May 13 21:22:23 archlinux kernel: hub 1-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 1-0:1.0: 5 ports detected
May 13 21:22:23 archlinux kernel: ccp 0000:c4:00.2: tee enabled
May 13 21:22:23 archlinux kernel: nvme 0000:05:00.0: platform quirk: 
setting simple suspend
May 13 21:22:23 archlinux kernel: nvme nvme0: pci function 0000:05:00.0
May 13 21:22:23 archlinux kernel: ccp 0000:c4:00.2: psp enabled
May 13 21:22:23 archlinux kernel: usb usb2: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb2: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb2: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb2: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb2: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb2: SerialNumber: 0000:c4:00.3
May 13 21:22:23 archlinux kernel: hub 2-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 2-0:1.0: 2 ports detected
May 13 21:22:23 archlinux kernel: AVX2 version of gcm_enc/dec engaged.
May 13 21:22:23 archlinux kernel: AES CTR mode by8 optimization enabled
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 3
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 4
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c4:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb3: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb3: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb3: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb3: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb3: SerialNumber: 0000:c4:00.4
May 13 21:22:23 archlinux kernel: hub 3-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 3-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: usb usb4: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb4: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb4: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb4: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb4: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb4: SerialNumber: 0000:c4:00.4
May 13 21:22:23 archlinux kernel: hub 4-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 4-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 5
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 6
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb5: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb5: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb5: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb5: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb5: SerialNumber: 0000:c6:00.3
May 13 21:22:23 archlinux kernel: hub 5-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 5-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: usb usb6: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb6: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb6: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb6: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb6: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb6: SerialNumber: 0000:c6:00.3
May 13 21:22:23 archlinux kernel: hub 6-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 6-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: nvme nvme0: D3 entry latency set to 10 
seconds
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 7
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 8
May 13 21:22:23 archlinux kernel: xhci_hcd 0000:c6:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:22:23 archlinux kernel: usb usb7: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb7: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb7: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb7: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb7: SerialNumber: 0000:c6:00.4
May 13 21:22:23 archlinux kernel: hub 7-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 7-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: usb usb8: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:22:23 archlinux kernel: usb usb8: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:22:23 archlinux kernel: usb usb8: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:22:23 archlinux kernel: usb usb8: Product: xHCI Host Controller
May 13 21:22:23 archlinux kernel: usb usb8: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:22:23 archlinux kernel: usb usb8: SerialNumber: 0000:c6:00.4
May 13 21:22:23 archlinux kernel: hub 8-0:1.0: USB hub found
May 13 21:22:23 archlinux kernel: hub 8-0:1.0: 1 port detected
May 13 21:22:23 archlinux kernel: nvme nvme0: 16/0/0 default/read/poll 
queues
May 13 21:22:23 archlinux kernel:  nvme0n1: p1 p2
May 13 21:22:23 archlinux systemd[1]: Starting Show Plymouth Boot Screen...
May 13 21:22:23 archlinux systemd[1]: Received SIGRTMIN+20 from PID 277 
(plymouthd).
May 13 21:22:23 archlinux systemd[1]: Found device Samsung SSD 990 PRO 
4TB 2.
May 13 21:22:23 archlinux systemd[1]: Starting Cryptography Setup for 
root...
May 13 21:22:23 archlinux systemd[1]: systemd-vconsole-setup.service: 
Deactivated successfully.
May 13 21:22:23 archlinux systemd[1]: Stopped Virtual Console Setup.
May 13 21:22:23 archlinux systemd[1]: Stopping Virtual Console Setup...
May 13 21:22:23 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:22:23 archlinux systemd-vconsole-setup[284]: setfont: ERROR 
kdfontop.c:183 put_font_kdfontop: Unable to load such font with such 
kernel version
May 13 21:22:23 archlinux systemd-vconsole-setup[281]: /usr/bin/setfont 
failed with a "system error" (EX_OSERR), ignoring.
May 13 21:22:23 archlinux systemd[1]: Received SIGRTMIN+20 from PID 277 
(plymouthd).
May 13 21:22:23 archlinux systemd[1]: Started Show Plymouth Boot Screen.
May 13 21:22:23 archlinux systemd[1]: Dispatch Password Requests to 
Console Directory Watch was skipped because of an unmet condition check 
(ConditionPathExists=!/run/plymouth/pid).
May 13 21:22:23 archlinux systemd[1]: Started Forward Password Requests 
to Plymouth Directory Watch.
May 13 21:22:23 archlinux systemd[1]: Reached target Path Units.
May 13 21:22:23 archlinux systemd-vconsole-setup[281]: Setting source 
virtual console failed, ignoring remaining ones.
May 13 21:22:23 archlinux systemd[1]: Starting Check battery level 
during early boot...
May 13 21:22:23 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:22:23 archlinux systemd[1]: Finished Check battery level 
during early boot.
May 13 21:22:23 archlinux systemd[1]: Started Displays emergency message 
in full screen..
May 13 21:22:23 archlinux kernel: device-mapper: uevent: version 1.0.3
May 13 21:22:23 archlinux kernel: device-mapper: ioctl: 4.48.0-ioctl 
(2023-03-01) initialised: dm-devel@lists.linux.dev
May 13 21:22:24 archlinux kernel: usb 1-2: new high-speed USB device 
number 2 using xhci_hcd
May 13 21:22:24 archlinux kernel: tsc: Refined TSC clocksource 
calibration: 3992.499 MHz
May 13 21:22:24 archlinux kernel: clocksource: tsc: mask: 
0xffffffffffffffff max_cycles: 0x73195d51b0d, max_idle_ns: 881590506186 ns
May 13 21:22:24 archlinux kernel: clocksource: Switched to clocksource tsc
May 13 21:22:24 archlinux kernel: usb 1-2: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=34.04
May 13 21:22:24 archlinux kernel: usb 1-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:22:24 archlinux kernel: usb 1-2: Product: USB2.1 Hub
May 13 21:22:24 archlinux kernel: usb 1-2: Manufacturer: GenesysLogic
May 13 21:22:24 archlinux kernel: hub 1-2:1.0: USB hub found
May 13 21:22:24 archlinux kernel: hub 1-2:1.0: 4 ports detected
May 13 21:22:24 archlinux kernel: usb 2-2: new SuperSpeed Plus Gen 2x1 
USB device number 2 using xhci_hcd
May 13 21:22:24 archlinux kernel: usb 2-2: New USB device found, 
idVendor=05e3, idProduct=0625, bcdDevice=34.04
May 13 21:22:24 archlinux kernel: usb 2-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:22:24 archlinux kernel: usb 2-2: Product: USB3.2 Hub
May 13 21:22:24 archlinux kernel: usb 2-2: Manufacturer: GenesysLogic
May 13 21:22:24 archlinux kernel: hub 2-2:1.0: USB hub found
May 13 21:22:24 archlinux kernel: hub 2-2:1.0: 3 ports detected
May 13 21:22:24 archlinux kernel: usb 1-3: new high-speed USB device 
number 3 using xhci_hcd
May 13 21:22:24 archlinux kernel: [drm] amdgpu kernel modesetting enabled.
May 13 21:22:24 archlinux kernel: amdgpu: vga_switcheroo: detected 
switching method \_SB_.PCI0.GP17.VGA_.ATPX handle
May 13 21:22:24 archlinux kernel: amdgpu: ATPX version 1, functions 
0x00000801
May 13 21:22:24 archlinux kernel: amdgpu: ATPX Hybrid Graphics
May 13 21:22:24 archlinux kernel: Key type trusted registered
May 13 21:22:24 archlinux kernel: amdgpu: Virtual CRAT table created for CPU
May 13 21:22:24 archlinux kernel: amdgpu: Topology: Add CPU node
May 13 21:22:24 archlinux kernel: amdgpu 0000:03:00.0: enabling device 
(0000 -> 0003)
May 13 21:22:24 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x7480 0xF111:0x0007 0xC1).
May 13 21:22:24 archlinux kernel: [drm] register mmio base: 0x90C00000
May 13 21:22:24 archlinux kernel: [drm] register mmio size: 1048576
May 13 21:22:24 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:22:24 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:22:24 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ACPI VFCT 
table present but broken (too short #2),skipping
May 13 21:22:24 archlinux kernel: [drm] BIOS signature incorrect ee a3
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Fetched 
VBIOS from ROM BAR
May 13 21:22:25 archlinux kernel: amdgpu: ATOM BIOS: 113-BRT125778.001
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: CP RS64 
enable
May 13 21:22:25 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature not supported
May 13 21:22:25 archlinux kernel: [drm] GPU posting now...
May 13 21:22:25 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: VRAM: 
8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:22:25 archlinux kernel: [drm] Detected VRAM RAM=8176M, BAR=8192M
May 13 21:22:25 archlinux kernel: [drm] RAM width 128bits GDDR6
May 13 21:22:25 archlinux kernel: [drm] amdgpu: 8176M of VRAM memory ready
May 13 21:22:25 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:22:25 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:22:25 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000081FEB00000).
May 13 21:22:25 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x07002800
May 13 21:22:25 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:22:25 archlinux kernel: usb 1-3: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:22:25 archlinux kernel: usb 1-3: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:22:25 archlinux kernel: usb 1-3: Product: USB2.0 Hub
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: reserve 
0x1300000 from 0x81fc000000 for PSP TMR
May 13 21:22:25 archlinux kernel: hub 1-3:1.0: USB hub found
May 13 21:22:25 archlinux kernel: hub 1-3:1.0: 3 ports detected
May 13 21:22:25 archlinux kernel: usb 1-2.1: new low-speed USB device 
number 4 using xhci_hcd
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:22:25 archlinux kernel: Key type encrypted registered
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: smu 
driver if version = 0x00000035, smu fw if version = 0x00000040, smu fw 
program = 0, smu fw version = 0x00525800 (82.88.0)
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU 
driver if version not matched
May 13 21:22:25 archlinux systemd[1]: Found device /dev/mapper/root.
May 13 21:22:25 archlinux systemd[1]: Finished Cryptography Setup for root.
May 13 21:22:25 archlinux systemd[1]: Reached target Local Encrypted 
Volumes.
May 13 21:22:25 archlinux systemd[1]: Reached target Initrd Root Device.
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:22:25 archlinux kernel: amdgpu 0000:03:00.0: [drm] Unsupported 
pwrseq engine id: 2!
May 13 21:22:25 archlinux kernel: ------------[ cut here ]------------
May 13 21:22:25 archlinux kernel: WARNING: CPU: 6 PID: 202 at 
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:22:25 archlinux kernel: Modules linked in: dm_crypt 
crct10dif_pclmul cbc crc32_pclmul crc32c_intel polyval_clmulni 
encrypted_keys polyval_generic gf128mul trusted ghash_clmulni_intel 
sha512_ssse3 asn1_encoder tee sha256_ssse3 dm_mod sha1_ssse3 aesni_intel 
nvme crypto_simd cryptd hid_sensor_hub xhci_pci ccp nvme_core 
xhci_pci_renesas amdgpu(+) video wmi amdxcp i2c_algo_bit drm_ttm_helper 
ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy drm_display_helper cec
May 13 21:22:25 archlinux kernel: CPU: 6 PID: 202 Comm: systemd-modules 
Not tainted 6.9.0-1-git-01560-ga7c840ba5fa7 #1 
96970f0beb2353c3fc8dc8c8e87ebf0f642b2644
May 13 21:22:25 archlinux kernel: Hardware name: Framework Laptop 16 
(AMD Ryzen 7040 Series)/FRANMZCP09, BIOS 03.03 03/27/2024
May 13 21:22:25 archlinux kernel: RIP: 
0010:dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:22:25 archlinux kernel: Code: b8 15 ef c0 e8 01 f6 85 f3 e9 2d 
89 f5 ff 48 8b 40 10 48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c7 c6 08 16 
ef c0 e8 e0 f5 85 f3 <0f> 0b ba 0f 00 00 00 e9 f5 8d f5 ff 48 8b 43 08 
48 8b 40 10 48 8b
May 13 21:22:25 archlinux kernel: RSP: 0018:ffffac484062f058 EFLAGS: 
00010246
May 13 21:22:25 archlinux kernel: RAX: 0000000000000000 RBX: 
ffff908114c7ac00 RCX: 0000000000000027
May 13 21:22:25 archlinux kernel: RDX: 0000000000000000 RSI: 
0000000000000001 RDI: ffff908f61d219c0
May 13 21:22:25 archlinux kernel: RBP: ffffac484062f090 R08: 
0000000000000000 R09: ffffac484062edd0
May 13 21:22:25 archlinux kernel: R10: ffffffffb54b2388 R11: 
0000000000000003 R12: ffff908107cb0800
May 13 21:22:25 archlinux kernel: R13: ffffffffc0d94940 R14: 
ffffac484062f448 R15: ffff90810dd55000
May 13 21:22:25 archlinux kernel: FS:  00007f816cae3640(0000) 
GS:ffff908f61d00000(0000) knlGS:0000000000000000
May 13 21:22:25 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
May 13 21:22:25 archlinux kernel: CR2: 000055ab69724788 CR3: 
0000000105462000 CR4: 0000000000f50ef0
May 13 21:22:25 archlinux kernel: PKRU: 55555554
May 13 21:22:25 archlinux kernel: Call Trace:
May 13 21:22:25 archlinux kernel:  <TASK>
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? __warn.cold+0x8e/0xe8
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? report_bug+0xff/0x140
May 13 21:22:25 archlinux kernel:  ? handle_bug+0x3c/0x80
May 13 21:22:25 archlinux kernel:  ? exc_invalid_op+0x17/0x70
May 13 21:22:25 archlinux kernel:  ? asm_exc_invalid_op+0x1a/0x20
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel: dcn32_panel_cntl_create+0x37/0x50 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  construct_phy+0x951/0xc10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? __alloc_pages+0x182/0x350
May 13 21:22:25 archlinux kernel:  link_create+0x1ba/0x200 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  create_links+0x134/0x420 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  dc_create+0x316/0x650 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel: amdgpu_dm_init.isra.0+0x32b/0x1d90 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? vprintk_emit+0x176/0x2a0
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? dev_vprintk_emit+0x181/0x1b0
May 13 21:22:25 archlinux kernel:  ? 
smu_cmn_send_smc_msg_with_param+0x21b/0x340 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  dm_hw_init+0x12/0x30 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel: amdgpu_device_init.cold+0x1ad3/0x20fb 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel: amdgpu_driver_load_kms+0x19/0x110 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  amdgpu_pci_probe+0x187/0x400 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  local_pci_probe+0x42/0x90
May 13 21:22:25 archlinux kernel:  pci_device_probe+0xbd/0x290
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? sysfs_do_create_link_sd+0x6e/0xe0
May 13 21:22:25 archlinux kernel:  really_probe+0xdb/0x340
May 13 21:22:25 archlinux kernel:  ? pm_runtime_barrier+0x54/0x90
May 13 21:22:25 archlinux kernel:  ? __pfx___driver_attach+0x10/0x10
May 13 21:22:25 archlinux kernel: __driver_probe_device+0x78/0x110
May 13 21:22:25 archlinux kernel:  driver_probe_device+0x1f/0xa0
May 13 21:22:25 archlinux kernel:  __driver_attach+0xba/0x1c0
May 13 21:22:25 archlinux kernel:  bus_for_each_dev+0x8c/0xe0
May 13 21:22:25 archlinux kernel:  bus_add_driver+0x116/0x1f0
May 13 21:22:25 archlinux kernel:  driver_register+0x72/0xd0
May 13 21:22:25 archlinux kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:22:25 archlinux kernel:  do_one_initcall+0x58/0x310
May 13 21:22:25 archlinux kernel:  do_init_module+0x60/0x220
May 13 21:22:25 archlinux kernel:  init_module_from_file+0x89/0xe0
May 13 21:22:25 archlinux kernel: idempotent_init_module+0x121/0x2b0
May 13 21:22:25 archlinux kernel: __x64_sys_finit_module+0x5e/0xb0
May 13 21:22:25 archlinux kernel:  do_syscall_64+0x82/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? generic_update_time+0x4e/0x60
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? touch_atime+0xb5/0x120
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? filemap_read+0x343/0x370
May 13 21:22:25 archlinux kernel:  ? vfs_read+0x2a2/0x360
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? vfs_read+0x2a2/0x360
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:22:25 archlinux kernel: entry_SYSCALL_64_after_hwframe+0x76/0x7e
May 13 21:22:25 archlinux kernel: RIP: 0033:0x7f816d59ee9d
May 13 21:22:25 archlinux kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 de 0c 00 
f7 d8 64 89 01 48
May 13 21:22:25 archlinux kernel: RSP: 002b:00007ffe7c38adb8 EFLAGS: 
00000246 ORIG_RAX: 0000000000000139
May 13 21:22:25 archlinux kernel: RAX: ffffffffffffffda RBX: 
000055975168a440 RCX: 00007f816d59ee9d
May 13 21:22:25 archlinux kernel: RDX: 0000000000000004 RSI: 
00007f816d6b8376 RDI: 0000000000000011
May 13 21:22:25 archlinux kernel: RBP: 00007f816d6b8376 R08: 
00007f816d66db20 R09: 00007ffe7c38ae00
May 13 21:22:25 archlinux kernel: R10: 000055975168f610 R11: 
0000000000000246 R12: 0000000000020000
May 13 21:22:25 archlinux kernel: R13: 000055975168a8e0 R14: 
0000000000000000 R15: 000055975168f5d0
May 13 21:22:25 archlinux kernel:  </TASK>
May 13 21:22:25 archlinux kernel: ---[ end trace 0000000000000000 ]---
May 13 21:22:25 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.2.1
May 13 21:22:25 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:22:25 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x07002800
May 13 21:22:25 archlinux systemd[1]: Starting File System Check on 
/dev/mapper/root...
May 13 21:22:25 archlinux kernel: usb 1-2.1: New USB device found, 
idVendor=046d, idProduct=c019, bcdDevice=43.01
May 13 21:22:25 archlinux kernel: usb 1-2.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:22:25 archlinux kernel: usb 1-2.1: Product: USB Optical Mouse
May 13 21:22:25 archlinux kernel: usb 1-2.1: Manufacturer: Logitech
May 13 21:22:25 archlinux systemd-fsck[330]: artemisfs: clean, 
1408603/244129792 files, 524325451/976487936 blocks
May 13 21:22:25 archlinux systemd[1]: Finished File System Check on 
/dev/mapper/root.
May 13 21:22:25 archlinux systemd[1]: Mounting /sysroot...
May 13 21:22:25 archlinux kernel: input: Logitech USB Optical Mouse as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-2/1-2.1/1-2.1:1.0/0003:046D:C019.0002/input/input3
May 13 21:22:25 archlinux kernel: hid-generic 0003:046D:C019.0002: 
input,hidraw1: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on 
usb-0000:c4:00.3-2.1/input0
May 13 21:22:25 archlinux kernel: usbcore: registered new interface 
driver usbhid
May 13 21:22:25 archlinux kernel: usbhid: USB HID core driver
May 13 21:22:25 archlinux kernel: usb 1-4: new high-speed USB device 
number 5 using xhci_hcd
May 13 21:22:25 archlinux systemd[1]: Mounted /sysroot.
May 13 21:22:25 archlinux systemd[1]: Reached target Initrd Root File 
System.
May 13 21:22:25 archlinux kernel: EXT4-fs (dm-0): orphan cleanup on 
readonly fs
May 13 21:22:25 archlinux kernel: EXT4-fs (dm-0): mounted filesystem 
fc8e5470-776d-4f4b-bc64-89a425bea162 ro with ordered data mode. Quota 
mode: none.
May 13 21:22:25 archlinux systemd[1]: Starting Mountpoints Configured in 
the Real Root...
May 13 21:22:25 archlinux systemd[1]: initrd-parse-etc.service: 
Deactivated successfully.
May 13 21:22:25 archlinux systemd[1]: Finished Mountpoints Configured in 
the Real Root.
May 13 21:22:25 archlinux systemd[1]: Reached target Initrd File Systems.
May 13 21:22:25 archlinux kernel: usb 1-4: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:22:25 archlinux kernel: usb 1-4: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:22:25 archlinux kernel: usb 1-4: Product: USB2.0 Hub
May 13 21:22:25 archlinux kernel: hub 1-4:1.0: USB hub found
May 13 21:22:25 archlinux kernel: hub 1-4:1.0: 4 ports detected
May 13 21:22:25 archlinux kernel: usb 1-3.2: new full-speed USB device 
number 6 using xhci_hcd
May 13 21:22:25 archlinux kernel: usb 1-3.2: unable to get BOS 
descriptor set
May 13 21:22:25 archlinux kernel: usb 1-3.2: New USB device found, 
idVendor=32ac, idProduct=0014, bcdDevice= 0.29
May 13 21:22:25 archlinux kernel: usb 1-3.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:22:25 archlinux kernel: usb 1-3.2: Product: Laptop 16 Numpad 
Module
May 13 21:22:25 archlinux kernel: usb 1-3.2: Manufacturer: Framework
May 13 21:22:25 archlinux kernel: usb 1-3.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:22:25 archlinux kernel: i2c i2c-2: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:22:25 archlinux kernel: usb 1-5: new high-speed USB device 
number 7 using xhci_hcd
May 13 21:22:25 archlinux kernel: input: Framework Laptop 16 Numpad 
Module as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.0/0003:32AC:0014.0003/input/input4
May 13 21:22:25 archlinux kernel: usb 1-5: New USB device found, 
idVendor=0e8d, idProduct=e616, bcdDevice= 1.00
May 13 21:22:25 archlinux kernel: usb 1-5: New USB device strings: 
Mfr=5, Product=6, SerialNumber=7
May 13 21:22:25 archlinux kernel: usb 1-5: Product: Wireless_Device
May 13 21:22:25 archlinux kernel: usb 1-5: Manufacturer: MediaTek Inc.
May 13 21:22:25 archlinux kernel: usb 1-5: SerialNumber: 000000000
May 13 21:22:25 archlinux kernel: hid-generic 0003:32AC:0014.0003: 
input,hidraw2: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input0
May 13 21:22:25 archlinux kernel: hid-generic 0003:32AC:0014.0004: 
hiddev96,hidraw3: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input1
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input5
May 13 21:22:26 archlinux kernel: usb 1-4.1: new full-speed USB device 
number 8 using xhci_hcd
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input6
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input7
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0005/input/input8
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0014.0005: 
input,hidraw4: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input2
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0014.0006: 
hiddev97,hidraw5: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input3
May 13 21:22:26 archlinux kernel: usb 1-4.1: New USB device found, 
idVendor=27c6, idProduct=609c, bcdDevice= 1.00
May 13 21:22:26 archlinux kernel: usb 1-4.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:22:26 archlinux kernel: usb 1-4.1: Product: Goodix Fingerprint 
USB Device
May 13 21:22:26 archlinux kernel: usb 1-4.1: Manufacturer: Goodix 
Technology Co., Ltd.
May 13 21:22:26 archlinux kernel: usb 1-4.1: SerialNumber: 
UIDCBAC4037_XXXX_MOC_B0
May 13 21:22:26 archlinux kernel: usb 1-4.2: new full-speed USB device 
number 9 using xhci_hcd
May 13 21:22:26 archlinux kernel: usb 1-4.2: unable to get BOS 
descriptor set
May 13 21:22:26 archlinux kernel: usb 1-4.2: New USB device found, 
idVendor=32ac, idProduct=0012, bcdDevice= 0.29
May 13 21:22:26 archlinux kernel: usb 1-4.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:22:26 archlinux kernel: usb 1-4.2: Product: Laptop 16 Keyboard 
Module - ANSI
May 13 21:22:26 archlinux kernel: usb 1-4.2: Manufacturer: Framework
May 13 21:22:26 archlinux kernel: usb 1-4.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.0/0003:32AC:0012.0007/input/input9
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.0007: 
input,hidraw6: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input0
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.0008: 
hiddev98,hidraw7: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input1
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input10
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input11
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input12
May 13 21:22:26 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.0009/input/input13
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.0009: 
input,hidraw8: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input2
May 13 21:22:26 archlinux kernel: hid-generic 0003:32AC:0012.000A: 
hiddev99,hidraw9: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input3
May 13 21:22:27 archlinux kernel: i2c i2c-3: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:22:27 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:22:27 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:22:27 archlinux kernel: amdgpu: HMM registered 8176MB device 
memory
May 13 21:22:27 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:22:27 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:22:27 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:22:27 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x7480:0x1002]
May 13 21:22:27 archlinux kernel: kfd kfd: amdgpu: added device 1002:7480
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SE 2, SH 
per SE 2, CU per SH 8, active_cu_number 32
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma1 uses VM inv eng 13 on hub 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
May 13 21:22:27 archlinux kernel: [drm] ring gfx_32768.1.1 was added
May 13 21:22:27 archlinux kernel: [drm] ring compute_32768.2.2 was added
May 13 21:22:27 archlinux kernel: [drm] ring sdma_32768.3.3 was added
May 13 21:22:27 archlinux kernel: [drm] ring gfx_32768.1.1 ib test pass
May 13 21:22:27 archlinux kernel: [drm] ring compute_32768.2.2 ib test pass
May 13 21:22:27 archlinux kernel: [drm] ring sdma_32768.3.3 ib test pass
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Using 
BOCO for runtime pm
May 13 21:22:27 archlinux kernel: i2c i2c-4: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:22:27 archlinux kernel: i2c i2c-5: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:22:27 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:03:00.0 on minor 1
May 13 21:22:27 archlinux kernel: amdgpu 0000:03:00.0: [drm] Cannot find 
any crtc or sizes
May 13 21:22:27 archlinux kernel: [drm] DSC precompute is not needed.
May 13 21:22:27 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x15BF 0xF111:0x0005 0xC1).
May 13 21:22:27 archlinux kernel: [drm] register mmio base: 0x90500000
May 13 21:22:27 archlinux kernel: [drm] register mmio size: 524288
May 13 21:22:27 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:22:27 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Fetched 
VBIOS from VFCT
May 13 21:22:27 archlinux kernel: amdgpu: ATOM BIOS: 113-PHXGENERIC-001
May 13 21:22:27 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: vgaarb: 
deactivate vga console
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature enabled
May 13 21:22:27 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: VRAM: 
4096M 0x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:22:27 archlinux kernel: [drm] Detected VRAM RAM=4096M, BAR=4096M
May 13 21:22:27 archlinux kernel: [drm] RAM width 128bits DDR5
May 13 21:22:27 archlinux kernel: [drm] amdgpu: 4096M of VRAM memory ready
May 13 21:22:27 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:22:27 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:22:27 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000080FFD00000).
May 13 21:22:27 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x08003700
May 13 21:22:27 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:22:27 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: reserve 
0x4000000 from 0x80f8000000 for PSP TMR
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:22:28 archlinux kernel: [drm] Seamless boot condition check passed
May 13 21:22:28 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.1.4
May 13 21:22:28 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:22:28 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x08003700
May 13 21:22:28 archlinux kernel: i2c i2c-6: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:22:28 archlinux kernel: [drm] PSR support 1, DC PSR ver 0, 
sink PSR ver 1 DPCD caps 0x2a su_y_granularity 0
May 13 21:22:28 archlinux kernel: i2c i2c-7: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:22:28 archlinux kernel: i2c i2c-8: adapter [AMDGPU DM i2c hw 
bus 2] registered
May 13 21:22:28 archlinux kernel: i2c i2c-9: adapter [AMDGPU DM i2c hw 
bus 3] registered
May 13 21:22:28 archlinux kernel: i2c i2c-10: adapter [AMDGPU DM i2c hw 
bus 4] registered
May 13 21:22:28 archlinux kernel: i2c i2c-11: adapter [AMDGPU DM i2c hw 
bus 5] registered
May 13 21:22:28 archlinux kernel: i2c i2c-12: adapter [AMDGPU DM i2c hw 
bus 6] registered
May 13 21:22:28 archlinux kernel: i2c i2c-13: adapter [AMDGPU DM i2c hw 
bus 7] registered
May 13 21:22:28 archlinux kernel: i2c i2c-14: adapter [AMDGPU DM i2c hw 
bus 8] registered
May 13 21:22:28 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:22:28 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:22:28 archlinux kernel: amdgpu: HMM registered 4096MB device 
memory
May 13 21:22:28 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:22:28 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:22:28 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:22:28 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x15bf:0x1002]
May 13 21:22:28 archlinux kernel: kfd kfd: amdgpu: added device 1002:15bf
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SE 1, SH 
per SE 2, CU per SH 6, active_cu_number 12
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
May 13 21:22:28 archlinux kernel: [drm] ring gfx_32770.1.1 was added
May 13 21:22:28 archlinux kernel: [drm] ring compute_32770.2.2 was added
May 13 21:22:28 archlinux kernel: [drm] ring sdma_32770.3.3 was added
May 13 21:22:28 archlinux kernel: [drm] ring gfx_32770.1.1 ib test pass
May 13 21:22:28 archlinux kernel: [drm] ring compute_32770.2.2 ib test pass
May 13 21:22:28 archlinux kernel: [drm] ring sdma_32770.3.3 ib test pass
May 13 21:22:28 archlinux kernel: i2c i2c-15: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:22:28 archlinux kernel: i2c i2c-16: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:22:28 archlinux kernel: i2c i2c-17: adapter [AMDGPU DM aux hw 
bus 2] registered
May 13 21:22:28 archlinux kernel: i2c i2c-18: adapter [AMDGPU DM aux hw 
bus 3] registered
May 13 21:22:28 archlinux kernel: i2c i2c-19: adapter [AMDGPU DM aux hw 
bus 4] registered
May 13 21:22:28 archlinux kernel: i2c i2c-20: adapter [AMDGPU DM aux hw 
bus 5] registered
May 13 21:22:28 archlinux kernel: i2c i2c-21: adapter [AMDGPU DM aux hw 
bus 6] registered
May 13 21:22:28 archlinux kernel: i2c i2c-22: adapter [AMDGPU DM aux hw 
bus 7] registered
May 13 21:22:28 archlinux kernel: i2c i2c-23: adapter [AMDGPU DM aux hw 
bus 8] registered
May 13 21:22:28 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:c4:00.0 on minor 2
May 13 21:22:28 archlinux kernel: fbcon: amdgpudrmfb (fb0) is primary device
May 13 21:22:28 archlinux kernel: fbcon: Deferring console take-over
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] fb0: 
amdgpudrmfb frame buffer device
May 13 21:22:28 archlinux systemd-modules-load[202]: Inserted module 
'amdgpu'
May 13 21:22:28 archlinux systemd-modules-load[202]: Module 'tpm_crb' is 
built in
May 13 21:22:28 archlinux systemd[1]: Finished Load Kernel Modules.
May 13 21:22:28 archlinux systemd[1]: Reached target System Initialization.
May 13 21:22:28 archlinux systemd[1]: Reached target Basic System.
May 13 21:22:28 archlinux systemd[1]: Reached target Initrd Default Target.
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:223
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:231
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:239
May 13 21:22:28 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:247
May 13 21:22:28 archlinux systemd[1]: Starting Cleaning Up and Shutting 
Down Daemons...
May 13 21:22:28 archlinux systemd[1]: Stopped target Initrd Default Target.
May 13 21:22:28 archlinux systemd[1]: Stopped target Basic System.
May 13 21:22:28 archlinux systemd[1]: Stopped target Initrd Root Device.
May 13 21:22:28 archlinux systemd[1]: Stopped target Path Units.
May 13 21:22:28 archlinux systemd[1]: Stopped target Slice Units.
May 13 21:22:28 archlinux systemd[1]: Stopped target Socket Units.
May 13 21:22:28 archlinux systemd[1]: Stopped target System Initialization.
May 13 21:22:28 archlinux systemd[1]: Stopped target Local Encrypted 
Volumes.
May 13 21:22:28 archlinux systemd[1]: Stopped target Local File Systems.
May 13 21:22:28 archlinux systemd[1]: Stopped target Preparation for 
Local File Systems.
May 13 21:22:28 archlinux systemd[1]: Stopped target Swaps.
May 13 21:22:28 archlinux systemd[1]: Stopped target Timer Units.
May 13 21:22:28 archlinux systemd[1]: kmod-static-nodes.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Create List of Static 
Device Nodes.
May 13 21:22:28 archlinux systemd[1]: Starting Plymouth switch root 
service...
May 13 21:22:28 archlinux systemd[1]: Stopping Displays emergency 
message in full screen....
May 13 21:22:28 archlinux systemd[1]: systemd-modules-load.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Load Kernel Modules.
May 13 21:22:28 archlinux systemd[1]: systemd-modules-load.service: 
Consumed 1.613s CPU time.
May 13 21:22:28 archlinux systemd[1]: Stopping TPM2 PCR Barrier (initrd)...
May 13 21:22:28 archlinux systemd[1]: systemd-udev-trigger.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Coldplug All udev Devices.
May 13 21:22:28 archlinux systemd[1]: Stopping Rule-based Manager for 
Device Events and Files...
May 13 21:22:28 archlinux systemd[1]: systemd-bsod.service: Deactivated 
successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Displays emergency message 
in full screen..
May 13 21:22:28 archlinux systemd[1]: initrd-cleanup.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Finished Cleaning Up and Shutting 
Down Daemons.
May 13 21:22:28 archlinux systemd[1]: systemd-battery-check.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Check battery level during 
early boot.
May 13 21:22:28 archlinux systemd[1]: systemd-udevd.service: Deactivated 
successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Rule-based Manager for 
Device Events and Files.
May 13 21:22:28 archlinux systemd[1]: systemd-udevd-control.socket: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Closed udev Control Socket.
May 13 21:22:28 archlinux systemd[1]: systemd-udevd-kernel.socket: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Closed udev Kernel Socket.
May 13 21:22:28 archlinux systemd[1]: Starting Cleanup udev Database...
May 13 21:22:28 archlinux systemd[1]: 
systemd-tmpfiles-setup-dev.service: Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped Create Static Device Nodes 
in /dev.
May 13 21:22:28 archlinux systemd-pcrextend[382]: Extended PCR index 11 
with 'leave-initrd' (banks sha256).
May 13 21:22:28 archlinux systemd[1]: systemd-pcrphase-initrd.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Stopped TPM2 PCR Barrier (initrd).
May 13 21:22:28 archlinux systemd[1]: initrd-udevadm-cleanup-db.service: 
Deactivated successfully.
May 13 21:22:28 archlinux systemd[1]: Finished Cleanup udev Database.
May 13 21:22:28 archlinux systemd[1]: Reached target Switch Root.
May 13 21:22:29 archlinux kernel: fbcon: Taking over console
May 13 21:22:29 archlinux kernel: Console: switching to colour frame 
buffer device 160x50
May 13 21:22:29 archlinux systemd[1]: Finished Plymouth switch root service.
May 13 21:22:29 archlinux systemd[1]: Starting Switch Root...
May 13 21:22:29 archlinux systemd[1]: Switching root.
May 13 21:22:29 archlinux systemd-journald[201]: Journal stopped
May 13 21:22:30 artemis systemd-journald[433]: Journal started
May 13 21:22:30 artemis systemd-journald[433]: Runtime Journal 
(/run/log/journal/e96353876b4c42cf86a38dab97d1e2b6) is 8.0M, max 1.1G, 
1.1G free.
May 13 21:22:30 artemis systemd-journald[201]: Received SIGTERM from PID 
1 (systemd).
May 13 21:22:30 artemis systemd[1]: systemd 255.6-1-arch running in 
system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT 
+GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC 
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT 
default-hierarchy=unified)
May 13 21:22:30 artemis systemd[1]: Detected architecture x86-64.
May 13 21:22:30 artemis systemd[1]: Hostname set to <artemis>.

Kernel log during successful start:

May 13 21:24:38 archlinux systemd-journald[203]: Journal started
May 13 21:24:38 archlinux systemd-journald[203]: Runtime Journal 
(/run/log/journal/e35a03c7b4404a01b240b4e6e4914c5a) is 8.0M, max 1.1G, 
1.1G free.
May 13 21:24:38 archlinux systemd-journald[203]: Missed 239 kernel messages
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: IOAPIC[0]: apic_id 33, version 33, 
address 0xfec00000, GSI 0-23
May 13 21:24:38 archlinux kernel: IOAPIC[1]: apic_id 34, version 33, 
address 0xfec01000, GSI 24-55
May 13 21:24:38 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 
global_irq 2 dfl dfl)
May 13 21:24:38 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 
global_irq 9 low level)
May 13 21:24:38 archlinux kernel: ACPI: Using ACPI (MADT) for SMP 
configuration information
May 13 21:24:38 archlinux kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
May 13 21:24:38 archlinux kernel: e820: update [mem 
0x52bba000-0x52c08fff] usable ==> reserved
May 13 21:24:38 archlinux kernel: CPU topo: Max. logical packages:   1
May 13 21:24:38 archlinux kernel: CPU topo: Max. logical dies:       1
May 13 21:24:38 archlinux kernel: CPU topo: Max. dies per package:   1
May 13 21:24:38 archlinux kernel: CPU topo: Max. threads per core:   2
May 13 21:24:38 archlinux kernel: CPU topo: Num. cores per package:     8
May 13 21:24:38 archlinux kernel: CPU topo: Num. threads per package:  16
May 13 21:24:38 archlinux kernel: CPU topo: Allowing 16 present CPUs 
plus 0 hotplug CPUs
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x00000000-0x00000fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x0009f000-0x000bffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x000c0000-0x000fffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09b00000-0x09dfffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09f00000-0x09f3bfff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x49b60000-0x4bd5ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd69000-0x4bd6cfff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd6f000-0x4bd6ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd74000-0x4bd74fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd78000-0x4bd78fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x52bba000-0x52c08fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x548cc000-0x548ccfff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x57f7f000-0x5a77efff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5a77f000-0x5af7efff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5af7f000-0x5affefff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5b000000-0x5bffffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5c000000-0x5d78ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d790000-0x5d7effff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f0000-0x5d7f4fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f5000-0x5fffffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x60000000-0xfebfffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec00000-0xfec01fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec02000-0xfec0ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec10000-0xfec10fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec11000-0xfec1ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec20000-0xfec20fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec21000-0xfed7ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed80000-0xfed81fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed82000-0xfedfffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee00000-0xfee00fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee01000-0xffffffff]
May 13 21:24:38 archlinux kernel: [mem 0x60000000-0xfebfffff] available 
for PCI devices
May 13 21:24:38 archlinux kernel: Booting paravirtualized kernel on bare 
hardware
May 13 21:24:38 archlinux kernel: clocksource: refined-jiffies: mask: 
0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
May 13 21:24:38 archlinux kernel: setup_percpu: NR_CPUS:320 
nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
May 13 21:24:38 archlinux kernel: percpu: Embedded 66 pages/cpu s233472 
r8192 d28672 u524288
May 13 21:24:38 archlinux kernel: pcpu-alloc: s233472 r8192 d28672 
u524288 alloc=1*2097152
May 13 21:24:38 archlinux kernel: pcpu-alloc: [0] 00 01 02 03 [0] 04 05 
06 07
May 13 21:24:38 archlinux kernel: pcpu-alloc: [0] 08 09 10 11 [0] 12 13 
14 15
May 13 21:24:38 archlinux kernel: Kernel command line: 
rd.luks.name=496f2909-055b-49f7-9a43-b48647d757a9=root 
rd.luks.options=discard root=/dev/mapper/root quiet loglevel=3 
systemd.show_status=auto rd.udev.log_level=3 splash
May 13 21:24:38 archlinux kernel: Unknown kernel command line parameters 
"splash", will be passed to user space.
May 13 21:24:38 archlinux kernel: Dentry cache hash table entries: 
8388608 (order: 14, 67108864 bytes, linear)
May 13 21:24:38 archlinux kernel: Inode-cache hash table entries: 
4194304 (order: 13, 33554432 bytes, linear)
May 13 21:24:38 archlinux kernel: Fallback order for Node 0: 0
May 13 21:24:38 archlinux kernel: Built 1 zonelists, mobility grouping 
on.  Total pages: 15433546
May 13 21:24:38 archlinux kernel: Policy zone: Normal
May 13 21:24:38 archlinux kernel: mem auto-init: stack:all(zero), heap 
alloc:on, heap free:off
May 13 21:24:38 archlinux kernel: software IO TLB: area num 16.
May 13 21:24:38 archlinux kernel: Memory: 61338632K/62714740K available 
(18432K kernel code, 2189K rwdata, 13500K rodata, 3412K init, 3604K bss, 
1375848K reserved, 0K cma-reserved)
May 13 21:24:38 archlinux kernel: SLUB: HWalign=64, Order=0-3, 
MinObjects=0, CPUs=16, Nodes=1
May 13 21:24:38 archlinux kernel: ftrace: allocating 49950 entries in 
196 pages
May 13 21:24:38 archlinux kernel: ftrace: allocated 196 pages with 3 groups
May 13 21:24:38 archlinux kernel: Dynamic Preempt: full
May 13 21:24:38 archlinux kernel: rcu: Preemptible hierarchical RCU 
implementation.
May 13 21:24:38 archlinux kernel: rcu:         RCU restricting CPUs from 
NR_CPUS=320 to nr_cpu_ids=16.
May 13 21:24:38 archlinux kernel: rcu:         RCU priority boosting: 
priority 1 delay 500 ms.
May 13 21:24:38 archlinux kernel:         Trampoline variant of Tasks 
RCU enabled.
May 13 21:24:38 archlinux kernel:         Rude variant of Tasks RCU enabled.
May 13 21:24:38 archlinux kernel:         Tracing variant of Tasks RCU 
enabled.
May 13 21:24:38 archlinux kernel: rcu: RCU calculated value of 
scheduler-enlistment delay is 30 jiffies.
May 13 21:24:38 archlinux kernel: rcu: Adjusting geometry for 
rcu_fanout_leaf=16, nr_cpu_ids=16
May 13 21:24:38 archlinux kernel: RCU Tasks: Setting shift to 4 and lim 
to 1 rcu_task_cb_adjust=1.
May 13 21:24:38 archlinux kernel: RCU Tasks Rude: Setting shift to 4 and 
lim to 1 rcu_task_cb_adjust=1.
May 13 21:24:38 archlinux kernel: RCU Tasks Trace: Setting shift to 4 
and lim to 1 rcu_task_cb_adjust=1.
May 13 21:24:38 archlinux kernel: NR_IRQS: 20736, nr_irqs: 1096, 
preallocated irqs: 16
May 13 21:24:38 archlinux kernel: rcu: srcu_init: Setting srcu_struct 
sizes based on contention.
May 13 21:24:38 archlinux kernel: kfence: initialized - using 2097152 
bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
May 13 21:24:38 archlinux kernel: Console: colour dummy device 80x25
May 13 21:24:38 archlinux kernel: printk: legacy console [tty0] enabled
May 13 21:24:38 archlinux kernel: ACPI: Core revision 20230628
May 13 21:24:38 archlinux kernel: clocksource: hpet: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
May 13 21:24:38 archlinux kernel: APIC: Switch to symmetric I/O mode setup
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR0, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR1, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR2, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR3, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: Using global IVHD 
EFR:0x246577efa2054ada, EFR2:0x0
May 13 21:24:38 archlinux kernel: x2apic: IRQ remapping doesn't support 
X2APIC mode
May 13 21:24:38 archlinux kernel: APIC: Switched APIC routing to: 
physical flat
May 13 21:24:38 archlinux kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 
apic2=-1 pin2=-1
May 13 21:24:38 archlinux kernel: clocksource: tsc-early: mask: 
0xffffffffffffffff max_cycles: 0x7317abf1c13, max_idle_ns: 881590769496 ns
May 13 21:24:38 archlinux kernel: Calibrating delay loop (skipped), 
value calculated using timer frequency.. 7987.22 BogoMIPS (lpj=13307563)
May 13 21:24:38 archlinux kernel: x86/cpu: User Mode Instruction 
Prevention (UMIP) activated
May 13 21:24:38 archlinux kernel: LVT offset 1 assigned for vector 0xf9
May 13 21:24:38 archlinux kernel: LVT offset 2 assigned for vector 0xf4
May 13 21:24:38 archlinux kernel: Last level iTLB entries: 4KB 512, 2MB 
512, 4MB 256
May 13 21:24:38 archlinux kernel: Last level dTLB entries: 4KB 3072, 2MB 
3072, 4MB 1536, 1GB 0
May 13 21:24:38 archlinux kernel: process: using mwait in idle threads
May 13 21:24:38 archlinux kernel: Spectre V1 : Mitigation: 
usercopy/swapgs barriers and __user pointer sanitization
May 13 21:24:38 archlinux kernel: Spectre V2 : Mitigation: Enhanced / 
Automatic IBRS
May 13 21:24:38 archlinux kernel: Spectre V2 : Spectre v2 / SpectreRSB 
mitigation: Filling RSB on context switch
May 13 21:24:38 archlinux kernel: Spectre V2 : mitigation: Enabling 
conditional Indirect Branch Prediction Barrier
May 13 21:24:38 archlinux kernel: Spectre V2 : User space: Mitigation: 
STIBP always-on protection
May 13 21:24:38 archlinux kernel: Speculative Store Bypass: Mitigation: 
Speculative Store Bypass disabled via prctl
May 13 21:24:38 archlinux kernel: Speculative Return Stack Overflow: 
Mitigation: Safe RET
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x001: 'x87 floating point registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x002: 'SSE registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x004: 'AVX registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x020: 'AVX-512 opmask'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x040: 'AVX-512 Hi256'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x080: 'AVX-512 ZMM_Hi256'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x200: 'Protection Keys User registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x800: 'Control-flow User registers'
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[2]:  576, 
xstate_sizes[2]:  256
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[5]:  832, 
xstate_sizes[5]:   64
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[6]:  896, 
xstate_sizes[6]:  512
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[7]: 1408, 
xstate_sizes[7]: 1024
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[9]: 2432, 
xstate_sizes[9]:    8
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[11]: 2440, 
xstate_sizes[11]:   16
May 13 21:24:38 archlinux kernel: x86/fpu: Enabled xstate features 
0xae7, context size is 2456 bytes, using 'compacted' format.
May 13 21:24:38 archlinux kernel: Freeing SMP alternatives memory: 40K
May 13 21:24:38 archlinux kernel: pid_max: default: 32768 minimum: 301
May 13 21:24:38 archlinux kernel: LSM: initializing 
lsm=capability,landlock,lockdown,yama,bpf
May 13 21:24:38 archlinux kernel: landlock: Up and running.
May 13 21:24:38 archlinux kernel: Yama: becoming mindful.
May 13 21:24:38 archlinux kernel: LSM support for eBPF active
May 13 21:24:38 archlinux kernel: Mount-cache hash table entries: 131072 
(order: 8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: Mountpoint-cache hash table entries: 
131072 (order: 8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: smpboot: CPU0: AMD Ryzen 9 7940HS w/ 
Radeon 780M Graphics (family: 0x19, model: 0x74, stepping: 0x1)
May 13 21:24:38 archlinux kernel: Performance Events: Fam17h+ 16-deep 
LBR, core perfctr, AMD PMU driver.
May 13 21:24:38 archlinux kernel: ... version:                2
May 13 21:24:38 archlinux kernel: ... bit width:              48
May 13 21:24:38 archlinux kernel: ... generic registers:      6
May 13 21:24:38 archlinux kernel: ... value mask: 0000ffffffffffff
May 13 21:24:38 archlinux kernel: ... max period: 00007fffffffffff
May 13 21:24:38 archlinux kernel: ... fixed-purpose events:   0
May 13 21:24:38 archlinux kernel: ... event mask: 000000000000003f
May 13 21:24:38 archlinux kernel: signal: max sigframe size: 3376
May 13 21:24:38 archlinux kernel: rcu: Hierarchical SRCU implementation.
May 13 21:24:38 archlinux kernel: rcu:         Max phase no-delay 
instances is 1000.
May 13 21:24:38 archlinux kernel: NMI watchdog: Enabled. Permanently 
consumes one hw-PMU counter.
May 13 21:24:38 archlinux kernel: smp: Bringing up secondary CPUs ...
May 13 21:24:38 archlinux kernel: smpboot: x86: Booting SMP configuration:
May 13 21:24:38 archlinux kernel: .... node  #0, CPUs:        #2 #4  #6  
#8 #10 #12 #14  #1  #3  #5  #7  #9 #11 #13 #15
May 13 21:24:38 archlinux kernel: Spectre V2 : Update user space SMT 
mitigation: STIBP always-on
May 13 21:24:38 archlinux kernel: smp: Brought up 1 node, 16 CPUs
May 13 21:24:38 archlinux kernel: smpboot: Total of 16 processors 
activated (127803.63 BogoMIPS)
May 13 21:24:38 archlinux kernel: devtmpfs: initialized
May 13 21:24:38 archlinux kernel: x86/mm: Memory block size: 128MB
May 13 21:24:38 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x09f00000-0x09f3bfff] (245760 bytes)
May 13 21:24:38 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x5a77f000-0x5af7efff] (8388608 bytes)
May 13 21:24:38 archlinux kernel: clocksource: jiffies: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
May 13 21:24:38 archlinux kernel: futex hash table entries: 4096 (order: 
6, 262144 bytes, linear)
May 13 21:24:38 archlinux kernel: pinctrl core: initialized pinctrl 
subsystem
May 13 21:24:38 archlinux kernel: PM: RTC time: 02:24:36, date: 2024-05-14
May 13 21:24:38 archlinux kernel: NET: Registered PF_NETLINK/PF_ROUTE 
protocol family
May 13 21:24:38 archlinux kernel: DMA: preallocated 4096 KiB GFP_KERNEL 
pool for atomic allocations
May 13 21:24:38 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA pool for atomic allocations
May 13 21:24:38 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA32 pool for atomic allocations
May 13 21:24:38 archlinux kernel: audit: initializing netlink subsys 
(disabled)
May 13 21:24:38 archlinux kernel: audit: type=2000 
audit(1715653476.186:1): state=initialized audit_enabled=0 res=1
May 13 21:24:38 archlinux kernel: i2c-core: driver [dummy] registered
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'fair_share'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'bang_bang'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'step_wise'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'user_space'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'power_allocator'
May 13 21:24:38 archlinux kernel: cpuidle: using governor ladder
May 13 21:24:38 archlinux kernel: cpuidle: using governor menu
May 13 21:24:38 archlinux kernel: Simple Boot Flag at 0x44 set to 0x1
May 13 21:24:38 archlinux kernel: acpiphp: ACPI Hot Plug PCI Controller 
Driver version: 0.5
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:24:38 archlinux kernel: PCI: not using ECAM ([mem 
0xe0000000-0xefffffff] not reserved)
May 13 21:24:38 archlinux kernel: PCI: Using configuration type 1 for 
base access
May 13 21:24:38 archlinux kernel: PCI: Using configuration type 1 for 
extended access
May 13 21:24:38 archlinux kernel: kprobes: kprobe jump-optimization is 
enabled. All kprobes are optimized if possible.
May 13 21:24:38 archlinux kernel: HugeTLB: registered 1.00 GiB page 
size, pre-allocated 0 pages
May 13 21:24:38 archlinux kernel: HugeTLB: 16380 KiB vmemmap can be 
freed for a 1.00 GiB page
May 13 21:24:38 archlinux kernel: HugeTLB: registered 2.00 MiB page 
size, pre-allocated 0 pages
May 13 21:24:38 archlinux kernel: HugeTLB: 28 KiB vmemmap can be freed 
for a 2.00 MiB page
May 13 21:24:38 archlinux kernel: Demotion targets for Node 0: null
May 13 21:24:38 archlinux kernel: i2c-core: driver [sx150x-pinctrl] 
registered
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(Module Device)
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(Processor Device)
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(Processor Aggregator 
Device)
May 13 21:24:38 archlinux kernel: ACPI: 34 ACPI AML tables successfully 
acquired and loaded
May 13 21:24:38 archlinux kernel: ACPI: USB4 _OSC: OS supports USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:24:38 archlinux kernel: ACPI: USB4 _OSC: OS controls USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:24:38 archlinux kernel: ACPI: _OSC evaluation for CPUs failed, 
trying _PDC
May 13 21:24:38 archlinux kernel: ACPI: EC: EC started
May 13 21:24:38 archlinux kernel: ACPI: EC: interrupt blocked
May 13 21:24:38 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC used to handle transactions
May 13 21:24:38 archlinux kernel: ACPI: Interpreter enabled
May 13 21:24:38 archlinux kernel: ACPI: PM: (supports S0 S4 S5)
May 13 21:24:38 archlinux kernel: ACPI: Using IOAPIC for interrupt routing
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:24:38 archlinux kernel: PCI: [Firmware Info]: ECAM [mem 
0xe0000000-0xefffffff] not reserved in ACPI motherboard resources
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
is EfiMemoryMappedIO; assuming valid
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
reserved to work around lack of ACPI motherboard _CRS
May 13 21:24:38 archlinux kernel: PCI: Using host bridge windows from 
ACPI; if necessary, use "pci=nocrs" and report a bug
May 13 21:24:38 archlinux kernel: PCI: Ignoring E820 reservations for 
host bridge windows
May 13 21:24:38 archlinux kernel: ACPI: Enabled 4 GPEs in block 00 to 1F
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.M237: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: 
New power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP6.PWSR: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP8.P0NV: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.PWRS: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PRWL: New power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PRWB: New power resource
May 13 21:24:38 archlinux kernel: ACPI: PCI Root Bridge [PCI0] (domain 
0000 [bus 00-ff])
May 13 21:24:38 archlinux kernel: acpi PNP0A08:00: _OSC: OS supports 
[ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
May 13 21:24:38 archlinux kernel: acpi PNP0A08:00: _OSC: platform does 
not support [SHPCHotplug AER]
May 13 21:24:38 archlinux kernel: acpi PNP0A08:00: _OSC: OS now controls 
[PCIeHotplug PME PCIeCapability LTR DPC]
May 13 21:24:38 archlinux kernel: PCI host bridge to bus 0000:00
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0000-0x0cf7 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0d00-0xffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000a0000-0x000bffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000c0000-0x000cffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000d0000-0x000effff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x60000000-0x90ffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xf0000000-0xfec00000 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed45000-0xfed814ff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed81900-0xfed81fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc0000-0xfedc0fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc6000-0xfedc6fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x10c0200000-0x891fffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[bus 00-ff]
May 13 21:24:38 archlinux kernel: pci 0000:00:00.0: [1022:14e8] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:00.2: [1022:14e9] type 00 
class 0x080600 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:01.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: [1022:14ed] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:02.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:03.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:04.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:14.0: [1022:790b] type 00 
class 0x0c0500 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:14.3: [1022:790e] type 00 
class 0x060100 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.0: [1022:14f0] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.1: [1022:14f1] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.2: [1022:14f2] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.3: [1022:14f3] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.4: [1022:14f4] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.5: [1022:14f5] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.6: [1022:14f6] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.7: [1022:14f7] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: [1002:1478] type 01 
class 0x060400 PCIe Switch Upstream Port
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: BAR 0 [mem 
0x90e00000-0x90e03fff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: [1002:1479] type 01 
class 0x060400 PCIe Switch Downstream Port
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: [1002:7480] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 0 [mem 
0x8400000000-0x85ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 2 [mem 
0x8600000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 4 [io 0xa000-0xa0ff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 5 [mem 
0x90c00000-0x90cfffff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: [1002:ab30] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: BAR 0 [mem 
0x90d00000-0x90d03fff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: [14c3:0616] type 00 
class 0x028000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: BAR 0 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: BAR 2 [mem 
0x90b00000-0x90b07fff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:24:38 archlinux kernel: pci 0000:05:00.0: [144d:a80c] type 00 
class 0x010802 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:05:00.0: BAR 0 [mem 
0x90a00000-0x90a03fff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: [1002:15bf] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 0 [mem 
0x8610000000-0x861fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 2 [mem 
0x90000000-0x901fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 4 [io 0x1000-0x10ff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 5 [mem 
0x90500000-0x9057ffff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: [1002:1640] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: BAR 0 [mem 
0x905c8000-0x905cbfff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: [1022:15c7] type 00 
class 0x108000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: BAR 2 [mem 
0x90400000-0x904fffff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: BAR 5 [mem 
0x905cc000-0x905cdfff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: [1022:15b9] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: BAR 0 [mem 
0x90200000-0x902fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: [1022:15ba] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: BAR 0 [mem 
0x90300000-0x903fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: [1022:15e2] type 00 
class 0x048000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: BAR 0 [mem 
0x90580000-0x905bffff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: BAR 2 [mem 
0x8620000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: [1022:15e3] type 00 
class 0x040300 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: BAR 0 [mem 
0x905c0000-0x905c7fff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: PME# supported from 
D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: [1022:1502] type 00 
class 0x118000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 0 [mem 
0x90900000-0x9097ffff]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 1 [mem 
0x909c0000-0x909c1fff]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 2 [mem 
0x8620800000-0x862083ffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 4 [mem 
0x90980000-0x909bffff]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.0: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: [1022:15c0] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: BAR 0 [mem 
0x90600000-0x906fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: [1022:15c1] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: BAR 0 [mem 
0x90700000-0x907fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: [1022:1668] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: BAR 0 [mem 
0x90800000-0x9087ffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: [1022:1669] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: BAR 0 [mem 
0x90880000-0x908fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKA 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKA disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKB 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKB disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKC 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKC disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKD 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKD disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKE 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKE disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKF 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKF disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKG 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKG disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKH 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKH disabled
May 13 21:24:38 archlinux kernel: Low-power S0 idle used by default for 
system suspend
May 13 21:24:38 archlinux kernel: ACPI: EC: interrupt unblocked
May 13 21:24:38 archlinux kernel: ACPI: EC: event unblocked
May 13 21:24:38 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:24:38 archlinux kernel: ACPI: EC: GPE=0xb
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC initialization complete
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used 
to handle transactions and events
May 13 21:24:38 archlinux kernel: iommu: Default domain type: Translated
May 13 21:24:38 archlinux kernel: iommu: DMA domain TLB invalidation 
policy: lazy mode
May 13 21:24:38 archlinux kernel: i2c-core: driver [88PM860x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [WM8400] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [wm831x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [wm8350] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [tps65910] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [da903x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [da9052] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [lp8788] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [da9055-pmic] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max77843] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max8925] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max8997] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max8998] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [tps6586x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [tps65090] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [aat2870] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [palmas] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [rc5t583] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [as3711] registered
May 13 21:24:38 archlinux kernel: SCSI subsystem initialized
May 13 21:24:38 archlinux kernel: libata version 3.00 loaded.
May 13 21:24:38 archlinux kernel: ACPI: bus type USB registered
May 13 21:24:38 archlinux kernel: usbcore: registered new interface 
driver usbfs
May 13 21:24:38 archlinux kernel: usbcore: registered new interface 
driver hub
May 13 21:24:38 archlinux kernel: usbcore: registered new device driver usb
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
clock-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-rising-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-internal-delay-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-hold-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-digital-filter-width-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: ACPI slave 
is not supported yet
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: SDA Hold 
Time TX:RX = 48:48
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: Bus speed: 
Fast Mode (400 kHz)
May 13 21:24:38 archlinux kernel: i2c i2c-0: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:24:38 archlinux kernel: i2c i2c-0: client [FRMW0003:00] 
registered with bus id i2c-FRMW0003:00
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
clock-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-rising-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-internal-delay-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-hold-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-digital-filter-width-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: ACPI slave 
is not supported yet
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: SDA Hold 
Time TX:RX = 48:48
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: Bus speed: 
Fast Mode (400 kHz)
May 13 21:24:38 archlinux kernel: i2c i2c-1: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:24:38 archlinux kernel: i2c i2c-1: client [PIXA3854:00] 
registered with bus id i2c-PIXA3854:00
May 13 21:24:38 archlinux kernel: pps_core: LinuxPPS API ver. 1 registered
May 13 21:24:38 archlinux kernel: pps_core: Software ver. 5.3.6 - 
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
May 13 21:24:38 archlinux kernel: PTP clock support registered
May 13 21:24:38 archlinux kernel: EDAC MC: Ver: 3.0.0
May 13 21:24:38 archlinux kernel: efivars: Registered efivars operations
May 13 21:24:38 archlinux kernel: NetLabel: Initializing
May 13 21:24:38 archlinux kernel: NetLabel:  domain hash size = 128
May 13 21:24:38 archlinux kernel: NetLabel:  protocols = UNLABELED 
CIPSOv4 CALIPSO
May 13 21:24:38 archlinux kernel: NetLabel:  unlabeled traffic allowed 
by default
May 13 21:24:38 archlinux kernel: mctp: management component transport 
protocol core
May 13 21:24:38 archlinux kernel: NET: Registered PF_MCTP protocol family
May 13 21:24:38 archlinux kernel: PCI: Using ACPI for IRQ routing
May 13 21:24:38 archlinux kernel: PCI: pci_cache_line_size set to 64 bytes
May 13 21:24:38 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:24:38 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x0009f000-0x0009ffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x09b00000-0x0bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x09f00000-0x0bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x49b60000-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd69000-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd6f000-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd74018-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x52bba000-0x53ffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x548cc000-0x57ffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x57f7f000-0x57ffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x5b000000-0x5bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0xf9e300000-0xf9fffffff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: vgaarb: setting as 
boot VGA device
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: vgaarb: bridge 
control possible
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: vgaarb: setting as 
boot VGA device (overriding previous)
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: vgaarb: bridge 
control possible
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:24:38 archlinux kernel: vgaarb: loaded
May 13 21:24:38 archlinux kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
May 13 21:24:38 archlinux kernel: hpet0: 3 comparators, 32-bit 14.318180 
MHz counter
May 13 21:24:38 archlinux kernel: clocksource: Switched to clocksource 
tsc-early
May 13 21:24:38 archlinux kernel: VFS: Disk quotas dquot_6.6.0
May 13 21:24:38 archlinux kernel: VFS: Dquot-cache hash table entries: 
512 (order 0, 4096 bytes)
May 13 21:24:38 archlinux kernel: pnp: PnP ACPI init
May 13 21:24:38 archlinux kernel: system 00:00: [mem 
0xfec00000-0xfec01fff] could not be reserved
May 13 21:24:38 archlinux kernel: system 00:00: [mem 
0xfee00000-0xfee00fff] has been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0400-0x04cf] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x04d0-0x04d1] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x04d6] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0c00-0x0c01] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x0c14] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0c50-0x0c52] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x0c6c] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x0c6f] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0cd0-0x0cdb] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:03: [mem 
0x000e0000-0x000fffff] could not be reserved
May 13 21:24:38 archlinux kernel: system 00:03: [mem 
0xfe000000-0xffffffff] could not be reserved
May 13 21:24:38 archlinux kernel: pnp: PnP ACPI: found 4 devices
May 13 21:24:38 archlinux kernel: clocksource: acpi_pm: mask: 0xffffff 
max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 13 21:24:38 archlinux kernel: NET: Registered PF_INET protocol family
May 13 21:24:38 archlinux kernel: IP idents hash table entries: 262144 
(order: 9, 2097152 bytes, linear)
May 13 21:24:38 archlinux kernel: tcp_listen_portaddr_hash hash table 
entries: 32768 (order: 7, 524288 bytes, linear)
May 13 21:24:38 archlinux kernel: Table-perturb hash table entries: 
65536 (order: 6, 262144 bytes, linear)
May 13 21:24:38 archlinux kernel: TCP established hash table entries: 
524288 (order: 10, 4194304 bytes, linear)
May 13 21:24:38 archlinux kernel: TCP bind hash table entries: 65536 
(order: 9, 2097152 bytes, linear)
May 13 21:24:38 archlinux kernel: TCP: Hash tables configured 
(established 524288 bind 65536)
May 13 21:24:38 archlinux kernel: MPTCP token hash table entries: 65536 
(order: 8, 1572864 bytes, linear)
May 13 21:24:38 archlinux kernel: UDP hash table entries: 32768 (order: 
8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: UDP-Lite hash table entries: 32768 
(order: 8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: NET: Registered PF_UNIX/PF_LOCAL 
protocol family
May 13 21:24:38 archlinux kernel: NET: Registered PF_XDP protocol family
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]: can't claim; no compatible bridge window
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0x90d20000-0x90d3ffff pref]: assigned
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 4 [io 
0x0000-0x0cf7 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 5 [io 
0x0d00-0xffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 6 [mem 
0x000a0000-0x000bffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 7 [mem 
0x000c0000-0x000cffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 8 [mem 
0x000d0000-0x000effff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 9 [mem 
0x60000000-0x90ffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 10 [mem 
0xf0000000-0xfec00000 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 11 [mem 
0xfed45000-0xfed814ff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 12 [mem 
0xfed81900-0xfed81fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 13 [mem 
0xfedc0000-0xfedc0fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 14 [mem 
0xfedc6000-0xfedc6fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 15 [mem 
0x10c0200000-0x891fffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:01: resource 0 [io 
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:01: resource 1 [mem 
0x90c00000-0x90efffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:01: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:02: resource 0 [io 
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:02: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:02: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:03: resource 0 [io 
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:03: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:03: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:04: resource 1 [mem 
0x90b00000-0x90bfffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:04: resource 2 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:05: resource 1 [mem 
0x90a00000-0x90afffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:06: resource 0 [io 
0x6000-0x9fff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:06: resource 1 [mem 
0x78000000-0x8fffffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:06: resource 2 [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:65: resource 0 [io 
0x2000-0x5fff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:65: resource 1 [mem 
0x60000000-0x77ffffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:65: resource 2 [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c4: resource 0 [io 
0x1000-0x1fff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c4: resource 1 [mem 
0x90000000-0x905fffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c4: resource 2 [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c5: resource 1 [mem 
0x90900000-0x909fffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c5: resource 2 [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c6: resource 1 [mem 
0x90600000-0x908fffff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: D0 power state 
depends on 0000:03:00.0
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: D0 power state 
depends on 0000:c4:00.0
May 13 21:24:38 archlinux kernel: PCI: CLS 64 bytes, default 64
May 13 21:24:38 archlinux kernel: pci 0000:00:00.2: AMD-Vi: IOMMU 
performance counters supported
May 13 21:24:38 archlinux kernel: pci 0000:00:01.0: Adding to iommu group 0
May 13 21:24:38 archlinux kernel: Trying to unpack rootfs image as 
initramfs...
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: Adding to iommu group 1
May 13 21:24:38 archlinux kernel: pci 0000:00:02.0: Adding to iommu group 2
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: Adding to iommu group 3
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: Adding to iommu group 4
May 13 21:24:38 archlinux kernel: pci 0000:00:03.0: Adding to iommu group 5
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: Adding to iommu group 5
May 13 21:24:38 archlinux kernel: pci 0000:00:04.0: Adding to iommu group 6
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: Adding to iommu group 6
May 13 21:24:38 archlinux kernel: pci 0000:00:08.0: Adding to iommu group 7
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: Adding to iommu group 8
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: Adding to iommu group 9
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: Adding to iommu group 10
May 13 21:24:38 archlinux kernel: pci 0000:00:14.0: Adding to iommu group 11
May 13 21:24:38 archlinux kernel: pci 0000:00:14.3: Adding to iommu group 11
May 13 21:24:38 archlinux kernel: pci 0000:00:18.0: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.1: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.2: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.3: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.4: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.5: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.6: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.7: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: Adding to iommu group 13
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: Adding to iommu group 14
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: Adding to iommu group 15
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: Adding to iommu group 16
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: Adding to iommu group 17
May 13 21:24:38 archlinux kernel: pci 0000:05:00.0: Adding to iommu group 18
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: Adding to iommu group 19
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: Adding to iommu group 20
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: Adding to iommu group 21
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: Adding to iommu group 22
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: Adding to iommu group 23
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: Adding to iommu group 24
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: Adding to iommu group 25
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: Adding to iommu group 26
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: Adding to iommu group 27
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.0: Adding to iommu group 28
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: Adding to iommu group 29
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: Adding to iommu group 30
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: Adding to iommu group 31
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: Adding to iommu group 32
May 13 21:24:38 archlinux kernel: AMD-Vi: Extended features 
(0x246577efa2054ada, 0x0): PPR NX GT IA GA PC
May 13 21:24:38 archlinux kernel: AMD-Vi: Interrupt remapping enabled
May 13 21:24:38 archlinux kernel: PCI-DMA: Using software bounce 
buffering for IO (SWIOTLB)
May 13 21:24:38 archlinux kernel: software IO TLB: mapped [mem 
0x000000003fd94000-0x0000000043d94000] (64MB)
May 13 21:24:38 archlinux kernel: LVT offset 0 assigned for vector 0x400
May 13 21:24:38 archlinux kernel: perf: AMD IBS detected (0x00000bff)
May 13 21:24:38 archlinux kernel: perf/amd_iommu: Detected AMD IOMMU #0 
(2 banks, 4 counters/bank).
May 13 21:24:38 archlinux kernel: Initialise system trusted keyrings
May 13 21:24:38 archlinux kernel: Key type blacklist registered
May 13 21:24:38 archlinux kernel: workingset: timestamp_bits=41 
max_order=24 bucket_order=0
May 13 21:24:38 archlinux kernel: zbud: loaded
May 13 21:24:38 archlinux kernel: integrity: Platform Keyring initialized
May 13 21:24:38 archlinux kernel: integrity: Machine keyring initialized
May 13 21:24:38 archlinux kernel: Key type asymmetric registered
May 13 21:24:38 archlinux kernel: Asymmetric key parser 'x509' registered
May 13 21:24:38 archlinux kernel: Block layer SCSI generic (bsg) driver 
version 0.4 loaded (major 242)
May 13 21:24:38 archlinux kernel: io scheduler mq-deadline registered
May 13 21:24:38 archlinux kernel: io scheduler kyber registered
May 13 21:24:38 archlinux kernel: io scheduler bfq registered
May 13 21:24:38 archlinux kernel: pcieport 0000:00:01.1: PME: Signaling 
with IRQ 38
May 13 21:24:38 archlinux kernel: pcieport 0000:00:01.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:24:38 archlinux kernel: pcieport 0000:00:02.2: PME: Signaling 
with IRQ 39
May 13 21:24:38 archlinux kernel: pcieport 0000:00:02.4: PME: Signaling 
with IRQ 40
May 13 21:24:38 archlinux kernel: pcieport 0000:00:03.1: PME: Signaling 
with IRQ 41
May 13 21:24:38 archlinux kernel: pcieport 0000:00:03.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:24:38 archlinux kernel: pcieport 0000:00:04.1: PME: Signaling 
with IRQ 42
May 13 21:24:38 archlinux kernel: pcieport 0000:00:04.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:24:38 archlinux kernel: pcieport 0000:00:08.1: PME: Signaling 
with IRQ 43
May 13 21:24:38 archlinux kernel: pcieport 0000:00:08.2: PME: Signaling 
with IRQ 44
May 13 21:24:38 archlinux kernel: pcieport 0000:00:08.3: PME: Signaling 
with IRQ 45
May 13 21:24:38 archlinux kernel: shpchp: Standard Hot Plug PCI 
Controller Driver version: 0.4
May 13 21:24:38 archlinux kernel: ACPI: AC: AC Adapter [ACAD] (on-line)
May 13 21:24:38 archlinux kernel: input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:4f/PNP0C09:00/PNP0C0D:00/input/input0
May 13 21:24:38 archlinux kernel: ACPI: button: Lid Switch [LID0]
May 13 21:24:38 archlinux kernel: input: Power Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
May 13 21:24:38 archlinux kernel: ACPI: button: Power Button [PWRB]
May 13 21:24:38 archlinux kernel: Estimated ratio of average max 
frequency by base frequency (times 1024): 1388
May 13 21:24:38 archlinux kernel: Monitor-Mwait will be used to enter 
C-1 state
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C000: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C001: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C002: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C003: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C004: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C005: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C006: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C007: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C008: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C009: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00A: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00B: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00C: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00D: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00E: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00F: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:00: registered as 
thermal_zone0
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ00] (46 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:01: registered as 
thermal_zone1
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ01] (49 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:02: registered as 
thermal_zone2
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ02] (50 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:03: registered as 
thermal_zone3
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ03] (81 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:04: registered as 
thermal_zone4
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ04] (39 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:05: registered as 
thermal_zone5
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ05] (40 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:06: registered as 
thermal_zone6
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ06] (38 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:07: registered as 
thermal_zone7
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ07] (0 C)
May 13 21:24:38 archlinux kernel: Serial: 8250/16550 driver, 32 ports, 
IRQ sharing enabled
May 13 21:24:38 archlinux kernel: ACPI: battery: Slot [BAT1] (battery 
present)
May 13 21:24:38 archlinux kernel: Non-volatile memory driver v1.3
May 13 21:24:38 archlinux kernel: Linux agpgart interface v0.103
May 13 21:24:38 archlinux kernel: Freeing initrd memory: 44416K
May 13 21:24:38 archlinux kernel: ACPI: bus type drm_connector registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [twl] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [twl6040] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [adp5520] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [crystal_cove_i2c] 
registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [CHT Whiskey Cove 
PMIC] registered
May 13 21:24:38 archlinux kernel: usbcore: registered new interface 
driver usbserial_generic
May 13 21:24:38 archlinux kernel: usbserial: USB Serial support 
registered for generic
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: RTC can wake from S4
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: registered as rtc0
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: setting system clock 
to 2024-05-14T02:24:37 UTC (1715653477)
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: alarms up to one 
month, 114 bytes nvram
May 13 21:24:38 archlinux kernel: ledtrig-cpu: registered to indicate 
activity on CPUs
May 13 21:24:38 archlinux kernel: [drm] Initialized simpledrm 1.0.0 
20200625 for simple-framebuffer.0 on minor 0
May 13 21:24:38 archlinux kernel: fbcon: Deferring console take-over
May 13 21:24:38 archlinux kernel: simple-framebuffer 
simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
May 13 21:24:38 archlinux kernel: hid: raw HID events driver (C) Jiri Kosina
May 13 21:24:38 archlinux kernel: i2c-core: driver [i2c_hid_acpi] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [i2c_hid_of] registered
May 13 21:24:38 archlinux kernel: drop_monitor: Initializing network 
drop monitor service
May 13 21:24:38 archlinux kernel: Initializing XFRM netlink socket
May 13 21:24:38 archlinux kernel: NET: Registered PF_INET6 protocol family
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-FRMW0003:00: probe
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: probe
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x510
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: Segment Routing with IPv6
May 13 21:24:38 archlinux kernel: RPL Segment Routing with IPv6
May 13 21:24:38 archlinux kernel: In-situ OAM (IOAM) with IPv6
May 13 21:24:38 archlinux kernel: NET: Registered PF_PACKET protocol family
May 13 21:24:38 archlinux kernel: microcode: Current revision: 0x0a704104
May 13 21:24:38 archlinux kernel: resctrl: L3 allocation detected
May 13 21:24:38 archlinux kernel: resctrl: MB allocation detected
May 13 21:24:38 archlinux kernel: resctrl: SMBA allocation detected
May 13 21:24:38 archlinux kernel: resctrl: L3 monitoring detected
May 13 21:24:38 archlinux kernel: IPI shorthand broadcast: enabled
May 13 21:24:38 archlinux kernel: sched_clock: Marking stable 
(654333794, 409468)->(658838770, -4095508)
May 13 21:24:38 archlinux kernel: Timer migration: 2 hierarchy levels; 8 
children per group; 2 crossnode level
May 13 21:24:38 archlinux kernel: registered taskstats version 1
May 13 21:24:38 archlinux kernel: Loading compiled-in X.509 certificates
May 13 21:24:38 archlinux kernel: Loaded X.509 cert 'Build time 
autogenerated kernel key: 161dd99ad2105d15c2e668632f302bd716d59ec5'
May 13 21:24:38 archlinux kernel: zswap: loaded using pool zstd/zsmalloc
May 13 21:24:38 archlinux kernel: Key type .fscrypt registered
May 13 21:24:38 archlinux kernel: Key type fscrypt-provisioning registered
May 13 21:24:38 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:24:38 archlinux kernel: integrity: Loaded X.509 cert 'Database 
Key: 00ce72b3aa39818d7d19c223fba64f8770'
May 13 21:24:38 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:24:38 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Corporation UEFI CA 2011: 
13adbf4309bd82709c8cd54f316ed522988a1bd4'
May 13 21:24:38 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:24:38 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Windows Production PCA 2011: 
a92902398e16c49778cd90f99e4f9ae17c55af53'
May 13 21:24:38 archlinux kernel: PM:   Magic number: 8:628:409
May 13 21:24:38 archlinux kernel: pci 0000:00:18.1: hash matches
May 13 21:24:38 archlinux kernel: RAS: Correctable Errors collector 
initialized.
May 13 21:24:38 archlinux kernel: clk: Disabling unused clocks
May 13 21:24:38 archlinux kernel: PM: genpd: Disabling unused power domains
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: failed 
to reset device: -121
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: failed 
to change power setting.
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: hid-generic 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:24:38 archlinux kernel: tsc: Refined TSC clocksource 
calibration: 3992.488 MHz
May 13 21:24:38 archlinux kernel: clocksource: tsc: mask: 
0xffffffffffffffff max_cycles: 0x731949e9c77, max_idle_ns: 881591066823 ns
May 13 21:24:38 archlinux kernel: clocksource: Switched to clocksource tsc
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:38 archlinux kernel: input: PIXA3854:00 093A:0274 Mouse as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input2
May 13 21:24:38 archlinux kernel: input: PIXA3854:00 093A:0274 Touchpad 
as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input3
May 13 21:24:38 archlinux kernel: hid-generic 0018:093A:0274.0002: 
input,hidraw1: I2C HID v1.00 Mouse [PIXA3854:00 093A:0274] on 
i2c-PIXA3854:00
May 13 21:24:38 archlinux kernel: Freeing unused decrypted memory: 2028K
May 13 21:24:38 archlinux kernel: Freeing unused kernel image (initmem) 
memory: 3412K
May 13 21:24:38 archlinux kernel: Write protecting the kernel read-only 
data: 32768k
May 13 21:24:38 archlinux kernel: Freeing unused kernel image 
(rodata/data gap) memory: 836K
May 13 21:24:38 archlinux kernel: x86/mm: Checked W+X mappings: passed, 
no W+X pages found.
May 13 21:24:38 archlinux kernel: rodata_test: all tests were successful
May 13 21:24:38 archlinux kernel: Run /init as init process
May 13 21:24:38 archlinux kernel:   with arguments:
May 13 21:24:38 archlinux kernel:     /init
May 13 21:24:38 archlinux kernel:     splash
May 13 21:24:38 archlinux kernel:   with environment:
May 13 21:24:38 archlinux kernel:     HOME=/
May 13 21:24:38 archlinux kernel:     TERM=linux
May 13 21:24:38 archlinux systemd[1]: systemd 255.6-1-arch running in 
system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT 
+GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC 
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT 
default-hierarchy=unified)
May 13 21:24:38 archlinux systemd[1]: Detected architecture x86-64.
May 13 21:24:38 archlinux systemd[1]: Running in initrd.
May 13 21:24:38 archlinux systemd[1]: Initializing machine ID from 
random generator.
May 13 21:24:38 archlinux systemd[1]: Queued start job for default 
target Initrd Default Target.
May 13 21:24:38 archlinux systemd[1]: Created slice Slice 
/system/systemd-cryptsetup.
May 13 21:24:38 archlinux systemd[1]: Expecting device 
/dev/disk/by-uuid/496f2909-055b-49f7-9a43-b48647d757a9...
May 13 21:24:38 archlinux systemd[1]: Expecting device /dev/mapper/root...
May 13 21:24:38 archlinux systemd[1]: Reached target Slice Units.
May 13 21:24:38 archlinux systemd[1]: Reached target Swaps.
May 13 21:24:38 archlinux systemd[1]: Reached target Timer Units.
May 13 21:24:38 archlinux systemd[1]: Listening on Journal Socket 
(/dev/log).
May 13 21:24:38 archlinux systemd[1]: Listening on Journal Socket.
May 13 21:24:38 archlinux systemd[1]: Listening on udev Control Socket.
May 13 21:24:38 archlinux systemd[1]: Listening on udev Kernel Socket.
May 13 21:24:38 archlinux systemd[1]: Reached target Socket Units.
May 13 21:24:38 archlinux systemd[1]: Starting Create List of Static 
Device Nodes...
May 13 21:24:38 archlinux systemd[1]: Starting Journal Service...
May 13 21:24:38 archlinux systemd[1]: Starting Load Kernel Modules...
May 13 21:24:38 archlinux systemd[1]: Starting TPM2 PCR Barrier (initrd)...
May 13 21:24:38 archlinux systemd[1]: Starting Create Static Device 
Nodes in /dev...
May 13 21:24:38 archlinux systemd[1]: Starting Coldplug All udev Devices...
May 13 21:24:38 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:24:38 archlinux systemd[1]: Finished Create List of Static 
Device Nodes.
May 13 21:24:38 archlinux systemd[1]: Finished Create Static Device 
Nodes in /dev.
May 13 21:24:38 archlinux systemd[1]: Reached target Preparation for 
Local File Systems.
May 13 21:24:38 archlinux systemd[1]: Reached target Local File Systems.
May 13 21:24:38 archlinux systemd[1]: Starting Rule-based Manager for 
Device Events and Files...
May 13 21:24:38 archlinux systemd-journald[203]: Collecting audit 
messages is disabled.
May 13 21:24:38 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:24:38 archlinux systemd[1]: Started Rule-based Manager for 
Device Events and Files.
May 13 21:24:38 archlinux kernel: ACPI: video: Video Device [VGA] 
(multi-head: yes  rom: no  post: no)
May 13 21:24:38 archlinux kernel: input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1a/LNXVIDEO:00/input/input4
May 13 21:24:38 archlinux systemd[1]: Finished TPM2 PCR Barrier (initrd).
May 13 21:24:38 archlinux systemd-vconsole-setup[209]: /usr/bin/setfont 
failed with a "system error" (EX_OSERR), ignoring.
May 13 21:24:38 archlinux systemd-vconsole-setup[209]: Setting source 
virtual console failed, ignoring remaining ones.
May 13 21:24:38 archlinux systemd-pcrextend[205]: Extended PCR index 11 
with 'enter-initrd' (banks sha256).
May 13 21:24:38 archlinux systemd-vconsole-setup[216]: setfont: ERROR 
kdfontop.c:183 put_font_kdfontop: Unable to load such font with such 
kernel version
May 13 21:24:38 archlinux systemd[1]: Started Journal Service.
May 13 21:24:38 archlinux systemd[1]: Finished Coldplug All udev Devices.
May 13 21:24:38 archlinux kernel: hid-sensor-hub 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:24:39 archlinux kernel: cryptd: max_cpu_qlen set to 1000
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 1
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: hcc params 
0x0128ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 2
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb1: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb1: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb1: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb1: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb1: SerialNumber: 0000:c4:00.3
May 13 21:24:39 archlinux kernel: hub 1-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 1-0:1.0: 5 ports detected
May 13 21:24:39 archlinux kernel: ccp 0000:c4:00.2: tee enabled
May 13 21:24:39 archlinux kernel: ccp 0000:c4:00.2: psp enabled
May 13 21:24:39 archlinux kernel: nvme 0000:05:00.0: platform quirk: 
setting simple suspend
May 13 21:24:39 archlinux kernel: nvme nvme0: pci function 0000:05:00.0
May 13 21:24:39 archlinux kernel: usb usb2: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb2: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb2: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb2: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb2: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb2: SerialNumber: 0000:c4:00.3
May 13 21:24:39 archlinux kernel: hub 2-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 2-0:1.0: 2 ports detected
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 3
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 4
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb3: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb3: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb3: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb3: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb3: SerialNumber: 0000:c4:00.4
May 13 21:24:39 archlinux kernel: hub 3-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 3-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: usb usb4: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb4: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb4: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb4: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb4: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb4: SerialNumber: 0000:c4:00.4
May 13 21:24:39 archlinux kernel: hub 4-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 4-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 5
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 6
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb5: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb5: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb5: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb5: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb5: SerialNumber: 0000:c6:00.3
May 13 21:24:39 archlinux kernel: hub 5-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 5-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: nvme nvme0: D3 entry latency set to 10 
seconds
May 13 21:24:39 archlinux kernel: usb usb6: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb6: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb6: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb6: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb6: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb6: SerialNumber: 0000:c6:00.3
May 13 21:24:39 archlinux kernel: hub 6-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 6-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 7
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: nvme nvme0: 16/0/0 default/read/poll 
queues
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 8
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb7: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb7: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb7: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb7: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb7: SerialNumber: 0000:c6:00.4
May 13 21:24:39 archlinux kernel: hub 7-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 7-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: usb usb8: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb8: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb8: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb8: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb8: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb8: SerialNumber: 0000:c6:00.4
May 13 21:24:39 archlinux kernel: hub 8-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 8-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel:  nvme0n1: p1 p2
May 13 21:24:39 archlinux systemd[1]: Starting Show Plymouth Boot Screen...
May 13 21:24:39 archlinux systemd[1]: Received SIGRTMIN+20 from PID 276 
(plymouthd).
May 13 21:24:39 archlinux systemd[1]: Found device Samsung SSD 990 PRO 
4TB 2.
May 13 21:24:39 archlinux systemd[1]: Starting Cryptography Setup for 
root...
May 13 21:24:39 archlinux systemd[1]: systemd-vconsole-setup.service: 
Deactivated successfully.
May 13 21:24:39 archlinux systemd[1]: Stopped Virtual Console Setup.
May 13 21:24:39 archlinux systemd[1]: Stopping Virtual Console Setup...
May 13 21:24:39 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:24:39 archlinux systemd[1]: Received SIGRTMIN+20 from PID 276 
(plymouthd).
May 13 21:24:39 archlinux systemd[1]: Started Show Plymouth Boot Screen.
May 13 21:24:39 archlinux systemd[1]: Dispatch Password Requests to 
Console Directory Watch was skipped because of an unmet condition check 
(ConditionPathExists=!/run/plymouth/pid).
May 13 21:24:39 archlinux systemd[1]: Started Forward Password Requests 
to Plymouth Directory Watch.
May 13 21:24:39 archlinux systemd[1]: Reached target Path Units.
May 13 21:24:39 archlinux systemd[1]: Starting Check battery level 
during early boot...
May 13 21:24:39 archlinux systemd-vconsole-setup[280]: KD_FONT_OP_GET 
failed while trying to get the font metadata: Invalid argument
May 13 21:24:39 archlinux systemd-vconsole-setup[280]: Fonts will not be 
copied to remaining consoles
May 13 21:24:39 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:24:39 archlinux systemd[1]: Finished Check battery level 
during early boot.
May 13 21:24:39 archlinux systemd[1]: Started Displays emergency message 
in full screen..
May 13 21:24:39 archlinux kernel: AVX2 version of gcm_enc/dec engaged.
May 13 21:24:39 archlinux kernel: AES CTR mode by8 optimization enabled
May 13 21:24:39 archlinux kernel: device-mapper: uevent: version 1.0.3
May 13 21:24:39 archlinux kernel: device-mapper: ioctl: 4.48.0-ioctl 
(2023-03-01) initialised: dm-devel@lists.linux.dev
May 13 21:24:39 archlinux kernel: usb 1-2: new high-speed USB device 
number 2 using xhci_hcd
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:39 archlinux kernel: input: PIXA3854:00 093A:0274 Mouse as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input5
May 13 21:24:39 archlinux kernel: input: PIXA3854:00 093A:0274 Touchpad 
as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input6
May 13 21:24:39 archlinux kernel: hid-multitouch 0018:093A:0274.0002: 
input,hidraw1: I2C HID v1.00 Mouse [PIXA3854:00 093A:0274] on 
i2c-PIXA3854:00
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:39 archlinux kernel: usb 1-2: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=34.04
May 13 21:24:39 archlinux kernel: usb 1-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:24:39 archlinux kernel: usb 1-2: Product: USB2.1 Hub
May 13 21:24:39 archlinux kernel: usb 1-2: Manufacturer: GenesysLogic
May 13 21:24:39 archlinux kernel: hub 1-2:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 1-2:1.0: 4 ports detected
May 13 21:24:39 archlinux kernel: usb 2-2: new SuperSpeed Plus Gen 2x1 
USB device number 2 using xhci_hcd
May 13 21:24:39 archlinux kernel: usb 2-2: New USB device found, 
idVendor=05e3, idProduct=0625, bcdDevice=34.04
May 13 21:24:39 archlinux kernel: usb 2-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:24:39 archlinux kernel: usb 2-2: Product: USB3.2 Hub
May 13 21:24:39 archlinux kernel: usb 2-2: Manufacturer: GenesysLogic
May 13 21:24:39 archlinux kernel: hub 2-2:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 2-2:1.0: 3 ports detected
May 13 21:24:39 archlinux kernel: usb 1-3: new high-speed USB device 
number 3 using xhci_hcd
May 13 21:24:39 archlinux kernel: usb 1-3: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:24:39 archlinux kernel: usb 1-3: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:24:39 archlinux kernel: usb 1-3: Product: USB2.0 Hub
May 13 21:24:39 archlinux kernel: hub 1-3:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 1-3:1.0: 3 ports detected
May 13 21:24:39 archlinux kernel: usb 1-2.1: new low-speed USB device 
number 4 using xhci_hcd
May 13 21:24:40 archlinux kernel: usb 1-2.1: New USB device found, 
idVendor=046d, idProduct=c019, bcdDevice=43.01
May 13 21:24:40 archlinux kernel: usb 1-2.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:24:40 archlinux kernel: usb 1-2.1: Product: USB Optical Mouse
May 13 21:24:40 archlinux kernel: usb 1-2.1: Manufacturer: Logitech
May 13 21:24:40 archlinux kernel: [drm] amdgpu kernel modesetting enabled.
May 13 21:24:40 archlinux kernel: amdgpu: vga_switcheroo: detected 
switching method \_SB_.PCI0.GP17.VGA_.ATPX handle
May 13 21:24:40 archlinux kernel: amdgpu: ATPX version 1, functions 
0x00000801
May 13 21:24:40 archlinux kernel: amdgpu: ATPX Hybrid Graphics
May 13 21:24:40 archlinux kernel: amdgpu: Virtual CRAT table created for CPU
May 13 21:24:40 archlinux kernel: amdgpu: Topology: Add CPU node
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: enabling device 
(0000 -> 0003)
May 13 21:24:40 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x7480 0xF111:0x0007 0xC1).
May 13 21:24:40 archlinux kernel: [drm] register mmio base: 0x90C00000
May 13 21:24:40 archlinux kernel: [drm] register mmio size: 1048576
May 13 21:24:40 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ACPI VFCT 
table present but broken (too short #2),skipping
May 13 21:24:40 archlinux kernel: [drm] BIOS signature incorrect ee a3
May 13 21:24:40 archlinux kernel: input: Logitech USB Optical Mouse as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-2/1-2.1/1-2.1:1.0/0003:046D:C019.0003/input/input7
May 13 21:24:40 archlinux kernel: hid-generic 0003:046D:C019.0003: 
input,hidraw2: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on 
usb-0000:c4:00.3-2.1/input0
May 13 21:24:40 archlinux kernel: usbcore: registered new interface 
driver usbhid
May 13 21:24:40 archlinux kernel: usbhid: USB HID core driver
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Fetched 
VBIOS from ROM BAR
May 13 21:24:40 archlinux kernel: amdgpu: ATOM BIOS: 113-BRT125778.001
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: CP RS64 
enable
May 13 21:24:40 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature not supported
May 13 21:24:40 archlinux kernel: [drm] GPU posting now...
May 13 21:24:40 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: VRAM: 
8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:24:40 archlinux kernel: [drm] Detected VRAM RAM=8176M, BAR=8192M
May 13 21:24:40 archlinux kernel: [drm] RAM width 128bits GDDR6
May 13 21:24:40 archlinux kernel: [drm] amdgpu: 8176M of VRAM memory ready
May 13 21:24:40 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:24:40 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:24:40 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000081FEB00000).
May 13 21:24:40 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x07002800
May 13 21:24:40 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:24:40 archlinux kernel: usb 1-4: new high-speed USB device 
number 5 using xhci_hcd
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: reserve 
0x1300000 from 0x81fc000000 for PSP TMR
May 13 21:24:40 archlinux kernel: Key type trusted registered
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: smu 
driver if version = 0x00000035, smu fw if version = 0x00000040, smu fw 
program = 0, smu fw version = 0x00525800 (82.88.0)
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU 
driver if version not matched
May 13 21:24:40 archlinux kernel: usb 1-4: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:24:40 archlinux kernel: usb 1-4: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:24:40 archlinux kernel: usb 1-4: Product: USB2.0 Hub
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: [drm] Unsupported 
pwrseq engine id: 2!
May 13 21:24:40 archlinux kernel: ------------[ cut here ]------------
May 13 21:24:40 archlinux kernel: WARNING: CPU: 10 PID: 204 at 
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:24:40 archlinux kernel: Modules linked in: cbc 
encrypted_keys(+) trusted asn1_encoder tee usbhid crct10dif_pclmul 
crc32_pclmul crc32c_intel polyval_clmulni polyval_generic gf128mul 
ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 dm_mod 
aesni_intel crypto_simd nvme cryptd xhci_pci hid_sensor_hub ccp 
nvme_core xhci_pci_renesas amdgpu(+) hid_multitouch video wmi amdxcp 
i2c_algo_bit drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper 
drm_buddy drm_display_helper cec
May 13 21:24:40 archlinux kernel: CPU: 10 PID: 204 Comm: systemd-modules 
Not tainted 6.9.0-1-git-01560-ga7c840ba5fa7 #1 
96970f0beb2353c3fc8dc8c8e87ebf0f642b2644
May 13 21:24:40 archlinux kernel: Hardware name: Framework Laptop 16 
(AMD Ryzen 7040 Series)/FRANMZCP09, BIOS 03.03 03/27/2024
May 13 21:24:40 archlinux kernel: RIP: 
0010:dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:24:40 archlinux kernel: Code: b8 65 1f c1 e8 01 a6 15 fa e9 2d 
89 f5 ff 48 8b 40 10 48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c7 c6 08 66 
1f c1 e8 e0 a5 15 fa <0f> 0b ba 0f 00 00 00 e9 f5 8d f5 ff 48 8b 43 08 
48 8b 40 10 48 8b
May 13 21:24:40 archlinux kernel: RSP: 0018:ffffa8e44060b0e0 EFLAGS: 
00010246
May 13 21:24:40 archlinux kernel: RAX: 0000000000000000 RBX: 
ffff96dd0563fc40 RCX: 0000000000000027
May 13 21:24:40 archlinux kernel: RDX: 0000000000000000 RSI: 
0000000000000001 RDI: ffff96eb61f219c0
May 13 21:24:40 archlinux kernel: RBP: ffffa8e44060b118 R08: 
0000000000000000 R09: ffffa8e44060ae50
May 13 21:24:40 archlinux kernel: R10: ffffffffbc0b2388 R11: 
0000000000000003 R12: ffff96dd06d6a200
May 13 21:24:40 archlinux kernel: R13: ffffffffc1099940 R14: 
ffffa8e44060b4d0 R15: ffff96dd0e5d6800
May 13 21:24:40 archlinux kernel: FS:  00007f4196df2640(0000) 
GS:ffff96eb61f00000(0000) knlGS:0000000000000000
May 13 21:24:40 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
May 13 21:24:40 archlinux kernel: CR2: 000055c2d8f65658 CR3: 
0000000106d8a000 CR4: 0000000000f50ef0
May 13 21:24:40 archlinux kernel: PKRU: 55555554
May 13 21:24:40 archlinux kernel: Call Trace:
May 13 21:24:40 archlinux kernel:  <TASK>
May 13 21:24:40 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? __warn.cold+0x8e/0xe8
May 13 21:24:40 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? report_bug+0xff/0x140
May 13 21:24:40 archlinux kernel:  ? handle_bug+0x3c/0x80
May 13 21:24:40 archlinux kernel:  ? exc_invalid_op+0x17/0x70
May 13 21:24:40 archlinux kernel:  ? asm_exc_invalid_op+0x1a/0x20
May 13 21:24:40 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel: dcn32_panel_cntl_create+0x37/0x50 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  construct_phy+0x951/0xc10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? __alloc_pages+0x182/0x350
May 13 21:24:40 archlinux kernel:  link_create+0x1ba/0x200 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  create_links+0x134/0x420 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  dc_create+0x316/0x650 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel: amdgpu_dm_init.isra.0+0x32b/0x1d90 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? vprintk_emit+0x176/0x2a0
May 13 21:24:40 archlinux kernel:  dm_hw_init+0x12/0x30 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel: amdgpu_device_init.cold+0x1ad3/0x20fb 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel: amdgpu_driver_load_kms+0x19/0x110 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  amdgpu_pci_probe+0x187/0x400 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  local_pci_probe+0x42/0x90
May 13 21:24:40 archlinux kernel:  pci_device_probe+0xbd/0x290
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? sysfs_do_create_link_sd+0x6e/0xe0
May 13 21:24:40 archlinux kernel:  really_probe+0xdb/0x340
May 13 21:24:40 archlinux kernel:  ? pm_runtime_barrier+0x54/0x90
May 13 21:24:40 archlinux kernel:  ? __pfx___driver_attach+0x10/0x10
May 13 21:24:40 archlinux kernel: __driver_probe_device+0x78/0x110
May 13 21:24:40 archlinux kernel:  driver_probe_device+0x1f/0xa0
May 13 21:24:40 archlinux kernel:  __driver_attach+0xba/0x1c0
May 13 21:24:40 archlinux kernel:  bus_for_each_dev+0x8c/0xe0
May 13 21:24:40 archlinux kernel:  bus_add_driver+0x116/0x1f0
May 13 21:24:40 archlinux kernel:  driver_register+0x72/0xd0
May 13 21:24:40 archlinux kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  do_one_initcall+0x58/0x310
May 13 21:24:40 archlinux kernel:  do_init_module+0x60/0x220
May 13 21:24:40 archlinux kernel:  init_module_from_file+0x89/0xe0
May 13 21:24:40 archlinux kernel: idempotent_init_module+0x121/0x2b0
May 13 21:24:40 archlinux kernel: __x64_sys_finit_module+0x5e/0xb0
May 13 21:24:40 archlinux kernel:  do_syscall_64+0x82/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_filp_open+0xc4/0x170
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_sys_openat2+0x9c/0xe0
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel: entry_SYSCALL_64_after_hwframe+0x76/0x7e
May 13 21:24:40 archlinux kernel: RIP: 0033:0x7f41978ade9d
May 13 21:24:40 archlinux kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 de 0c 00 
f7 d8 64 89 01 48
May 13 21:24:40 archlinux kernel: RSP: 002b:00007fffa7b916a8 EFLAGS: 
00000246 ORIG_RAX: 0000000000000139
May 13 21:24:40 archlinux kernel: RAX: ffffffffffffffda RBX: 
000055b8de6f7440 RCX: 00007f41978ade9d
May 13 21:24:40 archlinux kernel: RDX: 0000000000000004 RSI: 
00007f41979c7376 RDI: 0000000000000011
May 13 21:24:40 archlinux kernel: RBP: 00007f41979c7376 R08: 
00007f419797cb20 R09: 00007fffa7b916f0
May 13 21:24:40 archlinux kernel: R10: 000055b8de6fc610 R11: 
0000000000000246 R12: 0000000000020000
May 13 21:24:40 archlinux kernel: R13: 000055b8de6f78e0 R14: 
0000000000000000 R15: 000055b8de6fc5d0
May 13 21:24:40 archlinux kernel:  </TASK>
May 13 21:24:40 archlinux kernel: ---[ end trace 0000000000000000 ]---
May 13 21:24:40 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.2.1
May 13 21:24:40 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:24:40 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x07002800
May 13 21:24:40 archlinux kernel: hub 1-4:1.0: USB hub found
May 13 21:24:40 archlinux kernel: hub 1-4:1.0: 4 ports detected
May 13 21:24:40 archlinux kernel: usb 1-3.2: new full-speed USB device 
number 6 using xhci_hcd
May 13 21:24:40 archlinux kernel: Key type encrypted registered
May 13 21:24:40 archlinux systemd[1]: Found device /dev/mapper/root.
May 13 21:24:40 archlinux systemd[1]: Reached target Initrd Root Device.
May 13 21:24:40 archlinux systemd[1]: Starting File System Check on 
/dev/mapper/root...
May 13 21:24:40 archlinux systemd[1]: Finished Cryptography Setup for root.
May 13 21:24:40 archlinux systemd[1]: Reached target Local Encrypted 
Volumes.
May 13 21:24:40 archlinux kernel: usb 1-3.2: unable to get BOS 
descriptor set
May 13 21:24:40 archlinux systemd-fsck[332]: artemisfs: clean, 
1409033/244129792 files, 524296829/976487936 blocks
May 13 21:24:40 archlinux systemd[1]: Finished File System Check on 
/dev/mapper/root.
May 13 21:24:40 archlinux systemd[1]: Mounting /sysroot...
May 13 21:24:40 archlinux kernel: usb 1-3.2: New USB device found, 
idVendor=32ac, idProduct=0014, bcdDevice= 0.29
May 13 21:24:40 archlinux kernel: usb 1-3.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:24:40 archlinux kernel: usb 1-3.2: Product: Laptop 16 Numpad 
Module
May 13 21:24:40 archlinux kernel: usb 1-3.2: Manufacturer: Framework
May 13 21:24:40 archlinux kernel: usb 1-3.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:24:40 archlinux systemd[1]: Mounted /sysroot.
May 13 21:24:40 archlinux systemd[1]: Reached target Initrd Root File 
System.
May 13 21:24:40 archlinux kernel: EXT4-fs (dm-0): orphan cleanup on 
readonly fs
May 13 21:24:40 archlinux kernel: EXT4-fs (dm-0): mounted filesystem 
fc8e5470-776d-4f4b-bc64-89a425bea162 ro with ordered data mode. Quota 
mode: none.
May 13 21:24:40 archlinux kernel: usb 1-5: new high-speed USB device 
number 7 using xhci_hcd
May 13 21:24:40 archlinux systemd[1]: Starting Mountpoints Configured in 
the Real Root...
May 13 21:24:40 archlinux systemd[1]: initrd-parse-etc.service: 
Deactivated successfully.
May 13 21:24:40 archlinux systemd[1]: Finished Mountpoints Configured in 
the Real Root.
May 13 21:24:40 archlinux systemd[1]: Reached target Initrd File Systems.
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.0/0003:32AC:0014.0004/input/input8
May 13 21:24:40 archlinux kernel: usb 1-5: New USB device found, 
idVendor=0e8d, idProduct=e616, bcdDevice= 1.00
May 13 21:24:40 archlinux kernel: usb 1-5: New USB device strings: 
Mfr=5, Product=6, SerialNumber=7
May 13 21:24:40 archlinux kernel: usb 1-5: Product: Wireless_Device
May 13 21:24:40 archlinux kernel: usb 1-5: Manufacturer: MediaTek Inc.
May 13 21:24:40 archlinux kernel: usb 1-5: SerialNumber: 000000000
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0004: 
input,hidraw3: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input0
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0005: 
hiddev96,hidraw4: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input1
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input9
May 13 21:24:40 archlinux kernel: usb 1-4.1: new full-speed USB device 
number 8 using xhci_hcd
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input10
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input11
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input12
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0006: 
input,hidraw5: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input2
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0007: 
hiddev97,hidraw6: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input3
May 13 21:24:40 archlinux kernel: i2c i2c-2: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:24:40 archlinux kernel: usb 1-4.1: New USB device found, 
idVendor=27c6, idProduct=609c, bcdDevice= 1.00
May 13 21:24:40 archlinux kernel: usb 1-4.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:24:40 archlinux kernel: usb 1-4.1: Product: Goodix Fingerprint 
USB Device
May 13 21:24:40 archlinux kernel: usb 1-4.1: Manufacturer: Goodix 
Technology Co., Ltd.
May 13 21:24:40 archlinux kernel: usb 1-4.1: SerialNumber: 
UIDCBAC4037_XXXX_MOC_B0
May 13 21:24:41 archlinux kernel: usb 1-4.2: new full-speed USB device 
number 9 using xhci_hcd
May 13 21:24:41 archlinux kernel: usb 1-4.2: unable to get BOS 
descriptor set
May 13 21:24:41 archlinux kernel: usb 1-4.2: New USB device found, 
idVendor=32ac, idProduct=0012, bcdDevice= 0.29
May 13 21:24:41 archlinux kernel: usb 1-4.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:24:41 archlinux kernel: usb 1-4.2: Product: Laptop 16 Keyboard 
Module - ANSI
May 13 21:24:41 archlinux kernel: usb 1-4.2: Manufacturer: Framework
May 13 21:24:41 archlinux kernel: usb 1-4.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.0/0003:32AC:0012.0008/input/input13
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.0008: 
input,hidraw7: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input0
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.0009: 
hiddev98,hidraw8: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input1
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input14
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input15
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input16
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input17
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.000A: 
input,hidraw9: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input2
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.000B: 
hiddev99,hidraw10: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input3
May 13 21:24:42 archlinux kernel: i2c i2c-3: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:24:42 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:24:42 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:24:42 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:24:43 archlinux kernel: amdgpu: HMM registered 8176MB device 
memory
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:24:43 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:24:43 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x7480:0x1002]
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: added device 1002:7480
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SE 2, SH 
per SE 2, CU per SH 8, active_cu_number 32
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma1 uses VM inv eng 13 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32768.1.1 was added
May 13 21:24:43 archlinux kernel: [drm] ring compute_32768.2.2 was added
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32768.3.3 was added
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32768.1.1 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring compute_32768.2.2 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32768.3.3 ib test pass
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Using 
BOCO for runtime pm
May 13 21:24:43 archlinux kernel: i2c i2c-4: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:24:43 archlinux kernel: i2c i2c-5: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:24:43 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:03:00.0 on minor 1
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: [drm] Cannot find 
any crtc or sizes
May 13 21:24:43 archlinux kernel: [drm] DSC precompute is not needed.
May 13 21:24:43 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x15BF 0xF111:0x0005 0xC1).
May 13 21:24:43 archlinux kernel: [drm] register mmio base: 0x90500000
May 13 21:24:43 archlinux kernel: [drm] register mmio size: 524288
May 13 21:24:43 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Fetched 
VBIOS from VFCT
May 13 21:24:43 archlinux kernel: amdgpu: ATOM BIOS: 113-PHXGENERIC-001
May 13 21:24:43 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: vgaarb: 
deactivate vga console
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature enabled
May 13 21:24:43 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: VRAM: 
4096M 0x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:24:43 archlinux kernel: [drm] Detected VRAM RAM=4096M, BAR=4096M
May 13 21:24:43 archlinux kernel: [drm] RAM width 128bits DDR5
May 13 21:24:43 archlinux kernel: [drm] amdgpu: 4096M of VRAM memory ready
May 13 21:24:43 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:24:43 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:24:43 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000080FFD00000).
May 13 21:24:43 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x08003700
May 13 21:24:43 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: reserve 
0x4000000 from 0x80f8000000 for PSP TMR
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:24:43 archlinux kernel: [drm] Seamless boot condition check passed
May 13 21:24:43 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.1.4
May 13 21:24:43 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:24:43 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x08003700
May 13 21:24:43 archlinux kernel: i2c i2c-6: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:24:43 archlinux kernel: [drm] PSR support 1, DC PSR ver 0, 
sink PSR ver 1 DPCD caps 0x2a su_y_granularity 0
May 13 21:24:43 archlinux kernel: i2c i2c-7: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:24:43 archlinux kernel: i2c i2c-8: adapter [AMDGPU DM i2c hw 
bus 2] registered
May 13 21:24:43 archlinux kernel: i2c i2c-9: adapter [AMDGPU DM i2c hw 
bus 3] registered
May 13 21:24:43 archlinux kernel: i2c i2c-10: adapter [AMDGPU DM i2c hw 
bus 4] registered
May 13 21:24:43 archlinux kernel: i2c i2c-11: adapter [AMDGPU DM i2c hw 
bus 5] registered
May 13 21:24:43 archlinux kernel: i2c i2c-12: adapter [AMDGPU DM i2c hw 
bus 6] registered
May 13 21:24:43 archlinux kernel: i2c i2c-13: adapter [AMDGPU DM i2c hw 
bus 7] registered
May 13 21:24:43 archlinux kernel: i2c i2c-14: adapter [AMDGPU DM i2c hw 
bus 8] registered
May 13 21:24:43 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:24:43 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:24:43 archlinux kernel: amdgpu: HMM registered 4096MB device 
memory
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:24:43 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:24:43 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x15bf:0x1002]
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: added device 1002:15bf
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SE 1, SH 
per SE 2, CU per SH 6, active_cu_number 12
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32770.1.1 was added
May 13 21:24:43 archlinux kernel: [drm] ring compute_32770.2.2 was added
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32770.3.3 was added
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32770.1.1 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring compute_32770.2.2 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32770.3.3 ib test pass
May 13 21:24:43 archlinux kernel: i2c i2c-15: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:24:43 archlinux kernel: i2c i2c-16: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:24:43 archlinux kernel: i2c i2c-17: adapter [AMDGPU DM aux hw 
bus 2] registered
May 13 21:24:43 archlinux kernel: i2c i2c-18: adapter [AMDGPU DM aux hw 
bus 3] registered
May 13 21:24:43 archlinux kernel: i2c i2c-19: adapter [AMDGPU DM aux hw 
bus 4] registered
May 13 21:24:43 archlinux kernel: i2c i2c-20: adapter [AMDGPU DM aux hw 
bus 5] registered
May 13 21:24:43 archlinux kernel: i2c i2c-21: adapter [AMDGPU DM aux hw 
bus 6] registered
May 13 21:24:43 archlinux kernel: i2c i2c-22: adapter [AMDGPU DM aux hw 
bus 7] registered
May 13 21:24:43 archlinux kernel: i2c i2c-23: adapter [AMDGPU DM aux hw 
bus 8] registered
May 13 21:24:43 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:c4:00.0 on minor 2
May 13 21:24:43 archlinux kernel: fbcon: amdgpudrmfb (fb0) is primary device
May 13 21:24:43 archlinux kernel: fbcon: Deferring console take-over
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] fb0: 
amdgpudrmfb frame buffer device
May 13 21:24:43 archlinux systemd-modules-load[204]: Inserted module 
'amdgpu'
May 13 21:24:43 archlinux systemd-modules-load[204]: Module 'tpm_crb' is 
built in
May 13 21:24:43 archlinux systemd[1]: Finished Load Kernel Modules.
May 13 21:24:43 archlinux systemd[1]: Reached target System Initialization.
May 13 21:24:43 archlinux systemd[1]: Reached target Basic System.
May 13 21:24:43 archlinux systemd[1]: Reached target Initrd Default Target.
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:223
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:231
May 13 21:24:43 archlinux systemd[1]: Starting Cleaning Up and Shutting 
Down Daemons...
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:239
May 13 21:24:43 archlinux systemd[1]: Stopped target Initrd Default Target.
May 13 21:24:43 archlinux systemd[1]: Stopped target Basic System.
May 13 21:24:43 archlinux systemd[1]: Stopped target Initrd Root Device.
May 13 21:24:43 archlinux systemd[1]: Stopped target Path Units.
May 13 21:24:43 archlinux systemd[1]: Stopped target Slice Units.
May 13 21:24:43 archlinux systemd[1]: Stopped target Socket Units.
May 13 21:24:43 archlinux systemd[1]: Stopped target System Initialization.
May 13 21:24:43 archlinux systemd[1]: Stopped target Local Encrypted 
Volumes.
May 13 21:24:43 archlinux systemd[1]: Stopped target Local File Systems.
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:247
May 13 21:24:43 archlinux systemd[1]: Stopped target Preparation for 
Local File Systems.
May 13 21:24:43 archlinux systemd[1]: Stopped target Swaps.
May 13 21:24:43 archlinux systemd[1]: Stopped target Timer Units.
May 13 21:24:43 archlinux systemd[1]: kmod-static-nodes.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Create List of Static 
Device Nodes.
May 13 21:24:43 archlinux systemd[1]: Starting Plymouth switch root 
service...
May 13 21:24:43 archlinux systemd[1]: Stopping Displays emergency 
message in full screen....
May 13 21:24:43 archlinux systemd[1]: systemd-modules-load.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Load Kernel Modules.
May 13 21:24:43 archlinux systemd[1]: systemd-modules-load.service: 
Consumed 1.622s CPU time.
May 13 21:24:43 archlinux systemd[1]: Stopping TPM2 PCR Barrier (initrd)...
May 13 21:24:43 archlinux systemd[1]: systemd-udev-trigger.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Coldplug All udev Devices.
May 13 21:24:43 archlinux systemd[1]: Stopping Rule-based Manager for 
Device Events and Files...
May 13 21:24:43 archlinux systemd[1]: initrd-cleanup.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Finished Cleaning Up and Shutting 
Down Daemons.
May 13 21:24:43 archlinux systemd[1]: systemd-bsod.service: Deactivated 
successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Displays emergency message 
in full screen..
May 13 21:24:43 archlinux systemd[1]: systemd-battery-check.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Check battery level during 
early boot.
May 13 21:24:43 archlinux systemd-pcrextend[382]: Extended PCR index 11 
with 'leave-initrd' (banks sha256).
May 13 21:24:43 archlinux systemd[1]: systemd-pcrphase-initrd.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped TPM2 PCR Barrier (initrd).
May 13 21:24:43 archlinux systemd[1]: systemd-udevd.service: Deactivated 
successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Rule-based Manager for 
Device Events and Files.
May 13 21:24:43 archlinux systemd[1]: systemd-udevd-control.socket: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Closed udev Control Socket.
May 13 21:24:43 archlinux systemd[1]: systemd-udevd-kernel.socket: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Closed udev Kernel Socket.
May 13 21:24:43 archlinux systemd[1]: Starting Cleanup udev Database...
May 13 21:24:43 archlinux systemd[1]: 
systemd-tmpfiles-setup-dev.service: Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Create Static Device Nodes 
in /dev.
May 13 21:24:44 archlinux systemd[1]: initrd-udevadm-cleanup-db.service: 
Deactivated successfully.
May 13 21:24:44 archlinux systemd[1]: Finished Cleanup udev Database.
May 13 21:24:44 archlinux systemd[1]: Reached target Switch Root.
May 13 21:24:45 archlinux systemd[1]: Finished Plymouth switch root service.
May 13 21:24:45 archlinux systemd[1]: Starting Switch Root...
May 13 21:24:45 archlinux systemd[1]: Switching root.
May 13 21:24:45 archlinux systemd-journald[203]: Journal stopped
May 13 21:24:38 archlinux systemd-journald[203]: Journal started
May 13 21:24:38 archlinux systemd-journald[203]: Runtime Journal 
(/run/log/journal/e35a03c7b4404a01b240b4e6e4914c5a) is 8.0M, max 1.1G, 
1.1G free.
May 13 21:24:38 archlinux systemd-journald[203]: Missed 239 kernel messages
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high 
edge lint[0x1])
May 13 21:24:38 archlinux kernel: IOAPIC[0]: apic_id 33, version 33, 
address 0xfec00000, GSI 0-23
May 13 21:24:38 archlinux kernel: IOAPIC[1]: apic_id 34, version 33, 
address 0xfec01000, GSI 24-55
May 13 21:24:38 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 
global_irq 2 dfl dfl)
May 13 21:24:38 archlinux kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 
global_irq 9 low level)
May 13 21:24:38 archlinux kernel: ACPI: Using ACPI (MADT) for SMP 
configuration information
May 13 21:24:38 archlinux kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
May 13 21:24:38 archlinux kernel: e820: update [mem 
0x52bba000-0x52c08fff] usable ==> reserved
May 13 21:24:38 archlinux kernel: CPU topo: Max. logical packages:   1
May 13 21:24:38 archlinux kernel: CPU topo: Max. logical dies:       1
May 13 21:24:38 archlinux kernel: CPU topo: Max. dies per package:   1
May 13 21:24:38 archlinux kernel: CPU topo: Max. threads per core:   2
May 13 21:24:38 archlinux kernel: CPU topo: Num. cores per package:     8
May 13 21:24:38 archlinux kernel: CPU topo: Num. threads per package:  16
May 13 21:24:38 archlinux kernel: CPU topo: Allowing 16 present CPUs 
plus 0 hotplug CPUs
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x00000000-0x00000fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x0009f000-0x000bffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x000c0000-0x000fffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09b00000-0x09dfffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x09f00000-0x09f3bfff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x49b60000-0x4bd5ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd69000-0x4bd6cfff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd6f000-0x4bd6ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd74000-0x4bd74fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x4bd78000-0x4bd78fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x52bba000-0x52c08fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x548cc000-0x548ccfff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x57f7f000-0x5a77efff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5a77f000-0x5af7efff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5af7f000-0x5affefff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5b000000-0x5bffffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5c000000-0x5d78ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d790000-0x5d7effff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f0000-0x5d7f4fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x5d7f5000-0x5fffffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0x60000000-0xfebfffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec00000-0xfec01fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec02000-0xfec0ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec10000-0xfec10fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec11000-0xfec1ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec20000-0xfec20fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfec21000-0xfed7ffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed80000-0xfed81fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfed82000-0xfedfffff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee00000-0xfee00fff]
May 13 21:24:38 archlinux kernel: PM: hibernation: Registered nosave 
memory: [mem 0xfee01000-0xffffffff]
May 13 21:24:38 archlinux kernel: [mem 0x60000000-0xfebfffff] available 
for PCI devices
May 13 21:24:38 archlinux kernel: Booting paravirtualized kernel on bare 
hardware
May 13 21:24:38 archlinux kernel: clocksource: refined-jiffies: mask: 
0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
May 13 21:24:38 archlinux kernel: setup_percpu: NR_CPUS:320 
nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
May 13 21:24:38 archlinux kernel: percpu: Embedded 66 pages/cpu s233472 
r8192 d28672 u524288
May 13 21:24:38 archlinux kernel: pcpu-alloc: s233472 r8192 d28672 
u524288 alloc=1*2097152
May 13 21:24:38 archlinux kernel: pcpu-alloc: [0] 00 01 02 03 [0] 04 05 
06 07
May 13 21:24:38 archlinux kernel: pcpu-alloc: [0] 08 09 10 11 [0] 12 13 
14 15
May 13 21:24:38 archlinux kernel: Kernel command line: 
rd.luks.name=496f2909-055b-49f7-9a43-b48647d757a9=root 
rd.luks.options=discard root=/dev/mapper/root quiet loglevel=3 
systemd.show_status=auto rd.udev.log_level=3 splash
May 13 21:24:38 archlinux kernel: Unknown kernel command line parameters 
"splash", will be passed to user space.
May 13 21:24:38 archlinux kernel: Dentry cache hash table entries: 
8388608 (order: 14, 67108864 bytes, linear)
May 13 21:24:38 archlinux kernel: Inode-cache hash table entries: 
4194304 (order: 13, 33554432 bytes, linear)
May 13 21:24:38 archlinux kernel: Fallback order for Node 0: 0
May 13 21:24:38 archlinux kernel: Built 1 zonelists, mobility grouping 
on.  Total pages: 15433546
May 13 21:24:38 archlinux kernel: Policy zone: Normal
May 13 21:24:38 archlinux kernel: mem auto-init: stack:all(zero), heap 
alloc:on, heap free:off
May 13 21:24:38 archlinux kernel: software IO TLB: area num 16.
May 13 21:24:38 archlinux kernel: Memory: 61338632K/62714740K available 
(18432K kernel code, 2189K rwdata, 13500K rodata, 3412K init, 3604K bss, 
1375848K reserved, 0K cma-reserved)
May 13 21:24:38 archlinux kernel: SLUB: HWalign=64, Order=0-3, 
MinObjects=0, CPUs=16, Nodes=1
May 13 21:24:38 archlinux kernel: ftrace: allocating 49950 entries in 
196 pages
May 13 21:24:38 archlinux kernel: ftrace: allocated 196 pages with 3 groups
May 13 21:24:38 archlinux kernel: Dynamic Preempt: full
May 13 21:24:38 archlinux kernel: rcu: Preemptible hierarchical RCU 
implementation.
May 13 21:24:38 archlinux kernel: rcu:         RCU restricting CPUs from 
NR_CPUS=320 to nr_cpu_ids=16.
May 13 21:24:38 archlinux kernel: rcu:         RCU priority boosting: 
priority 1 delay 500 ms.
May 13 21:24:38 archlinux kernel:         Trampoline variant of Tasks 
RCU enabled.
May 13 21:24:38 archlinux kernel:         Rude variant of Tasks RCU enabled.
May 13 21:24:38 archlinux kernel:         Tracing variant of Tasks RCU 
enabled.
May 13 21:24:38 archlinux kernel: rcu: RCU calculated value of 
scheduler-enlistment delay is 30 jiffies.
May 13 21:24:38 archlinux kernel: rcu: Adjusting geometry for 
rcu_fanout_leaf=16, nr_cpu_ids=16
May 13 21:24:38 archlinux kernel: RCU Tasks: Setting shift to 4 and lim 
to 1 rcu_task_cb_adjust=1.
May 13 21:24:38 archlinux kernel: RCU Tasks Rude: Setting shift to 4 and 
lim to 1 rcu_task_cb_adjust=1.
May 13 21:24:38 archlinux kernel: RCU Tasks Trace: Setting shift to 4 
and lim to 1 rcu_task_cb_adjust=1.
May 13 21:24:38 archlinux kernel: NR_IRQS: 20736, nr_irqs: 1096, 
preallocated irqs: 16
May 13 21:24:38 archlinux kernel: rcu: srcu_init: Setting srcu_struct 
sizes based on contention.
May 13 21:24:38 archlinux kernel: kfence: initialized - using 2097152 
bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
May 13 21:24:38 archlinux kernel: Console: colour dummy device 80x25
May 13 21:24:38 archlinux kernel: printk: legacy console [tty0] enabled
May 13 21:24:38 archlinux kernel: ACPI: Core revision 20230628
May 13 21:24:38 archlinux kernel: clocksource: hpet: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
May 13 21:24:38 archlinux kernel: APIC: Switch to symmetric I/O mode setup
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR0, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR1, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR2, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: ivrs, add hid:AMDI0020, 
uid:\_SB.FUR3, rdevid:160
May 13 21:24:38 archlinux kernel: AMD-Vi: Using global IVHD 
EFR:0x246577efa2054ada, EFR2:0x0
May 13 21:24:38 archlinux kernel: x2apic: IRQ remapping doesn't support 
X2APIC mode
May 13 21:24:38 archlinux kernel: APIC: Switched APIC routing to: 
physical flat
May 13 21:24:38 archlinux kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 
apic2=-1 pin2=-1
May 13 21:24:38 archlinux kernel: clocksource: tsc-early: mask: 
0xffffffffffffffff max_cycles: 0x7317abf1c13, max_idle_ns: 881590769496 ns
May 13 21:24:38 archlinux kernel: Calibrating delay loop (skipped), 
value calculated using timer frequency.. 7987.22 BogoMIPS (lpj=13307563)
May 13 21:24:38 archlinux kernel: x86/cpu: User Mode Instruction 
Prevention (UMIP) activated
May 13 21:24:38 archlinux kernel: LVT offset 1 assigned for vector 0xf9
May 13 21:24:38 archlinux kernel: LVT offset 2 assigned for vector 0xf4
May 13 21:24:38 archlinux kernel: Last level iTLB entries: 4KB 512, 2MB 
512, 4MB 256
May 13 21:24:38 archlinux kernel: Last level dTLB entries: 4KB 3072, 2MB 
3072, 4MB 1536, 1GB 0
May 13 21:24:38 archlinux kernel: process: using mwait in idle threads
May 13 21:24:38 archlinux kernel: Spectre V1 : Mitigation: 
usercopy/swapgs barriers and __user pointer sanitization
May 13 21:24:38 archlinux kernel: Spectre V2 : Mitigation: Enhanced / 
Automatic IBRS
May 13 21:24:38 archlinux kernel: Spectre V2 : Spectre v2 / SpectreRSB 
mitigation: Filling RSB on context switch
May 13 21:24:38 archlinux kernel: Spectre V2 : mitigation: Enabling 
conditional Indirect Branch Prediction Barrier
May 13 21:24:38 archlinux kernel: Spectre V2 : User space: Mitigation: 
STIBP always-on protection
May 13 21:24:38 archlinux kernel: Speculative Store Bypass: Mitigation: 
Speculative Store Bypass disabled via prctl
May 13 21:24:38 archlinux kernel: Speculative Return Stack Overflow: 
Mitigation: Safe RET
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x001: 'x87 floating point registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x002: 'SSE registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x004: 'AVX registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x020: 'AVX-512 opmask'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x040: 'AVX-512 Hi256'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x080: 'AVX-512 ZMM_Hi256'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x200: 'Protection Keys User registers'
May 13 21:24:38 archlinux kernel: x86/fpu: Supporting XSAVE feature 
0x800: 'Control-flow User registers'
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[2]:  576, 
xstate_sizes[2]:  256
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[5]:  832, 
xstate_sizes[5]:   64
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[6]:  896, 
xstate_sizes[6]:  512
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[7]: 1408, 
xstate_sizes[7]: 1024
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[9]: 2432, 
xstate_sizes[9]:    8
May 13 21:24:38 archlinux kernel: x86/fpu: xstate_offset[11]: 2440, 
xstate_sizes[11]:   16
May 13 21:24:38 archlinux kernel: x86/fpu: Enabled xstate features 
0xae7, context size is 2456 bytes, using 'compacted' format.
May 13 21:24:38 archlinux kernel: Freeing SMP alternatives memory: 40K
May 13 21:24:38 archlinux kernel: pid_max: default: 32768 minimum: 301
May 13 21:24:38 archlinux kernel: LSM: initializing 
lsm=capability,landlock,lockdown,yama,bpf
May 13 21:24:38 archlinux kernel: landlock: Up and running.
May 13 21:24:38 archlinux kernel: Yama: becoming mindful.
May 13 21:24:38 archlinux kernel: LSM support for eBPF active
May 13 21:24:38 archlinux kernel: Mount-cache hash table entries: 131072 
(order: 8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: Mountpoint-cache hash table entries: 
131072 (order: 8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: smpboot: CPU0: AMD Ryzen 9 7940HS w/ 
Radeon 780M Graphics (family: 0x19, model: 0x74, stepping: 0x1)
May 13 21:24:38 archlinux kernel: Performance Events: Fam17h+ 16-deep 
LBR, core perfctr, AMD PMU driver.
May 13 21:24:38 archlinux kernel: ... version:                2
May 13 21:24:38 archlinux kernel: ... bit width:              48
May 13 21:24:38 archlinux kernel: ... generic registers:      6
May 13 21:24:38 archlinux kernel: ... value mask: 0000ffffffffffff
May 13 21:24:38 archlinux kernel: ... max period: 00007fffffffffff
May 13 21:24:38 archlinux kernel: ... fixed-purpose events:   0
May 13 21:24:38 archlinux kernel: ... event mask: 000000000000003f
May 13 21:24:38 archlinux kernel: signal: max sigframe size: 3376
May 13 21:24:38 archlinux kernel: rcu: Hierarchical SRCU implementation.
May 13 21:24:38 archlinux kernel: rcu:         Max phase no-delay 
instances is 1000.
May 13 21:24:38 archlinux kernel: NMI watchdog: Enabled. Permanently 
consumes one hw-PMU counter.
May 13 21:24:38 archlinux kernel: smp: Bringing up secondary CPUs ...
May 13 21:24:38 archlinux kernel: smpboot: x86: Booting SMP configuration:
May 13 21:24:38 archlinux kernel: .... node  #0, CPUs:        #2 #4  #6  
#8 #10 #12 #14  #1  #3  #5  #7  #9 #11 #13 #15
May 13 21:24:38 archlinux kernel: Spectre V2 : Update user space SMT 
mitigation: STIBP always-on
May 13 21:24:38 archlinux kernel: smp: Brought up 1 node, 16 CPUs
May 13 21:24:38 archlinux kernel: smpboot: Total of 16 processors 
activated (127803.63 BogoMIPS)
May 13 21:24:38 archlinux kernel: devtmpfs: initialized
May 13 21:24:38 archlinux kernel: x86/mm: Memory block size: 128MB
May 13 21:24:38 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x09f00000-0x09f3bfff] (245760 bytes)
May 13 21:24:38 archlinux kernel: ACPI: PM: Registering ACPI NVS region 
[mem 0x5a77f000-0x5af7efff] (8388608 bytes)
May 13 21:24:38 archlinux kernel: clocksource: jiffies: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
May 13 21:24:38 archlinux kernel: futex hash table entries: 4096 (order: 
6, 262144 bytes, linear)
May 13 21:24:38 archlinux kernel: pinctrl core: initialized pinctrl 
subsystem
May 13 21:24:38 archlinux kernel: PM: RTC time: 02:24:36, date: 2024-05-14
May 13 21:24:38 archlinux kernel: NET: Registered PF_NETLINK/PF_ROUTE 
protocol family
May 13 21:24:38 archlinux kernel: DMA: preallocated 4096 KiB GFP_KERNEL 
pool for atomic allocations
May 13 21:24:38 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA pool for atomic allocations
May 13 21:24:38 archlinux kernel: DMA: preallocated 4096 KiB 
GFP_KERNEL|GFP_DMA32 pool for atomic allocations
May 13 21:24:38 archlinux kernel: audit: initializing netlink subsys 
(disabled)
May 13 21:24:38 archlinux kernel: audit: type=2000 
audit(1715653476.186:1): state=initialized audit_enabled=0 res=1
May 13 21:24:38 archlinux kernel: i2c-core: driver [dummy] registered
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'fair_share'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'bang_bang'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'step_wise'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'user_space'
May 13 21:24:38 archlinux kernel: thermal_sys: Registered thermal 
governor 'power_allocator'
May 13 21:24:38 archlinux kernel: cpuidle: using governor ladder
May 13 21:24:38 archlinux kernel: cpuidle: using governor menu
May 13 21:24:38 archlinux kernel: Simple Boot Flag at 0x44 set to 0x1
May 13 21:24:38 archlinux kernel: acpiphp: ACPI Hot Plug PCI Controller 
Driver version: 0.5
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:24:38 archlinux kernel: PCI: not using ECAM ([mem 
0xe0000000-0xefffffff] not reserved)
May 13 21:24:38 archlinux kernel: PCI: Using configuration type 1 for 
base access
May 13 21:24:38 archlinux kernel: PCI: Using configuration type 1 for 
extended access
May 13 21:24:38 archlinux kernel: kprobes: kprobe jump-optimization is 
enabled. All kprobes are optimized if possible.
May 13 21:24:38 archlinux kernel: HugeTLB: registered 1.00 GiB page 
size, pre-allocated 0 pages
May 13 21:24:38 archlinux kernel: HugeTLB: 16380 KiB vmemmap can be 
freed for a 1.00 GiB page
May 13 21:24:38 archlinux kernel: HugeTLB: registered 2.00 MiB page 
size, pre-allocated 0 pages
May 13 21:24:38 archlinux kernel: HugeTLB: 28 KiB vmemmap can be freed 
for a 2.00 MiB page
May 13 21:24:38 archlinux kernel: Demotion targets for Node 0: null
May 13 21:24:38 archlinux kernel: i2c-core: driver [sx150x-pinctrl] 
registered
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(Module Device)
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(Processor Device)
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 13 21:24:38 archlinux kernel: ACPI: Added _OSI(Processor Aggregator 
Device)
May 13 21:24:38 archlinux kernel: ACPI: 34 ACPI AML tables successfully 
acquired and loaded
May 13 21:24:38 archlinux kernel: ACPI: USB4 _OSC: OS supports USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:24:38 archlinux kernel: ACPI: USB4 _OSC: OS controls USB3+ 
DisplayPort+ PCIe+ XDomain+
May 13 21:24:38 archlinux kernel: ACPI: _OSC evaluation for CPUs failed, 
trying _PDC
May 13 21:24:38 archlinux kernel: ACPI: EC: EC started
May 13 21:24:38 archlinux kernel: ACPI: EC: interrupt blocked
May 13 21:24:38 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC used to handle transactions
May 13 21:24:38 archlinux kernel: ACPI: Interpreter enabled
May 13 21:24:38 archlinux kernel: ACPI: PM: (supports S0 S4 S5)
May 13 21:24:38 archlinux kernel: ACPI: Using IOAPIC for interrupt routing
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
(base 0xe0000000) for domain 0000 [bus 00-ff]
May 13 21:24:38 archlinux kernel: PCI: [Firmware Info]: ECAM [mem 
0xe0000000-0xefffffff] not reserved in ACPI motherboard resources
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
is EfiMemoryMappedIO; assuming valid
May 13 21:24:38 archlinux kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] 
reserved to work around lack of ACPI motherboard _CRS
May 13 21:24:38 archlinux kernel: PCI: Using host bridge windows from 
ACPI; if necessary, use "pci=nocrs" and report a bug
May 13 21:24:38 archlinux kernel: PCI: Ignoring E820 reservations for 
host bridge windows
May 13 21:24:38 archlinux kernel: ACPI: Enabled 4 GPEs in block 00 to 1F
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.M237: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: 
New power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP6.PWSR: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GPP8.P0NV: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.PWRS: New power 
resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New 
power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PRWL: New power resource
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PRWB: New power resource
May 13 21:24:38 archlinux kernel: ACPI: PCI Root Bridge [PCI0] (domain 
0000 [bus 00-ff])
May 13 21:24:38 archlinux kernel: acpi PNP0A08:00: _OSC: OS supports 
[ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
May 13 21:24:38 archlinux kernel: acpi PNP0A08:00: _OSC: platform does 
not support [SHPCHotplug AER]
May 13 21:24:38 archlinux kernel: acpi PNP0A08:00: _OSC: OS now controls 
[PCIeHotplug PME PCIeCapability LTR DPC]
May 13 21:24:38 archlinux kernel: PCI host bridge to bus 0000:00
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0000-0x0cf7 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[io  0x0d00-0xffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000a0000-0x000bffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000c0000-0x000cffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x000d0000-0x000effff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x60000000-0x90ffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xf0000000-0xfec00000 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed45000-0xfed814ff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfed81900-0xfed81fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc0000-0xfedc0fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0xfedc6000-0xfedc6fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[mem 0x10c0200000-0x891fffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: root bus resource 
[bus 00-ff]
May 13 21:24:38 archlinux kernel: pci 0000:00:00.0: [1022:14e8] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:00.2: [1022:14e9] type 00 
class 0x080600 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:01.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: [1022:14ed] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:02.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: [1022:14ee] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:03.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:04.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: [1022:14ef] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.0: [1022:14ea] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: [1022:14eb] type 01 
class 0x060400 PCIe Root Port
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:14.0: [1022:790b] type 00 
class 0x0c0500 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:14.3: [1022:790e] type 00 
class 0x060100 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.0: [1022:14f0] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.1: [1022:14f1] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.2: [1022:14f2] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.3: [1022:14f3] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.4: [1022:14f4] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.5: [1022:14f5] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.6: [1022:14f6] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:00:18.7: [1022:14f7] type 00 
class 0x060000 conventional PCI endpoint
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: [1002:1478] type 01 
class 0x060400 PCIe Switch Upstream Port
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: BAR 0 [mem 
0x90e00000-0x90e03fff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: [1002:1479] type 01 
class 0x060400 PCIe Switch Downstream Port
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: [1002:7480] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 0 [mem 
0x8400000000-0x85ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 2 [mem 
0x8600000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 4 [io 0xa000-0xa0ff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: BAR 5 [mem 
0x90c00000-0x90cfffff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: [1002:ab30] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: BAR 0 [mem 
0x90d00000-0x90d03fff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: [14c3:0616] type 00 
class 0x028000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: BAR 0 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: BAR 2 [mem 
0x90b00000-0x90b07fff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:24:38 archlinux kernel: pci 0000:05:00.0: [144d:a80c] type 00 
class 0x010802 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:05:00.0: BAR 0 [mem 
0x90a00000-0x90a03fff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: [1002:15bf] type 00 
class 0x030000 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 0 [mem 
0x8610000000-0x861fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 2 [mem 
0x90000000-0x901fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 4 [io 0x1000-0x10ff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: BAR 5 [mem 
0x90500000-0x9057ffff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: [1002:1640] type 00 
class 0x040300 PCIe Legacy Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: BAR 0 [mem 
0x905c8000-0x905cbfff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: PME# supported from 
D1 D2 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: [1022:15c7] type 00 
class 0x108000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: BAR 2 [mem 
0x90400000-0x904fffff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: BAR 5 [mem 
0x905cc000-0x905cdfff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: [1022:15b9] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: BAR 0 [mem 
0x90200000-0x902fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: [1022:15ba] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: BAR 0 [mem 
0x90300000-0x903fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: [1022:15e2] type 00 
class 0x048000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: BAR 0 [mem 
0x90580000-0x905bffff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: BAR 2 [mem 
0x8620000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: [1022:15e3] type 00 
class 0x040300 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: BAR 0 [mem 
0x905c0000-0x905c7fff]
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: PME# supported from 
D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: [1022:1502] type 00 
class 0x118000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 0 [mem 
0x90900000-0x9097ffff]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 1 [mem 
0x909c0000-0x909c1fff]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 2 [mem 
0x8620800000-0x862083ffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: BAR 4 [mem 
0x90980000-0x909bffff]
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.0: [1022:14ec] type 00 
class 0x130000 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.0: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: [1022:15c0] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: BAR 0 [mem 
0x90600000-0x906fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: [1022:15c1] type 00 
class 0x0c0330 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: BAR 0 [mem 
0x90700000-0x907fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: [1022:1668] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: BAR 0 [mem 
0x90800000-0x9087ffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: [1022:1669] type 00 
class 0x0c0340 PCIe Endpoint
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: BAR 0 [mem 
0x90880000-0x908fffff 64bit]
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: Max Payload Size set 
to 128 (was 256, max 256)
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: enabling Extended Tags
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: PME# supported from 
D0 D3hot D3cold
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKA 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKA disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKB 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKB disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKC 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKC disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKD 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKD disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKE 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKE disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKF 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKF disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKG 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKG disabled
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKH 
configured for IRQ 0
May 13 21:24:38 archlinux kernel: ACPI: PCI: Interrupt link LNKH disabled
May 13 21:24:38 archlinux kernel: Low-power S0 idle used by default for 
system suspend
May 13 21:24:38 archlinux kernel: ACPI: EC: interrupt unblocked
May 13 21:24:38 archlinux kernel: ACPI: EC: event unblocked
May 13 21:24:38 archlinux kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 13 21:24:38 archlinux kernel: ACPI: EC: GPE=0xb
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT 
EC initialization complete
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used 
to handle transactions and events
May 13 21:24:38 archlinux kernel: iommu: Default domain type: Translated
May 13 21:24:38 archlinux kernel: iommu: DMA domain TLB invalidation 
policy: lazy mode
May 13 21:24:38 archlinux kernel: i2c-core: driver [88PM860x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [WM8400] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [wm831x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [wm8350] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [tps65910] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [da903x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [da9052] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [lp8788] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [da9055-pmic] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max77843] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max8925] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max8997] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [max8998] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [tps6586x] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [tps65090] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [aat2870] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [palmas] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [rc5t583] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [as3711] registered
May 13 21:24:38 archlinux kernel: SCSI subsystem initialized
May 13 21:24:38 archlinux kernel: libata version 3.00 loaded.
May 13 21:24:38 archlinux kernel: ACPI: bus type USB registered
May 13 21:24:38 archlinux kernel: usbcore: registered new interface 
driver usbfs
May 13 21:24:38 archlinux kernel: usbcore: registered new interface 
driver hub
May 13 21:24:38 archlinux kernel: usbcore: registered new device driver usb
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
clock-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-rising-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-scl-internal-delay-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-sda-hold-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-digital-filter-width-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: ACPI slave 
is not supported yet
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: SDA Hold 
Time TX:RX = 48:48
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: Bus speed: 
Fast Mode (400 kHz)
May 13 21:24:38 archlinux kernel: i2c i2c-0: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:24:38 archlinux kernel: i2c i2c-0: client [FRMW0003:00] 
registered with bus id i2c-FRMW0003:00
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
clock-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-rising-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-scl-internal-delay-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-falling-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-sda-hold-time-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-digital-filter-width-ns: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c-analog-filter-cutoff-frequency: 0
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: ACPI slave 
is not supported yet
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: Standard 
Mode HCNT:LCNT = 642:749
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: Fast Mode 
HCNT:LCNT = 132:239
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: SDA Hold 
Time TX:RX = 48:48
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: Bus speed: 
Fast Mode (400 kHz)
May 13 21:24:38 archlinux kernel: i2c i2c-1: adapter [Synopsys 
DesignWare I2C adapter] registered
May 13 21:24:38 archlinux kernel: i2c i2c-1: client [PIXA3854:00] 
registered with bus id i2c-PIXA3854:00
May 13 21:24:38 archlinux kernel: pps_core: LinuxPPS API ver. 1 registered
May 13 21:24:38 archlinux kernel: pps_core: Software ver. 5.3.6 - 
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
May 13 21:24:38 archlinux kernel: PTP clock support registered
May 13 21:24:38 archlinux kernel: EDAC MC: Ver: 3.0.0
May 13 21:24:38 archlinux kernel: efivars: Registered efivars operations
May 13 21:24:38 archlinux kernel: NetLabel: Initializing
May 13 21:24:38 archlinux kernel: NetLabel:  domain hash size = 128
May 13 21:24:38 archlinux kernel: NetLabel:  protocols = UNLABELED 
CIPSOv4 CALIPSO
May 13 21:24:38 archlinux kernel: NetLabel:  unlabeled traffic allowed 
by default
May 13 21:24:38 archlinux kernel: mctp: management component transport 
protocol core
May 13 21:24:38 archlinux kernel: NET: Registered PF_MCTP protocol family
May 13 21:24:38 archlinux kernel: PCI: Using ACPI for IRQ routing
May 13 21:24:38 archlinux kernel: PCI: pci_cache_line_size set to 64 bytes
May 13 21:24:38 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:24:38 archlinux kernel: resource: Expanded resource Reserved 
due to conflict with PCI Bus 0000:00
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x0009f000-0x0009ffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x09b00000-0x0bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x09f00000-0x0bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x49b60000-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd69000-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd6f000-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x4bd74018-0x4bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x52bba000-0x53ffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x548cc000-0x57ffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x57f7f000-0x57ffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0x5b000000-0x5bffffff]
May 13 21:24:38 archlinux kernel: e820: reserve RAM buffer [mem 
0xf9e300000-0xf9fffffff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: vgaarb: setting as 
boot VGA device
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: vgaarb: bridge 
control possible
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: vgaarb: setting as 
boot VGA device (overriding previous)
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: vgaarb: bridge 
control possible
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: vgaarb: VGA device 
added: decodes=io+mem,owns=none,locks=none
May 13 21:24:38 archlinux kernel: vgaarb: loaded
May 13 21:24:38 archlinux kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
May 13 21:24:38 archlinux kernel: hpet0: 3 comparators, 32-bit 14.318180 
MHz counter
May 13 21:24:38 archlinux kernel: clocksource: Switched to clocksource 
tsc-early
May 13 21:24:38 archlinux kernel: VFS: Disk quotas dquot_6.6.0
May 13 21:24:38 archlinux kernel: VFS: Dquot-cache hash table entries: 
512 (order 0, 4096 bytes)
May 13 21:24:38 archlinux kernel: pnp: PnP ACPI init
May 13 21:24:38 archlinux kernel: system 00:00: [mem 
0xfec00000-0xfec01fff] could not be reserved
May 13 21:24:38 archlinux kernel: system 00:00: [mem 
0xfee00000-0xfee00fff] has been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0400-0x04cf] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x04d0-0x04d1] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x04d6] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0c00-0x0c01] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x0c14] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0c50-0x0c52] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x0c6c] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io  0x0c6f] has been 
reserved
May 13 21:24:38 archlinux kernel: system 00:02: [io 0x0cd0-0x0cdb] has 
been reserved
May 13 21:24:38 archlinux kernel: system 00:03: [mem 
0x000e0000-0x000fffff] could not be reserved
May 13 21:24:38 archlinux kernel: system 00:03: [mem 
0xfe000000-0xffffffff] could not be reserved
May 13 21:24:38 archlinux kernel: pnp: PnP ACPI: found 4 devices
May 13 21:24:38 archlinux kernel: clocksource: acpi_pm: mask: 0xffffff 
max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 13 21:24:38 archlinux kernel: NET: Registered PF_INET protocol family
May 13 21:24:38 archlinux kernel: IP idents hash table entries: 262144 
(order: 9, 2097152 bytes, linear)
May 13 21:24:38 archlinux kernel: tcp_listen_portaddr_hash hash table 
entries: 32768 (order: 7, 524288 bytes, linear)
May 13 21:24:38 archlinux kernel: Table-perturb hash table entries: 
65536 (order: 6, 262144 bytes, linear)
May 13 21:24:38 archlinux kernel: TCP established hash table entries: 
524288 (order: 10, 4194304 bytes, linear)
May 13 21:24:38 archlinux kernel: TCP bind hash table entries: 65536 
(order: 9, 2097152 bytes, linear)
May 13 21:24:38 archlinux kernel: TCP: Hash tables configured 
(established 524288 bind 65536)
May 13 21:24:38 archlinux kernel: MPTCP token hash table entries: 65536 
(order: 8, 1572864 bytes, linear)
May 13 21:24:38 archlinux kernel: UDP hash table entries: 32768 (order: 
8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: UDP-Lite hash table entries: 32768 
(order: 8, 1048576 bytes, linear)
May 13 21:24:38 archlinux kernel: NET: Registered PF_UNIX/PF_LOCAL 
protocol family
May 13 21:24:38 archlinux kernel: NET: Registered PF_XDP protocol family
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0xfffe0000-0xffffffff pref]: can't claim; no compatible bridge window
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: ROM [mem 
0x90d20000-0x90d3ffff pref]: assigned
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: PCI bridge to [bus 
02-03]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: PCI bridge to [bus 
01-03]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [io  
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x90c00000-0x90efffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1:   bridge window [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: PCI bridge to [bus 04]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x90b00000-0x90bfffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2:   bridge window [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: PCI bridge to [bus 05]
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4:   bridge window [mem 
0x90a00000-0x90afffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: PCI bridge to [bus 
06-64]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [io  
0x6000-0x9fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x78000000-0x8fffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1:   bridge window [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: PCI bridge to [bus 
65-c3]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [io  
0x2000-0x5fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x60000000-0x77ffffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1:   bridge window [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: PCI bridge to [bus c4]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [io  
0x1000-0x1fff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x90000000-0x905fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1:   bridge window [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: PCI bridge to [bus c5]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x90900000-0x909fffff]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2:   bridge window [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: PCI bridge to [bus c6]
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3:   bridge window [mem 
0x90600000-0x908fffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 4 [io 
0x0000-0x0cf7 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 5 [io 
0x0d00-0xffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 6 [mem 
0x000a0000-0x000bffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 7 [mem 
0x000c0000-0x000cffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 8 [mem 
0x000d0000-0x000effff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 9 [mem 
0x60000000-0x90ffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 10 [mem 
0xf0000000-0xfec00000 window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 11 [mem 
0xfed45000-0xfed814ff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 12 [mem 
0xfed81900-0xfed81fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 13 [mem 
0xfedc0000-0xfedc0fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 14 [mem 
0xfedc6000-0xfedc6fff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:00: resource 15 [mem 
0x10c0200000-0x891fffffff window]
May 13 21:24:38 archlinux kernel: pci_bus 0000:01: resource 0 [io 
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:01: resource 1 [mem 
0x90c00000-0x90efffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:01: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:02: resource 0 [io 
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:02: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:02: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:03: resource 0 [io 
0xa000-0xafff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:03: resource 1 [mem 
0x90c00000-0x90dfffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:03: resource 2 [mem 
0x8400000000-0x860fffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:04: resource 1 [mem 
0x90b00000-0x90bfffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:04: resource 2 [mem 
0x8620900000-0x86209fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:05: resource 1 [mem 
0x90a00000-0x90afffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:06: resource 0 [io 
0x6000-0x9fff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:06: resource 1 [mem 
0x78000000-0x8fffffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:06: resource 2 [mem 
0x7400000000-0x83ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:65: resource 0 [io 
0x2000-0x5fff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:65: resource 1 [mem 
0x60000000-0x77ffffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:65: resource 2 [mem 
0x6400000000-0x73ffffffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c4: resource 0 [io 
0x1000-0x1fff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c4: resource 1 [mem 
0x90000000-0x905fffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c4: resource 2 [mem 
0x8610000000-0x86207fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c5: resource 1 [mem 
0x90900000-0x909fffff]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c5: resource 2 [mem 
0x8620800000-0x86208fffff 64bit pref]
May 13 21:24:38 archlinux kernel: pci_bus 0000:c6: resource 1 [mem 
0x90600000-0x908fffff]
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: D0 power state 
depends on 0000:03:00.0
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: D0 power state 
depends on 0000:c4:00.0
May 13 21:24:38 archlinux kernel: PCI: CLS 64 bytes, default 64
May 13 21:24:38 archlinux kernel: pci 0000:00:00.2: AMD-Vi: IOMMU 
performance counters supported
May 13 21:24:38 archlinux kernel: pci 0000:00:01.0: Adding to iommu group 0
May 13 21:24:38 archlinux kernel: Trying to unpack rootfs image as 
initramfs...
May 13 21:24:38 archlinux kernel: pci 0000:00:01.1: Adding to iommu group 1
May 13 21:24:38 archlinux kernel: pci 0000:00:02.0: Adding to iommu group 2
May 13 21:24:38 archlinux kernel: pci 0000:00:02.2: Adding to iommu group 3
May 13 21:24:38 archlinux kernel: pci 0000:00:02.4: Adding to iommu group 4
May 13 21:24:38 archlinux kernel: pci 0000:00:03.0: Adding to iommu group 5
May 13 21:24:38 archlinux kernel: pci 0000:00:03.1: Adding to iommu group 5
May 13 21:24:38 archlinux kernel: pci 0000:00:04.0: Adding to iommu group 6
May 13 21:24:38 archlinux kernel: pci 0000:00:04.1: Adding to iommu group 6
May 13 21:24:38 archlinux kernel: pci 0000:00:08.0: Adding to iommu group 7
May 13 21:24:38 archlinux kernel: pci 0000:00:08.1: Adding to iommu group 8
May 13 21:24:38 archlinux kernel: pci 0000:00:08.2: Adding to iommu group 9
May 13 21:24:38 archlinux kernel: pci 0000:00:08.3: Adding to iommu group 10
May 13 21:24:38 archlinux kernel: pci 0000:00:14.0: Adding to iommu group 11
May 13 21:24:38 archlinux kernel: pci 0000:00:14.3: Adding to iommu group 11
May 13 21:24:38 archlinux kernel: pci 0000:00:18.0: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.1: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.2: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.3: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.4: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.5: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.6: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:00:18.7: Adding to iommu group 12
May 13 21:24:38 archlinux kernel: pci 0000:01:00.0: Adding to iommu group 13
May 13 21:24:38 archlinux kernel: pci 0000:02:00.0: Adding to iommu group 14
May 13 21:24:38 archlinux kernel: pci 0000:03:00.0: Adding to iommu group 15
May 13 21:24:38 archlinux kernel: pci 0000:03:00.1: Adding to iommu group 16
May 13 21:24:38 archlinux kernel: pci 0000:04:00.0: Adding to iommu group 17
May 13 21:24:38 archlinux kernel: pci 0000:05:00.0: Adding to iommu group 18
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.0: Adding to iommu group 19
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.1: Adding to iommu group 20
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.2: Adding to iommu group 21
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.3: Adding to iommu group 22
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.4: Adding to iommu group 23
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.5: Adding to iommu group 24
May 13 21:24:38 archlinux kernel: pci 0000:c4:00.6: Adding to iommu group 25
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.0: Adding to iommu group 26
May 13 21:24:38 archlinux kernel: pci 0000:c5:00.1: Adding to iommu group 27
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.0: Adding to iommu group 28
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.3: Adding to iommu group 29
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.4: Adding to iommu group 30
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.5: Adding to iommu group 31
May 13 21:24:38 archlinux kernel: pci 0000:c6:00.6: Adding to iommu group 32
May 13 21:24:38 archlinux kernel: AMD-Vi: Extended features 
(0x246577efa2054ada, 0x0): PPR NX GT IA GA PC
May 13 21:24:38 archlinux kernel: AMD-Vi: Interrupt remapping enabled
May 13 21:24:38 archlinux kernel: PCI-DMA: Using software bounce 
buffering for IO (SWIOTLB)
May 13 21:24:38 archlinux kernel: software IO TLB: mapped [mem 
0x000000003fd94000-0x0000000043d94000] (64MB)
May 13 21:24:38 archlinux kernel: LVT offset 0 assigned for vector 0x400
May 13 21:24:38 archlinux kernel: perf: AMD IBS detected (0x00000bff)
May 13 21:24:38 archlinux kernel: perf/amd_iommu: Detected AMD IOMMU #0 
(2 banks, 4 counters/bank).
May 13 21:24:38 archlinux kernel: Initialise system trusted keyrings
May 13 21:24:38 archlinux kernel: Key type blacklist registered
May 13 21:24:38 archlinux kernel: workingset: timestamp_bits=41 
max_order=24 bucket_order=0
May 13 21:24:38 archlinux kernel: zbud: loaded
May 13 21:24:38 archlinux kernel: integrity: Platform Keyring initialized
May 13 21:24:38 archlinux kernel: integrity: Machine keyring initialized
May 13 21:24:38 archlinux kernel: Key type asymmetric registered
May 13 21:24:38 archlinux kernel: Asymmetric key parser 'x509' registered
May 13 21:24:38 archlinux kernel: Block layer SCSI generic (bsg) driver 
version 0.4 loaded (major 242)
May 13 21:24:38 archlinux kernel: io scheduler mq-deadline registered
May 13 21:24:38 archlinux kernel: io scheduler kyber registered
May 13 21:24:38 archlinux kernel: io scheduler bfq registered
May 13 21:24:38 archlinux kernel: pcieport 0000:00:01.1: PME: Signaling 
with IRQ 38
May 13 21:24:38 archlinux kernel: pcieport 0000:00:01.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:24:38 archlinux kernel: pcieport 0000:00:02.2: PME: Signaling 
with IRQ 39
May 13 21:24:38 archlinux kernel: pcieport 0000:00:02.4: PME: Signaling 
with IRQ 40
May 13 21:24:38 archlinux kernel: pcieport 0000:00:03.1: PME: Signaling 
with IRQ 41
May 13 21:24:38 archlinux kernel: pcieport 0000:00:03.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:24:38 archlinux kernel: pcieport 0000:00:04.1: PME: Signaling 
with IRQ 42
May 13 21:24:38 archlinux kernel: pcieport 0000:00:04.1: pciehp: Slot #0 
AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- 
NoCompl+ IbPresDis- LLActRep+
May 13 21:24:38 archlinux kernel: pcieport 0000:00:08.1: PME: Signaling 
with IRQ 43
May 13 21:24:38 archlinux kernel: pcieport 0000:00:08.2: PME: Signaling 
with IRQ 44
May 13 21:24:38 archlinux kernel: pcieport 0000:00:08.3: PME: Signaling 
with IRQ 45
May 13 21:24:38 archlinux kernel: shpchp: Standard Hot Plug PCI 
Controller Driver version: 0.4
May 13 21:24:38 archlinux kernel: ACPI: AC: AC Adapter [ACAD] (on-line)
May 13 21:24:38 archlinux kernel: input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:4f/PNP0C09:00/PNP0C0D:00/input/input0
May 13 21:24:38 archlinux kernel: ACPI: button: Lid Switch [LID0]
May 13 21:24:38 archlinux kernel: input: Power Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
May 13 21:24:38 archlinux kernel: ACPI: button: Power Button [PWRB]
May 13 21:24:38 archlinux kernel: Estimated ratio of average max 
frequency by base frequency (times 1024): 1388
May 13 21:24:38 archlinux kernel: Monitor-Mwait will be used to enter 
C-1 state
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C000: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C001: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C002: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C003: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C004: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C005: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C006: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C007: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C008: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C009: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00A: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00B: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00C: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00D: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00E: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: \_SB_.PLTF.C00F: Found 3 idle states
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:00: registered as 
thermal_zone0
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ00] (46 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:01: registered as 
thermal_zone1
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ01] (49 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:02: registered as 
thermal_zone2
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ02] (50 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:03: registered as 
thermal_zone3
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ03] (81 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:04: registered as 
thermal_zone4
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ04] (39 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:05: registered as 
thermal_zone5
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ05] (40 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:06: registered as 
thermal_zone6
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ06] (38 C)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: Invalid 
critical threshold (-274000)
May 13 21:24:38 archlinux kernel: ACPI: thermal: [Firmware Bug]: No 
valid trip points!
May 13 21:24:38 archlinux kernel: thermal LNXTHERM:07: registered as 
thermal_zone7
May 13 21:24:38 archlinux kernel: ACPI: thermal: Thermal Zone [TZ07] (0 C)
May 13 21:24:38 archlinux kernel: Serial: 8250/16550 driver, 32 ports, 
IRQ sharing enabled
May 13 21:24:38 archlinux kernel: ACPI: battery: Slot [BAT1] (battery 
present)
May 13 21:24:38 archlinux kernel: Non-volatile memory driver v1.3
May 13 21:24:38 archlinux kernel: Linux agpgart interface v0.103
May 13 21:24:38 archlinux kernel: Freeing initrd memory: 44416K
May 13 21:24:38 archlinux kernel: ACPI: bus type drm_connector registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [twl] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [twl6040] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [adp5520] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [crystal_cove_i2c] 
registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [CHT Whiskey Cove 
PMIC] registered
May 13 21:24:38 archlinux kernel: usbcore: registered new interface 
driver usbserial_generic
May 13 21:24:38 archlinux kernel: usbserial: USB Serial support 
registered for generic
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: RTC can wake from S4
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: registered as rtc0
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: setting system clock 
to 2024-05-14T02:24:37 UTC (1715653477)
May 13 21:24:38 archlinux kernel: rtc_cmos 00:01: alarms up to one 
month, 114 bytes nvram
May 13 21:24:38 archlinux kernel: ledtrig-cpu: registered to indicate 
activity on CPUs
May 13 21:24:38 archlinux kernel: [drm] Initialized simpledrm 1.0.0 
20200625 for simple-framebuffer.0 on minor 0
May 13 21:24:38 archlinux kernel: fbcon: Deferring console take-over
May 13 21:24:38 archlinux kernel: simple-framebuffer 
simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
May 13 21:24:38 archlinux kernel: hid: raw HID events driver (C) Jiri Kosina
May 13 21:24:38 archlinux kernel: i2c-core: driver [i2c_hid_acpi] registered
May 13 21:24:38 archlinux kernel: i2c-core: driver [i2c_hid_of] registered
May 13 21:24:38 archlinux kernel: drop_monitor: Initializing network 
drop monitor service
May 13 21:24:38 archlinux kernel: Initializing XFRM netlink socket
May 13 21:24:38 archlinux kernel: NET: Registered PF_INET6 protocol family
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-FRMW0003:00: probe
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: probe
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x510
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: Segment Routing with IPv6
May 13 21:24:38 archlinux kernel: RPL Segment Routing with IPv6
May 13 21:24:38 archlinux kernel: In-situ OAM (IOAM) with IPv6
May 13 21:24:38 archlinux kernel: NET: Registered PF_PACKET protocol family
May 13 21:24:38 archlinux kernel: microcode: Current revision: 0x0a704104
May 13 21:24:38 archlinux kernel: resctrl: L3 allocation detected
May 13 21:24:38 archlinux kernel: resctrl: MB allocation detected
May 13 21:24:38 archlinux kernel: resctrl: SMBA allocation detected
May 13 21:24:38 archlinux kernel: resctrl: L3 monitoring detected
May 13 21:24:38 archlinux kernel: IPI shorthand broadcast: enabled
May 13 21:24:38 archlinux kernel: sched_clock: Marking stable 
(654333794, 409468)->(658838770, -4095508)
May 13 21:24:38 archlinux kernel: Timer migration: 2 hierarchy levels; 8 
children per group; 2 crossnode level
May 13 21:24:38 archlinux kernel: registered taskstats version 1
May 13 21:24:38 archlinux kernel: Loading compiled-in X.509 certificates
May 13 21:24:38 archlinux kernel: Loaded X.509 cert 'Build time 
autogenerated kernel key: 161dd99ad2105d15c2e668632f302bd716d59ec5'
May 13 21:24:38 archlinux kernel: zswap: loaded using pool zstd/zsmalloc
May 13 21:24:38 archlinux kernel: Key type .fscrypt registered
May 13 21:24:38 archlinux kernel: Key type fscrypt-provisioning registered
May 13 21:24:38 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:24:38 archlinux kernel: integrity: Loaded X.509 cert 'Database 
Key: 00ce72b3aa39818d7d19c223fba64f8770'
May 13 21:24:38 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:24:38 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Corporation UEFI CA 2011: 
13adbf4309bd82709c8cd54f316ed522988a1bd4'
May 13 21:24:38 archlinux kernel: integrity: Loading X.509 certificate: 
UEFI:db
May 13 21:24:38 archlinux kernel: integrity: Loaded X.509 cert 
'Microsoft Windows Production PCA 2011: 
a92902398e16c49778cd90f99e4f9ae17c55af53'
May 13 21:24:38 archlinux kernel: PM:   Magic number: 8:628:409
May 13 21:24:38 archlinux kernel: pci 0000:00:18.1: hash matches
May 13 21:24:38 archlinux kernel: RAS: Correctable Errors collector 
initialized.
May 13 21:24:38 archlinux kernel: clk: Disabling unused clocks
May 13 21:24:38 archlinux kernel: PM: genpd: Disabling unused power domains
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: failed 
to reset device: -121
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_hid_acpi i2c-PIXA3854:00: failed 
to change power setting.
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x750
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_handle_tx_abort: slave address not acknowledged (7bit mode)
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:00: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: hid-generic 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:24:38 archlinux kernel: tsc: Refined TSC clocksource 
calibration: 3992.488 MHz
May 13 21:24:38 archlinux kernel: clocksource: tsc: mask: 
0xffffffffffffffff max_cycles: 0x731949e9c77, max_idle_ns: 881591066823 ns
May 13 21:24:38 archlinux kernel: clocksource: Switched to clocksource tsc
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:38 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:38 archlinux kernel: input: PIXA3854:00 093A:0274 Mouse as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input2
May 13 21:24:38 archlinux kernel: input: PIXA3854:00 093A:0274 Touchpad 
as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input3
May 13 21:24:38 archlinux kernel: hid-generic 0018:093A:0274.0002: 
input,hidraw1: I2C HID v1.00 Mouse [PIXA3854:00 093A:0274] on 
i2c-PIXA3854:00
May 13 21:24:38 archlinux kernel: Freeing unused decrypted memory: 2028K
May 13 21:24:38 archlinux kernel: Freeing unused kernel image (initmem) 
memory: 3412K
May 13 21:24:38 archlinux kernel: Write protecting the kernel read-only 
data: 32768k
May 13 21:24:38 archlinux kernel: Freeing unused kernel image 
(rodata/data gap) memory: 836K
May 13 21:24:38 archlinux kernel: x86/mm: Checked W+X mappings: passed, 
no W+X pages found.
May 13 21:24:38 archlinux kernel: rodata_test: all tests were successful
May 13 21:24:38 archlinux kernel: Run /init as init process
May 13 21:24:38 archlinux kernel:   with arguments:
May 13 21:24:38 archlinux kernel:     /init
May 13 21:24:38 archlinux kernel:     splash
May 13 21:24:38 archlinux kernel:   with environment:
May 13 21:24:38 archlinux kernel:     HOME=/
May 13 21:24:38 archlinux kernel:     TERM=linux
May 13 21:24:38 archlinux systemd[1]: systemd 255.6-1-arch running in 
system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT 
+GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC 
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT 
default-hierarchy=unified)
May 13 21:24:38 archlinux systemd[1]: Detected architecture x86-64.
May 13 21:24:38 archlinux systemd[1]: Running in initrd.
May 13 21:24:38 archlinux systemd[1]: Initializing machine ID from 
random generator.
May 13 21:24:38 archlinux systemd[1]: Queued start job for default 
target Initrd Default Target.
May 13 21:24:38 archlinux systemd[1]: Created slice Slice 
/system/systemd-cryptsetup.
May 13 21:24:38 archlinux systemd[1]: Expecting device 
/dev/disk/by-uuid/496f2909-055b-49f7-9a43-b48647d757a9...
May 13 21:24:38 archlinux systemd[1]: Expecting device /dev/mapper/root...
May 13 21:24:38 archlinux systemd[1]: Reached target Slice Units.
May 13 21:24:38 archlinux systemd[1]: Reached target Swaps.
May 13 21:24:38 archlinux systemd[1]: Reached target Timer Units.
May 13 21:24:38 archlinux systemd[1]: Listening on Journal Socket 
(/dev/log).
May 13 21:24:38 archlinux systemd[1]: Listening on Journal Socket.
May 13 21:24:38 archlinux systemd[1]: Listening on udev Control Socket.
May 13 21:24:38 archlinux systemd[1]: Listening on udev Kernel Socket.
May 13 21:24:38 archlinux systemd[1]: Reached target Socket Units.
May 13 21:24:38 archlinux systemd[1]: Starting Create List of Static 
Device Nodes...
May 13 21:24:38 archlinux systemd[1]: Starting Journal Service...
May 13 21:24:38 archlinux systemd[1]: Starting Load Kernel Modules...
May 13 21:24:38 archlinux systemd[1]: Starting TPM2 PCR Barrier (initrd)...
May 13 21:24:38 archlinux systemd[1]: Starting Create Static Device 
Nodes in /dev...
May 13 21:24:38 archlinux systemd[1]: Starting Coldplug All udev Devices...
May 13 21:24:38 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:24:38 archlinux systemd[1]: Finished Create List of Static 
Device Nodes.
May 13 21:24:38 archlinux systemd[1]: Finished Create Static Device 
Nodes in /dev.
May 13 21:24:38 archlinux systemd[1]: Reached target Preparation for 
Local File Systems.
May 13 21:24:38 archlinux systemd[1]: Reached target Local File Systems.
May 13 21:24:38 archlinux systemd[1]: Starting Rule-based Manager for 
Device Events and Files...
May 13 21:24:38 archlinux systemd-journald[203]: Collecting audit 
messages is disabled.
May 13 21:24:38 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:24:38 archlinux systemd[1]: Started Rule-based Manager for 
Device Events and Files.
May 13 21:24:38 archlinux kernel: ACPI: video: Video Device [VGA] 
(multi-head: yes  rom: no  post: no)
May 13 21:24:38 archlinux kernel: input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1a/LNXVIDEO:00/input/input4
May 13 21:24:38 archlinux systemd[1]: Finished TPM2 PCR Barrier (initrd).
May 13 21:24:38 archlinux systemd-vconsole-setup[209]: /usr/bin/setfont 
failed with a "system error" (EX_OSERR), ignoring.
May 13 21:24:38 archlinux systemd-vconsole-setup[209]: Setting source 
virtual console failed, ignoring remaining ones.
May 13 21:24:38 archlinux systemd-pcrextend[205]: Extended PCR index 11 
with 'enter-initrd' (banks sha256).
May 13 21:24:38 archlinux systemd-vconsole-setup[216]: setfont: ERROR 
kdfontop.c:183 put_font_kdfontop: Unable to load such font with such 
kernel version
May 13 21:24:38 archlinux systemd[1]: Started Journal Service.
May 13 21:24:38 archlinux systemd[1]: Finished Coldplug All udev Devices.
May 13 21:24:38 archlinux kernel: hid-sensor-hub 0018:32AC:001B.0001: 
hidraw0: I2C HID v1.00 Device [FRMW0003:00 32AC:001B] on i2c-FRMW0003:00
May 13 21:24:39 archlinux kernel: cryptd: max_cpu_qlen set to 1000
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 1
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: hcc params 
0x0128ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: new USB bus 
registered, assigned bus number 2
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb1: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb1: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb1: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb1: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb1: SerialNumber: 0000:c4:00.3
May 13 21:24:39 archlinux kernel: hub 1-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 1-0:1.0: 5 ports detected
May 13 21:24:39 archlinux kernel: ccp 0000:c4:00.2: tee enabled
May 13 21:24:39 archlinux kernel: ccp 0000:c4:00.2: psp enabled
May 13 21:24:39 archlinux kernel: nvme 0000:05:00.0: platform quirk: 
setting simple suspend
May 13 21:24:39 archlinux kernel: nvme nvme0: pci function 0000:05:00.0
May 13 21:24:39 archlinux kernel: usb usb2: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb2: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb2: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb2: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb2: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb2: SerialNumber: 0000:c4:00.3
May 13 21:24:39 archlinux kernel: hub 2-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 2-0:1.0: 2 ports detected
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 3
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: new USB bus 
registered, assigned bus number 4
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c4:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb3: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb3: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb3: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb3: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb3: SerialNumber: 0000:c4:00.4
May 13 21:24:39 archlinux kernel: hub 3-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 3-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: usb usb4: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb4: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb4: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb4: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb4: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb4: SerialNumber: 0000:c4:00.4
May 13 21:24:39 archlinux kernel: hub 4-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 4-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 5
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: new USB bus 
registered, assigned bus number 6
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.3: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb5: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb5: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb5: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb5: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb5: SerialNumber: 0000:c6:00.3
May 13 21:24:39 archlinux kernel: hub 5-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 5-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: nvme nvme0: D3 entry latency set to 10 
seconds
May 13 21:24:39 archlinux kernel: usb usb6: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb6: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb6: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb6: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb6: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb6: SerialNumber: 0000:c6:00.3
May 13 21:24:39 archlinux kernel: hub 6-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 6-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 7
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: hcc params 
0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
May 13 21:24:39 archlinux kernel: nvme nvme0: 16/0/0 default/read/poll 
queues
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: xHCI Host 
Controller
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: new USB bus 
registered, assigned bus number 8
May 13 21:24:39 archlinux kernel: xhci_hcd 0000:c6:00.4: Host supports 
USB 3.1 Enhanced SuperSpeed
May 13 21:24:39 archlinux kernel: usb usb7: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb7: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb7: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb7: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb7: SerialNumber: 0000:c6:00.4
May 13 21:24:39 archlinux kernel: hub 7-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 7-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel: usb usb8: We don't know the algorithms 
for LPM for this host, disabling LPM.
May 13 21:24:39 archlinux kernel: usb usb8: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
May 13 21:24:39 archlinux kernel: usb usb8: New USB device strings: 
Mfr=3, Product=2, SerialNumber=1
May 13 21:24:39 archlinux kernel: usb usb8: Product: xHCI Host Controller
May 13 21:24:39 archlinux kernel: usb usb8: Manufacturer: Linux 
6.9.0-1-git-01560-ga7c840ba5fa7 xhci-hcd
May 13 21:24:39 archlinux kernel: usb usb8: SerialNumber: 0000:c6:00.4
May 13 21:24:39 archlinux kernel: hub 8-0:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 8-0:1.0: 1 port detected
May 13 21:24:39 archlinux kernel:  nvme0n1: p1 p2
May 13 21:24:39 archlinux systemd[1]: Starting Show Plymouth Boot Screen...
May 13 21:24:39 archlinux systemd[1]: Received SIGRTMIN+20 from PID 276 
(plymouthd).
May 13 21:24:39 archlinux systemd[1]: Found device Samsung SSD 990 PRO 
4TB 2.
May 13 21:24:39 archlinux systemd[1]: Starting Cryptography Setup for 
root...
May 13 21:24:39 archlinux systemd[1]: systemd-vconsole-setup.service: 
Deactivated successfully.
May 13 21:24:39 archlinux systemd[1]: Stopped Virtual Console Setup.
May 13 21:24:39 archlinux systemd[1]: Stopping Virtual Console Setup...
May 13 21:24:39 archlinux systemd[1]: Starting Virtual Console Setup...
May 13 21:24:39 archlinux systemd[1]: Received SIGRTMIN+20 from PID 276 
(plymouthd).
May 13 21:24:39 archlinux systemd[1]: Started Show Plymouth Boot Screen.
May 13 21:24:39 archlinux systemd[1]: Dispatch Password Requests to 
Console Directory Watch was skipped because of an unmet condition check 
(ConditionPathExists=!/run/plymouth/pid).
May 13 21:24:39 archlinux systemd[1]: Started Forward Password Requests 
to Plymouth Directory Watch.
May 13 21:24:39 archlinux systemd[1]: Reached target Path Units.
May 13 21:24:39 archlinux systemd[1]: Starting Check battery level 
during early boot...
May 13 21:24:39 archlinux systemd-vconsole-setup[280]: KD_FONT_OP_GET 
failed while trying to get the font metadata: Invalid argument
May 13 21:24:39 archlinux systemd-vconsole-setup[280]: Fonts will not be 
copied to remaining consoles
May 13 21:24:39 archlinux systemd[1]: Finished Virtual Console Setup.
May 13 21:24:39 archlinux systemd[1]: Finished Check battery level 
during early boot.
May 13 21:24:39 archlinux systemd[1]: Started Displays emergency message 
in full screen..
May 13 21:24:39 archlinux kernel: AVX2 version of gcm_enc/dec engaged.
May 13 21:24:39 archlinux kernel: AES CTR mode by8 optimization enabled
May 13 21:24:39 archlinux kernel: device-mapper: uevent: version 1.0.3
May 13 21:24:39 archlinux kernel: device-mapper: ioctl: 4.48.0-ioctl 
(2023-03-01) initialised: dm-devel@lists.linux.dev
May 13 21:24:39 archlinux kernel: usb 1-2: new high-speed USB device 
number 2 using xhci_hcd
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 2
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x500
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x504
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x514
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x714
May 13 21:24:39 archlinux kernel: input: PIXA3854:00 093A:0274 Mouse as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input5
May 13 21:24:39 archlinux kernel: input: PIXA3854:00 093A:0274 Touchpad 
as 
/devices/platform/AMDI0010:03/i2c-1/i2c-PIXA3854:00/0018:093A:0274.0002/input/input6
May 13 21:24:39 archlinux kernel: hid-multitouch 0018:093A:0274.0002: 
input,hidraw1: I2C HID v1.00 Mouse [PIXA3854:00 093A:0274] on 
i2c-PIXA3854:00
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
i2c_dw_xfer: msgs: 1
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x10
May 13 21:24:39 archlinux kernel: i2c_designware AMDI0010:03: 
enabled=0x1 stat=0x710
May 13 21:24:39 archlinux kernel: usb 1-2: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=34.04
May 13 21:24:39 archlinux kernel: usb 1-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:24:39 archlinux kernel: usb 1-2: Product: USB2.1 Hub
May 13 21:24:39 archlinux kernel: usb 1-2: Manufacturer: GenesysLogic
May 13 21:24:39 archlinux kernel: hub 1-2:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 1-2:1.0: 4 ports detected
May 13 21:24:39 archlinux kernel: usb 2-2: new SuperSpeed Plus Gen 2x1 
USB device number 2 using xhci_hcd
May 13 21:24:39 archlinux kernel: usb 2-2: New USB device found, 
idVendor=05e3, idProduct=0625, bcdDevice=34.04
May 13 21:24:39 archlinux kernel: usb 2-2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:24:39 archlinux kernel: usb 2-2: Product: USB3.2 Hub
May 13 21:24:39 archlinux kernel: usb 2-2: Manufacturer: GenesysLogic
May 13 21:24:39 archlinux kernel: hub 2-2:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 2-2:1.0: 3 ports detected
May 13 21:24:39 archlinux kernel: usb 1-3: new high-speed USB device 
number 3 using xhci_hcd
May 13 21:24:39 archlinux kernel: usb 1-3: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:24:39 archlinux kernel: usb 1-3: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:24:39 archlinux kernel: usb 1-3: Product: USB2.0 Hub
May 13 21:24:39 archlinux kernel: hub 1-3:1.0: USB hub found
May 13 21:24:39 archlinux kernel: hub 1-3:1.0: 3 ports detected
May 13 21:24:39 archlinux kernel: usb 1-2.1: new low-speed USB device 
number 4 using xhci_hcd
May 13 21:24:40 archlinux kernel: usb 1-2.1: New USB device found, 
idVendor=046d, idProduct=c019, bcdDevice=43.01
May 13 21:24:40 archlinux kernel: usb 1-2.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=0
May 13 21:24:40 archlinux kernel: usb 1-2.1: Product: USB Optical Mouse
May 13 21:24:40 archlinux kernel: usb 1-2.1: Manufacturer: Logitech
May 13 21:24:40 archlinux kernel: [drm] amdgpu kernel modesetting enabled.
May 13 21:24:40 archlinux kernel: amdgpu: vga_switcheroo: detected 
switching method \_SB_.PCI0.GP17.VGA_.ATPX handle
May 13 21:24:40 archlinux kernel: amdgpu: ATPX version 1, functions 
0x00000801
May 13 21:24:40 archlinux kernel: amdgpu: ATPX Hybrid Graphics
May 13 21:24:40 archlinux kernel: amdgpu: Virtual CRAT table created for CPU
May 13 21:24:40 archlinux kernel: amdgpu: Topology: Add CPU node
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: enabling device 
(0000 -> 0003)
May 13 21:24:40 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x7480 0xF111:0x0007 0xC1).
May 13 21:24:40 archlinux kernel: [drm] register mmio base: 0x90C00000
May 13 21:24:40 archlinux kernel: [drm] register mmio size: 1048576
May 13 21:24:40 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:24:40 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ACPI VFCT 
table present but broken (too short #2),skipping
May 13 21:24:40 archlinux kernel: [drm] BIOS signature incorrect ee a3
May 13 21:24:40 archlinux kernel: input: Logitech USB Optical Mouse as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-2/1-2.1/1-2.1:1.0/0003:046D:C019.0003/input/input7
May 13 21:24:40 archlinux kernel: hid-generic 0003:046D:C019.0003: 
input,hidraw2: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on 
usb-0000:c4:00.3-2.1/input0
May 13 21:24:40 archlinux kernel: usbcore: registered new interface 
driver usbhid
May 13 21:24:40 archlinux kernel: usbhid: USB HID core driver
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Fetched 
VBIOS from ROM BAR
May 13 21:24:40 archlinux kernel: amdgpu: ATOM BIOS: 113-BRT125778.001
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: CP RS64 
enable
May 13 21:24:40 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature not supported
May 13 21:24:40 archlinux kernel: [drm] GPU posting now...
May 13 21:24:40 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: VRAM: 
8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:24:40 archlinux kernel: [drm] Detected VRAM RAM=8176M, BAR=8192M
May 13 21:24:40 archlinux kernel: [drm] RAM width 128bits GDDR6
May 13 21:24:40 archlinux kernel: [drm] amdgpu: 8176M of VRAM memory ready
May 13 21:24:40 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:24:40 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:24:40 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000081FEB00000).
May 13 21:24:40 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x07002800
May 13 21:24:40 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:24:40 archlinux kernel: usb 1-4: new high-speed USB device 
number 5 using xhci_hcd
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: reserve 
0x1300000 from 0x81fc000000 for PSP TMR
May 13 21:24:40 archlinux kernel: Key type trusted registered
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: smu 
driver if version = 0x00000035, smu fw if version = 0x00000040, smu fw 
program = 0, smu fw version = 0x00525800 (82.88.0)
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU 
driver if version not matched
May 13 21:24:40 archlinux kernel: usb 1-4: New USB device found, 
idVendor=05e3, idProduct=0610, bcdDevice=60.60
May 13 21:24:40 archlinux kernel: usb 1-4: New USB device strings: 
Mfr=0, Product=1, SerialNumber=0
May 13 21:24:40 archlinux kernel: usb 1-4: Product: USB2.0 Hub
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:24:40 archlinux kernel: amdgpu 0000:03:00.0: [drm] Unsupported 
pwrseq engine id: 2!
May 13 21:24:40 archlinux kernel: ------------[ cut here ]------------
May 13 21:24:40 archlinux kernel: WARNING: CPU: 10 PID: 204 at 
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:24:40 archlinux kernel: Modules linked in: cbc 
encrypted_keys(+) trusted asn1_encoder tee usbhid crct10dif_pclmul 
crc32_pclmul crc32c_intel polyval_clmulni polyval_generic gf128mul 
ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 dm_mod 
aesni_intel crypto_simd nvme cryptd xhci_pci hid_sensor_hub ccp 
nvme_core xhci_pci_renesas amdgpu(+) hid_multitouch video wmi amdxcp 
i2c_algo_bit drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper 
drm_buddy drm_display_helper cec
May 13 21:24:40 archlinux kernel: CPU: 10 PID: 204 Comm: systemd-modules 
Not tainted 6.9.0-1-git-01560-ga7c840ba5fa7 #1 
96970f0beb2353c3fc8dc8c8e87ebf0f642b2644
May 13 21:24:40 archlinux kernel: Hardware name: Framework Laptop 16 
(AMD Ryzen 7040 Series)/FRANMZCP09, BIOS 03.03 03/27/2024
May 13 21:24:40 archlinux kernel: RIP: 
0010:dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
May 13 21:24:40 archlinux kernel: Code: b8 65 1f c1 e8 01 a6 15 fa e9 2d 
89 f5 ff 48 8b 40 10 48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c7 c6 08 66 
1f c1 e8 e0 a5 15 fa <0f> 0b ba 0f 00 00 00 e9 f5 8d f5 ff 48 8b 43 08 
48 8b 40 10 48 8b
May 13 21:24:40 archlinux kernel: RSP: 0018:ffffa8e44060b0e0 EFLAGS: 
00010246
May 13 21:24:40 archlinux kernel: RAX: 0000000000000000 RBX: 
ffff96dd0563fc40 RCX: 0000000000000027
May 13 21:24:40 archlinux kernel: RDX: 0000000000000000 RSI: 
0000000000000001 RDI: ffff96eb61f219c0
May 13 21:24:40 archlinux kernel: RBP: ffffa8e44060b118 R08: 
0000000000000000 R09: ffffa8e44060ae50
May 13 21:24:40 archlinux kernel: R10: ffffffffbc0b2388 R11: 
0000000000000003 R12: ffff96dd06d6a200
May 13 21:24:40 archlinux kernel: R13: ffffffffc1099940 R14: 
ffffa8e44060b4d0 R15: ffff96dd0e5d6800
May 13 21:24:40 archlinux kernel: FS:  00007f4196df2640(0000) 
GS:ffff96eb61f00000(0000) knlGS:0000000000000000
May 13 21:24:40 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
May 13 21:24:40 archlinux kernel: CR2: 000055c2d8f65658 CR3: 
0000000106d8a000 CR4: 0000000000f50ef0
May 13 21:24:40 archlinux kernel: PKRU: 55555554
May 13 21:24:40 archlinux kernel: Call Trace:
May 13 21:24:40 archlinux kernel:  <TASK>
May 13 21:24:40 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? __warn.cold+0x8e/0xe8
May 13 21:24:40 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? report_bug+0xff/0x140
May 13 21:24:40 archlinux kernel:  ? handle_bug+0x3c/0x80
May 13 21:24:40 archlinux kernel:  ? exc_invalid_op+0x17/0x70
May 13 21:24:40 archlinux kernel:  ? asm_exc_invalid_op+0x1a/0x20
May 13 21:24:40 archlinux kernel:  ? 
dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel: dcn32_panel_cntl_create+0x37/0x50 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  construct_phy+0x951/0xc10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? __alloc_pages+0x182/0x350
May 13 21:24:40 archlinux kernel:  link_create+0x1ba/0x200 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  create_links+0x134/0x420 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  dc_create+0x316/0x650 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel: amdgpu_dm_init.isra.0+0x32b/0x1d90 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? vprintk_emit+0x176/0x2a0
May 13 21:24:40 archlinux kernel:  dm_hw_init+0x12/0x30 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel: amdgpu_device_init.cold+0x1ad3/0x20fb 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel: amdgpu_driver_load_kms+0x19/0x110 
[amdgpu 5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  amdgpu_pci_probe+0x187/0x400 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  local_pci_probe+0x42/0x90
May 13 21:24:40 archlinux kernel:  pci_device_probe+0xbd/0x290
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? sysfs_do_create_link_sd+0x6e/0xe0
May 13 21:24:40 archlinux kernel:  really_probe+0xdb/0x340
May 13 21:24:40 archlinux kernel:  ? pm_runtime_barrier+0x54/0x90
May 13 21:24:40 archlinux kernel:  ? __pfx___driver_attach+0x10/0x10
May 13 21:24:40 archlinux kernel: __driver_probe_device+0x78/0x110
May 13 21:24:40 archlinux kernel:  driver_probe_device+0x1f/0xa0
May 13 21:24:40 archlinux kernel:  __driver_attach+0xba/0x1c0
May 13 21:24:40 archlinux kernel:  bus_for_each_dev+0x8c/0xe0
May 13 21:24:40 archlinux kernel:  bus_add_driver+0x116/0x1f0
May 13 21:24:40 archlinux kernel:  driver_register+0x72/0xd0
May 13 21:24:40 archlinux kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu 
5bb292ced608d8d5ae3253536295d887805c1b0a]
May 13 21:24:40 archlinux kernel:  do_one_initcall+0x58/0x310
May 13 21:24:40 archlinux kernel:  do_init_module+0x60/0x220
May 13 21:24:40 archlinux kernel:  init_module_from_file+0x89/0xe0
May 13 21:24:40 archlinux kernel: idempotent_init_module+0x121/0x2b0
May 13 21:24:40 archlinux kernel: __x64_sys_finit_module+0x5e/0xb0
May 13 21:24:40 archlinux kernel:  do_syscall_64+0x82/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_filp_open+0xc4/0x170
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_sys_openat2+0x9c/0xe0
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? syscall_exit_to_user_mode+0x75/0x210
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? do_syscall_64+0x8e/0x160
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
May 13 21:24:40 archlinux kernel: entry_SYSCALL_64_after_hwframe+0x76/0x7e
May 13 21:24:40 archlinux kernel: RIP: 0033:0x7f41978ade9d
May 13 21:24:40 archlinux kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 de 0c 00 
f7 d8 64 89 01 48
May 13 21:24:40 archlinux kernel: RSP: 002b:00007fffa7b916a8 EFLAGS: 
00000246 ORIG_RAX: 0000000000000139
May 13 21:24:40 archlinux kernel: RAX: ffffffffffffffda RBX: 
000055b8de6f7440 RCX: 00007f41978ade9d
May 13 21:24:40 archlinux kernel: RDX: 0000000000000004 RSI: 
00007f41979c7376 RDI: 0000000000000011
May 13 21:24:40 archlinux kernel: RBP: 00007f41979c7376 R08: 
00007f419797cb20 R09: 00007fffa7b916f0
May 13 21:24:40 archlinux kernel: R10: 000055b8de6fc610 R11: 
0000000000000246 R12: 0000000000020000
May 13 21:24:40 archlinux kernel: R13: 000055b8de6f78e0 R14: 
0000000000000000 R15: 000055b8de6fc5d0
May 13 21:24:40 archlinux kernel:  </TASK>
May 13 21:24:40 archlinux kernel: ---[ end trace 0000000000000000 ]---
May 13 21:24:40 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.2.1
May 13 21:24:40 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:24:40 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x07002800
May 13 21:24:40 archlinux kernel: hub 1-4:1.0: USB hub found
May 13 21:24:40 archlinux kernel: hub 1-4:1.0: 4 ports detected
May 13 21:24:40 archlinux kernel: usb 1-3.2: new full-speed USB device 
number 6 using xhci_hcd
May 13 21:24:40 archlinux kernel: Key type encrypted registered
May 13 21:24:40 archlinux systemd[1]: Found device /dev/mapper/root.
May 13 21:24:40 archlinux systemd[1]: Reached target Initrd Root Device.
May 13 21:24:40 archlinux systemd[1]: Starting File System Check on 
/dev/mapper/root...
May 13 21:24:40 archlinux systemd[1]: Finished Cryptography Setup for root.
May 13 21:24:40 archlinux systemd[1]: Reached target Local Encrypted 
Volumes.
May 13 21:24:40 archlinux kernel: usb 1-3.2: unable to get BOS 
descriptor set
May 13 21:24:40 archlinux systemd-fsck[332]: artemisfs: clean, 
1409033/244129792 files, 524296829/976487936 blocks
May 13 21:24:40 archlinux systemd[1]: Finished File System Check on 
/dev/mapper/root.
May 13 21:24:40 archlinux systemd[1]: Mounting /sysroot...
May 13 21:24:40 archlinux kernel: usb 1-3.2: New USB device found, 
idVendor=32ac, idProduct=0014, bcdDevice= 0.29
May 13 21:24:40 archlinux kernel: usb 1-3.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:24:40 archlinux kernel: usb 1-3.2: Product: Laptop 16 Numpad 
Module
May 13 21:24:40 archlinux kernel: usb 1-3.2: Manufacturer: Framework
May 13 21:24:40 archlinux kernel: usb 1-3.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:24:40 archlinux systemd[1]: Mounted /sysroot.
May 13 21:24:40 archlinux systemd[1]: Reached target Initrd Root File 
System.
May 13 21:24:40 archlinux kernel: EXT4-fs (dm-0): orphan cleanup on 
readonly fs
May 13 21:24:40 archlinux kernel: EXT4-fs (dm-0): mounted filesystem 
fc8e5470-776d-4f4b-bc64-89a425bea162 ro with ordered data mode. Quota 
mode: none.
May 13 21:24:40 archlinux kernel: usb 1-5: new high-speed USB device 
number 7 using xhci_hcd
May 13 21:24:40 archlinux systemd[1]: Starting Mountpoints Configured in 
the Real Root...
May 13 21:24:40 archlinux systemd[1]: initrd-parse-etc.service: 
Deactivated successfully.
May 13 21:24:40 archlinux systemd[1]: Finished Mountpoints Configured in 
the Real Root.
May 13 21:24:40 archlinux systemd[1]: Reached target Initrd File Systems.
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.0/0003:32AC:0014.0004/input/input8
May 13 21:24:40 archlinux kernel: usb 1-5: New USB device found, 
idVendor=0e8d, idProduct=e616, bcdDevice= 1.00
May 13 21:24:40 archlinux kernel: usb 1-5: New USB device strings: 
Mfr=5, Product=6, SerialNumber=7
May 13 21:24:40 archlinux kernel: usb 1-5: Product: Wireless_Device
May 13 21:24:40 archlinux kernel: usb 1-5: Manufacturer: MediaTek Inc.
May 13 21:24:40 archlinux kernel: usb 1-5: SerialNumber: 000000000
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0004: 
input,hidraw3: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input0
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0005: 
hiddev96,hidraw4: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input1
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input9
May 13 21:24:40 archlinux kernel: usb 1-4.1: new full-speed USB device 
number 8 using xhci_hcd
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input10
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input11
May 13 21:24:40 archlinux kernel: input: Framework Laptop 16 Numpad 
Module Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-3/1-3.2/1-3.2:1.2/0003:32AC:0014.0006/input/input12
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0006: 
input,hidraw5: USB HID v1.11 Keyboard [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input2
May 13 21:24:40 archlinux kernel: hid-generic 0003:32AC:0014.0007: 
hiddev97,hidraw6: USB HID v1.11 Device [Framework Laptop 16 Numpad 
Module] on usb-0000:c4:00.3-3.2/input3
May 13 21:24:40 archlinux kernel: i2c i2c-2: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:24:40 archlinux kernel: usb 1-4.1: New USB device found, 
idVendor=27c6, idProduct=609c, bcdDevice= 1.00
May 13 21:24:40 archlinux kernel: usb 1-4.1: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:24:40 archlinux kernel: usb 1-4.1: Product: Goodix Fingerprint 
USB Device
May 13 21:24:40 archlinux kernel: usb 1-4.1: Manufacturer: Goodix 
Technology Co., Ltd.
May 13 21:24:40 archlinux kernel: usb 1-4.1: SerialNumber: 
UIDCBAC4037_XXXX_MOC_B0
May 13 21:24:41 archlinux kernel: usb 1-4.2: new full-speed USB device 
number 9 using xhci_hcd
May 13 21:24:41 archlinux kernel: usb 1-4.2: unable to get BOS 
descriptor set
May 13 21:24:41 archlinux kernel: usb 1-4.2: New USB device found, 
idVendor=32ac, idProduct=0012, bcdDevice= 0.29
May 13 21:24:41 archlinux kernel: usb 1-4.2: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
May 13 21:24:41 archlinux kernel: usb 1-4.2: Product: Laptop 16 Keyboard 
Module - ANSI
May 13 21:24:41 archlinux kernel: usb 1-4.2: Manufacturer: Framework
May 13 21:24:41 archlinux kernel: usb 1-4.2: SerialNumber: 
FRAKDKEN0100000000
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.0/0003:32AC:0012.0008/input/input13
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.0008: 
input,hidraw7: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input0
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.0009: 
hiddev98,hidraw8: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input1
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI System Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input14
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Consumer Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input15
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Wireless Radio Control as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input16
May 13 21:24:41 archlinux kernel: input: Framework Laptop 16 Keyboard 
Module - ANSI Keyboard as 
/devices/pci0000:00/0000:00:08.1/0000:c4:00.3/usb1/1-4/1-4.2/1-4.2:1.2/0003:32AC:0012.000A/input/input17
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.000A: 
input,hidraw9: USB HID v1.11 Keyboard [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input2
May 13 21:24:41 archlinux kernel: hid-generic 0003:32AC:0012.000B: 
hiddev99,hidraw10: USB HID v1.11 Device [Framework Laptop 16 Keyboard 
Module - ANSI] on usb-0000:c4:00.3-4.2/input3
May 13 21:24:42 archlinux kernel: i2c i2c-3: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:24:42 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:24:42 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:24:42 archlinux kernel: amdgpu 0000:03:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:24:43 archlinux kernel: amdgpu: HMM registered 8176MB device 
memory
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:24:43 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:24:43 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x7480:0x1002]
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: added device 1002:7480
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: SE 2, SH 
per SE 2, CU per SH 8, active_cu_number 32
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
sdma1 uses VM inv eng 13 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32768.1.1 was added
May 13 21:24:43 archlinux kernel: [drm] ring compute_32768.2.2 was added
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32768.3.3 was added
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32768.1.1 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring compute_32768.2.2 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32768.3.3 ib test pass
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: amdgpu: Using 
BOCO for runtime pm
May 13 21:24:43 archlinux kernel: i2c i2c-4: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:24:43 archlinux kernel: i2c i2c-5: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:24:43 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:03:00.0 on minor 1
May 13 21:24:43 archlinux kernel: amdgpu 0000:03:00.0: [drm] Cannot find 
any crtc or sizes
May 13 21:24:43 archlinux kernel: [drm] DSC precompute is not needed.
May 13 21:24:43 archlinux kernel: [drm] initializing kernel modesetting 
(IP DISCOVERY 0x1002:0x15BF 0xF111:0x0005 0xC1).
May 13 21:24:43 archlinux kernel: [drm] register mmio base: 0x90500000
May 13 21:24:43 archlinux kernel: [drm] register mmio size: 524288
May 13 21:24:43 archlinux kernel: [drm] add ip block number 0 <soc21_common>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 1 <gmc_v11_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 2 <ih_v6_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 3 <psp>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 4 <smu>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 5 <dm>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 6 <gfx_v11_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 7 <sdma_v6_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 8 <vcn_v4_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 9 <jpeg_v4_0>
May 13 21:24:43 archlinux kernel: [drm] add ip block number 10 <mes_v11_0>
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Fetched 
VBIOS from VFCT
May 13 21:24:43 archlinux kernel: amdgpu: ATOM BIOS: 113-PHXGENERIC-001
May 13 21:24:43 archlinux kernel: [drm] VCN(0) encode/decode are enabled 
in VM mode
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: vgaarb: 
deactivate vga console
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Trusted 
Memory Zone (TMZ) feature enabled
May 13 21:24:43 archlinux kernel: [drm] vm size is 262144 GB, 4 levels, 
block size is 9-bit, fragment size is 9-bit
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: VRAM: 
4096M 0x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: GART: 
512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
May 13 21:24:43 archlinux kernel: [drm] Detected VRAM RAM=4096M, BAR=4096M
May 13 21:24:43 archlinux kernel: [drm] RAM width 128bits DDR5
May 13 21:24:43 archlinux kernel: [drm] amdgpu: 4096M of VRAM memory ready
May 13 21:24:43 archlinux kernel: [drm] amdgpu: 30038M of GTT memory ready.
May 13 21:24:43 archlinux kernel: [drm] GART: num cpu pages 131072, num 
gpu pages 131072
May 13 21:24:43 archlinux kernel: [drm] PCIE GART of 512M enabled (table 
at 0x00000080FFD00000).
May 13 21:24:43 archlinux kernel: [drm] Loading DMUB firmware via PSP: 
version=0x08003700
May 13 21:24:43 archlinux kernel: [drm] Found VCN firmware Version ENC: 
1.19 DEC: 7 VEP: 0 Revision: 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: Will use 
PSP to load VCN firmware
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: reserve 
0x4000000 from 0x80f8000000 for PSP TMR
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAS: 
optional ras ta ucode is not available
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: RAP: 
optional rap ta ucode is not available
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: 
SECUREDISPLAY: securedisplay ta ucode is not available
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SMU is 
initialized successfully!
May 13 21:24:43 archlinux kernel: [drm] Seamless boot condition check passed
May 13 21:24:43 archlinux kernel: [drm] Display Core v3.2.273 
initialized on DCN 3.1.4
May 13 21:24:43 archlinux kernel: [drm] DP-HDMI FRL PCON supported
May 13 21:24:43 archlinux kernel: [drm] DMUB hardware initialized: 
version=0x08003700
May 13 21:24:43 archlinux kernel: i2c i2c-6: adapter [AMDGPU DM i2c hw 
bus 0] registered
May 13 21:24:43 archlinux kernel: [drm] PSR support 1, DC PSR ver 0, 
sink PSR ver 1 DPCD caps 0x2a su_y_granularity 0
May 13 21:24:43 archlinux kernel: i2c i2c-7: adapter [AMDGPU DM i2c hw 
bus 1] registered
May 13 21:24:43 archlinux kernel: i2c i2c-8: adapter [AMDGPU DM i2c hw 
bus 2] registered
May 13 21:24:43 archlinux kernel: i2c i2c-9: adapter [AMDGPU DM i2c hw 
bus 3] registered
May 13 21:24:43 archlinux kernel: i2c i2c-10: adapter [AMDGPU DM i2c hw 
bus 4] registered
May 13 21:24:43 archlinux kernel: i2c i2c-11: adapter [AMDGPU DM i2c hw 
bus 5] registered
May 13 21:24:43 archlinux kernel: i2c i2c-12: adapter [AMDGPU DM i2c hw 
bus 6] registered
May 13 21:24:43 archlinux kernel: i2c i2c-13: adapter [AMDGPU DM i2c hw 
bus 7] registered
May 13 21:24:43 archlinux kernel: i2c i2c-14: adapter [AMDGPU DM i2c hw 
bus 8] registered
May 13 21:24:43 archlinux kernel: [drm] kiq ring mec 3 pipe 1 q 0
May 13 21:24:43 archlinux kernel: [drm] VCN decode and encode 
initialized successfully(under DPG Mode).
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: 
[drm:jpeg_v4_0_hw_init [amdgpu]] JPEG decode initialized successfully.
May 13 21:24:43 archlinux kernel: amdgpu: HMM registered 4096MB device 
memory
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Allocated 3969056 
bytes on gart
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: Total number of KFD 
nodes to be created: 1
May 13 21:24:43 archlinux kernel: amdgpu: Virtual CRAT table created for GPU
May 13 21:24:43 archlinux kernel: amdgpu: Topology: Add dGPU node 
[0x15bf:0x1002]
May 13 21:24:43 archlinux kernel: kfd kfd: amdgpu: added device 1002:15bf
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: SE 1, SH 
per SE 2, CU per SH 6, active_cu_number 12
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.0 uses VM inv eng 1 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.0 uses VM inv eng 4 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.0 uses VM inv eng 6 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.0 uses VM inv eng 7 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.0.1 uses VM inv eng 8 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.1.1 uses VM inv eng 9 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.2.1 uses VM inv eng 10 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
comp_1.3.1 uses VM inv eng 11 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
sdma0 uses VM inv eng 12 on hub 0
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
vcn_unified_0 uses VM inv eng 0 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
jpeg_dec uses VM inv eng 1 on hub 8
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: amdgpu: ring 
mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32770.1.1 was added
May 13 21:24:43 archlinux kernel: [drm] ring compute_32770.2.2 was added
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32770.3.3 was added
May 13 21:24:43 archlinux kernel: [drm] ring gfx_32770.1.1 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring compute_32770.2.2 ib test pass
May 13 21:24:43 archlinux kernel: [drm] ring sdma_32770.3.3 ib test pass
May 13 21:24:43 archlinux kernel: i2c i2c-15: adapter [AMDGPU DM aux hw 
bus 0] registered
May 13 21:24:43 archlinux kernel: i2c i2c-16: adapter [AMDGPU DM aux hw 
bus 1] registered
May 13 21:24:43 archlinux kernel: i2c i2c-17: adapter [AMDGPU DM aux hw 
bus 2] registered
May 13 21:24:43 archlinux kernel: i2c i2c-18: adapter [AMDGPU DM aux hw 
bus 3] registered
May 13 21:24:43 archlinux kernel: i2c i2c-19: adapter [AMDGPU DM aux hw 
bus 4] registered
May 13 21:24:43 archlinux kernel: i2c i2c-20: adapter [AMDGPU DM aux hw 
bus 5] registered
May 13 21:24:43 archlinux kernel: i2c i2c-21: adapter [AMDGPU DM aux hw 
bus 6] registered
May 13 21:24:43 archlinux kernel: i2c i2c-22: adapter [AMDGPU DM aux hw 
bus 7] registered
May 13 21:24:43 archlinux kernel: i2c i2c-23: adapter [AMDGPU DM aux hw 
bus 8] registered
May 13 21:24:43 archlinux kernel: [drm] Initialized amdgpu 3.57.0 
20150101 for 0000:c4:00.0 on minor 2
May 13 21:24:43 archlinux kernel: fbcon: amdgpudrmfb (fb0) is primary device
May 13 21:24:43 archlinux kernel: fbcon: Deferring console take-over
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] fb0: 
amdgpudrmfb frame buffer device
May 13 21:24:43 archlinux systemd-modules-load[204]: Inserted module 
'amdgpu'
May 13 21:24:43 archlinux systemd-modules-load[204]: Module 'tpm_crb' is 
built in
May 13 21:24:43 archlinux systemd[1]: Finished Load Kernel Modules.
May 13 21:24:43 archlinux systemd[1]: Reached target System Initialization.
May 13 21:24:43 archlinux systemd[1]: Reached target Basic System.
May 13 21:24:43 archlinux systemd[1]: Reached target Initrd Default Target.
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:223
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:231
May 13 21:24:43 archlinux systemd[1]: Starting Cleaning Up and Shutting 
Down Daemons...
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:239
May 13 21:24:43 archlinux systemd[1]: Stopped target Initrd Default Target.
May 13 21:24:43 archlinux systemd[1]: Stopped target Basic System.
May 13 21:24:43 archlinux systemd[1]: Stopped target Initrd Root Device.
May 13 21:24:43 archlinux systemd[1]: Stopped target Path Units.
May 13 21:24:43 archlinux systemd[1]: Stopped target Slice Units.
May 13 21:24:43 archlinux systemd[1]: Stopped target Socket Units.
May 13 21:24:43 archlinux systemd[1]: Stopped target System Initialization.
May 13 21:24:43 archlinux systemd[1]: Stopped target Local Encrypted 
Volumes.
May 13 21:24:43 archlinux systemd[1]: Stopped target Local File Systems.
May 13 21:24:43 archlinux kernel: amdgpu 0000:c4:00.0: [drm] REG_WAIT 
timeout 1us * 1000 tries - dcn314_dsc_pg_control line:247
May 13 21:24:43 archlinux systemd[1]: Stopped target Preparation for 
Local File Systems.
May 13 21:24:43 archlinux systemd[1]: Stopped target Swaps.
May 13 21:24:43 archlinux systemd[1]: Stopped target Timer Units.
May 13 21:24:43 archlinux systemd[1]: kmod-static-nodes.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Create List of Static 
Device Nodes.
May 13 21:24:43 archlinux systemd[1]: Starting Plymouth switch root 
service...
May 13 21:24:43 archlinux systemd[1]: Stopping Displays emergency 
message in full screen....
May 13 21:24:43 archlinux systemd[1]: systemd-modules-load.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Load Kernel Modules.
May 13 21:24:43 archlinux systemd[1]: systemd-modules-load.service: 
Consumed 1.622s CPU time.
May 13 21:24:43 archlinux systemd[1]: Stopping TPM2 PCR Barrier (initrd)...
May 13 21:24:43 archlinux systemd[1]: systemd-udev-trigger.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Coldplug All udev Devices.
May 13 21:24:43 archlinux systemd[1]: Stopping Rule-based Manager for 
Device Events and Files...
May 13 21:24:43 archlinux systemd[1]: initrd-cleanup.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Finished Cleaning Up and Shutting 
Down Daemons.
May 13 21:24:43 archlinux systemd[1]: systemd-bsod.service: Deactivated 
successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Displays emergency message 
in full screen..
May 13 21:24:43 archlinux systemd[1]: systemd-battery-check.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Check battery level during 
early boot.
May 13 21:24:43 archlinux systemd-pcrextend[382]: Extended PCR index 11 
with 'leave-initrd' (banks sha256).
May 13 21:24:43 archlinux systemd[1]: systemd-pcrphase-initrd.service: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped TPM2 PCR Barrier (initrd).
May 13 21:24:43 archlinux systemd[1]: systemd-udevd.service: Deactivated 
successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Rule-based Manager for 
Device Events and Files.
May 13 21:24:43 archlinux systemd[1]: systemd-udevd-control.socket: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Closed udev Control Socket.
May 13 21:24:43 archlinux systemd[1]: systemd-udevd-kernel.socket: 
Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Closed udev Kernel Socket.
May 13 21:24:43 archlinux systemd[1]: Starting Cleanup udev Database...
May 13 21:24:43 archlinux systemd[1]: 
systemd-tmpfiles-setup-dev.service: Deactivated successfully.
May 13 21:24:43 archlinux systemd[1]: Stopped Create Static Device Nodes 
in /dev.
May 13 21:24:44 archlinux systemd[1]: initrd-udevadm-cleanup-db.service: 
Deactivated successfully.
May 13 21:24:44 archlinux systemd[1]: Finished Cleanup udev Database.
May 13 21:24:44 archlinux systemd[1]: Reached target Switch Root.
May 13 21:24:45 archlinux systemd[1]: Finished Plymouth switch root service.
May 13 21:24:45 archlinux systemd[1]: Starting Switch Root...
May 13 21:24:45 archlinux systemd[1]: Switching root.
May 13 21:24:45 archlinux systemd-journald[203]: Journal stopped
May 13 21:24:46 artemis systemd-journald[432]: Journal started
May 13 21:24:46 artemis systemd-journald[432]: Runtime Journal 
(/run/log/journal/e96353876b4c42cf86a38dab97d1e2b6) is 8.0M, max 1.1G, 
1.1G free.
May 13 21:24:46 artemis systemd-journald[203]: Received SIGTERM from PID 
1 (systemd).
May 13 21:24:46 artemis systemd[1]: systemd 255.6-1-arch running in 
system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT 
+GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC 
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 
+BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT 
default-hierarchy=unified)
May 13 21:24:46 artemis systemd[1]: Detected architecture x86-64.
May 13 21:24:46 artemis systemd[1]: Hostname set to <artemis>.

We also experience quite a few kwin "kernel bug" messages when the touch 
pad does initialize properly:

May 13 21:25:10 artemis kwin_wayland[1124]: kwin_libinput: Libinput: 
event3  - PIXA3854:00 093A:0274 Touchpad: kernel bug: Touch jump 
detected and discarded.
May 13 21:25:10 artemis kwin_wayland[1124]: kwin_libinput: Libinput: 
event3  - PIXA3854:00 093A:0274 Touchpad: kernel bug: Touch jump 
detected and discarded.
May 13 21:25:25 artemis kwin_wayland[1124]: kwin_libinput: Libinput: 
event3  - PIXA3854:00 093A:0274 Touchpad: kernel bug: Touch jump 
detected and discarded.
May 13 21:26:12 artemis kwin_wayland[1124]: kwin_libinput: Libinput: 
event3  - PIXA3854:00 093A:0274 Touchpad: kernel bug: Touch jump 
detected and discarded.
May 13 21:26:29 artemis kwin_wayland[1124]: kwin_libinput: Libinput: 
event3  - PIXA3854:00 093A:0274 Touchpad: kernel bug: Touch jump 
detected and discarded.
May 13 21:26:29 artemis kwin_wayland[1124]: kwin_libinput: Libinput: 
event3  - PIXA3854:00 093A:0274 Touchpad: WARNING: log rate limit 
exceeded (5 msgs per 24h). Discarding future messages.

Thank you for looking into this issue.

-Arazil


