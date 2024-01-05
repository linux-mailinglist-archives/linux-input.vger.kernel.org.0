Return-Path: <linux-input+bounces-1142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46741825B2C
	for <lists+linux-input@lfdr.de>; Fri,  5 Jan 2024 20:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F6528598E
	for <lists+linux-input@lfdr.de>; Fri,  5 Jan 2024 19:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16556364AF;
	Fri,  5 Jan 2024 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4CkIBxH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81392364A1
	for <linux-input@vger.kernel.org>; Fri,  5 Jan 2024 19:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704483541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMoO1LwsnCwYYN8Uqa/kdGfXrJudOewzUd2AdmdxnGg=;
	b=i4CkIBxHNr5dtV0e0/uCCteKQVv2fwXnzWRx4tOuQl6wiVvMOfJLyevJm7gBC6NZ93Rzc8
	Udfg9yxv3iBfgBaleJUvwvI2NFM93TbXYQTdlTXH5A13u9yUHfgPQ0mOhHBy3YjfKq3L4o
	GAyEif1F3gAdUhwd/hOtaJXyqAzzmI0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-6nCHnewhPfe-k-18N8cbYQ-1; Fri, 05 Jan 2024 14:38:55 -0500
X-MC-Unique: 6nCHnewhPfe-k-18N8cbYQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a27eddc1c27so105915266b.3
        for <linux-input@vger.kernel.org>; Fri, 05 Jan 2024 11:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704483534; x=1705088334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMoO1LwsnCwYYN8Uqa/kdGfXrJudOewzUd2AdmdxnGg=;
        b=DA9UsmOz9AfRj24nBL4phd9AWVYH9g1Cq64SaO6h4UYjdWTDc6ISu78iFfb6h3zeT2
         nqKTldUx/0Lw2lFssWRmAgIUhjMhgaX+5zwB4TWpEP9Ag2GG/C22Rw14GCwtn06g2KR+
         SDx2KnzTW6jl2U5Q3UMKPkexomcxShEqbjwXCWpr9QepoF2GER4zkI/7+MK6ckhn+/Bb
         W3EGYEBwVzAEcaEjBUQirl5PaxoIbrhmfhbU7beR4qmEkPwM3yAlqmo4nLNvgv5yj5Dq
         bc1G6kUgHw/aZmDsb04aoovszYsKtrhr5rZ/56RAFkHKp1P5itPEcBHXLOjv6lcSHqmx
         7gIg==
X-Gm-Message-State: AOJu0Yw86wwspMr0kPfS87K8BD0IuwFkkV9IV1XIqq1WB9wG7mmfQkgw
	PIr2ScbFnGP2b06aWMTQy9VLPzIbKY5Vi5zjkuRbzPRpBMohK3bLh1jghnJXOtQ07j+KevHX6LO
	4L5BpYdtmF/CFAYtMXK4W08jU/SN8zYo=
X-Received: by 2002:a17:906:4:b0:a29:bf51:6a9f with SMTP id 4-20020a170906000400b00a29bf516a9fmr59343eja.127.1704483534010;
        Fri, 05 Jan 2024 11:38:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIe7gBV7svaGGAmiOaLupilSDdw+HCLNuh71F+XKeYIMeOeQyhpMW/qR+BLrPPq6e7J9OaHA==
X-Received: by 2002:a17:906:4:b0:a29:bf51:6a9f with SMTP id 4-20020a170906000400b00a29bf516a9fmr59338eja.127.1704483533782;
        Fri, 05 Jan 2024 11:38:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oq8-20020a170906cc8800b00a293280c16csm1083021ejb.223.2024.01.05.11.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 11:38:53 -0800 (PST)
Message-ID: <78c03189-f965-40b5-8aea-3a1294102e84@redhat.com>
Date: Fri, 5 Jan 2024 20:38:52 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i8042: Use new forcenorestore quirk to replace old
 buggy quirk combination
Content-Language: en-US, nl
To: Werner Sembach <wse@tuxedocomputers.com>, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240104183118.779778-1-wse@tuxedocomputers.com>
 <20240104183118.779778-3-wse@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240104183118.779778-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/4/24 19:31, Werner Sembach wrote:
> The old quirk combination sometimes cause a laggy keyboard after boot. With
> the new quirk the initial issue of an unresponsive keyboard after s3 resume
> is also fixed, but it doesn't have the negative side effect of the
> sometimes laggy keyboard.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/serio/i8042-acpipnpio.h | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index 10ec4534e5e14..e631a26394e92 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1142,18 +1142,10 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>  	},
>  	{
> -		/*
> -		 * Setting SERIO_QUIRK_NOMUX or SERIO_QUIRK_RESET_ALWAYS makes
> -		 * the keyboard very laggy for ~5 seconds after boot and
> -		 * sometimes also after resume.
> -		 * However both are required for the keyboard to not fail
> -		 * completely sometimes after boot or resume.
> -		 */
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
>  		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>  	},
>  	{
>  		.matches = {


