Return-Path: <linux-input+bounces-6840-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0A988E37
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 09:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09B4E1F21DE0
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B403119D8AF;
	Sat, 28 Sep 2024 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="tuoUuYf3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B751494CC;
	Sat, 28 Sep 2024 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727509019; cv=none; b=Lz+B89eOLschBaCZ551mF7dzzhzi87juw/gHHUjcFAhqCUkDMYT31/yzO/l2BiyMDuOKf85W0ftEsO4BTDrby3ney5lZQvXPz7tvuXYZDvDtJH2qCeliplA9j1JeIbEQo9Kct7A6JeUfjKZpaeCengCNsBjbfMZt9HIDDdVvWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727509019; c=relaxed/simple;
	bh=L/4E2gZhcRq6yCmbtihxRySVsrH8HDI1EwDKSAdbxzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/LxIVU1G0oWBjzKkN8FxaW10+4uD9XSaGMdbRvRNcPd0JiIQIiW1tfEfKyhLOmFCC4JSAHpa3q+drFnXCmG6o78HHMTxq64Ms698dnBhE0iS7PjHRQSUJR6YBdAc4o/POB0gYrIEF9LZNU57hng7o3jyNtR1kpHhhCyRZZZm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=tuoUuYf3; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.27] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C07EF2FC004A;
	Sat, 28 Sep 2024 09:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727509014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0fiLT8nkIUO41rrkrh1P0QEGPogiiA26unfY98r/mU=;
	b=tuoUuYf3ZDOSjcz9rsI2tdG6CA9NUmYigJQuOB434ENqgJ6PztkPzuFA5uYpEMM0tP4AkP
	DGMnwMrXCj549fIpmJzl85oV8NSmB4JVTzWPn0M+hEfWwwNWglD+C54W+T3wmQWAAHmgiq
	jFedavPG/aDRm0O93xx1t29I3cTn604=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <cc7f3a74-5cb3-4e53-a941-2fc907c765f1@tuxedocomputers.com>
Date: Sat, 28 Sep 2024 09:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ad01bc38-3834-44c9-a5e3-540a09a20643@gmx.de>
 <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
 <0787a2ca-7d77-49ea-8607-a91fdac53d49@gmx.de>
Content-Language: de-DE
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <0787a2ca-7d77-49ea-8607-a91fdac53d49@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Armin,

