Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864EB38C46D
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 12:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhEUKMi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 06:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42720 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234122AbhEUKMb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 06:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621591868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QTVAFRd+ch3MDPYuYA8sXO3Rh7Hv+KTYpT1g337Oyrs=;
        b=bZ3+quxGBo5uKrz68XHHJH5zgwyaNeM4nikkCBMYvZboUJBJQl5hqQuP4OioJnMXu6Zvqy
        jwzax1zhZv/YF9L+35r/J3P5OXGapojfaRtl3S/pHwge/6Lah4YDWczsJ036Ov/BhRMM34
        p1s3JvSBLP8BAnCOVIOtzx/OX02liNM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-_eE5kenNNWeux2Z63kFfHw-1; Fri, 21 May 2021 06:11:06 -0400
X-MC-Unique: _eE5kenNNWeux2Z63kFfHw-1
Received: by mail-ej1-f72.google.com with SMTP id i23-20020a17090685d7b02903d089ab83fcso5987844ejy.19
        for <linux-input@vger.kernel.org>; Fri, 21 May 2021 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QTVAFRd+ch3MDPYuYA8sXO3Rh7Hv+KTYpT1g337Oyrs=;
        b=OS4IjalYblreugPODeTNzGLoH+uG70Q2rymctyXVn97HaDSuCR4FxrNYIowSVasRgh
         +503klbN29N5OSAewuGAfzc5LGCjJrjAMB8dWFsA05iuz0CU/n1y2uQXVjiSHmWQ3z0O
         JQDkprMJjVfm6rONzdnHkeqpADk8UWJDnLGZNI+WnaaOb1CnNNQTE7RUl9vo0LH6E7uw
         zBApfgZp4het5wUMY0nLdqr1W0eOdKfZjK3h864FzszanMMpE5ngv+nyNcCy5tSV/XuP
         YKFXnaMpDSz/mUBklXzOdoCihRUECUS8P4SLLToP9fHIjwZjnUTI8IS+KR+8NO1sRILc
         Qx8Q==
X-Gm-Message-State: AOAM532FQq37cUYRFtaVCwf4pOFzUdAnOFKKkerBhkjQc6c7G4v1hH11
        xedqh6SBsAkNEEQlvgVp5fzrIst0QHLL/IgqMWBfEnYKJM5NiC0tEJX/9BSPvv8JjtA3FVwvg6R
        UnYoXJcFbHN7kobsOzsirqm6cyuKv7uwkP5jm1kxcrE5Uk6b+4mC+29nsq/Wh+ugmiyBeeJCo7Z
        Y=
X-Received: by 2002:a05:6402:13c3:: with SMTP id a3mr10442840edx.18.1621591864821;
        Fri, 21 May 2021 03:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEE0I+7Oj/t85kZdjybmj7XGUwzD+4nSRd6xocXGu6tldlgBLYI3L732/FSU3b7C80OaMHHA==
X-Received: by 2002:a05:6402:13c3:: with SMTP id a3mr10442825edx.18.1621591864598;
        Fri, 21 May 2021 03:11:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gl20sm3190137ejb.5.2021.05.21.03.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 03:11:04 -0700 (PDT)
Subject: Re: [PATCH 7/7] platform/x86: touchscreen_dmi: Add info for the
 Goodix GT912 panel of TM800A550L tablets
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20210428114608.101795-1-hdegoede@redhat.com>
 <20210428114608.101795-8-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <74d0c9f1-f062-8f3a-3d3f-5e9e35a1b283@redhat.com>
Date:   Fri, 21 May 2021 12:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210428114608.101795-8-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/28/21 1:46 PM, Hans de Goede wrote:
> The Bay Trail Glavey TM800A550L tablet, which ships with Android installed
> from the factory, uses a GT912 touchscreen controller which needs to have
> its firmware uploaded by the OS to work (this is a first for a x86 based
> device with a Goodix touchscreen controller).
> 
> Add a touchscreen_dmi entry for this which specifies the filenames
> to use for the firmware and config files needed for this.
> 
> Note this matches on a GDIX1001 ACPI HID, while the original DSDT uses
> a HID of GODX0911. For the touchscreen to work on these devices a DSDT
> override is necessary to fix a missing IRQ and broken GPIO settings in
> the ACPI-resources for the touchscreen. This override also changes the
> HID to the standard GDIX1001 id typically used for Goodix touchscreens.
> The DSDT override is available here:
> https://fedorapeople.org/~jwrdegoede/glavey-tm800a550l-dsdt-override/
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Note this patch is part of the
"[GIT PULL] Immutable branch between drivers/platform/x86 and drivers/input due for the v5.14 merge window"
pull-req which I just send out, leaving patches 1-6 to be merged through
the input tree (after merging the pull-req).

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 90fe4f8f3c2c..d95f04b61111 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -273,6 +273,18 @@ static const struct ts_dmi_data estar_beauty_hd_data = {
>  	.properties	= estar_beauty_hd_props,
>  };
>  
> +static const struct property_entry glavey_tm800a550l_props[] = {
> +	PROPERTY_ENTRY_STRING("firmware-name", "gt912-glavey-tm800a550l.fw"),
> +	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-glavey-tm800a550l.cfg"),
> +	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data glavey_tm800a550l_data = {
> +	.acpi_name	= "GDIX1001:00",
> +	.properties	= glavey_tm800a550l_props,
> +};
> +
>  static const struct property_entry gp_electronic_t701_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
> @@ -1003,6 +1015,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
>  		},
>  	},
> +	{	/* Glavey TM800A550L */
> +		.driver_data = (void *)&glavey_tm800a550l_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
> +			/* Above strings are too generic, also match on BIOS version */
> +			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
> +		},
> +	},
>  	{
>  		/* GP-electronic T701 */
>  		.driver_data = (void *)&gp_electronic_t701_data,
> 

