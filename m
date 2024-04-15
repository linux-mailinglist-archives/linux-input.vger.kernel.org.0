Return-Path: <linux-input+bounces-3018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1768A4F0B
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 455B71C21062
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FB16CDA0;
	Mon, 15 Apr 2024 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VC6kcO3I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5161E528
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713184244; cv=none; b=k/djkF91IzeUCnL46uqtWvQ26QggKx9J3cbSbhLxPmvjqkBYp96rd367w31sw8p7q7O0LB8v52eWdUVeZCEB5XCHjVwqf7JybwDzp8EHntb+ILEFgmE8sFH6WUnFRfqTKCqsJ914Jajo8/jsr7rAYPnTqyeKzlcDKXdsDVJgGWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713184244; c=relaxed/simple;
	bh=bkGnhs7PJ8OOKZ5y6B5HPMDwkCHoSF7LVLRrDly7Tv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZswxSclImxjPw6WIlfXxJuH9qpZ7/p5DMcljMugyjwa30wcJVpUk1HgjNzCqOkkCDzLgFBjgYqPaB9Go0jz7y98UvsTKhopk/puodfbGWQ4A5sRqzmnsG9h8fzlCChfbRCY0Nm5YoJ4Bzy3vI3XTrQPyTgu/R7gulJwAVeitPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VC6kcO3I; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ea26393116so2679229a34.0
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713184241; x=1713789041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=15FFNZS5+4Pc5VWt8dTUjBnqUdgKT2Z2ZIhgNzLysQg=;
        b=VC6kcO3IUIQQ1xWG1n7b6MXGsr1SBA2+CNug4vibOofnmE9K5FwFYzQuvuXxtPvxr4
         nX8QyRsthJaZKyKOtzhSJLAsYtOKzbZdPJbl6NSy1DiatmZCQp9xarHlxLKQv9m7i4K/
         PYnf/kIvnRqIutVsQpSc/BnyFtw0/Wj//jer4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713184241; x=1713789041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15FFNZS5+4Pc5VWt8dTUjBnqUdgKT2Z2ZIhgNzLysQg=;
        b=LognPpIVLwDRGpVcqYr0WHpLCU+S+D8CCBLmM2SppoCm7YCQ6bhnQDdtQa4BhZVnYm
         bobMYM/BTU2aMpD5iuaRzIdzVOCWhjwhm+DRKd9hr1G+EDr7CHw0ndl0RnkLPy/qtvuA
         ojRCFiDAPkiieBNp5hULcaNWKGf8VKYe9LLb1TDpf6majvpPnXteErZQHjSlfI0+2txs
         pUBMRp5q4khoukw1i1qISXw2So/c/zHB1tO1hmfkWDn+kBPBBA9sQxho4W3+Ereayv7V
         A8UJoTXIRpI0j17/kMI/8uAhVecZuhfzNv1lZ5FFEPCPDk4RjisttIvvB0HtwVueRhts
         BaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtNy5HLim8KsnQ3VNe7wfBnZRwMbMPsY757FDyLXxmjT1jn1l1Qb8vpOb1M9iXm2Ux6Es5auV6EvM7o8S93QUv8Yjs93U2oNUnM+A=
X-Gm-Message-State: AOJu0Yzf2hXxzZP3qkfPhyVKpKwmPBSkbl4eASI0dcICZ+Yn53raoEwc
	oT/BLPWnxz+jwDm7rxtUe/5AdWqIt3sK+N1lEgeRqlnNu+6ukVjUl7fAOrFXGAhvp2rkChVrSVw
	=
X-Google-Smtp-Source: AGHT+IEqkaH+I+nNEOuVqSkqSuP2P16tFIwtfe1ToITjcJQn17AB8kLHi0W7x5U0kDtL0xh2iDI1GQ==
X-Received: by 2002:a05:6870:315:b0:22e:8539:60a0 with SMTP id m21-20020a056870031500b0022e853960a0mr10811564oaf.46.1713184241069;
        Mon, 15 Apr 2024 05:30:41 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id kq1-20020ac86181000000b00434c31fa60csm5901357qtb.92.2024.04.15.05.30.40
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 05:30:40 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-479c8f43ca5so1026611137.0
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMOdc0VKH7YUfdmNxWbXrWbkq2gy9L4XxsyryLi3z++FzkTC2FxNA6o5QJeSJjYqq+Fqx5+wNr8Tcl2MvuLJ5hwiWCg7QzkwOLLf8=
X-Received: by 2002:a05:6102:109a:b0:47b:67d1:52be with SMTP id
 s26-20020a056102109a00b0047b67d152bemr4926160vsr.6.1713184239402; Mon, 15 Apr
 2024 05:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-smatch-v2-1-65215936d398@chromium.org> <a0c8faf3-0043-4eed-9e5d-b1a50d7405f1@xs4all.nl>
