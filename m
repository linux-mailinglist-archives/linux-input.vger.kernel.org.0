Return-Path: <linux-input+bounces-3704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C86278C50EC
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 13:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6BC1F215CE
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 11:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411156CDC5;
	Tue, 14 May 2024 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="VTEVa9Xm"
X-Original-To: linux-input@vger.kernel.org
Received: from sonic316-22.consmr.mail.ne1.yahoo.com (sonic316-22.consmr.mail.ne1.yahoo.com [66.163.187.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4064F88C
	for <linux-input@vger.kernel.org>; Tue, 14 May 2024 10:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715683862; cv=none; b=FYD55GMwhWqXL6E3D2avNlt/6lxziSj7J/s07Z3wPBZ1yEg2o2u6b2if21FJSGmhfHVlzzadLYO4h2x5zqOuPqh5YRGmoQYua2duAjrvy6/vR9kyJT+aFGFSjbQ/mH9UpMv8ox+WMvyFAYJAwjwQ0bf/MPJes6WdmxeO/k7x7IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715683862; c=relaxed/simple;
	bh=V+4qsxrlj0EfqXa08DjZOITWlC9wXzpM6cbQPRUgrOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoAE9W+6ZJE16WTGB+MZDuuvjY8R7c8Qr1rcxiGgENAFPxMjxmZuVHseNbNq2RuChiVoDUCxj2p0cq37WuX9ytfjTb/pQGA/Q7TsoCi4c8Iy9YX2L5DBCHEBttv0CwBDO3tW9k2fyHdgJu67jAaSeHFoCi9qw/r+U5XOd3k3JHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=VTEVa9Xm; arc=none smtp.client-ip=66.163.187.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1715683854; bh=ulAeqE0OdibdeA53OaKJuEKqZmcb0fMRJNLywhlj3Zo=; h=References:In-Reply-To:From:Date:Subject:To:Cc:From:Subject:Reply-To; b=VTEVa9Xm5j1wn6m52whTuiQ9+izEae1gUkUr7WJJrIUA1yctqribPt8QpTJcyzVY56HmU8c7LEJ81yppIeK/U6CXlPstH2/q4jykgIVFdNgL/EJ1wNk0k5i/02C4jYqW6lWoxG7vxkUf786NEJ43/HEtjELiQNA2oFxRdRuPUNxcgWDDLAxsoh4h788iCaqSyEhmpmZkqBJ/m2a5cnllLWr/K6/dsbRLpp13UOxl0JQBOYxl3nCV2xbOTXpESIM+4ywldBQ7i7+XELPEUr90Z10RsRqYIryvh3qKgo6mlLBKvthucCfQwTVQctruFlpgNhBnV6YrMxbG1zIKGFpHXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1715683854; bh=9DewLnF5PZaZ5N3IwGlJIa+gmFmGTxaNWblfgGCj+cP=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Em5p8F2pM3EACit8W1cKn3LIbwErM84y4x6jlHVOnyLqwSbK6dict8TZDxwooBwVohP0LnH6dCEXBLBBdywt2qcvk7zKq1/HNPUWpgzJtqJkktyTI0V+uzEugZ8K+3DPfCJKheucaSEZBjHrodvegmbqSSIlvaU+Mpb5BDC+G4lTihpWECmhHyBkm1g9jgacSO7O2jFqiqfzHil5ujK6eLnR0cFDqKZYqmzerhKvfvKoKytyugMOxmzzKcCLLxdjnABfKB4aZkfkNpeFtdG0ITGZbBRHI0FZ9kX5NQ4Pa51x99GM7/Dxy3pV0NCWtVwOMznLReiOxCyb2/RsX4m3uw==
X-YMail-OSG: p3t5TuQVM1ldmxA4E8t4aTphqPv3vWh0nPL3vayiYtT6V40._t6GlM4jsFBqUpC
 7rL_JDlQXW.7tTuUIiQEnvSownzYld2H3xRMYckETUTaKeE0j6lK1JJfS_Ws_lMh_n3INnqwL1rn
 FZWMVJeNS7Xx7QTanughcdBrHYDJhfomWTVJf53INhw3ZomW4blEX0LwmYcpAocmWdgB8nZ300Et
 cihymIxK3eSneoE2XRABvQzH5uoUrIyUrAlGTNJe9eNj07hgagYRVnigDKkyi7ZQbT9dMacyHPp2
 uwQ2EIs13_8uP1b9xJiop9e5SM5VHZyeYZfkUq5NCNtYPBkCwHkcaDpQm48JDrzCeQ3VAnU3dCBj
 XWqP_9xa2MZaG6C1Zfs0ZZpHwDDwVIkogqbn1gMGZfIpzrdOWnaOrZwrhoBdJiCD7q1iZT6OQASj
 6o88kqjhCd6_D3B9fhxsi6LSOj_kUsroHGoBeRRyXN.mQeN9Q5.dY.IY9ObsnAlRwI8X_DhDAqKK
 HHQAf7Q9HUPLUOsySUKdYOMxdttLy5a4cu3PSkF6gTfmt..tCnaUMUlCLWfgvc2UF2WxJMFbz6wE
 boQ_o13BoXF6an2HA4oZ9Sa07BGUiX20lNKHpO6KCkpNqNcY41ZtFosSoAcx7iQxU9iRdcaWFl4y
 L3jsjhQQ3QGUfO9EXBLtK1DQ1HOkwYmh2h0Gy8rHjAONPAXfJ7OiNsNMQ2GoGr2wRPpLVBsHFjYn
 DwDuUDRR2.yLOckzdOyWbwWr9Ol39hY_Ca6bM0eo3EP_PalraRpmAf5Jb45Gsfrge5ACkgQvGxTK
 nlU2uZa6ZdwALtYxaz4KyafGpCAdtwDhl2VTB9B0ZcQZYKS9xBwqREsZwYVFxFVLhZ055U6pBpVO
 XQC8zSZ5aY_CYQ9sUTI0BjVci9rFB82d_Ghcjl0_DiSk6BAqX_O3ErR.rPcTFLXMkvJZNNqFa_2X
 Rm2vBtWjXERsewFwl5AFmXxgrk0j9vb3f_qKkBra34mxg2HhYvFgYBYgAL.k5oBCNvoXi1Y9ESaf
 2hZPD5BMShOqc8vdGVniyOmnT1VDolqm5EmqQxcnbJQNQ793G_lvO25iKkdC59t5iGtL2bUB3b7p
 J4_i2hsHp1iFtC3X3nBJqvw4qn6MeikEeN2qVaQtwRMba86JuSWBN60w2RGSlEUujETJPAJfqGqx
 HN5i00wqo6n5XTJ.WWGXIKgpYuMBkotfu2tC.RJrf7cxjgsvGUA3WK7TxN7upbHxvYs1b_JtcCgr
 Uwss1wtCqeVfa3AZWTiMhCcu6j3FATlp2k44IEAWVW0gOm5b.vgWQxtRc2Nhd1u96ptDmQWw6cKW
 colcZWqgHuRVKmprjeEraohuSuxhS1cO8UFjT4kyt2KlX_MVtGK48IQIGIU9JRclWBXgtXFia7lT
 PbSTc.Rc6tJRFiTqb_mXnRaVHUmiJmLoDoELHMmt24XsBKHtRY4KK5K6VCvUdXwtpaQehG.cFKuS
 BnaFlY56RUZ7kKnXn4H2B_KOMjIweV_5h3lYqc.dlONglns771Zfqjg1bnEhdhAM.XQeAkklmwPt
 xVFn4k_4Lam2IFvlDZ3OReDAxFyDksCxKFhRMSlvc_6.QezgM_X3ck74P5hEqdWo5Xp8a6Po_MSj
 iWEvT54iXkK56XdKO3iwgXXpJAe0qPoB6oA1M36qfOFs1X5AQew.ZpsrTKPnLW_Aw3GCijfxYBqE
 KhXZ0Gy_OmcyhD26vlUxMq7SDwyoEyLnHOZ5DKuHKQpo9qMT12636dEcS1ALQMfcZpL4aCP7mwsy
 u7Kk7BP0m0BPrqPy2ategRUIV5v4RhSwK3.bAVdztcjl8g1vvR0V63l_gRCUnGo7iVxe9mwz3YZq
 7dfhuEdZwELCP9tKa3i98MYtdd2jpDM_bpiCn192OoeAFxo7dtdCGwepO2FN24IG6W27eYFsl1No
 FFUKVrEO0SGjxHeIWOCftndsrWDPEmrLX17lkgMKPJsP8kYFt11QRVAL9A1IisNBwthIC6nDSzo1
 dPE8Q6MgonY1wt9sEJnf59F5CpVMln.HSb.1fQmHW3Jg8MIbxrwXHPBop_yqPWb8kvVPSek.zhOB
 kh1DXdbphXSmx26Kla33XfwBsJwwkN6A04nmpLAptzgeTGM1FDdEKb_lKxwVOVpmvvVklWWlSmqq
 nqt08QAwbmK234yp47oMFro1C3AXoty0fqNuX8RjQEH5VK3iR2RjWp6Y2PTYI4SMJEZV1OCk19g8
 ARUAnw6139bD9NbFIreafEaRsb5EC_PxbOY79ElWH.9PdeKwEL2z7.aLPwVoWKsliGSK5mMTPXo_
 .CFJ7lNlI6M5EZgGSKZaVd6NpFQ--
X-Sonic-MF: <pr0f3ss0r1492@yahoo.com>
X-Sonic-ID: 6d5104f1-0566-4cfe-a00b-cd2477bce750
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Tue, 14 May 2024 10:50:54 +0000
Received: by hermes--production-ir2-7b99fc9bb6-xrt8s (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1bccb330aecd94024871808189a0cadb;
          Tue, 14 May 2024 10:30:38 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so1114181766b.0
        for <linux-input@vger.kernel.org>; Tue, 14 May 2024 03:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEjFsXH7D+keNLR+t6lYXx2/ZMJlKo+F5QzsJB6YrBeRsOeeqy9WliQqfaHppbNUSpUxPgHc8LZHYiNMngFhMhMhiTvqCSJd1Hfrk=
X-Gm-Message-State: AOJu0YxgRm3wuYZl7u56l0ZNsqmyWj3qWqODOz7it+5ByDICGbcoth4N
	CZ7OKw6tCVc36+prLl+RKANNMOgynp5a5vHU1yu4U/HDCJJ5tyFHOrSAgHPjEaPrbZ9cZNBco77
	FmjJcp6N627VkGDIu8gdbxq4TIKo=
X-Google-Smtp-Source: AGHT+IEJaHIZgjuyP2pGPpSsRNs3yDp76CCvyFIFl2FEoyVdpYxrZrXWc+HoYHzBX5HgQgUjdln+Qbds7b6euo1sm2o=
X-Received: by 2002:a17:906:ae50:b0:a59:c3a5:4df0 with SMTP id
 a640c23a62f3a-a5a2d53b0bbmr1309460466b.4.1715682636664; Tue, 14 May 2024
 03:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <v08fjo$heo$1@ciao.gmane.io> <cba77b04e244e8b373c72ae1e13defe2b1078cd6.camel@redhat.com>
In-Reply-To: <cba77b04e244e8b373c72ae1e13defe2b1078cd6.camel@redhat.com>
From: Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Date: Tue, 14 May 2024 11:30:19 +0100
X-Gmail-Original-Message-ID: <CAEJNuHyRvEVdRBnOcegMSp=RT_2+4OvXPkaG3LsY1ASRp5NE_A@mail.gmail.com>
Message-ID: <CAEJNuHyRvEVdRBnOcegMSp=RT_2+4OvXPkaG3LsY1ASRp5NE_A@mail.gmail.com>
Subject: Re: Why does libinput randomly calls my touchpad "SynPS/2 Synaptics"
 or "Synaptics TM2722-001"?
To: Lyude Paul <lyude@redhat.com>
Cc: Andrew Duggan <aduggan@synaptics.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailer: WebService/1.1.22321 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Am Mi., 24. Apr. 2024 um 22:12 Uhr schrieb Lyude Paul <lyude@redhat.com>:
>
> FWIW: You might have better luck asking on some of the linux-input
> lists.... however
>
> you got lucky because it happens I've both worked on this stack and
> dealt with this exact machine haha. So I actually can answer this
> (response down below):


It turns out I didn't get any replies from anyone.

>
> On Tue, 2024-04-23 at 15:12 +0100, Ottavio Caruso wrote:
> > Hi,
> >
> > $ sudo X -version
> >
> > X.Org X Server 1.21.1.7
> > X Protocol Version 11, Revision 0
> > Current Operating System: Linux t440 6.1.0-20-amd64 #1 SMP
> > PREEMPT_DYNAMIC Debian 6.1.85-1 (2024-04-11) x86_64
> > Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.1.0-20-amd64
> > root=UUID=42a17f43-89bb-4523-952f-b8d97bcb4a30 ro quiet
> > xorg-server 2:21.1.7-3+deb12u7 (https://www.debian.org/support)
> > Current version of pixman: 0.42.2
> >
> > $ xinput --version
> > xinput version 1.6.3
> > XI version on server: 2.4
> >
> >
> >
> > On my old-ish Thinkpad T440, libinput alternatively calls my touchpad
> > "SynPS/2 Synaptics" or "Synaptics TM2722-001".
> >
> > $ grep Synaptics  /var/log/messages
> > Nov 26 09:12:38 t440 kernel: [18070.908478] psmouse serio1:
> > synaptics:
> > serio: Synaptics pass-through port at isa0060/serio1/input0
> > Nov 26 09:12:38 t440 kernel: [18070.947812] input: SynPS/2 Synaptics
> > TouchPad as /devices/platform/i8042/serio1/input/input35
> > Nov 26 20:33:19 t440 kernel: [27221.274488] rmi4_f01 rmi4-00.fn01:
> > found
> > RMI device, manufacturer: Synaptics, product: TM2722-001, fw id: 0
> > Nov 26 20:33:19 t440 kernel: [27221.314747] input: Synaptics TM2722-
> > 001
> > as /devices/pci0000:00/0000:00:1f.3/i2c-0/0-002c/rmi4-
> > 00/input/input39
> > Nov 27 19:28:05 t440 kernel: [    6.327297] psmouse serio1:
> > synaptics:
> > serio: Synaptics pass-through port at isa0060/serio1/input0
> > Nov 27 19:28:05 t440 kernel: [    6.366655] input: SynPS/2 Synaptics
> > TouchPad as /devices/platform/i8042/serio1/input/input2
> >
> > This without even rebooting or suspending the laptop.
>
> I don't think this has anything to do with libinput - Synaptics
> touchpads from around this generation will initially get setup as a
> PS/2 device during boot. But PS/2 mode is very limited (and somewhat
> buggy) functionality wise, so at the first opportunity the synaptics
> kernel driver will query the touchpad to figure out if it can be
> supported over RMI4. If so, the driver is supposed to switch the
> touchpad to that mode and discard the PS/2 device. So - it sounds like
> what's happening is that is broken for some reason.
>
> FWIW: I added linux-input to this thread along with our synaptics
> contact: Andrew Duggan.
>
> >
> > I have some scripts that disable or enable the touchpad (especially
> > when
> > I use the mouse) and I have to use tricks to accommodate this.
> >
> > Why does this happen in the first place? How can I troubleshoot it?
> >
> > Thanks.
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>


-- 
Ottavio Caruso

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

