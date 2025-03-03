Return-Path: <linux-input+bounces-10491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F1A4BB63
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 10:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E62B165432
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 09:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212011F1517;
	Mon,  3 Mar 2025 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT3uUVTP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BE1F12F6;
	Mon,  3 Mar 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740995809; cv=none; b=IQwmMIACLkQkNvB10yHX9OY4U3HNnu9QgLKHYnKHmU2fQD9lwx54rATy0smWP+laXCKnHLZoXr/JvNQHJVX/0SmQeXgx19cDQySUKcSocEne6ybjbFJQXaFUg0sLxbuhUV2bQM44GRpvyxk7aOitnFviDXSp6J/6I7Nn9UE2EDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740995809; c=relaxed/simple;
	bh=vaauKdgQ/xBP5Sjd+ekagRTM0cnkT9564ZcWHomNZAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bF0RDFxIpHdpLEkSU7Bzor/55RE1AUKFvJNuf0G1nGgOEbED1vyhKiF7cf1bpkpT/wRT3TYk6c02JJvkChRKTnmIvKw0GFeIJpkCOIeTKhusg3UZyo6QZiR7Lu4hvRWpufzYMliJ6xdjp6xnEfuPdovb++p143OrrTzteSmMbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT3uUVTP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso732976a91.1;
        Mon, 03 Mar 2025 01:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740995806; x=1741600606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWd07D6pFSSlTwQImXpRLf8JSaFpJSpotQCtmwnI1O8=;
        b=FT3uUVTPPepSgkWj1aVTWXQCyWdmtS0QymYOm02KfxLvowRoLGoKYzHzFT95Atj1Mc
         nTNXA+Hl9ezJLnubbcbe0wtpDKfhCkBTSmeoduBOhoflds+cfyuOdLhYuOiaJQKdSTyH
         Dv25I0pIhmwJrhOg4OKL1HTGCMWH8abLLp+E15Q6zeMCJqyl9qQ5ZMfBsqho02xPlV0B
         RD8VLHS8if+3JmsXqx+JwpySfVUIkqeCqvON4y0+XMmJ3dYU5c9g8tpHqvinI3mcjwNk
         OfQXAiGBWhgdkQ/DtquQQNRn1PAvIEIAfQmKJpEmOEXZXFE16P6NN52T8/88TYZP1avV
         Q/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740995806; x=1741600606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWd07D6pFSSlTwQImXpRLf8JSaFpJSpotQCtmwnI1O8=;
        b=lmhG8wH6MNT79c9rAw0BfWy94PJMQ9Oj100htRlxfXcFJhTaJvFO168F1WpaCITltJ
         XiGPY4llfz0MtF2f4xbRJ1YKfw06mLYdzu+RhetmugycwqxE1qc5g9zsI6g/irGu7yxV
         RI8XmP1f/3sMrxyl5k1U3Mc29CorLiEO2h77JW5DpVZaFe+QDpyxZtogxREXYTQmGmTW
         sjO+WE67PO8YRfXmnaHewPC0at2TvgOa6YvGVKBBz2DLpg4Nv+X8Br0xYQ3vujpzbReD
         bcAUMdbtCSs2R5I8twYydNyNzsMd4OSP/89vmjAIMxnEkpQsMQH9wu8s+v7lGXf9rDVf
         LRYA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ndhOQJYhw+FvjmGVXOTnrvDf8l8ER2sR86hTSMd0F9ZHNrHsS/vKcdM3mJgTj3Np00e/huIIDcjJyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHLXNLaXgqHqgGGR8XCZ/QqsMwq87xCkCLGGDevUkn4Kr0pMR
	eU13q8t3dj4cz7t97GUGZcoj+1BLivtHk/+I5fp+GhYo+580p7qcAgDzqSd3DSjvSaf6d1OgLuB
	hL91ct4ktMYn1UypVRiVA7WTXLIvMNGOnfNg=