In-Reply-To: <a0c8faf3-0043-4eed-9e5d-b1a50d7405f1@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 14:30:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6DTSmQcEFfhB5ab6_D8iSTMgJBt+yVXswU2yjkshNjw@mail.gmail.com>
Message-ID: <CANiDSCu6DTSmQcEFfhB5ab6_D8iSTMgJBt+yVXswU2yjkshNjw@mail.gmail.com>
Subject: Re: [PATCH v2] media: usb: siano: Fix allocation of urbs
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 15 Apr 2024 at 14:24, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 15/04/2024 14:12, Ricardo Ribalda wrote:
> > USB urbs must be allocated with usb_alloc_urb. Quoting the manual
> >
> > Only use this function (usb_init_urb) if you _really_ understand what you
> > are doing.
> >
> > Fix the following smatch error:
> >
> > drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v2: Thanks Hans
> > - Only leave 1/6, the other ones are in another PR
> > - Fix the return tag and NULLify the urbs on return
> > - Link to v1: https://lore.kernel.org/r/20240410-smatch-v1-0-785d009a852b@chromium.org
> > ---
> >  drivers/media/usb/siano/smsusb.c | 36 ++++++++++++++++++++++++++----------
> >  1 file changed, 26 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
> > index 723510520d09..2e25b970946a 100644
> > --- a/drivers/media/usb/siano/smsusb.c
> > +++ b/drivers/media/usb/siano/smsusb.c
> > @@ -40,7 +40,7 @@ struct smsusb_urb_t {
> >       struct smscore_buffer_t *cb;
> >       struct smsusb_device_t *dev;
> >
> > -     struct urb urb;
> > +     struct urb *urb;
> >
> >       /* For the bottom half */
> >       struct work_struct wq;
> > @@ -160,7 +160,7 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
> >       }
> >
> >       usb_fill_bulk_urb(
> > -             &surb->urb,
> > +             surb->urb,
> >               dev->udev,
> >               usb_rcvbulkpipe(dev->udev, dev->in_ep),
> >               surb->cb->p,
> > @@ -168,9 +168,9 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
> >               smsusb_onresponse,
> >               surb
> >       );
> > -     surb->urb.transfer_flags |= URB_FREE_BUFFER;
> > +     surb->urb->transfer_flags |= URB_FREE_BUFFER;
> >
> > -     return usb_submit_urb(&surb->urb, GFP_ATOMIC);
> > +     return usb_submit_urb(surb->urb, GFP_ATOMIC);
> >  }
> >
> >  static void smsusb_stop_streaming(struct smsusb_device_t *dev)
> > @@ -178,7 +178,7 @@ static void smsusb_stop_streaming(struct smsusb_device_t *dev)
> >       int i;
> >
> >       for (i = 0; i < MAX_URBS; i++) {
> > -             usb_kill_urb(&dev->surbs[i].urb);
> > +             usb_kill_urb(dev->surbs[i].urb);
> >               if (dev->surbs[i].wq.func)
> >                       cancel_work_sync(&dev->surbs[i].wq);
> >
> > @@ -338,6 +338,8 @@ static void smsusb_term_device(struct usb_interface *intf)
> >       struct smsusb_device_t *dev = usb_get_intfdata(intf);
> >
> >       if (dev) {
> > +             int i;
> > +
> >               dev->state = SMSUSB_DISCONNECTED;
> >
> >               smsusb_stop_streaming(dev);
> > @@ -346,6 +348,11 @@ static void smsusb_term_device(struct usb_interface *intf)
> >               if (dev->coredev)
> >                       smscore_unregister_device(dev->coredev);
> >
> > +             for (i = 0; i < MAX_URBS; i++) {
> > +                     usb_free_urb(dev->surbs[i].urb);
> > +                     dev->surbs[i].urb = NULL;
>
> You don't need to assign to NULL here...
>
> > +             }
> > +
> >               pr_debug("device 0x%p destroyed\n", dev);
> >               kfree(dev);
>
> ...since here the whole dev struct is freed.
>
> >       }
> > @@ -390,6 +397,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
> >       void *mdev;
> >       int i, rc;
> >       int align = 0;
> > +     int n_urb = 0;
> >
> >       /* create device object */
> >       dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
> > @@ -461,16 +469,18 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
> >       dev->coredev->is_usb_device = true;
> >
> >       /* initialize urbs */
> > -     for (i = 0; i < MAX_URBS; i++) {
> > -             dev->surbs[i].dev = dev;
> > -             usb_init_urb(&dev->surbs[i].urb);
> > +     for (n_urb = 0; n_urb < MAX_URBS; n_urb++) {
> > +             dev->surbs[n_urb].dev = dev;
> > +             dev->surbs[n_urb].urb = usb_alloc_urb(0, GFP_KERNEL);
> > +             if (!dev->surbs[n_urb].urb)
> > +                     goto free_urbs;
> >       }
> >
> >       pr_debug("smsusb_start_streaming(...).\n");
> >       rc = smsusb_start_streaming(dev);
> >       if (rc < 0) {
> >               pr_err("smsusb_start_streaming(...) failed\n");
> > -             goto err_unregister_device;
> > +             goto free_urbs;
> >       }
> >
> >       dev->state = SMSUSB_ACTIVE;
> > @@ -478,13 +488,19 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
> >       rc = smscore_start_device(dev->coredev);
> >       if (rc < 0) {
> >               pr_err("smscore_start_device(...) failed\n");
> > -             goto err_unregister_device;
> > +             goto free_urbs;
> >       }
> >
> >       pr_debug("device 0x%p created\n", dev);
> >
> >       return rc;
> >
> > +free_urbs:
> > +     for (i = 0; i < n_urb; i++) {
> > +             usb_free_urb(dev->surbs[n_urb].urb);
> > +             dev->surbs[n_urb].urb = NULL;
>
> This should use index 'i', right? Not 'n_urb'.
>
> I'll wait for v3 :-)
>
ups :)

Good catch :)


> Regards,
>
>         Hans
>
> > +     }
> > +
> >  err_unregister_device:
> >       smsusb_term_device(intf);
> >  #ifdef CONFIG_MEDIA_CONTROLLER_DVB
> >
> > ---
> > base-commit: 34d7bf1c8e59f5fbf438ee32c96389ebe41ca2e8
> > change-id: 20240410-smatch-8f235d50753d
> >
> > Best regards,
>


-- 
Ricardo Ribalda

