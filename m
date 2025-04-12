Return-Path: <linux-input+bounces-11743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73957A86C51
	for <lists+linux-input@lfdr.de>; Sat, 12 Apr 2025 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F24E1895569
	for <lists+linux-input@lfdr.de>; Sat, 12 Apr 2025 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387BB19F42C;
	Sat, 12 Apr 2025 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMxrB6sH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5363519CC24;
	Sat, 12 Apr 2025 10:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452100; cv=none; b=ZJKtds506L4wqb+Iro3fyX8NgDwOoJuhG6xymeEVyfsCIObmVtEo00fPehzfu6NRmkNhGF+boQB1YI86+DPxqy3YfSWHFHP0QJyUpoP0fHXGbA1hJTkPvzX7UmHJI9T0fJrTpZ2Xib/VQC4Tv7tJfCpZY8lvPqsGS3wofxrOsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452100; c=relaxed/simple;
	bh=9bgPJBpxf98FHjspJDJtN5Xxole2eabdSSxtOYinTFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSI5tBeY4nINMlYOMnu55VaxTKJtPLmNWuPQmOdPuKyqMwApD02LJRpYwlLhn5d8olMVxtDsOLlE/BezUC2vy9AwV1/ETuiEGg8lofhTYfYmgA9JpUSewGqpD/+rC9YgeH+c5ODpYHnD3C7FNjN/suMJAssedlVrLGQp1DQ+Oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMxrB6sH; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so3079652a91.0;
        Sat, 12 Apr 2025 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744452097; x=1745056897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9HB8UPCZWOeMgMh5ANU/JQCqN5zOW0EMp4YY3HmdC4=;
        b=MMxrB6sHWYG7rT8BRSUJABPbH6wNeau7IjQUFJAifY/ip2k3m1fJHBZnj6xQyMV1mq
         bvHHKa7FHRL9uUXODWq66wJS1jFBDkWCIFF/4strnCEAciiQsyphf7ANDYx3+4IfS4vH
         OCD64cRCZ+QuNa2FPMl6YTaILOaCD4djV1gvv89Me7/p1LEHCgnM8raEM0aOTxY+JhpL
         HVSHrV4S74bn/aj0vnM5N+ZRQruXID2h8o8wYjRP1cU1l0kBl7bYeqIwUozElNn8LLD7
         sXMWPQlSuO+HBdFYBAf5ARtU01q9x+p8mpHmmVIeUS9qtnLdIOlkteHLvWoxwlof8mCU
         Zrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452097; x=1745056897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9HB8UPCZWOeMgMh5ANU/JQCqN5zOW0EMp4YY3HmdC4=;
        b=KBq93LRxVfQ1yo0QkdOA589zlJD8PwH46R58NBFIHzI4AdxkDa5vZFDMXPXR8PhJaF
         iihLW3eftzBwhmkIQqEsporl89gtuN4nR6Cxt0j+mLCP3AMfqrWnVUCdKnuHpfxVwOUN
         xQy1lfOUTxPiVAC3NHWoC1uAUG3tGGQqxYPF3edSHPf8uD7DIlGVqWVizMSdwMA/UgX8
         8N6EoAVR8HbgyZNWHh9UxR6lMmGAXnjrcK+9bo1/M3oX+0yQOCqE+nLj/3C7+ZrjrCRs
         x1pIrthEBch1NhU8J9UDwkm8xzPpFraPaerb0LrdSCKSp66uN3H7TMxEeFsPrp0AF7le
         LJtg==
X-Forwarded-Encrypted: i=1; AJvYcCUHfTszBZTZupeKpiC9SVwdTQc2SlNBCXTpi+5p8l4GjUZsr0QnoFoCVzt9VrAkks8SYzocUmbg8bQU1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQETdl9bm+xC9Km/uuFykFj27HNO4qmDdbR8WU0vEUPM2rj+9
	2WaggIx+qogOIdI78fr6J93oADQeZ1F4RGDSOvL4j5pF2sob3vjdWn75v2iXo3umEhAZGXm4JDD
	+6sY6GYdIYTau9IoLNSdStbBLJjs=
