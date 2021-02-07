Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0D831257C
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 16:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhBGPs4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 10:48:56 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:35464 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhBGPsz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Feb 2021 10:48:55 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Feb 2021 10:48:55 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1612712492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hTkIZmiyo6LPLop4ULyhig9y6oJZRsL54eK66gDQqFY=;
        b=Ms1mEOtAxsSEwgnfXT3TTFsJx2fyIIImss7qnWp+cBpbmx9b2+4KJlFr2MDOyb436J43Wf
        3SEH0JxIhfi5sjLz2wkYIBirFIcXwNtJgPG37r123Mi8TLsi9nB105/tPa84hCbkjg9uLn
        J3g59QO0A7XZN8yL+x8t8J5iEsJ4K/Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fb5425dc (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Sun, 7 Feb 2021 15:41:32 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id r2so12055294ybk.11;
        Sun, 07 Feb 2021 07:41:32 -0800 (PST)
X-Gm-Message-State: AOAM530rwFIQLylCmW2gf5CLVKx9lR7zQxwXmHunaxBKlXPeWTkvO3gP
        ZhetycSjoPXmsX4bWqQBv5xUR+qSUa3vjqXuuCc=
X-Google-Smtp-Source: ABdhPJzWLfcmA9cWOsjR8X9Z9b5NnoEDKhjb1c+ffga4HD3XwSmVQIcPUw0K5psdUsiZFNjGgREoON11Rl14NEiW00A=
X-Received: by 2002:a25:4981:: with SMTP id w123mr19671584yba.123.1612712491158;
 Sun, 07 Feb 2021 07:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20210207035024.69095-1-colton@boothsoftware.ca>
In-Reply-To: <20210207035024.69095-1-colton@boothsoftware.ca>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Sun, 7 Feb 2021 16:41:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9oa+yAJikmSysEZCEPftTwxFyftiO3iS7wGeCd=nd75Gg@mail.gmail.com>
Message-ID: <CAHmME9oa+yAJikmSysEZCEPftTwxFyftiO3iS7wGeCd=nd75Gg@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptic - reverting dcb00fc799dc03fd320e123e4c81b3278c763ea5
 because it breaks the touchpad for one guy on Reddit.
To:     colton@boothsoftware.ca
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, colton@boothlinux.ca,
        Lyude Paul <lyude@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dennis Kadioglu <denk@eclipso.email>,
        Yussuf Khalil <dev@pp3345.net>, Ilya Katsnelson <me@0upti.me>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Feb 7, 2021 at 5:00 AM Colton Booth <colton@boothsoftware.ca> wrote:
>
> I can't test myself since I don't have the correct hardware, BUT this change seems to work for him. I'm thinking he has an early version of the X1E which may use slightly different trackpad revision.
>
> Signed-off-by: Colton Booth <colton@boothsoftware.ca>
> ---
>  drivers/input/mouse/synaptics.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index ffad142801b3..2d3f03921dbc 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -179,9 +179,7 @@ static const char * const smbus_pnp_ids[] = {
>         "LEN0093", /* T480 */
>         "LEN0096", /* X280 */
>         "LEN0097", /* X280 -> ALPS trackpoint */
> -       "LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
>         "LEN009b", /* T580 */
> -       "LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
>         "LEN200f", /* T450s */
>         "LEN2044", /* L470  */
>         "LEN2054", /* E480 */

This removes two totally separate models for "one guy on Reddit". Does
he have two computers that coincidentally have the same problem? Any
details about what that problem is so that we can assess it?

Jason
