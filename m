Return-Path: <linux-input+bounces-1992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005785D0D4
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 08:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70A52B25337
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 07:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E6439FE9;
	Wed, 21 Feb 2024 07:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="PbXZt4qF"
X-Original-To: linux-input@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D93A8D2
	for <linux-input@vger.kernel.org>; Wed, 21 Feb 2024 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499015; cv=none; b=j/mwaG3/J5fRVJnDwSv3mJ3JQk2rAkjUfEDu404QZYTLsfwegP+swr6jGWI1tZwKwa6cVzv5rRptaHtxqG38sxPuNKkIUj28ViPaRFMV2Du2FEQ9nSQ+6nJZ8qbv1cqUzuMfQ3t9EGEYJteNxqvvKaev6vjjTOrhmgz0K39+lQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499015; c=relaxed/simple;
	bh=713za7jclllPIa3R5xUBakES1GWDGP8L0DIr8r8pcek=;
	h=To:CC:From:Subject:Message-ID:Date:MIME-Version:Content-Type; b=iGPP7b3KiDxrtbpXWueU8dWH+370AWG2zuNCy3ZxF7zH3LbXX0dJQLsY1zRfsdkJsFfyRN9rb6heiUxX8JG6bDrqRpq49+hNtSzB5OYr/LPiYvd4YS1WJrzC3u221Gqc1q58ueEL8Kn1K4mRNYAW9KUeDNuk2HPGFRN0HgFY23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=PbXZt4qF; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id CB785207BB;
	Wed, 21 Feb 2024 07:55:45 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T-90X6eqGVX; Wed, 21 Feb 2024 07:55:41 +0100 (CET)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 90B6A205CD;
	Wed, 21 Feb 2024 07:55:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 90B6A205CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1708498541;
	bh=D6pnaLY6XB6zEdjMaPcs/5NNNnvsO7S89ZLMeSC/bhE=;
	h=To:CC:From:Subject:Date:From;
	b=PbXZt4qF7GHFWG7P8Q4/CyswnpC5b6/GlfTe+Qsbu3OpCgoCPB8onO+63p7ArwBeV
	 aLy+1fCjshuIqJjUykpTJu6wWCU5lthgIYNnRCCc5BJ5V04y+LMkdF43sOfaXaYzr+
	 L4T9EKqqmIhfk4t8MZY03uHxQA5hu90hWB9P5ziA+EQbH3/XMMz0Z178pllSbJxuAf
	 DmK1FHJw6JzrjmdpOe1nZ4rNjIOWEleO5xIUlPS/fl8wJJNQE58kci28zWNztfWoNB
	 LN9lJu1Z7/Tjr02ESfukXmFuFP95d5+EgXejJCxcPtanCncI4TqTsVzI/rBisVp///
	 CNwHzVHaGIOZQ==
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
	by mailout1.secunet.com (Postfix) with ESMTP id 811E180004A;
	Wed, 21 Feb 2024 07:55:41 +0100 (CET)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 07:55:41 +0100
Received: from [172.18.150.65] (172.18.150.65) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 07:55:40 +0100
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sasha Levin
	<sashal@kernel.org>, <linux-input@vger.kernel.org>, Brad Spengler
	<spender@grsecurity.net>
From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Autocrypt: addr=torsten.hilbrich@secunet.com; prefer-encrypt=mutual; keydata=
 mQENBFs5uIIBCAD4qbEieyT7sBmcro1VrCE1sSnV29a9ub8c0Xj0yw0Cz2N7LalBn4a+YeJN
 OMfL1MQvEiTxZNIzb1I0bRYcfhkhjN4+vAoPJ3q1OpSY+WUgphUbzseUk/Bq3gwvfa6/U+Hm
 o2lvEfN2dewBGptQ+DrWz+SPM1TQiwShKjowY/avaVgrABBGen3LgB0XZXEH8Q720kjP7htK
 tCGRt1T+qNIj3tZDZfPkqEVb8lTRcyn1hI3/FbDTysletRrCmkHSVbnxNzO6lw2G1H61wQhw
 YVbIVNohY61ieSJFhNLL6/UTGHtUE2IAicnsUAUKR8GiI1+3cTf233O5HaWYeOjBmTCLABEB
 AAG0L1RvcnN0ZW4gSGlsYnJpY2ggPHRvcnN0ZW4uaGlsYnJpY2hAc2VjdW5ldC5jb20+iQE3
 BBMBCAAhBQJbObiCAhsDBQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEJ7rXZh78/h8+tIH
 +QFYRQH4qh3WagcmjbG/zCe2RmZZePO8bmut2fAxY04aqJZGYUBxb5lfaWaHkstqM5sFD8Jo
 k1j5E7f1cnfwB21azdUO8fzYL889kdVOzatdT/uTjR7OjR59gpJMd4lx7fwFuZUg8z6rfWJ3
 ImjxxBgaJRL6pqaZ9lOst82O0qJKEFBR+HDUVvgh4n8TTOfKNv/dGPQhaed+2or98asdYRWo
 S/zc4ltTh4SxZjLd98pDxjlUyOJoMJeWdlMmLgWV3h1qjy4DxgQzvgATEaKjOuwtkCOcwHn7
 Unf0F2V9p4O7NFOuoVyqTBRX+5xKgzSM7VP1RlTT4FA9/7wkhhG+FEK5AQ0EWzm4ggEIAL9F
 IIPQYMx5x+zMjm8lDsmh12zoqCtMfn9QWrERd2gDS3GsORbe/i6DhYvzsulH8vsviPle4ocU
 +PaTwadfnEqm0FS7xCONYookDGfAiPS4cHWX7WrTNBP7mK3Gl1KaAOJJsMbCVAA9q4d8WL+A
 e+XrfOAetZq5gxLxDMYySNI1pIMJVrGECiboLa/LPPh2yw4jieAedW96CPuZs7rUY/5uIVt0
 Dn4/aSzV+Ixr52Z2McvNmH/VxDt59Z6jBztZIJBXpX3BC/UyH7rJOJTaqEF+EVWEpOmSoZ6u
 i1DWyqOBKnQrbUa0fpNd3aaOl2KnlgTH9upm70XZGpeJik/pQGcAEQEAAYkBHwQYAQgACQUC
 Wzm4ggIbDAAKCRCe612Ye/P4fEzqB/9gcM/bODO8o9YR86BLp0S8bF73lwIJyDHg5brjqAnz
 CtCdb4I+evI4iyU9zuN1x4V+Te5ej+mUu5CbIte8gQbo4cc9sbe/AEDoOh0lGoXKZiwtHqoh
 RZ4jOFrZJsEjOSUCLE8E8VR1afPf0SkFXLXWZfZDU28K80JWeV1BCtxutZ39bz6ybMbcCvMS
 UfwCTY0IJOiDga1K4H2HzHAqlvfzCurqe616S4S1ax+erg3KTEXylxmzcFjJU8AUZURy/lQt
 VElzs4Km1p3v6GUciCAb+Uhd12sQG2mL05jmEems9uRe3Wfke/RKp8A+Yq+p6E0A0ZOP+Okm
 LXB2q+ckPvZG
Subject: v6.8-rc4: Crash in rmi_unregister_function still present
Message-ID: <1932038e-2776-04ac-5fcd-b15bb3cd088d@secunet.com>
Date: Wed, 21 Feb 2024 07:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------6BFAE5A8157530022DFAC815"
Content-Language: en-US
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

--------------6BFAE5A8157530022DFAC815
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello,

updating our codebase to v6.8-rc4 which contains:

eb988e46da2e Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()

I noticed that the previously noticed crash in the rmi4 was present again.

Previously, we were using a fix from the grsecurity codebase which changed the function in the following way:

void rmi_unregister_function(struct rmi_function *fn)
{
	int i;

	rmi_dbg(RMI_DEBUG_CORE, &fn->dev, "Unregistering F%02X.\n",
			fn->fd.function_number);

	for (i = 0; i < fn->num_of_irqs; i++)
		irq_dispose_mapping(fn->irq[i]);

	device_del(&fn->dev);
	of_node_put(fn->dev.of_node);
	put_device(&fn->dev);
}

With this version of the fix the crash didn't happen. Please note, that the crash happens in device_del which is before the irq_dispose_mapping call in eb988e46da2e.

Attached is a kernel log from the crash with a kernel based on v6.8-rc4.

Thanks,

	Torsten

--------------6BFAE5A8157530022DFAC815
Content-Type: text/x-log; charset="UTF-8"; name="kernel.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="kernel.log"

Oops#1 Part1
<5>[    0.000000] Linux version 6.8.0-devel+ (thilbrich@ws-3) (gcc (Debia=
n 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMP=
T_DYNAMIC Thu Feb 15 12:52:10 CET 2024
<6>[    0.000000] Command line: BOOT_IMAGE=3D/isolinux/bzImage loglevel=3D=
1 sina_toram console=3Dtty1 intel_iommu=3Don,igfx_off
<6>[    0.000000] BIOS-provided physical RAM map:
<6>[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] =
usable
<6>[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] =
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000944b6fff] =
usable
<6>[    0.000000] BIOS-e820: [mem 0x00000000944b7000-0x000000009456efff] =
type 20
<6>[    0.000000] BIOS-e820: [mem 0x000000009456f000-0x0000000098694fff] =
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000098695000-0x0000000099a1efff] =
ACPI NVS
<6>[    0.000000] BIOS-e820: [mem 0x0000000099a1f000-0x0000000099b4efff] =
ACPI data
<6>[    0.000000] BIOS-e820: [mem 0x0000000099b4f000-0x0000000099b4ffff] =
usable
<6>[    0.000000] BIOS-e820: [mem 0x0000000099b50000-0x000000009f7fffff] =
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000085e7fffff] =
usable
<6>[    0.000000] NX (Execute Disable) protection: active
<6>[    0.000000] APIC: Static calls initialized
<6>[    0.000000] user-defined physical RAM map:
<6>[    0.000000] user: [mem 0x0000000000000000-0x000000000009efff] usabl=
e
<6>[    0.000000] user: [mem 0x000000000009f000-0x00000000000fffff] reser=
ved
<6>[    0.000000] user: [mem 0x0000000000100000-0x00000000944b6fff] usabl=
e
<6>[    0.000000] user: [mem 0x00000000944b7000-0x000000009456efff] type =
20
<6>[    0.000000] user: [mem 0x000000009456f000-0x0000000098694fff] reser=
ved
<6>[    0.000000] user: [mem 0x0000000098695000-0x0000000099a1efff] ACPI =
NVS
<6>[    0.000000] user: [mem 0x0000000099a1f000-0x0000000099b4efff] ACPI =
data
<6>[    0.000000] user: [mem 0x0000000099b4f000-0x0000000099b4ffff] usabl=
e
<6>[    0.000000] user: [mem 0x0000000099b50000-0x000000009f7fffff] reser=
ved
<6>[    0.000000] user: [mem 0x0000000100000000-0x0000000187ffffff] usabl=
e
<6>[    0.000000] user: [mem 0x0000000188000000-0x0000000189ffffff] reser=
ved
<6>[    0.000000] user: [mem 0x000000018a000000-0x000000085e7fffff] usabl=
e
<6>[    0.000000] efi: EFI v2.7 by Lenovo
<6>[    0.000000] efi: SMBIOS=3D0x96ab8000 SMBIOS 3.0=3D0x96aab000 ACPI=3D=
0x99b4e000 ACPI 2.0=3D0x99b4e014 MEMATTR=3D0x911d8018 ESRT=3D0x96965000=20
<6>[    0.000000] SMBIOS 3.2.0 present.
<6>[    0.000000] DMI: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S (3.14 =
) 10/10/2020
<6>[    0.000000] tsc: Detected 2300.000 MHz processor
<6>[    0.000000] tsc: Detected 2299.968 MHz TSC
<7>[    0.000010] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D>=
 reserved
<7>[    0.000015] e820: remove [mem 0x000a0000-0x000fffff] usable
<6>[    0.000026] last_pfn =3D 0x85e800 max_arch_pfn =3D 0x400000000
<6>[    0.000033] MTRR map: 5 entries (3 fixed + 2 variable; max 23), bui=
lt from 10 variable MTRRs
<6>[    0.000036] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  U=
C- WT =20
<6>[    0.000594] last_pfn =3D 0x99b50 max_arch_pfn =3D 0x400000000
<6>[    0.013872] Using GB pages for direct mapping
<6>[    0.014342] Secure boot enabled
<6>[    0.014343] RAMDISK: [mem 0x32f2b000-0x3578cfff]
<6>[    0.014351] ACPI: Early table checksum verification disabled
<6>[    0.014355] ACPI: RSDP 0x0000000099B4E014 000024 (v02 LENOVO)
<6>[    0.014361] ACPI: XSDT 0x0000000099B4C188 0000FC (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014370] ACPI: FACP 0x0000000096962000 000114 (v06 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014378] ACPI: DSDT 0x0000000096932000 02BFF1 (v02 LENOVO CML   =
   20170001 INTL 20160422)
<6>[    0.014384] ACPI: FACS 0x0000000099884000 000040
<6>[    0.014388] ACPI: SSDT 0x00000000969BC000 0020AE (v02 LENOVO CpuSsd=
t  00003000 INTL 20160527)
<6>[    0.014394] ACPI: SSDT 0x00000000969BB000 0005A1 (v02 LENOVO CtdpB =
   00001000 INTL 20160527)
