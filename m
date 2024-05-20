Return-Path: <linux-input+bounces-3748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680628CA1B9
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 20:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9948B22332
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 18:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE072137C3E;
	Mon, 20 May 2024 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qal6o/9u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E362F34CDE
	for <linux-input@vger.kernel.org>; Mon, 20 May 2024 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716228044; cv=none; b=nl7HizBGNlkduiPBgtRk6wb6Lcnr65VcPvdRFRxZI6pbn4VHAQFQ/GH9ARkruuXUDcP4MWloIYITOO8KzNCRA90Lp3/g2R/2QWHXkubm5iFeF3bERes51jfRGeKUg+k/3Pv+5rVvXiY69iR8q/JTeZcSEwnJpz7Q5LdwQjY433U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716228044; c=relaxed/simple;
	bh=1gRox6cB5H1ID4uJWrTrs71IKJJTwwd59TkfJN/i7Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEgPZ5Cpb0tqT8pNHYi+YMiFBdtsAeR/p4erYoxZfrhye37GWfXtr+eMfHD0Z6AypfqXflR+pp+xBRi3OWp9vHlxg6n39n/JmNzAoRjJDp9kO10bgGPVGsYJaYtGKGR3VuI/ayR8uxhJLhwHl7T7sGwIH/fkZgyYLyf5BHVrNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qal6o/9u; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-574d96f71efso1439900a12.2
        for <linux-input@vger.kernel.org>; Mon, 20 May 2024 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716228041; x=1716832841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpiLoZEEFdpXnCbEdf9lfhGCDcZU47B/5OgPG9XIqzc=;
        b=Qal6o/9umLDyerwdQqEVZb2bkslEW+CrB1sL80F6bXWNUkZoQ9qHND/Uz5b0OUSJ3s
         iprqo92aXiNq2di9C/OXiHtvSVHFD/yKpYcnjlLNYv6zIMjI6t/j3f+u/foyNRBEMmTv
         E1NKvezjfmfVHUOW0hfUlnjgQ3CbLw5BTEvhzrdOXM49Cnq1t1A0TkjVeD0Vu4xJgXZ+
         5Dvt+tHWfo0qVf53bsk4c4rrh8M9xqlCsRHmMuutP++qLaJrTdXEAaUnP6ARm3SCtBWO
         2k9abIxQOWbDzhI6HibwbDhT8NKanuSQ0PYVsqXDOMF+cSaUmxUjVtsjOjMli4PqUKC4
         TTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716228041; x=1716832841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpiLoZEEFdpXnCbEdf9lfhGCDcZU47B/5OgPG9XIqzc=;
        b=tWIHLPdEEUXQwHgod2KM9esIur/K6M5neaGNXmIeIctdUcOmsY3ry/PYsyXefB+NtO
         w6xxejTxrO7SSyCrmDhlab5LWi9sl4qSPdCGXwX+kTb3st0I5ECsdblawwvgOIMkRIE8
         uuNJ8ryOmtehZ4y5gnxLqLkl74kQ4051di/GdZYuh49HFjJZO+JRjEn27kNgRlkSU4UI
         F8z9xna/7p7Ru3V5vbhms35Wx83zZjPQ9cZt7yHonj792khFPQJTDBz20bbXyk6DzOR+
         eVVCSq3pWMei8Zx8u25wVOaGsBiZuxaFaky4t9CXNCBmAJD0LbJ5CJdsRGVQIm63YP1W
         UWyg==
X-Gm-Message-State: AOJu0YzamPPf1vE1UZSIAJo6qFejZ6/QXyBVcx/TObxpwbaLyBEpCttz
	o9vaPjinMllViHqqFcotnyHwoelsvUejy6CGakyLMpvph6zvzhIMAjVHVoCzVbmZsbuzA56Zefg
	VoZeVH1MRj9csDGyh+wAh7WZbO2c=
