Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DC562A33F
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 21:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiKOUoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 15:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiKOUoh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 15:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926DF65E7
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668545019;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eYbltNUTzC+ZTm36iUyIznZBpyhokfqXoPOARw2dPJE=;
        b=H4tG4hk34P5CzsNqSOLwXYC7Xluq6MH2/qkp5iPCUfCN92NL/iozN5j5GygEz+h3kzUZGV
        aGXmTnPIzcckX1GWcc/SW+r6ho1HIqP/Z7ZDjWW1RAzc6ud4Iq1fjnAAjK+dQulzyknvcV
        yETHxqB3nixc8BmcvLikXgiHOU+FPiI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-Oy0-SpRmPOSDt33tBVddeA-1; Tue, 15 Nov 2022 15:43:38 -0500
X-MC-Unique: Oy0-SpRmPOSDt33tBVddeA-1
Received: by mail-ej1-f70.google.com with SMTP id ga41-20020a1709070c2900b007aef14e8fd7so4094624ejc.21
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 12:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYbltNUTzC+ZTm36iUyIznZBpyhokfqXoPOARw2dPJE=;
        b=4+qncS7jyH4qeNakJvLgZcAsGB8CnvqSHh1iUNBOz466atfXJ4YTxzZsYLsex8OEwi
         67lm9vWH3VJndHhFcUGyOvBjemYzG5q6yMvJ6LT5hFrnSnzM3SMtaifhM3TGDGJjgT02
         yP1E1yiGEM1ATE/8qv3WeFsofVNsLyY5r+vR93BdBtTY/ShkeelXJYJi+y5j7zztnLji
         8MyzBhIej6Pn/qEsLYfn4wM/N0B1CibGNiS3esWP8FN5mj6uhFOhyS1a0iP1RkcwdvvH
         2nfARj3QjvG+OiF2jTfPlNsEkBLcNZIZMQCA+DxN/gfZdKTp7atWm/Ghoyw5mcLMPq00
         LlyA==
X-Gm-Message-State: ANoB5pk1bfrPvy+KKUDrssvLH5ZgBixE0mpNzLgTKaUB277Ggr5JXzQF
        QkNbcNeuPc4ieUn9vZaqb+FropcFQ+HbZD0+Tf1IblJ7mU6K6zstOJef4GvKpD4M2bTK1Q5nNr+
        bLdQParRVy5akm3u5/ae0ANE=
X-Received: by 2002:a17:906:c013:b0:78d:ff14:63f9 with SMTP id e19-20020a170906c01300b0078dff1463f9mr14929425ejz.516.1668545017068;
        Tue, 15 Nov 2022 12:43:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7tsEoP9ppl43X85kim3kXTdE5g1JBrmdDOTh29MX8gL0DJOSRo5m5jKetdoBqO83osSSuKWA==
X-Received: by 2002:a17:906:c013:b0:78d:ff14:63f9 with SMTP id e19-20020a170906c01300b0078dff1463f9mr14929409ejz.516.1668545016816;
        Tue, 15 Nov 2022 12:43:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id qq18-20020a17090720d200b00773f3ccd989sm5947811ejb.68.2022.11.15.12.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 12:43:36 -0800 (PST)
Message-ID: <dde0d934-45be-8b12-bdf6-0c3de7321731@redhat.com>
Date:   Tue, 15 Nov 2022 21:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 5/7] platform/x86: ideapad-laptop: Expose camera_power
 only if supported
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        ike.pan@canonical.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        mgross@linux.intel.com, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <20221029120311.11152-6-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221029120311.11152-6-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Eray,