<6>[    0.014399] ACPI: SSDT 0x000000009697E000 003532 (v02 LENOVO DptfTa=
bl 00001000 INTL 20160527)
<6>[    0.014404] ACPI: SSDT 0x0000000096968000 00331E (v02 LENOVO SaSsdt=
   00003000 INTL 20160527)
<6>[    0.014409] ACPI: BOOT 0x0000000096966000 000028 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014413] ACPI: SSDT 0x0000000096963000 0005D8 (v02 LENOVO PerfTu=
ne 00001000 INTL 20160527)
<6>[    0.014418] ACPI: HPET 0x0000000096961000 000038 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014423] ACPI: APIC 0x0000000096960000 000164 (v03 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014428] ACPI: MCFG 0x000000009695F000 00003C (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014433] ACPI: ECDT 0x000000009695E000 000053 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014438] ACPI: SSDT 0x0000000096930000 001F31 (v02 LENOVO WHL_Tb=
t_ 00001000 INTL 20160527)
<6>[    0.014443] ACPI: SSDT 0x000000009692F000 0000A6 (v02 LENOVO PID0Ss=
dt 00000010 INTL 20160527)
<6>[    0.014448] ACPI: SSDT 0x000000009692B000 0037A1 (v02 LENOVO ProjSs=
dt 00000010 INTL 20160527)
<6>[    0.014452] ACPI: NHLT 0x0000000096929000 00189E (v00 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014457] ACPI: MSDM 0x0000000096928000 000055 (v03 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014462] ACPI: SSDT 0x000000009674B000 000EF6 (v02 LENOVO UsbCTa=
bl 00001000 INTL 20160527)
<6>[    0.014467] ACPI: LPIT 0x000000009674A000 000094 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014472] ACPI: WSMT 0x0000000096749000 000028 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014477] ACPI: SSDT 0x0000000096746000 00281B (v02 LENOVO TbtTyp=
eC 00000000 INTL 20160527)
<6>[    0.014481] ACPI: DBGP 0x0000000096745000 000034 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014486] ACPI: DBG2 0x0000000096744000 000054 (v00 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014491] ACPI: BATB 0x0000000096743000 00004A (v02 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014496] ACPI: DMAR 0x0000000094F3C000 0000A8 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014501] ACPI: BGRT 0x0000000094F3B000 000038 (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014506] ACPI: UEFI 0x0000000099839000 00012A (v01 LENOVO TP-N2X=
   00003140 PTEC 00000002)
<6>[    0.014510] ACPI: FPDT 0x0000000094F3A000 000044 (v01 LENOVO TP-N2X=
   00003140 PTEC 00003140)
<6>[    0.014514] ACPI: Reserving FACP table memory at [mem 0x96962000-0x=
96962113]
<6>[    0.014517] ACPI: Reserving DSDT table memory at [mem 0x96932000-0x=
9695dff0]
<6>[    0.014519] ACPI: Reserving FACS table memory at [mem 0x99884000-0x=
9988403f]
<6>[    0.014520] ACPI: Reserving SSDT table memory at [mem 0x969bc000-0x=
969be0ad]
<6>[    0.014522] ACPI: Reserving SSDT table memory at [mem 0x969bb000-0x=
969bb5a0]
<6>[    0.014523] ACPI: Reserving SSDT table memory at [mem 0x9697e000-0x=
96981531]
<6>[    0.014524] ACPI: Reserving SSDT table memory at [mem 0x96968000-0x=
9696b31d]
<6>[    0.014526] ACPI: Reserving BOOT table memory at [mem 0x96966000-0x=
96966027]
<6>[    0.014527] ACPI: Reserving SSDT table memory at [mem 0x96963000-0x=
969635d7]
<6>[    0.014529] ACPI: Reserving HPET table memory at [mem 0x96961000-0x=
96961037]
<6>[    0.014530] ACPI: Reserving APIC table memory at [mem 0x96960000-0x=
96960163]
<6>[    0.014532] ACPI: Reserving MCFG table memory at [mem 0x9695f000-0x=
9695f03b]
<6>[    0.014533] ACPI: Reserving ECDT table memory at [mem 0x9695e000-0x=
9695e052]
<6>[    0.014534] ACPI: Reserving SSDT table memory at [mem 0x96930000-0x=
96931f30]
<6>[    0.014536] ACPI: Reserving SSDT table memory at [mem 0x9692f000-0x=
9692f0a5]
<6>[    0.014537] ACPI: Reserving SSDT table memory at [mem 0x9692b000-0x=
9692e7a0]
<6>[    0.014539] ACPI: Reserving NHLT table memory at [mem 0x96929000-0x=
9692a89d]
<6>[    0.014540] ACPI: Reserving MSDM table memory at [mem 0x96928000-0x=
96928054]
<6>[    0.014541] ACPI: Reserving SSDT table memory at [mem 0x9674b000-0x=
9674bef5]
<6>[    0.014543] ACPI: Reserving LPIT table memory at [mem 0x9674a000-0x=
9674a093]
<6>[    0.014544] ACPI: Reserving WSMT table memory at [mem 0x96749000-0x=
96749027]
<6>[    0.014546] ACPI: Reserving SSDT table memory at [mem 0x96746000-0x=
9674881a]
<6>[    0.014547] ACPI: Reserving DBGP table memory at [mem 0x96745000-0x=
96745033]
<6>[    0.014549] ACPI: Reserving DBG2 table memory at [mem 0x96744000-0x=
96744053]
<6>[    0.014550] ACPI: Reserving BATB table memory at [mem 0x96743000-0x=
96743049]
<6>[    0.014552] ACPI: Reserving DMAR table memory at [mem 0x94f3c000-0x=
94f3c0a7]
<6>[    0.014553] ACPI: Reserving BGRT table memory at [mem 0x94f3b000-0x=
94f3b037]
<6>[    0.014554] ACPI: Reserving UEFI table memory at [mem 0x99839000-0x=
99839129]
<6>[    0.014556] ACPI: Reserving FPDT table memory at [mem 0x94f3a000-0x=
94f3a043]
<6>[    0.014620] Zone ranges:
<6>[    0.014622]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
<6>[    0.014625]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
<6>[    0.014628]   Normal   [mem 0x0000000100000000-0x000000085e7fffff]
<6>[    0.014630] Movable zone start for each node
<6>[    0.014631] Early memory node ranges
<6>[    0.014632]   node   0: [mem 0x0000000000001000-0x000000000009efff]=

<6>[    0.014635]   node   0: [mem 0x0000000000100000-0x00000000944b6fff]=

<6>[    0.014637]   node   0: [mem 0x0000000099b4f000-0x0000000099b4ffff]=

<6>[    0.014639]   node   0: [mem 0x0000000100000000-0x0000000187ffffff]=

<6>[    0.014641]   node   0: [mem 0x000000018a000000-0x000000085e7fffff]=

<6>[    0.014646] Initmem setup node 0 [mem 0x0000000000001000-0x00000008=
5e7fffff]
<6>[    0.014651] On node 0, zone DMA: 1 pages in unavailable ranges
<6>[    0.014685] On node 0, zone DMA: 97 pages in unavailable ranges
<6>[    0.020051] On node 0, zone DMA32: 22168 pages in unavailable range=
s
<6>[    0.025101] On node 0, zone Normal: 25776 pages in unavailable rang=
es
<6>[    0.082996] On node 0, zone Normal: 8192 pages in unavailable range=
s
<6>[    0.083079] On node 0, zone Normal: 6144 pages in unavailable range=
s
<6>[    0.083097] Reserving Intel graphics memory at [mem 0x9b800000-0x9f=
7fffff]
<6>[    0.083373] ACPI: PM-Timer IO Port: 0x1808
<6>[    0.083383] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
<6>[    0.083386] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
<6>[    0.083387] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
<6>[    0.083389] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
<6>[    0.083390] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
<6>[    0.083391] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
<6>[    0.083392] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
<6>[    0.083393] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
<6>[    0.083395] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
<6>[    0.083396] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
<6>[    0.083397] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
<6>[    0.083398] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
<6>[    0.083400] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
<6>[    0.083401] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
<6>[    0.083402] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
<6>[    0.083403] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
<6>[    0.083405] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
<6>[    0.083406] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
<6>[    0.083407] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
<6>[    0.083409] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
<6>[    0.083450] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, G=
SI 0-119
<6>[    0.083455] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl=
)
<6>[    0.083458] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high le=
vel)
<6>[    0.083465] ACPI: Using ACPI (MADT) for SMP configuration informati=
on
<6>[    0.083466] ACPI: HPET id: 0x8086a201 base: 0xfed00000
<6>[    0.083472] TSC deadline timer available
<6>[    0.083473] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
<6>[    0.083486] [mem 0x9f800000-0xffffffff] available for PCI devices
<6>[    0.083488] Booting paravirtualized kernel on bare hardware
<6>[    0.083491] clocksource: refined-jiffies: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 1910969940391419 ns
<6>[    0.096308] setup_percpu: NR_CPUS:32 nr_cpumask_bits:8 nr_cpu_ids:8=
 nr_node_ids:1
<6>[    0.096784] percpu: Embedded 56 pages/cpu s191336 r8192 d29848 u262=
144
<7>[    0.096792] pcpu-alloc: s191336 r8192 d29848 u262144 alloc=3D1*2097=
152
<7>[    0.096796] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
<5>[    0.096819] Kernel command line: memmap=3D0x2000000$0x188000000 ram=
oops.mem_address=3D0x188000000 ramoops.mem_size=3D0x2000000 ramoops.ecc=3D=
1 ramoops.record_size=3D0x200000 ramoops.console_size=3D0 ramoops.ftrace_=
size=3D0 ramoops.pmsg_size=3D0 mem_sleep_default=3Ddeep mitigations=3Daut=
o nosmt, g_mass_storage.idVendor=3D0x22e0 g_mass_storage.idProduct=3D0x03=
00 g_mass_storage.iManufacturer=3DSecunet g_mass_storage.iProduct=3D"SINA=
 Virtual USB Stick" g_mass_storage.removable=3D1 BOOT_IMAGE=3D/isolinux/b=
zImage loglevel=3D1 sina_toram console=3Dtty1 intel_iommu=3Don,igfx_off
<6>[    0.096998] DMAR: IOMMU enabled
<6>[    0.096999] DMAR: Disable GFX device mapping
<5>[    0.097002] Unknown kernel command line parameters "nosmt, sina_tor=
am BOOT_IMAGE=3D/isolinux/bzImage", will be passed to user space.
<5>[    0.097066] random: crng init done
<6>[    0.101119] Dentry cache hash table entries: 4194304 (order: 13, 33=
554432 bytes, linear)
<6>[    0.103140] Inode-cache hash table entries: 2097152 (order: 12, 167=
77216 bytes, linear)
<6>[    0.103295] Built 1 zonelists, mobility grouping on.  Total pages: =
8195845
<6>[    0.103298] mem auto-init: stack:all(zero), heap alloc:off, heap fr=
ee:off
<6>[    0.103307] software IO TLB: area num 8.
<6>[    0.215335] Memory: 32567712K/33304920K available (20480K kernel co=
de, 9365K rwdata, 8776K rodata, 3616K init, 3228K bss, 736948K reserved, =
0K cma-reserved)
<6>[    0.215407] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
8, Nodes=3D1
<6>[    0.215435] ftrace: allocating 61258 entries in 240 pages
<6>[    0.237086] ftrace: allocated 240 pages with 4 groups
<6>[    0.238874] Dynamic Preempt: voluntary
<6>[    0.238928] rcu: Preemptible hierarchical RCU implementation.
<6>[    0.238929] rcu: 	RCU event tracing is enabled.
<6>[    0.238930] rcu: 	RCU restricting CPUs from NR_CPUS=3D32 to nr_cpu_=
ids=3D8.
<6>[    0.238932] 	Trampoline variant of Tasks RCU enabled.
<6>[    0.238933] 	Rude variant of Tasks RCU enabled.
<6>[    0.238934] 	Tracing variant of Tasks RCU enabled.
<6>[    0.238935] rcu: RCU calculated value of scheduler-enlistment delay=
 is 100 jiffies.
<6>[    0.238937] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cp=
u_ids=3D8
<6>[    0.245255] NR_IRQS: 4352, nr_irqs: 2048, preallocated irqs: 16
<6>[    0.245579] rcu: srcu_init: Setting srcu_struct sizes based on cont=
ention.
<6>[    0.245877] Console: colour dummy device 80x25
<6>[    0.245881] printk: legacy console [tty1] enabled
<6>[    0.245935] ACPI: Core revision 20230628
<6>[    0.246465] hpet: HPET dysfunctional in PC10. Force disabled.
<6>[    0.246467] APIC: Switch to symmetric I/O mode setup
<6>[    0.248434] x2apic: IRQ remapping doesn't support X2APIC mode
<6>[    0.254425] clocksource: tsc-early: mask: 0xffffffffffffffff max_cy=
cles: 0x212717146a7, max_idle_ns: 440795291431 ns
<6>[    0.254436] Calibrating delay loop (skipped), value calculated usin=
g timer frequency.. 4599.93 BogoMIPS (lpj=3D2299968)
<6>[    0.254481] CPU0: Thermal monitoring enabled (TM1)
<6>[    0.254560] process: using mwait in idle threads
<6>[    0.254567] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
<6>[    0.254570] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
<6>[    0.254575] Spectre V1 : Mitigation: usercopy/swapgs barriers and _=
_user pointer sanitization
<6>[    0.254583] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
<6>[    0.254584] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Fillin=
g RSB on context switch
<6>[    0.254586] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single =
CALL on VMEXIT
<6>[    0.254587] RETBleed: Mitigation: Enhanced IBRS
<6>[    0.254592] Spectre V2 : mitigation: Enabling conditional Indirect =
Branch Prediction Barrier
<6>[    0.254598] Speculative Store Bypass: Mitigation: Speculative Store=
 Bypass disabled via prctl
