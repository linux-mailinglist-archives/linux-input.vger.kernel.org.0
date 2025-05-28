Return-Path: <linux-input+bounces-12624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295CAC6D05
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 17:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED3B6A24233
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 15:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BEA28C2B5;
	Wed, 28 May 2025 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muicFhMF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E628C2CE;
	Wed, 28 May 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446884; cv=none; b=B5SwjG3OyV4c8JI4kuskCYwf9KU4JtlpAdJnjQjyrBJOiwekZrms85IS5Ndus26ue/skqeA/D+qGTcbsN5mVDG45s0dguh6EsIIAUCCOpOp4GIheEGzSBqmmk17JhUHYizN0It/vijCyy/zSNfA8hj/fi7YwU44DXm6ThojnAwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446884; c=relaxed/simple;
	bh=mEzSi6I2fDYtzCDR+dpRxZ3ylorfCFpExrqQd/A2g7M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Fx2F6Lun/5FDg23Lx2JlGoBFb5pHpq0UaezqBUTD99XUQXNEIpRqtiBGRjBtNghLvgjxARfVO+kncqLj9x7Q4+49YoEROIE6GxHdgIOZYPHuuHSf3CGb5hco4V2Aczc46T1i4gQFtlU21CN6zJnVIAxsOkUwq4LxWIfZaucTGxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muicFhMF; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87be2373596so1421001241.1;
        Wed, 28 May 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748446882; x=1749051682; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aHeF9dRNQaPdZw883K5F95ZIz4dvl+LHYp8TlSC3SEc=;
        b=muicFhMFPMT5sHiiymLkM5ryV5bhnggsg8hMpF192hndGk2671gQb3YxBpFoANPvmO
         8n7/jig4X3qK+cMVuYnyWqH5PSLyS40t0NegEK4tUoFrDZ2QXFWKGqZCNAsVDC6GzZWY
         tgsVIXMYPAk+08KIuB3qltLunDwFAgZzbadmUwjelkeoFI71LpXvrZND2s/vlue/8Q9H
         6vW9tA0w6OOSd4HKcEseMYTcAZsDDo/4xxj8Z9GNOnYgLXH+XJoOaRRPybHRoWAJ/2uF
         +GtpfuqM3dlrNXLpva/wKVMKqGgpGFEraYqIgrVV52i4rCUNP63yLs56G36HgGlCDiug
         CYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446882; x=1749051682;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHeF9dRNQaPdZw883K5F95ZIz4dvl+LHYp8TlSC3SEc=;
        b=ejgsv+tIc4KE7WMlONOT/os/d+JzXe/BJlblgtqtIMFFjXT3jsKe0+WmOttWlIt/mq
         6qLjXFvUUB64vTH9gxY8ye9Sd/IAPqVJoWKLEjKfNM19tEwzoHwj/FZHsDPYhlGaxvrs
         j/rfZ68LEE32UKJWHMGbTlm4b9DsFKFbuNStWEo7fQmw13bz153l6cFNNctcxDQStHAV
         R7YlArKKVpRAkidGYi0U6dyq6mZ48OsF9doucJsK9RKwNF1zGGFH736ioZadXNEVPThd
         RS1utHLCIwqf7FvQ6kOYWR5a7AkGVRFzmAMsGmscq3vHH5JfQYVkFtuN3roEfwUcZGzY
         fQnw==
X-Forwarded-Encrypted: i=1; AJvYcCW/oyPYkG948EhS/+GbhDYVvp7822Pnj+lRV2hjN7QvX1Ov83gAxHAU86+RfMtw9nkT10t06ScGOXKo3MBK5SvW6ej4aQ==@vger.kernel.org, AJvYcCWAb8nx4DFmadsfy1c3EYUVHcehvKWQfZO+kielEjr61DDqcDPC9PbbVdTN0IPPulFFE4JWQfJGMMovsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZYqusdd2Q37YEb3K/bWVx7h8pJLHCr537GGEyWKeujaBj6+vs
	+cOV8MHiQ00MovlVc1piljyHonHIlWaBgEVhcuxtr+SI3GOM/bupaDAg
X-Gm-Gg: ASbGnctk1+a4wpj3uSM8OCI73c/mu3dHfW4aHi7GcHHOEeKdj4ftUJJfkW/BnQVQXAv
	XL7NCOIF2AygEzgxE/bpf5laKKtb+mm6aF0AOeZZ+SFfbV7PJrrmJ1AK0ptnw3cie/l2N1unrFm
	xph1vs4ISj4msuKCmLMQonJYWOFWJrSVmbewezD6BteenYtNkgTCgCSE5DBU0HktkvJHlZDb0gp
	1tr07aaOikLHlN/HEurcJkdJYoW/Qyz0FQ5s8jQgOxAgZE+wF6UtUyJI3JYSC+3j9C7QDAQFknE
	EIVQWs7XxLq8KSZxdFgiclpOKJfKI9hve9KwXTIW+e4=