X-Gm-Gg: ASbGncvYDkSD7tsxTnp2Z5Y+UoptfZtfbMLgO5dn1idNELPO1IaunDL2sgqBc7QTEaH
	oTwbIwvdCFAbJlH+8kX6ER3wyH4y36rp7SmF9foUcFMests3nsgAnyYJ4tCxIKIZi346m7uKk+h
	mNgcQylpuo7lX3T1vwMhQLuEfY1g==
X-Google-Smtp-Source: AGHT+IEIGVq/NZk6ndWbqLLtN3JumLWvzn/7rxT8lru/+JgeRqnyR+BSdC3a6d2o5WeoVkSyhRK2tsEkoia7e3kQwno=
X-Received: by 2002:a17:90b:4b0d:b0:2e2:c2b0:d03e with SMTP id
 98e67ed59e1d1-2feba5edb2emr18685076a91.5.1740995806361; Mon, 03 Mar 2025
 01:56:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202123351.86957-1-guille.rodriguez@gmail.com> <Z70UagY4hxDwUDHv@google.com>
In-Reply-To: <Z70UagY4hxDwUDHv@google.com>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Mon, 3 Mar 2025 10:56:35 +0100
X-Gm-Features: AQ5f1JpRULr_d7hOptF-J_vi5pYdZoBChQKqNTeGXMyf-KRJy_AwNg324XxObME
Message-ID: <CABDcavYXBrZMMj1gn7CzNbA4f-L4c+q555goU+U0KUEs-6rW+w@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: evdev - fix wrong timestamp after SYN_DROPPED
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