<6>[    0.254609] MMIO Stale Data: Mitigation: Clear CPU buffers
<6>[    0.254612] SRBDS: Mitigation: Microcode
<6>[    0.254616] GDS: Mitigation: Microcode
<6>[    0.254623] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating =
point registers'
<6>[    0.254626] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers=
'
<6>[    0.254627] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers=
'
<6>[    0.254629] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds re=
gisters'
<6>[    0.254630] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
<6>[    0.254632] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
<6>[    0.254635] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
<6>[    0.254637] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
<6>[    0.254639] x86/fpu: Enabled xstate features 0x1f, context size is =
960 bytes, using 'compacted' format.
<6>[    0.255431] Freeing SMP alternatives memory: 48K
<6>[    0.255431] pid_max: default: 32768 minimum: 301
<6>[    0.255431] LSM: initializing lsm=3Dcapability,sina
<6>[    0.255431] Mount-cache hash table entries: 65536 (order: 7, 524288=
 bytes, linear)
<6>[    0.255431] Mountpoint-cache hash table entries: 65536 (order: 7, 5=
24288 bytes, linear)
<6>[    0.255431] smpboot: CPU0: Intel(R) Core(TM) i7-10510U CPU @ 1.80GH=
z (family: 0x6, model: 0x8e, stepping: 0xc)
<6>[    0.255431] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_=
adjust=3D1.
<6>[    0.255431] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_tas=
k_cb_adjust=3D1.
<6>[    0.255431] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_ta=
sk_cb_adjust=3D1.
<6>[    0.255431] Performance Events: PEBS fmt3+, Skylake events, 32-deep=
 LBR, full-width counters, Intel PMU driver.
<6>[    0.255431] ... version:                4
<6>[    0.255431] ... bit width:              48
<6>[    0.255431] ... generic registers:      4
<6>[    0.255431] ... value mask:             0000ffffffffffff
<6>[    0.255431] ... max period:             00007fffffffffff
<6>[    0.255431] ... fixed-purpose events:   3
<6>[    0.255431] ... event mask:             000000070000000f
<6>[    0.255431] signal: max sigframe size: 1616
<6>[    0.255431] Estimated ratio of average max frequency by base freque=
ncy (times 1024): 1914
<6>[    0.257614] rcu: Hierarchical SRCU implementation.
<6>[    0.257616] rcu: 	Max phase no-delay instances is 400.
<6>[    0.258532] NMI watchdog: Enabled. Permanently consumes one hw-PMU =
counter.
<6>[    0.258619] smp: Bringing up secondary CPUs ...
<6>[    0.258718] smpboot: x86: Booting SMP configuration:
<6>[    0.258719] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
<4>[    0.263878] MMIO Stale Data CPU bug present and SMT on, data leak p=
ossible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/p=
rocessor_mmio_stale_data.html for more details.
<6>[    0.264467] smp: Brought up 1 node, 8 CPUs
<6>[    0.264467] smpboot: Max logical packages: 1
<6>[    0.264467] smpboot: Total of 8 processors activated (36799.48 Bogo=
MIPS)
<6>[    0.266581] devtmpfs: initialized
<6>[    0.267479] ACPI: PM: Registering ACPI NVS region [mem 0x98695000-0=
x99a1efff] (20488192 bytes)
<6>[    0.267821] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 1911260446275000 ns
<6>[    0.267828] futex hash table entries: 2048 (order: 5, 131072 bytes,=
 linear)
<6>[    0.267890] pinctrl core: initialized pinctrl subsystem
<6>[    0.268162] PM: RTC time: 13:18:48, date: 2024-02-16
<6>[    0.268855] NET: Registered PF_NETLINK/PF_ROUTE protocol family
<6>[    0.269131] ramoops: using module parameters
<6>[    0.270657] pstore: Using crash dump compression: deflate
<6>[    0.270659] pstore: Registered ramoops as persistent store backend
<6>[    0.270661] ramoops: using 0x2000000@0x188000000, ecc: 16
<6>[    0.270770] thermal_sys: Registered thermal governor 'step_wise'
<6>[    0.270773] thermal_sys: Registered thermal governor 'user_space'
<6>[    0.270790] cpuidle: using governor menu
<6>[    0.270890] Simple Boot Flag at 0x47 set to 0x1
<6>[    0.270890] ACPI FADT declares the system doesn't support PCIe ASPM=
, so disable it
<6>[    0.270890] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0=
=2E5
<6>[    0.271454] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)=
 for domain 0000 [bus 00-7f]
<6>[    0.271464] PCI: not using ECAM ([mem 0xf0000000-0xf7ffffff] not re=
served)
<6>[    0.271467] PCI: Using configuration type 1 for base access
<6>[    0.271587] kprobes: kprobe jump-optimization is enabled. All kprob=
es are optimized if possible.
<6>[    0.271600] HugeTLB: registered 2.00 MiB page size, pre-allocated 0=
 pages
<6>[    0.271600] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB pag=
e
<6>[    0.271600] ACPI: Added _OSI(Module Device)
<6>[    0.271600] ACPI: Added _OSI(Processor Device)
<6>[    0.271600] ACPI: Added _OSI(3.0 _SCP Extensions)
<6>[    0.271600] ACPI: Added _OSI(Processor Aggregator Device)
<6>[    0.357393] ACPI: 11 ACPI AML tables successfully acquired and load=
ed
<6>[    0.359151] ACPI: EC: EC started
<6>[    0.359153] ACPI: EC: interrupt blocked
<6>[    0.360408] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
<6>[    0.360412] ACPI: EC: Boot ECDT EC used to handle transactions
<5>[    0.363067] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
<6>[    0.427182] ACPI: Dynamic OEM Table Load:
<6>[    0.427201] ACPI: SSDT 0xFFFF986080C18000 000400 (v02 PmRef  Cpu0Cs=
t  00003001 INTL 20160527)
<6>[    0.428864] ACPI: Dynamic OEM Table Load:
<6>[    0.428879] ACPI: SSDT 0xFFFF986080C11000 00061E (v02 PmRef  Cpu0Is=
t  00003000 INTL 20160527)
<6>[    0.431574] ACPI: Dynamic OEM Table Load:
<6>[    0.431586] ACPI: SSDT 0xFFFF986080C38000 0000FC (v02 PmRef  Cpu0Ps=
d  00003000 INTL 20160527)
<6>[    0.433160] ACPI: Dynamic OEM Table Load:
<6>[    0.433172] ACPI: SSDT 0xFFFF986081DB4000 00016C (v02 PmRef  Cpu0Hw=
p  00003000 INTL 20160527)
<6>[    0.434721] ACPI: Dynamic OEM Table Load:
<6>[    0.434737] ACPI: SSDT 0xFFFF986080C20000 000BEA (v02 PmRef  HwpLvt=
   00003000 INTL 20160527)
<6>[    0.436580] ACPI: Dynamic OEM Table Load:
<6>[    0.436596] ACPI: SSDT 0xFFFF986080C12800 000778 (v02 PmRef  ApIst =
   00003000 INTL 20160527)
<6>[    0.438370] ACPI: Dynamic OEM Table Load:
<6>[    0.438382] ACPI: SSDT 0xFFFF986080C18400 0003D7 (v02 PmRef  ApHwp =
   00003000 INTL 20160527)
<6>[    0.440151] ACPI: Dynamic OEM Table Load:
<6>[    0.440166] ACPI: SSDT 0xFFFF986080C21000 000D22 (v02 PmRef  ApPsd =
   00003000 INTL 20160527)
<6>[    0.442580] ACPI: Dynamic OEM Table Load:
<6>[    0.442592] ACPI: SSDT 0xFFFF986080C18800 0003CA (v02 PmRef  ApCst =
   00003000 INTL 20160527)
<6>[    0.447067] ACPI: _OSC evaluated successfully for all CPUs
<6>[    0.447070] ACPI: Interpreter enabled
<6>[    0.447123] ACPI: PM: (supports S0 S3 S5)
<6>[    0.447125] ACPI: Using IOAPIC for interrupt routing
<6>[    0.447178] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)=
 for domain 0000 [bus 00-7f]
<6>[    0.448413] PCI: ECAM [mem 0xf0000000-0xf7ffffff] reserved as ACPI =
motherboard resource
<6>[    0.448429] PCI: Using host bridge windows from ACPI; if necessary,=
 use "pci=3Dnocrs" and report a bug
<6>[    0.448431] PCI: Using E820 reservations for host bridge windows
<6>[    0.448962] ACPI: Enabled 7 GPEs in block 00 to 7F
<6>[    0.453831] ACPI: \_SB_.PCI0.LPCB.EC__.PUBS: New power resource
<6>[    0.457894] ACPI: \_SB_.PCI0.XHC_.RHUB.HS10.BTPR: New power resourc=
e
<6>[    0.459577] ACPI: \_SB_.PCI0.XDCI.USBC: New power resource
<6>[    0.461770] ACPI: \_SB_.PCI0.RP05.PXP_: New power resource
<6>[    0.465277] ACPI: \_SB_.PCI0.RP07.PXP_: New power resource
<6>[    0.472558] ACPI: \_SB_.PCI0.SAT0.VOL0.V0PR: New power resource
<6>[    0.472773] ACPI: \_SB_.PCI0.SAT0.VOL1.V1PR: New power resource
<6>[    0.472974] ACPI: \_SB_.PCI0.SAT0.VOL2.V2PR: New power resource
<6>[    0.474713] ACPI: \_SB_.PCI0.CNVW.WRST: New power resource
<6>[    0.479449] ACPI: \PIN_: New power resource
<6>[    0.479485] ACPI: \PINP: New power resource
<6>[    0.480079] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
<6>[    0.480089] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM=
 ClockPM Segments MSI HPX-Type3]
