Return-Path: <linux-input+bounces-9-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E97E86D6
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 01:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF98280FDC
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 00:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FABA3D;
	Sat, 11 Nov 2023 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i0piSaOJ"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD31396
	for <linux-input@vger.kernel.org>; Sat, 11 Nov 2023 00:12:49 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B51D420B
	for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:12:47 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so36353121fa.0
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699661563; x=1700266363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdD5p4ZJ2xs0jbe3PMitwqM3ZIGCltDGGJH36M99UsU=;
        b=i0piSaOJ9ZHeRlHtZtzAeSiAiWKX4HfWoocJqfOhKQlnnlDSgpG6VXHzTnCvtF8nfY
         EE4tObCD64J+eN2pN+yGq7X58JW45zqlMDAPpKOswOrdjYbqo0yxzaY22Sy+scQKvZwt
         pHv/EukwEjk2q865SkLS9phsnKLkaaQcA/64g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699661563; x=1700266363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdD5p4ZJ2xs0jbe3PMitwqM3ZIGCltDGGJH36M99UsU=;
        b=HwA7IZzHwF9yoiDB0IAsKHMHnDWot5FVeap1iLhshQdUDK+GPzgzyDKOeBQLa7W+11
         Mp2b1gu67EkZ9mtphFpeMqHMGKEuE45eNFBqjz5OYCUNJNBILZue5K3xw8UQ+5u1jhyC
         mRIkFka7a+jUJvf5BMDsnTnn3HZyxtYtux6+744uCAnV5n2Zhayg+lHpz8dFPe/MDs5K
         HSQkTiL4kXEQxp3dD2A9zNDJxJuO7t0Hsax3Nf8b3aCAyvn5PDIU9N4m7gjc0semNNYC
         toKtmuV6UOvqXVBog5blGBwKNoZ+snb9DWOSNc/0RHUo/LYkWBAKB+x69FC+J6lQeh9l
         4nQQ==
X-Gm-Message-State: AOJu0YxxRNVr/EWxl9XsisQlbZ2/8yQRZXkcSfq8BGWsnpi8cCt11UKK
	RltrooMGO1BdrIHVXTvHmuo92Rr1SUd+USertLlpdA==
X-Google-Smtp-Source: AGHT+IEK5lWJQH/KapVxCFIfIn6yvuDVa22HLjinapqSbTkTMltjRBqJvrojO4Z9qS5QvnbIFCPSoQ==
X-Received: by 2002:a2e:978d:0:b0:2bb:78ad:56cb with SMTP id y13-20020a2e978d000000b002bb78ad56cbmr539975lji.37.1699661563661;
        Fri, 10 Nov 2023 16:12:43 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906601500b009e655c77a53sm239178ejj.132.2023.11.10.16.12.43
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 16:12:43 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so4980a12.0
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:12:43 -0800 (PST)
X-Received: by 2002:a05:600c:1c11:b0:3f6:f4b:d4a6 with SMTP id
 j17-20020a05600c1c1100b003f60f4bd4a6mr5724wms.7.1699661542490; Fri, 10 Nov
 2023 16:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
In-Reply-To: <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2023 16:12:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
Message-ID: <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
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

On Thu, Nov 9, 2023 at 5:52=E2=80=AFAM Rob Herring <robh+dt@kernel.org> wro=
te:
>
> > > End of background from Doug's cover letter.
> >
> > I think that using "status" is not a good idea, I find that confusing.
>
> "status" is what defines a device's state in terms of enabled,
> present, available. That's exactly what we're expressing here.
>
> Now, I do not think we should be mixing the device class (e.g.
> touchscreen) into status. I said this on v1, but apparently that was
> not listened to.

Interesting. I must have missed the "don't mix device class into
status" part. Do you have a link to your post about that? Maybe
there's other stuff I missed... Having the device class stuck at the
end there was at least part of my last post [1] which gathered no
response.

I think one of the reasons that I felt we needed to mux the device
class into status was that it was going to make the code a lot less
fragile. Everything I've seen indicates that you don't want us to
create a "HW prober" node that could be used to provide relevant
phandles for different classes of devices, so the "HW prober" code
needs to either search through the whole device tree for a status of
"failed-needs-probe" or needs to contain per-board, hardcoded,
fully-qualified paths.

I don't think we want to include hardcoded, fully-qualified paths in
the code. That would mean that if someone changed a node name
somewhere in the path to one of the devices that we're dealing with
then it would break.

So if we're searching the whole device tree for "failed-needs-probe"
then we need to figure out which devices are related to each other. If
a given board has second sources for MIPI panels, touchscreens, and
trackpads then we need to know which of the "failed-needs-probe"
devices are trackpads, which are touchscreens, and which are MIPI
panels. Do you have any suggestions for how we should do that? Maybe
it was in some other thread that I missed? I guess we could have a
board-specific table mapping (compatible + node name + reg) to a
class, but that feels awkward.

[1] https://lore.kernel.org/r/CAD=3DFV=3DUjVAgT-febtj4=3DUZ2GQp01D-ern2Ff9+=
ODcHeQBOsdTQ@mail.gmail.com

