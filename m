Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13F55B92D
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 12:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfGAKlg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 06:41:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44184 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbfGAKlf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 06:41:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so1185156pgl.11;
        Mon, 01 Jul 2019 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qm0d/CL3AkP/V4Y4ZQYCIS3sz2RJH3rKXt+V91e+yAw=;
        b=s44Z+4+tvtVjpZ+4o0FixYM973uPTWE+IO4rIWyC9KQz/f6SU7XpTikUH/0jn1GyAx
         Rn+Z1EGiji54UfQV51rKgXDPlg5XwZXAShPrmLub2oGVO0rt2mxCVtfHA++8wUYeKbKG
         QWf0Yx/knZjWmZfJNfa2WFOgNCM3tcmAGLGaTySaPDXqxpKIwL48nITPWlCzKZW/IeG3
         QnLzcD/4mk+z4v2ik7/p5ot9U7NTxKsMapjxF/5dYNpb5CrAgLgyclH+71m5fMFAWlcF
         jiUhK0c3STsJJXTULByK09dKkIn4Uf0LQmPM6qNDRsCvO+WrskhcDhGYcy9VZ9rnuiM+
         LNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qm0d/CL3AkP/V4Y4ZQYCIS3sz2RJH3rKXt+V91e+yAw=;
        b=KDSe008id/W0JzqxHYGj3g/QzZbTuZQkLWWoq6AEcCTPSFeePs5l9jlicFRa4gpKJS
         +dyIzPqreiqUyUZzrWywhVhDbMBaefrE1A+Eds0pUlh4lDfnMDWydJe+/om8yuBRJ/3E
         EkLbTbcyygIZwA/Ik1x82qz5f1nKAMxVJB6Feut0D5FYTerLkTT90ykbLnGmQIolxVuO
         WP1V6In7TY0dz7FM0Rgygid8Yqqr6nogbXKLla5xI09nGhJY4NRMYy8MPBtF2DmLkzZl
         RrbBtpPRzjWVk0hGyB7ivR9MMTPYeNyjJf7SZz9y5JzOw6HHuDaXOIuefv8bgfW9FrFQ
         cHLw==
X-Gm-Message-State: APjAAAVEyATdxDtDPNeHzOdZy3LhwvvULUmRvpC71sGFKQR8FQ6briHo
        7Husa2XOvk0fwdSiMY7vt+NXrVF8lYyjeq0NGu8=
X-Google-Smtp-Source: APXvYqxy7nS2uDui+cjNUAygqng7DoFk2KoHqMLGHqfRb8SSxP/qTghmKNm130kHFZ27SwiMcoedPD8AdYSDX1/W8v8=
X-Received: by 2002:a17:90b:8d2:: with SMTP id ds18mr31003825pjb.132.1561977695103;
 Mon, 01 Jul 2019 03:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
 <20190623063153.261546-2-dmitry.torokhov@gmail.com> <CAHp75VfgR4d7aOG6XPBXisrfa=30pYfCJZ1Yhh2E44bs8vWmVw@mail.gmail.com>
 <20190630070552.GA91171@dtor-ws>
In-Reply-To: <20190630070552.GA91171@dtor-ws>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jul 2019 13:41:24 +0300
Message-ID: <CAHp75VfZn6ZuScgQtXt=5_T=LmsodG7NCCo1ABx6v9aON19c0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - simplify event reporting code
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 30, 2019 at 10:05 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Sun, Jun 23, 2019 at 10:59:18AM +0300, Andy Shevchenko wrote:
> > On Sun, Jun 23, 2019 at 9:31 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Now that input_mt_report_slot_state() returns true if slot is active we no
> > > longer need a temporary for the slot state.

> > > -               down = type != TOUCH_EVENT_UP;
> > >
> > >                 input_mt_slot(tsdata->input, id);
> > > -               input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER, down);
> >
> > > +               if (input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER,
> > > +                                              type != TOUCH_EVENT_UP))
> >
> > Can't we simple do somethink like
> > -               down = type != TOUCH_EVENT_UP;
> > +               down = input_mt_report_slot_state(tsdata->input,
> > MT_TOOL_FINGER, type != TOUCH_EVENT_UP);
>
> Why though? The temporary was needed so we did not have to repeat the
> expression for "contact down" condition, and now we do not need it. The
> whole change was done so that we cab remove the temporary...

I see. Thanks for explanation.

-- 
With Best Regards,
Andy Shevchenko
