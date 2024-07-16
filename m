Return-Path: <linux-input+bounces-5057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF463932D06
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 18:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A10281C34
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 16:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF9C1DDCE;
	Tue, 16 Jul 2024 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA969aWZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892E17623C
	for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721145615; cv=none; b=AlirgG8HnS0Bg4gAKsRTqc518VrTvYQNCayNz3Y34j5V5NT4oT3uKSB7Xr/nwQ6kRwXdR5D1KrMCTA3+hKlQgQaDUDekTaHbDidUBvF7KB7UytMFecTgmlh5qgibOJeW4xXdKgsa2AzgFVsAvjE9MKLwSONGtAj6aLPzIPDifog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721145615; c=relaxed/simple;
	bh=D6c0wDMv8MdWGicuR8pnUGanmvgPb2wXsYI3HYN/U70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGYZhiJwc0XOn8VdM8PIo81IaDXaLoguM+qk64m2a4Ulrx0WmVJk9Fgt+C1h2Gk1O+MWOqQpHMQaX4MQffwDH8XZJBcjwYis3JdnFAPiJoaUOqEVAdMApyqjbL//d4ZBAVayrOwuwwuhRmuooi7dgTleSXGRg4YzkeqIzrK01TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA969aWZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-58afbc33c6bso989085a12.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721145612; x=1721750412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb7jzugz0kKxCDNuyFluHhFv274IXxdNBR5WAG6idas=;
        b=kA969aWZ8x95nGgpIGFndgQR7dDmdjJSpDJlsNgA/RXlluYfjbrgHGbTYgKmQgopCX
         u7bEcRcXsFJQ+R4mz7PZ3x/jeTly0S3H/BZpxKaXl37tILWfaTiQXuljYcjbJBtPYYEj
         HPcP/Ps8V8wxl2nbvFBRDKas4Rl41wBuubaLmPPvY3S962yaX3E3PCFpXI3Ig7XZFXAG
         Q+i68JlxYOgKuQg/FuxbH8G3pNu3XZ8Y7odgzb3ryks2G3GCMlnS6ES+Vgdzs7ECapGD
         TXTvwrgCu8aHpI1nmaA/zdIMHx0tusuzcTRVG9QRa3xAYisYcpUWQ/zj6Y41EjmB/UxP
         aPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721145612; x=1721750412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb7jzugz0kKxCDNuyFluHhFv274IXxdNBR5WAG6idas=;
        b=Tj1fBPYLNDTf+Vqe2xHJ9PrpHDkSxZDvEo28HrCRoW0JBSRLk9wQ9MH0PBLg0fjnHV
         SkQjCddtqKufR6IQe+k4xtuE9pZmIMWy2xfCPkEQUrUn6mlXtigyyNwJajIjvBib5y3f
         K0kpHqTQHVo2Eii8qugmrL3CAKAIoewozEGJnsYZWReqgfRIFHvLD5qXDgJ28pOgPknM
         ZQypmhCj7SfUgJNW/luvX+ZsV3KEASa7eVFoU41+9H7zcBlE+m0/uFhetR57HnvLjlDm
         e22gWcC2DkBtE3yj0BarARWyxtHXbky54MycognX5wb5VRwxMirInmUHbWXOgzZB4kio
         sq3A==
X-Forwarded-Encrypted: i=1; AJvYcCVd+NV8Oy+mdD6ZildbJUQXTxWbp9yPgiCRHvZbIyhpEt/CxrmzFLo5RaBsrdfhPz28WhotqbcCykYpK5PVozhv468rGzlhrpqPBvY=
X-Gm-Message-State: AOJu0Yyj0uAMxwf8pJ07WuIgvVzBtrS7doZDB62YG9n6Ixqd9x4BNIpD
	jZBkoFIXxZS5zkvynglhUzvz5GExUBLyNnGLJXdEuyOxiuqK0pd3YYNwMNvU3PtMjQ5lNn+cDek
	rGCAflAFLczrVuEAI+bZObx2oEi4=
