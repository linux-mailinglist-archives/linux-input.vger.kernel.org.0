Return-Path: <linux-input+bounces-9512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C6A1C0EC
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 05:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81550188A889
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 04:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C7E2066C2;
	Sat, 25 Jan 2025 04:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBXFKx2Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B07080D;
	Sat, 25 Jan 2025 04:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737779377; cv=none; b=Lnerx10+bZFjsgHbgbZv4oEB8BbvIamOnzuYe3eESNXpmrkkcqC14GF8OfD++mS6i5IiiOTo6aA3kNjW/+AgS0KFrKcGmELJHMQMR9UGfflK8rNAsquI1Knsnc4Rg4VAkoDtYxNzOYRPJsZiuRPO0SRf+zb0L+mEIZMkC2/3XSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737779377; c=relaxed/simple;
	bh=Z7yDdXef5Gk682p/yoUtwaUk7dXHOwWSP6gVXNKjKXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhXyYkJw8z9nOpr7StcZ2Xbf1tqLvJimVD2FiUeXpu+JNczLCIkm7ZGUAy6U5e3l/8TLe0S+XnJXyOzEnVQ8u+nQyPYpzRKYS9ojZqnQEmcqZK3o9gObF+9/drpHfZNJwKpAVdIbSspax2g+CTdUIeOphTdzsHQzzkxTkJ5NmJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBXFKx2Q; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso4795876a12.1;
        Fri, 24 Jan 2025 20:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737779374; x=1738384174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj2u73pSrxjkFtSjBb6pMUpqEbPWBLxKfgYGhzMRx9A=;
        b=VBXFKx2QMPuEMZXsqlHqa3imKonP5Rrj6/LPAw01lqyY4FDMUK+aUhtZAg5+JTYTHL
         Y+aTWZm6i2/Ypf6lCOlCjeZB+GBfRAWIfBWVitIfVfrq1zoeSoGQBxBQmewq4Qb7Twu0
         CjVpxEiY/qnnBP61bntARtRgyRX1RioWLwfqv9N9YIRpVVcWsLN8nyaBRGfz1lfdhx7P
         HsC01XurGzfaBLRMqPqnx+WkfcWx6cSv/qa2GTRQF73DqKB+RcmW4JBOKdpxTO0Bvo0Y
         1yRs2dHINcblqixe42T3OzB33AiH9f+Wz0fqQaQbRy/Z2NnjZD1agqYoHs7/7KqQ2iwZ
         +PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737779374; x=1738384174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj2u73pSrxjkFtSjBb6pMUpqEbPWBLxKfgYGhzMRx9A=;
        b=MMkQiE9plTEkRlsOTdjTx1f//KD/5jeVInlgwVF/jTwvY3zMw/H9W34/8WyvwPQrLh
         k2bIhJ8jR7yqsO/BHyTgLqz5hNT6iIrAqrzKdvwbNNdPZzj14LooU747eEzyAqXlw75J
         aOIxVMo5IKIT4F3TLbvmq4i9lnLhN1ZNMaMigBJg8i1+coxDs6KXdM8gKO6t2jSQmu2e
         V1s4N+EvfT+d8Sm08LYCiGGIEOXBxbmCtUuLJ6IHw4Cn3voksSeOTX6IVq491OQ9UkmZ
         bAJDcNJZnrc2Q4YQWIfjkm0PTJPrK/naOOwn5x2ce+FdziER+3BKccK7t8n5ctJ+t7Ik
         Yjyw==
X-Forwarded-Encrypted: i=1; AJvYcCVHHYyNemKeb0Gk756LsNUqPg9sAhuhyGObx2ZGv01j2M1CNWMn+srs9fQtY3dF3Fq3tO1cCXX7+KrZMA==@vger.kernel.org, AJvYcCXNhkqdhX8xs2SFAljAELOWdbjt6hqhfoKQeXyWYSbtRmTrNCl5r1wvYSWm6UFycpl9l8tCHhNy2sJIxA2V@vger.kernel.org
X-Gm-Message-State: AOJu0YzCspintbm0S44RIgxjO04nA/2uC6iZCOQ4JhVqZbVjITyn2yXk
	6AcGn7tE1r5fqnJ0y6k3Vyig4/R1xJBccFdLVqPfiLdMLODX2MyoB/TP3uZFknnDxCl/gh8+ZBa
	COgIeuRXOV4SDiv84ef52kT5yalw=