X-Gm-Gg: ASbGncs12XYEvWzqkrlwIJmlxwvwvHSCKbGg36bLvOuh6rW9qu78ovz5FTNyuExvDU4
	VvpCX7HZp733IVDh53XqGyBsjuU5iflrq19orYrdQ/fx9FicAn//5GsF9xzMM7+B3chpmlf80mP
	SV9f/Alb1KgOn77sJAlk8JBw==
X-Google-Smtp-Source: AGHT+IEqZQDDDhtyi3v7hBVq2Y/RJXkNzev0jzmHKc+IWXyuC3K/v6WvHm+EwCgHa6o1wf2K/TynVD0VugrrkNY9aag=
X-Received: by 2002:a17:90b:4e8b:b0:305:2d68:8d57 with SMTP id
 98e67ed59e1d1-30823634625mr8390350a91.5.1744452097170; Sat, 12 Apr 2025
 03:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202123351.86957-1-guille.rodriguez@gmail.com>
 <Z70UagY4hxDwUDHv@google.com> <CABDcavYXBrZMMj1gn7CzNbA4f-L4c+q555goU+U0KUEs-6rW+w@mail.gmail.com>
In-Reply-To: <CABDcavYXBrZMMj1gn7CzNbA4f-L4c+q555goU+U0KUEs-6rW+w@mail.gmail.com>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Sat, 12 Apr 2025 12:01:25 +0200
X-Gm-Features: ATxdqUG1I1VeKAqIWUjf9dz3RpN-UCN9Z_sX7GUixbTLouYA5on7DsOeLYuNc5s
Message-ID: <CABDcavb7AF+4hAeUD0ccW8ScHMFFPQ46XKat3xv7qP6y+4mVwA@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: evdev - fix wrong timestamp after SYN_DROPPED
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Any comments on the patch I proposed?

Thank you,

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com

