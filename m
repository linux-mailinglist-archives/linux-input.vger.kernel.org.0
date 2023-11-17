Return-Path: <linux-input+bounces-88-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC17EEB4A
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 04:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF03C1C2085B
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 03:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9271146B1;
	Fri, 17 Nov 2023 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlF90bvE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F19AD4A;
	Thu, 16 Nov 2023 19:00:31 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-66d24ccc6f2so23788386d6.0;
        Thu, 16 Nov 2023 19:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700190031; x=1700794831; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cfh/n50sV9zDL7CpRsgoAkjALbUjhc6nk0SgI0MAzG8=;
        b=NlF90bvEH73dPaEZfsH2+uGwQi4zuEfkAm3wEsDVqy3U2TH/t9yyRCeo3CDBnIo2LQ
         cDukCVOuz0L2pMgLXTsWK5rfrahvnQMED71pzqG7ummZPO3mtaB0XNGYBoNu06N54yhE
         8KTeSWbYDmqVSYdFBtci14yl5P9atNsDf9uE64roeiFxgp4Buyz+YwTGMmk2ki8cOLa3
         YtpsVg7ATlrD6SRUP/8Y7esTD8SVhXqd4Z6Yvo+AXBSh0Q85z4AQVxMkutzK8ju98gts
         OE/E1OZsWq9SBHSZ/AHNRsaoMm5GZ4g+JmiprDK3ewLWaEJ3BTm0nqP0Mv4yXpsrq/ed
         qsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700190031; x=1700794831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfh/n50sV9zDL7CpRsgoAkjALbUjhc6nk0SgI0MAzG8=;
        b=AJ9mdmDyEOVkflu9hayjz6bTXzw01OcKxEc41CGWook+jo/gkVE7oUYLbcYbvCEF5c
         TvK1hA1JLL+ixH4RacAaYE8fp3GgJlDa3xai2beETseKXt2f4rZfQXY89gYUW7iBPJcL
         X7lvwyvxLdmifIgcfirBt2Jybr6GQ6JsOqmz+IqPBBdFLPhrKwg1EIAg/oEBaHkDdthv
         wfaTIwXUKxfeK/OvfYc9VGuuKVnjx+zpp6Dsz7Y+VPrp7G5dW4zDJb2J3HHY6oPSkQyB
         7jaO1WM+Su+5VItz+uzP5h3UK1KkSupsOyJlMkp5pu8XmlxE2IdLXqvUdGQQ0Ka4E1qG
         0pzw==
X-Gm-Message-State: AOJu0YwlHIbnFIlVF95ydOrXxV+2UfqDDBoFn7h0XwdLT7e+lWrTU5En
	JvBiQbyCp8ANM2QwsAmO9FE=
X-Google-Smtp-Source: AGHT+IFFvYGeUevkkm4iGUX82D5/wf+kjQ1tbxFALDK15kELTovdQXDsQi0snNEfVRxy812FA7AiAA==
X-Received: by 2002:ad4:5d47:0:b0:66d:303a:46bd with SMTP id jk7-20020ad45d47000000b0066d303a46bdmr7163090qvb.13.1700190030594;
        Thu, 16 Nov 2023 19:00:30 -0800 (PST)
Received: from google.com ([205.220.129.19])
        by smtp.gmail.com with ESMTPSA id rv13-20020a05620a688d00b0077a7d02cffbsm294058qkn.24.2023.11.16.19.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 19:00:30 -0800 (PST)
Date: Fri, 17 Nov 2023 02:59:44 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Valek - 2N <jiriv@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH v5 3/3] Input: cap11xx - remove unnecessary IRQ parsing
Message-ID: <ZVbWZXvzudWTFpBk@google.com>
References: <20231108155647.1812835-1-jiriv@axis.com>
 <20231108155647.1812835-4-jiriv@axis.com>
 <CAL_JsqL3veRuuDqWnZ+eUTP5Mvz5WffYktrBh6HqyARRThzmYQ@mail.gmail.com>
 <f2df3ba6-76d2-4e2e-9c7e-54f6a84464b7@axis.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2df3ba6-76d2-4e2e-9c7e-54f6a84464b7@axis.com>

On Thu, Nov 16, 2023 at 08:43:00AM +0100, Jiri Valek - 2N wrote:
> On 11/8/23 20:53, Rob Herring wrote:
> > On Wed, Nov 8, 2023 at 9:57 AM Jiri Valek - 2N <jiriv@axis.com> wrote:
> >>
> >> Separate IRQ parsing is not necessary, I2C core do the job.
> >>
> >> Signed-off-by: Jiri Valek - 2N <jiriv@axis.com>
> >> ---
> >>  drivers/input/keyboard/cap11xx.c | 10 ++--------
> >>  1 file changed, 2 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
> >> index 4711ea985627..ccca9936ef25 100644
> >> --- a/drivers/input/keyboard/cap11xx.c
> >> +++ b/drivers/input/keyboard/cap11xx.c
> >> @@ -518,7 +518,7 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
> >>         struct device *dev = &i2c_client->dev;
> >>         struct cap11xx_priv *priv;
> >>         const struct cap11xx_hw_model *cap;
> >> -       int i, error, irq;
> >> +       int i, error;
> >>         unsigned int val, rev;
> >>
> >>         if (id->driver_data >= ARRAY_SIZE(cap11xx_devices)) {
> >> @@ -624,13 +624,7 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
> >>         if (error)
> >>                 return error;
> >>
> >> -       irq = irq_of_parse_and_map(dev->of_node, 0);
> > 
> > Probably can drop the include of of_irq.h as well.
> Ack. Thanks for notice!

I replaced it with #include <of.h> and applied, thank you.

-- 
Dmitry

