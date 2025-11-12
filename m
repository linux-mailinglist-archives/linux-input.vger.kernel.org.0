Return-Path: <linux-input+bounces-16058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5AEC54D4A
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 00:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 544994E0253
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 23:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C300265298;
	Wed, 12 Nov 2025 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sZnHBhM/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34A0264627
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 23:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991130; cv=none; b=op8coq0lCCBt8brqThLczBe9eQo9QX2vQosE5Tu8/G4zZq6dwBjyT+C2ctpTpTzE9aCnoR0BclGX5mSQGyR03NInIxJ1lssb2kV5XQeUPq6QkdDdCQhNeSgoJ+awxMsxgsWBHmAJSDguzSawTHvxxnrpKat2yHzK8HFo+6bR7l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991130; c=relaxed/simple;
	bh=98gBhiY7eHNgspoeN/g8z2ZGxsyp3RbJi2m1Sysa/N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWoqMZli6NU/KQOj5r5zjjtJyzrjK3wHGV8/HAAxCdt88md0u+XTdLcV7bEgcID+erWSJgx42kE8FcD/Ujuk7DAmphB9Wag7dgsk34pU+mgrBqZmd+C+jZERUuniEOQi75eb4qFP8F3YywyIpkFmcBhvYnNa5GM/l/A2Bqu5l7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sZnHBhM/; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88249766055so2584986d6.1
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 15:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762991127; x=1763595927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM873e7SMffWd45MQMkDcJju/5ouVQmW954EgyfduEY=;
        b=sZnHBhM/LTxWH3DSf3MbNw29yA6v0GDPJ/5rsLbEBxLoW3KY+uOENxy6Ca6+2R9Iy7
         uBYMIU/nUznZoG0GFLnHBfac+9i7x8jQOinhjU1pjzKFdIG0ZghrOINwQztmzRyeCLOo
         FugyUneeJH1C04EPzL4T6kzcFOxa8INZv9vUcIi09hZkaFoysV5lnwy1Hqoh9AD3taa8
         +2NvvHvEmjqx+TCuhIjSQP90g1uxLK9WcEbI8wScX8cETJr3SBClQTz0hGBEL1R9FpNc
         HLGhrbjYfgGheoC3iT0aDwJHc9QiVkMkFCfvHeCDUF7GszR18G9t/8yg+lbeDW7u1mKP
         5l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991127; x=1763595927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BM873e7SMffWd45MQMkDcJju/5ouVQmW954EgyfduEY=;
        b=XzamR7V08TU1Q0R4ag3HxCV0bvfQh3zM9n7l4It4hARSOVUroxaBxhOk3HWuetDDdM
         L7LN9d9e/BhF6ckZU1W1DatOUtremevVvFtGqfctTYnFRiaQSdWBrljP8TXfNXuKtGBv
         +mSE6yUml1dfJ+rSeNAlogEKBl5dvfMz9V1dDxvWUUX1roc3KNOfqYB5sj6/NMouexkX
         zBPCs5qXWrpsA+E76BKbJ2bjH7880jg7bzTwK4sKZnTWHqoWBCXVYHcyvG8iiWRIRM4i
         mSqNvrvDzZaN08U3VLe24M+L2GHGY3ZZavvhj4zkvDj6KrQkqQaCXwiN+9daVzoI4lJf
         mwTA==
X-Forwarded-Encrypted: i=1; AJvYcCUMuBZ2qsP3AA3Ld+Eo8mnKyVV8z2Qchf845EvkMwNZLw0OWtPXp7fA3dC8xC06EklKhQ8UY10zfg+58w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVPWI3dGrvZRGLTG48CtroYMBBd/n8nxCGzqt8MbxpHd3lnxHD
	f5+QPnLp8uaHAxP1ioCo/VPDquFAhFd6ZtWPw8mH2v+MFFsbdC92pazuN1ErAGcJdKktuHW1y6x
	401kexJCV5VaydnihGqtdm014MT025450WvOp7z5x
X-Gm-Gg: ASbGnctSGbE029HleE7oGmqymGtI7+A/U7sL7/4iYwydY/ZV/B1HoLCZaaqvscA5HbN
	GGeDJI6ryPdQgCKE8NgP3UxWmX7JiW2iyVlXvRO5zlXiJTU/5VxJgZOVtSE0HUKVfOqEILLMre3
	Vk9fpc5LJPYu5rsFnPFFc2eSfhb0eNNqHPSDmXNqjbcqxq/TkG5r1aLHVy0r/nDefEFwUZQZLsL
	AwvaQZTfQVuREm786rbdb6FygTSe/J6wh+KeHhiXEi/Tom2Bv4sj2E+CfJRvWNWA5vd8s4KuTyp
	3V/nOvux7IVGu7rZR15+hleo6B9Z