El mar, 25 feb 2025 a las 1:53, Dmitry Torokhov
(<dmitry.torokhov@gmail.com>) escribi=C3=B3:
>
> Hi Guillermo,
>
> On Mon, Dec 02, 2024 at 01:33:50PM +0100, Guillermo Rodr=C3=ADguez wrote:
> > Hi all,
> >
> > We are seeing an issue with gpio_keys where the first event after
> > a SYN_DROPPED has the same timestamp as the SYN_DROPPED event itself.
> > After some investigation it looks like this is an issue with evdev
> > and not specific to gpio_keys.
> >
> > The issue was originally introduced in commit 3b51c44 ("Input: allow
> > drivers specify timestamp for input events").
> >
> > This commit introduced input_set_timestamp and input_get_timestamp.
> > The latter (despite the name) actually generates and stores a timestamp
> > in dev->timestamp if the driver did not set one itself. This timestamp
> > needs to be reset when events are flushed; otherwise the next event
> > will use a stale timestamp. A partial fix was implemented in 4370b23
> > ("Input: reset device timestamp on sync"), but this does not cover the
> > case of SYN_DROPPED.
> >
> > If a SYN_DROPPED is generated (currently only done by evdev), the
> > following happens:
> >
> > - evdev calls input_get_timestamp to generate a timestamp for the
> >   SYN_DROPPED event.
> > - input_get_timestamp generates a timestamp and stores it in
> >   dev->timestamp
> > - When the next real event is reported (in evdev_events), evdev
> >   calls input_get_timestamp, which uses the timestamp already
> >   stored in dev->timestamp, which corresponds to the SYN_DROPPED event
> >
> > How to fix:
> >
> > - When a SYN_DROPPED is generated, after calling input_get_timestamp,
> >   the timestamp stored in dev->timestamp should be reset (same as is
> >   currently done in input_handle_event). The attached patch does that.
>
> So this happens after you change clock type of a client, right?

Yes.

>
> I do dot think having one client affecting timestamp for everyone is a
> good idea.

Do you mean the timestamp of the SYN_DROPPED event itself?
I am not sure if this is an issue. The timestamp of the SYN_DROPPED
event is not particularly meaningful.
A client that sees a SYN_DROPPED only knows that some events were
dropped, but the timestamp of the SYN_DROPPED event itself does not
carry any useful information -- it is not, for example, the timestamp
of the event that was dropped (in fact you cannot even know how many
events were dropped).

> Instead I think __evdev_queue_syn_dropped() should either:
>
> - use "now" time for SYN_DROPPED generated when user requests clock
>   change or reads device's current state, or
>
> - check if input device has timestamp set and use it or use "now". This
>   option is needed if we are concerned about timestamps potentially
>   going backwards if clock change happens in a middle of delivering
>   input packet.

If you want to do it like this I would advise to just use "now".

CLOCK_MONOTONIC (and CLOCK_BOOTTIME) cannot go backwards by definition.

The wall clock (CLOCK_REALTIME) can go backwards but this is a
"feature" and should not be "fixed". if client code wants to see wall
clock timestamps then it should be prepared to see time going
backwards, for example when the time is updated, or in the middle of
DST changes.

>
> >
> > (Perhaps the underlying problem is that it is not expected that a
> > function called input_get_timestamp will have side effects. The
> > commit history of input.c shows that this has actually caused a
> > few issues since 3b51c44.)
>
> Yes, maybe something like below will work better. It does not address
> the keeping timestamp for SYN_DROPPED though.

Could be.
But I can't help wondering whether 3b51c44 was a good idea.
input_set_timestamp was supposed to "allow drivers to provide a more
accurate timestamp" but I wonder if there was a real need for that --
it did not seem to have in-tree users except for uinput and more
recently wacom_wac.

Anyway the original problem I reported is not related to the timestamp
of the SYN_DROPPED event itself, but to the fact that this timestamp
is then reused for the next "real" event after SYN_DROPPED. My patch
clears the timestamp after the SYN_DROPPED is handled, in the same way
it was already being done on flush, in input_handle_event (now moved
to input_dispose_event).

Thanks,

Guillermo

>
> Thanks.
>
> --
> Dmitry
>
>
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 54d35c1a2a24..954c5104a1c1 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -61,6 +61,66 @@ static const unsigned int input_max_code[EV_CNT] =3D {
>         [EV_FF] =3D FF_MAX,
>  };
>
> +/**
> + * input_set_timestamp - set timestamp for input events
> + * @dev: input device to set timestamp for
> + * @timestamp: the time at which the event has occurred
> + *   in CLOCK_MONOTONIC
> + *
> + * This function is intended to provide to the input system a more
> + * accurate time of when an event actually occurred. The driver should
> + * call this function as soon as a timestamp is acquired ensuring
> + * clock conversions in input_set_timestamp are done correctly.
> + *
> + * The system entering suspend state between timestamp acquisition and
> + * calling input_set_timestamp can result in inaccurate conversions.
> + */
> +void input_set_timestamp(struct input_dev *dev, ktime_t timestamp)
> +{
> +       dev->timestamp[INPUT_CLK_MONO] =3D timestamp;
> +       dev->timestamp[INPUT_CLK_REAL] =3D ktime_mono_to_real(timestamp);
> +       dev->timestamp[INPUT_CLK_BOOT] =3D ktime_mono_to_any(timestamp,
> +                                                          TK_OFFS_BOOT);
> +}
> +EXPORT_SYMBOL(input_set_timestamp);
> +
> +/**
> + * input_get_timestamp - get timestamp for input events
> + * @dev: input device to get timestamp from
> + *
> + * A valid timestamp is a timestamp of non-zero value.
> + */
> +ktime_t *input_get_timestamp(struct input_dev *dev)
> +{
> +       bool have_timestamp;
> +
> +       /* TODO: remove setting of the timestamp in a few releases. */
> +       have_timestamp =3D ktime_compare(dev->timestamp[INPUT_CLK_MONO],
> +                                      ktime_set(0, 0));
> +       if (WARN_ON_ONCE(!have_timestamp))
> +               input_set_timestamp(dev, ktime_get());
> +
> +       return dev->timestamp;
> +}
> +EXPORT_SYMBOL(input_get_timestamp);
> +
> +static bool input_is_timestamp_set(struct input_dev *dev)
> +{
> +       return ktime_compare(dev->timestamp[INPUT_CLK_MONO], ktime_set(0,=
 0));
> +}
> +
> +/*
> + * Reset timestamp for an input device so that next input event will get
> + * a new one.
> + *
> + * Note we only need to reset the monolithic one as we use its presence =
when
> + * deciding whether to generate a synthetic timestamp.
> + */
> +static void input_reset_timestamp(struct input_dev *dev)
> +{
> +       dev->timestamp[INPUT_CLK_MONO] =3D ktime_set(0, 0);
> +}
> +
>  static inline int is_event_supported(unsigned int code,
>                                      unsigned long *bm, unsigned int max)
>  {
> @@ -342,11 +402,9 @@ static void input_event_dispose(struct input_dev *de=
v, int disposition,
>                 dev->num_vals =3D 0;
>                 /*
>                  * Reset the timestamp on flush so we won't end up
> -                * with a stale one. Note we only need to reset the
> -                * monolithic one as we use its presence when deciding
> -                * whether to generate a synthetic timestamp.
> +                * with a stale one in the next event packet.
>                  */
> -               dev->timestamp[INPUT_CLK_MONO] =3D ktime_set(0, 0);
> +               input_reset_timestamp(dev);
>         } else if (dev->num_vals >=3D dev->max_vals - 2) {
>                 dev->vals[dev->num_vals++] =3D input_value_sync;
>                 input_pass_values(dev, dev->vals, dev->num_vals);
> @@ -366,6 +424,9 @@ void input_handle_event(struct input_dev *dev,
>                 if (type !=3D EV_SYN)
>                         add_input_randomness(type, code, value);
>
> +               if (!input_is_timestamp_set(dev))
> +                       input_set_timestamp(dev, ktime_get());
> +
>                 input_event_dispose(dev, disposition, type, code, value);
>         }
>  }
> @@ -2053,46 +2114,6 @@ void input_free_device(struct input_dev *dev)
>  }
>  EXPORT_SYMBOL(input_free_device);
>
> -/**
> - * input_set_timestamp - set timestamp for input events
> - * @dev: input device to set timestamp for
> - * @timestamp: the time at which the event has occurred
> - *   in CLOCK_MONOTONIC
> - *
> - * This function is intended to provide to the input system a more
> - * accurate time of when an event actually occurred. The driver should
> - * call this function as soon as a timestamp is acquired ensuring
> - * clock conversions in input_set_timestamp are done correctly.
> - *
> - * The system entering suspend state between timestamp acquisition and
> - * calling input_set_timestamp can result in inaccurate conversions.
> - */
> -void input_set_timestamp(struct input_dev *dev, ktime_t timestamp)
> -{
> -       dev->timestamp[INPUT_CLK_MONO] =3D timestamp;
> -       dev->timestamp[INPUT_CLK_REAL] =3D ktime_mono_to_real(timestamp);
> -       dev->timestamp[INPUT_CLK_BOOT] =3D ktime_mono_to_any(timestamp,
> -                                                          TK_OFFS_BOOT);
> -}
> -EXPORT_SYMBOL(input_set_timestamp);
> -
> -/**
> - * input_get_timestamp - get timestamp for input events
> - * @dev: input device to get timestamp from
> - *
> - * A valid timestamp is a timestamp of non-zero value.
> - */
> -ktime_t *input_get_timestamp(struct input_dev *dev)
> -{
> -       const ktime_t invalid_timestamp =3D ktime_set(0, 0);
> -
> -       if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timest=
amp))
> -               input_set_timestamp(dev, ktime_get());
> -
> -       return dev->timestamp;
> -}
> -EXPORT_SYMBOL(input_get_timestamp);
> -
>  /**
>   * input_set_capability - mark device as capable of a certain event
>   * @dev: device that is capable of emitting or accepting event



--=20
Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com