X-Google-Smtp-Source: AGHT+IFwOFh6bT+TpEVHmhtDwrPDVL8un+Se3cuaNqSs3DUl8Y0SdzFZ18x/C3cRHj5+NnvSxUK+Wg==
X-Received: by 2002:a05:6122:4682:b0:530:6dc2:ba9c with SMTP id 71dfb90a1353d-5306dc2bcbfmr1617728e0c.2.1748446881418;
        Wed, 28 May 2025 08:41:21 -0700 (PDT)
Received: from localhost ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066944b39sm1203974e0c.38.2025.05.28.08.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a09c3051dc945d6dd8179406732b8dbe60814d6ec71b2152304be90541f1;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 28 May 2025 12:40:52 -0300
Message-Id: <DA7WOJH0HZDH.36EH3U8BQJ0JF@gmail.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [REGRESSSION] on linux-next (next-20250509)
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Luke Jones" <luke@ljones.dev>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com> <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
In-Reply-To: <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>

--a09c3051dc945d6dd8179406732b8dbe60814d6ec71b2152304be90541f1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Luke,

On Wed May 28, 2025 at 10:07 AM -03, Luke Jones wrote:
> On Wed, 28 May 2025, at 12:08 PM, Borah, Chaitanya Kumar wrote:
>> Hello Luke,
>>
>> Hope you are doing well. I am Chaitanya from the linux graphics team in =
Intel.
>>
>> This mail is regarding a regression we are seeing in our CI runs[1] on=
=20
>> linux-next repository.
>
> Can you tell me if the fix here was included?
> https://lkml.org/lkml/2025/5/24/152
>
> I could change to:
> static void asus_s2idle_check_register(void)
> {
>     // Only register for Ally devices
>     if (dmi_check_system(asus_rog_ally_device)) {
>         if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
>             pr_warn("failed to register LPS0 sleep handler in asus-wmi\n"=
);
>     }
> }
>
> but I don't really understand what is happening here. The inner lps0 func=
tions won't run unless use_ally_mcu_hack is set.

The RIP is caused by a "list_add double add" warning.

After reading the log, I believe this is happening because
asus_wmi_register_driver() is called a second time by eeepc_wmi after
asus_nb_wmi, which implies

	asus_wmi_probe()
	  -> acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops)

is called twice and the warning is triggered.

Line [1] makes me think this could be a race condition, as
asus_wmi_register_driver() may be called concurrently.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git/tree/drivers/platform/x86/asus-wmi.c?h=3Dfor-next#n5101

