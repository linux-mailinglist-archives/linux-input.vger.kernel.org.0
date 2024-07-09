Return-Path: <linux-input+bounces-4912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C692AD33
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 02:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76B711F222B1
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 00:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BD01EA80;
	Tue,  9 Jul 2024 00:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2Xf+Bbc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BF4A05;
	Tue,  9 Jul 2024 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720485854; cv=none; b=chuoGWPdR/Y9Ev6I22jJ9MHv0IzLixg1QRWm8MGvduI+ze0wgnl0cZNeLDaIcmKBTe7mPQ8MeePH+asCmT5sSsmV1+n7PHel4w/qJF0RZZzUONqnQW9SDbUr3rxKO0xo70DIiMKtXVOEljtRuV3bksPT0uKKSZrZhFHpCvi7N1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720485854; c=relaxed/simple;
	bh=tpbHRBh4d+0IiY2NfwjMpLqsvd+S+0x5OU+TSwfJSrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKca37Fofp2cpXjGzDRK5pcGr7eqQAaOBMcfoicxu6Shc3fpP6XDhZE4nV8ERkds8qZ7IB7pPOMKtxC5DmbhzdW/3Q9iwIHO5HLp5iKogjpd5IUMNRkB7smposSZFm8mS4ktUllwLgzOLNkHb7Q+3WC1puWCqAzDkp7TucjYPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2Xf+Bbc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70af48692bcso2797220b3a.1;
        Mon, 08 Jul 2024 17:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720485852; x=1721090652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6oekEBsNfcqTY5UwTmkOZY/H/imciLbC6YXve9TKW5A=;
        b=c2Xf+BbcnkJlmORHWN37ErtrsXyPuEn9rj8gKl7BPu/A+fKZH9i0Ylj8XBAg9dvz/C
         YkHtULGGPIr2jkJI6hVcGEqEpzevzQxMsQ8aryIpR8fqXAXhlz3VXbzLI3dIH4fh5NWc
         DX96lET8crC3egw4vCRqjIhMjSbcsxNKvhW+R6s41bX5CkSaq1yylZZeBNAegGsimTZ+
         vbYmo1zYhyCS3nVHK7Pm/cxE9ePS65a0uXOXSoCdD6rVUnhQp/G1xGHfh8qh/vzxmWUX
         bcGaU9MvLLfKVnhCu8LARzUbOT1O6/UpRTTbrWC4TCn7HPgyJ79aLSpBLR6zhsZbsBxL
         Ou3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720485852; x=1721090652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oekEBsNfcqTY5UwTmkOZY/H/imciLbC6YXve9TKW5A=;
        b=fXTpt80rV+yCSNzCdS6jlLx2LSjbaL101iptdyIQ718tCCIkyXXEssIAGjIDuOR8zl
         YESbwdof8oIWu2QKqJjiGn8EROxUSPlvGfppuCmM6cn6VVS83ZuSDSxrtgyEITkfScsz
         BXs55xTXMvQdpMOPhlMYyulSbNdLtM2biGiNdWsZuKu/rksnI/trRSSKiqBUMkuDmAPO
         RChlwdkZQg6P8iIlW+i/wE9MJfFkEhGwkAS0IbCMgA9c6NBtaq74fH5BGRvjBicP73T/
         MWsGUEAuVZ5xMKEvXBOzPfFwH9desJhx7BS/gAIsbkUuxu1t/vHwiM25sKUiOoOv/TZd
         BpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVanyEZVDq815mYTg4ZVqejVdmlzAQ91LD9LgNLBsm/t3GkiQYSSVYxyxTDZxnIAygeJ/JGYVGzLg8G8jTLydbRdehfXT4Zx4EIYJvndgNGbRVKDOo6qprepuZql9xn5VRkE0KfxNlpD63L44Nw7RjT+FGNyZzoEMlzHPDUDmu6h+NwC+BF
X-Gm-Message-State: AOJu0Yzf3GByK9jK7snAOEXiPAKlZ3a8E6ZOmdQceoq9LWsDq5WhoMvX
	5q16MPEDm9SzCmRRVwHYglELtWWWzHFrQ+DcGGFQPY2HonFIjdMe
X-Google-Smtp-Source: AGHT+IESLDsxuQJzQb+WmmouNAV6ruO9FmYiZwrQnxfT4qcZ9DD6ZoTCwxGD0gsFfb0C6uWhixSnAg==
X-Received: by 2002:a05:6a21:1a7:b0:1c2:8d97:563f with SMTP id adf61e73a8af0-1c298205e72mr1270108637.8.1720485851861;
        Mon, 08 Jul 2024 17:44:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:922a:af36:b3d9:2eac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab6c92sm4445585ad.154.2024.07.08.17.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:44:11 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:44:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastian Hecht <hechtb@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v10 4/4] Input: st1232 - add touch overlays handling
Message-ID: <ZoyH2KiYn-tHu8w2@google.com>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
 <20240626-feature-ts_virtobj_patch-v10-4-873ad79bb2c9@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-feature-ts_virtobj_patch-v10-4-873ad79bb2c9@wolfvision.net>

Hi Javier,

On Wed, Jun 26, 2024 at 11:56:16AM +0200, Javier Carrasco wrote:
> Use touch-overlay to support overlay objects such as buttons and a
> resized frame defined in the device tree.
> 
> A key event will be generated if the coordinates of a touch event are
> within the area defined by the button properties.
> 
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/input/touchscreen/st1232.c | 48 +++++++++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
> index 6475084aee1b..4fa31447dbc1 100644
> --- a/drivers/input/touchscreen/st1232.c
> +++ b/drivers/input/touchscreen/st1232.c
> @@ -22,6 +22,7 @@
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/input/touch-overlay.h>
>  
>  #define ST1232_TS_NAME	"st1232-ts"
>  #define ST1633_TS_NAME	"st1633-ts"
> @@ -57,6 +58,7 @@ struct st1232_ts_data {
>  	struct dev_pm_qos_request low_latency_req;
>  	struct gpio_desc *reset_gpio;
>  	const struct st_chip_info *chip_info;
> +	struct list_head touch_overlay_list;
>  	int read_buf_len;
>  	u8 *read_buf;
>  };
> @@ -138,14 +140,20 @@ static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
>  
>  	for (i = 0; i < ts->chip_info->max_fingers; i++) {
>  		u8 *buf = &ts->read_buf[i * 4];
> +		bool contact = buf[0] & BIT(7);
> +		unsigned int x, y;
>  
> -		if (buf[0] & BIT(7)) {
> -			unsigned int x = ((buf[0] & 0x70) << 4) | buf[1];
> -			unsigned int y = ((buf[0] & 0x07) << 8) | buf[2];
> -
> -			touchscreen_set_mt_pos(&pos[n_contacts],
> -					       &ts->prop, x, y);
> +		if (contact) {
> +			x = ((buf[0] & 0x70) << 4) | buf[1];
> +			y = ((buf[0] & 0x07) << 8) | buf[2];
> +		}
> +		if (touch_overlay_process_event(&ts->touch_overlay_list, input,
> +						contact ? &x : NULL,
> +						contact ? &y : NULL, i))
> +			continue;

So here is the exact issue I was talking about: you are using index of
the contact as a slot, which assumes that the device maintains position
of contacts in the overall event stream. However the driver uses input
core to track and assign slots (see calls to touchscreen_set_mt_pos()
and input_mt_assign_slots() below), which suggest that the touch
controller may reorder positions as needed.

Thanks.

-- 
Dmitry