X-Gm-Gg: ASbGncv/iO2msgh8RPtJjkNKE9JpBx1JRtdOoEnB17241PhQcQlsz730uscCKmRNnxU
	qTeKz9NItRayDKVsssyf4ylxzvD73Oylnur48ZXQ1/BYf+RV51ZaOe2fSXw4OzQ==
X-Google-Smtp-Source: AGHT+IHZphpMRBHH1l88PjdM3iqEdT6MJeGlLVicBHmikFxZRhcx2tOIybtB9XQqaKDubZjs5+tW5tSbw5Nib5afgGA=
X-Received: by 2002:a05:6402:3550:b0:5d0:b925:a8a with SMTP id
 4fb4d7f45d1cf-5db7d300e84mr32307776a12.16.1737779374187; Fri, 24 Jan 2025
 20:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122121409.1374602-1-mastichi@gmail.com> <Z5E63X6qnpIEvWji@google.com>
In-Reply-To: <Z5E63X6qnpIEvWji@google.com>
From: Dmitry Mastykin <mastichi@gmail.com>
Date: Sat, 25 Jan 2025 07:29:22 +0300
X-Gm-Features: AWEUYZlo4Q0Q4l2Bn4YBk6LJ851bkqLhcUlXY-IR2EUwdtT1CV9oThwED3HgI2c
Message-ID: <CALieaee6tk7LhF54QWGVa4HLkLhcpTLAm0vAqXhUBrMNZLHMxA@mail.gmail.com>
Subject: Re: [PATCH] Input: himax_hx83112b - fix event stack size to clear irq correctly
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: job@noorman.info, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, felix@kaechele.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the reply, Dmitry.
My explanation in the commit message was not correct.
I found that the firmware of my HX83102J has stylus support, so it's
enough to read 12 bytes of stylus data in addition to 56 bytes of
fingers to correctly clear the interrupt output. But I'm not sure if
there may also exist firmwares without stylus support for the same
chip.
I see two possibilities:
- introduce stylus presence info in the device-tree, and add
eventually stylus support to the driver;
- read 56+12 (or 128) bytes event stack for every chip. This will
require testing for all supported chips;

Kind regards
Dmitry

On Wed, Jan 22, 2025 at 9:37=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Dmitry,
>
> On Wed, Jan 22, 2025 at 03:14:09PM +0300, Dmitry Mastykin wrote:
> > The datasheet suggests that the size of the event stack is 32 x 32-bit.
> > Reading less bytes did not clear the interrupt output. Extra interrupts
> > were called with zero himax_event_get_num_points() result.
> > Only every second call to himax_handle_input() cleared the interrupt
> > output.
> >
> > Tested on: HX83102J
> >
> > Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
> > ---
> >  drivers/input/touchscreen/himax_hx83112b.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input=
/touchscreen/himax_hx83112b.c
> > index 31f18860dbd3..fe7bdf8cec50 100644
> > --- a/drivers/input/touchscreen/himax_hx83112b.c
> > +++ b/drivers/input/touchscreen/himax_hx83112b.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/regmap.h>
> >
> >  #define HIMAX_MAX_POINTS             10
> > +#define HIMAX_EVENT_STACK_SIZE               128
> >
> >  #define HIMAX_AHB_ADDR_BYTE_0                        0x00
> >  #define HIMAX_AHB_ADDR_RDATA_BYTE_0          0x08
> > @@ -292,9 +293,9 @@ static int hx83100a_read_events(struct himax_ts_dat=
a *ts,
> >  static int himax_handle_input(struct himax_ts_data *ts)
> >  {
> >       int error;
> > -     struct himax_event event;
> > +     u8 event[HIMAX_EVENT_STACK_SIZE];
>
> If you need this it should go into struct himax_event (wither padding or
> making it a union).
>
> Also if this change is needed to make HX83102J operate properly it
> should be rolled into the previous patch adding compatibles to the
> driver.
>
> Thanks.
>
> --
> Dmitry