X-Google-Smtp-Source: AGHT+IEZMH6EhWY+UFpbbj3afch/a3+OJurN/3H34YT9XG7ZHFzrBqBx01qNFaDdt2qQeHWv+uy0A85KrBZoitPKr9M=
X-Received: by 2002:a05:6402:40c9:b0:599:c3b1:c18f with SMTP id
 4fb4d7f45d1cf-59e94005ccemr1846047a12.0.1721145612239; Tue, 16 Jul 2024
 09:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
 <CAF8JNhLxPG8H7uvySTqWLkp3fsB+HandJ_JHMtpr_H5XMDy7pw@mail.gmail.com> <gc5p2dsulalrkxcwot2i5h7qxctmjn3iihmduy76xuhbevoz32@ykktnkmz6dqk>
In-Reply-To: <gc5p2dsulalrkxcwot2i5h7qxctmjn3iihmduy76xuhbevoz32@ykktnkmz6dqk>
From: Ping Cheng <pinglinux@gmail.com>
Date: Tue, 16 Jul 2024 08:59:59 -0700
Message-ID: <CAF8JNhLgEBVUdrn4HdQQ83VcoF09K4p+KehLcuGbnv=F0T+pRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID:wacom: Modify pen IDs
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	linux-input@vger.kernel.org, Jason Gerecke <killertofu@gmail.com>, 
	Erin Armstrong Skomra <skomra@gmail.com>, Joshua Dickens <Joshua@joshua-dickens.com>, 
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, stable@kernel.org, 
	Gavin Hsia <gavin.h.hsia@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

The patchset has been reviewed by the team. Here comes:

Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Thank you for taking care of the patches,
Ping

On Tue, Jul 16, 2024 at 4:39=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> Hi Ping,
>
> On Jul 15 2024, Ping Cheng wrote:
> > Hi Jiri, hi Benjamin,
> >
> > Can one of you give the patchset a review and merge them? The first
> > one is a bug fix. The second one is just a cleanup. Both changes are
> > device specific.
>
> Let me return the question :) Can any of you Wacom guys give us a
> reviewed-by? :)
>
> The patches looks fine, but having someone with the impacted devices
> being able to test/review has a greater value than the maintainers just
> randomly pulling patches :)
>
> Cheers,
> Benjamin
>
> >
> > Thank you,
> > Ping
> >
> > On Mon, Jul 8, 2024 at 10:57=E2=80=AFPM Tatsunosuke Tobita
> > <tatsunosuke.wacom@gmail.com> wrote:
> > >
> > > From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> > >
> > > The pen ID, 0x80842, was not the correct ID for wacom driver to
> > > treat. The ID was corrected to 0x8842.
> > > Also, 0x4200 was not the expected ID used on any Wacom device.
> > > Therefore, 0x4200 was removed.
> > >
> > > Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> > > Signed-off-by: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
> > > Fixes: bfdc750c4cb2 ("HID: wacom: add three styli to wacom_intuos_get=
_tool_type")
> > > Cc: stable@kernel.org #6.2
> > > ---
> > >  drivers/hid/wacom_wac.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > > index a44367aef621..20de97ce0f5e 100644
> > > --- a/drivers/hid/wacom_wac.c
> > > +++ b/drivers/hid/wacom_wac.c
> > > @@ -714,13 +714,12 @@ static int wacom_intuos_get_tool_type(int tool_=
id)
> > >         case 0x8e2: /* IntuosHT2 pen */
> > >         case 0x022:
> > >         case 0x200: /* Pro Pen 3 */
> > > -       case 0x04200: /* Pro Pen 3 */
> > >         case 0x10842: /* MobileStudio Pro Pro Pen slim */
> > >         case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
> > >         case 0x16802: /* Cintiq 13HD Pro Pen */
> > >         case 0x18802: /* DTH2242 Pen */
> > >         case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
> > > -       case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
> > > +       case 0x8842: /* Intuos Pro and Cintiq Pro 3D Pen */
> > >                 tool_type =3D BTN_TOOL_PEN;
> > >                 break;
> > >
> > > --
> > > 2.34.1
> > >

