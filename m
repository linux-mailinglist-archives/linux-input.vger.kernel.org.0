Return-Path: <linux-input+bounces-10874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E8A6469D
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21ECE1893A31
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5473A21B1A3;
	Mon, 17 Mar 2025 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ct5qDh/J"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A7E21D5AA
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202517; cv=none; b=ibq5Z7fgeFIwe473UddR5vm37lsXr5azzOqNRtMZmEUX60Zi9svQe+V9/Y5/FM0e1TM8IZcuaf1Uv6corpYkPBF7j+ElQQSdny+EdHLs8nArEq0Dvd9AzFl86bToH8k3LktcNQpTdFaNr9GPj3GH2uL0iKhWsUsyP64269kq73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202517; c=relaxed/simple;
	bh=Mvvbh0DDMRiK6miWCiwmpqH/0S/RSOBLo8iD/n/pR/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUr31ViWTs33U5Lta3g09/hyQmm0ig+uX/lhGAhpj49OAEN8G1mTQAvQ37wtMBDxI/GjR78ODyLtnOmIVE9w2XrADJQW3QVo5L8xqF7DQEt4feJvHTSucl6SvcqmmriGVzydXKKryHXPIQYNfzIJBm3fI3ImHavuAaiOZe+ZeNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ct5qDh/J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742202514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUxnWcopxnoAhgCDsSFoLxlEg/lKC1XzCkjkry+Y1ZU=;
	b=ct5qDh/JSX7PdWrP967/2nsL6yi1xBRNtzz7Dn2OWonwCKQfHRNDsfRU3RE5T0SEtc7CV7
	JopwsDOrLMiKaepOXvVPKPHYtoMOw/STsWfKsBFP8Ag+AYj7upm12PGA2pIuhIVnfJXIXO
	Yh6NXQudx10DUIsuCL5ubngtg2lF5oM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-9d5ziYocP2GM8xFv0BZVTQ-1; Mon, 17 Mar 2025 05:08:32 -0400
X-MC-Unique: 9d5ziYocP2GM8xFv0BZVTQ-1
X-Mimecast-MFC-AGG-ID: 9d5ziYocP2GM8xFv0BZVTQ_1742202512
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac27d8ac365so305480166b.2
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 02:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202512; x=1742807312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUxnWcopxnoAhgCDsSFoLxlEg/lKC1XzCkjkry+Y1ZU=;
        b=GS4LlT7X2CfwvMDPtzQbh3LHjQsKYTkTnleg2Mm6fokRnhkloWLlpoVodjYfFMEyC8
         zXg04d/usMppweZkd+Jy6amoMroDrwwApuVV82oVsV53xSN8KUvNhuFYOD182ep/CYGp
         v8sZoqTtMZ0vEVXFfzTDHeXqjDH7ALpBq1E89eda8ua6c5iP16lYYh6TfD4zEgQLLHHy
         +/jqO6IMOLdwy8MWmagJIPSGJ9AvhA0tc4pWnnRhP+AbWo03tVMNNlAbbGzKRUq86WA/
         GA2TyVsdV+yCytTJ3rmWQGYr9Jg/R/BYqp+MT/RyykMK6BlydC3kZUdclUzisvieAmJs
         J1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY344OTMWd/GyWr4sDP+fsuBYe0WNXKvlzhIM0RP1sqSQsySrMGk7aAiskR73TXJigpplJMJp1vPnD3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkQIZiC50QWrmAmWxfqOvB7GSrE/Ub89OS2BCCLnfTRpUVKoM7
	BGWzloX8tDZh085/lpNYmHIbuQ4rxMAIqFA/lWC4vR+z1xU1Qrt63aaMuPx28o4PgYOTr+BMqeU
	9+BtuGG2T12KqvuZyjtQO1/geN+UHQi7/llSXD3gmnBCt6WXuQYpxtRYuPayE
X-Gm-Gg: ASbGncsbNwUhTVqq8buuOyH+bOZr9qP70ibhUBQ+/V2+YSO/mY8GGSy6FuAT8gzORuh
	VyTmP9AfCKWmWIfBXiNfnjLA+9uFDDiD0T1PMZHjXgTRsU6dAxJC1BrdoPAvRiQOskEUjfKg+Re
	6FeMzLQmcsVi9gS4nQEymWZvciA4FCvpBDnGGOmRlrevhy2UvoN8QXtTojxkIqW2XoW4KSesfF9
	bkSuAkrg1WQYp51bH2OYGEdKG4SmEWblY5LseJDH9C9QFdUMAdQZ0nCri8y8KCba0IJ3jK+5fji
	6lY/WxsZGOznXnAqy4A=
X-Received: by 2002:a17:907:6ea9:b0:ac2:e2bf:d437 with SMTP id a640c23a62f3a-ac3303defb7mr1289819566b.52.1742202511689;
        Mon, 17 Mar 2025 02:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmMlwZG7U70Z6pyeZp1t0JdJ780owI88UMoZl46g79qE+kJtjGHcJF7BeCcZnIxxakzcQWHQ==
X-Received: by 2002:a17:907:6ea9:b0:ac2:e2bf:d437 with SMTP id a640c23a62f3a-ac3303defb7mr1289816766b.52.1742202511336;
        Mon, 17 Mar 2025 02:08:31 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea1fsm625177366b.22.2025.03.17.02.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:08:30 -0700 (PDT)
Message-ID: <77079344-5355-4595-a56c-26bf2e39e52c@redhat.com>
Date: Mon, 17 Mar 2025 10:08:29 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm: panel-orientation-quirks: Add OneXPlayer X1 AMD
 and Intel quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-2-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> The OneXPlayer X1 series features a 2k 10.95 display with a portrait
> orientation. Add a quirk to set the panel orientation to portrait mode
> to both the Intel and AMD variants.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 4a73821b81f6..17b4f57d64d7 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -443,6 +443,24 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 AMD */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 A"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 AMD Strix Point */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 Intel */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
>  	}, {	/* OrangePi Neo */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),


