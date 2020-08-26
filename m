Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EDD253859
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgHZTjc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgHZTja (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:39:30 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3F7C061574;
        Wed, 26 Aug 2020 12:39:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 67so1596721pgd.12;
        Wed, 26 Aug 2020 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNh2UHfnDBJFZuAAjB1x/gVjNQEjX4IXhaifVx9KMYg=;
        b=TSW8FAv5rXY2kU49T1lixs2iC6a5wGtqn+JLeRWQnrL88T61RzK8iC0aEwrE+8jcC9
         JVyeOATatAxsC/mk8XtrZo+Ltq94TFXQr9HWBTRDxgS4O/yFnt/IhEyCKwLOw14HGm3x
         o3Os+Sb2U+cWnaCZw08sBy7x3ZegldIYKH/colQOn/CBcx4W52nrVbXwJw8MpllGxV6g
         6GhQg+1H/ljxgSlH6KG647Zn354P8mW/tv9FsXMt7udRju+M7D2m0jlTGslmVaJ9lYY2
         LWSsfKkpjyKhLbD3Kqik3FRX3kYHr4TZ7xr6Acu8ozIg3Oi1b2lapRPpmETQ0NuE+qvM
         TCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNh2UHfnDBJFZuAAjB1x/gVjNQEjX4IXhaifVx9KMYg=;
        b=G7pU+Db4eznmA8o0q45/0dgFksTFr7XskR2WSWuVygc2V0ktSMSMbaQaAc9vpan75+
         NtHm+j9raCc43NvSlX6pkjh3hId5wYEa5sMdlp/pYCDJqGv6cytNHwScUYo8NFcbRiVz
         ozN9X0s32k4bpWaFdDlKn1qNnXY4sHBa2IQb4TFBRT7vTa+mZ5eYv0gQITcc1C5LIoWO
         MSlwDXGwa1mFUgZQAyL1yoOXx6Dy+C75A8kCKvEhOEP6RgwgyU188VXkAdT3w8xHgbnb
         Zzg/kMBpKcjTYpNO0ZB2ALFC91eAEmHy0JLHnQSYAca8UjfkJOFk/AC/icm7NXu1Bm/0
         VjLQ==
X-Gm-Message-State: AOAM531EVdARk3coJ/K/1l2d09AvwFgOMYkb+YYne8YTM/2BabN0Nz93
        yk2Ynna4Qe3mZwXmupUJo26BNw3eHlKfCYfvBZ2FkfXT3HtQOQ==
X-Google-Smtp-Source: ABdhPJxm+In/cfwz2NLclXgp6idb7afrGQefaHzvk2v/h8ucZ5p69QJhMblL7RdtJDBUgTDQIdlSbFFCUzNXBTdMk8w=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr11737030pgk.4.1598470769163;
 Wed, 26 Aug 2020 12:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-2-krzk@kernel.org>
 <20200826191334.GX1891694@smile.fi.intel.com> <20200826192256.GA14739@kozik-lap>
In-Reply-To: <20200826192256.GA14739@kozik-lap>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 26 Aug 2020 22:39:12 +0300
Message-ID: <CAHp75VcrUKN5S1HUdfzijx8xNEaA75jRAV893Khzm83i47cqgA@mail.gmail.com>
Subject: Re: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 10:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Aug 26, 2020 at 10:13:34PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 26, 2020 at 08:16:44PM +0200, Krzysztof Kozlowski wrote:
> > > Common pattern of handling deferred probe can be simplified with
> > > dev_err_probe().  Less code and also it prints the error value.
> >
> > > --- a/drivers/input/keyboard/gpio_keys.c
> > > +++ b/drivers/input/keyboard/gpio_keys.c
> > > @@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
> > >                              */
> > >                             bdata->gpiod = NULL;
> >
> > gpiod_get_optional()?
> > Do not see much context though (but please double check your series for these
> > kind of things).
>
> It would fit except it is devm_fwnode_gpiod_get() which does not have
> optional yet.
>
> I can add it although the scope of the patch grows from simple
> defer-path-simplification.

No need. My comment only about existing API per individual cases. SO,
here it's fine then.

> Thanks for the feedback.

You're welcome!

-- 
With Best Regards,
Andy Shevchenko
