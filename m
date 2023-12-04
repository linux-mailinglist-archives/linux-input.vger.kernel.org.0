Return-Path: <linux-input+bounces-473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E0803AD2
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 17:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B394DB20AB0
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 16:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779FD28DDF;
	Mon,  4 Dec 2023 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mfmP7B1v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A57CC6
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 08:50:40 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54ca339ae7aso2163244a12.3
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 08:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701708637; x=1702313437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8E333mX0LWpYdsutAHYgoOIGzA9DDLQh7glRXD1fJM=;
        b=mfmP7B1vWcNx6RYLm1LtVn429CcD7irkx/GWEGF8ktUdPtKFdkVmPOrqHl5Vc4AZtk
         dEZs3/60v92V61p76bYvqIi/Ysj3T5XdqSxoV7lRx9cCxFoy3dwc3lIJ8Gt6o04SsOSG
         u6mH4lGw7psQMmgu3oO55sN54LB22YgER9t5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708637; x=1702313437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8E333mX0LWpYdsutAHYgoOIGzA9DDLQh7glRXD1fJM=;
        b=UDSBjxTmMn4ddZ+TJ5EkVNNIWNitaurvjxq1d7Be/jlJzo5BwCiYOCQkk7WVadLsBZ
         dJftlg88XsSvKdPQlqZpCcnXJ28G7+Tbq+JrrJ4r85V6jlV/UjtJj9WmBdQc0E2pBIyZ
         VGHORrE8mtC4MyMykA5u8jCnlkxx+tX0Puy3MBszjPQFDd3FBM9Po/BThz9DeEd8LxYo
         DANWlr0g7u4BMU0A8gPRCByDLT1MdgI1dakWzTSEP8LKznvI0MGgvd+av4xCq9/+QxKG
         BJY+d0gaM6BHHqVxuvntZqnT8hM1bM0T+SziI8R1miu3ikOFNTWfAOcrrTGc+3ipSH/I
         xQrw==
X-Gm-Message-State: AOJu0YzjKfE7zL0Y55Cq+cVb7g6RP+vpVyId4KqMGt3mureWAEFg1abC
	jiEiqEeU0QodCks/qExALwuBORMcWNIte0JXH0n3afeP
X-Google-Smtp-Source: AGHT+IFbkFsb7rg3HhuQXEGq2Debrob/5Y+drEmBJb5qdJB49ytcgxyZ+LkR54jkmoqslCn0aLBJRA==
X-Received: by 2002:a17:907:30d5:b0:a19:a1ba:da38 with SMTP id vl21-20020a17090730d500b00a19a1bada38mr2861304ejb.95.1701708637708;
        Mon, 04 Dec 2023 08:50:37 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id dt20-20020a170906b79400b00a19cc1c2dd7sm4398427ejb.101.2023.12.04.08.50.37
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:50:37 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54c79cca895so16433a12.0
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 08:50:37 -0800 (PST)
X-Received: by 2002:a05:600c:5247:b0:405:320a:44f9 with SMTP id
 fc7-20020a05600c524700b00405320a44f9mr414355wmb.5.1701708616473; Mon, 04 Dec
 2023 08:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com> <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
In-Reply-To: <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:50:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Message-ID: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 3, 2023 at 10:59=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > >
> > > @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> > >                 reg =3D <0x2c>;
> > >                 hid-descr-addr =3D <0x0020>;
> > >                 wakeup-source;
> > > +               status =3D "fail-needs-probe";
> >
> > While doing this, you could also remove the hack where the trackpad
> > IRQ pinctrl is listed under i2c4.
>
> Sure. I do think we can do away with it though. According to at least one
> schematic, the interrupt line has pull-ups on both sides of the voltage
> shifter.
>
> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
> both sides of the voltage shifter as well.

I dunno if the convention is different on Mediatek boards, but at
least on boards I've been involved with in the past we've always put
pinctrl entries just to make things explicit. This meant that we
didn't rely on the firmware/bootrom/defaults to leave pulls in any
particular state. ...otherwise those external pull-ups could be
fighting with internal pull-downs, right?

-Doug

