Return-Path: <linux-input+bounces-4266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9B90133B
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 20:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8C39B21DCC
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 18:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9011CABA;
	Sat,  8 Jun 2024 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctwTgDsy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3846FC6;
	Sat,  8 Jun 2024 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717871342; cv=none; b=N17+8pYF5t4Mo5xZI6a8zHGBhoEdpXbsvXIYctEmMh3xlE3U/QLXITiTxA9MT0CWXdiU00wodQp89ykSWNJJviSsSYIysBTXOFiWmO/jKZTZ8ubJEzgq0Z6fk5JbP5w4LcTsw0oFX8b2/B3FBq2LfxhgZkkZZVqkleabcWXtwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717871342; c=relaxed/simple;
	bh=r72H5ZdNmR3C8f3b+3az13Jp1Z/mZ69OqWKI5POB724=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvfUobiO3VzwGoVXWacdW1SsGcOk0rLPplcaAt+NOArn6/8xcs41ei+d9vcs3d3LccHlB8vwrUsBriDBAajn24qRDW7f7UZinwKeoaDo6QsKdMDAqGhPYs7/hdpYd9CtzMbufWy8jhGOpnWJGn0/y9oOQejXeAoMq3cU2SSw/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctwTgDsy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4210aa00c94so27832745e9.1;
        Sat, 08 Jun 2024 11:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717871338; x=1718476138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YEtjOYlWexEgJJsvLgOBtWZTXzXSDRZuW01UHOrnf8=;
        b=ctwTgDsyVDzFj7B/BtBQDO1ALM1j7M5vYqfhS15Qg2olc3uKEiLyrumVBK+xtJ9yK8
         3wofSWOUwheC+OIMutPlMmIfDYCCovvLOMWyaqE8P+ECvvT99R3qS/o9A6co3g/CC+Ap
         9YYtXfbt3cUMvTRDjS0o9LOC5EsRuX0CBqdI40jnm15W/WrvcWTbmKe2ydE+SUzKw+SJ
         dc7Y2IY6gojhpdUxwTLlOCVJRZr3pn5NYhVwM1QtqGdeCsN6yThvmHW2hdGlF9M8Wj6M
         iUb5BkswlXCHIrGgrOdf7FmUsdgFh44hXwhDUgXbJASajA7rI5BMFGaFTdfy8MYN4W4i
         DZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717871338; x=1718476138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YEtjOYlWexEgJJsvLgOBtWZTXzXSDRZuW01UHOrnf8=;
        b=V/DxNDflyv2PNzAHdqQm3bRYHvkFyxQiFzaqrRwZfazeWTxZESuV0tO8uLKaspmaF6
         Jz//LwMskJC8nVrgvIf0PtNDVnlAkO1UCKK/m/E02/CUhq1hBDIGiY4QTZppi/795BBk
         sgjhQ2SGh4dHpXgpj3+mqt9qF3LKbjlPJ4Ev/qkmswdyUVvwYpliOZ23QXaxUpC0Dst/
         Zux7ThcuCcBlXu3JAC8nvFhE8xSj4T43MswdVdDxL1D7XbZEx29d/I91NuTyy+IMgB8G
         9rczKuWpsErgOKfkfCT0Lanq45Vg252gzBmjnKkrvWoIMcfdtBbIK8OOG7hgy3x6QiHR
         v6YA==
X-Forwarded-Encrypted: i=1; AJvYcCVsoOMxT4GwncXL/pmTAmidhcMYMx6bnWEUeQ88ZvhnEDzeos7G0jJgL/SMSm+cS+th0ncuoLENaD5s2AEFnU2dI8nbbgwi4l/1vvJCvzxlEnDov3Adve3tgL+DqbIZ7VK5ctY+WpGNg9o=
X-Gm-Message-State: AOJu0Yw4qT4b9MjlW8Yb7dTdNF7gugcwas+kN6TeYjXxXL00TqsSrnle
	WUFRTsDv3SZHsNCX8LcRaWNfnzvs5WmfZWJmIbmqzHCS9v+XFxxT
