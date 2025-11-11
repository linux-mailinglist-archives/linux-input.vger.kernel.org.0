Return-Path: <linux-input+bounces-15994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1DC4C4E2
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 09:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 575813A2125
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 08:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C0A2C2377;
	Tue, 11 Nov 2025 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9lzz7Wb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B83231A30
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848512; cv=none; b=T4l+dTZ6tyVTfNMkz+ZLOTzTLRfB9VZTJmMDEKSso3t1DhzFsaXfB2uzv8BCkqpp1P7IjCkbC0jB4YBqfpHDA0IRFajJw7RtALM7LnK4EAzXC3zylFSsVaQlFuCxEwSurjPJriyKOXEXbd56qznm2uqPZblVxLtvDhDGAfSIH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848512; c=relaxed/simple;
	bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXoSR5Ze3Lr2qI9/xoChtYCgWPsFjdOS92p4tKfBP/GFAAOYVhHgcmFT3m//X2TFHAYSS8QZ4L8MhiNacdVML1kSXAv05zLQLjZICRDt/CA3X4YH61Qx4HRUv1Kb1/Sa7dL9cmLf2IOrAOGFgBT0jcZlHwIQzvxUlSKsKAjZWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9lzz7Wb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so2728357f8f.0
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762848509; x=1763453309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
        b=W9lzz7WbCkEDK12RoaXsBUeDy1V47hSyLmtCQQS9t/5FTlZI7fKa92tyUFW7RLVRd4
         BJkV/0kkRjvYMVXrYaFRXt+MVZv5q/pweieSwwZ7VU+JIELWqFgD0bheJHpOQYR63ON4
         GTlNcMM000B0O/VTp1AAANjlih+YgQP181Vby4hatmS/9ZM6ZdG4eDHAt90qsJ7Pvmsf
         rBYtQLt5E/kTSFk+zt/CJGMii6X5v2c2chUmNe/IZJSkVeo1/fODkyLCNA4L+VVIXtK6
         hcD/4jZALJgZQpoyn3OS+kfFoqQj/X63HXSTn3xnSV2k8QtVb+HRuMmGFS8jRmd9/5v1
         SvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848509; x=1763453309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
        b=LM5Vpt+e9pI1+vZ2OWmLCarOCFHwFNSK+n+jhlCMu7UI+PtWLja5r1Z0tFCoAZ+q61
         2p4n+M7+CB7oi2mQ4y3hqW8bRDNvDqOgIsTBJ0OLXJdw+hUFrgWiq9JxGakW6YhDsCF5
         yAs3MtbnJ9EHBUhCmjHX3ijGOQVwThF7jyL4M+xGHozbj9vaQjer945iFgNuiITh8wYK
         XM2Jr1jAOyDgC5G9N8UbQCBlwv3aw/bPqUk9MJucdsURYcWVV+m28Ol5y/kJgt6inyCt
         VOlj8Tmy7S/ukmb78zz9tsX4y3hLWGMvr2fIeSm0qV6sT2fq/o0j5kMNSc2+YywMsVMp
         C/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWRG9y4ciEBgc78t4mACA1Qs5ztXxHEP+MQaLhkdLSqXRfQUzdJDm90IJUC3YjpOtCXrgWlY2tqo8dWvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyv6sipm8KL2ghrt/lj+/Ha7NlCLD/Vo8dUN1eUuxkVqW137v
	2082az8rm+UmziFEbAJMx9BL0q9k9kuzsLSLL5/kguNyWdSthWD2bCoaoLNrBecDiv2PTtv2WC0
	KCtr0icBbcnZgBHdk5GU67AXCUq/3rR8=
X-Gm-Gg: ASbGncs3wmMdii3Jx6MoetaHVyYQgonZvFNWcySh0BWwDkO0RkKCFQcbvREtD1O0LA1
	KPssN2KfscS3Vg2UMp/vaOB1/WKunlC8V0F66gdbXlvN4Ao3cpVl8g6JMcDXhmZtseq7Eq6ZO6b
	r9y5xu4XQFv5oRAo3LjimWwAF7jHjNqarQXqINWsCV3TUOi1HBi2rNRB1wlY2EKQf2zxqVxwwkN
	c4eQ46MXY7zbmv2sXaEJlNTcZ+hjDq2J2xX7cYq53jJP1bIjilHL8QiFY3J9FiCiCaUiUyM8sty
	fK5viF7kb2Kk7tWokTfU2lF5N1Jxz/5uXBwtJo7cd5CSU0i/a2XT1sOw6skEL1RP
X-Google-Smtp-Source: AGHT+IFvSfTIU4Z4qFzOo2YJfLilhL94JX4cA1j/1rEFPdljVva6t9U+b00rwrHwvs9/nnWZ5H+ImqldCjksQoIqQAs=
X-Received: by 2002:a05:6000:40cd:b0:429:b958:218a with SMTP id
 ffacd0b85a97d-42b2dc4967amr8587827f8f.28.1762848508970; Tue, 11 Nov 2025
 00:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com> <20251111074205.1533558-1-lugathe2@gmail.com>
In-Reply-To: <20251111074205.1533558-1-lugathe2@gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Tue, 11 Nov 2025 05:08:16 -0300
X-Gm-Features: AWmQ_bmDNcXrvdWFtWzr7GXasgYB3WfrnIRIsSzhNeM-NRsY4FCwIBHXAWepbOU
Message-ID: <CALvgqEBS3NJxdJ1LF2j5g3q0DTyU=ZSFyeygDP1eitgRwSjvmQ@mail.gmail.com>
Subject: Re: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli
 Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that needs
 HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the RGB
 brightness with the physical knob.
To: linuxhid@cosmicgizmosystems.com
Cc: bentiss@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com, 
	michal.pecio@gmail.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you all! This was my first time contributing.

>ALSA and the rest are triggered to bump the volume up or down with the
>Consumer Control Volume Up and Volume Down events. Those HID usages are
>declared in the other HID interface but never fired as your testing shows.

Thank you for the suggestion! I might try something like that in the
future. For now, I=E2=80=99m happy mapping the codes of the speaker. Revers=
e
engineering is so much fun! I hope this patch helps others avoid the
frustration I experienced with this bug haha.

