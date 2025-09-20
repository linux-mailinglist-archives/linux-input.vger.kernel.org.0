Return-Path: <linux-input+bounces-14940-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A981B8C5FE
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 12:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02BB3581300
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 10:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7CD2FAC0B;
	Sat, 20 Sep 2025 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfJ7Pqhg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC732797B8
	for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758365378; cv=none; b=QyVLMATbfqhnE2SkjwOUx2KU2WW88ifxkmDSaPik+8jpRaPrdSFHiCwMFVV9jxoGpqZzV9qcWShzmFo40Lf4vzxVJRMR1XXeVaFn7YcOhzTZgXu2W7K8E7GAl3QGaYe0/O87PVenlbBr9t6uhWjtlOxrTN5qqIUXMXqDP7nlL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758365378; c=relaxed/simple;
	bh=LeD+Kp6HPaiggwjhXT1KWVi4MySo4T2YgcXx0PkGZ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3NGKBPFeYPnjwx4tMjRug9VLaSTSWP4cdyMzMdXr3QYHoC3S6ZmcvFVF8NURObZnCkQAQCMl3H7+sIKeEVw26roDvjsQ9drPP8XejPpl/9qBX1Zoqxf1qX7+MFj4S3BJ3My3Yh0hicce30Z3+hbo6kQuhQPqJaO7sGEktyjeAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfJ7Pqhg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2381c58941so345842366b.1
        for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758365374; x=1758970174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJc0EGzS/+BK6QuDuFmI2nY7ewfLLXuJxl0wU299He8=;
        b=SfJ7PqhgZVJ+4gZgkx39NxdBt6ecJ8Je+/R2RnpVcyJ1mh0Mg5wN9hEWtiz/U+ol/i
         6xl6kfNmxTZ2qIqEGykSR04lEEtwKCSGR5NXGTF4yDAk4qLt7np57BxE0mDAe1yP2Lia
         utCH1acPEzLmrbNThBQmQFSHWNp+UEKGp+Axle/NwGr/KuqgIVgMdG3wvWFv6Fp3LQKW
         2lrIQLaK7siis5vnnC1xqBsKrjH+7t/SvzudRdjD/7xzfXa+RIJEY2r4VFm+UtAhAGji
         rRF7cixkOlb6cdPMfZSuUjBhacCAXl24tEoML9fjvK2b3nj/y2Di8WDq6BZ6EmCgNDti
         GjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758365374; x=1758970174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJc0EGzS/+BK6QuDuFmI2nY7ewfLLXuJxl0wU299He8=;
        b=nsWl7kSM6mKt1vF+HS8u+35GrfJN4gVhKqzgbfQbuDqAIX0vjpa9bMwxaAra8YSHCB
         FEjFh4lQqLwMT8W9kGligFOLqznFSTyBxfdLSo65/tCtagdEEvNstc5Z5Ku9abTjWP39
         p9KzT2yHWC7g8dueEHpo4QnSc9JBcgHrrRV1MsHsBVIA9Y+YOuI9LCnbagDjm2/deiq/
         CATif6U6pvM+ORhLHlyJ4itmbMWtlunCQxMa2H6hzQxdFcXkLWTxqn3r6E9EfLYLekTm
         t/dSTTFYqz73PsMHZvdKWZ4oGbKmTYsloyCeVmnuNhX4ibqIR3jdxAlQdqdHJ1z0nBbG
         OZIA==
X-Forwarded-Encrypted: i=1; AJvYcCVv9VpzZuzZ4KB+fTa5hdDx756+oqdvwoClqjNWxbUb4FA9Ok5nwoxQu31dROGwOtdcybX+ezBSzvIxfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPck+zpoeggjkrN+DsG9hNEhzc1DDRlXQ8/9EMu2IaJdlonj4v
	KAT+qWcqVpN72Q6YPUKI/oX3IRfo+wSIBHimxlEq/BZWAm4B3/W8A6qmBw9zKDgezLN9C1eWXGF
	oCPDSMtpnN9mD1EZNbOL2WeNGDxptd4g=