Am 27.09.24 um 19:15 schrieb Armin Wolf:
> [...]
> If so, please mark your patches as "RFC" if they are not considered as 
> a potentially "final" release.
> Otherwise they might get accepted with the debug printing still inside.
Talking about noob mistakes ... I'm sorry, will do this with the next patch.
>
>>>
>>>> +
>>>> +    mutex_lock(&driver_data->wmi_access_mutex);
>>>
>>> Does the underlying ACPI method really require external locking? If 
>>> not, then please remove this mutex.
>> Taken from the out of tree driver written by Christoffer, I will ask 
>> him about this.
>>>
>>>> +    acpi_status status = wmidev_evaluate_method(wdev, 0, 
>>>> wmi_method_id, &acpi_buffer_in,
>>>> +                            &acpi_buffer_out);
>>>> +    mutex_unlock(&driver_data->wmi_access_mutex);
>>>> +    if (ACPI_FAILURE(status)) {
>>>> +        pr_err("Failed to evaluate WMI method.\n");
>>>> +        return -EIO;
>>>> +    }
>>>> +    if (!acpi_buffer_out.pointer) {
>>>> +        pr_err("Unexpected empty out buffer.\n");
>>>> +        return -ENODATA;
>>>> +    }
>>>
>>> I believe that printing error messages should be done by the callers 
>>> of this method.
>>>
>>>> +
>>>> +    *out = acpi_buffer_out.pointer;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int __wmi_method_buffer_out(struct wmi_device *wdev, 
>>>> uint32_t wmi_method_id, uint8_t *in,
>>>> +                   acpi_size in_len, uint8_t *out, acpi_size out_len)
>>>
>>> Please use size_t instead of acpi_size.
>>>
>>>> +{
>>>> +    int ret;
>>>> +    union acpi_object *acpi_object_out = NULL;
>>>
>>> union acpi_object *obj;
>>> int ret;
>> ack ack ack
>>>
>>>> +
>>>> +    ret = __wmi_method_acpi_object_out(wdev, wmi_method_id, in, 
>>>> in_len, &acpi_object_out);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    if (acpi_object_out->type != ACPI_TYPE_BUFFER) {
>>>> +        pr_err("Unexpected out buffer type. Expected: %u Got: 
>>>> %u\n", ACPI_TYPE_BUFFER,
>>>> +               acpi_object_out->type);
>>>> +        kfree(acpi_object_out);
>>>> +        return -EIO;
>>>> +    }
>>>> +    if (acpi_object_out->buffer.length != out_len) {
>>>
>>> The Windows ACPI-WMI mappers accepts oversized buffers and ignores 
>>> any additional data,
>>> so please change this code to also accept oversized buffers.
>> Only for input or also for output?
>
> Only forbuffers coming from the ACPI firmware.
ack
>
>>>
>>>> +        pr_err("Unexpected out buffer length.\n");
>>>> +        kfree(acpi_object_out);
>>>> +        return -EIO;
>>>> +    }
>>>> +
>>>> +    memcpy(out, acpi_object_out->buffer.pointer, out_len);
>>>> +    kfree(acpi_object_out);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
>>>> +                    enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods 
>>>> method,
>>>> +                    union tuxedo_nb04_wmi_8_b_in_80_b_out_input 
>>>> *input,
>>>> +                    union tuxedo_nb04_wmi_8_b_in_80_b_out_output 
>>>> *output)
>>>> +{
>>>> +    return __wmi_method_buffer_out(wdev, method, input->raw, 8, 
>>>> output->raw, 80);
>>>> +}
>>>> +
>>>> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
>>>> +                      enum 
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
>>>> +                      union 
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
>>>> +                      union 
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_output *output)
>>>> +{
>>>> +    return __wmi_method_buffer_out(wdev, method, input->raw, 496, 
>>>> output->raw, 80);
>>>> +}
>>>
>>> Those two functions seem useless to me, please use 
>>> wmi_method_buffer_out() directly by passing
>>> a pointer to the underlying struct as data and the output of 
>>> sizeof() as length.
>> They are thought of bringing some type safety into the mix so that 
>> for any method id the input/output size is correct.
>
> I do not think that this brings any real benefits when it comes to 
> type safety. Using predefined structs and sizeof()
> already takes care that the buffer size is correct, and choosing the 
> correct method id already needs to be done by
> the driver itself.
ack
>
>>>
>>>> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h 
>>>> b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
>>>> new file mode 100644
>>>> index 0000000000000..2765cbe9fcfef
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
>>>> @@ -0,0 +1,112 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * This code gives functions to avoid code duplication while 
>>>> interacting with
>>>> + * the TUXEDO NB04 wmi interfaces.
>>>> + *
>>>> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
>>>> + */
>>>> +
>>>> +#ifndef TUXEDO_NB04_WMI_UTIL_H
>>>> +#define TUXEDO_NB04_WMI_UTIL_H
>>>> +
>>>> +#include <linux/wmi.h>
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD    1
>>>> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD    2
>>>> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES    3
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE        0
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY    1
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE    2
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY    3
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII    0
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO    1
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED        1
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN        2
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW    3
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE        4
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE    5
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO    6
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE        7
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD BIT(0)
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS BIT(1)
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL BIT(2)
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS BIT(3)
>>>> +
>>>> +
>>>> +union tuxedo_nb04_wmi_8_b_in_80_b_out_input {
>>>> +    uint8_t raw[8];
>>>> +    struct __packed {
>>>> +        uint8_t device_type;
>>>> +        uint8_t reserved_0[7];
>>>> +    } get_device_status_input;
>>>> +};
>>>> +
>>>> +union tuxedo_nb04_wmi_8_b_in_80_b_out_output {
>>>> +    uint8_t raw[80];
>>>> +    struct __packed {
>>>> +        uint16_t return_status;
>>>> +        uint8_t device_enabled;
>>>> +        uint8_t kbl_type;
>>>> +        uint8_t kbl_side_bar_supported;
>>>> +        uint8_t keyboard_physical_layout;
>>>> +        uint8_t app_pages;
>>>> +        uint8_t per_key_kbl_default_color;
>>>> +        uint8_t four_zone_kbl_default_color_1;
>>>> +        uint8_t four_zone_kbl_default_color_2;
>>>> +        uint8_t four_zone_kbl_default_color_3;
>>>> +        uint8_t four_zone_kbl_default_color_4;
>>>> +        uint8_t light_bar_kbl_default_color;
>>>> +        uint8_t reserved_0[1];
>>>> +        uint16_t dedicated_gpu_id;
>>>> +        uint8_t reserved_1[64];
>>>> +    } get_device_status_output;
>>>> +};
>>>> +
>>>> +enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods {
>>>> +    WMI_AB_GET_DEVICE_STATUS    = 2,
>>>> +};
>>>> +
>>>> +
>>>> +#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX 120
>>>> +
>>>> +union tuxedo_nb04_wmi_496_b_in_80_b_out_input {
>>>> +    uint8_t raw[496];
>>>> +    struct __packed {
>>>> +        uint8_t reserved_0[15];
>>>> +        uint8_t lighting_setting_count;
>>>> +        struct {
>>>> +            uint8_t key_id;
>>>> +            uint8_t red;
>>>> +            uint8_t green;
>>>> +            uint8_t blue;
>>>> +        } 
>>>> lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX];
>>>> +    }  kbl_set_multiple_keys_input;
>>>> +};
>>>> +
>>>> +union tuxedo_nb04_wmi_496_b_in_80_b_out_output {
>>>> +    uint8_t raw[80];
>>>> +    struct __packed {
>>>> +        uint8_t return_value;
>>>> +        uint8_t reserved_0[79];
>>>> +    } kbl_set_multiple_keys_output;
>>>> +};
>>>> +
>>>> +enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods {
>>>> +    WMI_AB_KBL_SET_MULTIPLE_KEYS    = 6,
>>>> +};
>>>> +
>>>> +
>>>> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
>>>> +                    enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods 
>>>> method,
>>>> +                    union tuxedo_nb04_wmi_8_b_in_80_b_out_input 
>>>> *input,
>>>> +                    union tuxedo_nb04_wmi_8_b_in_80_b_out_output 
>>>> *output);
>>>> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
>>>> +                      enum 
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
>>>> +                      union 
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
>>>> +                      union 
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_output *output);
>>>> +
>>>> +#endif