X-Google-Smtp-Source: AGHT+IHRfQalvrjhBk4LUAX34SPJH4ABuSUBsSWP6sRBAqfMjmJVtUVfXWNuiX/0tr5jtd7b5lbfCQ==
X-Received: by 2002:a05:600c:3503:b0:41a:ff7d:2473 with SMTP id 5b1f17b1804b1-421649e9f54mr45797205e9.4.1717871337946;
        Sat, 08 Jun 2024 11:28:57 -0700 (PDT)
Received: from fedora ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421602aa1adsm48851555e9.1.2024.06.08.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 11:28:57 -0700 (PDT)
Date: Sat, 8 Jun 2024 20:28:55 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Fabio Baltieri <fabiobaltieri@chromium.org>,
	Ivan Gorinov <linux-kernel@altimeter.info>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: avoid linking common code into multiple
 modules
Message-ID: <ZmSi5_-4mD4AaIJW@fedora>
References: <20240529094816.1859073-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529094816.1859073-1-arnd@kernel.org>

Hi Arnd,

On Wed, May 29, 2024 at 11:48:05AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The hid-uclogic-params.o and hid-uclogic-rdesc.o files are linked
> into both the driver module and the unit test, which triggers a
> W=1 warning:
> 
> scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-rdesc.o is added to multiple modules: hid-uclogic hid-uclogic-test
> scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-params.o is added to multiple modules: hid-uclogic hid-uclogic-test
> 
> Avoids this by moving these two files into a separate module
> that is used by the driver and the unit test.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have made patches for all such warnings in the tree, this is one I'm not
> sure about, maybe there is a better fix.
> ---
>  drivers/hid/Makefile             | 12 ++----
>  drivers/hid/hid-uclogic-params.c |  8 ++++
>  drivers/hid/hid-uclogic-rdesc.c  | 72 ++++++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index ce71b53ea6c5..864dfbae8ace 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -133,10 +133,8 @@ obj-$(CONFIG_HID_TOPSEED)	+= hid-topseed.o
>  obj-$(CONFIG_HID_TOPRE)	+= hid-topre.o
>  obj-$(CONFIG_HID_TWINHAN)	+= hid-twinhan.o
>  obj-$(CONFIG_HID_U2FZERO)	+= hid-u2fzero.o
> -hid-uclogic-objs		:= hid-uclogic-core.o \
> -				   hid-uclogic-rdesc.o \
> -				   hid-uclogic-params.o
> -obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
> +hid-uclogic-objs		:= hid-uclogic-core.o
> +obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o hid-uclogic-rdesc.o hid-uclogic-params.o
>  obj-$(CONFIG_HID_UDRAW_PS3)	+= hid-udraw-ps3.o
>  obj-$(CONFIG_HID_LED)		+= hid-led.o
>  obj-$(CONFIG_HID_XIAOMI)	+= hid-xiaomi.o
> @@ -154,10 +152,8 @@ obj-$(CONFIG_HID_WINWING)	+= hid-winwing.o
>  obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
>  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o
>  
> -hid-uclogic-test-objs		:= hid-uclogic-rdesc.o \
> -				   hid-uclogic-params.o \
> -				   hid-uclogic-rdesc-test.o
> -obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o
> +hid-uclogic-test-objs		:= hid-uclogic-rdesc-test.o
> +obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o hid-uclogic-params.o hid-uclogic-params.o
>  
>  obj-$(CONFIG_USB_HID)		+= usbhid/
>  obj-$(CONFIG_USB_MOUSE)		+= usbhid/

I tested your patch with:

	hid-uclogic-objs		:= hid-uclogic-core.o \
					   hid-uclogic-rdesc.o \
					   hid-uclogic-params.o
	obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
	[...]
	hid-uclogic-test-objs		:= hid-uclogic-rdesc-test.o
	obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic.o hid-uclogic-test.o

And I think it is a bit more clear and it looks like it does the trick
removing the warning.

Also, with that change only "EXPORT_SYMBOL_GPL(uclogic_rdesc_template_apply);"
is required. The other EXPORT_SYMBOL_GPL can be removed.

However, I'm not sure about what are the best practices using EXPORT_SYMBOL_GPL
and if it should be used for each function/data in the .h file. Maybe that's
why you added them.

