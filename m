Return-Path: <linux-input+bounces-1309-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18029831658
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 11:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99FD0B21757
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 10:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8188120305;
	Thu, 18 Jan 2024 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F0OizwsH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6F200CA
	for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705572125; cv=none; b=OoXZbpF4axsuuCKQBAU9s4sAA/4Y+ZvK7LjpFkYDHYiTiVevn2TM1KWdlmTEKRmVwK9MLriIkkSDot5g2jJqXZO28BDBrgAj85DoEMiWlvOg8XmRbQNrxSP7KhWDLAmx9/0nfCQ+7f19EOqEiSTP8fauYZospLBCercekRJWJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705572125; c=relaxed/simple;
	bh=soHeTw8nucVzer4yQdR+I0O2Kl9v9GMUXLJfbUAO134=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=q1Sqz1gFP57Y0NbUIFv3z8UToIoP4KxJzJLPWc+sGZH4SX0Ta2rOlDs0H5nbw5WsBlJejhAN5s+HxkB/nRpiKQfU4pcj8AUjlsj6eiR5b/oos9w0DcH5bCD0rjjNpvRcibuOb8ManvJ67+1ojdimhStFJrx5aPnR2HlDwfu1kLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F0OizwsH; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7cc7bae27b5so4349775241.2
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 02:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705572117; x=1706176917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsG4DowCs4KKFZiNp7kWGzZfbLS3E3qjNg9PmSz4SaI=;
        b=F0OizwsHj4SlH0V21V+wDx6Od6SijjnETdWVjr0yx5SYPJHC+4PfF3cZu5aVUUfmOI
         Eycw/j34l/geo/m1Ac/ZaNT2MhNL5j7rO3Z1nFDuA4TsPgI+h1aVPW/BO6m231qnLst2
         W9xuNqfZROKc808+GlhzwojQSRTBZbYeo0rU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705572117; x=1706176917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsG4DowCs4KKFZiNp7kWGzZfbLS3E3qjNg9PmSz4SaI=;
        b=AQ+wWchcjAAIpIhP13hkaM4HGuA7UL+Xch+3/MACDbHrIxhaZ4TMHYGqBXeqHN+rPy
         c7KsO9oazzIoN1I4+QwXhzEVkqCbRwtTxcOIDh096o85UVaPqp96qz3AaKkZ1P8o5aCL
         joXZSr6MRZHLWdJ2z+Lh2aBARUhybZLDSxPoJ6sxXEVELEPejEURWciJrrdXAMRwWDXj
         iR2irovYz7DsJoOblMWHLjv+9xnlR2TXgoeUS9VJlWtrVlOM/Y+g65XN+7wggbum9cnX
         FHKkpEwn7eMBrSVrCPZVta1Fwqackmahg2twWoDwuqqDjklrSyUhn3eKItuUPsOajKKc
         cwlA==
X-Gm-Message-State: AOJu0YyKL+LDahVbvJnwIerydOzOaZ421hIuOsYPVHrs0e3FRHv4cVGv
	Xy4fAS4g/r6jCmpdZdF166SahoQZpHgPSJj1kf8q2mUNJTR5Oj4IpO1bwsdIj1z+nIqJAqnneF4
	=
X-Google-Smtp-Source: AGHT+IGbFvS//xvoF6l/YvBphLTZtFVNxue3enBojSSncr/Golmm38pkP/+rEVzeRR2TvVt+Y5nD6A==
X-Received: by 2002:a05:6102:3234:b0:468:1c37:39fd with SMTP id x20-20020a056102323400b004681c3739fdmr497070vsf.3.1705572117512;
        Thu, 18 Jan 2024 02:01:57 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id j39-20020a0561023e2700b004698c7bb3b1sm156526vsv.23.2024.01.18.02.01.56
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 02:01:56 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4b7e4a2808bso3516156e0c.1
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 02:01:56 -0800 (PST)
X-Received: by 2002:a1f:fe0b:0:b0:4b7:1d62:b48f with SMTP id
 l11-20020a1ffe0b000000b004b71d62b48fmr299907vki.24.1705572116196; Thu, 18 Jan
 2024 02:01:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118085310.1139545-1-phoenixshen@google.com>
In-Reply-To: <20240118085310.1139545-1-phoenixshen@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jan 2024 18:01:19 +0800
X-Gmail-Original-Message-ID: <CAC=S1njRz=d73J0ntKma2L85icqbCO79wLjrMpkQ0HgiDpdbrw@mail.gmail.com>
Message-ID: <CAC=S1njRz=d73J0ntKma2L85icqbCO79wLjrMpkQ0HgiDpdbrw@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: add support for base attached event
To: Ting Shen <phoenixshen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ting Shen <phoenixshen@google.com>, 
	Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	chrome-platform@lists.linux.dev, =?UTF-8?B?am9ld3UgKOWQs+S7suaMryk=?= <joewu@msi.com>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 4:54=E2=80=AFPM Ting Shen <phoenixshen@chromium.org=
> wrote:
>
> This CL maps ChromeOS EC's BASE_ATTACHED event to SW_DOCK,
Hi Ting,

The change itself looks good to me, but the userspace can already
detect keyboard attachment through USB events. Can you explain why
this becomes necessary?
And the Linux community doesn't use the term "CL". Please use general
terms like "commit" or "patch" as well as imperative sentences [1] in chang=
elog.

After that,
Reviewed-by: Fei Shao <fshao@chromium.org>

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#describe-your-changes

Regards,
Fei



> to allow userspace detect that a keyboard is attached to the
> detachable device.
>
> Signed-off-by: Ting Shen <phoenixshen@google.com>
> ---
>
>  drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboa=
rd/cros_ec_keyb.c
> index 30678a34cf647..d2e0d89d4ffdf 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -128,6 +128,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[]=
 =3D {
>                 .code           =3D SW_TABLET_MODE,
>                 .bit            =3D EC_MKBP_TABLET_MODE,
>         },
> +       {
> +               .ev_type        =3D EV_SW,
> +               .code           =3D SW_DOCK,
> +               .bit            =3D EC_MKBP_BASE_ATTACHED,
> +       },
>  };
>
>  /*
> --
> 2.43.0.381.gb435a96ce8-goog
>

