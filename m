Return-Path: <linux-input+bounces-10027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2EA355D9
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 05:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 359DC1890B3C
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 04:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01374151983;
	Fri, 14 Feb 2025 04:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jakfJzFD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DF62753E8
	for <linux-input@vger.kernel.org>; Fri, 14 Feb 2025 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739508135; cv=none; b=DLjdrfE6GnWBQu8swYx/L4hljTjAQHBTYR3Oj6fbj7/dYWTSnSWvgIc/JHOq+vaHGWfxFtrpHmhZMWvt9FB5N3e1PxUiVI6abAFKtw0fOjeqsvxu4jk+W6/TdzitgFWhuP6NziS4WSZ3Ta+YWfmcgyXNPK1FW5CxeaemNExwddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739508135; c=relaxed/simple;
	bh=fyt9c6LHbotZU4+L+gr9c8w3a4pUIwZzUH7qiacD0zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lkr33sMBBHo/Xlz3val8UeJdo6Dz0tGDD1y7fT6YVxJDFLjIFc8o1E6iOeRmxNNCliBTAFotxnOW6EZxVgrGp/Pdg/1HQkjuT3xsvh3vx2tcTZ14Q/njaXA+MQsPiGaSo67juLqAUvGDXa4K+aZq+gbxAJHHD9i6EJIRXuTz0dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jakfJzFD; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-308ee953553so17395851fa.0
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2025 20:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739508132; x=1740112932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0ofv+P7OAx9Y5I6Y4gwm8L67A/PzZZwQaS/luW+y68=;
        b=jakfJzFDJTcWvAJEgkYK6EssMpEH+NzcbKGjFb3Ws3R0WSItqZ30nBYHUcxpDWTV/9
         P6wD8I6HDWtH408vATOQqFHlqKOXI/lKFEGaX1RPmn4CAXAzeTFlXY1OyjdbisiyYY1l
         4/1KV2XiIHUrpmoCbzrxh/Be8VOTDyP7X/zYeulxogPWOQwiVxmPQCII96si6vm7Eua+
         eOrlbY1LxmEq59fqXJRIVVqKfiOjaWn9RZszBe+UnpyDTx8sJfFI5lhMw+3x5oJ+4fMf
         +2HUmQogcRjT2sNJCEPaOkTm1f01C8KqrNd1/xFDdK/8nLyPMTCO5AYqeR6/pxFeK9N3
         WxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739508132; x=1740112932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0ofv+P7OAx9Y5I6Y4gwm8L67A/PzZZwQaS/luW+y68=;
        b=w8Q/b5b65F2WbeYp4k3VYbHZJSdqvKleGdMrnRwI6XV7imJ+eySNE7alh+zjXtTITO
         EbALVozaLE2IxluI+AJt57XlOZ8/+PXl0rEVLQezU+mudIGtcJad4p4ec80r+vOZ3ikx
         Z25ofdUPxljZTeuzH8FgVqKuw2Jiz0S/ONsUYpcRFmhzQD0l7w1oRkGZ3EAUHbsUgjtW
         OoraWLnKvopHbotEg5DRWwUkTEL2GV6ixiRbfyXbqA8KujCpATnyGK35NEW8pxym0ZUc
         AEG9lKF6amnpYFil0ikx7mP8Fa3HeOUZ6fZWDzDtPMysyjNrBlk6sU1FfhEKROFOHn1b
         /CPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYrlD1pugfm+YkcG2Z4LrVUvgaz2vLgmyZ7YWrD4S+cGTVu/ZshYXtx+Jr2/qjsT5wDtrjapz689V5HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoP/1krDsvVnhRy+QCNPpwh1cfgW4JlibXxyL5PtNpnsNTNmIN
	vuVFQaVGho09NdWi83MgQfqcBqYRtms7qJzp9lZL23FnVzh7rdnhrFDNnGk5kjMSNU01BVd8G5N
	ustCXiC1YRIr0K5hpwJeDOBF6SjQ=