<6>[    0.482724] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHP=
CHotplug PME PCIeCapability LTR]
<6>[    0.482728] acpi PNP0A08:00: FADT indicates ASPM is unsupported, us=
ing BIOS configuration
<6>[    0.484807] PCI host bridge to bus 0000:00
<6>[    0.484810] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 w=
indow]
<6>[    0.484814] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff w=
indow]
<6>[    0.484817] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x00=
0bffff window]
<6>[    0.484819] pci_bus 0000:00: root bus resource [mem 0x9f800000-0xef=
ffffff window]
<6>[    0.484821] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe=
7fffff window]
<6>[    0.484824] pci_bus 0000:00: root bus resource [bus 00-7e]
<6>[    0.484859] pci 0000:00:00.0: [8086:9b61] type 00 class 0x060000 co=
nventional PCI endpoint
<6>[    0.484990] pci 0000:00:02.0: [8086:9b41] type 00 class 0x030000 PC=
Ie Root Complex Integrated Endpoint
<6>[    0.485005] pci 0000:00:02.0: BAR 0 [mem 0xe9000000-0xe9ffffff 64bi=
t]
<6>[    0.485015] pci 0000:00:02.0: BAR 2 [mem 0xa0000000-0xbfffffff 64bi=
t pref]
<6>[    0.485022] pci 0000:00:02.0: BAR 4 [io  0x4000-0x403f]
<6>[    0.485046] pci 0000:00:02.0: BAR 2: assigned to efifb
<6>[    0.485051] pci 0000:00:02.0: Video device with shadowed ROM at [me=
m 0x000c0000-0x000dffff]
<6>[    0.485281] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000 co=
nventional PCI endpoint
<6>[    0.485296] pci 0000:00:04.0: BAR 0 [mem 0xeb730000-0xeb737fff 64bi=
t]
<6>[    0.485693] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000 co=
nventional PCI endpoint
<6>[    0.485710] pci 0000:00:08.0: BAR 0 [mem 0xeb742000-0xeb742fff 64bi=
t]
<6>[    0.485848] pci 0000:00:12.0: [8086:02f9] type 00 class 0x118000 co=
nventional PCI endpoint
<6>[    0.485870] pci 0000:00:12.0: BAR 0 [mem 0xeb743000-0xeb743fff 64bi=
t]
<6>[    0.486040] pci 0000:00:14.0: [8086:02ed] type 00 class 0x0c0330 co=
nventional PCI endpoint
<6>[    0.486061] pci 0000:00:14.0: BAR 0 [mem 0xeb720000-0xeb72ffff 64bi=
t]
<6>[    0.486140] pci 0000:00:14.0: PME# supported from D3hot D3cold
<6>[    0.486641] pci 0000:00:14.2: [8086:02ef] type 00 class 0x050000 co=
nventional PCI endpoint
<6>[    0.486664] pci 0000:00:14.2: BAR 0 [mem 0xeb740000-0xeb741fff 64bi=
t]
<6>[    0.486678] pci 0000:00:14.2: BAR 2 [mem 0xeb744000-0xeb744fff 64bi=
t]
<6>[    0.486833] pci 0000:00:14.3: [8086:02f0] type 00 class 0x028000 PC=
Ie Root Complex Integrated Endpoint
<6>[    0.486869] pci 0000:00:14.3: BAR 0 [mem 0xeb738000-0xeb73bfff 64bi=
t]
<6>[    0.487006] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
<6>[    0.487272] pci 0000:00:16.0: [8086:02e0] type 00 class 0x078000 co=
nventional PCI endpoint
<6>[    0.487297] pci 0000:00:16.0: BAR 0 [mem 0xeb745000-0xeb745fff 64bi=
t]
<6>[    0.487387] pci 0000:00:16.0: PME# supported from D3hot
<6>[    0.487823] pci 0000:00:1c.0: [8086:02b8] type 01 class 0x060400 PC=
Ie Root Port
<6>[    0.487852] pci 0000:00:1c.0: PCI bridge to [bus 02]
<6>[    0.487859] pci 0000:00:1c.0:   bridge window [mem 0xeb600000-0xeb6=
fffff]
<6>[    0.487940] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
<6>[    0.488629] pci 0000:00:1c.4: [8086:02bc] type 01 class 0x060400 PC=
Ie Root Port
<6>[    0.488658] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
<6>[    0.488665] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xe81=
fffff]
<6>[    0.488675] pci 0000:00:1c.4:   bridge window [mem 0xc0000000-0xdbf=
fffff 64bit pref]
<6>[    0.488750] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
<6>[    0.489428] pci 0000:00:1d.0: [8086:02b0] type 01 class 0x060400 PC=
Ie Root Port
<6>[    0.489459] pci 0000:00:1d.0: PCI bridge to [bus 2d]
<6>[    0.489465] pci 0000:00:1d.0:   bridge window [io  0x3000-0x3fff]
<6>[    0.489469] pci 0000:00:1d.0:   bridge window [mem 0xeac00000-0xeb5=
fffff]
<6>[    0.489480] pci 0000:00:1d.0:   bridge window [mem 0xea000000-0xea9=
fffff 64bit pref]
<6>[    0.489556] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
<6>[    0.490199] pci 0000:00:1d.4: [8086:02b4] type 01 class 0x060400 PC=
Ie Root Port
<6>[    0.490230] pci 0000:00:1d.4: PCI bridge to [bus 2e]
<6>[    0.490237] pci 0000:00:1d.4:   bridge window [mem 0xeab00000-0xeab=
fffff]
<6>[    0.490322] pci 0000:00:1d.4: PME# supported from D0 D3hot D3cold
<6>[    0.491016] pci 0000:00:1f.0: [8086:0284] type 00 class 0x060100 co=
nventional PCI endpoint
<6>[    0.491659] pci 0000:00:1f.3: [8086:02c8] type 00 class 0x040380 co=
nventional PCI endpoint
<6>[    0.491712] pci 0000:00:1f.3: BAR 0 [mem 0xeb73c000-0xeb73ffff 64bi=
t]
<6>[    0.491777] pci 0000:00:1f.3: BAR 4 [mem 0xeaa00000-0xeaafffff 64bi=
t]
<6>[    0.491908] pci 0000:00:1f.3: PME# supported from D3hot D3cold
<6>[    0.492405] pci 0000:00:1f.4: [8086:02a3] type 00 class 0x0c0500 co=
nventional PCI endpoint
<6>[    0.492440] pci 0000:00:1f.4: BAR 0 [mem 0xeb746000-0xeb7460ff 64bi=
t]
<6>[    0.492474] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
<6>[    0.492841] pci 0000:00:1f.5: [8086:02a4] type 00 class 0x0c8000 co=
nventional PCI endpoint
<6>[    0.492861] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
<6>[    0.493022] pci 0000:00:1f.6: [8086:0d4f] type 00 class 0x020000 co=
nventional PCI endpoint
<6>[    0.493067] pci 0000:00:1f.6: BAR 0 [mem 0xeb700000-0xeb71ffff]
<6>[    0.493303] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
<6>[    0.493499] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000 PC=
Ie Endpoint
<6>[    0.493525] pci 0000:02:00.0: BAR 0 [mem 0xeb600000-0xeb600fff]
<6>[    0.493695] pci 0000:02:00.0: supports D1 D2
<6>[    0.493697] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3col=
d
<6>[    0.493960] pci 0000:00:1c.0: PCI bridge to [bus 02]
<6>[    0.494052] pci 0000:03:00.0: [8086:15c0] type 01 class 0x060400 PC=
Ie Switch Upstream Port
<6>[    0.494092] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
<6>[    0.494104] pci 0000:03:00.0:   bridge window [mem 0xdc000000-0xe81=
fffff]
<6>[    0.494119] pci 0000:03:00.0:   bridge window [mem 0xc0000000-0xdbf=
fffff 64bit pref]
<6>[    0.494135] pci 0000:03:00.0: enabling Extended Tags
<6>[    0.494241] pci 0000:03:00.0: supports D1 D2
<6>[    0.494243] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3=
cold
<6>[    0.494439] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
<6>[    0.494536] pci 0000:04:00.0: [8086:15c0] type 01 class 0x060400 PC=
Ie Switch Downstream Port
<6>[    0.494578] pci 0000:04:00.0: PCI bridge to [bus 05]
<6>[    0.494589] pci 0000:04:00.0:   bridge window [mem 0xe8100000-0xe81=
fffff]
<6>[    0.494621] pci 0000:04:00.0: enabling Extended Tags
<6>[    0.494724] pci 0000:04:00.0: supports D1 D2
<6>[    0.494726] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3=
cold
<6>[    0.494883] pci 0000:04:01.0: [8086:15c0] type 01 class 0x060400 PC=
Ie Switch Downstream Port
<6>[    0.494924] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
<6>[    0.494936] pci 0000:04:01.0:   bridge window [mem 0xdc100000-0xe80=
fffff]
<6>[    0.494950] pci 0000:04:01.0:   bridge window [mem 0xc0000000-0xdbf=
fffff 64bit pref]
<6>[    0.494970] pci 0000:04:01.0: enabling Extended Tags
<6>[    0.495080] pci 0000:04:01.0: supports D1 D2
<6>[    0.495081] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3=
cold
<6>[    0.495236] pci 0000:04:02.0: [8086:15c0] type 01 class 0x060400 PC=
Ie Switch Downstream Port
<6>[    0.495277] pci 0000:04:02.0: PCI bridge to [bus 2b]
<6>[    0.495289] pci 0000:04:02.0:   bridge window [mem 0xdc000000-0xdc0=
fffff]
<6>[    0.495320] pci 0000:04:02.0: enabling Extended Tags
<6>[    0.495421] pci 0000:04:02.0: supports D1 D2
<6>[    0.495423] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3=
cold
<6>[    0.495617] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
<6>[    0.495713] pci 0000:05:00.0: [8086:15bf] type 00 class 0x088000 PC=
Ie Endpoint
<6>[    0.495735] pci 0000:05:00.0: BAR 0 [mem 0xe8100000-0xe813ffff]
<6>[    0.495745] pci 0000:05:00.0: BAR 1 [mem 0xe8140000-0xe8140fff]
<6>[    0.495799] pci 0000:05:00.0: enabling Extended Tags
<6>[    0.495920] pci 0000:05:00.0: supports D1 D2
<6>[    0.495922] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3=
cold
<6>[    0.496105] pci 0000:04:00.0: PCI bridge to [bus 05]
<6>[    0.496172] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
<6>[    0.496280] pci 0000:2b:00.0: [8086:15c1] type 00 class 0x0c0330 PC=
Ie Endpoint
<6>[    0.496306] pci 0000:2b:00.0: BAR 0 [mem 0xdc000000-0xdc00ffff]
<6>[    0.496394] pci 0000:2b:00.0: enabling Extended Tags
<6>[    0.496523] pci 0000:2b:00.0: supports D1 D2
<6>[    0.496525] pci 0000:2b:00.0: PME# supported from D0 D1 D2 D3hot D3=
cold
<6>[    0.496593] pci 0000:2b:00.0: 8.000 Gb/s available PCIe bandwidth, =
limited by 2.5 GT/s PCIe x4 link at 0000:04:02.0 (capable of 31.504 Gb/s =
with 8.0 GT/s PCIe x4 link)
<6>[    0.496764] pci 0000:04:02.0: PCI bridge to [bus 2b]
<6>[    0.496871] pci 0000:00:1d.0: PCI bridge to [bus 2d]
<6>[    0.496955] pci 0000:2e:00.0: [15b7:5006] type 00 class 0x010802 PC=
Ie Endpoint
<6>[    0.496981] pci 0000:2e:00.0: BAR 0 [mem 0xeab00000-0xeab03fff 64bi=
t]
<6>[    0.497016] pci 0000:2e:00.0: BAR 4 [mem 0xeab04000-0xeab040ff 64bi=
t]
<6>[    0.497289] pci 0000:00:1d.4: PCI bridge to [bus 2e]
<7>[    0.497322] pci_bus 0000:00: on NUMA node 0
<6>[    0.500539] ACPI: EC: interrupt unblocked
<6>[    0.500541] ACPI: EC: event unblocked
<6>[    0.500553] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
<6>[    0.500555] ACPI: EC: GPE=3D0x16
<6>[    0.500557] ACPI: \_SB_.PCI0.LPCB.EC__: Boot ECDT EC initialization=
 complete
<6>[    0.500561] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle transact=
ions and events
<6>[    0.500656] iommu: Default domain type: Translated
<6>[    0.500658] iommu: DMA domain TLB invalidation policy: lazy mode
<5>[    0.500754] SCSI subsystem initialized
<7>[    0.500764] libata version 3.00 loaded.
<6>[    0.500764] ACPI: bus type USB registered
<6>[    0.500764] usbcore: registered new interface driver usbfs
<6>[    0.500764] usbcore: registered new interface driver hub
<6>[    0.500764] usbcore: registered new device driver usb
<6>[    0.500764] pps_core: LinuxPPS API ver. 1 registered
<6>[    0.500764] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rod=
olfo Giometti <giometti@linux.it>
<6>[    0.500764] PTP clock support registered
<6>[    0.500764] Advanced Linux Sound Architecture Driver Initialized.
<6>[    0.500884] NetLabel: Initializing
<6>[    0.500886] NetLabel:  domain hash size =3D 128
<6>[    0.500888] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
<6>[    0.500911] NetLabel:  unlabeled traffic allowed by default
<6>[    0.501459] PCI: Using ACPI for IRQ routing
<7>[    0.517540] PCI: pci_cache_line_size set to 64 bytes
<7>[    0.517682] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
<7>[    0.517685] e820: reserve RAM buffer [mem 0x944b7000-0x97ffffff]
<7>[    0.517687] e820: reserve RAM buffer [mem 0x99b50000-0x9bffffff]
<7>[    0.517689] e820: reserve RAM buffer [mem 0x85e800000-0x85fffffff]
<6>[    0.519432] clocksource: Switched to clocksource tsc-early
<6>[    0.519620] pnp: PnP ACPI init
<6>[    0.519908] system 00:00: [io  0x1800-0x18fe] has been reserved
<6>[    0.519913] system 00:00: [mem 0xfd000000-0xfd69ffff] has been rese=
rved
<6>[    0.519916] system 00:00: [mem 0xfd6b0000-0xfd6cffff] has been rese=
rved
<6>[    0.519919] system 00:00: [mem 0xfd6f0000-0xfdffffff] has been rese=
rved
<6>[    0.519921] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be =
reserved
<6>[    0.519923] system 00:00: [mem 0xfe200000-0xfe7fffff] has been rese=
rved
<6>[    0.519925] system 00:00: [mem 0xff000000-0xffffffff] has been rese=
rved
<6>[    0.520257] system 00:01: [io  0x2000-0x20fe] has been reserved
<6>[    0.520815] system 00:02: [io  0x0680-0x069f] has been reserved
<6>[    0.520818] system 00:02: [io  0x164e-0x164f] has been reserved
<6>[    0.520983] system 00:04: [io  0x1854-0x1857] has been reserved
<6>[    0.521113] system 00:07: [io  0x1800-0x189f] could not be reserved=

<6>[    0.521116] system 00:07: [io  0x0800-0x087f] has been reserved
<6>[    0.521119] system 00:07: [io  0x0880-0x08ff] has been reserved
<6>[    0.521121] system 00:07: [io  0x0900-0x097f] has been reserved
<6>[    0.521123] system 00:07: [io  0x0980-0x09ff] has been reserved
<6>[    0.521125] system 00:07: [io  0x0a00-0x0a7f] has been reserved
<6>[    0.521127] system 00:07: [io  0x0a80-0x0aff] has been reserved
<6>[    0.521129] system 00:07: [io  0x0b00-0x0b7f] has been reserved
<6>[    0.521131] system 00:07: [io  0x0b80-0x0bff] has been reserved
<6>[    0.521133] system 00:07: [io  0x15e0-0x15ef] has been reserved
<6>[    0.521135] system 00:07: [io  0x1600-0x167f] could not be reserved=

<6>[    0.521137] system 00:07: [io  0x1640-0x165f] could not be reserved=

