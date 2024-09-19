Return-Path: <linux-input+bounces-6612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5E97CB27
	for <lists+linux-input@lfdr.de>; Thu, 19 Sep 2024 16:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7301F24702
	for <lists+linux-input@lfdr.de>; Thu, 19 Sep 2024 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB9019D8BB;
	Thu, 19 Sep 2024 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIN+eXj3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716019B3CB;
	Thu, 19 Sep 2024 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726757152; cv=none; b=LplxYmPe0RACyOjPMyN+o4pwQ5+wydXhd+V4iPzB8WK6JIlyfh2Pe40Gn6woHdS4HgSQaazqjVElnKqlhYYyBS3HLuw5bfxrcZdmABB5VV/98VJPG8JYmPLdEpO8wMT65PDRQR/hjt+cJXrUycx/bCcbudTJ3RWn38VDC5kCisE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726757152; c=relaxed/simple;
	bh=pSfwgrTPvnmFiOqh3pT2jvWaxAtgqdoC3kyn+7ZtUTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeHlKMB8g8G4sSZG8/m6oyLQVpeeWl9jeAE3Abykn8+sQMR45Km6+Yb1TQg8l+uRV/gmpyAbx2yK5/UpDDh3C2mJGjwXc/ozqT8INdBh+KjCVSGjWJd8Fswofp1AVJGQ8v13j2zyMr/e3bvx7LryyrwhGdsGmmxhETxEu82qbV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIN+eXj3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so377815266b.1;
        Thu, 19 Sep 2024 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726757149; x=1727361949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BnMoVwbaYU2xar7OIpkgN7D8RCu0vLhUDD2HtUB2qh8=;
        b=VIN+eXj3A8D5YmDnnpmZew0H7vY26qsBSiDXGwCUMED0l4+ql96tPClGXViE/ErO4i
         H0WVJg4Qv3cNaIyiTDqL51bsCx2b0vQZ1fiG+mIcXcOmWKtd3O+FMmKLk8IZY2109BRn
         COzPea2TPTeHdp8O3JJm+irgacB0RQ6LE2nSLl+oTlVUN3Ojz6/w8geAqW0dvgnrH3xa
         XRSpn1q9P9SELy1rvWaUvVXqMGAFJ9UxDtQnFek3dhE6lnyQ48jTK3KUj5ZkDp4R1heT
         P+nc1iSkz1aKIHGMsxhA1VGb5iFrGRxdD79knJXXXpr9MgTQmzY5hOF0aZkiB2t7qZfd
         izmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726757149; x=1727361949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnMoVwbaYU2xar7OIpkgN7D8RCu0vLhUDD2HtUB2qh8=;
        b=CBjGOT7iozG47qZWRpEmqi3BRQxENjCaCj3Ctzr0s9HRCYrh2vu4DD50EYzfVmGMBe
         NsaJrQ7CEcm0xQbVcjupq/XM1A0JygecC/1+HhpdO8DJFkSNEoWAb++2hCe7V9CendFg
         fvAJYZLAyafjY/y0j/RNhOWu6TYZlHzir776eDKY2twxjXAb8ftHjAXI12jRvrNHWAeh
         QCTj5VkshU5moGy83tv2jQkvgnRdq0XuywVUSi7NVWuLLeuulBr6aKEwvFVZcbJ476Sl
         xe7d3WP4Td/MQxaHNhf098+akBqZZz1/gDP6yteMQ4N0TOwD8w4YG+QUhswGCVuRWeWU
         7qwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpesHG5sGbzrYal8yQVBw6LcxS72HAjM0yICluCEwW6qAXIXjt1IitLEfnOnrAy55gMeGgIhGjRfbQ4ela@vger.kernel.org, AJvYcCXooovU9MVh3JvfsuKY0jNVa+BQ9RdJz7iqDPS9hHRzucelj5aLSUdqoo8MLCqr8ZlwCcgjTooykeOiJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJefytcZKlgoe+AF9vVX1cIsz/5SFPOSXU8dWJ53oY9CQOt9XJ
	BN0fZVys9+IXInSRXhWK8cUs2QwMKx14wli9Sn0SlKyqmKrAa54a
X-Google-Smtp-Source: AGHT+IEvFr3SE6FxalseTQjkOWlEA8ju3/yO+4QAFrVm7xyZgf7fPTziPJ5TPH6keQrARIAI39garw==
X-Received: by 2002:a17:907:3da0:b0:a8d:2bc7:6331 with SMTP id a640c23a62f3a-a90c1e4e209mr357428366b.27.1726757148347;
        Thu, 19 Sep 2024 07:45:48 -0700 (PDT)
Received: from google.com ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f43d2sm735326966b.87.2024.09.19.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:45:47 -0700 (PDT)
Date: Thu, 19 Sep 2024 14:45:45 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Denis Arefev <arefev@swemel.ru>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5/10] Input: adp5588-keys - added a check key_val
Message-ID: <Zuw5GZ2k3T-JKhHK@google.com>
References: <20240919142914.100609-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919142914.100609-1-arefev@swemel.ru>

Hi Denis,

On Thu, Sep 19, 2024 at 05:29:14PM +0300, Denis Arefev wrote:
> No upstream commit exists for this commit.

Sorry, what does this mean?

> 
> If the adp5588_read function returns 0, then there will be an
> overflow of the kpad->keycode[key_val - 1] buffer.
> 
> If the adp5588_read function returns a negative value, then the
> logic is broken - the wrong value is used as an index of
> the kpad->keycode array.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 69a4af606ed4 ("Input: adp5588-keys - support GPI events for ADP5588 devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/input/keyboard/adp5588-keys.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
> index 90a59b973d00..19be8054eb5f 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -272,6 +272,8 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
>  		int key = adp5588_read(kpad->client, Key_EVENTA + i);
>  		int key_val = key & KEY_EV_MASK;
>  
> +		if (key_val <= 0)
> +			continue;

We should be checking the original value (key) and not masked value.
Masked value will never be negative.

		int key, key_vali, key_press;

		key = adp5588_read(kpad->client, Key_EVENTA + i);
		if (key < 0)
			continue;

		key_val = key & key & KEY_EV_MASK;
		key_press = key & KEY_EV_PRESSED;
		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
			...
		} else if (key_val > 0) {
			...
		}

Thanks.

-- 
Dmitry

