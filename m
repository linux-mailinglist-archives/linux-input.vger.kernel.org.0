Return-Path: <linux-input+bounces-9784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10701A28246
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 04:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F34F1664FC
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 03:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274B220F082;
	Wed,  5 Feb 2025 03:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BATPmp0C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820562F46
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738724572; cv=none; b=jBSrSVIF24g6OFiypMeZYItVuMIrKCcYKuGDTXQpXkh1KayjMBvI2LEUe2woov4OthOedS5MkyI8yOzXFljUBnyY9KSpwGouzqOD2hnrztqz0RN7AyhAK9CXqndYUiAaTBQNYC72wts4WQnuyMenhcaHtX1Jo/p3keWtxOQKoNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738724572; c=relaxed/simple;
	bh=mLOu7Ps8knsSoSoYYugLBjJQSSu1IiyRDZynRtN98QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jkk4PNLXbEtwQHb85nwdE/z7ALlrKPgIrXR7p78seh2IQeqRol2+XPt0khLVZH5ZGpcG00BQOkCxo9mnnMlJI2NiVdW3B49R04nxBRrp/tWu5IVCUnEsidrSNl/jmyFMWunTaQTugcpXevcc1qZUYneKbkSFTKmmoilrBVGX3lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BATPmp0C; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e580d6211c8so6382142276.1
        for <linux-input@vger.kernel.org>; Tue, 04 Feb 2025 19:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738724569; x=1739329369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XczVkyIW6ecQZge8s+iH+WLJnY6ke8YMXn3Vd/IWS34=;
        b=BATPmp0Cos5BFQUGHeokxFFdYAEgouMmG5h+LmJAQlbXUsBG+GuEmEUHkWxnfyEbS8
         UyNagKoV6GFSWfgcrAaGsSuAdExr3lX5zSD8g19CvROJkeidB3s5TQ1Kb2+aMR4Egm02
         MyEf2D9OwrMaZAlBoPFHqsAoDiwrKZ6tXtcP99Cg8y+VQt6K22pfveyMpHnYTLVMKvvE
         WF6FLZxwSGv3lkduVthEEBvxDAgiT+1dJkaJM+BsHAWthzmpQNTsB+X53nfrnXVnKLMd
         CXJ2u3Uoxi93z5uWWUV3E+8OuKd2yWGbSc7slJK+pJHVfvUmjMiTrshWjpMbu2eRWJo9
         9BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738724569; x=1739329369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XczVkyIW6ecQZge8s+iH+WLJnY6ke8YMXn3Vd/IWS34=;
        b=cZiotCp5X4NchThQBXOxcwY1doK962RWt8k2r+CrtOapdEyMnS2ucbk+1GEX8Fe7Rg
         GwuOoZ8oSNjSAPlCmStiCVMLMeODiPzyQj8s0WFW14pfYALKDEIZVWK7L3STZhW5W5gb
         U/wKVYe0cHFKoKzJIT4nrDLXh1gbpYAKTXbqvjUX5O/QoxkDXZ4X2GLo1i44JRIs9ODh
         UC5iO44lteRf2/b3o1eGSgc2CCrAQ85GyH4qqObgh4ZbIm+fIolrvrjlUvbzzkxlpZ1W
         qV+5Jd3P1VqGibXx6+O0cav9DVQdZ3WeiEoyE5+iMBe3H/9YFm04g1KA5o0JT+Se526Y
         JJnw==
X-Gm-Message-State: AOJu0YyfOKe05u0IchrGgOJVH4eSRrwkMpR9L6jcWzqdlMMh8yw5pDmQ
	4d4H9BJhBLo93kxtHPTBlky9la1YUHLRknAtXejVPK9kazBCkuSj2UdiQrdbdVTxhjooWuRU3+Q
	DWxTRG8xPgfQ+8szSgF1oBrGYe2c=
X-Gm-Gg: ASbGncvPRRLraaeEujJlUFovpoSh3tQ3jIPO6EktJP+Dy+hSVZR+rLnA58ga9/C0D79
	Vj6nFWOVQeaZkn/YhodCR8443z1bdQ7vs13/wTBfg4NK0YRnTQ0ACZK7OfwVpPAf6DVmdwpvt3w
	M2VGXl02YGr5mFwd66yJzpSkFNsZR32w==
X-Google-Smtp-Source: AGHT+IFPfmGNLo1MYS4ocRTzz4SQf9neP3/sEeeIXLVFzkngM72tGA6AwdzZ08KatVa6ry8a/KTaab0R/UWO/EtgSb4=
X-Received: by 2002:a05:6902:11ce:b0:e57:f631:d26b with SMTP id
 3f1490d57ef6-e5b25c13367mr1115855276.42.1738724569327; Tue, 04 Feb 2025
 19:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com> <9r2390oo-6p84-5645-8po7-68pqr1p41p03@xreary.bet>
In-Reply-To: <9r2390oo-6p84-5645-8po7-68pqr1p41p03@xreary.bet>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 4 Feb 2025 20:02:13 -0700
X-Gm-Features: AWEUYZl4Gycpn_R1SBxjxcLSDWTpC97iYLz7BP2Oqq9Yy0QAfzm9tQl6lcQkjH4
Message-ID: <CAMMLpeTnJbzvbsjvDK_Ub+NutafC=WepE9qFiTQowg6XGn48fw@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 2:57=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Thu, 16 Jan 2025, Alex Henrie wrote:

> > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > index 7e1ae2a2bcc2..9767d17941d0 100644
> > --- a/drivers/hid/hid-apple.c
> > +++ b/drivers/hid/hid-apple.c
> > @@ -545,6 +545,9 @@ static int hidinput_apple_event(struct hid_device *=
hid, struct input_dev *input,
> >               }
> >       }
> >
> > +     if (usage->hid =3D=3D 0xc0301) /* Omoton KB066 quirk */
> > +             code =3D KEY_F6;
> > +
>
> Sorry, it's not clear to me from the changelog why it's not possible to
> make this quirk apply only in case we're known to have 0x5ac/0x022c
> device. Is this VID/PID shared with other, differently-behaving devices?

The real Apple A1255 and the Omoton KB066 are both 05ac:022c. The
hid-apple driver is only used for devices that have VID 05ac, so
there's no need to check the VID again. We could restrict the quirk to
PID 022c only, but if the keyboard emits the reserved code 0xC0301,
it's surely an Omoton KB066 because no other keyboard uses that code.
What would be the advantage to adding a PID check?

-Alex

