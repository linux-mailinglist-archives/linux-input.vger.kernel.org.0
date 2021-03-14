Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA2C33A825
	for <lists+linux-input@lfdr.de>; Sun, 14 Mar 2021 22:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhCNVLw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Mar 2021 17:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbhCNVL2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Mar 2021 17:11:28 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76BEC061574
        for <linux-input@vger.kernel.org>; Sun, 14 Mar 2021 14:11:27 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id w8so7711551pjf.4
        for <linux-input@vger.kernel.org>; Sun, 14 Mar 2021 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3CUnWgKJ+L2IVnACZrtk53I7gULLjZhfNrQSO5LlLGY=;
        b=NDPPFY9rW6c9zhGpSSJtTAPxF4/HzRdIe7VlYoNtPM6l8yybEQ55SR4GSH5JIYvgez
         MCewtaKiR0DtD4px6Jw8GA0zwk4UpWMKvEqB2QVTtl3dbia6lXcCdh7MnVGOdYxBvb6o
         DWwnu5BPCW6egV/h2NpBRedStCI6DybS8E/MnbHzRGEJmPGf7eM6j4NT8W4ol6ExCdQw
         rgMo6xh+aJMIZbcWUeZawbn8zVjI04cIKgXHrdrceRGHWroMjaHcKmVfKehpfGQQmLoQ
         x4p4Xm8rIhygD/Rrp85wJ1/lsOFMB7rzyWDaiSbzCatrNELjua+81DQ7YSUgt3xJHHOf
         QzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3CUnWgKJ+L2IVnACZrtk53I7gULLjZhfNrQSO5LlLGY=;
        b=k/h4pOfU5aBmQg0ZxjVKlJtZwuX1LyL8wU/2bQFMFTxoLdh/6DYC/Jb0Cdq8uZeWeN
         ij5xLbweJxtReWymVy1tlpKxh43iaHIlL1Co8NE/V3JF225MrYq1Uz7CjIYcw7+ECVbs
         AI8TEu+nkCqNLPUAPYvghEiGkLjE5A3ppyxqt1kDL56oqy/9sPdf1H5+JWls0Ia5l/NG
         VifGumB7jMpNo92wyUh7+Awt3sdcH+isQ93V1CY7iftJK+mxd/cPXWFOl3t1kIrtjUKX
         w87RpwdyPYsQmCC4mtkVihBuZ3bz9gyu/HB3/mYDTFSgHWAw26EFTnnmsdcLMiqNdRnY
         Eccw==
X-Gm-Message-State: AOAM5339ecyEjkpxzBOVfq/paUdOC+yA7qMJhR31GuP0vKtKJK0gvXwS
        Q09UiWnS16inwvo2zw+m0f+YxUtYXobpJYBYgjY=
X-Google-Smtp-Source: ABdhPJwDBE3ZDdT2C/T3bQ1SS5I9/WcQOaXIcQx8YPnWtFKRPz0lo8UGTovN6T/K2BsVTXBZfAby3whnxKSPrlLb7JI=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr9604765pjx.181.1615756287252;
 Sun, 14 Mar 2021 14:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210308215508.399362-1-andy.shevchenko@gmail.com> <YEak4dbMINWNf2rr@google.com>
In-Reply-To: <YEak4dbMINWNf2rr@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Mar 2021 23:11:11 +0200
Message-ID: <CAHp75VeSSjdLE3raxUKaX_mDro=bYLgSQKSu5bfETSs3kPburA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Input: tsc2007 - convert to GPIO descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 9, 2021 at 12:27 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Mar 08, 2021 at 11:55:07PM +0200, Andy Shevchenko wrote:

...

> > +     ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
>
> OK, I know what my concern was here. You are now assigning
> ts->get_pendown_state unconditionally, and with ts->gpiod being NULL it
> will always return false, whereas the old code would skip setting
> ts->get_pendown_state when GPIO is not available, and the driver would
> assume that on interrupt the pen is actually down.

Good catch!
I fixed this in v3 (left original conditional, if we want to drop the
warning, then we may do it in a separate change).

-- 
With Best Regards,
Andy Shevchenko
