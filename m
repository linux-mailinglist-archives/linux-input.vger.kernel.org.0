Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF07400FB0
	for <lists+linux-input@lfdr.de>; Sun,  5 Sep 2021 14:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237973AbhIEMs2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Sep 2021 08:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40715 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231622AbhIEMs1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Sep 2021 08:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630846044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Aa3OOJPvKuAfXRfL4dn1rK9HiOHrBtnpDrFWE/WBIno=;
        b=X3JiBVOfLHYXszoDgrfz4FFiui8gBWepMK8EZR9SqHwT2t/mfg5OkHthWWWpMoUCsoZzWY
        Gc/08XeGMgqiOWjHF7Ml657YjJId1i8j3mI93KkFNtdSaDpyxvYmWEaYHTRjZ5KkX51dyC
        b+Q8/MR8gOOuXbs0K8ejD6Kubm3vigQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-QAPx8gt_MA2nSI1HZq2AsQ-1; Sun, 05 Sep 2021 08:47:22 -0400
X-MC-Unique: QAPx8gt_MA2nSI1HZq2AsQ-1
Received: by mail-ed1-f72.google.com with SMTP id y10-20020a056402270a00b003c8adc4d40cso2152591edd.15
        for <linux-input@vger.kernel.org>; Sun, 05 Sep 2021 05:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Aa3OOJPvKuAfXRfL4dn1rK9HiOHrBtnpDrFWE/WBIno=;
        b=JkybUDAX/4RRvGDr66nAr4uBkeT3nVDCM0LYmpaBOyLJcWloQ2uc9lKbHDZz/wBaYL
         L4tyyixgHyeS0C4/yWNwQ0g+vro5KjV17ppAi4S/tJrPcksj26CNyxDwOt4uH8EQ4WVA
         8YyU7tmAGEl2nOPgZ9JWRZ44a/bfM1BzKuu8bojuSV00AJ4NWfPvEn1I9BTAqz+KOnTl
         kjUAwQon7UmevL9xag+YS9psagOCO6dVP74CaUao+iW78H/Gbot/LgZcd3kGsoEum/YL
         T7/JYO0RIKfjC55BaVlODKqPTM84lQTpMMH5TWEWSdZ8HPuqWJV/AwPyOApGXQO95rW5
         O1Xg==
X-Gm-Message-State: AOAM5302s/Zfvc9jVyxXhiKhUktzLOGF+JJS2gyIZKDYt3K5FkCA6xkg
        9mWOTqZe7JsbXhhRdSKnCc91HfUr2rosE2LJzTF0xhFa0DFgg/vpywjSm3POfIpz11LAUXWSpyW
        oGGMIVuzVseR6ZPLAeHER/aM=
X-Received: by 2002:a05:6402:34c2:: with SMTP id w2mr8444033edc.36.1630846041448;
        Sun, 05 Sep 2021 05:47:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBpTjZd57JJ9VjmN44qRouQTIfFRUCFRHr8vO0LZj0rfC+GDU0oornMdQTNAvPGKwIdjXq4Q==
X-Received: by 2002:a05:6402:34c2:: with SMTP id w2mr8444022edc.36.1630846041267;
        Sun, 05 Sep 2021 05:47:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g9sm2312056ejo.60.2021.09.05.05.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 05:47:20 -0700 (PDT)
Subject: Re: [PATCH regression fix 1/2] Input: silead - Add support for
 EFI-embedded fw using different min/max coordinates
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210905124547.31567-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <627a0fc0-61fb-090a-1adc-07ddcf6e2159@redhat.com>
Date:   Sun, 5 Sep 2021 14:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905124547.31567-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

These 2 patches obviously are not regression-fixes, I accidentally
still had a subjectprefix set when sending these, sorry about that.

Other then that these are ready for merging :)

Regards,

Hans


