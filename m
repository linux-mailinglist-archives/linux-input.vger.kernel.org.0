Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29EE25AF26
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2019 09:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfF3HF4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 03:05:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33437 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfF3HF4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 03:05:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id x15so5003425pfq.0;
        Sun, 30 Jun 2019 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nItTgpdYH3pwbwYKsAcCgIqN1Zwc5GWGXhs5B6HS6Hk=;
        b=mT8GQ14dKEcm6jsQwytn93YDGjo1VZTx6Z7I/Y7710cw4d+44lhcjsS50Kpd6meQdz
         Psr28m3pcgZPvuLGJhB92n7Qtc+YM9oM2ihPA46GpQPeXDD4YlKZdvwPTY9qFjv7EWkg
         CZw/fJi5xT0LBNfTyQaZAJS3u2ffpy1++FLtJ9L8XzQl7JY5HLrp2fY8kpa5b8IMUZBW
         X6g5SDkQ9kXv9qulWVE1jdMHV64TiIUrMmKEMbx2aVqLWaKCLA1vrNbZcIGDIFfosJDv
         /Y2KyHxv1W2zHdGKsYsTma18hm6MGUmeL4yRmmz4+NzzI91U1rQAK+iZXnhIf/HJHau3
         CZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nItTgpdYH3pwbwYKsAcCgIqN1Zwc5GWGXhs5B6HS6Hk=;
        b=b4NxnmSRvGFIFnOPw0nmbHcIwinOorZKxCPVWOrfZox1LFtg392hLt8DAp6GldQSxP
         HaA5cY7NJgrySyQLPm6uPq1XHBDaeIOQ+Je9AuhKmPl0ysDFVrbZqfxpfjBEwIT0hVxN
         q3SCl7vx69h/4uikrgUBRijtx2SIcGRbVVCCsawmxlVVXD6OSHV3B3lq+eYBFyuBwgKI
         ReRAVvLuDvb/0y633v5aH72goSg4sorp30hIc4teGUXBa9UXDgtz9buDPMvpvrBrjnJw
         1ckIjwQ4XuQPJp/jWa+o63ZsBiyVdFc09+0ocEBeoblCQ0WM4l9Rwfka6Edf9q8BdWzR
         LPrw==
X-Gm-Message-State: APjAAAUYh4Ah9LH6prEz2GIR/FKSPopHNBZAeszWwbdegd8vXjEkJlK9
        mwH4qtKIC0pOWPt9oxbaY+I=
X-Google-Smtp-Source: APXvYqyl3HbHnG+sPL0AsqYuTlCGEKdDitGetb5KktAV/K2Nx9gGtw0khHMI0xIgV97tEvhvKzs77Q==
X-Received: by 2002:a17:90a:8984:: with SMTP id v4mr23414365pjn.133.1561878355094;
        Sun, 30 Jun 2019 00:05:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r15sm9828449pfc.162.2019.06.30.00.05.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 00:05:54 -0700 (PDT)
Date:   Sun, 30 Jun 2019 00:05:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - simplify event reporting code
Message-ID: <20190630070552.GA91171@dtor-ws>
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
 <20190623063153.261546-2-dmitry.torokhov@gmail.com>
 <CAHp75VfgR4d7aOG6XPBXisrfa=30pYfCJZ1Yhh2E44bs8vWmVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfgR4d7aOG6XPBXisrfa=30pYfCJZ1Yhh2E44bs8vWmVw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 23, 2019 at 10:59:18AM +0300, Andy Shevchenko wrote:
> On Sun, Jun 23, 2019 at 9:31 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Now that input_mt_report_slot_state() returns true if slot is active we no
> > longer need a temporary for the slot state.
> 
> 
> > -               down = type != TOUCH_EVENT_UP;
> >
> >                 input_mt_slot(tsdata->input, id);
> > -               input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER, down);
> 
> > +               if (input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER,
> > +                                              type != TOUCH_EVENT_UP))
> 
> Can't we simple do somethink like
> -               down = type != TOUCH_EVENT_UP;
> +               down = input_mt_report_slot_state(tsdata->input,
> MT_TOOL_FINGER, type != TOUCH_EVENT_UP);

Why though? The temporary was needed so we did not have to repeat the
expression for "contact down" condition, and now we do not need it. The
whole change was done so that we cab remove the temporary...

Thanks.

-- 
Dmitry
