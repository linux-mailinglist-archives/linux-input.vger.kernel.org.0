Return-Path: <linux-input+bounces-15895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D278C3836E
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 23:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27D0E3B877F
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 22:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABAA2F12A5;
	Wed,  5 Nov 2025 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxRa6ZtC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36B2EFD95
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762382443; cv=none; b=m1MUUjiXak3znHBlmrlUldNb9qiNjzBl6ZBq5ICf3WDB2VZeFJhSJOykyp0GjUWNUZDlUD8N025IPEi+4b+AuxYh/DiMtsqZKSZRdc+Vk/VbjenZU5A+nr3LgwKJNSuhM92xDzJbyYWQw5MDQJoTz9mrYmqXU/8HS/gPIYnMb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762382443; c=relaxed/simple;
	bh=3hkKug39+4TR4kkH+vcZdCG4VPG2upJqx/o/C7wpd00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbVWQHG8I/wQkBdbDjoB3wsOAnpJAAH+j7wFs7Wzl8dsE6XoKJqznAaNCRR+jidf3TbX9n6/EatybvLZuYG40+ONDVeSfbgyS0f7VxJ1i2uUG1ZGC5F9ja8wZnqZRoAS24tELl2pZ+SxXgt7ikjgTxrSB8NmjFIhTTa8V0zkwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxRa6ZtC; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ecef02647eso2977821cf.1
        for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 14:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762382441; x=1762987241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21qXQLNolzTFs72n7I5BKiJh68f8xT8gJueGc1dJJD4=;
        b=VxRa6ZtCzV+zt07vfnfPMV+vIf0aiHjWdM0Bc0Qxjfm9w/+vca4DDEXC4+RU92H83Z
         97JoncfaGwE3Wboe29SFoxDJLJdJhS4HQo7cN+LQBGJJIp2NnqAyYbugFi02Ma3CYnhv
         qXWfcHAib1C9vYm1bxIh8gleG81U5/hIUvXnmCqlzK6VCBYhwqUTHrQzKVTja72q49+W
         Ljj8CSwwgNGzNh2vf9dEQ8ZZTVNMEdGSkmLioe0KklQyEWv0/WX7AKxKjT6HcwwzlIYw
         LiqaruRrX6MXtkfA4oVWgM+VBIlUoPcDFbAlZupMMrL+JbHkPlzsLRsmAb79jbaQhkZY
         szYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762382441; x=1762987241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21qXQLNolzTFs72n7I5BKiJh68f8xT8gJueGc1dJJD4=;
        b=EP+lFuAWoUseWdobOzzs4OkebkrrMo5t5rdRiVx0lYpOYMbJBs2ZjNhDmLMEQL2dlM
         KznAM7F3gAS7qc5C7bW6LlQdDbA5NbmMtb7Z9zfMgr1c+onXA9oh0re/bk+Vz0OrEvjB
         l0qfiYVSMZLLVqfF/hneeD0C2h9vQ0Ltxo4lWwUvBSCiAT9wUNPxKriVKBaEZXznm22l
         PMxOdP4HwTNUCNVE5UG5RWJFhFj9ZwOM6ZKE7HBA7C0IG+L8hZkYOhFTzFe6aSLSulE/
         4MGxHQcFWWQ2UuNc10Qldo51EM4mbrCajHPepdaPlgtinHQ1aA5kQa9z1lPhP7bVWbZS
         6j2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1dCbSpizyvT0FALsZFDx+BCzmbtHeGe4YGYz8Wgu7wtHbjwDKny+nP3dBiXd801MYutE1AwS2xJS2bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2fpsEp+jpefBMOkS7/mb7fqs0ZEqWohB09325IOdwxY3dhJ8R
	GLi1irHnvHHgomQjIaHw0jfhTxLyf4aWIWgD/xbVcUH1x/ScoR51qtnhGaQ0G9IJGQMjhOUycz/
	EXz4cU/MtjbrPFW+FjrffkjubkHHpyu3xbjZ+cFRE
