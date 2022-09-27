Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289115EC512
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 15:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbiI0N40 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 09:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiI0N4Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 09:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BFF9E0E1
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664286984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G5Xua/j/WDmJL42z8sQG3qQtotfZuTF0DnaN4t3gukM=;
        b=EglRKAqZlqm4W4Qvl+ORzfOui6rB6oHFynCEmWh9FGNB7S1NepLRIJJufap91JITJU+nIu
        Vz2LvIZUHjHJxehTNeo6KqW+89aCnEX/sQ+JIAtWG1aAFkn2NtEuoY04BajqkNvJpjBaS/
        gWpRegdjpP+suGzEVIJdl2VlWHjqZAw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-FoZ4Lb1oPOGt_J2KEofEXA-1; Tue, 27 Sep 2022 09:56:23 -0400
X-MC-Unique: FoZ4Lb1oPOGt_J2KEofEXA-1
Received: by mail-ej1-f70.google.com with SMTP id sb34-20020a1709076da200b00783a5f786easo2790280ejc.22
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 06:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=G5Xua/j/WDmJL42z8sQG3qQtotfZuTF0DnaN4t3gukM=;
        b=Qo7M77fCNjmZ5b8gkVHLr4UBCJuXcq3wAgVSo1t2oOr2O7NZ+2wSFu8omiADQ7p7O+
         lgP2j9jKJ4BXMQMMR6W4xCij9DIJ+zhQXshBmtiNaaeBVbcU3TtWNAGiKh1RUVGRFpc4
         UcnqL1hnQt6NbhdTcyKr28qcQv4dKUpRewoEcAaa8cuPV24nJdD3VA7hGDIo/+wksTTe
         wznp3+xizQOM7Z6P+K0e84mWe32bRZYfAN9afh4EGW1yg/qE3jIc2YIiJktIPz1QomwT
         jVTgK2vFMr23ZRdBjqD6lj4BDQNX07Ic3ysU/JV1MbUIv+ZGwXu3LjB5ruwZNcxljE4v
         JOIQ==
X-Gm-Message-State: ACrzQf2I/K9YQb+GhTo266GFRr+6lK0dAC7RsTHSI/vIsq9kv7F9pQzZ
        cb8PNNA+9gmpvDq3TRmaRLw87734JR5afzvq8A3T9inZNnexKeqvIXgncHgUew5VUc3G8NXU6SG
        pnTYw5S3w+FmtCG9mcYdORWU=
X-Received: by 2002:a17:906:5d07:b0:781:c281:f6e4 with SMTP id g7-20020a1709065d0700b00781c281f6e4mr23046563ejt.744.1664286980488;
        Tue, 27 Sep 2022 06:56:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uXpxv8Fd+UAsejae4KeZD0FU7EkKhFURd7O+v/DyHvK9CGtfpBdVE6Xddt51N0e4hs7Plzg==
X-Received: by 2002:a17:906:5d07:b0:781:c281:f6e4 with SMTP id g7-20020a1709065d0700b00781c281f6e4mr23046547ejt.744.1664286980279;
        Tue, 27 Sep 2022 06:56:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cw15-20020a170906c78f00b0073022b796a7sm840856ejb.93.2022.09.27.06.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:56:19 -0700 (PDT)
Message-ID: <04c8d948-4d90-69b2-45a3-d992eb0793aa@redhat.com>
Date:   Tue, 27 Sep 2022 15:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add quirk for buttons
 on Z830
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input@vger.kernel.org, Azael Avalos <coproscefalo@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20220922182424.934340-1-lkml@vorpal.se>
 <20220922182424.934340-3-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220922182424.934340-3-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/22/22 20:24, Arvid Norlander wrote:
> The Z830 has some buttons that will only work properly as "quickstart"
> buttons. To enable them in that mode, a value between 1 and 7 must be
> used for HCI_HOTKEY_EVENT. Windows uses 0x5 on this laptop so use that for
> maximum predictability and compatibility.
> 
> As there is not yet a known way of auto detection, this patch uses a DMI
> quirk table. A module parameter is exposed to allow setting this on other
> models for testing.
> 
> Signed-off-by: Arvid Norlander <lkml@vorpal.se>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note I assume that it is best to merge the 2 patches together, so I won't
merge this now. Please add my Reviewed-by to the next version of the patch.

Regards,

Hans

