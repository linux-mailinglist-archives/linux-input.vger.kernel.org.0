Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995CE254FEE
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 22:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgH0USk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 16:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0USk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 16:18:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D935BC061264;
        Thu, 27 Aug 2020 13:18:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id n3so3120170pjq.1;
        Thu, 27 Aug 2020 13:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJ9ggPa2XTFO0SYWdRumNSBhXW77Wne8Cizbx4794JM=;
        b=DIOK9W1Y7b9ZT9pVs3Oo73huYt7MWVdhKX1PqA3heiz1xKWJF4LN4CpTV/NPhgOULo
         KFFvnvlAWdwwXYv4QP7rT/38SlEVDLd9Z2FsQwWKWRETBmLYaXS4FtOCPTMX4gWl6DKd
         sf2ahAmosVW7xJAzQxo5IUYRX1PJLAxHb6bOf8ayR5bhVOszh1LRUlTKhTo4bMxEeLMW
         FPdW/NUDSmCfMYFX/+Qt4sTHEhdsVcmKip9k3G3d8FIDlWiBIfr0omio7cTInSWP0ZWT
         PC4EhOBVGuWXJBdkBBP98gZYxnzUI9SXmHznDCV17Anrolo3n+XFT4zIKqPUIG7cZlSd
         7T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJ9ggPa2XTFO0SYWdRumNSBhXW77Wne8Cizbx4794JM=;
        b=Yx1C/KMBaUR5iNLCq0Kc4AEMkUqOkV7bbQ8ZqdOWwfO235yseq80FcrM7ddyHZhBfB
         Vp2re812IdxAXKuQwzLHQx2Dx0v8EAcyMT8eZ70tKAZoy31Q8o31yxjZxAoJXcfXSe2E
         jdX1vhQ2FhEDGPUNooFB2HiP69u+cHX3SPfEJ8hVYxNjkcF5JjLcXifw3AWOyQJlYKCM
         5hWaOTXPvakhcVx68YCRLOiBSkHswQUWtGS9i0C9sajFNzmDI91WieZw42GMuH6/geNk
         yt9spLf9/fdyTn+/HLN0h0ilHH8RD0s/WPZlXQaexN0W6XK7C02h9lVHzW9ZqNRXiGdf
         lyUQ==
X-Gm-Message-State: AOAM532R8VCk4u8H49Ab29vWsh7CUFmc7uZbhDBf+EVbMg2EVM05w5YF
        Os+ii49feqIhTndWX4mZiDv2Q7kX0kqKVl4kgcZGTy7gBhdWTA==
X-Google-Smtp-Source: ABdhPJyG0xnrG1CdLhtmiiW/DFCoU8s0Jkonrgv2RvIG4he9l0TkUPlw8tGMVnByc4xARDIBNnA+sVDgOhJO2J4nuA8=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr512560pjz.228.1598559519457;
 Thu, 27 Aug 2020 13:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
 <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
In-Reply-To: <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 23:18:23 +0300
Message-ID: <CAHp75VeOMe2rGhuhCs8=oizwmCEXR_rStHY-TthkEu=3Csjh8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "S, Shirish" <Shirish.S@amd.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 11:12 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Aug 27, 2020 at 10:52 PM Raul E Rangel <rrangel@chromium.org> wrote:

...

> > +       mutex_lock(&i8042_mutex);
> > +
> >         spin_lock_irqsave(&i8042_lock, flags);
> >         retval = __i8042_command(param, command);
> >         spin_unlock_irqrestore(&i8042_lock, flags);
> >
> > +        mutex_unlock(&i8042_mutex);
>
> Question 1. Why do you need mutex at all in the above situation? Spin
> lock isn't enough?
>
> ...
>
> > -       i8042_lock_chip();
> > -
> >         if (value == LED_OFF)
> >                 i8042_command(NULL, CLEVO_MAIL_LED_OFF);
> >         else if (value <= LED_HALF)
> >                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
> >         else
> >                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
> > -
> > -       i8042_unlock_chip();
> > -
>
> Now, these three commands are not considered as a transaction (no
> atomicity). That's why your patch is wrong.

Ah, I didn't pay attention that this is one command call. But still Q1 is valid.

-- 
With Best Regards,
Andy Shevchenko