>
> I will do my best to fix but I need to understand what happened a bit bet=
ter.
>
> regards,
> Luke.
>
>> Since the version next-20250509 [2], we are seeing the following regress=
ion
>>
>> ````````````````````````````````````````````````````````````````````````=
`````````
>> <4>[    5.400826] ------------[ cut here ]------------
>> <4>[    5.400832] list_add double add: new=3Dffffffffa07c0ca0,=20
>> prev=3Dffffffff837e9a60, next=3Dffffffffa07c0ca0.
>> <4>[    5.400845] WARNING: CPU: 0 PID: 379 at lib/list_debug.c:35=20
>> __list_add_valid_or_report+0xdc/0xf0
>> <4>[    5.400850] Modules linked in: cmdlinepart(+) eeepc_wmi(+)=20
>> asus_nb_wmi(+) asus_wmi spi_nor(+) sparse_keymap mei_pxp mtd=20
>> platform_profile kvm_intel(+) mei_hdcp wmi_bmof kvm irqbypass=20
>> polyval_clmulni usbhid ghash_clmulni_intel snd_hda_intel hid sha1_ssse3=
=20
>> r8152(+) binfmt_misc aesni_intel snd_intel_dspcfg mii r8169=20
>> snd_hda_codec rapl video snd_hda_core intel_cstate snd_hwdep realtek=20
>> snd_pcm snd_timer mei_me snd i2c_i801 i2c_mux spi_intel_pci idma64=20
>> soundcore spi_intel i2c_smbus mei intel_pmc_core nls_iso8859_1=20
>> pmt_telemetry pmt_class intel_pmc_ssram_telemetry pinctrl_alderlake=20
>> intel_vsec acpi_tad wmi acpi_pad dm_multipath msr nvme_fabrics fuse=20
>> efi_pstore nfnetlink ip_tables x_tables autofs4
>> <4>[    5.400904] CPU: 0 UID: 0 PID: 379 Comm: (udev-worker) Tainted: G=
=20
>> S                 =20
>> 6.15.0-rc7-next-20250526-next-20250526-g3be1a7a31fbd+ #1=20
>> PREEMPT(voluntary)=20
>> <4>[    5.400907] Tainted: [S]=3DCPU_OUT_OF_SPEC
>> <4>[    5.400908] Hardware name: ASUS System Product Name/PRIME Z790-P=
=20
>> WIFI, BIOS 0812 02/24/2023
>> <4>[    5.400909] RIP: 0010:__list_add_valid_or_report+0xdc/0xf0
>> <4>[    5.400912] Code: 16 48 89 f1 4c 89 e6 e8 a2 c5 5f ff 0f 0b 31 c0=
=20
>> e9 72 ff ff ff 48 89 f2 4c 89 e1 48 89 fe 48 c7 c7 68 ba 0f 83 e8 84 c5=
=20
>> 5f ff <0f> 0b 31 c0 e9 54 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90=
=20
>> 90
>> <4>[    5.400914] RSP: 0018:ffffc90002763588 EFLAGS: 00010246
>> <4>[    5.400916] RAX: 0000000000000000 RBX: ffffffffa07c0ca0 RCX:=20
>> 0000000000000000
>> <4>[    5.400918] RDX: 0000000000000000 RSI: 0000000000000000 RDI:=20
>> 0000000000000000
>> <4>[    5.400919] RBP: ffffc90002763598 R08: 0000000000000000 R09:=20
>> 0000000000000000
>> <4>[    5.400920] R10: 0000000000000000 R11: 0000000000000000 R12:=20
>> ffffffffa07c0ca0
>> <4>[    5.400921] R13: ffffffffa07c0ca0 R14: 0000000000000000 R15:=20
>> ffff8881212d6da0
>> <4>[    5.400923] FS:  0000778637b418c0(0000) GS:ffff8888dad0c000(0000)=
=20
>> knlGS:0000000000000000
>> <4>[    5.400926] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4>[    5.400928] CR2: 00007786373b80b2 CR3: 0000000116faa000 CR4:=20
>> 0000000000f50ef0
>> <4>[    5.400931] PKRU: 55555554
>> <4>[    5.400933] Call Trace:
>> <4>[    5.400935]  <TASK>
>> <4>[    5.400937]  ? lock_system_sleep+0x2b/0x40
>> <4>[    5.400942]  acpi_register_lps0_dev+0x58/0xb0
>> <4>[    5.400949]  asus_wmi_probe+0x7f/0x1930 [asus_wmi]
>> <4>[    5.400956]  ? kernfs_create_link+0x69/0xe0
>> ````````````````````````````````````````````````````````````````````````=
`````````
>> Detailed log can be found in [3].
>>
>> After bisecting the tree, the following patch [4] seems to be the first =
"bad"
>> commit
>>
>> ````````````````````````````````````````````````````````````````````````=
`````````````````````````````````
>> commit feea7bd6b02d43a794e3f065650d89cf8d8e8e59
>> Author: Luke D. Jones mailto:luke@ljones.dev
>> Date:=C2=A0=C2=A0 Sun Mar 23 15:34:21 2025 +1300
>>
>> =C2=A0=C2=A0=C2=A0 platform/x86: asus-wmi: Refactor Ally suspend/resume
>> ````````````````````````````````````````````````````````````````````````=
`````````````````````````````````
>>
>> We could not revert the patch because of merge conflict but resetting=20
>> to the parent of the commit seems to fix the issue
>>
>> Could you please check why the patch causes this regression and provide=
=20
>> a fix if necessary?
>>
>> Thank you.
>>
>> Regards
>>
>> Chaitanya
>>
>> [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
>> [2]=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?h=3Dnext-20250509=20
>> [3]=20
>> https://intel-gfx-ci.01.org/tree/linux-next/next-20250526/bat-rpls-4/boo=
t0.txt=20
>> [4]=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?h=3Dnext-20250509&id=3Dfeea7bd6b02d43a794e3f065650d89cf8d8e8e59


--=20
 ~ Kurt


--a09c3051dc945d6dd8179406732b8dbe60814d6ec71b2152304be90541f1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaDcuiAAKCRAWYEM49J/U
ZqoBAP9SwYHM8Gc+tH3n5J1bu9OzHppBGaIBEj1lwuA6CWUzQwEAq6cQYiMMfNcC
KEhB3WjD+KP2d2cbRYLPFoCvYeyjnwc=
=zE1e
-----END PGP SIGNATURE-----

--a09c3051dc945d6dd8179406732b8dbe60814d6ec71b2152304be90541f1--

