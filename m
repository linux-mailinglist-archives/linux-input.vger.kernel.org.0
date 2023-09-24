Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2297AC653
	for <lists+linux-input@lfdr.de>; Sun, 24 Sep 2023 04:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjIXCsf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Sep 2023 22:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXCse (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Sep 2023 22:48:34 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B6710C;
        Sat, 23 Sep 2023 19:48:28 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a9b41ffe12so2930304b6e.3;
        Sat, 23 Sep 2023 19:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695523707; x=1696128507; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqzUc5Ca0TLk51f9yoIdIBC/lxIeRKZcx3CKiVIdjzQ=;
        b=clQ6r+U5RZKf7itdsJvyPhHHAJwrVPpKDA3wDQ9D65ul0YtxT6+tPIMA/KhdN3CqfV
         ebvax3ydtqD7Ufp5WVjyloX1jrMSI+pqhmxKs5PdMGFNQmiVCmdxER48adw9y6FUE0O1
         QfxskrNVNzupLi02r5XnX/frnyAr7eddSBbA60eNz1l8KCo9Ig6NY9ZR5xjaJAsXA88Q
         SEwu8ivlXF7kI8fg+tQesH8GDQtUA3lRzhWqQoMO2jiAskfMeR67kL49t6LqCoMbo/3+
         Cb7iaVNABpaNWYEk5D4rB85Q1cV2051cZrvxpQDUOAqMnLunrhzF1yiX38hYEnk1SQ3r
         5Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695523707; x=1696128507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqzUc5Ca0TLk51f9yoIdIBC/lxIeRKZcx3CKiVIdjzQ=;
        b=Ho9DHMxFTS3sUuS7Ljzwormq44XfxFm7xommIy2uKTmI8CtMwTM9yfQ0696SCnGWnR
         zscRxEvAnZ8mZ2TJfx6/KMw2wwvlHBk+7Kz+rF6S5e+lc600sQM+/fqbEFk0p6SeIGNg
         JqXKGmKRw2kBvEJqoKJbzibPRj69Y8G+thUh0Iz4mPJWjUDP4B7NZt7vKiwbM4fNLSog
         s18/b8IDy+qylizmZTtQMw1S6QcvLc5hJp4doZpzsTyTw9dL0LRBRIIFU6PHyTBl1XCo
         +3VoHVlVQnb4y049pIQD+MA+dv6GA9ZoBkZUwyvfGf9xu3IwfS6ePsr2WnWw1HfsQiE7
         HaUw==
X-Gm-Message-State: AOJu0Yz53kfqBKm57VR31wYYdFAII1LX4ec/bZ/Cy9c2oqgPmwgVJ2b+
        prhDOuefjVdJLKPmFfsimeQ=
X-Google-Smtp-Source: AGHT+IFsJQ1vfOpuk2IaQRPrCUNaPYRrBLQFBvu86Kz8YHQlL7Jz8q3Be91hgZK6q2QTnHVxxVtMXg==
X-Received: by 2002:a05:6808:15a5:b0:3ad:f86a:877b with SMTP id t37-20020a05680815a500b003adf86a877bmr5344294oiw.23.1695523707158;
        Sat, 23 Sep 2023 19:48:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3d36:f550:baf4:ae75])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902748100b001bbc8d65de0sm6050106pll.67.2023.09.23.19.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 19:48:26 -0700 (PDT)
Date:   Sat, 23 Sep 2023 19:48:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
        chrome-platform@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Jeff LaBundy <jeff@labundy.com>, Rob Herring <robh@kernel.org>,
        Siarhei Volkau <lis8215@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Yangtao Li <frank.li@vivo.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Support Opensource <support.opensource@diasemi.com>,
        Andrey Moiseev <o2g.org.ru@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Miloslav Trmac <mitr@volny.cz>, patches@opensource.cirrus.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Liang He <windhl@126.com>, Chen Jun <chenjun102@huawei.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-sunxi@lists.linux.dev, Michal Simek <michal.simek@amd.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 00/52] input: Convert to platform remove callback
 returning void
Message-ID: <ZQ+jddG+UbuSD7pP@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/input to use
> remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply or a subject prefix is suboptimal, please apply the remainder of
> this series anyhow.

Applied the lot (fixing the i8042-sparcio patch subject), thank you!

-- 
Dmitry
