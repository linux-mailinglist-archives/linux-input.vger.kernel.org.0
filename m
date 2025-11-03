Return-Path: <linux-input+bounces-15862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A157C2A070
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 05:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7921886A5E
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 04:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627D02877E9;
	Mon,  3 Nov 2025 04:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+mZZQll"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4149262FDD
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762144151; cv=none; b=elTL08uPnH2rVFwCzvAHjEMvst3M1+xnyq9whF2T3SMPAZf9HNDMUXSV+vMZFRVtMRhgAwLGK0P2OqLDLmmtVACSR8uk1aKo7qBfrcqDFx4kpDouFK1NiG+V2Pjlm7bd0R7hoOquqFXXC4NxfapgueZeHVi+FEJMpYRaQld+TZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762144151; c=relaxed/simple;
	bh=BRyq2xvMBfZJNr2slPuwGEUwckfTGKdksrZ8m6uaT8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPBAx0iyAXpKm5sos5WBD1K5vLTYkRCnuBaHTkxtcqlUdzoKESgH9ezULCTNl8YQmZ/tAVgUrSLeTi4cj3ee4kqr28Vewduh85wAruC9x/I4s/aL2k7HvyqbVBU+n2mPtdf6jg7gFoHe8aXLOJ53PRMNZ4B4Lp7x3+d9kC1Ax54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+mZZQll; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2952048eb88so38028935ad.0
        for <linux-input@vger.kernel.org>; Sun, 02 Nov 2025 20:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762144149; x=1762748949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zejBsmGw8Dammq1NbHzRkUXu6Tc3VRpWHGPbCKlc5tw=;
        b=Z+mZZQllbVd1w80ndj33spWHb3PKU04g054vtrTNuA8mQV8iG9Nej6G+4PdgJ/EmCG
         L5SNo9Pi7toyodkQsLsPl89RHC4EjPMIc2ZGP/WzMzMPyYYgX5zEVC9JubSfCTtaJ29X
         EbR8JWU9+ojC10/JUfSqdc+T4Tf7zMlCf4uN9aR8I8drUfl7tu7jBpNLJfEk83mQB1l1
         10rmv6F10LTNvgaeOknWC+xuQOwCS3ao2HkBlvgQVstVm2Ed1fiHpMDvPBZ2DqHdqoMv
         TbRllIuara4v5xR97QrQ1yTTpyaNNw6vHYy1Hc8Wt7Utv2cJ7+xDqQNdlIyMh81UKR+N
         Augw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762144149; x=1762748949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zejBsmGw8Dammq1NbHzRkUXu6Tc3VRpWHGPbCKlc5tw=;
        b=EZ6nnQ4lot35wvgNBxCKWc6QlcFuq6Jwl/iNVRIdwKkaR4g0W+5zeB1sP4xwamWWUx
         O7wZ8pMFKWiWNxK2Y2xKaiZx4LWwvbMuLfuBmstLvX/9ur9g77RAQP+oOFW1tbzETW+7
         PgH2aNOHAhF1uip9yrahp+jTVkyeLAR85heRxRRrUqVjBBmJ5fDLr1UOLDdwigGAZZ54
         aL0puLOJOSSdeTH6UwCbjfhFL2BpPlCWDoonCadgjxMP+ApCP9uAl5qKIZURiCgAK0KQ
         j4FEgKdgTTogpOzUYtS/rn/gIzooCq8pD4eOitYq/UVeNfkXxtvYM1iKv/kql2KvXd/a
         NV+g==
X-Forwarded-Encrypted: i=1; AJvYcCXxaA7hMs5IJSK9uURFBMRHul/ZFjIw7Z2800CjkjOvI2V5jJBBs4JTq7+XfirTwktV23CxiRSQWDE4rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywes7njDwQbswdagirOVZAicJWyDV2Obx8CkGeO4t8OED7kTuiP
	VsED3Qz2fT8da9w1CsYcxtZcKIlCZj+iHIETFTtgJp1Vce9b+RIRXOkM
