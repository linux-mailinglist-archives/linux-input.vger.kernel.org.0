Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566AA1F853
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 18:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfEOQSL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 12:18:11 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40539 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfEOQSL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 12:18:11 -0400
Received: by mail-qk1-f193.google.com with SMTP id q197so340257qke.7
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKJWA2gYy8hkL7h9RJYBNbZLfdoFycnmyjs/dg+DBhI=;
        b=nqADupGETekpQGxSasrfeywHHy3SYg0lZm05IeXauZpYwkicj0KwonpEd1x2ET9RhQ
         50LV0Qm23En3mVyamgg4DrsgqAIARvRC650+m7BvHXoYYg6AS5TI7cw/VUAKJN/17wgw
         HzrQ4/m4lX2iLB2MmUZPu1aHzEQS7j9t8fkSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKJWA2gYy8hkL7h9RJYBNbZLfdoFycnmyjs/dg+DBhI=;
        b=JZfOt5uFagee/R51lC81HR8JwgPOgTPkM9ZlqEc2PW/bXACMl8Jl0NtuYgNxgHOR4u
         Tqg6K09jqO6bcYPFzhqoq9p9pGq1HihjStDvhqsJq9WnYgzgi50h44g94Uhi2kZdWbYL
         c2Lvc3tqLOXxpLQ0wNqGDpsrB0jdZcFtaI93N8XyjUkg2WdTORgPyFV3bkMW2eBjcY/1
         OIEDczkzY0QO/tDC91mX9rcu8zr+0EcTCtlSg4cvZEY7qehDIp9ktGZIs1y2JVowBepJ
         KQGsAE0oBF/uElmy9EpyA+UaImw1O8GCL3N7KMQ3ferRK3bwhhuJX+hNtZld4ZoE100a
         MPXQ==
X-Gm-Message-State: APjAAAXpua6Eh6QkcVE9v8yaD9gqkI8Om/EMJftEVkYeHUqLgWjDNphK
        eFupvz/mvmBurtgidojE0svePnNyfoQFafXyEf9auA==
X-Google-Smtp-Source: APXvYqzxBO3O/axKZZPrkz1SErSLRjHPViiYzVfRAlQlCkiJUzYIqsT0KwYglti9YjSfrpCPHE4czG8MNoAoAPztlNI=
X-Received: by 2002:a37:a5c6:: with SMTP id o189mr34016558qke.318.1557937090254;
 Wed, 15 May 2019 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190513220610.177489-1-ravisadineni@chromium.org> <CAKdAkRQ_J6QWxtWpoRQnNWKcJpXox6xVDZWcWYOXkBhPSn99Rw@mail.gmail.com>
In-Reply-To: <CAKdAkRQ_J6QWxtWpoRQnNWKcJpXox6xVDZWcWYOXkBhPSn99Rw@mail.gmail.com>
From:   Ravi Chandra Sadineni <ravisadineni@chromium.org>
Date:   Wed, 15 May 2019 09:17:59 -0700
Message-ID: <CAEZbON4Z5GKYvMZJ8ojko_f1xzv2rf4uR6cDz2LMxu+XvzTzog@mail.gmail.com>
Subject: Re: [PATCH V1] elan_i2c: Increment wakeup count if wake source.
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Abhishek Bhardwaj <abhishekbh@google.com>,
        Todd Broch <tbroch@google.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, May 13, 2019 at 4:29 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Ravi,
>
> On Mon, May 13, 2019 at 3:06 PM Ravi Chandra Sadineni
> <ravisadineni@chromium.org> wrote:
> >
> > Notify the PM core that this dev is the wake source. This helps
> > userspace daemon tracking the wake source to identify the origin of the
> > wake.
>
> I wonder if we could do that form the i2c core instead of individual drivers?
I am sorry, I don't see a way how this could be done.
>
> >
> > Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> > ---
> >  drivers/input/mouse/elan_i2c_core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > index f9525d6f0bfe..2c0561e20b7f 100644
> > --- a/drivers/input/mouse/elan_i2c_core.c
> > +++ b/drivers/input/mouse/elan_i2c_core.c
> > @@ -981,6 +981,8 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
> >         if (error)
> >                 goto out;
> >
> > +       pm_wakeup_event(dev, 0);
> > +
> >         switch (report[ETP_REPORT_ID_OFFSET]) {
> >         case ETP_REPORT_ID:
> >                 elan_report_absolute(data, report);
> > --
> > 2.20.1
> >
>
> Thanks.
>
> --
> Dmitry

Thanks,
Ravi
