Return-Path: <linux-input+bounces-10875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A98ABA646B1
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75B3E1894EC6
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA09122422C;
	Mon, 17 Mar 2025 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cziyaBga"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C122257F
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202567; cv=none; b=fPPx6BLnHDPNhp/yEbp4dWjYqDmJfPP56RK3hpwTvVNqPB8fK120aiDiBl7heUoFZiTUB9clTCA9e8AbcvbvFLX5E6vPy9AwGwo7GzstnEr6O0ucDjht3qR90KOZbD2WvyZrGCpGd9dKPbu9B15BmWOh8Jk1MQHAinao+RRDFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202567; c=relaxed/simple;
	bh=UGeKxti/Rtl1+ILDl2QXu4lQBMO2Zbk90augSVkNHLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=er1xBXm2PN8lzIyxMGshVee2eBQns7LTDKuFiZC8GCT8p1SDWdMZAQaM9WRcRwx4J1WO3ztQUlZctQrqZiTDEXgA+Ml78ZYTYMEq+WKoYXKImMVlb8DcNfLPloXWxtn7++8swMF1BXlPZw1CXOnkAwPPJVPVyjS4Uo3z5sPrvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cziyaBga; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742202565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bww8JOfOpzHjN4KnEpLdpIzThEx7K4HigFEfHRKZmPk=;
	b=cziyaBgaqrRjbeBHgVwEC3N8YpAiltGnbzFimnmt3/D0hJthCP8me3OOeMxHzURoQHF5Hd
	Nb2uRRR7+mhCCU/Anv7MfBaWV7RuhaejtG9UrKwNxyVQrOHPJ25djAdYIDI6MHxn/DazFj
	RWNTdZdvM9GT3kSF1sMNbUsydPg1EAs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-E4ryN-08POelggOnwcxvow-1; Mon, 17 Mar 2025 05:09:23 -0400
X-MC-Unique: E4ryN-08POelggOnwcxvow-1
X-Mimecast-MFC-AGG-ID: E4ryN-08POelggOnwcxvow_1742202562
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e4b6eba254so3249477a12.3
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202562; x=1742807362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bww8JOfOpzHjN4KnEpLdpIzThEx7K4HigFEfHRKZmPk=;
        b=V4H30hN7vUzzFvjgRueGgdxJY2rj4ortOayV9IQbQTRKUzL/zvlr1Wzrgg9zmZ4CvM
         IafoHU8Kr6VNR0NvzWnhU5ze2cwfYSy5ECs+lDyG1xw3+HvIam8UYYBmO6d2gAXRhetl
         a4aLlLEigUAWahOCgNJB/jKvRTfC6cujmGv+Wlut1F6qU24JE83mYCEgns8446sShei4
         5pjFJTWx0W1D9mSxeulGdyzHXfOtuAbCe/XbfPeOM30O4MUfU88oM5p+90V86cNgVBfr
         XcXnpb0ljnn5ShRi7WiVhsG4gtJXkc0ry2V9vLNV+083MJquRF+QZvYFKPbI7PrWiGW6
         VbZA==
X-Forwarded-Encrypted: i=1; AJvYcCWBr4lArrLOO1D8IiCuvgNDAtRuJQL/UOi7Wx7LZRRBZ/Bt2fmZDMqbpcvHLJ4pb7K03hMfx48WHIOThA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr27MD+cLL2BdvaBLMJpU35rwK/qUqYWkWChPCTQmHff88VQ87
	rJyPRJYbkAxS4qGXKXyHnuponUbMvgsbM1P8IBwazlRKF/bNne4wa0T8F4/CXVk85bF3o+QRnkT
	xbCkS5sGPuWIqtS1pfVr8fIzjEokIaTHrmuOaqxsMXzeIDIJtvQgffuI037Cc
X-Gm-Gg: ASbGncsDXEfu93Uva7ebaGXodHNvHgAVu7EL4475jBBDhBOXW1sJs3gkESBRBeWwq/2
	D6O9K+FsB1P/HzHdh0ctqtQPezxy9yRixe8cIHKh8KjSyyBgWKzjYteKNIdAkkkxG/dI0kcy31b
	ubaVY0BFaGcgjBD1ZAFatX1k7br7hffyDr592TV0s3esz3IFos+g0Szh0EEGhMBBAaUnWTXN0h1
	ugk4GEMuPQxhyq817Elng8wxk9Ve/GIoXSrZtJyPm2YjF5kbhHNidNmr88FFvcaexMH4z5g0jJT
	gYOb31Uxa2ae6tX7u6g=
X-Received: by 2002:a17:907:7d87:b0:ac3:26fb:f420 with SMTP id a640c23a62f3a-ac3303715c9mr1316675666b.42.1742202562168;
        Mon, 17 Mar 2025 02:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbzLKOvU6u087cvw4eQbB3+jMOWQmFWk87CZXwlrr7X5z5g/l5JBC7ADKxnGSg2zX1KEVA2A==
X-Received: by 2002:a17:907:7d87:b0:ac3:26fb:f420 with SMTP id a640c23a62f3a-ac3303715c9mr1316673666b.42.1742202561824;
        Mon, 17 Mar 2025 02:09:21 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3d3d7sm634405166b.132.2025.03.17.02.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:09:21 -0700 (PDT)
Message-ID: <9ca06bfe-84fc-44fb-bd32-c5914ab553d8@redhat.com>
Date: Mon, 17 Mar 2025 10:09:20 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm: panel-orientation-quirks: Add OneXPlayer X1 Mini
 (AMD) quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-3-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> The OneXPlayer X1 mini features a 2k 8.8 display with a portrait
> orientation. Add a quirk to set the panel orientation to portrait
> mode. There is no Intel variant.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 17b4f57d64d7..1378690b7287 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -461,6 +461,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 mini (AMD) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 mini"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
>  	}, {	/* OrangePi Neo */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),


