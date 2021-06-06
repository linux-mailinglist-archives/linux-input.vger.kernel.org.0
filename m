Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E869839CCB2
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 06:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhFFELK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Jun 2021 00:11:10 -0400
Received: from mail-pj1-f43.google.com ([209.85.216.43]:44653 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhFFELJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Jun 2021 00:11:09 -0400
Received: by mail-pj1-f43.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so8309262pjq.3;
        Sat, 05 Jun 2021 21:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9RGUhDVfVswLYqqXVC1PlhfHtAkDi0/utx20TOfAR68=;
        b=WXEsBKiLcotwZ0Ix7atjeWIabXOnkY/+ZH8RmYvQ7myP+Qg8UHpwAolTaDgPFgshRp
         aHmWfquvmMyiUsjLZU6bnFtrFU19EulZOlVxb3CxpDZ/7WIGeqJWE0zTOuyJuylHC4o9
         XwcolI45bSTPyW33+8dXzWQSI/UjSmMMQf7lapzvFJe+Lmt+aarxk2MPonahJ/aaWFZG
         b6yR3cNw1xqGal5u+4n93uldFcpjmbHOFDc+yPM0lvum/3U20zKnL5TRWpxunEbg2vm+
         QYZbNxE5ljOVw1uPUTrQ1DjQ2ul6auI7iphtS5BDjyPZi3LjjHRZ4A8YUC2OW5dxskdm
         snMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9RGUhDVfVswLYqqXVC1PlhfHtAkDi0/utx20TOfAR68=;
        b=HRYyNfs/RNDDW8qp1doq8WzvQ4/u8BjsPS41lz6kYJEjijsLR04ajvzPS7G0cItph1
         JdzK2oS1byXkGCaQULOgowHi7amVp1xPt5zy0YHCzzfty77q07rzDHtn7Y0dkDf0bLm0
         O4R3wHNrmYp3BNIugrUbdwVdNRRE96XTq23bYubNDNLTGysPQ2uWGIMy9yE5t38W32UN
         7egbTkzug4v6F9JmnnS9ikqGn8m4Vf4d/8X26oW3Kv/oyTSrDTBVYnTFfwjHp6yOwoxu
         jt8WGuaEfsTiEuCBPJRfyZ9HoIKHqgd8hMWZamlxPkeCNkM5eKjxO1ibAGCytRzFmC/M
         yyAA==
X-Gm-Message-State: AOAM533CqwgNY4kpEuJgTHkI+KYp5bL0vs3fyHSaLRpFkU4QBq7SHW7a
        kIa5c3euDXwqZqysWafcI5E=
X-Google-Smtp-Source: ABdhPJx8ZM4n8Z53LAIgGPRIz1U2Czn15puW9VAu2xAAwaCGuNyf0PRjkgfZmAbA3X5YSS9P7QnHkQ==
X-Received: by 2002:a17:90b:234d:: with SMTP id ms13mr13164208pjb.135.1622952500849;
        Sat, 05 Jun 2021 21:08:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5762:ab6a:6802:ef65])
        by smtp.gmail.com with ESMTPSA id v6sm5848191pgk.33.2021.06.05.21.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 21:08:19 -0700 (PDT)
Date:   Sat, 5 Jun 2021 21:08:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] Input: cy8ctmg110_ts - switch to using gpiod API
Message-ID: <YLxKMXamSx0aXYSl@google.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
 <20210603043726.3793876-7-dmitry.torokhov@gmail.com>
 <CACRpkdYsw6T_CMoV0XwLZ3YKmrKL5QsWsm4Ap4D47FrKpOCMcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYsw6T_CMoV0XwLZ3YKmrKL5QsWsm4Ap4D47FrKpOCMcw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 04, 2021 at 09:38:04AM +0200, Linus Walleij wrote:
> On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > Instead of legacy gpio API let's use newer gpiod API. This also allows us
> > to get rid of platform data.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> >  static void cy8ctmg110_power(struct cy8ctmg110 *ts, bool poweron)
> >  {
> > -       if (ts->reset_pin)
> > -               gpio_direction_output(ts->reset_pin, 1 - poweron);
> > +       if (ts->reset_gpio)
> > +               gpiod_set_value_cansleep(ts->reset_gpio, !poweron);
> 
> I would perhaps drop in a comment that this de-asserts the RESET
> line when we power on and asserts it when we power off.
> 
> > +       ts->reset_gpio = devm_gpiod_get_optional(&client->dev, NULL,
> > +                                                GPIOD_OUT_HIGH);
> 
> And here that this will assert RESET.

Good idea, added and applied.

Thank you Linus.

-- 
Dmitry
