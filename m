Return-Path: <linux-input+bounces-9126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE451A08481
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 02:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D623A06ED
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 01:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF4C286A1;
	Fri, 10 Jan 2025 01:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTg5LECj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01CE28DA1;
	Fri, 10 Jan 2025 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736471361; cv=none; b=ogSoMHrNDEpyNAI7GX4UhPBHr1iLUvXRIMP8gimQbSadvwp/L2RyICjEdSbuJn6LHFTZyc2y1v5UIqUJ7ZEAy+y0cr1+3X6qhHl0iQuUyW83fu6Fju0QI5fLalgXojPyPm1vBvvJNYEKNHsP0PwLvRU6c5h1T1HdICWGbNufQpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736471361; c=relaxed/simple;
	bh=cAIv5QE7Duozv9RCUjUUFDAbEVyGycKa0TaC0AwBi2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKLassvFYzKAmKDlrVHAede8pZIKQb1scza33Ymmqw06+Tq2Y7FNARxvakwjFFZ5nkvXpqOUVIfHFTMU3w2zcSIqEhYVPTILsnn14BEQMaoLoAACcDkgXqAEF5cApjodYTMdOKzb5i2iivoQdDdfaysovKqeZiF+t1V5fWXEY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTg5LECj; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so2066406a91.2;
        Thu, 09 Jan 2025 17:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736471359; x=1737076159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyjBLfJVThuq0892V6wGv6EDLN5m3GCNmjq3Cmh1Cow=;
        b=NTg5LECjkivHK4IfW3Iy5w0obstO79tGuy9DBf5zpkDah03R+Difns3B2nltR3dGDx
         soariVK3EISd7AMP+rLFVqHYZP3JI5LT+BBRlFaPjrCsSz2xR7M8Y783thS+CHoUk/Md
         BvhPx/crsxzSLHvO2eKWX1/lHGGt6XiuRcqp03oRi5cNgLEr4Kmw+rBWjY/LzzGW5ONN
         8bPCPRKtGrVXuG//iPawKxpSznIWM2kk1w5YBDoR572v6xIjMjQ9H/rKyjYSiF4bioiA
         2GL1+8CiZZoOvsKepHQfffi1QB9zFiDHbeD2uA3/JNP0zUOOLCy/7VSYikHS7bwul8x0
         1I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736471359; x=1737076159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyjBLfJVThuq0892V6wGv6EDLN5m3GCNmjq3Cmh1Cow=;
        b=TffBpqVGVh25gIuMPLMzW3+T1modAd+ISPm0udJTTV1yWXaM5W734VuzUBAo6Xo/C8
         cW90rdNIwAeO5xgVkkSh5hbsaWOnQA2pnWO2jbo/AcRKNPXRM8n7UJHbCXapILObCQKq
         ptFRJwhMUjsU/EymZhm9sx6vubMp4eRnHVXeyejb0qzVK9UF5VSNmmH7X4kpuxEFL7kl
         XXDRKt8OkryO3W2gKw902mVIQ2grlwmDdA6KL/NrH9TuXINcTt+wT0w80dIDskxpoePa
         i/v+tI7EHxOOvSMPKOZeq6oJyhLRcx6fTMpgWTCwSC+N9544HRZvknqKREaxEFnIAQmM
         vG8g==
X-Forwarded-Encrypted: i=1; AJvYcCUOabIe7fB/RXbWzr2KXCM1opar2fgBNmXYSNuUiYhOWidsh3eP6TpzpzHylon8uLdBmAelrmNejY6rpg==@vger.kernel.org, AJvYcCWNja2tr6dBCfGGYrw02NvyFCcPp4IsJR6USUmIeV3aFcvkV7tykIzUkQk7yJ+s6EXA96CmgEQ5oxoLg5lj@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3ZFRXHMjYXhXj8bLaQteLClh8vi5PLHQvLRXPwYzK4jZ2Mlm
	eql5lhA40v9TCQMtkRei4ZVSklcfFOohzfkuaad33k7YJmct4y7pEKfAximKwPX+8Cln+K6c3ik
	a2w0cr284sLVqVd2qvD3+4jWRfgQ36PCY35dbdZo/
X-Gm-Gg: ASbGncvv6owsGRJScJ/F3MWFUQHas4k/55fBmVHq2duyHHw5nUAUv2iAvE8CAdk7I7D
	83cmusGh91MZkdyPNQpUnJD/STflyyfYIROk=
X-Google-Smtp-Source: AGHT+IHO8Px5s/2GWAXtrxebbac4pI4Q7E7pHPU/LY/5D00FAsh8wSIfg139HeRcNLjxsaSb1A//JIV+aN+rqcM2HiA=
X-Received: by 2002:a17:90a:d00e:b0:2ee:90a1:5d42 with SMTP id
 98e67ed59e1d1-2f548e47475mr15195596a91.0.1736471359145; Thu, 09 Jan 2025
 17:09:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218143309.86811-1-vishnuocv@gmail.com> <dytaipha7hln7ktsh3qpwrtlygtn44bv6y2kqr4nuao6ozfd4s@txduug3hioo3>
 <r9p69o0r-626q-950r-o73r-p67r88nrp70n@xreary.bet>
In-Reply-To: <r9p69o0r-626q-950r-o73r-p67r88nrp70n@xreary.bet>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Fri, 10 Jan 2025 10:08:39 +0900
X-Gm-Features: AbW1kva4fJ-Kpd37CEo_HWmlYN09LlXIpmuv3cX-SdFPTG-jtUGMFMUxF_vm7z0
Message-ID: <CABxCQKvEOwZVnbCpuW0rdDEQuwq-ihReG6Jnw8f3TcYMvoPJzA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Thanks a lot, Benchamin and Jiri for the suggestions.
I will send a fixup patch to solve "ERROR: modpost:
"platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!"
issue.

Thank You!

On Thu, Jan 9, 2025 at 11:12=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Thu, 9 Jan 2025, Benjamin Tissoires wrote:
>
> > > +           /* Power-mode or Airplane mode will be called based on th=
e device*/
> > > +           case TP_X12_RAW_HOTKEY_FN_F8:
> > > +                   /*
> > > +                    * TP X12 TAB uses Fn-F8 calls Airplanemode
> > > +                    * Whereas TP X12 TAB2 uses Fn-F8 for toggling
> > > +                    * Power modes
> > > +                    */
> > > +                   (hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TA=
B) ?
> > > +                           report_key_event(input, KEY_RFKILL) :
> > > +                           platform_profile_cycle();
> >
> > Hey,
> >
> > FWIW, this broke the CI with [0]:
> > ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] un=
defined!
> >
> > We are likely missing a DEPENDS or a SELECT in the Kconfig
>
> Thanks for catching it!
>
> Alternatively, we can just make the TP_X12_RAW_HOTKEY_FN_F8 case
> conditional on CONFIG_ACPI_PLATFORM_PROFILE.
>
> Vishnu, can you please send a fixup patch?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