<6>[    0.521140] system 00:07: [mem 0xf0000000-0xf7ffffff] has been rese=
rved
<6>[    0.521142] system 00:07: [mem 0xfed10000-0xfed13fff] has been rese=
rved
<6>[    0.521144] system 00:07: [mem 0xfed18000-0xfed18fff] has been rese=
rved
<6>[    0.521146] system 00:07: [mem 0xfed19000-0xfed19fff] has been rese=
rved
<6>[    0.521148] system 00:07: [mem 0xfeb00000-0xfebfffff] has been rese=
rved
<6>[    0.521151] system 00:07: [mem 0xfed20000-0xfed3ffff] has been rese=
rved
<6>[    0.521153] system 00:07: [mem 0xfed90000-0xfed93fff] has been rese=
rved
<6>[    0.521820] system 00:08: [mem 0xfed10000-0xfed17fff] could not be =
reserved
<6>[    0.521824] system 00:08: [mem 0xfed18000-0xfed18fff] has been rese=
rved
<6>[    0.521827] system 00:08: [mem 0xfed19000-0xfed19fff] has been rese=
rved
<6>[    0.521829] system 00:08: [mem 0xf0000000-0xf7ffffff] has been rese=
rved
<6>[    0.521831] system 00:08: [mem 0xfed20000-0xfed3ffff] has been rese=
rved
<6>[    0.521834] system 00:08: [mem 0xfed90000-0xfed93fff] has been rese=
rved
<6>[    0.521836] system 00:08: [mem 0xfed45000-0xfed8ffff] has been rese=
rved
<6>[    0.521838] system 00:08: [mem 0xfee00000-0xfeefffff] has been rese=
rved
<6>[    0.522070] system 00:09: [mem 0xfe038000-0xfe038fff] has been rese=
rved
<4>[    0.522373] pnp 00:0a: disabling [mem 0x000c0000-0x000c3fff] becaus=
e it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
<4>[    0.522379] pnp 00:0a: disabling [mem 0x000c8000-0x000cbfff] becaus=
e it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
<4>[    0.522382] pnp 00:0a: disabling [mem 0x000d0000-0x000d3fff] becaus=
e it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
<4>[    0.522385] pnp 00:0a: disabling [mem 0x000d8000-0x000dbfff] becaus=
e it overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
<6>[    0.522428] system 00:0a: [mem 0x00000000-0x0009ffff] could not be =
reserved
<6>[    0.522431] system 00:0a: [mem 0x000e0000-0x000e3fff] could not be =
reserved
<6>[    0.522433] system 00:0a: [mem 0x000e8000-0x000ebfff] could not be =
reserved
<6>[    0.522436] system 00:0a: [mem 0x000f0000-0x000fffff] could not be =
reserved
<6>[    0.522438] system 00:0a: [mem 0x00100000-0x9f7fffff] could not be =
reserved
<6>[    0.522441] system 00:0a: [mem 0xfec00000-0xfed3ffff] could not be =
reserved
<6>[    0.522443] system 00:0a: [mem 0xfed4c000-0xffffffff] could not be =
reserved
<6>[    0.522530] pnp: PnP ACPI: found 11 devices
<6>[    0.528739] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffff=
ff, max_idle_ns: 2085701024 ns
<6>[    0.528860] NET: Registered PF_INET protocol family
<6>[    0.529078] IP idents hash table entries: 262144 (order: 9, 2097152=
 bytes, linear)
<6>[    0.533794] tcp_listen_portaddr_hash hash table entries: 16384 (ord=
er: 6, 262144 bytes, linear)
<6>[    0.533839] Table-perturb hash table entries: 65536 (order: 6, 2621=
44 bytes, linear)
<6>[    0.533857] TCP established hash table entries: 262144 (order: 9, 2=
097152 bytes, linear)
<6>[    0.534225] TCP bind hash table entries: 65536 (order: 9, 2097152 b=
ytes, linear)
<6>[    0.534675] TCP: Hash tables configured (established 262144 bind 65=
536)
<6>[    0.534706] UDP hash table entries: 16384 (order: 7, 524288 bytes, =
linear)
<6>[    0.534791] UDP-Lite hash table entries: 16384 (order: 7, 524288 by=
tes, linear)
<6>[    0.534900] NET: Registered PF_UNIX/PF_LOCAL protocol family
<6>[    0.535444] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to =
[bus 06-2a] add_size 1000
<6>[    0.535452] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to =
[bus 04-2b] add_size 1000
<6>[    0.535455] pci 0000:00:1c.4: bridge window [io  0x1000-0x0fff] to =
[bus 03-2b] add_size 2000
<6>[    0.535465] pci 0000:00:1c.4: bridge window [io  0x5000-0x6fff]: as=
signed
<6>[    0.535469] pci 0000:00:1c.0: PCI bridge to [bus 02]
<6>[    0.535475] pci 0000:00:1c.0:   bridge window [mem 0xeb600000-0xeb6=
fffff]
<6>[    0.535484] pci 0000:03:00.0: bridge window [io  0x5000-0x5fff]: as=
signed
<6>[    0.535487] pci 0000:04:01.0: bridge window [io  0x5000-0x5fff]: as=
signed
<6>[    0.535490] pci 0000:04:00.0: PCI bridge to [bus 05]
<6>[    0.535496] pci 0000:04:00.0:   bridge window [mem 0xe8100000-0xe81=
fffff]
<6>[    0.535507] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
<6>[    0.535510] pci 0000:04:01.0:   bridge window [io  0x5000-0x5fff]
<6>[    0.535517] pci 0000:04:01.0:   bridge window [mem 0xdc100000-0xe80=
fffff]
<6>[    0.535521] pci 0000:04:01.0:   bridge window [mem 0xc0000000-0xdbf=
fffff 64bit pref]
<6>[    0.535529] pci 0000:04:02.0: PCI bridge to [bus 2b]
<6>[    0.535536] pci 0000:04:02.0:   bridge window [mem 0xdc000000-0xdc0=
fffff]
<6>[    0.535546] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
<6>[    0.535549] pci 0000:03:00.0:   bridge window [io  0x5000-0x5fff]
<6>[    0.535555] pci 0000:03:00.0:   bridge window [mem 0xdc000000-0xe81=
fffff]
<6>[    0.535560] pci 0000:03:00.0:   bridge window [mem 0xc0000000-0xdbf=
fffff 64bit pref]
<6>[    0.535567] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
<6>[    0.535570] pci 0000:00:1c.4:   bridge window [io  0x5000-0x6fff]
<6>[    0.535575] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xe81=
fffff]
<6>[    0.535579] pci 0000:00:1c.4:   bridge window [mem 0xc0000000-0xdbf=
fffff 64bit pref]
<6>[    0.535584] pci 0000:00:1d.0: PCI bridge to [bus 2d]
<6>[    0.535606] pci 0000:00:1d.0:   bridge window [io  0x3000-0x3fff]
<6>[    0.535616] pci 0000:00:1d.0:   bridge window [mem 0xeac00000-0xeb5=
fffff]
<6>[    0.535620] pci 0000:00:1d.0:   bridge window [mem 0xea000000-0xea9=
fffff 64bit pref]
<6>[    0.535632] pci 0000:00:1d.4: PCI bridge to [bus 2e]
<6>[    0.535637] pci 0000:00:1d.4:   bridge window [mem 0xeab00000-0xeab=
fffff]
<6>[    0.535645] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
<6>[    0.535648] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
<6>[    0.535651] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff =
window]
<6>[    0.535653] pci_bus 0000:00: resource 7 [mem 0x9f800000-0xefffffff =
window]
<6>[    0.535655] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff =
window]
<6>[    0.535657] pci_bus 0000:02: resource 1 [mem 0xeb600000-0xeb6fffff]=

<6>[    0.535660] pci_bus 0000:03: resource 0 [io  0x5000-0x6fff]
<6>[    0.535662] pci_bus 0000:03: resource 1 [mem 0xdc000000-0xe81fffff]=

<6>[    0.535663] pci_bus 0000:03: resource 2 [mem 0xc0000000-0xdbffffff =
64bit pref]
<6>[    0.535666] pci_bus 0000:04: resource 0 [io  0x5000-0x5fff]
<6>[    0.535668] pci_bus 0000:04: resource 1 [mem 0xdc000000-0xe81fffff]=

<6>[    0.535669] pci_bus 0000:04: resource 2 [mem 0xc0000000-0xdbffffff =
64bit pref]
<6>[    0.535672] pci_bus 0000:05: resource 1 [mem 0xe8100000-0xe81fffff]=

<6>[    0.535674] pci_bus 0000:06: resource 0 [io  0x5000-0x5fff]
<6>[    0.535676] pci_bus 0000:06: resource 1 [mem 0xdc100000-0xe80fffff]=

<6>[    0.535678] pci_bus 0000:06: resource 2 [mem 0xc0000000-0xdbffffff =
64bit pref]
<6>[    0.535680] pci_bus 0000:2b: resource 1 [mem 0xdc000000-0xdc0fffff]=

<6>[    0.535682] pci_bus 0000:2d: resource 0 [io  0x3000-0x3fff]
<6>[    0.535684] pci_bus 0000:2d: resource 1 [mem 0xeac00000-0xeb5fffff]=

<6>[    0.535686] pci_bus 0000:2d: resource 2 [mem 0xea000000-0xea9fffff =
64bit pref]
<6>[    0.535688] pci_bus 0000:2e: resource 1 [mem 0xeab00000-0xeabfffff]=

<6>[    0.536683] PCI: CLS 0 bytes, default 64
<6>[    0.536693] DMAR: Host address width 39
<6>[    0.536695] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
<6>[    0.536708] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c=
40660462 ecap 19e2ff0505e
<6>[    0.536712] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
<6>[    0.536720] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c4=
0660462 ecap f050da
<6>[    0.536723] DMAR: RMRR base: 0x0000009864f000 end: 0x0000009866efff=

<6>[    0.536726] DMAR: RMRR base: 0x0000009b000000 end: 0x0000009f7fffff=

<6>[    0.536738] DMAR: No ATSR found
<6>[    0.536738] Unpacking initramfs...
<6>[    0.536740] DMAR: No SATC found
<6>[    0.536748] DMAR: dmar1: Using Queued invalidation
<6>[    0.536838] pci 0000:00:00.0: Adding to iommu group 0
<6>[    0.536854] pci 0000:00:04.0: Adding to iommu group 1
<6>[    0.536869] pci 0000:00:08.0: Adding to iommu group 2
<6>[    0.536891] pci 0000:00:12.0: Adding to iommu group 3
<6>[    0.536918] pci 0000:00:14.0: Adding to iommu group 4
<6>[    0.536931] pci 0000:00:14.2: Adding to iommu group 4
<6>[    0.536946] pci 0000:00:14.3: Adding to iommu group 5
<6>[    0.536967] pci 0000:00:16.0: Adding to iommu group 6
<6>[    0.536986] pci 0000:00:1c.0: Adding to iommu group 7
<6>[    0.537009] pci 0000:00:1c.4: Adding to iommu group 8
<6>[    0.537033] pci 0000:00:1d.0: Adding to iommu group 9
<6>[    0.537049] pci 0000:00:1d.4: Adding to iommu group 10
<6>[    0.537097] pci 0000:00:1f.0: Adding to iommu group 11
<6>[    0.537112] pci 0000:00:1f.3: Adding to iommu group 11
<6>[    0.537127] pci 0000:00:1f.4: Adding to iommu group 11
<6>[    0.537143] pci 0000:00:1f.5: Adding to iommu group 11
<6>[    0.537160] pci 0000:00:1f.6: Adding to iommu group 11
<6>[    0.537177] pci 0000:02:00.0: Adding to iommu group 12
<6>[    0.537193] pci 0000:03:00.0: Adding to iommu group 13
<6>[    0.537210] pci 0000:04:00.0: Adding to iommu group 14
<6>[    0.537227] pci 0000:04:01.0: Adding to iommu group 15
<6>[    0.537243] pci 0000:04:02.0: Adding to iommu group 16
<6>[    0.537249] pci 0000:05:00.0: Adding to iommu group 14
<6>[    0.537254] pci 0000:2b:00.0: Adding to iommu group 16
<6>[    0.537270] pci 0000:2e:00.0: Adding to iommu group 17
<6>[    0.538250] DMAR: Intel(R) Virtualization Technology for Directed I=
/O
<6>[    0.538252] PCI-DMA: Using software bounce buffering for IO (SWIOTL=
B)
<6>[    0.538254] software IO TLB: mapped [mem 0x000000008d1d8000-0x00000=
000911d8000] (64MB)
<6>[    0.538264] ACPI: bus type thunderbolt registered
<6>[    0.538393] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002=
)
<6>[    0.717819] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 6=
55360 ms ovfl timer
<6>[    0.717823] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
<6>[    0.717825] RAPL PMU: hw unit of domain package 2^-14 Joules
<6>[    0.717826] RAPL PMU: hw unit of domain dram 2^-14 Joules
<6>[    0.717828] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
<6>[    0.717829] RAPL PMU: hw unit of domain psys 2^-14 Joules
<4>[    0.717945] resource: resource sanity check: requesting [mem 0x0000=
0000fed10000-0x00000000fed15fff], which spans more than pnp 00:07 [mem 0x=
fed10000-0xfed13fff]
<4>[    0.717950] caller snb_uncore_imc_init_box+0x84/0xe0 mapping multip=
le BARs
<5>[    0.719944] Initialise system trusted keyrings
<6>[    0.720004] workingset: timestamp_bits=3D62 max_order=3D23 bucket_o=
rder=3D0
<6>[    0.720080] squashfs: version 4.0 (2009/01/31) Phillip Lougher
<6>[    0.720120] 9p: Installing v9fs 9p2000 file system support
<6>[    0.742266] NET: Registered PF_ALG protocol family
<5>[    0.742270] Key type asymmetric registered
<5>[    0.742271] Asymmetric key parser 'x509' registered
<6>[    0.742287] Block layer SCSI generic (bsg) driver version 0.4 loade=
d (major 249)
<6>[    0.742290] io scheduler mq-deadline registered
<6>[    0.742292] io scheduler kyber registered
<6>[    0.744062] pcieport 0000:00:1c.0: PME: Signaling with IRQ 137
<6>[    0.744234] pcieport 0000:00:1c.4: PME: Signaling with IRQ 138
<6>[    0.744269] pcieport 0000:00:1c.4: pciehp: Slot #4 AttnBtn- PwrCtrl=
- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis-=
 LLActRep+
