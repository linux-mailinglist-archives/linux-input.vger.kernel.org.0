Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716F47B41C3
	for <lists+linux-input@lfdr.de>; Sat, 30 Sep 2023 17:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbjI3Phy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Sep 2023 11:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbjI3Phx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Sep 2023 11:37:53 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A38BE;
        Sat, 30 Sep 2023 08:37:49 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-690f7bf73ddso12037330b3a.2;
        Sat, 30 Sep 2023 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696088268; x=1696693068; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFxpcz2a7H2ZjgJ8ssrmjpRaSpMI8na0366gdvXOP5U=;
        b=i7RVm02MuUpfkS+adAaXFJXJVc7cJMLxEyheXDLpuhtGxzZh24bwxmCl7Uf9jI68sR
         vV24fpQuoO8yvNhOV8kP45ZCpvGXpQvlN4Q9OgRIsmVAfKHe9ui4+eUTg1LqdN/e3OL1
         NnXLOgkxCn3KFBV2h2X/QFKv698jMfwvGgpOkFN194LSczsyT/UUrnIPcsg4Ar17GEgy
         wr6/i4rjdATb+6/YDTq1uXCSghiQt6W8aYWJos1EvoiO5Lo5Kd9OkLrZL+38Ml5/ymku
         IZrSVEdFvPr7Z7v7VamyRyeUSCYOqi0mfJP2bPVC2m9oCGipkMsMjyIAu2zgMXlYyxPG
         cWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696088268; x=1696693068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFxpcz2a7H2ZjgJ8ssrmjpRaSpMI8na0366gdvXOP5U=;
        b=i/IXTzK7Nl2JAky6WN0Ui0AtJmwqsKakUi2lxUpMCmwArwgFO+CSkzyzn3PjPi8HMf
         jdQrsz7DPGUs8midPg8gAlsx3KJHWKcfrayDZHO/nqGi1Qh/yNbMpJKHatQVI4ANluc3
         wXWwiA1XAZtGLei0OwxRrNdn1APkotUwWEOEdct2EViXz+eDL69Utpk5t7NUBQ4CSOnr
         4V5niVPs8Qom4qOaUlv/FBQ0ClkzGXtDHzhyekowb2nsVm65m0X7iQzlNGba6+q5EhFA
         srMrD1bXkhjnyVztX1qMd2F0PB2hM+yiCE9ngiRyg22luUxWvGpq0IIyJAW281yi37To
         z0+A==
X-Gm-Message-State: AOJu0YyX4xPapWznjJsp+XwnMG4DtRuHqj0mgjp3uuxY36uPLISRwBXC
        PWe+kTmoNqxBH4t580tI3Qo=
X-Google-Smtp-Source: AGHT+IEMqhKSToJyXm3yTD7cSFnLWSycVL5nK0X/hEUjcO1rvPkbJ0hf7ZvRqV9SvIbBhj0xSyFIPg==
X-Received: by 2002:a05:6a00:16c7:b0:68f:ecb9:5fde with SMTP id l7-20020a056a0016c700b0068fecb95fdemr7078816pfc.34.1696088268304;
        Sat, 30 Sep 2023 08:37:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a90f:2dad:30c1:d923])
        by smtp.gmail.com with ESMTPSA id a10-20020a62d40a000000b006926506de1csm17137176pfh.28.2023.09.30.08.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 08:37:47 -0700 (PDT)
Date:   Sat, 30 Sep 2023 08:37:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>,
        Guenter Roeck <groeck@chromium.org>, Liang He <windhl@126.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        chrome-platform@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
        Samuel Holland <samuel@sholland.org>,
        Andrey Moiseev <o2g.org.ru@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Yangtao Li <frank.li@vivo.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
        Miloslav Trmac <mitr@volny.cz>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh@kernel.org>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Kalle Valo <kvalo@kernel.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Siarhei Volkau <lis8215@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Paolo Abeni <pabeni@redhat.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Chen Jun <chenjun102@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@pengutronix.de, patches@opensource.cirrus.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 00/52] input: Convert to platform remove callback
 returning void
Message-ID: <ZRhAx5oDFxJJkUIz@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <ZQ+jddG+UbuSD7pP@google.com>
 <20230924155057.e4k4ruv5iggbt6q6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230924155057.e4k4ruv5iggbt6q6@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

Sorry for the spotty responses.

On Sun, Sep 24, 2023 at 05:50:57PM +0200, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Sat, Sep 23, 2023 at 07:48:21PM -0700, Dmitry Torokhov wrote:
> > On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > this series converts all platform drivers below drivers/input to use
> > > remove_new. The motivation is to get rid of an integer return code
> > > that is (mostly) ignored by the platform driver core and error prone on
> > > the driver side.
> > > 
> > > See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > > returns no value") for an extended explanation and the eventual goal.
> > > 
> > > There are no interdependencies between the patches. As there are still
> > > quite a few drivers to convert, I'm happy about every patch that makes
> > > it in. So even if there is a merge conflict with one patch until you
> > > apply or a subject prefix is suboptimal, please apply the remainder of
> > > this series anyhow.
> > 
> > Applied the lot (fixing the i8042-sparcio patch subject), thank you!
> 
> Thanks. In the meantime I found out why my process failed here: I only
> fixed *.c, but this driver struct is defined in a header file
> i8042-sparcio.h.
> 
> This file is only included by drivers/input/serio/i8042.h which in turn
> is only included by drivers/input/serio/i8042.c. So there is only one
> instance created, but I'd call that unusual anyhow.

Right, i8042 is essentially a singleton, and what you see here is an
attempt to bolt OF onto a legacy driver that is largely predates the
current driver model. I wanted to clean it up, but it is still widely
used and I am hesitant to disturb it too much.

Thanks.

-- 
Dmitry