X-Google-Smtp-Source: AGHT+IEQmXMMWgUJYMSsXf8PXmcSJWCgzzvhaS0nAT5hecado0KMJB6Ms9uH+7zj6g5B2jxwuh/zNTPNlYAP8aoBzqU=
X-Received: by 2002:a05:6214:20c6:b0:882:375d:7ed9 with SMTP id
 6a1803df08f44-88271900e7emr73367376d6.10.1762991127050; Wed, 12 Nov 2025
 15:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
 <20251111-lid-switch-notifier-v2-1-789723d78d89@google.com> <s7nk2xerfa7ocscyaaez7qnygkmrdy2ch355uziodda654ws5p@zswljdmx3747>
In-Reply-To: <s7nk2xerfa7ocscyaaez7qnygkmrdy2ch355uziodda654ws5p@zswljdmx3747>
From: Jonathan Denose <jdenose@google.com>
Date: Wed, 12 Nov 2025 17:45:16 -0600
X-Gm-Features: AWmQ_bmpS3vCBfRvf7T-EU2BsZ-k_feNAK_h9t-NbYfMhWpnT3WrADM6NtW4CKs
Message-ID: <CAMCVhVNUrcWD5avaBGotnEgQ-kS9HMPaDpkYczscozSg5H-NfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Input: Add lid switch notifier
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for your review.

On Tue, Nov 11, 2025 at 4:34=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jonathan,
>
> On Tue, Nov 11, 2025 at 09:34:06PM +0000, Jonathan Denose wrote:
> > This change creates a new input handler which can be included in the
> > build via a new Kconfig option CONFIG_INPUT_LID_NOTIFIER. This input
> > handler listens for lid switch events and publishes them through an
> > atomic notification chain. Other modules may register for events
> > through this notification chain with register_lid_notifier.
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> >  drivers/input/Kconfig        | 11 +++++
> >  drivers/input/Makefile       |  1 +
> >  drivers/input/lid-notifier.c | 98 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  include/linux/input.h        |  2 +
> >  4 files changed, 112 insertions(+)
> >
> > diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
> > index 88ecdf5218ee9ba35e1efec6341f8605b621bd49..16f6d24fd04ac8cb5af9d36=
cc47155ea9be0e177 100644
> > --- a/drivers/input/Kconfig
> > +++ b/drivers/input/Kconfig
> > @@ -38,6 +38,17 @@ config INPUT_LEDS
> >         To compile this driver as a module, choose M here: the
> >         module will be called input-leds.
> >
> > +config INPUT_LID_NOTIFIER
> > +     tristate "Include notifier for lid switch events"
> > +     help
> > +       Say Y here if you would like to create a notifier to publish li=
d switch
> > +             events.
> > +
> > +       If unsure, say N.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called lid-notifier.
>
> I think this better not surfaced to users but rather interested drivers
> 'select' it.

That makes sense to me, but how could I get the lid-notifier.c file to
compile in that case? That was my only reason for adding it as a
config option.

> > +
> >  config INPUT_FF_MEMLESS
> >       tristate "Support for memoryless force-feedback devices"
> >       help
> > diff --git a/drivers/input/Makefile b/drivers/input/Makefile
> > index 2cd6e1c9a77844fe09cd3d99533e5d3efb038c7d..1efdba04f79a97e2a122b91=
98341b18a1855b4b9 100644
> > --- a/drivers/input/Makefile
> > +++ b/drivers/input/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_INPUT_MATRIXKMAP)      +=3D matrix-keyma=
p.o
> >  obj-$(CONFIG_INPUT_VIVALDIFMAP)      +=3D vivaldi-fmap.o
> >
> >  obj-$(CONFIG_INPUT_LEDS)     +=3D input-leds.o
> > +obj-$(CONFIG_INPUT_LID_NOTIFIER)     +=3D lid-notifier.o
> >  obj-$(CONFIG_INPUT_MOUSEDEV) +=3D mousedev.o
> >  obj-$(CONFIG_INPUT_JOYDEV)   +=3D joydev.o
> >  obj-$(CONFIG_INPUT_EVDEV)    +=3D evdev.o
> > diff --git a/drivers/input/lid-notifier.c b/drivers/input/lid-notifier.=
c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..954b9855532dbd0514860e3=
09d0b76982e947673
> > --- /dev/null
> > +++ b/drivers/input/lid-notifier.c
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  Lid event notifier
> > + *
> > + *  Copyright (c) 2025 Jonathan Denose <jdenose@google.com>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/input.h>
> > +#include <linux/notifier.h>
> > +
> > +static struct input_handler lid_handler;
> > +static struct atomic_notifier_head input_notifier_head;
> > +
> > +int register_lid_notifier(struct notifier_block *notifier)
> > +{
> > +     return atomic_notifier_chain_register(&input_notifier_head, notif=
ier);
> > +}
> > +EXPORT_SYMBOL(register_lid_notifier);
>
> I wonder if we want to expose the "raw" notifier or if we want to
> provide a higher-level API that would allocate a notifier blocki, set up
> the callback, and return a "cookie" that can be used to free notifier
> block later. This way we do not need to worry that some enterprising
> driver suppresses notifications for the rest by returning NOTIFY_STOP.
>
> > +
> > +static int lid_handler_connect(struct input_handler *handler,
> > +             struct input_dev *input_dev, const struct input_device_id=
 *id)
