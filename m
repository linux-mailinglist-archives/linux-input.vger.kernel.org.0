Return-Path: <linux-input+bounces-13571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE5B07F4E
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 23:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB9E2A45D59
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 21:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7962228B3EF;
	Wed, 16 Jul 2025 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9pa5crg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22394A11;
	Wed, 16 Jul 2025 21:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752700122; cv=none; b=lnt0UJQu35h/gRtHIdLtbAuSbctIHTxT+rkeWpID93TsKcCs9NKaZEJ/Nl+mO6aKkNkxCz5EJR4LXF4HjrE7DG0HdwH9cssZn6qJIDadY09Aqxkaz8c+mrtAb9SH2+/sqohWUpg3CSOAr0dOEKvz2psJRlgXxsc4MAI+Cxx0kQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752700122; c=relaxed/simple;
	bh=A1wKR9MzU52lhbdALmXmTLksUJ/sGJHYiyeA4GiL4wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VaDhsmMkunl68z767HPGgOEFhZkLmiKJ+LjrACltMa5zj4Ppnw23nXPk+AgWEe2nLjc/QAEoNsP9vCVsaMazObHzT1zP2orOX0fa2mh+y5dUGNhFg5INrucoyVqF78RXRF4jyuJ7TFiRgwhfzMm854M3TB8I9NxO/xeUfpfhp6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9pa5crg; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e8bd3fbd9f7so332052276.3;
        Wed, 16 Jul 2025 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752700120; x=1753304920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5H7r30/B/74vqciAu2oygp/2hRFtVXKG8bJBwnBsuI=;
        b=l9pa5crgVdx9atPAT1gr8YmnvLUWF2FR/hdxATHuD7Y2ixM+sZTBgrcJkrKprTqumz
         DeKwhjxMPgWnN2xZmn5uTZtl5UfEHM07Y1ywFlAf6ci3ZsXKTZXi1cJZo6PiCTP3fUD9
         9O13Eltaml/3zu8naGG9SdVH/q17xOgGIqx/39xnoFafFLAfFjVi2TnvYrY0AH/dpBpq
         6NXup4EZR2LGvz6tuamnYo9d0P+AgUnKlSLE3TSQ5a/efHS3Op/0gQoYKno0sae5IHBN
         onJEL6YVwcHJn9PTFBynUPtMvmgKw7R8eriwPWhHrTy4FLQ8ChSWTA0+Ggz0l8CGeYAb
         ARhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752700120; x=1753304920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5H7r30/B/74vqciAu2oygp/2hRFtVXKG8bJBwnBsuI=;
        b=n/K+aE+Gz/HtYYtTEAH+Tx6q8l+XRPdVexdS+S3skFbJIG3q82jY9dN/zBW3XZvTrK
         JpfqVNO6pgVUgwC38BAH+Y9IGwhLyvoorQe30aHMSfTq43yLEIR1ObzEG85cZWFvQH9A
         fddhP5C2n+SASfOTjCB+2dA91V0B+9zRk4nTEv1Nbf5CMFnF3ttLiEnltf3ZCJNKWNOK
         qh5I7OXoRZeUXGoKdbRTaUVd0YXNNozmPafC682kN10O4y3xeCWLNcmR7QYAu3h8PFB3
         ScJT6f1Gxjy0uiGIiWf5wzbo6RdIeEwmuE+HXtz5eA4BncjAZVdRMKh25//XrQgt58x0
         Xojw==
X-Forwarded-Encrypted: i=1; AJvYcCU0t/MOxgqrrGDzygGfElXBw041Xsrb7OUQMiYaiBMYj/RCVcq9sE6942MXd0QSsuE2r/WmTy2U75suz2hs@vger.kernel.org, AJvYcCXmcAYDfrpwceX31IpkLIX2mFStFVH7GUP0zLL00yVh7/VPS/3QX9lUP//qAkElNkwzqcHRMoXIfscSvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytM1ajVfSXR2VLE/FQjILDdFUQrrtbSlJOCq32ppuJ4+QApDFY
	J7Y2mpJ6iHxHXhcHMt8F17aoRXcsrBimhZkRKn5z47lhoSmwfWKL7injENGjQ0XZPk0WspaKulR
	EpfggR6FBNLE8uXsJChgGxfDherSwR3I=
