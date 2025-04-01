Return-Path: <linux-input+bounces-11463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3EA77ECC
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 17:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA8016BE3D
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 15:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1B720AF68;
	Tue,  1 Apr 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dELENsSP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27582045A0;
	Tue,  1 Apr 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520890; cv=none; b=Lw4Ef/iiqTU+zdihZ4fYrQrNIWpP9A34hiDN6yI5qq22Lqmip48vRZwa6H2q3D3b6eWYuq5tJaP9dH8X2iyfux3UetMHn0OCoOX9Xr7M1pL6F0C3orpy9MXDGYnmNGnp++3QUVNc/GkyQuVWcoHVgYb82jFCIvmnHZo5HHyzESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520890; c=relaxed/simple;
	bh=2/sLI9F+Nn0pdqlO+tq/dy9MrxErKUnS0lNUUkyhWVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4JsJNnoGV3rnHbRYcdngwCWEQpsAI25MDCuKJw+7ZFZurCYaEp4PuVc1stQrLdD69LgnownZOnywj2xgo8Inb+GcSFnJBW4EQaEowbrwcx7jIVN7Ko9XGREKDS7+sRg0AGSgMERNCl3TN9ALCH8k77E+Nr1AYXqmUf9yu1Izug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dELENsSP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so6201854a12.2;
        Tue, 01 Apr 2025 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743520887; x=1744125687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lViR7GADW4UfMLUl1znhVZFZ6r53i/a2wPXEO+I4/jU=;
        b=dELENsSPvSxGE98749RWPeSZvUQmrpdl3DVBe+CgHWDxJlxV8XlCa5vKeBoXdFdLaQ
         N9eiwzExYtPAM4h+jOnU56LynjV+XQ2BvcnD1XgyJ9cmt31RaojUfZMhFUX3CuTXLwOu
         DvDtHqnwsNfqk3emTt6UYXb2TwSlXgXmVHDkxvQCtCbDYinj0CRyiDM1rQ68Uf8sdFs9
         2NPqrnVzHZqdmFqcbG/NJNpkiWXwPysy3l1opP8gIhDUQTUpCN4NciyUhpKs0IWrN8h9
         8FPRLGfJ8EZm0TgSUybh+VaiToPXEtFR8tXIS12fqNkwaJ499t1V/im+LV8yN4p5CTzp
         xFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520887; x=1744125687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lViR7GADW4UfMLUl1znhVZFZ6r53i/a2wPXEO+I4/jU=;
        b=OmfQH5B3F0p+MtCrDxFJN77tcdAFA7cbDxZ6XdnRhlGdraqEjYviA4kC3KmOlaSja7
         57fjsvcJZcP9t/6nj47aZUXhem6OWD2BfJd/AT4Rp5/W8ox54A05ynu6zlOUDdrVCjbA
         aOi30oeZ37KVfHaOH38wqkCe2NUOe2f2N6+A1bUwuoBi8u/2VFd1Gg1VDDZy8Si96clg
         eYlVa/ZAY6Pi/sMttNmXmqwnO8dYUC1iG5SRYclW223YHrvIP9Jdsugz0kC4PadN6MZH
         wdx92k8KXLCYxQWGy3Tdae9gAOEmC1v2fWapv+CSiZijQcpsxt215oe3a2LMLEZY21TN
         NAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYDtQfkm5QI+VWHVAziOjJkkNELrk/5bw7+2VGVRhSekVateaRNwu4/IECrXsfMY4GDs0uYK9pwRET3Auz@vger.kernel.org, AJvYcCXtncL2OGtJVMW65X8fcwrnM8tjuYxz5ijyxPoMpLTgAxcQ9fOxhCtPFqe/GpoV8s98Ho9gFTqWkVA34w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFShWSD8tq7AL0UI1VHC4Sk+4nBGwFBZh5HMn8Lqa1ECMrwLV
	pPhR9Zf2DSGPVz0h3iWsjlmq8QLSxpZXTWgVMV9Ys+TeP6LIMzirD2wnY9jwoslqywUT5GUA283
	sEwPciPzNYeGRnNjCaIxqFrotMOo=
X-Gm-Gg: ASbGncuxzJGEeNzQpvPf++1DATs+GoFEdeFXCo/EB5+jMMejIVN0D0cKfx5BJpxLwMU
	TSKIWMEYbnEMgVgoZfI+1oj9ihY8rkCr79hqnv4OJVQSIx71+lqs8mngVg6i8U/rpN+8/bdWHLV
	yl98EgJniGTSLm52A7aueLiF/zcg==
X-Google-Smtp-Source: AGHT+IGEXpuUaHuRotIhMhX/f0dN5mTmmuVMQ3Bl+K9MXd3w8KHJ2QaMuDhaDeelVC8i7VtAIzfbIz7OJU/IFrkpXds=
X-Received: by 2002:a05:6402:254b:b0:5ed:5d8d:e1d6 with SMTP id
 4fb4d7f45d1cf-5f02b333460mr3160122a12.24.1743520886968; Tue, 01 Apr 2025
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329002003.36600-1-qasdev00@gmail.com>
In-Reply-To: <20250329002003.36600-1-qasdev00@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 1 Apr 2025 08:21:14 -0700
X-Gm-Features: AQ5f1JqHimCieeR3feWTD4qZsdYTjp-XyfVtprFwCJCnVR1_du0iGEn8vonoiW0
Message-ID: <CANRwn3THBtd=e46a1Gaa0CFqJ-dwkLjyqPqpJU4kMjpDUX-n2g@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: handle kzalloc() allocation failure in wacom_wac_queue_flush()
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 5:20=E2=80=AFPM Qasim Ijaz <qasdev00@gmail.com> wro=
te:
>
> During wacom_wac_queue_flush() the code calls
> kzalloc() to allocate a zero initialised buffer
> which it uses as a storage buffer to get data
> from the fifo via kfifo_out(). However it does not
> check kzalloc() for allocation failure which returns
> NULL and could potentially lead to a NULL deref.
>
> Fix this by checking for kzalloc() failure and skipping
> the current entry if allocation failure occurs.
>
> Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/hid/wacom_sys.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 97393a3083ca..666b7eb0fdfe 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -70,10 +70,16 @@ static void wacom_wac_queue_flush(struct hid_device *=
hdev,
>  {
>         while (!kfifo_is_empty(fifo)) {
>                 int size =3D kfifo_peek_len(fifo);
> -               u8 *buf =3D kzalloc(size, GFP_KERNEL);
> +               u8 *buf;
>                 unsigned int count;
>                 int err;
>
> +               buf =3D kzalloc(size, GFP_KERNEL);
> +               if (!buf) {
> +                       kfifo_skip(fifo);
> +                       continue;
> +               }
> +
>                 count =3D kfifo_out(fifo, buf, size);
>                 if (count !=3D size) {
>                         // Hard to say what is the "right" action in this
> --
> 2.39.5
>
>

Patch looks good to me. With or without Markus' comments addressed,

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

