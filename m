Return-Path: <linux-input+bounces-7884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D26579BD5BF
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 20:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D581F2368F
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 19:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B651F1E9063;
	Tue,  5 Nov 2024 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PK1msAqO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0E1E7C27;
	Tue,  5 Nov 2024 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834353; cv=none; b=Aw9l82e6ZSv8ugJwmH046ZffsKtXui0Pr43yN9elnJAwe8qj1gTMymepglDi8Q2O2lUAEvjMpCwTNRGfa09RphRDebwXWHWRiaqegDYl/6mmBNsNz/B7jXO7kc8Slx8+op6P8xPT0n0xGmsV6C+l8pFNwMr/B/S6JXKqmcA8MP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834353; c=relaxed/simple;
	bh=/xLANdPGKEX0/N4YaM6j6qavcFCGCJx0k6vWCdhdxoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ774Dqn0T322vXnz5a6UCl2Q/jTo53znjquxEJtdSKcWrvBZ/k0L6VVA9AuzVHc+JO3ZjpbojnRo8nUY6A7hb21dsO7BburSg0ybn3JjnioBe0QTi/F4rtmkPDqxud/IkWWywhnf7Q2IFDC9X6Wb9zScPjXTpRgX5L3UzhH2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PK1msAqO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso4373303b3a.1;
        Tue, 05 Nov 2024 11:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730834351; x=1731439151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh6S2B4z9jhCcopEKOOcWiD/BZbxy0WEwz9EoujVSYg=;
        b=PK1msAqOFT99iXaJg0WqGoATbrwK9Err8EP1+uxRRuHzvXQGIG4493vg8qkLlwAavQ
         UPsDWxXPbVKnsphYlnXy1da+vICJnLJ0PgD6AV+GodasN7g928sdPd78pbgjJ78lRRW5
         zY/U9k8jyh2boeamp4CPlFGyaD+zhbVk1yfxyWNSYQa6LlKfBttBb0nIwoYMWeTHemrk
         tAFAir32zmU2yUpdx4mwck+Wn6TPwooqMX7eRA8CnZGAwWxgZzOZlO7D7J8FeCLGDfGx
         9dcysKQiCnuY8N0FJqBUW3hDlbuBowwcpW5bhqjh/WGQX2Hxox8QLGjv5PROKpQzhGDL
         0eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730834351; x=1731439151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh6S2B4z9jhCcopEKOOcWiD/BZbxy0WEwz9EoujVSYg=;
        b=mL8hj0Rsh0pdlnVhLKELj7GDyJ/bLM2bpm26zfJMra6+cb+/nB2tmBqwjgMTheW4fz
         8FQR0T5oyhiUGl5/p7bbBX0+sTKMFuDEPwcWsCN2nhbtas0aERF4R8srspeSyIyoGsMU
         ksxGFMr4vGxHdko9mG3Y2yH8sP8XW61rHZXpESjP8GDmW6DPUVWgcAI5m3hPDjBdvxNd
         Nho4MiKBTJ8nOjHoANrkKwTWsgE3sh8866J460BtoWbG3YOhsd94T+2y9PQ2B4TUUCIy
         rnkRRBO/RUJlUlEa822F66u70jk3eFf+1oBpE1DkRueXnIsF6mDo1/lySsdVcKfjOah3
         TJbA==
X-Forwarded-Encrypted: i=1; AJvYcCUUPLO3e73RbEn8wBvP60tMoRjAJUw/6GXLPsac0GWRu3DMp1KeQC1yA5f4ZNk1eomosmTC3duHhoay@vger.kernel.org, AJvYcCXDvj6Uuh5Ww3qIYsb4ifDYBu319ZIdlkJoKw0SMqhvWQ83ulkuyCnWYzD9y/h5Nf/LAMOKthgwpsU5dv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEUR1RqloVAH9F65x+zPS/XS51147mgf1fSRNSlCt1s9WIrVPX
	uWPMmYYt/J5o4tS2HySqXszGXsUi0MxvzNAOc1P3CNb58FrSsYF7
X-Google-Smtp-Source: AGHT+IHGnqO3KOdiiOhNRFU6AMrNu7LIXM3Ftu5sa8FDyEm21aYXygte+WdlQrb8kO0r9nlxOsEI0A==
X-Received: by 2002:a05:6a00:181b:b0:71e:7d52:fa6d with SMTP id d2e1a72fcca58-72063028666mr51989040b3a.21.1730834351534;
        Tue, 05 Nov 2024 11:19:11 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:65d0:e6fa:350:5727])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba0a0sm10251959b3a.16.2024.11.05.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:19:11 -0800 (PST)
Date: Tue, 5 Nov 2024 11:19:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] Input: matrix_keypad - detect change during scan
Message-ID: <ZypvrAYCX8lYUltX@google.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-8-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105130322.213623-8-markus.burri@mt.com>

On Tue, Nov 05, 2024 at 02:03:22PM +0100, Markus Burri wrote:
> For a setup where the matrix keypad is connected over a slow interface
> (e.g. a gpio-expansion over i2c), the scan can take a longer time to read.
> 
> Interrupts need to be disabled during scan. And therefore changes in this
> period are not detected.
> To improve this situation, scan the matrix again if the row state changed
> during interrupts disabled.

And what if the state changes yet again during the 2nd scan attempt?

> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  drivers/input/keyboard/matrix_keypad.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 46873b8..93c8404 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -126,6 +126,10 @@ static void matrix_keypad_scan(struct work_struct *work)
>  	const unsigned short *keycodes = input_dev->keycode;
>  	uint32_t new_state[MATRIX_MAX_COLS];
>  	int row, col, code;
> +	u32 init_row_state, new_row_state;
> +
> +	/* read initial row state to detect changes between scan */
> +	init_row_state = read_row_state(keypad);
>  
>  	/* de-activate all columns for scanning */
>  	activate_all_cols(keypad, false);
> @@ -174,6 +178,19 @@ static void matrix_keypad_scan(struct work_struct *work)
>  	keypad->scan_pending = false;
>  	enable_row_irqs(keypad);
>  	spin_unlock_irq(&keypad->lock);
> +
> +	/* read new row state and detect if value has changed */
> +	new_row_state = read_row_state(keypad);
> +	if (init_row_state != new_row_state) {
> +		spin_lock_irq(&keypad->lock);
> +		if (likely(!keypad->scan_pending && !keypad->stopped)) {
> +			disable_row_irqs(keypad);
> +			keypad->scan_pending = true;
> +			schedule_delayed_work(&keypad->work,
> +					      msecs_to_jiffies(keypad->debounce_ms));
> +		}
> +		spin_unlock_irq(&keypad->lock);
> +	}
>  }
>  
>  static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
> -- 
> 2.39.5
> 

-- 
Dmitry