X-Gm-Gg: ASbGncuyFLx8v4QrAzYwYM4CHJdibs2jXCJnS8RvuKpZjOUj16y9N2DK5No4nT7Q7Fh
	erI+/oiA8iPV/1/LcKLJOdCFtZJ1NwWqw8SMvmkdTFbcrMbBUd7HCUYOPX5YYRMJQPGoCu/GY
X-Google-Smtp-Source: AGHT+IHfeWZCEPgfJ4Q0vcZHTtPzd5GWq/Geeduoqtyg+9GymCscHyYaw7Z9nQqs+6kd51TZqy3ZDgND5wXhmFKeKEM=
X-Received: by 2002:a05:651c:211f:b0:2ff:a89b:4210 with SMTP id
 38308e7fff4ca-3090379d3f6mr29004691fa.8.1739508131863; Thu, 13 Feb 2025
 20:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117064923.3811-1-rymcclel@gmail.com> <998r32nn-563n-s322-q816-o2938237r9p7@xreary.bet>
In-Reply-To: <998r32nn-563n-s322-q816-o2938237r9p7@xreary.bet>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Thu, 13 Feb 2025 23:42:00 -0500
X-Gm-Features: AWEUYZnIQiCthINaJ0JwtMe8dQ7BIZvmF067mVDstZIbM6a584n07Zhg3Q9HAmw
Message-ID: <CAEVj2tmJmK6AgE_m9HhnM4WJOUeXSzYtQTqGU-ka+6cRBA6goA@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: fix gencon button events map
To: Jiri Kosina <jikos@kernel.org>
Cc: Ryan McClelland <rymcclel@gmail.com>, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, linux@emily.st
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Mon, Feb 3, 2025 at 4:57=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Thu, 16 Jan 2025, Ryan McClelland wrote:
>
> > This fixes the button event map to match the 3-button recommendation
> > as well as the redundant 'z' in the button map events for the Sega
> > MD/Gen 6 Button.
> >
> > Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
>
> Daniel, could you please provide your Ack for this patch?
>
> Thanks,
>
> > ---
> >  drivers/hid/hid-nintendo.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index 11ac246176ae..839d5bcd72b1 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
> > @@ -457,13 +457,13 @@ static const struct joycon_ctlr_button_mapping sn=
escon_button_mappings[] =3D {
> >  };
> >
> >  static const struct joycon_ctlr_button_mapping gencon_button_mappings[=
] =3D {
> > -     { BTN_A,        JC_BTN_A,       },
> > -     { BTN_B,        JC_BTN_B,       },
> > -     { BTN_C,        JC_BTN_R,       },
> > -     { BTN_X,        JC_BTN_X,       }, /* MD/GEN 6B Only */
> > -     { BTN_Y,        JC_BTN_Y,       }, /* MD/GEN 6B Only */
> > -     { BTN_Z,        JC_BTN_L,       }, /* MD/GEN 6B Only */
> > -     { BTN_SELECT,   JC_BTN_ZR,      },
> > +     { BTN_WEST,     JC_BTN_A,       }, /* A */
> > +     { BTN_SOUTH,    JC_BTN_B,       }, /* B */
> > +     { BTN_EAST,     JC_BTN_R,       }, /* C */
> > +     { BTN_TL,       JC_BTN_X,       }, /* X MD/GEN 6B Only */
> > +     { BTN_NORTH,    JC_BTN_Y,       }, /* Y MD/GEN 6B Only */
> > +     { BTN_TR,       JC_BTN_L,       }, /* Z MD/GEN 6B Only */
> > +     { BTN_SELECT,   JC_BTN_ZR,      }, /* Mode */
> >       { BTN_START,    JC_BTN_PLUS,    },
> >       { BTN_MODE,     JC_BTN_HOME,    },
> >       { BTN_Z,        JC_BTN_CAP,     },
> > --
> > 2.34.1
> >
>
> --
> Jiri Kosina
> SUSE Labs
>

Thanks for the fix. This looks correct to me.

Reviewed-by: Daniel J. Ogorchock <djogorchock@gmail.com>

-Daniel