>
> Proper alignment of the arguments please.
>
> > +{
> > +     struct input_handle *handle;
> > +     int error;
> > +
> > +     handle =3D devm_kzalloc(&input_dev->dev, sizeof(struct input_hand=
le), GFP_KERNEL);
>
> This is not driver probe path so devm_kzalloc must not be used here.
> Also "sizeof(*handle)".

So in that case, would I just use kzalloc?

> > +     if (!handle)
> > +             return -ENOMEM;
> > +
> > +     handle->dev =3D input_dev;
> > +     handle->handler =3D handler;
> > +     handle->name =3D "lid";
> > +
> > +     error =3D input_register_handle(handle);
> > +     if (error)
> > +             goto err_free_handle;
> > +
> > +     error =3D input_open_device(handle);
> > +     if (error)
> > +             goto err_unregister_handle;
> > +
> > +     return 0;
> > +
> > + err_unregister_handle:
> > +     input_unregister_handle(handle);
> > + err_free_handle:
> > +     kfree(handle);
>
> Just FYI: One must never use kfree() with devm_kalloc()ed memory.

Noted!

> > +     return error;
> > +}
> > +
> > +static void lid_handler_disconnect(struct input_handle *handle)
> > +{
> > +     input_close_device(handle);
> > +     input_unregister_handle(handle);
>
>         kfree(handle);
>
> > +}
> > +
> > +static void lid_handler_event(struct input_handle *handle, unsigned in=
t type,
> > +             unsigned int code, int value)
> > +{
> > +     if (type =3D=3D EV_SW && code =3D=3D SW_LID)
> > +             atomic_notifier_call_chain(&input_notifier_head, value, h=
andle->dev);
>
> Why do you need to pass the device from which SW_LID originated?

It isn't needed, I'll pass NULL instead.

> > +}
> > +
> > +static const struct input_device_id lid_handler_ids[] =3D {
> > +     {
> > +             .flags =3D INPUT_DEVICE_ID_MATCH_EVBIT | INPUT_DEVICE_ID_=
MATCH_SWBIT
> > +                                             | INPUT_DEVICE_ID_MATCH_B=
US,
> > +             .evbit =3D { BIT_MASK(EV_SW) },
> > +             .swbit =3D { [BIT_WORD(SW_LID)] =3D BIT_MASK(SW_LID) },
> > +             .bustype =3D 0x19
>
> Why do we need to match in bus type? The LID does not have to always
> come from ACPI.

On the specific chromebook where this touchpad is found, when the lid
switch is opened or closed, `cros_ec_buttons` also sends SW_LID
events, so lid_handler_event was unnecessarily called twice. To
prevent that, I'm filtering on the bus type to get only the events
originating from the lid switch.

> > +     },
> > +     { },
> > +};
> > +
> > +static struct input_handler lid_handler =3D {
> > +     .connect =3D lid_handler_connect,
> > +     .disconnect =3D lid_handler_disconnect,
> > +     .event =3D lid_handler_event,
> > +     .name =3D "lid",
> > +     .id_table =3D lid_handler_ids
> > +};
> > +
> > +static int __init lid_notifier_init(void)
> > +{
> > +     return input_register_handler(&lid_handler);
> > +}
> > +module_init(lid_notifier_init);
> > +
> > +static void __exit lid_notifier_exit(void)
> > +{
> > +     input_unregister_handler(&lid_handler);
> > +}
> > +module_exit(lid_notifier_exit);
> > +
> > +MODULE_AUTHOR("Jonathan Denose <jdenose@google.com>");
> > +MODULE_DESCRIPTION("Lid event notifier");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/input.h b/include/linux/input.h
> > index 7d7cb0593a63e93c4906c49cde430188db2d1ab5..023eb92c77d9e8721d482b9=
787632a671671de08 100644
> > --- a/include/linux/input.h
> > +++ b/include/linux/input.h
> > @@ -592,3 +592,5 @@ int input_ff_create_memless(struct input_dev *dev, =
void *data,
> >               int (*play_effect)(struct input_dev *, void *, struct ff_=
effect *));
> >
> >  #endif
>
> I think this should go into include/linux/lid-notifier.h.
>
> > +
> > +int register_lid_notifier(struct notifier_block *notifier);
>
> Thanks.
>
> --
> Dmitry
--=20
Jonathan