X-Google-Smtp-Source: AGHT+IH7xu9eNdtGhbRW5nNjmWBhtD7ABmU09uAaPFjlJ8/cwyOBkUm8nj2V8IIuOolXNjPeCBTBW4pW6NW7TIl60aA=
X-Received: by 2002:a05:6402:b89:b0:56f:e715:d1c7 with SMTP id
 4fb4d7f45d1cf-5734d59d8b3mr19082099a12.1.1716228040885; Mon, 20 May 2024
 11:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
In-Reply-To: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Mon, 20 May 2024 11:00:26 -0700
Message-ID: <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com>
Subject: Re: [PATCH] Input: wacom_w8001: Check for string overflow from
 strscpy calls
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Aaron Armstrong Skomra <skomra@gmail.com>, 
	Jason Gerecke <killertofu@gmail.com>, Joshua Dickens <joshua.dickens@wacom.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

This fix is the same as [1]. Without checking the return value,
Wolfram's patch [2] fails our downstream build script. I'm adding my
r-b, if it makes any difference ;).

Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Thank you,
Ping

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/hid/wacom_sys.c?id=3Dd9eef346b601afb0bd74b49e0db06f6a5cebd030
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/input/touchscreen/wacom_w8001.c?id=3Da9f08ad7adb3d2f90e11efbb40a=
1246ef95b0c04


On Fri, May 10, 2024 at 4:43=E2=80=AFPM <joshua@joshua-dickens.com> wrote:
>
> From: Joshua Dickens <Joshua@Joshua-Dickens.com>
>
> The strscpy function is able to return an error code when a copy would
> overflow the size of the destination. The copy is stopped and the buffer
> terminated before overflow actually occurs so it is safe to continue
> execution, but we should still produce a warning should this occur.
>
> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> ---
>  drivers/input/touchscreen/wacom_w8001.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touc=
hscreen/wacom_w8001.c
> index 928c5ee3ac36..b8acf196a09a 100644
> --- a/drivers/input/touchscreen/wacom_w8001.c
> +++ b/drivers/input/touchscreen/wacom_w8001.c
> @@ -625,7 +625,10 @@ static int w8001_connect(struct serio *serio, struct=
 serio_driver *drv)
>         /* For backwards-compatibility we compose the basename based on
>          * capabilities and then just append the tool type
>          */
> -       strscpy(basename, "Wacom Serial", sizeof(basename));
> +       if (strscpy(basename, "Wacom Serial", sizeof(basename)) < 0) {
> +               dev_warn(&w8001->pen_dev->dev,
> +                       "String overflow while assembling basename");
> +       }
>
>         err_pen =3D w8001_setup_pen(w8001, basename, sizeof(basename));
>         err_touch =3D w8001_setup_touch(w8001, basename, sizeof(basename)=
);
> @@ -635,7 +638,11 @@ static int w8001_connect(struct serio *serio, struct=
 serio_driver *drv)
>         }
>
>         if (!err_pen) {
> -               strscpy(w8001->pen_name, basename, sizeof(w8001->pen_name=
));
> +               if (strscpy(w8001->pen_name, basename,
> +                       sizeof(w8001->pen_name)) < 0) {
> +                       dev_warn(&w8001->pen_dev->dev,
> +                               "String overflow while assembling pen_nam=
e");
> +               }
>                 strlcat(w8001->pen_name, " Pen", sizeof(w8001->pen_name))=
;
>                 input_dev_pen->name =3D w8001->pen_name;
>
> @@ -651,7 +658,11 @@ static int w8001_connect(struct serio *serio, struct=
 serio_driver *drv)
>         }
>
>         if (!err_touch) {
> -               strscpy(w8001->touch_name, basename, sizeof(w8001->touch_=
name));
> +               if (strscpy(w8001->touch_name, basename,
> +                       sizeof(w8001->touch_name)) < 0) {
> +                       dev_warn(&w8001->touch_dev->dev,
> +                               "String overflow while assembling touch_n=
ame");
> +               }
>                 strlcat(w8001->touch_name, " Finger",
>                         sizeof(w8001->touch_name));
>                 input_dev_touch->name =3D w8001->touch_name;
> --
> 2.45.0
>