<6>[    0.744537] pcieport 0000:00:1d.0: PME: Signaling with IRQ 139
<6>[    0.744577] pcieport 0000:00:1d.0: pciehp: Slot #0 AttnBtn- PwrCtrl=
- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis-=
 LLActRep+
<6>[    0.744957] pcieport 0000:00:1d.4: PME: Signaling with IRQ 140
<6>[    0.745475] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl=
- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis-=
 LLActRep+
<6>[    0.745889] shpchp: Standard Hot Plug PCI Controller Driver version=
: 0.4
<3>[    0.751739] acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace fail=
ed
<6>[    0.753479] ACPI: AC: AC Adapter [AC] (off-line)
<6>[    0.753578] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00=
/PNP0C0E:00/input/input0
<6>[    0.753747] ACPI: button: Sleep Button [SLPB]
<6>[    0.753816] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/P=
NP0C0D:00/input/input1
<6>[    0.754073] ACPI: button: Lid Switch [LID]
<6>[    0.754139] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00=
/input/input2
<6>[    0.754442] ACPI: button: Power Button [PWRF]
<6>[    0.762698] thermal LNXTHERM:00: registered as thermal_zone0
<6>[    0.762703] ACPI: thermal: Thermal Zone [THM0] (49 C)
<6>[    0.763905] Serial: 8250/16550 driver, 4 ports, IRQ sharing disable=
d
<6>[    0.765076] Non-volatile memory driver v1.3
<6>[    0.765161] Linux agpgart interface v0.103
<6>[    0.765362] ACPI: bus type drm_connector registered
<6>[    0.765714] i915 0000:00:02.0: enabling device (0006 -> 0007)
<6>[    0.805790] ACPI: battery: Slot [BAT0] (battery present)
<6>[    1.453639] [drm] drm_dp_dpcd_access UNKNOWN via AUX B/DDI B/PHY B:=
 Too many retries, giving up. First error: -110, First reply: 0x0, Last r=
eply: 0x0, Request: 0x9, Address: 0x0, Size: 0x1
<6>[    1.757695] tsc: Refined TSC clocksource calibration: 2304.002 MHz
<6>[    1.757714] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: =
0x2135f9f0f74, max_idle_ns: 440795301392 ns
<6>[    1.757746] clocksource: Switched to clocksource tsc
<6>[    2.093639] [drm] drm_dp_dpcd_access UNKNOWN via AUX B/DDI B/PHY B:=
 Too many retries, giving up. First error: -110, First reply: 0x0, Last r=
eply: 0x0, Request: 0x9, Address: 0x0, Size: 0x1
<6>[    2.734638] [drm] drm_dp_dpcd_access UNKNOWN via AUX C/DDI C/PHY C:=
 Too many retries, giving up. First error: -110, First reply: 0x0, Last r=
eply: 0x0, Request: 0x9, Address: 0x0, Size: 0x1
<6>[    3.374638] [drm] drm_dp_dpcd_access UNKNOWN via AUX C/DDI C/PHY C:=
 Too many retries, giving up. First error: -110, First reply: 0x0, Last r=
eply: 0x0, Request: 0x9, Address: 0x0, Size: 0x1
<6>[    3.388348] [drm] Initialized i915 1.6.0 20230929 for 0000:00:02.0 =
on minor 0
<6>[    3.393418] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:=
 no  post: no)
<6>[    3.393745] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0A08:00/LNXVIDEO:00/input/input3
<7>[    3.393907] i915 display info: display version: 9
<7>[    3.393913] i915 display info: cursor_needs_physical: no
<7>[    3.393917] i915 display info: has_cdclk_crawl: no
<7>[    3.393921] i915 display info: has_cdclk_squash: no
<7>[    3.393924] i915 display info: has_ddi: yes
<7>[    3.393927] i915 display info: has_dp_mst: yes
<7>[    3.393930] i915 display info: has_dsb: no
<7>[    3.393933] i915 display info: has_fpga_dbg: yes
<7>[    3.393936] i915 display info: has_gmch: no
<7>[    3.393940] i915 display info: has_hotplug: yes
<7>[    3.393943] i915 display info: has_hti: no
<7>[    3.393946] i915 display info: has_ipc: yes
<7>[    3.393948] i915 display info: has_overlay: no
<7>[    3.393950] i915 display info: has_psr: yes
<7>[    3.393952] i915 display info: has_psr_hw_tracking: yes
<7>[    3.393955] i915 display info: overlay_needs_physical: no
<7>[    3.393957] i915 display info: supports_tv: no
<7>[    3.393959] i915 display info: has_hdcp: yes
<7>[    3.393969] i915 display info: has_dmc: yes
<7>[    3.393973] i915 display info: has_dsc: no
<6>[    3.397917] loop: module loaded
<6>[    3.398145] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
<6>[    3.398714] nvme nvme0: pci function 0000:2e:00.0
<6>[    3.399192] tun: Universal TUN/TAP device driver, 1.6
<6>[    3.399293] e100: Intel(R) PRO/100 Network Driver
<6>[    3.399296] e100: Copyright(c) 1999-2006 Intel Corporation
<6>[    3.399313] e1000: Intel(R) PRO/1000 Network Driver
<6>[    3.399315] e1000: Copyright (c) 1999-2006 Intel Corporation.
<6>[    3.399331] e1000e: Intel(R) PRO/1000 Network Driver
<6>[    3.399333] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
<6>[    3.399666] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/se=
c) set to dynamic conservative mode
<6>[    3.407621] nvme nvme0: 8/0/0 default/read/poll queues
<6>[    3.412202]  nvme0n1: p3 p5
<6>[    3.433253] Console: switching to colour frame buffer device 240x67=

<6>[    3.453341] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer de=
vice
<6>[    3.635880] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): regis=
tered PHC clock
<6>[    3.700974] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1=
) 54:05:db:12:2a:f1
<6>[    3.700981] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Con=
nection
<6>[    3.701121] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: FFF=
FFF-0FF
<6>[    3.701153] Intel(R) 2.5G Ethernet Linux Driver
<6>[    3.701155] Copyright(c) 2018 Intel Corporation.
<6>[    3.701173] sky2: driver version 1.30
<6>[    3.701220] Intel(R) Wireless WiFi driver for Linux
<6>[    3.701263] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
<6>[    3.703846] iwlwifi 0000:00:14.3: Detected crf-id 0x3617, cnv-id 0x=
20000302 wfpm id 0x80000000
<6>[    3.703864] iwlwifi 0000:00:14.3: PCI dev 02f0/0074, rev=3D0x351, r=
fid=3D0x10a100
<6>[    3.703972] usbcore: registered new device driver r8152-cfgselector=

<6>[    3.703981] usbcore: registered new interface driver r8152
<6>[    3.703990] usbcore: registered new interface driver asix
<6>[    3.703998] usbcore: registered new interface driver ax88179_178a
<6>[    3.704005] usbcore: registered new interface driver cdc_ether
<6>[    3.704012] usbcore: registered new interface driver net1080
<6>[    3.704019] usbcore: registered new interface driver zaurus
<6>[    3.704028] usbcore: registered new interface driver cdc_ncm
<6>[    3.704035] usbcore: registered new interface driver qmi_wwan
<6>[    3.704043] usbcore: registered new interface driver cdc_mbim
<6>[    3.704050] usbcore: registered new interface driver r8153_ecm
<6>[    3.704465] xhci_hcd 0000:00:14.0: xHCI Host Controller
<6>[    3.704518] xhci_hcd 0000:00:14.0: new USB bus registered, assigned=
 bus number 1
<6>[    3.704534] xhci_hcd 0000:00:14.0: Disabled LPM!
<6>[    3.705723] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci versio=
n 0x110 quirks 0x0000000000009010
<6>[    3.705991] xhci_hcd 0000:00:14.0: xHCI Host Controller
<6>[    3.706090] xhci_hcd 0000:00:14.0: new USB bus registered, assigned=
 bus number 2
<6>[    3.706095] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced S=
uperSpeed
<6>[    3.706246] usb usb1: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0002, bcdDevice=3D 6.08
<6>[    3.706251] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,=
 SerialNumber=3D1
<6>[    3.706254] usb usb1: Product: xHCI Host Controller
<6>[    3.706256] usb usb1: Manufacturer: Linux 6.8.0-devel+ xhci-hcd
<6>[    3.706258] usb usb1: SerialNumber: 0000:00:14.0
<6>[    3.706565] hub 1-0:1.0: USB hub found
<6>[    3.706597] hub 1-0:1.0: 12 ports detected
<6>[    3.709796] usb usb2: We don't know the algorithms for LPM for this=
 host, disabling LPM.
<6>[    3.709853] usb usb2: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0003, bcdDevice=3D 6.08
<6>[    3.709858] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,=
 SerialNumber=3D1
<6>[    3.709862] usb usb2: Product: xHCI Host Controller
<6>[    3.709864] usb usb2: Manufacturer: Linux 6.8.0-devel+ xhci-hcd
<6>[    3.709866] usb usb2: SerialNumber: 0000:00:14.0
<6>[    3.710027] hub 2-0:1.0: USB hub found
<6>[    3.710048] hub 2-0:1.0: 6 ports detected
<4>[    3.711546] usb: port power management may be unreliable
<6>[    3.712147] xhci_hcd 0000:2b:00.0: xHCI Host Controller
<6>[    3.712253] xhci_hcd 0000:2b:00.0: new USB bus registered, assigned=
 bus number 3
<6>[    3.712274] xhci_hcd 0000:2b:00.0: Disabled LPM!
<6>[    3.713489] xhci_hcd 0000:2b:00.0: hcc params 0x200077c1 hci versio=
n 0x110 quirks 0x0000000200009010
<6>[    3.713803] xhci_hcd 0000:2b:00.0: xHCI Host Controller
<6>[    3.713892] xhci_hcd 0000:2b:00.0: new USB bus registered, assigned=
 bus number 4
<6>[    3.713897] xhci_hcd 0000:2b:00.0: Host supports USB 3.1 Enhanced S=
uperSpeed
<6>[    3.714032] usb usb3: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0002, bcdDevice=3D 6.08
<6>[    3.714040] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,=
 SerialNumber=3D1
<6>[    3.714043] usb usb3: Product: xHCI Host Controller
<6>[    3.714046] usb usb3: Manufacturer: Linux 6.8.0-devel+ xhci-hcd
<6>[    3.714048] usb usb3: SerialNumber: 0000:2b:00.0
<6>[    3.714299] hub 3-0:1.0: USB hub found
<6>[    3.714356] hub 3-0:1.0: 2 ports detected
<6>[    3.717338] usb usb4: We don't know the algorithms for LPM for this=
 host, disabling LPM.
<6>[    3.717397] usb usb4: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0003, bcdDevice=3D 6.08
<6>[    3.717402] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,=
 SerialNumber=3D1
<6>[    3.717406] usb usb4: Product: xHCI Host Controller
<6>[    3.717408] usb usb4: Manufacturer: Linux 6.8.0-devel+ xhci-hcd
<6>[    3.717411] usb usb4: SerialNumber: 0000:2b:00.0
<6>[    3.717642] hub 4-0:1.0: USB hub found
<6>[    3.717663] hub 4-0:1.0: 2 ports detected
<6>[    3.721095] usbcore: registered new interface driver cdc_acm
<6>[    3.721098] cdc_acm: USB Abstract Control Model driver for USB mode=
ms and ISDN adapters
<6>[    3.721109] usbcore: registered new interface driver usblp
<6>[    3.721118] usbcore: registered new interface driver cdc_wdm
<6>[    3.721269] usbcore: registered new interface driver uas
<6>[    3.721296] usbcore: registered new interface driver usb-storage
<6>[    3.721305] usbcore: registered new interface driver ums-datafab
<6>[    3.721315] usbcore: registered new interface driver ums-freecom
<6>[    3.721323] usbcore: registered new interface driver ums-isd200
<6>[    3.721331] usbcore: registered new interface driver ums-jumpshot
<6>[    3.721339] usbcore: registered new interface driver ums-sddr09
<6>[    3.721347] usbcore: registered new interface driver ums-sddr55
<6>[    3.721355] usbcore: registered new interface driver ums-usbat
<6>[    3.721446] dummy_hcd dummy_hcd.0: USB Host+Gadget Emulator, driver=
 02 May 2005
<6>[    3.721451] dummy_hcd dummy_hcd.0: Dummy host controller
<6>[    3.721551] dummy_hcd dummy_hcd.0: new USB bus registered, assigned=
 bus number 5