X-Gm-Gg: ASbGnculK5uAKj2zQhs1+Y55LyE1zVK8Ubw+ydz/WCboGtOxTTyqsjmsDRjBA5E0srK
	YZCEq8/rGjaD6hL+Ex1Lt4GNcYIETuaAdOK+sfoRW+3RXs4Ddd2skZp+cP9wKMzUSOvv5ZJEv7M
	crPNplw0kFYERkA5tjI23C2fo7LPdOPwBRh5yqcheAWBCUiwmQlC6bjZlghPX3+XQUMrE36FC1X
	+V2iIY=
X-Google-Smtp-Source: AGHT+IEDwoYohVnsxyrZGdt4TFBiLe0krfV4O0F1ZA4tQFefOiVw/D9+OczFTW7HOM9FtROGripT2F31Y1YyGPtmqgs=
X-Received: by 2002:a05:690c:6990:b0:716:59a6:2dc5 with SMTP id
 00721157ae682-71836c63a66mr55423107b3.15.1752700119576; Wed, 16 Jul 2025
 14:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716172221.1360886-1-aha310510@gmail.com>
In-Reply-To: <20250716172221.1360886-1-aha310510@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 16 Jul 2025 14:08:28 -0700
X-Gm-Features: Ac12FXze4V393u64fqf-w3tW5zdx5jkTrskoljkpReGoVu4iwbb-NQHfnAE5d-c
Message-ID: <CAHQ1cqHwN2KHS0SaWCVxOviscQQpK5TBApkcmTGV9eTCOa=Rfg@mail.gmail.com>
Subject: Re: [PATCH] HID: microsoft: add a call hid_hw_stop() in probe()
To: Jeongjun Park <aha310510@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, juha.kuikka@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 10:22=E2=80=AFAM Jeongjun Park <aha310510@gmail.com=
> wrote:
>
> If hid_hw_start() succeeds but ms_init_ff() fails, it will return without
> calling hid_hw_stop(), which will cause a memory leak. So to prevent this=
,
> we need to change probe() to call hid_hw_stop().
>

If I recall correctly (and it's been a _long_ time since I've looked
at this code) we intentionally didn't call `hid_hw_stop()` so that
you'd still have a functional device even if FF feature initialization
failed. What's the leak mechanism here?

> Fixes: 73c5b254c365 ("HID: microsoft: Add rumble support for Xbox One S c=
ontroller")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  drivers/hid/hid-microsoft.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
> index 18ac21c0bcb2..a27ea59a1bef 100644
> --- a/drivers/hid/hid-microsoft.c
> +++ b/drivers/hid/hid-microsoft.c
> @@ -385,22 +385,26 @@ static int ms_probe(struct hid_device *hdev, const =
struct hid_device_id *id)
>         ret =3D hid_parse(hdev);
>         if (ret) {
>                 hid_err(hdev, "parse failed\n");
> -               goto err_free;
> +               return ret;
>         }
>
>         ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HI=
DINPUT) ?
>                                 HID_CONNECT_HIDINPUT_FORCE : 0));
>         if (ret) {
>                 hid_err(hdev, "hw start failed\n");
> -               goto err_free;
> +               return ret;
>         }
>
>         ret =3D ms_init_ff(hdev);
> -       if (ret)
> +       if (ret) {
>                 hid_err(hdev, "could not initialize ff, continuing anyway=
");
> +               goto err_hw_stop;
> +       }
>
>         return 0;
> -err_free:
> +
> +err_hw_stop:
> +       hid_hw_stop(hdev);
>         return ret;
>  }
>
> --