On 10/29/22 14:03, Eray Orçunus wrote:
> IdeaPads dropped support for VPCCMD_W_CAMERA somewhere between 2014-2016,
> none of the IdeaPads produced after that I tested supports it. Fortunately
> I found a way to check it; if the DSDT has camera device(s) defined, it
> shouldn't have working VPCCMD_W_CAMERA, thus camera_power shouldn't be
> exposed to sysfs. To accomplish this, walk the ACPI namespace in
> ideapad_check_features and check the devices starting with "CAM".
> Tested on 520-15IKB and Legion Y520, which successfully didn't expose
> the camera_power attribute.
> 
> Link: https://www.spinics.net/lists/platform-driver-x86/msg26147.html
> Signed-off-by: Eray Orçunus <erayorcunus@gmail.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 52 ++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index f3d4f2beda07..e8c088e7a53d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -149,6 +149,7 @@ struct ideapad_private {
>  		bool fn_lock              : 1;
>  		bool hw_rfkill_switch     : 1;
>  		bool kbd_bl               : 1;
> +		bool cam_ctrl_via_ec      : 1;
>  		bool touchpad_ctrl_via_ec : 1;
>  		bool usb_charging         : 1;
>  	} features;
> @@ -163,6 +164,24 @@ static bool no_bt_rfkill;
>  module_param(no_bt_rfkill, bool, 0444);
>  MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
>  
> +static acpi_status acpi_find_device_callback(acpi_handle handle, u32 level,
> +					     void *context, void **return_value)
> +{
> +	struct acpi_buffer ret_buf;
> +	char buffer[8];
> +
> +	ret_buf.length = sizeof(buffer);
> +	ret_buf.pointer = buffer;
> +
> +	if (ACPI_SUCCESS(acpi_get_name(handle, ACPI_SINGLE_NAME, &ret_buf)))
> +		if (strstarts(ret_buf.pointer, context)) {
> +			*return_value = handle;
> +			return AE_CTRL_TERMINATE;
> +		}
> +
> +	return AE_OK;
> +}
> +
>  /*
>   * ACPI Helpers
>   */
> @@ -675,7 +694,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>  	bool supported = true;
>  
>  	if (attr == &dev_attr_camera_power.attr)
> -		supported = test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
> +		supported = priv->features.cam_ctrl_via_ec;
>  	else if (attr == &dev_attr_conservation_mode.attr)
>  		supported = priv->features.conservation_mode;
>  	else if (attr == &dev_attr_fan_mode.attr)
> @@ -1527,6 +1546,37 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  
>  	priv->features.hw_rfkill_switch = dmi_check_system(hw_rfkill_list);
>  
> +	/*
> +	 * Some IdeaPads have camera switch via EC (mostly older ones),
> +	 * some don't. Fortunately we know that if DSDT contains device
> +	 * object for the camera, camera isn't switchable via EC.
> +	 * So, let's walk the namespace and try to find CAM* object.
> +	 * If we can't find it, set cam_ctrl_via_ec to true.
> +	 */
> +
> +	priv->features.cam_ctrl_via_ec = false;

There is no need to explicitly set this to false since the entire
struct is allocated with kzalloc() and a bunch of other features
flags are also not explicitly set to false. Please drop this line.

> +
> +	if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg)) {
> +		acpi_handle temp_handle = NULL;
> +		acpi_handle pci_handle;
> +		acpi_status status;
> +
> +		status = acpi_get_handle(handle, "^^^", &pci_handle);
> +		if (ACPI_SUCCESS(status)) {
> +			status = acpi_walk_namespace(ACPI_TYPE_DEVICE, pci_handle,
> +						     ACPI_UINT32_MAX,
> +						     acpi_find_device_callback,
> +						     NULL, "CAM",
> +						     &temp_handle);

Why not just use acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ... ?

The PCI root is usually pretty much the only object under the root anyways
and this way you can avoid the acpi_get_handle() call + its error handling,
so using ACPI_ROOT_OBJECT would lead to a nice cleanup.

> +
> +			if (ACPI_SUCCESS(status) && temp_handle == NULL)
> +				priv->features.cam_ctrl_via_ec = true;
> +
> +		} else
> +			dev_warn(&priv->platform_device->dev,
> +				"Could not find PCI* node in the namespace\n");
> +	}
> +
>  	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
>  	priv->features.touchpad_ctrl_via_ec = !acpi_dev_present("ELAN0634", NULL, -1);
>  

Regards,

Hans