X-Gm-Gg: ASbGncv5OualvOUoFkd3Z35afVT8tarvH/EpmVQI4JrV+EuiDLcer4DTfQdGHo601JW
	YknquUhX4HFmrQEXbBdL9P4tW4+QfxwEVoe7xW3RJhMaozdawWmcNqDvQu5OoFGzrolq4VWfDqC
	Gzr8PKCAPm14VfGbpSt8HArJf30PxFfk03uQFF75D38CbefQkxuwUbF/ItShA8bMyQt1yUWvR7N
	2ofE3U=
X-Google-Smtp-Source: AGHT+IHHbhBTYGUaEQMbVjyA0lAj2luPxy2XsbzoJZ2rvsPEEjKDVfN8Ekg2zTb0h70UHa/ky/mxQ7DHX1RPk/WuHD8=
X-Received: by 2002:a17:907:2d86:b0:afe:f418:2294 with SMTP id
 a640c23a62f3a-b24f4cd1612mr662812666b.49.1758365373591; Sat, 20 Sep 2025
 03:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 13:48:57 +0300
X-Gm-Features: AS18NWAsgghzm2kBTHVAUWgTvM4Rjv6fz5BEJyNeWi6WNSHflPsd2h04LFjYcyQ
Message-ID: <CAHp75Vfx9kyP-rVtfvyyMK4VH+oiRVjP1fZOtbVH14iLh98Jxw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] media: Introduce video device state management
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	Ricardo Ribalda <ribalda@chromium.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hans de Goede <hansg@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matt Ranostay <matt@ranostay.sg>, Andy Walls <awalls@md.metrocast.net>, 
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dan Scally <djrscally@gmail.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Corentin Labbe <clabbe@baylibre.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Keke Li <keke.li@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ming Qian <ming.qian@nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Eddie James <eajames@linux.ibm.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>, 
	Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	=?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Shreeya Patel <shreeya.patel@collabora.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Jai Luthra <jai.luthra@linux.dev>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Michal Simek <michal.simek@amd.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Krufky <mkrufky@linuxtv.org>, Mike Isely <isely@pobox.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
	Christian Gromm <christian.gromm@microchip.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Plamen Atanasov <tigerment@mail.bg>, Sean Young <sean@mess.org>, 
	Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Matthew Majewski <mattwmajewski@gmail.com>, Yunseong Kim <ysk@kzalloc.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Fabio Luongo <f.langufo.l@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>, Ludwig Disterhof <ludwig@disterhof.eu>, 
	"Everest K.C." <everestkc@everestkc.com.np>, Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Akash Kumar <quic_akakum@quicinc.com>, 
	linux-input@vger.kernel.org, mjpeg-users@lists.sourceforge.net, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 12:57=E2=80=AFPM Jai Luthra <jai.luthra@ideasonboar=
d.com> wrote:
>
> Hi,
>
> This patch series introduces state management for video devices.
>
> Currently, V4L2 subdevices have a well-established state management
> system [1] that allows the framework to store the subdevice state
> at a central location.
>
> Video devices however lack this, leading to inconsistent state handling
> across drivers and making it difficult to implement features like
> hardware multiplexing in complex media pipelines [2].
>
> The series is composed of three parts:
>
> - Core Infrastructure (PATCH 1-4)
>         Introduces the basic state structure, try state support,
>         initialization callbacks, and driver helpers
> - Framework Integration (PATCH 5-7)
>         Integrates state passing through the ioctl wrappers and driver
>         implementations
> - Driver Examples (PATCH 8-10)
>         Use the state to store formats in TI J721E CSI2RX and Rockchip
>         RKISP1 drivers
>
> This should also provide a foundation for drivers to extend or subclass
> the state structure with device-specific variables in future.
>
> I have tested capture and format negotiation with the converted drivers
> on SK AM62A (j721e-csi2rx) and Debix Model A (rkisp1).
>
> [1]: https://lore.kernel.org/linux-media/20210610145606.3468235-1-tomi.va=
lkeinen@ideasonboard.com/
> [2]: https://lore.kernel.org/linux-media/20250724-multicontext-mainline-2=
025-v2-0-c9b316773486@ideasonboard.com/

When you add a Cc list., do it after the '---' (three minus signs)
line, otherwise that huge unneeded noise will become part of the
commit message.


--=20
With Best Regards,
Andy Shevchenko