<6>[    3.721676] usb usb5: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0002, bcdDevice=3D 6.08
<6>[    3.721682] usb usb5: New USB device strings: Mfr=3D3, Product=3D2,=
 SerialNumber=3D1
<6>[    3.721685] usb usb5: Product: Dummy host controller
<6>[    3.721687] usb usb5: Manufacturer: Linux 6.8.0-devel+ dummy_hcd
<6>[    3.721689] usb usb5: SerialNumber: dummy_hcd.0
<6>[    3.721931] hub 5-0:1.0: USB hub found
<6>[    3.721953] hub 5-0:1.0: 1 port detected
<6>[    3.722224] Mass Storage Function, version: 2009/09/11
<6>[    3.722227] LUN: removable file: (no medium)
<6>[    3.722247] LUN: removable file: (no medium)
<6>[    3.722249] Number of LUNs=3D1
<6>[    3.722296] g_mass_storage gadget.0: Mass Storage Gadget, version: =
2009/09/11
<4>[    3.722299] g_mass_storage gadget.0: userspace failed to provide iS=
erialNumber
<6>[    3.722301] g_mass_storage gadget.0: g_mass_storage ready
<6>[    3.730849] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] a=
t 0x60,0x64 irq 1,12
<6>[    3.735606] serio: i8042 KBD port at 0x60,0x64 irq 1
<6>[    3.735620] serio: i8042 AUX port at 0x60,0x64 irq 12
<6>[    3.735935] mousedev: PS/2 mouse device common for all mice
<6>[    3.737115] rtc_cmos 00:03: RTC can wake from S4
<6>[    3.740074] rtc_cmos 00:03: registered as rtc0
<6>[    3.740126] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes =
nvram
<3>[    3.740238] fail to initialize ptp_kvm
<6>[    3.740522] i801_smbus 0000:00:1f.4: SPD Write Disable is set
<6>[    3.740587] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
<6>[    3.742206] input: AT Raw Set 2 keyboard as /devices/platform/i8042=
/serio0/input/input4
<6>[    3.747673] Consider using thermal netlink events interface
<6>[    3.753103] i2c i2c-7: 2/4 memory slots populated (from DMI)
<6>[    3.754055] i2c i2c-7: Successfully instantiated SPD at 0x51
<6>[    3.754168] proc_thermal 0000:00:04.0: enabling device (0000 -> 000=
2)
<6>[    3.757456] intel_rapl_common: Found RAPL domain package
<6>[    3.757460] intel_rapl_common: Found RAPL domain dram
<6>[    3.757922] intel_pch_thermal 0000:00:12.0: enabling device (0000 -=
> 0002)
<6>[    3.758421] intel_pstate: Intel P-state driver initializing
<6>[    3.758984] intel_pstate: HWP enabled
<6>[    3.759001] efifb: probing for efifb
<6>[    3.759006] efifb: framebuffer at 0xa0000000, using 8128k, total 81=
28k
<6>[    3.759008] efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D=
1
<6>[    3.759009] efifb: scrolling: redraw
<6>[    3.759009] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
<6>[    3.759033] fb1: EFI VGA frame buffer device
<6>[    3.759043] hid: raw HID events driver (C) Jiri Kosina
<6>[    3.759078] usbcore: registered new interface driver usbhid
<6>[    3.759078] usbhid: USB HID core driver
<6>[    3.759178] fujitsu_laptop: driver 0.6.0 successfully loaded
<6>[    3.759203] thinkpad_acpi: ThinkPad ACPI Extras v0.26
<6>[    3.759204] thinkpad_acpi: http://ibm-acpi.sf.net/
<6>[    3.759205] thinkpad_acpi: ThinkPad BIOS N2XET24S (3.14 ), EC N2XHT=
25W
<6>[    3.759205] thinkpad_acpi: Lenovo ThinkPad T14 Gen 1, model 20S1S19=
N00
<6>[    3.759302] thinkpad_acpi: radio switch found; radios are enabled
<6>[    3.759305] thinkpad_acpi: This ThinkPad has standard ACPI backligh=
t brightness control, supported by the ACPI video driver
<5>[    3.759306] thinkpad_acpi: Disabling thinkpad-acpi brightness event=
s by default...
<6>[    3.760052] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio=
 is unblocked
<6>[    3.760158] thinkpad_acpi: Forcing WWAN always present
<6>[    3.760481] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is b=
locked
<6>[    3.774201] thinkpad_acpi: battery 1 registered (start 0, stop 100,=
 behaviours: 0x7)
<6>[    3.774206] ACPI: battery: new extension: ThinkPad Battery Extensio=
n
<6>[    3.783152] input: ThinkPad Extra Buttons as /devices/platform/thin=
kpad_acpi/input/input7
<3>[    3.913506] ucsi_acpi USBC000:00: error -ENODEV: con1: failed to ge=
t usb role switch
<6>[    3.943681] usb 5-1: new high-speed USB device number 2 using dummy=
_hcd
<3>[    3.949683] ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
<6>[    3.953687] usb 1-1: new full-speed USB device number 2 using xhci_=
hcd
<6>[    4.085686] usb 5-1: New USB device found, idVendor=3D22e0, idProdu=
ct=3D0300, bcdDevice=3D 6.08
<6>[    4.085688] usb 5-1: New USB device strings: Mfr=3D3, Product=3D4, =
SerialNumber=3D0
<6>[    4.085689] usb 5-1: Product: SINA Virtual USB Stick
<6>[    4.085690] usb 5-1: Manufacturer: Secunet
<6>[    4.089229] usb 1-1: New USB device found, idVendor=3D058f, idProdu=
ct=3D9540, bcdDevice=3D 1.20
<6>[    4.089231] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
<6>[    4.089233] usb 1-1: Product: EMV Smartcard Reader
<6>[    4.089233] usb 1-1: Manufacturer: Generic
<6>[    4.194776] usb 2-4: new SuperSpeed USB device number 2 using xhci_=
hcd
<6>[    4.207781] usb 2-4: New USB device found, idVendor=3D8564, idProdu=
ct=3D1000, bcdDevice=3D11.00
<6>[    4.207783] usb 2-4: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D3
<6>[    4.207784] usb 2-4: Product: Mass Storage Device
<6>[    4.207785] usb 2-4: Manufacturer: JetFlash
<6>[    4.207786] usb 2-4: SerialNumber: 03HLUN227MDN24XN
<6>[    4.320686] usb 1-7: new high-speed USB device number 3 using xhci_=
hcd
<6>[    4.560820] psmouse serio1: synaptics: queried max coordinates: x [=
=2E.5678], y [..4694]
<6>[    4.561628] intel_rapl_common: Found RAPL domain package
<6>[    4.561630] intel_rapl_common: Found RAPL domain core
<6>[    4.561631] intel_rapl_common: Found RAPL domain uncore
<6>[    4.561632] intel_rapl_common: Found RAPL domain dram
<6>[    4.561633] intel_rapl_common: Found RAPL domain psys
<6>[    4.561918] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class=
/subclass/prog-if info 0x040380
<6>[    4.561946] snd_hda_intel 0000:00:1f.3: Digital mics found on Skyla=
ke+ platform, using SOF driver
<6>[    4.561965] usbcore: registered new interface driver snd-usb-audio
<6>[    4.562011] snd_soc_skl 0000:00:1f.3: DSP detected with PCI class/s=
ubclass/prog-if info 0x040380
<6>[    4.562036] snd_soc_skl 0000:00:1f.3: Digital mics found on Skylake=
+ platform, using SOF driver
<6>[    4.562059] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with=
 PCI class/subclass/prog-if info 0x040380
<6>[    4.562084] sof-audio-pci-intel-cnl 0000:00:1f.3: Digital mics foun=
d on Skylake+ platform, using SOF driver
<6>[    4.562092] sof-audio-pci-intel-cnl 0000:00:1f.3: enabling device (=
0004 -> 0006)
<6>[    4.562158] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with=
 PCI class/subclass/prog-if 0x040380
<6>[    4.562183] sof-audio-pci-intel-cnl 0000:00:1f.3: bound 0000:00:02.=
0 (ops i915_audio_component_bind_ops)
<6>[    4.568431] sof-audio-pci-intel-cnl 0000:00:1f.3: use msi interrupt=
 mode
<6>[    4.568887] ipip: IPv4 and MPLS over IPv4 tunneling driver
<6>[    4.568973] Initializing XFRM netlink socket
<6>[    4.568976] IPsec XFRM device driver
<6>[    4.568986] NET: Registered PF_INET6 protocol family
<6>[    4.569297] Segment Routing with IPv6
<6>[    4.569301] In-situ OAM (IOAM) with IPv6
<6>[    4.569322] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
<6>[    4.569461] NET: Registered PF_PACKET protocol family
<6>[    4.569463] NET: Registered PF_KEY protocol family
<6>[    4.569465] 8021q: 802.1Q VLAN Support v1.8
<6>[    4.569474] 9pnet: Installing 9P2000 support
<4>[    4.569986] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
<6>[    4.570267] microcode: Current revision: 0x000000f8
<6>[    4.570268] microcode: Updated early from: 0x000000d6
<6>[    4.570525] IPI shorthand broadcast: enabled
<6>[    4.572266] sched_clock: Marking stable (4563000521, 8625527)->(463=
7230504, -65604456)
<5>[    4.572444] Loading compiled-in X.509 certificates
<6>[    4.579304] sof-audio-pci-intel-cnl 0000:00:1f.3: hda codecs found,=
 mask 5
<6>[    4.579306] sof-audio-pci-intel-cnl 0000:00:1f.3: using HDA machine=
 driver skl_hda_dsp_generic now
<6>[    4.579308] sof-audio-pci-intel-cnl 0000:00:1f.3: DMICs detected in=
 NHLT tables: 2
<6>[    4.592389] psmouse serio1: synaptics: queried min coordinates: x [=
1266..], y [1162..]
<6>[    4.592393] psmouse serio1: synaptics: Trying to set up SMBus acces=
s
<6>[    4.627309] rmi4_smbus 7-002c: registering SMbus-connected sensor
<6>[    4.756395] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: =
Synaptics, product: TM3471-010, fw id: 2867793
<6>[    4.841481] input: Synaptics TM3471-010 as /devices/pci0000:00/0000=
:00:1f.4/i2c-7/7-002c/rmi4-00/input/input8
<6>[    4.851682] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
<6>[    5.315767] Freeing initrd memory: 41352K
<6>[    5.316431] modprobe (136) used greatest stack depth: 13304 bytes l=
eft
<5>[    5.317613] Loaded X.509 cert 'Build time autogenerated kernel key:=
 38df7aa89675866473e0091facb285e903a80814'
<6>[    5.317893] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware paths/fi=
les for ipc type 0:
<6>[    5.317896] sof-audio-pci-intel-cnl 0000:00:1f.3:  Firmware file:  =
   intel/sof/sof-cml.ri
<6>[    5.317897] sof-audio-pci-intel-cnl 0000:00:1f.3:  Topology file:  =
   intel/sof-tplg/sof-hda-generic-2ch.tplg
<6>[    5.318429] PM:   Magic number: 12:825:331
<6>[    5.318471] tty tty52: hash matches
<5>[    5.318548] cfg80211: Loading compiled-in X.509 certificates for re=
gulatory database
<5>[    5.319737] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
<5>[    5.319840] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c72=
48db18c600'
<6>[    5.319858] clk: Disabling unused clocks
<6>[    5.319859] ALSA device list:
<6>[    5.319860]   No soundcards found.
<6>[    5.320098] i915 0000:00:02.0: [drm] Finished loading DMC firmware =
i915/kbl_dmc_ver1_04.bin (v1.4)
<6>[    5.320592] Freeing unused kernel image (initmem) memory: 3616K
<6>[    5.324758] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: ve=
rsion 2:2:0-57864
<6>[    5.324759] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:2=
2:1 Kernel ABI 3:23:0
<6>[    5.324762] sof-audio-pci-intel-cnl 0000:00:1f.3: unknown sof_ext_m=
an header type 3 size 0x30
<6>[    5.324872] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version=
: 89.3.35.37
<6>[    5.325074] iwlwifi 0000:00:14.3: loaded firmware version 77.2dda88=
0d.0 QuZ-a0-hr-b0-77.ucode op_mode iwlmvm
<6>[    5.325968] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6 AX201 1=
60MHz, REV=3D0x351
<4>[    5.326002] thermal thermal_zone7: failed to read out thermal zone =
(-61)
<6>[    5.327683] Write protecting the kernel read-only data: 30720k
<6>[    5.328099] Freeing unused kernel image (rodata/data gap) memory: 1=
464K
<6>[    5.328497] x86/mm: Checked W+X mappings: passed, no W+X pages foun=
d.
<6>[    5.328501] Run /init as init process
<7>[    5.328502]   with arguments:
<7>[    5.328502]     /init
<7>[    5.328503]     nosmt,
<7>[    5.328504]     sina_toram
<7>[    5.328504]   with environment:
<7>[    5.328504]     HOME=3D/
<7>[    5.328505]     TERM=3Dlinux
<7>[    5.328505]     BOOT_IMAGE=3D/isolinux/bzImage
<6>[    5.441451] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: ve=
rsion 2:2:0-57864
<6>[    5.441454] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:2=
2:1 Kernel ABI 3:23:0
<6>[    5.441759] sof-audio-pci-intel-cnl 0000:00:1f.3: Topology: ABI 3:2=
2:1 Kernel ABI 3:23:0
<4>[    5.441915] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent c=
ard not yet available, widget card binding deferred
<6>[    5.445973] iwlwifi 0000:00:14.3: Detected RF HR B3, rfid=3D0x10a10=
0
<6>[    5.452813] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC25=
7: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
<6>[    5.452816] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=3D0 =
(0x0/0x0/0x0/0x0/0x0)
<6>[    5.452817] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=3D1 (0x21=
/0x0/0x0/0x0/0x0)
<6>[    5.452818] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=3D=
0x0
<6>[    5.452819] snd_hda_codec_realtek ehdaudio0D0:    inputs:
<6>[    5.452820] snd_hda_codec_realtek ehdaudio0D0:      Mic=3D0x19
<3>[    5.468721] ACPI Error: Needed [Integer/String/Buffer], found [Pack=
age] 0000000093b1791b (20230628/exresop-469)
<3>[    5.468728] ACPI Error: AE_AML_OPERAND_TYPE, While resolving operan=
ds for [OpcodeName unavailable] (20230628/dswexec-433)
<3>[    5.468732] ACPI Error: Aborting method \ADBG due to previous error=
 (AE_AML_OPERAND_TYPE) (20230628/psparse-529)