El lun, 3 mar 2025 a las 10:56, Guillermo Rodriguez Garcia
(<guille.rodriguez@gmail.com>) escribi=C3=B3:
>
> Hi Dmitry,
>
> El mar, 25 feb 2025 a las 1:53, Dmitry Torokhov
> (<dmitry.torokhov@gmail.com>) escribi=C3=B3:
> >
> > Hi Guillermo,
> >
> > On Mon, Dec 02, 2024 at 01:33:50PM +0100, Guillermo Rodr=C3=ADguez wrot=
e:
> > > Hi all,
> > >
> > > We are seeing an issue with gpio_keys where the first event after
> > > a SYN_DROPPED has the same timestamp as the SYN_DROPPED event itself.
> > > After some investigation it looks like this is an issue with evdev
> > > and not specific to gpio_keys.
> > >
> > > The issue was originally introduced in commit 3b51c44 ("Input: allow
> > > drivers specify timestamp for input events").
> > >
> > > This commit introduced input_set_timestamp and input_get_timestamp.
> > > The latter (despite the name) actually generates and stores a timesta=
mp
> > > in dev->timestamp if the driver did not set one itself. This timestam=
p
> > > needs to be reset when events are flushed; otherwise the next event
> > > will use a stale timestamp. A partial fix was implemented in 4370b23
> > > ("Input: reset device timestamp on sync"), but this does not cover th=
e
> > > case of SYN_DROPPED.
> > >
> > > If a SYN_DROPPED is generated (currently only done by evdev), the
> > > following happens:
> > >
> > > - evdev calls input_get_timestamp to generate a timestamp for the
> > >   SYN_DROPPED event.
> > > - input_get_timestamp generates a timestamp and stores it in
> > >   dev->timestamp
> > > - When the next real event is reported (in evdev_events), evdev
> > >   calls input_get_timestamp, which uses the timestamp already
> > >   stored in dev->timestamp, which corresponds to the SYN_DROPPED even=
t
> > >
> > > How to fix:
> > >
> > > - When a SYN_DROPPED is generated, after calling input_get_timestamp,
> > >   the timestamp stored in dev->timestamp should be reset (same as is
> > >   currently done in input_handle_event). The attached patch does that=
.
> >
> > So this happens after you change clock type of a client, right?
>
> Yes.
>
> >
> > I do dot think having one client affecting timestamp for everyone is a
> > good idea.
>
> Do you mean the timestamp of the SYN_DROPPED event itself?
> I am not sure if this is an issue. The timestamp of the SYN_DROPPED
> event is not particularly meaningful.
> A client that sees a SYN_DROPPED only knows that some events were
> dropped, but the timestamp of the SYN_DROPPED event itself does not
> carry any useful information -- it is not, for example, the timestamp
> of the event that was dropped (in fact you cannot even know how many
> events were dropped).
>
> > Instead I think __evdev_queue_syn_dropped() should either:
> >
> > - use "now" time for SYN_DROPPED generated when user requests clock
> >   change or reads device's current state, or
> >
> > - check if input device has timestamp set and use it or use "now". This
> >   option is needed if we are concerned about timestamps potentially
> >   going backwards if clock change happens in a middle of delivering
> >   input packet.
>
> If you want to do it like this I would advise to just use "now".
>
> CLOCK_MONOTONIC (and CLOCK_BOOTTIME) cannot go backwards by definition.
>
> The wall clock (CLOCK_REALTIME) can go backwards but this is a
> "feature" and should not be "fixed". if client code wants to see wall
> clock timestamps then it should be prepared to see time going
> backwards, for example when the time is updated, or in the middle of
> DST changes.
>
> >
> > >
> > > (Perhaps the underlying problem is that it is not expected that a
> > > function called input_get_timestamp will have side effects. The
> > > commit history of input.c shows that this has actually caused a
> > > few issues since 3b51c44.)
> >
> > Yes, maybe something like below will work better. It does not address
> > the keeping timestamp for SYN_DROPPED though.
>
> Could be.
> But I can't help wondering whether 3b51c44 was a good idea.
> input_set_timestamp was supposed to "allow drivers to provide a more
> accurate timestamp" but I wonder if there was a real need for that --
> it did not seem to have in-tree users except for uinput and more
> recently wacom_wac.
>
> Anyway the original problem I reported is not related to the timestamp
> of the SYN_DROPPED event itself, but to the fact that this timestamp
> is then reused for the next "real" event after SYN_DROPPED. My patch
> clears the timestamp after the SYN_DROPPED is handled, in the same way
> it was already being done on flush, in input_handle_event (now moved
> to input_dispose_event).
>
> Thanks,
>
> Guillermo
>
> >
> > Thanks.
> >
> > --
> > Dmitry
> >
> >
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index 54d35c1a2a24..954c5104a1c1 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -61,6 +61,66 @@ static const unsigned int input_max_code[EV_CNT] =3D=
 {
> >         [EV_FF] =3D FF_MAX,
> >  };
> >
> > +/**
> > + * input_set_timestamp - set timestamp for input events
> > + * @dev: input device to set timestamp for
> > + * @timestamp: the time at which the event has occurred
> > + *   in CLOCK_MONOTONIC
> > + *
> > + * This function is intended to provide to the input system a more
> > + * accurate time of when an event actually occurred. The driver should
> > + * call this function as soon as a timestamp is acquired ensuring
> > + * clock conversions in input_set_timestamp are done correctly.
> > + *
> > + * The system entering suspend state between timestamp acquisition and
> > + * calling input_set_timestamp can result in inaccurate conversions.
> > + */
> > +void input_set_timestamp(struct input_dev *dev, ktime_t timestamp)
> > +{
> > +       dev->timestamp[INPUT_CLK_MONO] =3D timestamp;
> > +       dev->timestamp[INPUT_CLK_REAL] =3D ktime_mono_to_real(timestamp=
);
> > +       dev->timestamp[INPUT_CLK_BOOT] =3D ktime_mono_to_any(timestamp,
> > +                                                          TK_OFFS_BOOT=
);
> > +}
> > +EXPORT_SYMBOL(input_set_timestamp);
> > +
> > +/**
> > + * input_get_timestamp - get timestamp for input events
> > + * @dev: input device to get timestamp from
> > + *
> > + * A valid timestamp is a timestamp of non-zero value.
> > + */
> > +ktime_t *input_get_timestamp(struct input_dev *dev)
> > +{
> > +       bool have_timestamp;
> > +
> > +       /* TODO: remove setting of the timestamp in a few releases. */
> > +       have_timestamp =3D ktime_compare(dev->timestamp[INPUT_CLK_MONO]=
,
> > +                                      ktime_set(0, 0));
> > +       if (WARN_ON_ONCE(!have_timestamp))
> > +               input_set_timestamp(dev, ktime_get());
> > +
> > +       return dev->timestamp;
> > +}
> > +EXPORT_SYMBOL(input_get_timestamp);
> > +
> > +static bool input_is_timestamp_set(struct input_dev *dev)
> > +{
> > +       return ktime_compare(dev->timestamp[INPUT_CLK_MONO], ktime_set(=
0, 0));
> > +}
> > +
> > +/*
> > + * Reset timestamp for an input device so that next input event will g=
et
> > + * a new one.
> > + *
> > + * Note we only need to reset the monolithic one as we use its presenc=
e when
> > + * deciding whether to generate a synthetic timestamp.
> > + */
> > +static void input_reset_timestamp(struct input_dev *dev)
> > +{
> > +       dev->timestamp[INPUT_CLK_MONO] =3D ktime_set(0, 0);
> > +}
> > +
> >  static inline int is_event_supported(unsigned int code,
> >                                      unsigned long *bm, unsigned int ma=
x)
> >  {
> > @@ -342,11 +402,9 @@ static void input_event_dispose(struct input_dev *=
dev, int disposition,
> >                 dev->num_vals =3D 0;
> >                 /*
> >                  * Reset the timestamp on flush so we won't end up
> > -                * with a stale one. Note we only need to reset the
> > -                * monolithic one as we use its presence when deciding
> > -                * whether to generate a synthetic timestamp.
> > +                * with a stale one in the next event packet.
> >                  */
> > -               dev->timestamp[INPUT_CLK_MONO] =3D ktime_set(0, 0);
> > +               input_reset_timestamp(dev);
> >         } else if (dev->num_vals >=3D dev->max_vals - 2) {
> >                 dev->vals[dev->num_vals++] =3D input_value_sync;
> >                 input_pass_values(dev, dev->vals, dev->num_vals);
> > @@ -366,6 +424,9 @@ void input_handle_event(struct input_dev *dev,
> >                 if (type !=3D EV_SYN)
> >                         add_input_randomness(type, code, value);
> >
> > +               if (!input_is_timestamp_set(dev))
> > +                       input_set_timestamp(dev, ktime_get());
> > +
> >                 input_event_dispose(dev, disposition, type, code, value=
);
> >         }
> >  }
> > @@ -2053,46 +2114,6 @@ void input_free_device(struct input_dev *dev)
> >  }
> >  EXPORT_SYMBOL(input_free_device);
> >
> > -/**
> > - * input_set_timestamp - set timestamp for input events
> > - * @dev: input device to set timestamp for
> > - * @timestamp: the time at which the event has occurred
> > - *   in CLOCK_MONOTONIC
> > - *
> > - * This function is intended to provide to the input system a more
> > - * accurate time of when an event actually occurred. The driver should
> > - * call this function as soon as a timestamp is acquired ensuring
> > - * clock conversions in input_set_timestamp are done correctly.
> > - *
> > - * The system entering suspend state between timestamp acquisition and
> > - * calling input_set_timestamp can result in inaccurate conversions.
> > - */
> > -void input_set_timestamp(struct input_dev *dev, ktime_t timestamp)
> > -{
> > -       dev->timestamp[INPUT_CLK_MONO] =3D timestamp;
> > -       dev->timestamp[INPUT_CLK_REAL] =3D ktime_mono_to_real(timestamp=
);
> > -       dev->timestamp[INPUT_CLK_BOOT] =3D ktime_mono_to_any(timestamp,
> > -                                                          TK_OFFS_BOOT=
);
> > -}
> > -EXPORT_SYMBOL(input_set_timestamp);
> > -
> > -/**
> > - * input_get_timestamp - get timestamp for input events
> > - * @dev: input device to get timestamp from
> > - *
> > - * A valid timestamp is a timestamp of non-zero value.
> > - */
> > -ktime_t *input_get_timestamp(struct input_dev *dev)
> > -{
> > -       const ktime_t invalid_timestamp =3D ktime_set(0, 0);
> > -
> > -       if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_time=
stamp))
> > -               input_set_timestamp(dev, ktime_get());
> > -
> > -       return dev->timestamp;
> > -}
> > -EXPORT_SYMBOL(input_get_timestamp);
> > -
> >  /**
> >   * input_set_capability - mark device as capable of a certain event
> >   * @dev: device that is capable of emitting or accepting event
>
>
>
> --
> Guillermo Rodriguez Garcia
> guille.rodriguez@gmail.com



--=20
Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com

