Return-Path: <linux-input+bounces-49-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D577EABD1
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 09:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1D101F2327B
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 08:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3111C84;
	Tue, 14 Nov 2023 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GaBkddCt"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14811C8C
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 08:44:25 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349FD1AC
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:44:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5094727fa67so7827635e87.3
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699951461; x=1700556261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOI0CPqc9rDEial0ZWLikbzbAhp2oEQwcaX5s3JL5lU=;
        b=GaBkddCtVV4Cx5R32RvyNisa4XpVVlW4VTDJv072taqKn8xuHBn+vUWncuWPIEt21k
         UbAKHTpVdQCUSAUi2ojfoZfaBAZ36yhUIFiM/dphEoWhLckF0Fqqh87fz32AJ2qm1Gd+
         NyMd7q3lS5Sb0fFD4QAHMjzuw7yUDs1wf5+MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699951461; x=1700556261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOI0CPqc9rDEial0ZWLikbzbAhp2oEQwcaX5s3JL5lU=;
        b=nPMOUaKuGOCK0no/BKuiMnfC6aqh7wxSkh6PSujnTxixF08qFRWfEXER87tCAOeufF
         s0QR07fsV/8qG9UZBlxQiT4fpxEn3l+3pA5U86PrKNhpuiEPs23zUsG/v0jiofILEs9D
         uq4YJimttiPuZdYWRjppF/kWE5rqtBLK3tjDO+BVAtcLu8SbvIHsKByPbO1+cDP0o+nT
         996YvJ1hVhWTPEF230guzKelv2ZZ2WFxKBBAaKzYumW/72OURWmbCqcuHVKs1f2X8MZ4
         SIyi16PNYnoUrnMUNFgRmkLP2nwD0XIOa/jFuKVreB+Gzx9HqX7vWq1wGcRq1ro/IvXe
         CTlg==
X-Gm-Message-State: AOJu0Yzvk2Nra1yLn6ik6bc8Lns/5exTepg4uT/qB4OyJ3MFR9o72Sm8
	3RQLeipADMhhj6sq12GTwD6Mp2Lb4Wv4n99ics3lMw==
X-Google-Smtp-Source: AGHT+IEa6VnEgDgdb660juJcwqvPMHNrvPtOFZUPkY8aSdfT4qRPasNYPWnpX+E9xWBXVGeBHiyk1pNobLJZBUesJiM=
X-Received: by 2002:ac2:5dd6:0:b0:507:9d70:b297 with SMTP id
 x22-20020ac25dd6000000b005079d70b297mr5427659lfq.60.1699951461277; Tue, 14
 Nov 2023 00:44:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
In-Reply-To: <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Nov 2023 16:44:10 +0800
Message-ID: <CAGXv+5GHFn_Xr0ta7b5M9WMBJzCE6NJWo_PR+XOYXO0oaoPeaQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 8:22=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Nov 9, 2023 at 2:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > The driver as
> > implemented currently doesn't deal with regulators or GPIO pins,
> > since in the existing device trees they are either always on for
> > regulators, or have GPIO hogs or pinmux and pinconfig directly
> > tied to the pin controller.
>
> I guess I won't object too much about this limitation for v1, but IMO
> it would be good to get this sorted out since I think part of the
> power of having the HW Prober is specifically that it can handle this
> type of use case. You have a little bit of board-specific code that
> knows how to turn on the regulators / GPIOs and can then probe the
> devices.
>
> Note: even if this is "board specific", it doesn't mean you couldn't
> share code between boards. For instance, you could have a helper
> function that would turn on regulators/GPIOs based on some type of
> table and that helper function could be used across a whole pile of
> Chromebooks. If a Chromebook is sufficiently different that it
> couldn't use the helper function then it could call its own function,
> but presumably it wouldn't be hard to support a bunch of boards
> without much code.

I agree this part is fairly generic and should be implemented.

We probably don't even need such a table. If these components share
a common connection to the mainboard, they certainly will have the
same GPIO lines and regulator supplies. The prober could just scan
the nodes looking for -gpio and -supply properties, de-duplicate
them, and turn them on.

The reason this isn't implemented in this version is because the devices
I'm currently using do not have these resources togglable. The supply is
always on, and the GPIO line is disconnected from the SoC. So I have no
way of testing it yet.

> As part of this, I think that your main "HW Prober" for Chromebooks
> should be in "drivers/platform/chrome/". I think that the only things
> that should be in the "drivers/of" directory should be helper
> functions used by the Chromebook HW Probers.

Sound like what Rob wants.

ChenYu