<3>[    5.468738] ACPI Error: Aborting method \_SB.HIDD._DSM due to previ=
ous error (AE_AML_OPERAND_TYPE) (20230628/psparse-529)
<4>[    5.468745] ACPI: \_SB_.HIDD: failed to evaluate _DSM b356ecee-4244=
-8f40-a792-4edd4d758054 (0x3003)
<6>[    5.468792] input: Intel HID events as /devices/platform/INT33D5:00=
/input/input11
<6>[    5.512277] iwlwifi 0000:00:14.3: base HW address: 34:2e:b7:52:c0:9=
2
<6>[    5.523969] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1=
f.3/skl_hda_dsp_generic/sound/card0/input12
<6>[    5.524392] input: sof-hda-dsp Headphone as /devices/pci0000:00/000=
0:00:1f.3/skl_hda_dsp_generic/sound/card0/input13
<6>[    5.524802] input: sof-hda-dsp HDMI/DP,pcm=3D3 as /devices/pci0000:=
00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input14
<6>[    5.524859] input: sof-hda-dsp HDMI/DP,pcm=3D4 as /devices/pci0000:=
00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input15
<6>[    5.524909] input: sof-hda-dsp HDMI/DP,pcm=3D5 as /devices/pci0000:=
00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input16
<6>[    5.680003] psmouse serio1: synaptics: queried max coordinates: x [=
=2E.5678], y [..4694]
<6>[    5.721204] psmouse serio1: synaptics: queried min coordinates: x [=
1266..], y [1162..]
<6>[    5.721218] psmouse serio1: synaptics: Trying to set up SMBus acces=
s
<4>[    5.726329] sysfs: cannot create duplicate filename '/devices/pci00=
00:00/0000:00:1f.4/i2c-7/7-002c'
<4>[    5.726336] CPU: 6 PID: 78 Comm: kworker/6:1 Not tainted 6.8.0-deve=
l+ #1
<4>[    5.726342] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET=
24S (3.14 ) 10/10/2020
<4>[    5.726345] Workqueue: events_long serio_handle_event
<4>[    5.726354] Call Trace:
<4>[    5.726358]  <TASK>
<4>[    5.726362]  dump_stack_lvl+0x64/0x80
<4>[    5.726370]  sysfs_warn_dup+0x5a/0x70
<4>[    5.726376]  sysfs_create_dir_ns+0xd4/0xf0
<4>[    5.726381]  kobject_add_internal+0xa3/0x2c0
<4>[    5.726389]  kobject_add+0x97/0x100
<4>[    5.726395]  ? get_device_parent+0x25/0x1d0
<4>[    5.726403]  device_add+0xc9/0x890
<4>[    5.726410]  i2c_new_client_device+0x1b8/0x340
<4>[    5.726418]  ? __pfx_psmouse_smbus_create_companion+0x10/0x10
<4>[    5.726426]  psmouse_smbus_create_companion+0x88/0xa0
<4>[    5.726432]  bus_for_each_dev+0x85/0xd0
<4>[    5.726436]  ? __pfx_psmouse_smbus_create_companion+0x10/0x10
<4>[    5.726442]  i2c_for_each_dev+0x31/0x50
<4>[    5.726447]  psmouse_smbus_init+0x157/0x260
<4>[    5.726453]  synaptics_create_intertouch+0xfb/0x140
<4>[    5.726462]  synaptics_init+0x93/0x1e0
<4>[    5.726469]  psmouse_extensions+0x259/0x520
<4>[    5.726474]  psmouse_switch_protocol+0x143/0x190
<4>[    5.726479]  psmouse_connect+0x1cb/0x410
<4>[    5.726484]  serio_driver_probe+0x31/0x50
<4>[    5.726489]  really_probe+0x19f/0x400
<4>[    5.726494]  ? __pfx___device_attach_driver+0x10/0x10
<4>[    5.726499]  __driver_probe_device+0x78/0x160
<4>[    5.726504]  driver_probe_device+0x1f/0x90
<4>[    5.726509]  __device_attach_driver+0x89/0x110
<4>[    5.726515]  bus_for_each_drv+0x92/0xf0
<4>[    5.726519]  __device_attach+0xb2/0x1b0
<4>[    5.726524]  serio_handle_event+0x179/0x290
<4>[    5.726529]  process_one_work+0x138/0x2f0
<4>[    5.726534]  worker_thread+0x2f5/0x420
<4>[    5.726538]  ? trace_hardirqs_off.part.0+0x16/0x70
<4>[    5.726543]  ? __pfx_worker_thread+0x10/0x10
<4>[    5.726547]  kthread+0xd4/0x100
<4>[    5.726553]  ? __pfx_kthread+0x10/0x10
<4>[    5.726558]  ret_from_fork+0x31/0x50
<4>[    5.726565]  ? __pfx_kthread+0x10/0x10
<4>[    5.726570]  ret_from_fork_asm+0x1b/0x30
<4>[    5.726578]  </TASK>
<3>[    5.726580] kobject: kobject_add_internal failed for 7-002c with -E=
EXIST, don't try to register things with the same name in the same direct=
ory.
<3>[    5.726585] i2c i2c-7: Failed to register i2c client rmi4_smbus at =
0x2c (-17)
<6>[    5.726595] psmouse serio1: synaptics: SMbus companion is not ready=
 yet
<6>[    5.810012] psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32=
, id: 0x1e2a1, caps: 0xf00aa3/0x940300/0x12e800/0x500000, board id: 3471,=
 fw id: 2867793
<6>[    5.810036] psmouse serio1: synaptics: serio: Synaptics pass-throug=
h port at isa0060/serio1/input0
<6>[    5.862718] input: SynPS/2 Synaptics TouchPad as /devices/platform/=
i8042/serio1/input/input10
<3>[    5.935532] rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed =
to change enabled interrupts!
<4>[    5.935547] psmouse: probe of serio2 failed with error -1
<6>[    6.569592] psmouse serio3: trackpoint: Elan TrackPoint firmware: 0=
x11, buttons: 3/3
<6>[    6.711455] usb 1-7: New USB device found, idVendor=3D2cb7, idProdu=
ct=3D0007, bcdDevice=3D 3.33
<6>[    6.711467] usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D3
<6>[    6.711472] usb 1-7: Product: L850-GL
<6>[    6.711475] usb 1-7: Manufacturer: Fibocom Wireless Inc.
<6>[    6.711479] usb 1-7: SerialNumber: 004999010640000
<6>[    6.851130] input: TPPS/2 Elan TrackPoint as /devices/platform/i804=
2/serio1/serio3/input/input18
<6>[    6.852713] usb 1-8: new high-speed USB device number 4 using xhci_=
hcd
<1>[    6.939521] BUG: kernel NULL pointer dereference, address: 00000000=
00000040
<1>[    6.939533] #PF: supervisor read access in kernel mode
<1>[    6.939538] #PF: error_code(0x0000) - not-present page
<6>[    6.939544] PGD 0 P4D 0=20
<4>[    6.939551] Oops: 0000 [#1] PREEMPT SMP NOPTI
<4>[    6.939559] CPU: 6 PID: 48 Comm: kworker/6:0 Not tainted 6.8.0-deve=
l+ #1
<4>[    6.939567] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET=
24S (3.14 ) 10/10/2020
<4>[    6.939572] Workqueue: psmouse-smbus psmouse_smbus_remove_i2c_devic=
e
<4>[    6.939588] RIP: 0010:__irq_domain_deactivate_irq+0x14/0x50
<4>[    6.939602] Code: 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 0f 1f 44 00 00 48 85 ff 74 33 53 48 89 fb eb 1e 48 8b 47=
 18 <48> 8b 40 40 48 85 c0 74 08 48 89 de ff d0 0f 1f 00 48 8b 5b 28 48
<4>[    6.939609] RSP: 0018:ffffa7510024bae8 EFLAGS: 00010086
<4>[    6.939616] RAX: 0000000000000000 RBX: ffff98608504c828 RCX: 000000=
0000150014
<4>[    6.939621] RDX: 0000000000000001 RSI: ffffffffa93f42fc RDI: ffff98=
6080d9d800
<4>[    6.939625] RBP: ffff98608504c828 R08: 0000000000000000 R09: ffffff=
ffa8562d01
<4>[    6.939630] R10: ffff986080042600 R11: 0000000000000001 R12: ffff98=
608504c960
<4>[    6.939634] R13: ffff98608504c8a4 R14: 0000000000000246 R15: ffff98=
608504c800
<4>[    6.939638] FS:  0000000000000000(0000) GS:ffff9867be580000(0000) k=
nlGS:0000000000000000
<4>[    6.939644] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    6.939649] CR2: 0000000000000040 CR3: 00000002f222e003 CR4: 000000=
00003706f0
<4>[    6.939654] Call Trace:
<4>[    6.939659]  <TASK>
<4>[    6.939665]  ? __die+0x23/0x70
<4>[    6.939676]  ? page_fault_oops+0x181/0x470
<4>[    6.939686]  ? trace_hardirqs_on+0x21/0x90
<4>[    6.939694]  ? _raw_spin_unlock_irqrestore+0x19/0x40
<4>[    6.939706]  ? __wake_up+0x44/0x60
<4>[    6.939716]  ? exc_page_fault+0x68/0x150
<4>[    6.939724]  ? asm_exc_page_fault+0x26/0x30
<4>[    6.939734]  ? remove_proc_subtree+0x151/0x1f0
<4>[    6.939765]  ? _raw_spin_lock_irqsave+0x3c/0x60
<4>[    6.939777]  ? __irq_domain_deactivate_irq+0x14/0x50
<4>[    6.939786]  ? trace_hardirqs_off.part.0+0x16/0x70
<4>[    6.939793]  irq_domain_deactivate_irq+0x22/0x40
<4>[    6.939800]  free_irq+0x1ef/0x2d0
<4>[    6.939807]  devres_release_all+0xb9/0x110
<4>[    6.939820]  device_unbind_cleanup+0xe/0x70
<4>[    6.939829]  device_release_driver_internal+0x1c4/0x200
<4>[    6.939839]  bus_remove_device+0xc6/0x130
<4>[    6.939846]  device_del+0x15c/0x3f0
<4>[    6.939855]  rmi_unregister_function+0x34/0x70
<4>[    6.939867]  rmi_free_function_list+0x7c/0xf0
<4>[    6.939874]  rmi_driver_remove+0x40/0x50
<4>[    6.939880]  device_release_driver_internal+0x19f/0x200
<4>[    6.939890]  bus_remove_device+0xc6/0x130
<4>[    6.939897]  device_del+0x15c/0x3f0
<4>[    6.939904]  ? kernfs_name_hash+0x12/0x80
<4>[    6.939915]  rmi_unregister_transport_device+0x16/0x20
<4>[    6.939925]  i2c_device_remove+0x23/0xb0
<4>[    6.939935]  device_release_driver_internal+0x19f/0x200
<4>[    6.939944]  bus_remove_device+0xc6/0x130
<4>[    6.939952]  device_del+0x15c/0x3f0
<4>[    6.939959]  ? trace_hardirqs_off.part.0+0x16/0x70
<4>[    6.939965]  ? _raw_spin_lock_irqsave+0x3c/0x60
<4>[    6.939976]  device_unregister+0x17/0x60
<4>[    6.939983]  psmouse_smbus_remove_i2c_device+0x18/0x40
<4>[    6.939994]  process_one_work+0x138/0x2f0
<4>[    6.940002]  worker_thread+0x2f5/0x420
<4>[    6.940008]  ? __pfx_worker_thread+0x10/0x10
<4>[    6.940015]  kthread+0xd4/0x100
<4>[    6.940024]  ? __pfx_kthread+0x10/0x10
<4>[    6.940032]  ret_from_fork+0x31/0x50
<4>[    6.940043]  ? __pfx_kthread+0x10/0x10
<4>[    6.940052]  ret_from_fork_asm+0x1b/0x30
<4>[    6.940065]  </TASK>
<4>[    6.940068] Modules linked in: pinctrl_cannonlake pinctrl_intel int=
el_hid
<4>[    6.940081] CR2: 0000000000000040
<4>[    6.940086] ---[ end trace 0000000000000000 ]---

ECC: No errors detected

--------------6BFAE5A8157530022DFAC815--

