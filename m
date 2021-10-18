Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A34432241
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhJRPLr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhJRPL1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:11:27 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1735EC061774;
        Mon, 18 Oct 2021 08:09:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y12so482746eda.4;
        Mon, 18 Oct 2021 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O49qZck/FUON9mmr+JH//18PwFgO+f1wHgk975bD51c=;
        b=VmZbBY16aWPLzlt6Br9nXEfTLA7TReLEAISZZuILZVAjpfHxwA/wqbG7YMS0PnU+P+
         R5yokL+gULNQTy1ZC/NaJWcEbcZrib+mz19FBO/7ZrnFazWHdRb0Fl93pEcdcIMEH+XN
         KaQUtFNbmTNXt04IJ1uZD9lXXjG6S+CMve4AQD9MQojhSXFIlG8nTH5Krp65MV4rltCb
         Gl+Ns3D26UMUhNxZxvC+8bLLV/wQyc3G8X/Vc8s1W3f/+/FRKRw10h04sKEsw2S/gM7k
         e0U0wPM8vc6xic4OgZGzM5bkAVe3aOHA5iVcE0DyEliGNofe8pyQs5TjI5nSUxLZX21S
         1ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O49qZck/FUON9mmr+JH//18PwFgO+f1wHgk975bD51c=;
        b=YIbswQ7Ni60K68RDdq/jmHfPD99yEeHsf7jit6UBznn6bswOwSZicA/OtBEwZZ8TTk
         4REUboj5f36CNdcNt7oCfDNGXv3Ec+XuvmWAxwyseW3rJ7dWDjyAI0wC+4PuAhe6Lkni
         hlr15cATvp5wxfnpd8BRN/53kuh0lrSTwyKOAGgEwxhefEx4PFj/p2hI1JjZOfakALNH
         9UtOMnUS0372IPEkDpYSfZFLOJTPeq7HvCZWk2wqnUjl2o50Z1QcJ/xp7IbCkOKk5Chd
         ibNw8i1dleyc7NxZinIvTyHxe5CB2ZO7KkWp9Mmkwk12yPJVqstx/ruyx0sd41r7gCzx
         WvHQ==
X-Gm-Message-State: AOAM530SXqR4UVNsKbtbn9q1mQipiANAY7cNBraEatk536Q3Ad45oy5Y
        rmuIMnuPG0cPpqUvYtJTcI15irpQkSCb/qIpFdk=
X-Google-Smtp-Source: ABdhPJxdvKVHSKlpnzcnrhNs4EhvuOzaUStv0eobr4UnlD9/9u/rzOFLMjwPMeYViTbx0hvfpF8GSWLwTEVwjS/2gic=
X-Received: by 2002:a50:e00b:: with SMTP id e11mr45546820edl.359.1634569749974;
 Mon, 18 Oct 2021 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com> <20211018143324.296961-3-hdegoede@redhat.com>
 <CAHp75VeG=RLXY16pMzNQbB9GR7GUsRTZu9Rx9yB0u3hzmhGELA@mail.gmail.com>
In-Reply-To: <CAHp75VeG=RLXY16pMzNQbB9GR7GUsRTZu9Rx9yB0u3hzmhGELA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 18:08:18 +0300
Message-ID: <CAHp75VdLLapyoXOJSuS7kFZdu4U6r7tmi3g6wAOrFG0ez+Ajew@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: intel_int0002_vgpio: Use the new
 soc_intel_is_byt/cht helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 18, 2021 at 6:03 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 5:33 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > +       if (!soc_intel_is_byt() && !soc_intel_is_cht())
>
>   if (!(soc_intel_is_byt() || soc_intel_is_cht()))
>
> ?

Self-nak on this. && is slightly better in case we got the first
argument false. Proposed variant will always evaluate both.

-- 
With Best Regards,
Andy Shevchenko