On 9/5/21 2:45 PM, Hans de Goede wrote:
> Unfortunately, at the time of writing this commit message, we have been
> unable to get permission from Silead, or from device OEMs, to distribute
> the necessary Silead firmware files in linux-firmware.
> 
> On a whole bunch of devices the UEFI BIOS code contains a touchscreen
> driver, which contains an embedded copy of the firmware. The fw-loader
> code has a "platform" fallback mechanism, which together with info on the
> firmware from drivers/platform/x86/touchscreen_dmi.c will use the firmware
> from the UEFI driver when the firmware is missing from /lib/firmware. This
> makes the touchscreen work OOTB without users needing to manually download
> the firmware.
> 
> The firmware bundled with the original Windows/Android is usually newer
> then the firmware in the UEFI driver and it is better calibrated. This
> better calibration can lead to significant differences in the reported
> min/max coordinates.
> 
> Add support for a new (optional) "silead,efi-fw-min-max" property which
> provides a set of alternative min/max values to use for the x/y axis when
> the EFI embedded firmware is used.
> 
> The new property is only used on (x86) devices which do not use devicetree,
> IOW it is not used in actual devicetree files. The devicetree-bindings
> maintainers have requested properties like these to not be added to the
> devicetree-bindings, so the new property is deliberately not added to the
> existing silead devicetree-bindings documentation.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/silead.c | 73 ++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 1ee760bac0cf..caa25af53e6e 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -75,6 +75,8 @@ struct silead_ts_data {
>  	struct input_mt_pos pos[SILEAD_MAX_FINGERS];
>  	int slots[SILEAD_MAX_FINGERS];
>  	int id[SILEAD_MAX_FINGERS];
> +	u32 efi_fw_min_max[4];
> +	bool efi_fw_min_max_set;
>  };
>  
>  struct silead_fw_data {
> @@ -82,6 +84,35 @@ struct silead_fw_data {
>  	u32 val;
>  };
>  
> +static void silead_apply_efi_fw_min_max(struct silead_ts_data *data)
> +{
> +	struct input_absinfo *absinfo_x = &data->input->absinfo[ABS_MT_POSITION_X];
> +	struct input_absinfo *absinfo_y = &data->input->absinfo[ABS_MT_POSITION_Y];
> +
> +	if (!data->efi_fw_min_max_set)
> +		return;
> +
> +	absinfo_x->minimum = data->efi_fw_min_max[0];
> +	absinfo_x->maximum = data->efi_fw_min_max[1];
> +	absinfo_y->minimum = data->efi_fw_min_max[2];
> +	absinfo_y->maximum = data->efi_fw_min_max[3];
> +
> +	if (data->prop.invert_x) {
> +		absinfo_x->maximum -= absinfo_x->minimum;
> +		absinfo_x->minimum = 0;
> +	}
> +
> +	if (data->prop.invert_y) {
> +		absinfo_y->maximum -= absinfo_y->minimum;
> +		absinfo_y->minimum = 0;
> +	}
> +
> +	if (data->prop.swap_x_y) {
> +		swap(absinfo_x->minimum, absinfo_y->minimum);
> +		swap(absinfo_x->maximum, absinfo_y->maximum);
> +	}
> +}
> +
>  static int silead_ts_request_input_dev(struct silead_ts_data *data)
>  {
>  	struct device *dev = &data->client->dev;
> @@ -97,6 +128,7 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
>  	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
>  	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
>  	touchscreen_parse_properties(data->input, true, &data->prop);
> +	silead_apply_efi_fw_min_max(data);
>  
>  	input_mt_init_slots(data->input, data->max_fingers,
>  			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
> @@ -282,17 +314,48 @@ static int silead_ts_load_fw(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct silead_ts_data *data = i2c_get_clientdata(client);
> -	unsigned int fw_size, i;
> -	const struct firmware *fw;
> +	const struct firmware *fw = NULL;
>  	struct silead_fw_data *fw_data;
> +	unsigned int fw_size, i;
>  	int error;
>  
>  	dev_dbg(dev, "Firmware file name: %s", data->fw_name);
>  
> -	error = firmware_request_platform(&fw, data->fw_name, dev);
> +	/*
> +	 * Unfortunately, at the time of writing this comment, we have been unable to
> +	 * get permission from Silead, or from device OEMs, to distribute the necessary
> +	 * Silead firmware files in linux-firmware.
> +	 *
> +	 * On a whole bunch of devices the UEFI BIOS code contains a touchscreen driver,
> +	 * which contains an embedded copy of the firmware. The fw-loader code has a
> +	 * "platform" fallback mechanism, which together with info on the firmware
> +	 * from drivers/platform/x86/touchscreen_dmi.c will use the firmware from the
> +	 * UEFI driver when the firmware is missing from /lib/firmware. This makes the
> +	 * touchscreen work OOTB without users needing to manually download the firmware.
> +	 *
> +	 * The firmware bundled with the original Windows/Android is usually newer then
> +	 * the firmware in the UEFI driver and it is better calibrated. This better
> +	 * calibration can lead to significant differences in the reported min/max
> +	 * coordinates.
> +	 *
> +	 * To deal with this we first try to load the firmware without "platform"
> +	 * fallback. If that fails we retry with "platform" fallback and if that
> +	 * succeeds we apply an (optional) set of alternative min/max values from the
> +	 * "silead,efi-fw-min-max" property.
> +	 */
> +	error = firmware_request_nowarn(&fw, data->fw_name, dev);
>  	if (error) {
> -		dev_err(dev, "Firmware request error %d\n", error);
> -		return error;
> +		error = firmware_request_platform(&fw, data->fw_name, dev);
> +		if (error) {
> +			dev_err(dev, "Firmware request error %d\n", error);
> +			return error;
> +		}
> +
> +		error = device_property_read_u32_array(dev, "silead,efi-fw-min-max",
> +						       data->efi_fw_min_max,
> +						       ARRAY_SIZE(data->efi_fw_min_max));
> +		if (!error)
> +			data->efi_fw_min_max_set = true;
>  	}
>  
>  	fw_size = fw->size / sizeof(*fw_data);
> 