Best wishes,
Jose

> diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
> index 5bab006ec165..97ae7e4f61e1 100644
> --- a/drivers/hid/hid-uclogic-params.c
> +++ b/drivers/hid/hid-uclogic-params.c
> @@ -133,6 +133,7 @@ void uclogic_params_hid_dbg(const struct hid_device *hdev,
>  	}
>  	hid_dbg(hdev, "}\n");
>  }
> +EXPORT_SYMBOL_GPL(uclogic_params_hid_dbg);
>  
>  /**
>   * uclogic_params_get_str_desc - retrieve a string descriptor from a HID
> @@ -660,6 +661,7 @@ void uclogic_params_cleanup(struct uclogic_params *params)
>  		memset(params, 0, sizeof(*params));
>  	}
>  }
> +EXPORT_SYMBOL_GPL(uclogic_params_cleanup);
>  
>  /**
>   * uclogic_params_get_desc() - Get a replacement report descriptor for a
> @@ -732,6 +734,7 @@ int uclogic_params_get_desc(const struct uclogic_params *params,
>  	kfree(desc);
>  	return rc;
>  }
> +EXPORT_SYMBOL_GPL(uclogic_params_get_desc);
>  
>  /**
>   * uclogic_params_init_invalid() - initialize tablet interface parameters,
> @@ -1859,7 +1862,12 @@ int uclogic_params_init(struct uclogic_params *params,
>  	uclogic_params_cleanup(&p);
>  	return rc;
>  }
> +EXPORT_SYMBOL_GPL(uclogic_params_init);
>  
>  #ifdef CONFIG_HID_KUNIT_TEST
>  #include "hid-uclogic-params-test.c"
>  #endif
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Nikolai Kondrashov");
> +MODULE_DESCRIPTION("HID driver for UC-Logic devices tablet initialization and parameter retrieval");
> diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
> index b6dfdf6356a6..d4f1ee79e0a1 100644
> --- a/drivers/hid/hid-uclogic-rdesc.c
> +++ b/drivers/hid/hid-uclogic-rdesc.c
> @@ -59,9 +59,11 @@ __u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp4030u_fixed_arr);
>  
>  const size_t uclogic_rdesc_wp4030u_fixed_size =
>  			sizeof(uclogic_rdesc_wp4030u_fixed_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp4030u_fixed_size);
>  
>  /* Fixed WP5540U report descriptor */
>  __u8 uclogic_rdesc_wp5540u_fixed_arr[] = {
> @@ -136,9 +138,11 @@ __u8 uclogic_rdesc_wp5540u_fixed_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp5540u_fixed_arr);
>  
>  const size_t uclogic_rdesc_wp5540u_fixed_size =
>  			sizeof(uclogic_rdesc_wp5540u_fixed_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp5540u_fixed_size);
>  
>  /* Fixed WP8060U report descriptor */
>  __u8 uclogic_rdesc_wp8060u_fixed_arr[] = {
> @@ -213,9 +217,11 @@ __u8 uclogic_rdesc_wp8060u_fixed_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp8060u_fixed_arr);
>  
>  const size_t uclogic_rdesc_wp8060u_fixed_size =
>  			sizeof(uclogic_rdesc_wp8060u_fixed_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp8060u_fixed_size);
>  
>  /* Fixed WP1062 report descriptor */
>  __u8 uclogic_rdesc_wp1062_fixed_arr[] = {
> @@ -261,9 +267,11 @@ __u8 uclogic_rdesc_wp1062_fixed_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp1062_fixed_arr);
>  
>  const size_t uclogic_rdesc_wp1062_fixed_size =
>  			sizeof(uclogic_rdesc_wp1062_fixed_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_wp1062_fixed_size);
>  
>  /* Fixed PF1209 report descriptor */
>  __u8 uclogic_rdesc_pf1209_fixed_arr[] = {
> @@ -338,9 +346,11 @@ __u8 uclogic_rdesc_pf1209_fixed_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_pf1209_fixed_arr);
>  
>  const size_t uclogic_rdesc_pf1209_fixed_size =
>  			sizeof(uclogic_rdesc_pf1209_fixed_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_pf1209_fixed_size);
>  
>  /* Fixed PID 0522 tablet report descriptor, interface 0 (stylus) */
>  __u8 uclogic_rdesc_twhl850_fixed0_arr[] = {
> @@ -384,9 +394,11 @@ __u8 uclogic_rdesc_twhl850_fixed0_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed0_arr);
>  
>  const size_t uclogic_rdesc_twhl850_fixed0_size =
>  			sizeof(uclogic_rdesc_twhl850_fixed0_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed0_size);
>  
>  /* Fixed PID 0522 tablet report descriptor, interface 1 (mouse) */
>  __u8 uclogic_rdesc_twhl850_fixed1_arr[] = {
> @@ -424,9 +436,11 @@ __u8 uclogic_rdesc_twhl850_fixed1_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed1_arr);
>  
>  const size_t uclogic_rdesc_twhl850_fixed1_size =
>  			sizeof(uclogic_rdesc_twhl850_fixed1_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed1_size);
>  
>  /* Fixed PID 0522 tablet report descriptor, interface 2 (frame buttons) */
>  __u8 uclogic_rdesc_twhl850_fixed2_arr[] = {
> @@ -450,9 +464,11 @@ __u8 uclogic_rdesc_twhl850_fixed2_arr[] = {
>  	0x80,               /*      Input,                          */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed2_arr);
>  
>  const size_t uclogic_rdesc_twhl850_fixed2_size =
>  			sizeof(uclogic_rdesc_twhl850_fixed2_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed2_size);
>  
>  /* Fixed TWHA60 report descriptor, interface 0 (stylus) */
>  __u8 uclogic_rdesc_twha60_fixed0_arr[] = {
> @@ -499,9 +515,11 @@ __u8 uclogic_rdesc_twha60_fixed0_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed0_arr);
>  
>  const size_t uclogic_rdesc_twha60_fixed0_size =
>  			sizeof(uclogic_rdesc_twha60_fixed0_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed0_size);
>  
>  /* Fixed TWHA60 report descriptor, interface 1 (frame buttons) */
>  __u8 uclogic_rdesc_twha60_fixed1_arr[] = {
> @@ -527,9 +545,11 @@ __u8 uclogic_rdesc_twha60_fixed1_arr[] = {
>  	0x81, 0x01, /*      Input (Constant),       */
>  	0xC0        /*  End Collection              */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed1_arr);
>  
>  const size_t uclogic_rdesc_twha60_fixed1_size =
>  			sizeof(uclogic_rdesc_twha60_fixed1_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed1_size);
>  
>  /* Fixed report descriptor template for (tweaked) v1 pen reports */
>  const __u8 uclogic_rdesc_v1_pen_template_arr[] = {
> @@ -581,9 +601,11 @@ const __u8 uclogic_rdesc_v1_pen_template_arr[] = {
>  	0xC0,                   /*      End Collection,                     */
>  	0xC0                    /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_pen_template_arr);
>  
>  const size_t uclogic_rdesc_v1_pen_template_size =
>  			sizeof(uclogic_rdesc_v1_pen_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_pen_template_size);
>  
>  /* Fixed report descriptor template for (tweaked) v2 pen reports */
>  const __u8 uclogic_rdesc_v2_pen_template_arr[] = {
> @@ -647,9 +669,11 @@ const __u8 uclogic_rdesc_v2_pen_template_arr[] = {
>  	0xC0,                   /*      End Collection,                     */
>  	0xC0                    /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_pen_template_arr);
>  
>  const size_t uclogic_rdesc_v2_pen_template_size =
>  			sizeof(uclogic_rdesc_v2_pen_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_pen_template_size);
>  
>  /*
>   * Expand to the contents of a generic frame buttons report descriptor.
> @@ -702,16 +726,22 @@ const size_t uclogic_rdesc_v2_pen_template_size =
>  const __u8 uclogic_rdesc_v1_frame_arr[] = {
>  	UCLOGIC_RDESC_FRAME_BUTTONS_BYTES(UCLOGIC_RDESC_V1_FRAME_ID, 8)
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_frame_arr);
> +
>  const size_t uclogic_rdesc_v1_frame_size =
>  			sizeof(uclogic_rdesc_v1_frame_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_frame_size);
>  
>  /* Fixed report descriptor for (tweaked) v2 frame button reports */
>  const __u8 uclogic_rdesc_v2_frame_buttons_arr[] = {
>  	UCLOGIC_RDESC_FRAME_BUTTONS_BYTES(UCLOGIC_RDESC_V2_FRAME_BUTTONS_ID,
>  					  12)
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_buttons_arr);
> +
>  const size_t uclogic_rdesc_v2_frame_buttons_size =
>  			sizeof(uclogic_rdesc_v2_frame_buttons_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_buttons_size);
>  
>  /* Fixed report descriptor for (tweaked) v2 frame touch ring reports */
>  const __u8 uclogic_rdesc_v2_frame_touch_ring_arr[] = {
> @@ -758,8 +788,11 @@ const __u8 uclogic_rdesc_v2_frame_touch_ring_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_ring_arr);
> +
>  const size_t uclogic_rdesc_v2_frame_touch_ring_size =
>  			sizeof(uclogic_rdesc_v2_frame_touch_ring_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_ring_size);
>  
>  /* Fixed report descriptor for (tweaked) v2 frame touch strip reports */
>  const __u8 uclogic_rdesc_v2_frame_touch_strip_arr[] = {
> @@ -806,8 +839,11 @@ const __u8 uclogic_rdesc_v2_frame_touch_strip_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_strip_arr);
> +
>  const size_t uclogic_rdesc_v2_frame_touch_strip_size =
>  			sizeof(uclogic_rdesc_v2_frame_touch_strip_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_strip_size);
>  
>  /* Fixed report descriptor for (tweaked) v2 frame dial reports */
>  const __u8 uclogic_rdesc_v2_frame_dial_arr[] = {
> @@ -856,14 +892,22 @@ const __u8 uclogic_rdesc_v2_frame_dial_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_dial_arr);
> +
>  const size_t uclogic_rdesc_v2_frame_dial_size =
>  			sizeof(uclogic_rdesc_v2_frame_dial_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_dial_size);
>  
>  const __u8 uclogic_ugee_v2_probe_arr[] = {
>  	0x02, 0xb0, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
> +EXPORT_SYMBOL_GPL(uclogic_ugee_v2_probe_arr);
> +
>  const size_t uclogic_ugee_v2_probe_size = sizeof(uclogic_ugee_v2_probe_arr);
> +EXPORT_SYMBOL_GPL(uclogic_ugee_v2_probe_size);
> +
>  const int uclogic_ugee_v2_probe_endpoint = 0x03;
> +EXPORT_SYMBOL_GPL(uclogic_ugee_v2_probe_endpoint);
>  
>  /* Fixed report descriptor template for UGEE v2 pen reports */
>  const __u8 uclogic_rdesc_ugee_v2_pen_template_arr[] = {
> @@ -935,8 +979,11 @@ const __u8 uclogic_rdesc_ugee_v2_pen_template_arr[] = {
>  	0xc0,               /*      End Collection,                     */
>  	0xc0,               /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_pen_template_arr);
> +
>  const size_t uclogic_rdesc_ugee_v2_pen_template_size =
>  			sizeof(uclogic_rdesc_ugee_v2_pen_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_pen_template_size);
>  
>  /* Fixed report descriptor template for UGEE v2 frame reports (buttons only) */
>  const __u8 uclogic_rdesc_ugee_v2_frame_btn_template_arr[] = {
> @@ -964,8 +1011,11 @@ const __u8 uclogic_rdesc_ugee_v2_frame_btn_template_arr[] = {
>  	0xC0,               /*      End Collection,                     */
>  	0xC0                /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_btn_template_arr);
> +
>  const size_t uclogic_rdesc_ugee_v2_frame_btn_template_size =
>  			sizeof(uclogic_rdesc_ugee_v2_frame_btn_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_btn_template_size);
>  
>  /* Fixed report descriptor template for UGEE v2 frame reports (dial) */
>  const __u8 uclogic_rdesc_ugee_v2_frame_dial_template_arr[] = {
> @@ -1004,8 +1054,11 @@ const __u8 uclogic_rdesc_ugee_v2_frame_dial_template_arr[] = {
>  	0xC0,               /*      End Collection,                     */
>  	0xC0                /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_dial_template_arr);
> +
>  const size_t uclogic_rdesc_ugee_v2_frame_dial_template_size =
>  			sizeof(uclogic_rdesc_ugee_v2_frame_dial_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_dial_template_size);
>  
>  /* Fixed report descriptor template for UGEE v2 frame reports (mouse) */
>  const __u8 uclogic_rdesc_ugee_v2_frame_mouse_template_arr[] = {
> @@ -1038,8 +1091,11 @@ const __u8 uclogic_rdesc_ugee_v2_frame_mouse_template_arr[] = {
>  	0xC0,               /*      End Collection,                     */
>  	0xC0                /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_mouse_template_arr);
> +
>  const size_t uclogic_rdesc_ugee_v2_frame_mouse_template_size =
>  			sizeof(uclogic_rdesc_ugee_v2_frame_mouse_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_mouse_template_size);
>  
>  /* Fixed report descriptor template for UGEE v2 battery reports */
>  const __u8 uclogic_rdesc_ugee_v2_battery_template_arr[] = {
> @@ -1072,8 +1128,11 @@ const __u8 uclogic_rdesc_ugee_v2_battery_template_arr[] = {
>  	0x81, 0x01,         /*      Input (Constant),                   */
>  	0xC0                /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_battery_template_arr);
> +
>  const size_t uclogic_rdesc_ugee_v2_battery_template_size =
>  			sizeof(uclogic_rdesc_ugee_v2_battery_template_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_battery_template_size);
>  
>  /* Fixed report descriptor for Ugee EX07 frame */
>  const __u8 uclogic_rdesc_ugee_ex07_frame_arr[] = {
> @@ -1099,8 +1158,11 @@ const __u8 uclogic_rdesc_ugee_ex07_frame_arr[] = {
>  	0xC0,                   /*      End Collection,                     */
>  	0xC0                    /*  End Collection                          */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_ex07_frame_arr);
> +
>  const size_t uclogic_rdesc_ugee_ex07_frame_size =
>  			sizeof(uclogic_rdesc_ugee_ex07_frame_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_ex07_frame_size);
>  
>  /* Fixed report descriptor for Ugee G5 frame controls */
>  const __u8 uclogic_rdesc_ugee_g5_frame_arr[] = {
> @@ -1153,8 +1215,10 @@ const __u8 uclogic_rdesc_ugee_g5_frame_arr[] = {
>  	0xC0,               /*      End Collection,                 */
>  	0xC0                /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_g5_frame_arr);
>  const size_t uclogic_rdesc_ugee_g5_frame_size =
>  			sizeof(uclogic_rdesc_ugee_g5_frame_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_g5_frame_size);
>  
>  /* Fixed report descriptor for XP-Pen Deco 01 frame controls */
>  const __u8 uclogic_rdesc_xppen_deco01_frame_arr[] = {
> @@ -1187,9 +1251,11 @@ const __u8 uclogic_rdesc_xppen_deco01_frame_arr[] = {
>  	0xC0,       /*      End Collection,                 */
>  	0xC0        /*  End Collection                      */
>  };
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_xppen_deco01_frame_arr);
>  
>  const size_t uclogic_rdesc_xppen_deco01_frame_size =
>  			sizeof(uclogic_rdesc_xppen_deco01_frame_arr);
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_xppen_deco01_frame_size);
>  
>  /**
>   * uclogic_rdesc_template_apply() - apply report descriptor parameters to a
> @@ -1242,3 +1308,9 @@ __u8 *uclogic_rdesc_template_apply(const __u8 *template_ptr,
>  
>  	return rdesc_ptr;
>  }
> +EXPORT_SYMBOL_GPL(uclogic_rdesc_template_apply);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Martin Rusko");
> +MODULE_AUTHOR("Nikolai Kondrashov");
> +MODULE_DESCRIPTION("HID driver for UC-Logic devices original and fixed report descriptors");
> -- 
> 2.39.2
> 

