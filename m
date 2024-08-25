Return-Path: <linux-input+bounces-5856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B095E38F
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 15:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A5E1C20F3C
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B849913E88B;
	Sun, 25 Aug 2024 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXJZo+yS"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C10529408
	for <linux-input@vger.kernel.org>; Sun, 25 Aug 2024 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591643; cv=none; b=TWX6t4rE7e4fAOmo8wkFCJK0TDNpguvEQ09+0DgcdQjx0U4NIUTu+lGo0tj6I20yeR77TJBJScmUeE3XwCYC0PY5PCsEKAK1TIVUFVo089ya6nQza8jFWQTdnXOTbtfwc0Kb7BrUhc9pwxAF/0OCyMNMOLBexthMZJL+1gPxVTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591643; c=relaxed/simple;
	bh=If+/8xbIiesAUyAMotSQq4erR1sm/1SDnyOVcA8R6BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLNWWZrVFMPX/jR1l6bWsZd0+AUkg6eUBwBL3jZrYMRHWdggcm/cZHha1cy8+WXRcNxWjFvRsEKHRbzOvZGdl787STw1XCUVe0tfeo6SzF1C/4yfqZurU7OaOZqfh8SotBkzbwd10rcQauDaf5w2P3X2PYU3Duhuc7mqNYNOoFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXJZo+yS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724591641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6JO4w81QAnxfI/sVFQ992flHyAjc9Uzm0HkU62Trw4=;
	b=JXJZo+ySqhwRZ2yHmx4oH/7S2RESKEnthJXSxNRqmr0NPUZoN6WvDEtFTMCQOqdqbIAJ0i
	EzdxZiMgDHQikFLFbThO1JLvBDipubOCJqtCMvU8txNkcXwTvGEWNhLp9veRET4aUy4Fc8
	pV0De0tT7n5qIT2+2pTr89YXdoxZimE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475--SnW-xDZPH6iVj-P1RMzzQ-1; Sun, 25 Aug 2024 09:13:59 -0400
X-MC-Unique: -SnW-xDZPH6iVj-P1RMzzQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5334824e68dso3299749e87.3
        for <linux-input@vger.kernel.org>; Sun, 25 Aug 2024 06:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724591638; x=1725196438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6JO4w81QAnxfI/sVFQ992flHyAjc9Uzm0HkU62Trw4=;
        b=AYUOyWep6a79oGuq517UHVyPVxGuJsFm2bF9ARWD8MhHl31MLV6nE0trXgQMYR9Yyd
         w9cTdaxhv4RWUOcff/W2meEgKfeGseRXl4u8tLcLRezM2o471IhBBKjouP9KmoX45OpD
         Ffyv5n68OsOCiSBylRKt6+jcSrqQsY1QHPe7VWhMVm1kLWV8Adt28qbt4ybcimTDDmQE
         io8dKt3TW/xGg4qCVgz1WNdg8sHAJDmKHurQ5Fzur6o13tV06rPY1QL3r8GKNTtXx6oN
         tku1dfKjws1xThEAYaxEdOa5nYYddBtYAXutuCkWBN2evxPAfJ7FsmUc0U5jEvZLvU7U
         Oulw==
X-Forwarded-Encrypted: i=1; AJvYcCXchSfi1FPBj3iVgUzqNsp5zHvB8aUuwWKiRCeuf7+5+84V2HZtDzKaGi04OyRBnBPIiBfQiUmPnTS6DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxenUlJi6W72POryLGic06TE+OuRxiucsKJH/9Zo5xak/T6nSiH
	evKsax8t/kHO5SPJh0VKNLt7rlew1s66OUnOQ9dv0L5P9o6w1VtwG7FHYKHni0UxZK+5PHY4bE6
	PR4ioNtxvgkVFm33m6K3Dtn7n+ykKm/qJDOo1tN+MgyutNFWum3/9PSLkw6K4
X-Received: by 2002:ac2:4e07:0:b0:52e:9f76:53dc with SMTP id 2adb3069b0e04-534387d23ffmr4435061e87.0.1724591637780;
        Sun, 25 Aug 2024 06:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFij4DUMFVB07YMBQHND15S17vubAKk8zRYJctcQrk4OJNZ/Y6GfWIX0ARkcVXAeWLHy8YEVA==
X-Received: by 2002:ac2:4e07:0:b0:52e:9f76:53dc with SMTP id 2adb3069b0e04-534387d23ffmr4435049e87.0.1724591637278;
        Sun, 25 Aug 2024 06:13:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a5764sm533272866b.79.2024.08.25.06.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 06:13:56 -0700 (PDT)
Message-ID: <34c641d3-ee4e-4e93-ad42-90a33c0f8b0a@redhat.com>
Date: Sun, 25 Aug 2024 15:13:56 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: matrix-keymap - switch to using __free() cleanup
 facility
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <ZspoEPdTcH-hpciy@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZspoEPdTcH-hpciy@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/25/24 1:09 AM, Dmitry Torokhov wrote:
> Use __free(kfree) cleanup facility in matrix_keypad_parse_keymap() to
> automatically free temporarily allocated memory.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/matrix-keymap.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/matrix-keymap.c b/drivers/input/matrix-keymap.c
> index 5d93043bad8e..3bea3575a0a9 100644
> --- a/drivers/input/matrix-keymap.c
> +++ b/drivers/input/matrix-keymap.c
> @@ -73,10 +73,9 @@ static int matrix_keypad_parse_keymap(const char *propname,
>  	struct device *dev = input_dev->dev.parent;
>  	unsigned int row_shift = get_count_order(cols);
>  	unsigned int max_keys = rows << row_shift;
> -	u32 *keys;
>  	int i;
>  	int size;
> -	int retval;
> +	int error;
>  
>  	if (!propname)
>  		propname = "linux,keymap";
> @@ -94,30 +93,24 @@ static int matrix_keypad_parse_keymap(const char *propname,
>  		return -EINVAL;
>  	}
>  
> -	keys = kmalloc_array(size, sizeof(u32), GFP_KERNEL);
> +	u32 *keys __free(kfree) = kmalloc_array(size, sizeof(*keys), GFP_KERNEL);
>  	if (!keys)
>  		return -ENOMEM;
>  
> -	retval = device_property_read_u32_array(dev, propname, keys, size);
> -	if (retval) {
> +	error = device_property_read_u32_array(dev, propname, keys, size);
> +	if (error) {
>  		dev_err(dev, "failed to read %s property: %d\n",
> -			propname, retval);
> -		goto out;
> +			propname, error);
> +		return error;
>  	}
>  
>  	for (i = 0; i < size; i++) {
>  		if (!matrix_keypad_map_key(input_dev, rows, cols,
> -					   row_shift, keys[i])) {
> -			retval = -EINVAL;
> -			goto out;
> -		}
> +					   row_shift, keys[i]))
> +			return -EINVAL;
>  	}
>  
> -	retval = 0;
> -
> -out:
> -	kfree(keys);
> -	return retval;
> +	return 0;
>  }
>  
>  /**


