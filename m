Return-Path: <linux-input+bounces-5729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B927D95A0D3
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 17:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 495C7B21091
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 15:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D11B42048;
	Wed, 21 Aug 2024 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/NaZUfZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A982AD31;
	Wed, 21 Aug 2024 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724252639; cv=none; b=pE6uCgxlQDvaCCPT6/NcxgE9XaO/JsXmOkSluSb1BGIRgawZ9ikaCetkr+dNRV7H/62MF4tacTov+lg7R/kkSOuNYAlSPJrNAXyOmwav+Iktm5dOXxHKIj324g5TkTtGH0o59LfgcO1M1ohtwmcsfM6+96jsYCh6TKNRFYQ2VkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724252639; c=relaxed/simple;
	bh=wXt/+pyf+9EbnVz1TQ7F37Ry1IOd9dwK4yuPnSgVrIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ccp78vFx/CVG1SX7EW7bdM4px6/a0kXwMzTbHEOdiRofzZMT8WeOenhNJt5oqUz2EPqL7SnX++MWRLnokN4skZ6yJrIfPilK5DqsIQYvQA7ktCYKldjKmtgAnCwWktRSbEf/s0zJiWF/aIe5XqUn51j/g+CDV0TGzDYmwDfcbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/NaZUfZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so509758166b.1;
        Wed, 21 Aug 2024 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724252636; x=1724857436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXt/+pyf+9EbnVz1TQ7F37Ry1IOd9dwK4yuPnSgVrIM=;
        b=W/NaZUfZDFZrLncVFjcA8ha7ar8QXhXoCACrABlZH29fF2vhfQvY8laOeuvFzDh86z
         jY0noWGtNpafwWcZK+1nHUBhHr+I2DfZJN5JtEz/ZEr5sxJWklx+iBY4lAN6QqjR7PK3
         peWI42Vt/pP4reGSKV8y7wYysV+zkR8R14ewFFNS+8PYClalvMxW+AUFV/GE+0WVc3iM
         1zkOvuzSdjd9XUCgDH6BSwZ9/Z2KURZA3u7I+MZRF/02/Xsda1bLYD7EI8y3NdZSLJuf
         0wK5IsQkG8XrI6tP9+nqh8Y63/3ZEbeGciXixGD9eHQ0RRxDFtZYm+coSf/LCaQtJRfO
         iueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724252636; x=1724857436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXt/+pyf+9EbnVz1TQ7F37Ry1IOd9dwK4yuPnSgVrIM=;
        b=ZNQqMA9uXKzqMdqAF/rzycb2rmBm77UamF8yGN7l/0MPkxEwYA9Z+z8Db4wp4vY/tf
         bYZi2D18znKLJe6rYdaL0D6AG3YuU3pEW8PiyBQL2ZOWvNxKCDfBga4hdjmtv3TGiWgS
         k6rj223HyAmOAvFl2+zKMDFF5OsCyKGvg7jcrr7XPCXVqTHXswSsYzXu9aTF92Ie1gSD
         Ph8rYY4WFg3og9GcQl8DHQw+oDcoxSQpkuo3qoG+EXDeOTjYULdLvDYoN5C3z+g3A6LD
         xCcqfrrcmlifKzFyG6SGIMRZ1oZiirdTRaphTEvOQr1fra7i3yauwYgCKo/kCvekcbbY
         zKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFK/oALLOEYipQ/aLmt+eaf/Clg3kMVi2UMLGGIk7l6f7W98HLBlvjXx9b8p22b3ZWqbaAnzftJN7Jub8Q@vger.kernel.org, AJvYcCXV6khK9HXe35+f+QV+uGn3hyErKuf/Xo0/qT8MVOL4s08Iq5+TlMyqjbMJHTt/Nl5fyLPQYzZ+RYWYrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybYcWSEdPWB9HpUflwYQpvmBV1VeMDNUdlOg6uMg0Q+gMaKu2D
	bIU7mdxgI7BFwnng1zzKHWH65h1KRwCB+Ga3Ur1E9erxaE/lx5T4z4FfvHkDPnsV7KHZ5fpd47C
	dlDCxuZLsnImIAP/wkqL4Gr8UBbw=
X-Google-Smtp-Source: AGHT+IFZfBhDjZE4dwrNH6rERAg/wMxwT5NPSBAw47mgi+85MPp8n5AbiAQYqt1y5ugT+wsDj54MH2JqihjCbwAO6CU=
X-Received: by 2002:a17:907:d2e3:b0:a77:eb34:3b4b with SMTP id
 a640c23a62f3a-a866f0fd894mr228087866b.11.1724252635510; Wed, 21 Aug 2024
 08:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820142529.9380-1-max@enpas.org> <nycvar.YFH.7.76.2408211632590.12664@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2408211632590.12664@cbobk.fhfr.pm>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Wed, 21 Aug 2024 08:03:42 -0700
Message-ID: <CAEc3jaD6sv=O+MbH5XtHvpXgXyzBROfLDYX2rGoa+3QCOJ-Srw@mail.gmail.com>
Subject: Re: [PATCH v4] hid-playstation: DS4: Update rumble and lightbar together
To: Jiri Kosina <jikos@kernel.org>
Cc: Max Staudt <max@enpas.org>, Roderick Colenbrander <roderick.colenbrander@sony.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 7:33=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Tue, 20 Aug 2024, Max Staudt wrote:
>
> > Some 3rd party gamepads expect updates to rumble and lightbar together,
> > and setting one may cancel the other.
> >
> > Let's maximise compatibility for these controllers by sending rumble
> > and lightbar updates together, even when only one has been scheduled.
> >
> > The quirky controllers are matched by a known CRC32 over their HID
> > report descriptor (hdev->rdesc), since they seem to share the same
> > descriptor, while pretending to be a Sony DS4 v2.0.
> >
> > Signed-off-by: Max Staudt <max@enpas.org>
>
> Roderick, does you Ack from v2 still hold?

Ideally I would like some type of quirk, but I have no good way of
verifying (also across different 'clone' devices) how reliable this
current check would be. It feels a bit too much towards a magical
value. I don't see why the reports would differ besides some engineer
having made a typo.

My gut feeling is that the previous fix is less fragile, so let's opt
for that one.

Roderick

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
>

