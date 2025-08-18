Return-Path: <linux-input+bounces-14106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A196CB2AF44
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 19:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC807560C06
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 17:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB44C1F91C8;
	Mon, 18 Aug 2025 17:20:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D521D3DC;
	Mon, 18 Aug 2025 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537623; cv=none; b=AxBjTAtgTxCiOOYThEZl2kAvGDyK+oUBQOFI/oo5+dwUkm2dGP/C4W2AA+3pbfNp4yleE0gGq4Rb5uXLOZy6ervuKFafKsgNn78N07klcHAtl4vaE+V2HkF5kceIc9S5OLpUhSSoyGuIsoP7k8pThD7cUlQlNcgeFdBB9hPFP2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537623; c=relaxed/simple;
	bh=FLeQ4+JKflMPvM/Dz11rbcDrnCkZbSZwPTCwfMMBuUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g02gHzMvPCMKE88ow29+gJYa/6PxCfjFzYIBnKEKlRxG8yILxeBey/wrTOCr53xplqg4gTkTX4CyoWR0DDtoRf77ZbUTa/fBpDKw5228LIyRkPuQUxf8Ibs5VK9wXUXIqTEBVZjE+1dmj7x0nK0oH2IKNXkMiv67/PJMQfbdTcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445826fd9dso49612305ad.3;
        Mon, 18 Aug 2025 10:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755537621; x=1756142421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwoejNvkuML9Z6Jm4R+g0KULg+/6ABawxJNnc7Rp5AU=;
        b=uQZWS90rnXr1v0tT+NxV30Xj2MuK7rHAskM7/5hZ4TNzwLy+D2kpwgXk9eyaoXu5iV
         UNqbRcfDKPxECYADeRaOyxtG5bHGb1O5a88qp62v+d2Trrs0TlhOml613x3P9atOTeQw
         vNO0RM8aVIGxaqjWQ9JBae/jTp/+mwIXrOQdq3goWbxt+aytQhvnOzryL3/hqwohY1/8
         fzIty495LTNLinrkqjUuhwOW3YAWXSSeq/WMlIXf2E9230Olr4HlwDFBc3T4p4qeED+W
         Nz4K7eLSoZL4axXCwcmjfuHsSs7DW1jwaTa/AJN8T8+KkuhmmPknns9RrpkM3uOFt0qx
         shIg==
X-Forwarded-Encrypted: i=1; AJvYcCURiPxtBHdlEA7skJJ4tIvW/l0gJABRWj96bgEhh7K+aBOusc/tiviHjS/D2MMWnBuyquXsnsV4vbwNDw==@vger.kernel.org, AJvYcCWAjo+8MGRl2oD99TLiDRYor8kzo3DgMbX/ERpYgB7ZoGWgA4AooDcGpD6ZS4g380jORf6SKmNichv4e4mO@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZKLjbS9ZFaYrKpdM/S8Xy9a2aFpuJ2HVn6xKp9ggaiLMhxoi
	WDTZ3Ld1jbbvQ+O4fxpbc8wetbTybFpqskPyZxl5dsehaRoMBukaQPXe
X-Gm-Gg: ASbGncuCwOtCVMMHeXVnwBz+pnRI0pJYpdtLKXaN7OdUJtT+fcSggGIQE4NzLdpdI+a
	rfcSDoP/1Nc8EyUPxVzxxWT7YQDzs/5wbwNelDBIojJzMVZArYIKnYkvH0MwxuW54hMJzV8b5H7
	VJmLV9A6cR05SFlwnMO5bV1p/czH4SSQ3Rd+siq3npcdpK6hcgmjTZzOPDet6fGk5RewpYdwTOu
	iGsF8hycVMXZ2drdHxOho3139yxxRvS9qEdIUnj6bhxF7GXX9rYd1T8OP1AF8P/XohxC7Z+WDen
	7r+Tmrq2U1cmuY9dBWPhVp+Fo8zmsRTMPQb+LQCQS3XBoirvgjmipY9zbXFi3BC1WcB6n6SKewa
	SamxqvKA1xHYSXCw=
X-Google-Smtp-Source: AGHT+IEP8ypl4DnEA9ePzYYdAIZM7mfW4yBcg7sUt3c4DthERUHwm6I7itsQX+/xheLOctNaBBW6/g==
X-Received: by 2002:a17:902:d4c7:b0:240:7308:aecb with SMTP id d9443c01a7336-2449d05e08dmr2589905ad.32.1755537620840;
        Mon, 18 Aug 2025 10:20:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53bf5dsm84849625ad.114.2025.08.18.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 10:20:20 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:20:17 -0700
From: Dmitry Torokhov <dtor@mail.ru>
To: Jeongjun Park <aha310510@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, x0r@dv-life.ru, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: axff: add cleanup allocated struct axff_device heap
Message-ID: <fv32i2ejsupm64mpadzsfudaeuzkavkazpmnn2e4ijqeobl4gs@porr2zpxn4aj>
References: <20250818154302.811718-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818154302.811718-1-aha310510@gmail.com>

Hi Jeongjun,

On Tue, Aug 19, 2025 at 12:43:02AM +0900, Jeongjun Park wrote:
> Currently, acrux hid driver allocates heap memory equal to
> sizeof(struct axff_device) to support force feedback, but there's no code
> to free this memory except when initialization fails. This causes the
> allocated memory to not be freed even if the driver is detached.
> 
> Therefore, to properly clean up and safely manage the allocated heap,
> must be modified to use devm_kzalloc().

You have not tested this, have you? The private data that is passed to
input_ff_create_memless() is freed by ml_ff_destroy() which is invoked
when input core calls input_ff_destroy() as part of input device
teardown. Your change introduces double-free. 

> 
> Fixes: c0dbcc33c652 ("HID: add ACRUX game controller force feedback support")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  drivers/hid/hid-axff.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/hid-axff.c b/drivers/hid/hid-axff.c
> index fbe4e16ab029..b8202737f4c8 100644
> --- a/drivers/hid/hid-axff.c
> +++ b/drivers/hid/hid-axff.c
> @@ -96,7 +96,7 @@ static int axff_init(struct hid_device *hid)
>  		return -ENODEV;
>  	}
>  
> -	axff = kzalloc(sizeof(struct axff_device), GFP_KERNEL);
> +	axff = devm_kzalloc(&hid->dev, sizeof(struct axff_device), GFP_KERNEL);
>  	if (!axff)
>  		return -ENOMEM;
>  
> @@ -104,7 +104,7 @@ static int axff_init(struct hid_device *hid)
>  
>  	error = input_ff_create_memless(dev, axff, axff_play);
>  	if (error)
> -		goto err_free_mem;
> +		return error;
>  
>  	axff->report = report;
>  	hid_hw_request(hid, axff->report, HID_REQ_SET_REPORT);
> @@ -112,10 +112,6 @@ static int axff_init(struct hid_device *hid)
>  	hid_info(hid, "Force Feedback for ACRUX game controllers by Sergei Kolzun <x0r@dv-life.ru>\n");
>  
>  	return 0;
> -
> -err_free_mem:
> -	kfree(axff);
> -	return error;
>  }
>  #else
>  static inline int axff_init(struct hid_device *hid)
> --
> 

Thanks.

-- 
Dmitry

