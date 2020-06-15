Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD9A1F8DF0
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 08:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgFOGgm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 02:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbgFOGgl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 02:36:41 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFDBC061A0E;
        Sun, 14 Jun 2020 23:36:40 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id j19so10083271ilk.9;
        Sun, 14 Jun 2020 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BzMeUKuUyJ2mfwS8ROotjoI9/ypgi2R999TrALWXqeM=;
        b=JigDBEdIzzTTP3gqOGmhQ2GymQKEi0GO/RTGfMSGESgMQqnLGWK/yGPGULXIocnnoD
         Xk7+zfMKvohfpxnUIyVwboiHbs6+HwRviv9P3hDPGKd4XehH5cunvpe7FOKkYeUDn00i
         bmcK2FcJBHWexKKVt7pPkCwckGuyQhxFk/ErqKquNp0dQP9HNTk1EeNTrdI0xuzpBFx1
         A6nCAlpNqmm7Gg4CnO3eg+6y/eTMrsg4VDXMoXxQTrdG73rfuzwtjF86//3inA7ilpeL
         K+K4NEB5fK2Ye3ce0v7dBI2J8jzpVkChAI79oEmHsLDsm509MhCLN5Z6qvWyj5sowaxE
         SZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BzMeUKuUyJ2mfwS8ROotjoI9/ypgi2R999TrALWXqeM=;
        b=FMmGxC1flWDURnh+aWcGgWdAewjw8J9f7eUFtJtQPc+XtNoHD9coetjh/sVKjad2Dl
         WQINeagoYOVeFPKf0eymFgfkaA8SfsB54HsNSenG8YKPrEh4Gewh8hrGQDxW6F0MnAxT
         SeAVSuX9DpINPoGhw5scD48+Ea8gy3DXLjQrxjog7gW7XNRENdYIAorZ0urFcVsHbddi
         kQilJm853L3IBsrOXYSfSJB1/dIJpt04GUY2LnHAN6KlcTyh48r9bsU7HvOEV+BvDacg
         DQM9/BKFo5xXWeDErRpXCXxb6DKL+DXZ8NQHyrT9jSTFFM6Xi0p8leSw44NCotDmtrrx
         HDEw==
X-Gm-Message-State: AOAM5320nvpVJ97wjewtqJJ1ywOfaBm+y/avKR5/EmhRZJWPrUFXEjde
        fWUaQMnT+taEExiQ1IuouFUKuQ4gzsjz8AoXajQ=
X-Google-Smtp-Source: ABdhPJzcdxEnPC2YbZby/YnY8Zr3ZGHT3bnunhra2/DiGyRtelpJiiS0AQZNqRF4F4M6DEoaT29/UOqVg7mOU0JcbDg=
X-Received: by 2002:a05:6e02:13f4:: with SMTP id w20mr25628332ilj.294.1592202999825;
 Sun, 14 Jun 2020 23:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200614055604.67969-1-navid.emamdoost@gmail.com> <CAHp75VcuRvaQwcTP0+Y+QJTvjoEzYTvV40coUxnsZPfWnwcNMg@mail.gmail.com>
In-Reply-To: <CAHp75VcuRvaQwcTP0+Y+QJTvjoEzYTvV40coUxnsZPfWnwcNMg@mail.gmail.com>
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Date:   Mon, 15 Jun 2020 01:36:28 -0500
Message-ID: <CAEkB2ES7SjV8JMb8MAO9CWhg=_VekQehF+NxxYs6e6=xySUEBw@mail.gmail.com>
Subject: Re: [PATCH] Input: bma150: fix ref count leak in bma150_open
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 14, 2020 at 4:27 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 14, 2020 at 8:58 AM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > in bma150_open, pm_runtime_get_sync is called which
> > increments the counter even in case of failure, leading to incorrect
> > ref count. In case of failure, decrement the ref count before returning.
>
> ...
>
> >         error = pm_runtime_get_sync(&bma150->client->dev);
> >         if (error < 0 && error != -ENOSYS)
> > -               return error;
> > +               goto out;
>
> So, what will happen in case of -ENOSYS?
I'm not sure!

>
> ...
>
> > +       pm_runtime_put(&bma150->client->dev);
>
> Slightly better to use _put_noidle(). (More consistency with error path)

v2 is sent.

>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Navid.
