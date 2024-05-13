Return-Path: <linux-input+bounces-3694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6B8C40CC
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 14:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FC81B21EA6
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF071474D8;
	Mon, 13 May 2024 12:35:38 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631812232B;
	Mon, 13 May 2024 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715603738; cv=none; b=qF3aQujScylxqhSOQFvsY6Z3s1ujuE5mNnMWm3QVfAQi7+CxwGxFtDtj5m6TbtAsDVFd51ip+y8cUeOqnbpYTEXuoN4sgO0L2ST6ViY+fECnVtp23SOEzE4yyD3xXRx5he5bpkEW0+2anqWb+0wnNlGba+Xb+BnwA3ZWNAr4Bxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715603738; c=relaxed/simple;
	bh=y+KAEzXfNr4jXio0KovIqBG8UPmnP24zcxGApuX+oAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VELc2v4RrpOWQk6Ofef7q87CRR0HrfmSoYnCYblauUe+fTgbD9AEoeKRCSRl1EbD6knQoN+DI3uwTjJR/Umk8r56AxyezoL2k3nTOgp2kWGYyjKodnpBu610nvP25qNbSEidzgPhTgwULfj96pSCV8kkUEp5QalQAZrFu5/jM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6114c9b4d83so37455107b3.3;
        Mon, 13 May 2024 05:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715603735; x=1716208535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7SLg+Ot/rrBD3DiLLuTnFPyuvGA7Ha5PNLCiH/8q30=;
        b=HPtUKq0RepV6HYI0r7T4WdXZ/c+kevewo5IStpZcKU45Kols+pqGZ7sKf5F+YsfPCb
         aEsO7zVphC50HTFQd0RBotF/3Z2K9MFkIX+3sTAdE64ZYfP0ZH69usr+VEW6VXmD8EDY
         6xP2TKsLZlOJDE/IjsbOH2BKvbo27jsumBQCmXJQYM42Xz1oICc1wDsyPQV2wiPHTl93
         47/IKbd7RY9Fi4XvVNGY03lTpWPciEFO4zfOjhFb9lLyifIHa8WRoYkYPIROCtwaluAq
         Eyc41VpO49u0mLSJjh3e0CL8lKGQ8yE/OLRADPqQwcGFkIdd+fEXBYUgILiJEHVvdx6s
         fX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9yOCuxa5uTKhP/O8CQqhb1BS5FMs85b96lZY6ZDED5rvMOgrqiALMxKOLwmjcJX8fLIdlQgc1KbDWeY9L4jckoWcpYIU1/002bBiGZm9u0+y6mr0dm6XC141hYERfot+J5t9LemvOaV2rPcm5gA1zPy0Fx6PXiJsXqB4jzDD7fSbZuxeJ8Q==
X-Gm-Message-State: AOJu0Yw7Gd+H0TW+Z8/JJ9WAgLfGqLnmH35ib+JR6htEuQGlr3+BiQwr
	EzxWzIgUyduzoBEKGlU33GN2Ky0bTNAQrdNmDecU5tgA/uoi9ygzW2Looz0Y
X-Google-Smtp-Source: AGHT+IEpBlnkSGP3hiyke/8RidOYNaW/gO4dOmz6kYuxM3I2gMCovhPDk/bGWNXYX4EeU29oOx7LWg==
X-Received: by 2002:a81:ad04:0:b0:61d:fcde:5caf with SMTP id 00721157ae682-622b0148047mr84359887b3.37.1715603734679;
        Mon, 13 May 2024 05:35:34 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e24680csm20760657b3.6.2024.05.13.05.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 05:35:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61816fc256dso41954497b3.0;
        Mon, 13 May 2024 05:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAcykK5SPutHnp1VH/1cZpQKEVx45Qh+ulsBM3nscsVXQz7OYUwZ3YqhnxaPPdz/Hs+9Uzm/qHKB01T0vjeb+gUhpmGuwX0ELADBzJfGHzk1Jv+FHqBb+6GixSTzgYUZUxLc+1BgliFAp5Tnip5Q9SeT8u8diVL9BHAOuvFXGf0Y/1M13yJA==
X-Received: by 2002:a81:a1c3:0:b0:618:5b27:e12b with SMTP id
 00721157ae682-622affc63a9mr90048837b3.7.1715603734016; Mon, 13 May 2024
 05:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715255980.git.agx@sigxcpu.org> <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>
In-Reply-To: <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 14:35:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcR_3HcQzQse+5-2dgC4iLzFyiFO=ifR0hxymWRjURLQ@mail.gmail.com>
Message-ID: <CAMuHMdVcR_3HcQzQse+5-2dgC4iLzFyiFO=ifR0hxymWRjURLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Input: gpio-keys - expose wakeup keys in sysfs
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hermes Zhang <chenhuiz@axis.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guido,

On Thu, May 9, 2024 at 2:00=E2=80=AFPM Guido G=C3=BCnther <agx@sigxcpu.org>=
 wrote:
> This helps user space to figure out which keys should be used to unidle a
> device. E.g on phones the volume rocker should usually not unblank the
> screen.
>
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>

Thanks for your patch!
This is indeed a useful feature.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

