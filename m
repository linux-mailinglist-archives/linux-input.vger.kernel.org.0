Return-Path: <linux-input+bounces-75-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A37EDB06
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 06:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 807151F2341D
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 05:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DA28F74;
	Thu, 16 Nov 2023 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kMy9X+Zv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF2D1A1
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 21:07:43 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507bd644a96so536695e87.3
        for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 21:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700111262; x=1700716062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n47o3OCFeDC4YRz6dczMMUhasbGb5AVuJwwpKHI7eFo=;
        b=kMy9X+ZvZZcOmSWLeFHvAHNtNge8oJD4OdCGchhk/D79Ye4EhoblebUNO5c+S3dXIQ
         di50xAIrda8ld6gu7NWvTpo1V4/u261eu9DsWH7w7TBDe0RD+7Ip3ezP31g0kDfJZ5uy
         rgUc95XjztBClPsRiO0/U+e0Ep7N+ozu5DH5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700111262; x=1700716062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n47o3OCFeDC4YRz6dczMMUhasbGb5AVuJwwpKHI7eFo=;
        b=S3J7VkPoGmHnjJewzuHobouJWykGW65RrmfJysCfVKUSuJQwQo3xIf0f9dhKthUFdi
         tgPbYKHa58ftM5lGLu0MQmLNf604G5qcBFR278DHjJ7uNMHmngFQwneeWFK8s9AoM4q/
         P4SAEUjn/BLxfROMvkkq0ykrluOfcvmbGWBnW9sCI8KpG2HgkwG/gnwPfGmrgG3ZoG0+
         A3qOpo1jXdE948qmNP4y9F0u7i2EPEyU+qCC80Lq22TNZLeb0ob5fiyJkTziXie7NKkw
         usSHkVBTBiTyevr5XBHWAHfNjkbU0hChhFRHgqhLERuhZ0ujwQHyui2mmtvOxLa4qh8m
         AD8g==
X-Gm-Message-State: AOJu0YzJmXDi5NMs/Yh/1SBf+ewYx0PoOpmNHsOaRtDQkkApd2YWZBQ0
	zp7DHMayP9Dx5mmIAps5rESCHnUei8Z6/nwZB+oUlJLONero9G6xYvY=
X-Google-Smtp-Source: AGHT+IHE03gJszw8lf/xHkWqpl61E8rAlryiMxaNRq78cfueM1p5kFwPjBIZVK5w9yvg2jCkjEB/Vh2Q6LEYk1Pq+cI=
X-Received: by 2002:a19:7616:0:b0:509:4980:7bf0 with SMTP id
 c22-20020a197616000000b0050949807bf0mr9759057lff.38.1700111261841; Wed, 15
 Nov 2023 21:07:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
 <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
 <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
 <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com> <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
In-Reply-To: <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Nov 2023 13:07:30 +0800
Message-ID: <CAGXv+5Gu4fmfriCh5wfeyqGPAX+LyLEDkCCrp4+_3XvS9-mAmw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 5:35=E2=80=AFAM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> On Wed, Nov 15, 2023 at 2:45=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Nov 15, 2023 at 2:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org=
> wrote:
> > >
> > > > So if we're searching the whole device tree for "failed-needs-probe=
"
> > > > then we need to figure out which devices are related to each other.=
 If
> > > > a given board has second sources for MIPI panels, touchscreens, and
> > > > trackpads then we need to know which of the "failed-needs-probe"
> > > > devices are trackpads, which are touchscreens, and which are MIPI
> > > > panels. Do you have any suggestions for how we should do that? Mayb=
e
> > > > it was in some other thread that I missed? I guess we could have a
> > > > board-specific table mapping (compatible + node name + reg) to a
> > > > class, but that feels awkward.
> > >
> > > Node name is supposed to correspond to device class, so why not use
> > > that (no path or unit-address.) and nothing else (well, besides
> > > "status")?
> >
> > One problem is that I could imagine having two second source trackpads
> > that both have the same i2c address. That would give them the same
> > name, right? I guess you could maybe come up with some sort of suffix
> > rule? Like
> >
> > trackpad-1@10 {
> >   compatible =3D "elan,blah";
> >   ret =3D <0x10>;
> >   status =3D "failed-needs-probe";
> >   ...
> > }
> > trackpad-2@10 {
> >   compatible =3D "goodix,gt7375p";
> >   ret =3D <0x10>;
> >   status =3D "failed-needs-probe";
> >   ...
> > }
> >
> > Then I guess the class would be "trackpad"?
>
> That issue is somewhat orthogonal because it is not following the spec.
>
> I'm not sure mixing the 2 styles of node names is a good idea. While
> not used too much, matching by node name does ignore the unit-address,
> but I'm not sure we could ignore a '-N'.

of_node_name_prefix() solves that. I assume that's the intended use case?

> I think our options are either add something to the unit-address or
> use i2c-mux binding. Adding to the unit-address is not unprecedented.
> I did that for some of the register bit level bindings where you have
> a node for different bits at the same address. The downside is
> unit-address is bus specific, so we'd have to add that for multiple
> buses. For the i2c-mux, it's perhaps a bit complex and I'm not sure
> what if anything you'd have to do to manage the mux that's not really
> there.
>
> Rob