X-Gm-Gg: ASbGncskE62sHp7fv3/xy6zHsNY90Xq582obRWrO8OUtA2aN3Io80HVigPj6wdgC/vA
	uqGi+IYkpXKfWHKBsncEL7Qpxkg2ZxPLu1XtSG+h2+0n8Ow1l4Eeb3JuIGzdmBoR4tu1f/VP1cy
	XzaI+3X2S+GF97ZuHZVJEXmGSTW3V6fybMLJpiWfCiTls6izdLchqJ3h6hEisUiXzKQyeMG+2xs
	Y5Ad4s8whU+1tVqrFHGCu8f5tIbG03Qx/Sr/UKYJ/tKaSKA3tcslw56qGLBKPwUVeOQ7FnIEsPx
	KUrMycjFwUgBSH4a/3i54sgpVV//71Fg0zK1TNGzZbdkpVbeK1ePy5Xg2iuSCjYC9/wKAMcS0Uh
	WP+nHMGreo6rqA+7B2scZnEGB8o229CGSYCkoJbjSqVzFrmkpN+tALXC6/gb485YlNVk5Duot4B
	Rb6Wum7VfusYePucodNBX9dl/teL4j7cB1CGq1+qk1qswewL9pCl5568Vl
X-Google-Smtp-Source: AGHT+IFMAMIRr2XRxTxO6CYjUyJFceUddY16xeDxgm+N4RkpDVMPqTEsA7hTMjJvGq6jveVSi+he1Q==
X-Received: by 2002:a17:903:32cb:b0:295:f1f:65f with SMTP id d9443c01a7336-2951a4debf5mr127576615ad.31.1762144148913;
        Sun, 02 Nov 2025 20:29:08 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268cbad5sm103047725ad.45.2025.11.02.20.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 20:29:08 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	kernel test robot <lkp@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
Date: Sun,  2 Nov 2025 20:28:48 -0800
Message-ID: <20251103042848.9302-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
References: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
>>
>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
>>
>> > >   1589
>> > >   1590  static void kbd_led_update_all(struct work_struct *work)
>> > >   1591  {
>> > >   1592          enum led_brightness value;
>> > >   1593          struct asus_wmi *asus;
>> > >   1594          bool registered, notify;
>> > >   1595          int ret;
>> >                               /\ value should have been an int and
>> > placed here. It can take the value -1 hence the check
>>
>> Thanks, that needs to be fixed before the final merge.
>>
>> > Are there any other comments on the series?
>> >
>> > The only issue I am aware of is that Denis identified a bug in asusd
>> > (asusctl userspace program daemon) in certain Asus G14/G16 laptops
>> > that cause laptop keys to become sticky, I have had users also report
>> > that bug in previous versions of the series. WIthout asusd running,
>> > keyboards work fine incl. with brightness control (did not work
>> > before). Given it will take two months for this to reach mainline, I
>> > think it is a fair amount of time to address the bug.
>>
>> One thing that is not clear to me about this -- is this causing a visible
>> user-space behavior regression before vs. after the patchset with asusctl?
>>
>> If so, I am afraid this needs to be root-caused and fixed before the set
>> can be considered for inclusion.

>Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on
>ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
>confuse asusd. Since the devices are the same as with hid-asus not
>loaded, it is specific to that program.
>
>
Hi Antheas.

While you have previously expressed to me directly that you wish InputPlumber
didn't exist, it still very much does, in fact, exist. I also know that you are
explicitly aware that InputPlumber is a consumer of this interface, so your
comment that asusctl is the only affected program is something you know to be
false. This is not even the first time you have renamed an input device that
you knew InputPlumber was a consumer of without notifying me[1].

I can't abide you outright lying to the maintainers here and I'm sick and tired
of having to watch your every move on the LKML. Either become a good citizen of
kernel maintenance, or get out of it.

Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on ROG")
Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>

- Derek

[1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/

>We can delay that patch until Denis who took over maintenance of the
>program can have a deeper look. I will still keep the last part of
>that patch that skips the input check, because that causes errors in
>devices that do not create an input device (e.g., lightbar).
>
>Antheas


