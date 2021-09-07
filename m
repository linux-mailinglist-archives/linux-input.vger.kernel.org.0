Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F26A4023EB
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 09:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbhIGHTn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 03:19:43 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:34443 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236364AbhIGHTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 03:19:43 -0400
Received: by mail-ua1-f52.google.com with SMTP id l24so5052537uai.1;
        Tue, 07 Sep 2021 00:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V5EnHPBv3ULB1sO4nyNicCIoiRa8ocVjyLxh6eAx6Uk=;
        b=ioiXVjxk8yBLEROpu82mcUxhhosc79fpM/WqxDJuEA/s8OiGpxrJT2OHbQfkZzeatB
         csyRJi8fbIgZFQEnqcoeNt3EQZnLnknW7Fy7dOoLJ5fZSWi6pZeb5Gbe1Arsx81ldN1r
         KuKCo0H+TMYytWnLrLUCgrCoAjTI3eDJFQvwFbIPnwg4f/lD4qu2QXSNBY8StvnwauYp
         icmotJBA4hl3nmvQ13LCo1ckYcFOWA4GATPS2FGNOF+LpGWi5vjp9GBfYH7ROHowzKWf
         dF3gwyEuYse8+nK0jhO/W5aVFY8h26OFLzWFsXtM5JHrqb/SX+q0cKPDQ9o+1BI1NV76
         azCw==
X-Gm-Message-State: AOAM5318W165QLFZj2mrriNDEPpkWe5PC8qdqSGMMQ4Jnz0fT/l5VNgs
        hajssOz5P2I2iAR4EGFEwPbDP6GHk1u0CPUhXow=
X-Google-Smtp-Source: ABdhPJwYStegWrFcfYO1tOcPGUkCDtndV33EhSvbi9Z8O/+ptssKI5gOces9E1Lxednmnw34J1eygk4W1qEabSZu1kw=
X-Received: by 2002:ab0:4d5b:: with SMTP id k27mr7619546uag.78.1630999116742;
 Tue, 07 Sep 2021 00:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210907063335.2837366-1-linux@roeck-us.net>
In-Reply-To: <20210907063335.2837366-1-linux@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 09:18:25 +0200
Message-ID: <CAMuHMdXF8vkTRHgP8jbazP5zhFxm7X2KX6uu8OvzNAjRz0saGw@mail.gmail.com>
Subject: Re: [PATCH v2] Input: analog: Always use ktime functions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 7, 2021 at 8:35 AM Guenter Roeck <linux@roeck-us.net> wrote:
> m68k, mips, s390, and sparc allmodconfig images fail to build with the
> following error.
>
> drivers/input/joystick/analog.c:160:2: error:
>         #warning Precise timer not defined for this architecture.
>
> Remove architecture specific time handling code and always use ktime
> functions to determine time deltas. Also remove the now useless use_ktime
> kernel parameter.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
