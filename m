Return-Path: <linux-input+bounces-615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E22780A3F6
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 13:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD10281826
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 12:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396121C29B;
	Fri,  8 Dec 2023 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GymOwdMp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4A8199F
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 04:54:34 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5cdc0b3526eso15148417b3.1
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 04:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702040073; x=1702644873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzKPwdYAwYCdy6h7bjnYf0Ny9x0IXWZf0PctpusOM14=;
        b=GymOwdMpn2bCXzEW+5FR2yU88+572gP+YVWQgaezvu+Ks+LJ7893+N3yfRaKaDxeQT
         P7eDhlUSwa0kE2QdfEYz5CPldn974JBEL2o0WIt+RYrc5KZ69akrBntn0SKZZuSEYzKk
         2dL7s6LghbPXLq2AGxiZYSkLf/jQiIGCPrlZNXiCVJXpe+M7ZihsEp1/+uQ2SxSs+ZgS
         u1SRngX4omMo41+hmDi6Xj+1EHtrkcVtNWRinetAsHOGj1NulpS6nf11GZ28rTeaAMfl
         CDyOxzaceGkKRcimdcPEOlwKsFZuTy6RuXJu4HcKgHio50dkv7t6S90yHDvZYjE/1OX2
         SRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702040073; x=1702644873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzKPwdYAwYCdy6h7bjnYf0Ny9x0IXWZf0PctpusOM14=;
        b=w5WluwN6duFKXZI+rurXXBd0wD+cQOrgY8urgaztqwf0xZIg6PXiEoNKJHwAwdYkDE
         TnhI1fxHJDI0ChRyzlvw4xHUqUyV6cWjQCn3nPLEF9iQdvA5/08i9AXpNpy9MY7XB7AI
         ZMGXe+dRbKPkHq/+dDXdP/HFitwXQ7L7ueKL/98Qob+mbuZfIapZCeGy0/aFrxCFwHcd
         45kF2cvdDKQMLF0GA8lcy/9GukuUuklfxYFcjLgQOeuTicY5Te8+gGCpG0TFFCpRtCBr
         CSb7B1beZlriwiT7ResBP+M0Ev7bWJgGa50Yr+4FvYjdFnU+GAslLstMbl3SKto+XomS
         66Qw==
X-Gm-Message-State: AOJu0Yzii6bRN7SRnF2K5JH1TidZnB3TGlRd0H2oZvF0n6tmC4Lo2JcC
	qQ+JhGg2sKx3lz6N+Hhv5vS7mxjZAu0gEzoAX6TcPA==
X-Google-Smtp-Source: AGHT+IEAJXSroSapCiPDjhsK4NjurOOebjH4gHV0wHEUSh+xkwhLq/8/MRN114XW47mChKgdM8zLbDjUan/sQcQJbJY=
X-Received: by 2002:a0d:cb42:0:b0:5d7:1a33:5ae5 with SMTP id
 n63-20020a0dcb42000000b005d71a335ae5mr376183ywd.50.1702040073661; Fri, 08 Dec
 2023 04:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207111300.80581-1-eichest@gmail.com> <20231207111300.80581-2-eichest@gmail.com>
In-Reply-To: <20231207111300.80581-2-eichest@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Dec 2023 13:54:21 +0100
Message-ID: <CACRpkdbSs-vebvchxx-Tg+O5CUF5M3vZf-iytuW=ZECnHb2anA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: atmel,maxtouch: add
 poweroff-in-suspend property
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 12:13=E2=80=AFPM Stefan Eichenberger <eichest@gmail.=
com> wrote:

> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Add a new property to indicate that the device should be powered off in
> suspend mode.
>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
(...)
> +  atmel,poweroff-in-suspend:
> +    description: |
> +      When this property is set, all supplies are turned off when the sy=
stem is
> +      going to suspend.
> +    type: boolean
   wakeup-source:
     type: boolean

As Krzysztof says it seems you are describing an operating system feature.

I can't help but wonder: shouldn't that pretty much be the default behaviou=
r
if wakeup-source is *not* specified?

I.e. the property kind of describes !wakeup-source.

Yours,
Linus Walleij

