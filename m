Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD50267EDC
	for <lists+linux-input@lfdr.de>; Sun, 13 Sep 2020 10:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgIMIoB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Sep 2020 04:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgIMIn6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Sep 2020 04:43:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF98EC061573;
        Sun, 13 Sep 2020 01:43:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fa1so3888749pjb.0;
        Sun, 13 Sep 2020 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWPCM95Jy2jcUDCt/7JKciRdRd6ZqKhPdOh02zVP2WY=;
        b=e9ID21zfyOzkuDF3fBH/KTxyhXXlhaDMc4LSK7ayHMycUkioT/QXADEHbhQHiLO0+S
         r5QfSR9R6qhaMva2dtcOU3d2je6WczL1zSkQ1mJMR/HIA0E77nj7nLUUACaBSnkMWomd
         PRbWcdsewzcsrGaGwmvrhu3aGvRUgut+dG0uIGgnhPqsVAO09ehPpQl16I575qTcdde5
         bV94fL1Ibl04oOCSen93nsCYtXw05R+C9aCWwrfgkuZX5Q0BrTojjpNyAz/P1ueGMjpU
         2z9S5c5SCVt7zUUZfGzPS9J5ALNHVOPYmYYq87wW2S1XyMamil5qTcLBYbiIwoL5iDzp
         WoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWPCM95Jy2jcUDCt/7JKciRdRd6ZqKhPdOh02zVP2WY=;
        b=AFH0B47swaMOUcKVwheDV6g4pnGVe1Gz7iMGM83+8/u2U0swpj5Y7NzNrZu4HrQyNK
         cjPFZk6KjT7IqzwRNWtztGWf0ozLbYBeyF9CKR19mPXpYa/MjguFsfY8HHRBwB/HLQFN
         jV02dgihQVX8cTTE3tUhoyIdo5bboz3PGv2jotshoVu1XsrLT7Q/ihIT0XiGXA2BzwYM
         h2zwzLS2W0w/grT73J9Y6EVG3DKUsvTaQCCGpalf9Ta96OKsbyePVOOOszveWvUfSTIP
         ORng3ikJXxkTeOF4rzZ7f/oEdnkufpdktgKARv8ime0R6Jdt5J7VPp9j9/YcfuLKWstW
         OJKw==
X-Gm-Message-State: AOAM531wJ+XVDTPkzM6T2L0WKlj8cso2IZYi9Nz4YEGMlsVGYWANyPng
        jRN/n9CGBxy0BlloNQsbxfVEWfT6+FhXWCLZ3aE=
X-Google-Smtp-Source: ABdhPJzoTbwbjwFKbRIYZKGm2TbUhjNVNTLMz9ur5f3kxZgQjIc5fModNGFB3comxXJPGSwkgJlxyHe89t6ENTsbSts=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr9444554pjr.228.1599986637349;
 Sun, 13 Sep 2020 01:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200912005521.26319-1-jiada_wang@mentor.com>
In-Reply-To: <20200912005521.26319-1-jiada_wang@mentor.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Sep 2020 11:43:41 +0300
Message-ID: <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew_Gabbasov@mentor.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 12, 2020 at 3:55 AM Jiada Wang <jiada_wang@mentor.com> wrote:
>
> From: Nick Dyer <nick.dyer@itdev.co.uk>
>
> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> when they are in a sleep state. It must be retried after a delay for the
> chip to wake up.
>
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [jiada: return exact errno when i2c_transfer & i2c_master_send fails
>         rename "retry" to "retried" and keep its order in length
>         set "ret" to correct errno before calling dev_err()

>         remove reduntant conditional]

redundant

> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>


...

> +       bool retried = false;

I thought Dmitry wants that to be retry

>         u8 buf[2];
>         int ret;

> -       ret = i2c_transfer(client->adapter, xfer, 2);
> -       if (ret == 2) {
> -               ret = 0;
> -       } else {
> -               if (ret >= 0)
> -                       ret = -EIO;
> +retry_read:

> +       ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> +       if (ret != ARRAY_SIZE(xfer)) {

I'm wondering why you can't leave 2 as is and change it to ARRAY_SIZE
in a separate patch?
Also why switch from positive to negative conditional?

> +               if (!retried) {
> +                       dev_dbg(&client->dev, "i2c retry\n");
> +                       msleep(MXT_WAKEUP_TIME);
> +                       retried = true;
> +                       goto retry_read;
> +               }
> +               ret = ret < 0 ? ret : -EIO;
>                 dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
>                         __func__, ret);
> +               return ret;
>         }
>
> -       return ret;
> +       return 0;
>  }

..

> +       bool retried = false;

Same comments here, in this function.

> +retry_write:
>         ret = i2c_master_send(client, buf, count);
> -       if (ret == count) {
> -               ret = 0;
> -       } else {
> -               if (ret >= 0)
> -                       ret = -EIO;
> +       if (ret != count) {
> +               if (!retried) {
> +                       dev_dbg(&client->dev, "i2c retry\n");
> +                       msleep(MXT_WAKEUP_TIME);
> +                       retried = true;
> +                       goto retry_write;
> +               }
> +               ret = ret < 0 ? ret : -EIO;
>                 dev_err(&client->dev, "%s: i2c send failed (%d)\n",
>                         __func__, ret);
> +       } else {
> +               ret = 0;
>         }

-- 
With Best Regards,
Andy Shevchenko
