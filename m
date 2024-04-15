Return-Path: <linux-input+bounces-3014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D38A4EB0
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D27BF1F231DB
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7183DB97;
	Mon, 15 Apr 2024 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qreG0MaU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A7C376E6
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183241; cv=none; b=QaMLpK/cEmJ3I5gF4IYLphROguXESJwZnHJ7LKoZcsgE3aCU+lXMZUj7J32IBP+LYH1xZXIu1DNzjtbT8XZWfdq/2y+mNEkCR6m4w0dsEqc44xbMoVrSiUSHKCjuKLwuX2fgE0VtJIA8xO3uz+oeASCyfjtRM3uWotM81M6SdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183241; c=relaxed/simple;
	bh=0mq8B2Y6QndEDg7ovK+Rf6E2FOwt86MMHDQrr4rZ0qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiTw/UaAGSJxAYHkpTtE/EURjqVkaZUNVHchQK3quFgrY2M1cudmeKm8+Y52teQ2Y+jwJjloh2saYfITCK+VwhNjvnWG1BnY3PYgvc3iZQ3EM6a/E8l41IpOmqj2qYWo3+XNoZ8gjriadDUS26XUKN89V0dKecAeI4kkWR8MHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qreG0MaU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34665dd7610so1189006f8f.3
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713183238; x=1713788038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mq8B2Y6QndEDg7ovK+Rf6E2FOwt86MMHDQrr4rZ0qA=;
        b=qreG0MaUbE5pypZsKg4u6HWqg3SHF/N4leQztjml0Mo/p3u8BVRFkQxNCLB3l1V0G/
         YWdRli9GwiDEhZHArcuDhvnxKNOzdJc30Gs3xBbkxuqN3n0mylzOgzuJ/VQE0l4tl3SY
         azaGEuEllFlzOmQzTWB6342YlNgtcFtJKxYBJP0iROivMi5M9f1ywpvDGRAz1odAq5TM
         HiA9oUvDcxueC/d7DHsLPY25KeNHJQBimXMAPGNn2nYS1VXdeBwuA1RPdW5Qa/dsum9x
         SBGtCvKb9+nB0cpCkmnP03mg7QaEz+6W+1zL9SJlt4FPb7oF7V5WTKUJfK6jR3SSGWsy
         UHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713183238; x=1713788038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mq8B2Y6QndEDg7ovK+Rf6E2FOwt86MMHDQrr4rZ0qA=;
        b=CX1z6G/M5mtQ6OMql1jEuNkExxrMdY3JWUeSTkHzJ4Y9rsqM/Lo59S1UkVwoA1oo91
         fNuu5ce5wq64hD2hUMngXa9EmOYq299v22cp15RtIaQZRFJy56o6DPb/jYA0OngXEYMM
         HujGawejM5dsRX0OhESEpVFCcz+nFhrbFJcCuuflJFiohA22VV4K+x2wQFRIvuOdVwuB
         cZorBIFQgxA5aDFfREvDB/Y8QsTL07HKJ6UVVGWNbeekyk9FC8nuaBtggfKBGH813fBq
         aUpIfr8BHVO+l1boET0hJIKTK/E84dRxQsG/kNZd+dd41IbunZUgLhLlGWbuvDiezNOX
         yp9A==
X-Forwarded-Encrypted: i=1; AJvYcCUv7PL4Z4wXHVy4e606n3j320cHqT0n+A0OeI5AbuSrDpNDfMZTU6oO11LJWa2pVvi+Re/+yNAryvwmq4z0UwDx7x3gGYCiDwwde5g=
X-Gm-Message-State: AOJu0Yz9oURUzUGpUjrkH+3crhswpxm89uWR8qVhTdWngOJajlz34F53
	oo28c2eYa0aWJPzTiN3Oke6Qs4+8WOle7jh8/KHHZO+hht5eGnD4/Y7oS0JA2n3cPgwXiOlfDOI
	rYJPVBfXgFk4jSgyXDKa4ln8jNN9bJf0TvI0X
X-Google-Smtp-Source: AGHT+IE5hwz0nX9ECesEBa2uw8/K1PUd5u27RsKg3i1MPN/NxrcguI0IE0R3jiksoq9NUfaqeDKXwe6biOaWtxlFiZ0=
X-Received: by 2002:adf:e343:0:b0:343:772d:9349 with SMTP id
 n3-20020adfe343000000b00343772d9349mr6384118wrj.50.1713183237981; Mon, 15 Apr
 2024 05:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE5UKNqufWZfKLAXLcpBYKQpJEVt6jPD4Xtr=Nesh34VkNOETg@mail.gmail.com>
 <81e1b870-37f9-4ef2-9a3d-87015f32546b@kl.wtf> <CAM4=RnJAe1wzi_+Nif0wiSeqC5GR6Aavz97mY7tm=hFu3mijhg@mail.gmail.com>
In-Reply-To: <CAM4=RnJAe1wzi_+Nif0wiSeqC5GR6Aavz97mY7tm=hFu3mijhg@mail.gmail.com>
From: Radoslaw Biernacki <biernacki@google.com>
Date: Mon, 15 Apr 2024 14:13:22 +0200
Message-ID: <CAM4=RnJ5rsscJfH6P-XzzK-RZ710YZ64wXnYnhgc3+ey57zOBw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: Kenny Levinsen <kl@kl.wtf>
Cc: lma@chromium.org, benjamin.tissoires@redhat.com, dianders@chromium.org, 
	dtor@chromium.org, hdegoede@redhat.com, jikos@kernel.org, 
	johan+linaro@kernel.org, johan@kernel.org, kai.heng.feng@canonical.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org, 
	rad@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ps: "without knowing if the device is, or is not on the bus ..."

On Mon, Apr 15, 2024 at 2:10=E2=80=AFPM Radoslaw Biernacki <biernacki@googl=
e.com> wrote:
>
> Hi Kenny,
>
> > If the device can enter deep-sleep arbitrarily, then we presumably also
> > have problems in i2c_hid_output_raw_report() and
> > i2c_hid_get_raw_report() which could happen after the device has gone t=
o
> > sleep from inactivity. These places would also need EREMOTEIO retry log=
ic.
>
> It does not enter deep-sleep arbitrarily and therefore it is not a proble=
m with
> other communication patterns.
> The design which was chosen back in the day, to save the battery power
> is event based
> instead of level based (some HW line). Therefore to avoid power leak
> we need to request
> low power state (to prevent power leak in case the kernel will not
> boot up soon).
>
> Basically we need to take out the device from deep state logic by message=
,
> without knowing if the device is on the bus or it is on the bus but
> not responding.
>
> >
> > All these places should have the same sleeping behavior as they are
> > working around the same device glitch. I imagine the client ACK timeout
> > is longer than your required 400=C2=B5s, in which case you don't need a=
ny
> > sleep on retry at all, as is the case in the current i2c_hid_set_power(=
)
> > implementation.
> >
> > However, as we litter retry-code all over the place, Johan's suggestion
> > about doing this in the I2C driver does become a bit more relevant...
> >
> > Best regards,
> > Kenny Levinsen
> >

