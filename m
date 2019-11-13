Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB96FAC5E
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 09:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfKMIxN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 03:53:13 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43244 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfKMIxN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 03:53:13 -0500
Received: by mail-ed1-f65.google.com with SMTP id w6so1132807edx.10;
        Wed, 13 Nov 2019 00:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FoGUhCm680vi47F9sLMQ0q9Kc3J8GAzDERB8/9i6vVc=;
        b=qtGPr4deSvpj4x5RdL3rFC9hggsBvUCn3D1O/3RCasj5aZAkjQfQc+cLAtGCIcqkzr
         9dOSLucAlT1qPlWNmwYlMUROvs7fwBrQWajVzwyJWStgLgOop6xp0feotm8nSZBWuZYP
         zvquUzyTAKcU7MTb3/4NnR0UegmrXtFpsX4UAizHxuBksORhYx2VT2fr7jTbsMCrlsLX
         S2d/rXfcnpNqNExuRMV2ue9ts+/5EuX4L0H3dgQH+DwXSr/Vr5RkcGrnSI9V9hPe/mKU
         R7KMAUmXgH0QPqasr2STMBdem4ENOS3bMv5AoA+AS6mFfb7E5B0I6/brwesnnbVjwePJ
         K5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FoGUhCm680vi47F9sLMQ0q9Kc3J8GAzDERB8/9i6vVc=;
        b=I0VW04v5eNokITRcCIKqg8Kli1I/HsiJr54TjHa9AGfDWK7YosMaugwZ2ZUmFGCdGX
         apd00p/AbeSrcO+QCzG7y3WSEgOcS2TvRMq4hMv+ZqSzn2QEAuuV1AcvNmrg1xbuKk9n
         5HVzyx7AYMZS3dWHIzgDAjTu78cj4gMWsQVoDNFPT+k9o88HB3So5NUIJWGm0or/4kAA
         1d2REBxUO4V0uHnTef0ionG1QOCd+GoG7zHHzFxU3m/kPhNZ2e7jWshws9LQjsNW+pQ2
         7QPnkjvUufHFzWm2GTXXIimC+93uRSrFbVqgvKF6OviawnBG2UAyyLLUKo5qADMknHsF
         E7rQ==
X-Gm-Message-State: APjAAAW2rIhgShgsyS32CS+k7s9Mmv4Gbo4U3RJXn7cCLq9SIta2yYZn
        D9p14tX1s9xS/wprJNXI3JfAyUJ3609yPRu1gDGSnJcIc+E=
X-Google-Smtp-Source: APXvYqykbAeNxkhzfCInuS/D+NDlZqpUkdVeXncWYZmM8rbwyrXFupsbFgKOj5++g3YsPMTdta71N511lfV3auXd9RA=
X-Received: by 2002:a17:906:a388:: with SMTP id k8mr1553484ejz.223.1573635191206;
 Wed, 13 Nov 2019 00:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20191113063656.8713-1-hslester96@gmail.com> <20191113082315.GP13374@dtor-ws>
In-Reply-To: <20191113082315.GP13374@dtor-ws>
From:   Chuhong Yuan <hslester96@gmail.com>
Date:   Wed, 13 Nov 2019 16:52:59 +0800
Message-ID: <CANhBUQ3CaRm1SjO4DJOSHpodUpJrHstzD5MYk13vo=EEigDEYA@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - add missed operations in remove
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 13, 2019 at 4:23 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Nov 13, 2019 at 02:36:56PM +0800, Chuhong Yuan wrote:
> > The driver forgets to deal with work and workqueue in remove like what
> > is done when probe fails.
> > Add the missed operations to fix it.
>
> Is it really possible for the work to still be pending when fully
> registered device is properly unregistered? I thought we'd wait for
> successful data acquisition in rmi_f54_buffer_queue() before unregister
> can complete.
>

In fact, I am not familiar with the mechanism here...
I have checked other drivers with video_unregister_device and found none of
them deals with work in remove.
Therefore, I think your opinion should be right and we only need to deal with
the workqueue.

Regards,
Chuhong

> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> >  drivers/input/rmi4/rmi_f54.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
> > index 710b02595486..2c0cde5c775c 100644
> > --- a/drivers/input/rmi4/rmi_f54.c
> > +++ b/drivers/input/rmi4/rmi_f54.c
> > @@ -730,6 +730,9 @@ static void rmi_f54_remove(struct rmi_function *fn)
> >
> >       video_unregister_device(&f54->vdev);
> >       v4l2_device_unregister(&f54->v4l2);
> > +     cancel_delayed_work_sync(&f54->work);
> > +     flush_workqueue(f54->workqueue);
> > +     destroy_workqueue(f54->workqueue);
> >  }
> >
> >  struct rmi_function_handler rmi_f54_handler = {
> > --
> > 2.23.0
> >
>
> Thanks.
>
> --
> Dmitry
