Return-Path: <linux-input+bounces-10-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE117E86E5
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 01:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EBF91F20EED
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 00:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F28410E7;
	Sat, 11 Nov 2023 00:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jQtiq4jm"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D3BEBB
	for <linux-input@vger.kernel.org>; Sat, 11 Nov 2023 00:22:53 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC173C3D
	for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:22:52 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507f1c29f25so3535276e87.1
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699662169; x=1700266969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7To0W+4U1gHtnYyGtgD0VBuArtwhrF2fE4verOw+Uo=;
        b=jQtiq4jm4nwWmrLEgRMHzz/mhqgb7mTm20Ef4BUNoi7HyyAPKEI8XqDKId9lgh7nB5
         gO77VDmXg6JRSiyeCd5usXeHbz32lZazqWHYT802O0+XTOV1RiF9nxB8C3cuyCz0aCho
         0xroUHHcxTrYGGYeh41GvVl/C6aYiRbgicJn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699662169; x=1700266969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7To0W+4U1gHtnYyGtgD0VBuArtwhrF2fE4verOw+Uo=;
        b=f6ZMjiY+IIY6sTcuOOaQYdb6Pbldd2k5YrOsRUIVfQM+T7JIXo2/w060Y397x83DNW
         ABTMykEFOkKqCSbPZtcbxms/bFmBJLHca1sCVQQXF4dU5WRb1NCozPfApXDViuE8Lg8b
         W3W8YkJ9XYvT5wOlqpe41sj2gO2faW+NNpCv3+I9Y4c4aZ4A8xll5yWCZ2P5NehaLWhd
         qpEp+1LsoNQiqLqE5S8OPv9dxdysD/74FCcaR7Djpro8VMWZnDMhUQuaTTxLtL0Uc8x0
         cgf/Jk7s8ktcT2UqqnLrxwgHw7u1J3zfFmMBiAKwWOvngthYN6ejTJLtmDT2e9avWUKi
         4AFQ==
X-Gm-Message-State: AOJu0Yy6zgPEvBSVog/2Foz5Jeq17G+npDFm5X+HkAc9SqQfDsSX5GPV
	ssu6QBguO+yY73gvHDrZLAX93BYh/TmexdyLGXWBz/SZ
X-Google-Smtp-Source: AGHT+IEmwkwj+udoCXbBO8RAbF147Pymb+6w6CprDDZsbHUGiQ77roReaCRA2LhWhakwSlQKybjgHg==
X-Received: by 2002:a19:5f0d:0:b0:506:8b22:bac2 with SMTP id t13-20020a195f0d000000b005068b22bac2mr384657lfb.4.1699662169590;
        Fri, 10 Nov 2023 16:22:49 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id y21-20020a0565123f1500b005056422d204sm96624lfa.158.2023.11.10.16.22.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 16:22:49 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50931d0bb04so1067e87.0
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:22:49 -0800 (PST)
X-Received: by 2002:a05:600c:1d07:b0:408:3727:92c5 with SMTP id
 l7-20020a05600c1d0700b00408372792c5mr32280wms.2.1699662148320; Fri, 10 Nov
 2023 16:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org>
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2023 16:22:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
Message-ID: <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, 
	tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 9, 2023 at 2:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The driver as
> implemented currently doesn't deal with regulators or GPIO pins,
> since in the existing device trees they are either always on for
> regulators, or have GPIO hogs or pinmux and pinconfig directly
> tied to the pin controller.

I guess I won't object too much about this limitation for v1, but IMO
it would be good to get this sorted out since I think part of the
power of having the HW Prober is specifically that it can handle this
type of use case. You have a little bit of board-specific code that
knows how to turn on the regulators / GPIOs and can then probe the
devices.

Note: even if this is "board specific", it doesn't mean you couldn't
share code between boards. For instance, you could have a helper
function that would turn on regulators/GPIOs based on some type of
table and that helper function could be used across a whole pile of
Chromebooks. If a Chromebook is sufficiently different that it
couldn't use the helper function then it could call its own function,
but presumably it wouldn't be hard to support a bunch of boards
without much code.

As part of this, I think that your main "HW Prober" for Chromebooks
should be in "drivers/platform/chrome/". I think that the only things
that should be in the "drivers/of" directory should be helper
functions used by the Chromebook HW Probers.


-Doug

