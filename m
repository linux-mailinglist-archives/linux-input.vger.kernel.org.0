Return-Path: <linux-input+bounces-70-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 530057ED2F3
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 21:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24CF1F21019
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 20:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96D5381A5;
	Wed, 15 Nov 2023 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XW2Fbidh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CF9192
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 12:45:04 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9f282203d06so17714766b.0
        for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700081102; x=1700685902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMCXFclGcLK2XWRhjGnvFkwVtcm+D581tPNKMzDFIwY=;
        b=XW2FbidhV0kiGU4tZfY5di/mHMlam05rTCbQxyoaSU5AR4sZBsjNq5KuVn8Kj/6MhH
         eXnlBUlAy/aK4jcHuBA30xhc0OY/44xfwDiXgxHrz/aqPRuC8uEqKgFhdYDj6GJdhPnf
         GJd47CnHksZxgM1dft+Lrh2bZA+cHMCNPKQn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081102; x=1700685902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMCXFclGcLK2XWRhjGnvFkwVtcm+D581tPNKMzDFIwY=;
        b=GNwNSIN9g1qbPMQyNVg7f+dcb7xnhaY9BMvlHfKZuTfiNrT/6/bVLj6Wgf/3Cl2AoU
         olKV4O4IwfTg6J/LmWpsd9ycWKB1yJyKT4bo+0FN6y0MJVqDsyMnxoZiG+kt0yMEAnrU
         QhTBixZgF+U3z01akyxymHeli02OjwhI3gDBGMp37xsF9TfqlfH6bsI8ht2tM/ayCvuV
         4XTW57DL45NaBAhtiP/rizxJPyqwL0JA9HsvlESw/nfMb7zV/YxAgiaX418g0HwU12ap
         u0Femqo8aqCv2D5RbORZ4XsrDWy48QjoRRYaKXxUbY+sX7EyjE8M3gcAt9MlEA6SUSFe
         bMsg==
X-Gm-Message-State: AOJu0YzZE8eqf24HIVr1A5V6CzE/JXZR8rrBvTYHrSccuxCPGGBC0wJm
	6ndyNBNUJF2vxbh77e1vIWJ682k2CJ1fudrxed8nsMST
X-Google-Smtp-Source: AGHT+IF4LJleX5v7cGrkMtmgIyPT13TontuxKC5R6MYFGSVRx4pi0dve20DGFtGBqQ8w5jGRLquVvg==
X-Received: by 2002:a17:906:c02:b0:9e4:63b:bc2e with SMTP id s2-20020a1709060c0200b009e4063bbc2emr340548ejf.71.1700081102187;
        Wed, 15 Nov 2023 12:45:02 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id w11-20020a17090652cb00b00992f2befcbcsm7534177ejn.180.2023.11.15.12.45.02
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 12:45:02 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-545557de8e6so3336a12.0
        for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 12:45:02 -0800 (PST)
X-Received: by 2002:a05:600c:3b23:b0:408:3727:92c5 with SMTP id
 m35-20020a05600c3b2300b00408372792c5mr11547wms.2.1700081081263; Wed, 15 Nov
 2023 12:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
 <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com> <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Nov 2023 12:44:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com>
Message-ID: <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
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

Hi,

On Wed, Nov 15, 2023 at 2:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> > So if we're searching the whole device tree for "failed-needs-probe"
> > then we need to figure out which devices are related to each other. If
> > a given board has second sources for MIPI panels, touchscreens, and
> > trackpads then we need to know which of the "failed-needs-probe"
> > devices are trackpads, which are touchscreens, and which are MIPI
> > panels. Do you have any suggestions for how we should do that? Maybe
> > it was in some other thread that I missed? I guess we could have a
> > board-specific table mapping (compatible + node name + reg) to a
> > class, but that feels awkward.
>
> Node name is supposed to correspond to device class, so why not use
> that (no path or unit-address.) and nothing else (well, besides
> "status")?

One problem is that I could imagine having two second source trackpads
that both have the same i2c address. That would give them the same
name, right? I guess you could maybe come up with some sort of suffix
rule? Like

trackpad-1@10 {
  compatible =3D "elan,blah";
  ret =3D <0x10>;
  status =3D "failed-needs-probe";
  ...
}
trackpad-2@10 {
  compatible =3D "goodix,gt7375p";
  ret =3D <0x10>;
  status =3D "failed-needs-probe";
  ...
}

Then I guess the class would be "trackpad"?


-Doug

