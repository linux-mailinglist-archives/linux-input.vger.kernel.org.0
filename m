Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7DE41CB23
	for <lists+linux-input@lfdr.de>; Wed, 29 Sep 2021 19:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244682AbhI2RmF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Sep 2021 13:42:05 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:40489 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244589AbhI2RmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Sep 2021 13:42:05 -0400
Received: by mail-vs1-f51.google.com with SMTP id l19so3970485vst.7;
        Wed, 29 Sep 2021 10:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XbiglFRLgIcY75rRNl2atk5aSJpm45V5Y+1f6/CBUrc=;
        b=q1HZnFGnLzo7QvPJO0YgyiGcC90WRUFY+oIu+ao4oTkw8CqELf7iIeUceG7ZhLaTsI
         dID37snuLrLyWV2pRCu++XZw3RZlKE+TTnbR4RejWAlbJGMtd8AqnU5F5wup/knaxiTf
         nHXrhFtrOCE0pUewu1AcR+9RAnxpF5/vlJewFKqMIFsgjl1WUE9LHI+Kw1vfYo1CmaSK
         5oXq++uCKPDBrc2WrjMstr+YNw0HdXot2gSpSXq9mn8DLzw/X0+hdQmdCMl3wJyXrGOw
         bHHeq2RzzoDKKmPwM+GN8D13Kq72f3/dET4HDwYOOe1dWBupwFfI0s6GVWk510IEVjge
         Ileg==
X-Gm-Message-State: AOAM533thFARdPQqMlxahHUck7QvDYkRyuwgtHjNjj9S2Hps2wHKhTFX
        O2ol1F6G/Jy7pJdJDZ7DV32sJt6+Ip+Q6uojCaA=
X-Google-Smtp-Source: ABdhPJw9bNdwxtAIY3DOmRIFwKN9Z2D7jAP8L3v0HF6Q31xewcO++m1KLrgSgK8RXzix+t6Byw50GdAcAC1msQCC71w=
X-Received: by 2002:a67:f147:: with SMTP id t7mr1582993vsm.41.1632937223527;
 Wed, 29 Sep 2021 10:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210929152609.2421483-1-john@metanate.com>
In-Reply-To: <20210929152609.2421483-1-john@metanate.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Sep 2021 19:40:12 +0200
Message-ID: <CAMuHMdUbegj+VOVucw+qs5j=QSf3-Sez2-sVZBFD55-wSwMFLg@mail.gmail.com>
Subject: Re: [PATCH] Input: st1232 - increase "wait ready" timeout
To:     John Keeping <john@metanate.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 29, 2021 at 5:26 PM John Keeping <john@metanate.com> wrote:
> I have a ST1633 touch controller which fails to probe due to a timeout
> waiting for the controller to become ready.  Increasing the minimum
> delay to 100ms ensures that the probe sequence completes successfully.
>
> The ST1633 datasheet says nothing about the maximum delay here and the
> ST1232 I2C protocol document says "wait until" with no notion of a
> timeout.
>
> Since this only runs once during probe, being generous with the timout
> seems reasonable and most likely the device will become ready
> eventually.
>
> (It may be worth noting that I saw this issue with a PREEMPT_RT patched
> kernel which probably has tighter wakeups from usleep_range() than other
> preemption models.)
>
> Fixes: f605be6a57b4 ("Input: st1232 - wait until device is ready before reading resolution")
> Signed-off-by: John Keeping <john@metanate.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
