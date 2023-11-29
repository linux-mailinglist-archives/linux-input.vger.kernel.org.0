Return-Path: <linux-input+bounces-326-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D07FD14A
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 09:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEC04282BC7
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 08:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B892114;
	Wed, 29 Nov 2023 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbKYEEBU"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098B519BA
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 00:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701247586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=indM6A7jagYAttzowg4VetKQUeiDwWNMdMnxfV2PQvg=;
	b=gbKYEEBU0jBsHfkwaYRatnWGzPb0qnfdkjEkBc+QkMhY34rj2RI9SjpU9voIpX5ADbJWWi
	VeLFGAh4PFzWh4+H+sC0Xfuk3V+FSPJeY3X4xhTRdIdlQN4sgFHk5h/uljZdT1dS/FGp1H
	z3maxCiOR86RROuMLRlD4b6qiGJtNKw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-K5cXsMtWPOCnYc-JKsldvw-1; Wed, 29 Nov 2023 03:46:24 -0500
X-MC-Unique: K5cXsMtWPOCnYc-JKsldvw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a04b426b3c0so101003266b.0
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 00:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701247583; x=1701852383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=indM6A7jagYAttzowg4VetKQUeiDwWNMdMnxfV2PQvg=;
        b=UpOVZfWidL2hkrGmYJYZI1MVt1bnFtNy6qQ1P5THQzvToOrW90MP4aMIDn/TSkotr3
         japl3RmNXtnzYl/CUuX9eePk9g/8XpkUOcdinKdSIjRKU0pcXBcwWVDXIONOFlX/0z3X
         dkQjzuyRq4pyVlRNWblrMEddkqGR8ZXuyp278A5Cjt+xhFW6Ai+V/69HAx3nQRwj3mkv
         mBlaxPjYREtBk4oxjHHCyeOtj3HtdcFzvm8GR9GHZGdf/641SiBetzKu4/1kerJdVMe5
         +hgwm5+kvSUCw3+iv8bm7M2LqF3e20byC3M7xIf1YwwV1krlYOb/r56ySHtwKMVTgMYD
         sbeA==
X-Gm-Message-State: AOJu0YwvCvE9ipD4Ud1JaRLk7KT7jF+cFNYY8Q1KUVlFryxHBQWccNyz
	ZSO5O7P2pA740P6/DysdIZcCIfqLoBzH+Zv3QUP+RWBdSxGl88XLErDmpwOOkCHrbK8iNpb/Jpb
	ZronoN5RLZi9UKNbpoCCIdRgWiQms60U=
X-Received: by 2002:a17:906:5302:b0:a16:1b4a:a6fa with SMTP id h2-20020a170906530200b00a161b4aa6famr3270618ejo.8.1701247583356;
        Wed, 29 Nov 2023 00:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF42YJl8n/EKC89NE1fnwbQAbIP2q6bWuq/t/5wnOzJVB0yvVZWMFK+uZ+Ydv5Bp6I6YSE+rQ==
X-Received: by 2002:a17:906:5302:b0:a16:1b4a:a6fa with SMTP id h2-20020a170906530200b00a161b4aa6famr3270607ejo.8.1701247583081;
        Wed, 29 Nov 2023 00:46:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id pw10-20020a17090720aa00b0099cce6f7d50sm7681353ejb.64.2023.11.29.00.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 00:46:22 -0800 (PST)
Message-ID: <5b02572b-1be2-41e4-9959-a811ca02fb54@redhat.com>
Date: Wed, 29 Nov 2023 09:46:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: i8042 - add noloop quirk for Acer P459-G2-M
To: Esther Shimanovich <eshimanovich@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Denose <jdenose@chromium.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Werner Sembach <wse@tuxedocomputers.com>
References: <20231128214851.1.Ibc66f1742765467808fb28a394f8f35af920aa49@changeid>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231128214851.1.Ibc66f1742765467808fb28a394f8f35af920aa49@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/28/23 22:48, Esther Shimanovich wrote:
> On the Acer P450-G2-M, after the user opens the laptop lid and the device
> resumes from S3 deep sleep, the screen remains dark for a few seconds.
> If the user presses a keyboard key while the screen is still dark, the
> mouse and keyboard stop functioning.
> 
> To fix this bug, enable the noloop quirk.
> 
> Signed-off-by: Esther Shimanovich <eshimanovich@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> 
>  drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index 028e45bd050bf..b81539bacb931 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -941,6 +941,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		},
>  		.driver_data = (void *)(SERIO_QUIRK_NOPNP)
>  	},
> +	{
> +		/* Acer TravelMate P459-G2-M */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate P459-G2-M"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
> +	},
>  	{
>  		/* ULI EV4873 - AUX LOOP does not work properly */
>  		.matches = {


