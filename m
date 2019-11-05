Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7D4EF91C
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 10:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388128AbfKEJ21 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 04:28:27 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37063 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388386AbfKEJ21 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 04:28:27 -0500
Received: by mail-lj1-f194.google.com with SMTP id l20so2291490lje.4
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 01:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F2FPfgjdbIXWdDjS0yCRl6/2h1CV4PZp64uPK2X2BNQ=;
        b=WVjlcjsAOE+e3hERSGqNCL8ugQssMBzjxA2Ol1tzpslqafskb+d2jyNqT1JD9GsOMo
         qsCQWow1BCS3ieMoh8sCB2LZw8OMmnvBYirEwVOK0hECiIXvPCK/qloP+/hGPgf7mBIW
         nGNIpW27JhXojS4uyw/a9qYmYpu4wEau1xe775jP74yD7K+PQU+DawGWaPSO4jZolhMl
         6n7hDnxoY9IKeSpOdI6474fWiZmGTcVWlgZhkPxjoPRFYxP80S927Ww00HXm1JWknfso
         QkI943Fcr72SDf9V+JOoKKVnRzqbaw5PWTIj8OaHuycQeD6GgTHdHdEHSGxza4WG1wkx
         hJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F2FPfgjdbIXWdDjS0yCRl6/2h1CV4PZp64uPK2X2BNQ=;
        b=JyA3zvNi4ysOfoozPVYHEPzu96EDeVFqcw6PLTe/RGJE2EkO67kfqHNjxh/Ns9oHJw
         FYJZ2KooYOaO6ZR5Kzv3HjEzh2C8VAGJoqmZzpr7+VFR47uBUyogTwux68qFw90Vvv3G
         frNfEkfAmDiDF5N0ETRlGLlLjjmEyE+LOMI7jqezuigOf/7fkOrLzHJaVxjA5s8fj6HZ
         Mxwv+be14w3TdcbdFOSv4rO8jaWBpEDBTSiJmTOWC3dMgifoYrhocVki3BIY50rW6yrI
         WsxTI0x2Rw3yXaMR5/eumMg2xH6DfW5VgdZY5Tp0H/UKifRxm+wAtNKjCd7r13QV8JF8
         1IGw==
X-Gm-Message-State: APjAAAV6/lPPUGcP7Hn6tAsXYGeOHB+rQ2lpO9cRxbO2miIfSWhnJhtd
        9ONAwRrQByVf3MhJZaoWnJT+Wgds4WvDyK+shOHDYg==
X-Google-Smtp-Source: APXvYqzkf3P4NiC+7rZsNgbXYUIcsBRDikSMDKFNsnz+OK18v4KaaK/EheFwXUjlKoFP+nppakoDlDtKmiwMGx5B9Mw=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr8803557ljj.251.1572946105330;
 Tue, 05 Nov 2019 01:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-26-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-26-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:28:12 +0100
Message-ID: <CACRpkdYDaJmd1MxmEA52Fjbh0d6Q5Vvb-Fb1SVLH-6AquxC6+Q@mail.gmail.com>
Subject: Re: [PATCH 26/46] ARM: pxa: zylonite: use gpio lookup instead mfp header
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 5:42 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The mach/mfp.h header is only used by this one driver
> for hardcoded gpio numbers. Change that to use a lookup
> table instead.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(...)
> +               GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO15),
> +                           "touch", GPIO_ACTIVE_LOW),

What I tried to do with code like this, when I was ambitious,
was to wind out mfp_to_gpio() as well and either just encode
the offset on gpio-pxa as a define locally.

But this works too, the kernel looks better after than before
and I am not perfectionist, so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
