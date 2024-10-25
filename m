Return-Path: <linux-input+bounces-7701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B29B0901
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 17:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 950CC1C20F82
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 15:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C7E17622F;
	Fri, 25 Oct 2024 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NleGa/rK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8C1741C6;
	Fri, 25 Oct 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871948; cv=none; b=gxoxYU1x1Nuvp5jb9NAU4Y9eN4gA66Hl/NcCEwATCzzgxF47rDioQUE6OpqoVbrc8ckcI3wJt0vVTIGBrWZsNnZxF/y7O2mnK5+4KhXRLb0lE9LIXq3qsYXb8SdXJCWxcANJfUEXuaIrgO01MUf8/M/AyzaG4FRbtkw6WUsJpm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871948; c=relaxed/simple;
	bh=0ljjiMfY8z+Bl5+mDZWNjMpu9/ix8vBxLQdaWGAkiNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zu66ATVzlhHpajAmVAStqi1Jy+pbQ51O9onHvdT2eUu01ZW9ojFQ+ew3Ee+fDq7Ub+72C6lDnPJb7yGOZmIyyW0xPyeooewIvqE3hbGA6aDyDEupGqYEQflUCRVgyKc6hYG440TYc54swxPxTx45poFvAOMpZ+mkBFI4zulcdw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NleGa/rK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44A1C4AF0B;
	Fri, 25 Oct 2024 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729871947;
	bh=0ljjiMfY8z+Bl5+mDZWNjMpu9/ix8vBxLQdaWGAkiNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NleGa/rKKt6BULz8gusnuJ1dXN0KyU8ET6sl/GovJm/ewuQCofxEroGBmRsb5+Esx
	 A6OYDPg/AHTfS14QbyI4JPGOe3emSwG9pe2lpKMZW+7izkI+3NbrC36WYRsfHpTq6m
	 GFeXCKCmqK8GY1LjhYiQWJbqUJ7fYvBveUFpb41S83/FI+qiunDEhlqzs0+8MM6p+9
	 V1BLFMoLOCD4L2v6icdLkHKr5SWj1D8YVlUzXk3y31ZITaW+A9XHw0ajLOUxWLvVwK
	 5UJxFcSfJN4VC+PNj77xqIhI9HfE7tJ13D+8qbRgHz4MVauNs0kF/pzZEJwJqv6uvg
	 c5KjXXXXxeEhQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2629167e87.0;
        Fri, 25 Oct 2024 08:59:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYDis/nIxD+N6XuFd7ssBGlAE2ZrKVUp/to+DpdlZuVEzJjUa1If7H2xNUY8asDrn1ZtsyM6ng6RPHc4A=@vger.kernel.org, AJvYcCVeZgFy4CFlwrlXvUIOXjsWv93MNHBNWHgA2dECNLrn4eFPfwUI/q6rOvZj1SxrqPmhtIxy4UebgRt8ZCPA@vger.kernel.org, AJvYcCWu4+FnWDCrXy6Qq7qwfLPTnpQSNX6T053kR/XFBJyhGpc4GywjzB5jqIMpM1kn8Qo5AL5x+A79J3w/@vger.kernel.org
X-Gm-Message-State: AOJu0YygbfF5oty7975rJmsWw+YxXPjoLP+5CrZCNnNQVBMMrSwi6Wss
	IocoqLFPSWCnm/RClU5ibnmqLkvu7zB8ro7ItmwvfOauBsWpjknu7uka4ukKvKxC+BBi9BeA/S4
	+4LP47nxUoggYduuDcKm0TbE66Q==
X-Google-Smtp-Source: AGHT+IGqfGBzoEoRPRIkEeREtu2dznxwKMzTFWNqYthKnWJMl+avTFRaLz8K5ozJ0DKucijr+bxNVflLKh2zQVRwy3w=
X-Received: by 2002:a05:6512:3096:b0:539:f754:ae15 with SMTP id
 2adb3069b0e04-53b23e8ebabmr3741616e87.41.1729871946118; Fri, 25 Oct 2024
 08:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3> <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
In-Reply-To: <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2024 10:58:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
Message-ID: <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Doug Anderson <dianders@chromium.org>
Cc: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com, 
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 10:29=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Charles,
>
> On Fri, Oct 25, 2024 at 5:03=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - goodix,gt7986u-spi
> >
> > Compatible is already documented and nothing here explains why we shoul=
d
> > spi variant.
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +
> > > +  goodix,hid-report-addr:
> >
> > I do not see this patch addressing previous review. Sending something
> > like this as v1 after long discussions also does not help.
>
> Krzysztof is right that it's better to wait until we get consensus on
> the previous discussion before sending a new patch. I know you were
> just trying to help move things forward, but because of the way the
> email workflow works, sending a new version tends to fork the
> discussion into two threads and adds confusion.
>
> I know Krzysztof and Rob have been silent during our recent
> discussion, but it's also a long discussion. I've been assuming that
> they will take some time to digest and reply in a little bit. If they
> didn't, IMO it would have been reasonable to explicitly ask them for
> feedback in the other thread after giving a bit of time.

If the firmware creates fundamentally different interfaces, then
different compatibles makes sense. If the same driver handles both bus
interfaces, then 1 compatible should be fine. The addition of '-spi'
to the compatible doesn't give any indication of a different
programming model. I wouldn't care except for folks who will see it
and just copy it when their only difference is the bus interface and
we get to have the same discussion all over again. So if appending
'-spi' is the only thing you can come up with, make it abundantly
clear so that others don't blindly copy it. The commit msg is useful
for convincing us, but not for that purpose.

Rob

