Return-Path: <linux-input+bounces-69-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5947ECC50
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 20:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D74681F26F31
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 19:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB3C3D3BB;
	Wed, 15 Nov 2023 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or31r+GD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF45364A8;
	Wed, 15 Nov 2023 19:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323DFC433CB;
	Wed, 15 Nov 2023 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700076507;
	bh=6X29YxgOJSekJMMYnxMuAiE4h71bPpKLkyOGCG+ZdDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Or31r+GDQxBg0Kl8952bupTT20NKuDwPAAhds0bRUOCSZpFXveuXNiRPeMF9U4ZFC
	 AvZlT63J2FDw7+KmeblxmRPR4g5Vzt0k5NC4KfM41F7s7MjmEPfuSQ+P4J7ydI9oVD
	 RJiksoxrLz7lCCBhDKMXsqog4bhDw0xNI9zPLaN1G/e6lKLuBptX7qINXIZDokxuWt
	 WplEtsGC5+kLHE64Dvk+Anp0N+yInACzDd1UP7BuR52jRkPU6rnnE3t9i9qMr9smHu
	 4SU5hizO3uCkiFzud6h13enoHxr6HU1OvKZM8mdcDPdJqWAWQU2dfZcIq3tmPAasfy
	 JwiL2+5acw0qg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507adc3381cso9569949e87.3;
        Wed, 15 Nov 2023 11:28:27 -0800 (PST)
X-Gm-Message-State: AOJu0YxYLkeGNB1MwJsOGObG0WBrmDTdIlugbfB7vOm83DeDvdDJBPDE
	3A1MpMmL6gLNGveBIzHLZql28/I95G9499v3Wg==
X-Google-Smtp-Source: AGHT+IGtuiOaHigoe4PCchL0ez6WkPrADjlwvvM4lywCiYHOdKs1gl3YzfWtoBm3uafJe5HtghJLBMHgFaaktMSfqQo=
X-Received: by 2002:ac2:54b9:0:b0:500:d4d9:25b5 with SMTP id
 w25-20020ac254b9000000b00500d4d925b5mr9071774lfk.56.1700076505201; Wed, 15
 Nov 2023 11:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com> <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 15 Nov 2023 13:28:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
Message-ID: <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Doug Anderson <dianders@chromium.org>
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

On Fri, Nov 10, 2023 at 6:12=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Nov 9, 2023 at 5:52=E2=80=AFAM Rob Herring <robh+dt@kernel.org> w=
rote:
> >
> > > > End of background from Doug's cover letter.
> > >
> > > I think that using "status" is not a good idea, I find that confusing=
.
> >
> > "status" is what defines a device's state in terms of enabled,
> > present, available. That's exactly what we're expressing here.
> >
> > Now, I do not think we should be mixing the device class (e.g.
> > touchscreen) into status. I said this on v1, but apparently that was
> > not listened to.
>
> Interesting. I must have missed the "don't mix device class into
> status" part. Do you have a link to your post about that? Maybe
> there's other stuff I missed... Having the device class stuck at the
> end there was at least part of my last post [1] which gathered no
> response.

https://lore.kernel.org/all/CAL_JsqKK0tjeXNv=3Da8L3k0AjhCa15XOq1tPWqVod9myc=
sKXJHg@mail.gmail.com/

"I would not combine the 2 things. Knowing the class/type of the device
may be useful independent of your problem."


> I think one of the reasons that I felt we needed to mux the device
> class into status was that it was going to make the code a lot less
> fragile. Everything I've seen indicates that you don't want us to
> create a "HW prober" node that could be used to provide relevant
> phandles for different classes of devices, so the "HW prober" code
> needs to either search through the whole device tree for a status of
> "failed-needs-probe" or needs to contain per-board, hardcoded,
> fully-qualified paths.
>
> I don't think we want to include hardcoded, fully-qualified paths in
> the code. That would mean that if someone changed a node name
> somewhere in the path to one of the devices that we're dealing with
> then it would break.

Right, nothing should depend on the full path. That's not an ABI just
like the device path in sysfs is not (despite what Android HALs do).

> So if we're searching the whole device tree for "failed-needs-probe"
> then we need to figure out which devices are related to each other. If
> a given board has second sources for MIPI panels, touchscreens, and
> trackpads then we need to know which of the "failed-needs-probe"
> devices are trackpads, which are touchscreens, and which are MIPI
> panels. Do you have any suggestions for how we should do that? Maybe
> it was in some other thread that I missed? I guess we could have a
> board-specific table mapping (compatible + node name + reg) to a
> class, but that feels awkward.

Node name is supposed to correspond to device class, so why not use
that (no path or unit-address.) and nothing else (well, besides
"status")?

Rob

