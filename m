Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC2CB23239
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 13:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732600AbfETLYc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 07:24:32 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38382 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbfETLYc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 07:24:32 -0400
Received: by mail-vs1-f68.google.com with SMTP id x184so7632023vsb.5;
        Mon, 20 May 2019 04:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Ijckunn1lpc/IcehrJjwHPfhIMzQ7QvINFXUErXuIk=;
        b=ggdhnmXncF7QHzk6UpD8JSNaEMOXgGDXzNAX4oZOzEGybQxiQFXmk1eZp72K5mrfCF
         3KEDURpqA1NBA1UOrMkPOA6nMEGgWuUQRLARGkVifPcY1JfErT4QKnuDKom9mryVtSO3
         eZ+uMF4JtHa1GxK7p2+EZtFRvnbvGRpQFO1AgcOqL2TaAVC5QgQpEkig37M/NB39XVMB
         wS22mlCmAEDNd1Oa0cDnerlO1jpqNieZ9hukHwxkTjDrj4wD11zPOsI9xme2ORV5v8Yu
         fzDZmu3XQCjQmWC64dYoWCr2sekPUSreO7QYeUPQAUdq4KmJ7ScqOAlY5R5dPl7byv09
         Ujjg==
X-Gm-Message-State: APjAAAUEwfb5KryBXaLujd3QE9PjO3ZBGQpue7Pq+VkQr4WnEDAxlYDX
        u/bgKyx3f1wTSYh9bIGkefcBG1d3oBebKaZLuPCaXFX7
X-Google-Smtp-Source: APXvYqyM4rjrumbOYOzK52YKxhnOMf765O679b6gj6bASN6bCitguIoyTNLutph/7uHtsnA2pHeKFAZYzkrz+sx6ZWw=
X-Received: by 2002:a67:770f:: with SMTP id s15mr25729855vsc.11.1558351471033;
 Mon, 20 May 2019 04:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092711.30662-1-wsa+renesas@sang-engineering.com> <20190520092711.30662-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190520092711.30662-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 May 2019 13:24:18 +0200
Message-ID: <CAMuHMdXBDYUQYSRgi2_BCQyZhamUbx5fBZn8-nbMrp=5tw=DUw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] input: da9063_onkey: convert header to SPDX
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-input@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 20, 2019 at 12:40 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Covnert the header of the source file to SPDX.

Convert

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