X-Gm-Gg: ASbGncvT/I8t1PLxGKl1pVXJTsnNaxkT+CorWOuFO2lG+XN+5xjEzQVJ10iMf4B+CT8
	Fo8DKE7gW+/fdf3WrtDpmvl6DhSkEe/4MTiqXHU43sN6h8W1ruA2vTJS/WK3RVycH+qKzT0fshS
	sMZT25klPZrchOTKA9qgcyJZwwMFxpvwdXz5baiBarHftWOeiDqJjQdqlVwBBQOHLbAcYxTlFqB
	hMTD/n4XnLr2TLBj4ug5bwp1yqW9m7BCmwUbeQyhbLnmPI73nKCKjGnkuxapUUDegEsfRGvIk4g
	WXDQg3L6nc172iIh1A7Utrst7hzs
X-Google-Smtp-Source: AGHT+IFg+F2Ata6x8dN1l6gIoGdg4pDHv2N8V5ZQ7hPdvjQ3qX8P61Yda6M7LKoKh7JHKEcIv79ez6Ma5pah8Xu0zFc=
X-Received: by 2002:ac8:5ace:0:b0:4e8:aa15:c96d with SMTP id
 d75a77b69052e-4ed7262dd8bmr60160061cf.55.1762382440446; Wed, 05 Nov 2025
 14:40:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
 <20251030-lid-switch-notifier-v1-1-c58dc9b1439d@google.com> <a4zd7uzo3aigyrhturbpgtcsm2slmtqefivky2bfhqiupcc5aj@iorbkwz6ief4>
In-Reply-To: <a4zd7uzo3aigyrhturbpgtcsm2slmtqefivky2bfhqiupcc5aj@iorbkwz6ief4>
From: Jonathan Denose <jdenose@google.com>
Date: Wed, 5 Nov 2025 16:40:29 -0600
X-Gm-Features: AWmQ_blBi6SaJ6LdIS9vwxJQp5_1zspGepznYlOnd7E2qDS8FYULJpsyRNqnRec
Message-ID: <CAMCVhVP+LW27iLXttyFegRj_HMHheYrZtj4uuERLN0uqUjkR6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: Create input notifier chain in input.c
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for your feedback.

On Wed, Nov 5, 2025 at 3:55=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jonathan,
>
> On Thu, Oct 30, 2025 at 02:10:40PM +0000, Jonathan Denose wrote:
> > To expose input events to other kernel modules, add a blocking notifier
> > chain. Publish LID_SWITCH_OPEN/LID_SWITCH_CLOSE events through this
> > notifier chain when input_handle_event detects events signaling the lid
> > switch has opened or closed.
> >
> > Additionally, export a function which allows other kernel modules to
> > register notifier_block structs against this notifier chain.
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> >  drivers/input/input.c | 13 +++++++++++++
> >  include/linux/input.h |  7 +++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index a500e1e276c211d1146dbfea421a3402084007f8..b342b1ff138ccc58d4623ed=
cf1152bd85d7054bf 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/kstrtox.h>
> >  #include <linux/mutex.h>
> >  #include <linux/rcupdate.h>
> > +#include <linux/notifier.h>
> >  #include "input-compat.h"
> >  #include "input-core-private.h"
> >  #include "input-poller.h"
> > @@ -62,6 +63,8 @@ static const unsigned int input_max_code[EV_CNT] =3D =
{
> >       [EV_FF] =3D FF_MAX,
> >  };
> >
> > +static struct blocking_notifier_head input_notifier_head;
> > +
> >  static inline int is_event_supported(unsigned int code,
> >                                    unsigned long *bm, unsigned int max)
> >  {
> > @@ -367,10 +370,20 @@ void input_handle_event(struct input_dev *dev,
> >               if (type !=3D EV_SYN)
> >                       add_input_randomness(type, code, value);
> >
> > +             if (type =3D=3D EV_SW && code =3D=3D SW_LID && !value)
> > +                     blocking_notifier_call_chain(&input_notifier_head=
, value ?
> > +                             LID_SWITCH_CLOSE : LID_SWITCH_OPEN, dev);
>
> I would prefer not having this directly in the input core but rather
> have a lid handler that can then use notifier chain to forward the
> events further.

Ok, that makes sense to me. In that case, do you have a recommendation
for where the lid handler should go?

It looks like drivers/acpi/button.c initializes and handles the lid switch,=
 so
would it make sense for it to go there?

> Also, here you are running in atomic context, so you need atomic
> notifier, not blocking (or you need to involve a workqueue).

I'll use an atomic notifier in the next version.

> Thanks.
>
> --
> Dmitry
--=20
Jonathan

