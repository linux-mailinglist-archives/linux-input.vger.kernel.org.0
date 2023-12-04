Return-Path: <linux-input+bounces-430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDABB802BFC
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 08:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74AC91F210CE
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 07:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803A99447;
	Mon,  4 Dec 2023 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iD65mHNY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F67FF
	for <linux-input@vger.kernel.org>; Sun,  3 Dec 2023 23:24:55 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso1048825e87.3
        for <linux-input@vger.kernel.org>; Sun, 03 Dec 2023 23:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701674693; x=1702279493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=;
        b=iD65mHNYTVsaATpGhHMlCRNLFfSnxqdxPDshLNMj8FIn6q4HrsMPDzouP/sVNn+O7u
         CuE3d9eXxoLV7rrBLNHZnIHAmuDwHHtGpnZlc31uWuGslkLhr0FPq7E/qhpAMAgAY6e7
         801yX/7aXIVD7UAd3gLgXEA4W2xc2tkIXwtHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701674693; x=1702279493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=;
        b=eUS98tP5kEPwQaRdsLpHZ2ly+Zay0DL7SBEShjoCKunzX/oFoEj8dAmMDTKruumC8x
         4f6ZTtyLw0UNHOWghjbVpcAms/hEpLYGtBZC2HZW0q7fgAwVKv5452LfD9wvPY9oBg4W
         MSWCXBVCOCwpOFvmbxeuEPFjMJd+3RJ4wNUkB+jihnb/X/UkvSljjJFnhaaSeu5slm9S
         obQvAf414/eL34FLyKXjdfL3KkH3lOq0HKp56ZGzrfVKFLZJ+5uuUz2j4lelVbf9W/o4
         QypJAuwxJPDUlTR5SnRh+D2OW26LCDLT8vhF1Qbi58miQs9p57Wl0T7HMrbFAQ+udSLK
         qeQg==
X-Gm-Message-State: AOJu0YysPl6gez94V5G6ywMf0avyaGGRymbyDiL+V7gXA+St9JH9KQc0
	DBLWYqwnotiyZwTq/iMVpr0tqMiu0pWAGXMDsXrnHQ==
X-Google-Smtp-Source: AGHT+IFtbMn5A8+mOCK7ju+ZruOqp6ANHem62c8eBAnYZlXhRPomaeKDI0QPJC1GJ9Q8Tj324VrRaJX0WX0KLLlp1+M=
X-Received: by 2002:a19:ac4a:0:b0:50b:f51a:299a with SMTP id
 r10-20020a19ac4a000000b0050bf51a299amr600460lfc.32.1701674693388; Sun, 03 Dec
 2023 23:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 15:24:42 +0800
Message-ID: <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Doug Anderson <dianders@chromium.org>
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

On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
> >           To compile this driver as a module, choose M here: the
> >           module will be called chromeos_tbmc.
> >
> > +config CHROMEOS_OF_HW_PROBER
> > +       bool "ChromeOS Device Tree Hardware Prober"
>
> Any reason that it can't be a module?

No technical one. However if it's a module, the user has to manually load
it. So I think it's more of a usability thing.

OOTH I think this needs to be a module if I2C is built as a module.
Somehow I had thought of it at one point but then it slipped my mind.

> > +       depends on OF
> > +       depends on I2C
> > +       select OF_DYNAMIC
> > +       default OF
>
> You probably don't want "default OF". This means that everyone will
> automatically get this new driver enabled which is unlikely to be
> right.

I thought this whole section was guarded behind KCONFIG_CHROME_PLATFORMS.
So if the user has CHROME_PLATFORMS enabled and has OF enabled, they
likely need the prober.

> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible)) {
> > +                       int ret;
> > +
> > +                       ret =3D hw_prober_platforms[i].prober(&pdev->de=
v,
> > +                                                           hw_prober_p=
latforms[i].data);
> > +                       if (ret)
>
> Should it only check for -EPROBE_DEFER here? ...and then maybe warn
> for other cases and go through the loop? If there's some error
> enabling the touchscreen I'd still want the trackpad to probe...

Makes sense. However there's no extra information to give in the
warning though.

> > +                               return ret;
> > +               }
> > +
> > +       return 0;
>
> Random thought: once we get here, the driver is useless / just wasting
> memory. Any way to have it freed? ;-)

I don't think there is a good way to do that, except maybe marking all
the functions as __init? But that likely doesn't work in combination
with deferred probing (say the i2c driver is a module).

ChenYu

