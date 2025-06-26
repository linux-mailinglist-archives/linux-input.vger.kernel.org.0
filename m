Return-Path: <linux-input+bounces-13089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA799AEA559
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 20:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 464017A3635
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 18:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730F32ECE80;
	Thu, 26 Jun 2025 18:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULSgqmDc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9420C46D
	for <linux-input@vger.kernel.org>; Thu, 26 Jun 2025 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962326; cv=none; b=f2z3Eo6rkJTcCP30TcZJuFbgiM+P7X1g6lWHbkwhhabYo49L1Tdg/cneQ5QGrO9aN2AYhrientxTH7zVFY3poCezZxqVmputmtB2niN1VFY/B/S/zSmNWoGrRQqj9db4pmwJ6T32ZBrbQK6PlDsa14OA+1K2OC+TAk48QXPtISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962326; c=relaxed/simple;
	bh=KGzEnqhRAms/VjXefL7MW1hexp98BT9h7xj/AKgt1cM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=lW/jcl5TrpqPMlaemNOS3CmIoA6BrwvFKDJDW2bE0nPLbfTPWhyrCaWyuQQUDSdZEAMnmE6TMjhVkg89J7uNWvHNVqaw49bKU7AUl0zqU9xhof7Gmb2BAJdZr9WeQeWvV7XVyWwuOg5x04PTZSSnEVJxmnBq8JGP6EzEO7MBfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULSgqmDc; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d41cd4114aso207235985a.2
        for <linux-input@vger.kernel.org>; Thu, 26 Jun 2025 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750962323; x=1751567123; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXZ1zOKW+DKI+NrN7T4UqnK4Zm/RWKKfS4DU2eq44lI=;
        b=ULSgqmDcMcygpWHjCoiXnr4adlYHxQWPv+Hd5c9bn6aiuIgopmjqGq2VZWGESxOMuf
         W4mwAJQXPmOS4TdQ0wXDTo4HfeCqM/q+FqZq8gQ1Sre/EqHA/qHKd1XxHvn1exkr0OC+
         WfoO1IoCZy6tRiDyvwKJl10R768VSL9pW2kkRUEuy/1Cl2rP/D1BR99lgORGgXWgJaAj
         r593/eVKQEstpWAoZA9+mPLg6BEWgO5RaSDwE8EbhhaOgtCLbdg7NQfictN3Bfm52wme
         xa2+UZHQbHLnuzMcBO0vIrk8Kun5Ob1m8V8E6lRKKJ5ovW8RdO+CO+pIBSBMj31c1K7e
         s6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962323; x=1751567123;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hXZ1zOKW+DKI+NrN7T4UqnK4Zm/RWKKfS4DU2eq44lI=;
        b=jYbEuvVc/G56AOifcfgxE/RJyQZ6KOL8reP4/7pMvMe+5o27CvWnEfKVtJB1UTZTR9
         NtHGnr6PN33DSLX7fhyn4ULvog934B7majUiZQ61u+oCbx9KKptJVNMXJzRTQqS3jnq3
         vgue+JBRezxyx2b1YpCJnR0miV7mDVAAIwbYxYToIjS1ET02o2Wncybf+tVBss8BvHJA
         NzMsj5rfuRywdR/qcglNSqDhCvdqq9mjdQllK8H7WgiZaVQwv5NMtrXe0+39RM+ap8jw
         9bhqWAwGj9XKsPr1wRkTq4M749YFt82ww3uhaZMk/KG3TnLsEYjcYbj8YfOks7UcCxna
         7UNw==
X-Gm-Message-State: AOJu0YxqwJVnZvWzqIt4GtvsyR/qN+9W7qDC8hYiO+uumkoQAnVF9SBk
	JOAAUVwMVTbZa6Oy6lMGJA02jRP88zhJXSSv9r9rfVDNn9HHUj/lwGXZKVxazowq1uk=