> ---
>  drivers/platform/x86/toshiba_acpi.c | 36 ++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 9f1394b73895..894afe74d815 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -58,6 +58,11 @@ module_param(turn_on_panel_on_resume, int, 0644);
>  MODULE_PARM_DESC(turn_on_panel_on_resume,
>  	"Call HCI_PANEL_POWER_ON on resume (-1 = auto, 0 = no, 1 = yes");
>  
> +static int hci_hotkey_quickstart = -1;
> +module_param(hci_hotkey_quickstart, int, 0644);
> +MODULE_PARM_DESC(hci_hotkey_quickstart,
> +	"Call HCI_HOTKEY_EVENT with value 0x5 for quickstart button support (-1 = auto, 0 = no, 1 = yes");
> +
>  #define TOSHIBA_WMI_EVENT_GUID "59142400-C6A3-40FA-BADB-8A2652834100"
>  
>  /* Scan code for Fn key on TOS1900 models */
> @@ -137,6 +142,7 @@ MODULE_PARM_DESC(turn_on_panel_on_resume,
>  #define HCI_ACCEL_MASK			0x7fff
>  #define HCI_ACCEL_DIRECTION_MASK	0x8000
>  #define HCI_HOTKEY_DISABLE		0x0b
> +#define HCI_HOTKEY_ENABLE_QUICKSTART	0x05
>  #define HCI_HOTKEY_ENABLE		0x09
>  #define HCI_HOTKEY_SPECIAL_FUNCTIONS	0x10
>  #define HCI_LCD_BRIGHTNESS_BITS		3
> @@ -2731,10 +2737,15 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
>  		return -ENODEV;
>  
>  	/*
> +	 * Enable quickstart buttons if supported.
> +	 *
>  	 * Enable the "Special Functions" mode only if they are
>  	 * supported and if they are activated.
>  	 */
> -	if (dev->kbd_function_keys_supported && dev->special_functions)
> +	if (hci_hotkey_quickstart)
> +		result = hci_write(dev, HCI_HOTKEY_EVENT,
> +				   HCI_HOTKEY_ENABLE_QUICKSTART);
> +	else if (dev->kbd_function_keys_supported && dev->special_functions)
>  		result = hci_write(dev, HCI_HOTKEY_EVENT,
>  				   HCI_HOTKEY_SPECIAL_FUNCTIONS);
>  	else
> @@ -3260,7 +3271,14 @@ static const char *find_hci_method(acpi_handle handle)
>   * works. toshiba_acpi_resume() uses HCI_PANEL_POWER_ON to avoid changing
>   * the configured brightness level.
>   */
> -static const struct dmi_system_id turn_on_panel_on_resume_dmi_ids[] = {
> +#define QUIRK_TURN_ON_PANEL_ON_RESUME		BIT(0)
> +/*
> + * Some Toshibas use "quickstart" keys. On these, HCI_HOTKEY_EVENT must use
> + * the value HCI_HOTKEY_ENABLE_QUICKSTART.
> + */
> +#define QUIRK_HCI_HOTKEY_QUICKSTART		BIT(1)
> +
> +static const struct dmi_system_id toshiba_dmi_quirks[] = {
>  	{
>  	 /* Toshiba Portégé R700 */
>  	 /* https://bugzilla.kernel.org/show_bug.cgi?id=21012 */
> @@ -3268,6 +3286,7 @@ static const struct dmi_system_id turn_on_panel_on_resume_dmi_ids[] = {
>  		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>  		DMI_MATCH(DMI_PRODUCT_NAME, "PORTEGE R700"),
>  		},
> +	 .driver_data = (void *)QUIRK_TURN_ON_PANEL_ON_RESUME,
>  	},
>  	{
>  	 /* Toshiba Satellite/Portégé R830 */
> @@ -3277,6 +3296,7 @@ static const struct dmi_system_id turn_on_panel_on_resume_dmi_ids[] = {
>  		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>  		DMI_MATCH(DMI_PRODUCT_NAME, "R830"),
>  		},
> +	 .driver_data = (void *)QUIRK_TURN_ON_PANEL_ON_RESUME,
>  	},
>  	{
>  	 /* Toshiba Satellite/Portégé Z830 */
> @@ -3284,6 +3304,7 @@ static const struct dmi_system_id turn_on_panel_on_resume_dmi_ids[] = {
>  		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>  		DMI_MATCH(DMI_PRODUCT_NAME, "Z830"),
>  		},
> +	 .driver_data = (void *)(QUIRK_TURN_ON_PANEL_ON_RESUME | QUIRK_HCI_HOTKEY_QUICKSTART),
>  	},
>  };
>  
> @@ -3292,6 +3313,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  	struct toshiba_acpi_dev *dev;
>  	const char *hci_method;
>  	u32 dummy;
> +	const struct dmi_system_id *dmi_id;
> +	long quirks = 0;
>  	int ret = 0;
>  
>  	if (toshiba_acpi)
> @@ -3444,8 +3467,15 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  	}
>  #endif
>  
> +	dmi_id = dmi_first_match(toshiba_dmi_quirks);
> +	if (dmi_id)
> +		quirks = (long)dmi_id->driver_data;
> +
>  	if (turn_on_panel_on_resume == -1)
> -		turn_on_panel_on_resume = dmi_check_system(turn_on_panel_on_resume_dmi_ids);
> +		turn_on_panel_on_resume = !!(quirks & QUIRK_TURN_ON_PANEL_ON_RESUME);
> +
> +	if (hci_hotkey_quickstart == -1)
> +		hci_hotkey_quickstart = !!(quirks & QUIRK_HCI_HOTKEY_QUICKSTART);
>  
>  	toshiba_wwan_available(dev);
>  	if (dev->wwan_supported)

