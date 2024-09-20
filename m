Return-Path: <linux-input+bounces-6616-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6697D262
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 10:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9AE1F21EB5
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 08:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1976770E8;
	Fri, 20 Sep 2024 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWTNzafI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0D76035
	for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726820273; cv=none; b=HCtt9vUYmMLlwDlxfV5V3kJAcdgPJ3iLrjbSMrSLUPSzqD5chxDdwi2kAtKZlkggIyFDoQQBrfCdCAvdQouabUo6LTGVDSxcYEi/A3bwSYiJocvh0NN6t0o15D39BAXGoJ6QsBlJrIeX9hs7k/1eRmKX/0FJwhnQREb085dJSu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726820273; c=relaxed/simple;
	bh=LjIeg39vin3lLB3XwI56Ye+w/fCM4yPHzD5OtacQ1qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7Ue4lBD/Vds5A5jbFACmHLwf31a/wu8Rt0ay+LQSmc46f1/Khmz2MhOixEJHQtnuSuDfESuqgDe7bEAiZiKSzW12gtH8rWFJhuPcbicr9GffLvSuHipHnIlktK+yfMSRURD82Nmz1ZQqeuztlVZ1wqXnug0TQGK5XNHlQTccxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWTNzafI; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso304534466b.0
        for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726820270; x=1727425070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzAtoTRirDBabPSUNS8bXg0XOmEaqUMY9VYEvKPxhHU=;
        b=ZWTNzafISHJrt4yDz54oWzap+ckbCa4It7ifmCk2jGYVala0lnnIzow3mD1YWbb+BC
         4vCjKFt0JE+7GtsIi+9KYEL8GoI4Z5xQwpOCpwsSkKQPtakEzPqLEchdgx4PDvvI2WLf
         FCUKK2BFtWz9bEWYCV6Wr3D8fcpGxPOryVXeMAwWgggJAzWkcmrE1qkB98j6LgdPVPNk
         a3UzcclpmKGukuNtFnF6OAipjLcIpieBdYYTrWsYl66H6y4mjUTJMntXAX28rFXywDVm
         5AgLZruVGCzALqStm0ZCZwUlJ1PI8pNjSFy0ppWXwn+qM3lpckfbd1fFkQZnivV2PWiX
         vAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726820270; x=1727425070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzAtoTRirDBabPSUNS8bXg0XOmEaqUMY9VYEvKPxhHU=;
        b=gPSO0Zarp+GwBIMhkzVpa7nsBXVdfvO2G263m4OkZaFGPjx6+ok0o24R8PC1yOK3zA
         uNCXjVTntjAkPNmlzvczKy+0PIKS2CzKmdcBEW1eTVRCI9pvOV7p3G44DCIr1PmS6fPr
         A5fAvFync9IsBetEhg0NcEtdhqNPTAPeENKFZy1EXiMo0QrTtpumDkq4wXr1AxzquS8g
         gChx8ZL9Pbvgn3M81MjlCZHZ45dkYg58gn7nBVLq/VbUZJuHKpQXxyWrp0UAmVteouWL
         tM/0YkSB3pdJbEPqdFSa4SLnheAkUs45j/8Yej+g/zWK7oMxboYGQDSh8nFLwiFHNa7w
         jcqg==
X-Forwarded-Encrypted: i=1; AJvYcCW7y4b9EHT11GiRzKYbNJOBZ+gubD3q/qNF7ptdlmA12tYUtZ2LCjx9zKw/lcMb5pbjhh/Vs5uNMr3tNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2R35ZO+EGdhu8vsLNPfXoq8IEgDpY+cSwkwG0nkRL5U7x1Xr
	T7dO1Q/oQISFv7bTvdkhgcIyWSPtT/S2tXE02bHTrcEjBjgqVirG
X-Google-Smtp-Source: AGHT+IH5u5OLLipuVVXzBwIzeL+4m2Op4enrQdHLlQBh+hIoOUwAQlbgJ0JRsPH/GVqpNuUXS4dwDw==
X-Received: by 2002:a17:907:efd7:b0:a8d:63b5:e795 with SMTP id a640c23a62f3a-a90c1c384f7mr547570366b.3.1726820270017;
        Fri, 20 Sep 2024 01:17:50 -0700 (PDT)
Received: from google.com ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90d21bc502sm87286966b.25.2024.09.20.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:17:49 -0700 (PDT)
Date: Fri, 20 Sep 2024 08:17:47 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: nuno.sa@analog.com
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] Input: adp5588-keys: fix check on return code
Message-ID: <Zu0vq0ogr2HzXWv7@google.com>
References: <20240920-fix-adp5588-err-check-v1-1-81f6e957ef24@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-fix-adp5588-err-check-v1-1-81f6e957ef24@analog.com>

On Fri, Sep 20, 2024 at 09:22:52AM +0200, Nuno Sa via B4 Relay wrote:
> From: Nuno Sa <nuno.sa@analog.com>
> 
> During adp5588_setup(), we read all the events to clear the event FIFO.
> However, adp5588_read() just calls i2c_smbus_read_byte_data() which
> returns the byte read in case everything goes well. Hence, we need to
> explicitly check for a negative error code instead of checking for
> something different than 0.
> 
> Fixes: e960309ce318 ("Input: adp5588-keys - bail out on returned error")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/input/keyboard/adp5588-keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
> index b5f4becf5cb6f..d25d63a807f23 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -620,7 +620,7 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
>  
>  	for (i = 0; i < KEYP_MAX_EVENT; i++) {
>  		ret = adp5588_read(client, KEY_EVENTA);
> -		if (ret)
> +		if (ret < 0)
>  			return ret;
>  	}

Hmm... There are a bunch of places where we do not check result of
adp5588_read(). I wonder if we should:

1. add the checks
2. change it to return error or 0 and return the value through a pointer
argument.

In the meantime I'll apply this patch.

Thanks.

-- 
Dmitry