X-Gm-Gg: ASbGnct0cSGjNkC9rElQXuVdU6jut32m36hN50Eh/EoHe8i5qG+6+BLAaFTf3ebuvPN
	sgv/mziGnqZ2xOaqAheWX9p06M65/9yllQlNQPQKEdR8YqM1Mt362kFZSnA3eCTBhXHhEsmqfiM
	pgNP8QuZDOPn1w1SJMlRoZlW9cuQKxmrAmfMiUMXACJpCB+ZgukW12hZAiSksSidkF3Rf1mLdu+
	Ku0n21/y+LrP6z8CPCF7QMvOWkhQpJM0/Rg0x9tZA7AM0OmMuIaO9Yh3tgPpjwS0y5djDfp3PVD
	xtae56WEmtStBGDswP9gjlTJE69kmKEPriF6RJNRXLmsI7HpMlNTDV497NcSQIHEbyxK/E5D6mC
	URF6rwZ5jKh23Anp0XHI5npYVlnaPb/hZ87LDmZR8b+c40g==
X-Google-Smtp-Source: AGHT+IES4Q0Xt+M1EWSVF/3eXvG3NIZrq4qYA+QJNqdKUNkXqsWAkUc+LOgyA/Rwy+ImoHMTqueW7w==
X-Received: by 2002:a05:620a:a91b:b0:7ca:e971:8335 with SMTP id af79cd13be357-7d443927551mr91586885a.8.1750962323359;
        Thu, 26 Jun 2025 11:25:23 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8d9f:c837:db3e:c20f:6393:ca75? ([2607:fb90:8d9f:c837:db3e:c20f:6393:ca75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e671sm32541885a.41.2025.06.26.11.25.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:25:22 -0700 (PDT)
Message-ID: <b2d0af40-876e-4a2d-99a2-236b583e9497@gmail.com>
Date: Thu, 26 Jun 2025 14:25:20 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
From: Nolan Provencher <provencher.nolan@gmail.com>
Subject: [BUG] Touch-pad is stuck on slow poll rate - Thinkpad P14s Gen 2
 (AMD)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Good afternoon maintainers! I wanted to report an issue with the 
touchpad on the Thinkpad P14s Gen 2. The touchpad has a delayed feeling 
compared to Windows. Gestures are very hard to trigger on Gnome 
environments on Wayland. I can only trigger gestures if I move my 
fingers very slowly. This issue is persistent and never changes.

[specs]---------

Output from libinput.list-devices regarding the touchpad:

Device:           SynPS/2 Synaptics TouchPad
Kernel:           /dev/input/event11
Group:            8
Seat:             seat0, default
Size:             100x68mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge
Click methods:    *button-areas clickfinger
Disable-w-typing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a


Operating system: Ubuntu 25.04 -- problem is persistent on Fedora 42, 
Ubuntu 24.04Lts, and Ubuntu 22.04Lts as well.
Kernel: 6.14.0-22-generic
CPU: Ryzen 5 Pro 5650U
GPU: Radeon Vega integrated graphics


[errors]---------

Output from the command 'sudo dmesg | grep synaptic':

[    1.746739] psmouse serio1: synaptics: queried max coordinates: x 
[..5678], y [..4694]
[    1.781081] psmouse serio1: synaptics: queried min coordinates: x 
[1266..], y [1162..]
[    1.781107] psmouse serio1: synaptics: Your touchpad (PNP: LEN2073 
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are 
not used, you might want to try setting psmouse.synaptics_intertouch to 
1 and report this to linux-input@vger.kernel.org.
[    1.847774] psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32, 
id: 0x1e2a1, caps: 0xf01ea3/0x940300/0x12e800/0x500000, board id: 3471, 
fw id: 3584089
[    1.847823] psmouse serio1: synaptics: serio: Synaptics pass-through 
port at isa0060/serio1/input0


[notes] ---------

I have the kernel parameter 'psmouse.synaptics_intertouch=1' set and the 
i2c-hid and hid-rmi kernel modules are not loaded according to the lsmod 
command.
I have also attempted blacklisting the psmouse kernel module in the grub 
configuration as well as creating a blacklist in '/etc/modprobe.d/' 
--but psmouse persists to load regardless.
None of the fix attempts I have tried have resulted in any change in 
symptoms or outcomes.

Thank you for your time!


