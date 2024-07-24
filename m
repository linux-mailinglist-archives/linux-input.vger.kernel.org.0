Return-Path: <linux-input+bounces-5141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18293B68A
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 20:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A3A2B23157
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 18:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C55E160783;
	Wed, 24 Jul 2024 18:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6ZYWeGe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C515F33A;
	Wed, 24 Jul 2024 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845293; cv=none; b=kjF5NPw+T/Ti6ENhHUSFAAWqksUOU8aGcU6eohuwesfsToX6ezRNdanwGgebP3mt71ZBCbIQU+bD1FZbyNhOJoN1ykQF2bhvLdkS0yQvuQatX55PvINz74y5/GmAT/9v02UsqoQ/winlI/2BtiPw9l4NNiOjr/ckDHSdr5VKaJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845293; c=relaxed/simple;
	bh=AchHhKwoH2XTRDncv3aZ9DVHgH7DNtyJRQ7cNb7zWX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnJPmF5oGaMXa30idDkBTWoSXvh0C4wRSwV4Dyp+kqB+rpd0bm9RR9etkixHG1O3OxNg4guf+ke2ehdsNLzX+WgPnAL22KE5XtGuCsNm4t5AYSEWp7uC4RbMFKKxk+brvRej1InsXwG5xIjckDQeRBNy5/VsetfHc9qmID7C4Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6ZYWeGe; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d2b27c115so76632b3a.2;
        Wed, 24 Jul 2024 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721845291; x=1722450091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7WCpmXa82zyOZ922g0iRuHBkONYRB7p6kOaLY9TSJIg=;
        b=Y6ZYWeGeYaocy9X0UDnjOGnPkSQfkGP7VL+DYFuh8vhCqEXRU5iGNUfCNtmzqyY1fB
         cjHtBBHE/3ljpviXj6ElzcK0xVb1KbPfrTR4w8CF+5a9LXyKPgnytspeuogDYezqqMBR
         E2Fsud8NxJP9HNXIKlB1J60EoY3k3cWEJjtQCcMKvXi4bpJIctCzH5fmoZl/IGR9os7r
         ajl8+Q+4lVWx6BdvOJ55TVK1M4ak/p34ZXvCKkN3T5ISjWsYaDctI7pZWma7rJIYrOvm
         8Yi/6CzWr1QM0R41hss12nC6EyVA7yXnq2zup0XdIPuoIudhoH6v5IQVaeblIc+/gPD8
         F0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721845291; x=1722450091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WCpmXa82zyOZ922g0iRuHBkONYRB7p6kOaLY9TSJIg=;
        b=Pily2R65LY1Ndi3lfLyzu71tTJgQDZzND2XhthuvJ4sU8QVomNc6hb9Gz80AgHVHcZ
         tDcD0XDtXREQq14WdrYvYhHOzwS2MUFQLXR3KwXaQ/qxbsOhX1QWAaZHrgRQYiliaGJ6
         Bkv31HYqzjcSuZyo0UOeBUCKjRaf/Pca3QGKFUceVuwy6RmaullSmss6vuTIkqiDKliQ
         yGPbuiVjVWFD/ITrpAzWrPPX8oZoeW1BTiii0K0QZAdvsOPHq3SKONXIjYuJ+hNWR9pO
         kR/2jNhpP6mnEcf5OPfhnhhj1opp/cSuZXhtb50GGAD8tPoIUiFDuchI4kIXjW1ls9v/
         580A==
X-Forwarded-Encrypted: i=1; AJvYcCUYh20wfzAXrrBtZQUhBe17UdsCfLpmRj7hYVlrLZsNQ7SOBaXmzuZCswy+cZs1/MVaJNjpo+hKFL6Ntm3VbxpsgO10p8ImEf8nnuHMz5AFEL7hIysRpYhjXj/Oodudc324+VkgMBhcPT4=
X-Gm-Message-State: AOJu0YxQwLKEDqCZ33nqEtkg/FrrvNEuQfVpWXYJpzqFNf6qh7p8qXFX
	TsUzqyjXkhSh8ttlgq5I1wS5Bl3h3/aueUBzfh7WNfJ8HN1jjzFrHfxX0g==
X-Google-Smtp-Source: AGHT+IHbXJnA2o0kEdtq8KjKxSCdIUUIOh5dEi8uNKi3kPgDUGk1zRWNY81M+lRRC8/X2Nrwwr7hGg==
X-Received: by 2002:a05:6a00:6f61:b0:707:ffa4:de3f with SMTP id d2e1a72fcca58-70eaa8c59a2mr414328b3a.17.1721845291027;
        Wed, 24 Jul 2024 11:21:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c2d6:b5c3:537e:3830])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1a09df58sm6258957b3a.112.2024.07.24.11.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:21:30 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:21:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Nitin Garg <nitin.garg@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] input: imx_sc_key: Enable wakeup according to dts
 property wakeup-source
Message-ID: <ZqFGJwb-0MU_GP28@google.com>
References: <20240719152259.760457-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719152259.760457-1-Frank.Li@nxp.com>

Hi Frank,

On Fri, Jul 19, 2024 at 11:22:58AM -0400, Frank Li wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> Enable default wakeup according to dts property 'wakeup-source'.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Nitin Garg <nitin.garg@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - change int to bool
> - move of_property_read_bool() just before device_init_wakeup()
> - drop !!
> ---
>  drivers/input/keyboard/imx_sc_key.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> index d18839f1f4f60..fc1492088b645 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -110,8 +110,10 @@ static void imx_sc_key_action(void *data)
>  
>  static int imx_sc_key_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct imx_key_drv_data *priv;
>  	struct input_dev *input;
> +	bool wakeup;
>  	int error;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -151,6 +153,9 @@ static int imx_sc_key_probe(struct platform_device *pdev)
>  	priv->input = input;
>  	platform_set_drvdata(pdev, priv);
>  
> +	wakeup = of_property_read_bool(np, "wakeup-source");

The driver uses generic device properties, why do you use OF-specific
variant here?

> +	device_init_wakeup(&pdev->dev, wakeup);
> +

How does this actually work? Doesn't the call directly below
unconditionally configures button as a wakeup source?

>  	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
>  					 true);
>  	if (error) {

Thanks.

-- 
Dmitry

