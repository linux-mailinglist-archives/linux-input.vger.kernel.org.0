Return-Path: <linux-input+bounces-10256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68307A413A9
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 03:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6B421891288
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 02:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603724430;
	Mon, 24 Feb 2025 02:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyuAAanR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947F1A23BA
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 02:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740365209; cv=none; b=i9A8/c8p6GkU1Ad59ZRc1h1mKKNiomvoT8tSz1q+zlRr4Pgq9M6uJdxdVsb1eg0uEKF7WIB+rJo7fvLbVHwi2nswF8Aa/pH7YOSAeY6p12FxolvSzo0S77PjTgRMQCLjrG1/L8JL98q8k/8cxQ8rhEXxPmmz03xO7r+hmzCTr4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740365209; c=relaxed/simple;
	bh=J6f0Ffr3rK5vkGDKjnZe9Ntxy7bL7IFtthkkDEgLAPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSgkux3GF3zf5h+JumRxl15TWJnMvfLVb+5VwKFcn5CoLm76DztkSdlcxYsgoOhfrObQnd0YOUwv1nSm2XTujtg97ARoh8gMNqw86kKz1L4FS/tbbU5X8iJSme5J1EKWvNA28gP6Kf8o0KNLyPsf1/ivld5WhIqrpvjglCZxvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyuAAanR; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6fbaf4cf2b5so27713927b3.3
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 18:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740365206; x=1740970006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6f0Ffr3rK5vkGDKjnZe9Ntxy7bL7IFtthkkDEgLAPI=;
        b=KyuAAanRtey0huRlAQSzlsplH4zIKbKd74xN8rR3n/zI5ewNw+kFgP06P0FdH6Z9t+
         Gm9IJcQOwMiT6LO8NWEeFL59UekyN8d7taQbebyL+fgO9fLEqSp9g2btB8J2kjezZFqv
         j2gbPABBEV/+WQMIoSSFSgKYIoL0c7qEkndIWApC3THJgyx1q/eadA+JUOCsXuPnwO/P
         nYQRSM4VPVtjZyiwjex3UwTPTdcfw2V4fEfQrOWsTxYu2RPXwMgIKsJBCBUrPl3TXqXP
         /23uban3OK4kl9c/Ews06xjb7/DEpftHKZevdW5VidurpAyyMRqLnCIDC42uxnvv2Eqe
         1TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740365206; x=1740970006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6f0Ffr3rK5vkGDKjnZe9Ntxy7bL7IFtthkkDEgLAPI=;
        b=jtHGOHDweQwzCIFjtu+G/4CdJuunUUpnH+Jj83+0sSnHCJZ5BICuXn2eWroHWsqcST
         Ym4AX/G6ByfTz88rAzXKDy5oqd9pCB/7NrcmiRVofrNaaZXidVUBqYQ6UgMj2+5UThJZ
         tB3g+YS0PfOf3jcdJtX59nw+ignz5K2r9hK/dQPvSxI99Wb0LjkjW9z6wc0FoJ8bmr25
         BfjMMycVf1DLPvcnlF8fHgwwfkAYYtAi375fIGujLHiM8n7q8q3TNOqQmEYu01h09h5F
         uk0MMEXQyL0jxHnUgQR5r7Xw1202o+32SsEhqn11ITerh/3Uj/mJYBbZFgHuyJJXuVGp
         QVYg==
X-Gm-Message-State: AOJu0Yzw1VtUUn8RVZMa7kQWMXnQAalxIDgq0UWuT6+13Paf+W8hmQgQ
	IUh8EKdaOm4KSEjm5qnKIYol8xcfUMMY7Yuk25NKP+RrrXOoSOR+7w+jHMlkyARMqh4C8uFPJ48
	ECIsCpml0BIMwP6AeNq286zddVQI=
X-Gm-Gg: ASbGncvgnTKbTnsq4ogmihQhf7w4eZA8vvves/BxYjSeSacapOlQTlmFYCql9hvC8RT
	1Qn2Nmf74+HeDg1nCZRvTpmbRg4fHFjvDe+WPH/dnvnl64Zudu7E60QMAyJuYmdyit7GY1giFig
	yZ+ee1d/JESY6eFWkVRuIXNEVsJ51suYidL2HFvjw=
X-Google-Smtp-Source: AGHT+IGzOpi6QB3/D2+Dr0cPK8rLTuz8Hy2kqDkmqboXh9uyyqDKbO5kLtQo/ryIDfw8BC7Nf7l+SEo7pHcbc5JtDUY=
X-Received: by 2002:a05:690c:6e07:b0:6fb:b907:d965 with SMTP id
 00721157ae682-6fbcc1f2389mr98765887b3.3.1740365206480; Sun, 23 Feb 2025
 18:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com> <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com> <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com> <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com> <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
In-Reply-To: <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 19:46:06 -0700
X-Gm-Features: AWEUYZnPCmFBoCtr4gywDNcheRtUilA4lpTCqBH8BpSQEuRGpdpiaBmCjQNeLRA
Message-ID: <CAMMLpeQW2LhK__fXvQbFLumrVNSzvU0=bwFgzmMkRf137X7s2Q@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 11:42=E2=80=AFPM Alex Henrie <alexhenrie24@gmail.co=
m> wrote:

> If I understand correctly Mac OS sets each Apple keyboard's internal
> name to "<username>'s keyboard" by default, and that's what mine is,
> but a user could conceivably override that with "Bluetooth Keyboard".
> It's also possible "Bluetooth Keyboard" is the name that all A1255's
> had when they walked out of the factory, before they were connected to
> an Apple device.

Today I successfully used a MacBook5,1 from 2008 to factory-reset my
A1255 keyboard, by holding Shift and Option while clicking the
Bluetooth icon in the menu bar and clicking Debug > Factory reset all
connected Apple devices. After the reset, the keyboard's name reverted
to "Apple Wireless Keyboard". Now that we know that the name
"Bluetooth Keyboard" is not used by default on a real Apple keyboard
and is unlikely to have been set manually, I think it will be fine to
have the hid-apple driver behave differently if the PID is 022c and
the keyboard name is "Bluetooth Keyboard".

-Alex

