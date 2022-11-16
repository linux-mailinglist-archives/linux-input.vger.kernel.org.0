Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA562C2CA
	for <lists+linux-input@lfdr.de>; Wed, 16 Nov 2022 16:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbiKPPlI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 10:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbiKPPk4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 10:40:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E3C23178
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668613196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LN7qIxV9HlSLZ1pc9dnXjNldf+vBoEMzdufIgxzjJwM=;
        b=g0e8FGlUGzWf8b0hdCdjsfsTpky5ccCSGnNVnjC9a979IGnaM/Bu0eGO1+JbNa4QyP+2P+
        +dRT6GSmGnFOWJHoOPsyyCv8Js3c69keb1P0l/+okhF1us/VhymdOy55HzPmrldfRBLY2M
        0Awl6gJOy6ngHyb6YA/DTn7kdY3gM24=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-YZMRUxutNtG-TlKcaYjj7w-1; Wed, 16 Nov 2022 10:39:55 -0500
X-MC-Unique: YZMRUxutNtG-TlKcaYjj7w-1
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso10126239ejb.14
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 07:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LN7qIxV9HlSLZ1pc9dnXjNldf+vBoEMzdufIgxzjJwM=;
        b=5ESbhHlCpO+u7l//u3b7m2XyD9WnLducBERZ5lNXBP6x9rG0IrrKB17QLpgt350fG8
         LNT6/CeJ4KMvkwGuSyXrMaP6uQ75EJdvq/WmM8y3qArjeimGgt3xpHTI09b/YJsyaa1Z
         +TLbyQbUANFfyiAqgjeZb/vr6Gxo6sfUubHoe8sy/MVGsJjZyuMrbaGmJDOrKJ1+LGus
         JrQ7hj7mIUXtJmJanmuPqlTSRVM1FTgUsywenInqpe42m9UR8Aihe6LR3Ja+yP7fAMwj
         +Mr/zDWLtxRMyBAcImOY2VdjfSxLMpN8CMJqJFw0yGgQuc6ojxbkXJRyEClHuFMVh/wV
         kXlA==
X-Gm-Message-State: ANoB5pk7dSCoUpVW45cODBA1Wdte1JdglF9DXknLXV+sIXo97dDDGBiW
        OLyJ0dgI/YsVzuYU6KJTucWxWg80JCXEbYUDrUTkFHLYJP56yB/AmRmZy+/lK42ImqEL5OrJisk
        SQHl15CvT2zbaFxet8LyBfWU=
X-Received: by 2002:a05:6402:1506:b0:461:79ee:ee8 with SMTP id f6-20020a056402150600b0046179ee0ee8mr19363705edw.194.1668613193723;
        Wed, 16 Nov 2022 07:39:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7bxC9Cgs36C5mzoOjaen4QSgP/qjpL3VkFF0BAmN7ZE/42z/Zagyt1vbtZ/KXPMW9c84JIJQ==
X-Received: by 2002:a05:6402:1506:b0:461:79ee:ee8 with SMTP id f6-20020a056402150600b0046179ee0ee8mr19363684edw.194.1668613193554;
        Wed, 16 Nov 2022 07:39:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y1-20020a170906470100b007ae1e52805dsm6954943ejq.103.2022.11.16.07.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:39:52 -0800 (PST)
Message-ID: <d2124ddc-7e62-96af-62c5-2c44f181fe66@redhat.com>
Date:   Wed, 16 Nov 2022 16:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 5/7] platform/x86: ideapad-laptop: Expose camera_power
 only if supported
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        ike.pan@canonical.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        mgross@linux.intel.com, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <20221029120311.11152-6-erayorcunus@gmail.com>
 <dde0d934-45be-8b12-bdf6-0c3de7321731@redhat.com>
In-Reply-To: <dde0d934-45be-8b12-bdf6-0c3de7321731@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Eray,

On 11/15/22 21:43, Hans de Goede wrote:
> Hi Eray,
> 
> On 10/29/22 14:03, Eray Orçunus wrote:
>> IdeaPads dropped support for VPCCMD_W_CAMERA somewhere between 2014-2016,
>> none of the IdeaPads produced after that I tested supports it. Fortunately
>> I found a way to check it; if the DSDT has camera device(s) defined, it
>> shouldn't have working VPCCMD_W_CAMERA, thus camera_power shouldn't be
>> exposed to sysfs. To accomplish this, walk the ACPI namespace in
>> ideapad_check_features and check the devices starting with "CAM".
>> Tested on 520-15IKB and Legion Y520, which successfully didn't expose
>> the camera_power attribute.
>>
>> Link: https://www.spinics.net/lists/platform-driver-x86/msg26147.html
>> Signed-off-by: Eray Orçunus <erayorcunus@gmail.com>
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 52 ++++++++++++++++++++++++++-
>>  1 file changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index f3d4f2beda07..e8c088e7a53d 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -149,6 +149,7 @@ struct ideapad_private {
>>  		bool fn_lock              : 1;
>>  		bool hw_rfkill_switch     : 1;
>>  		bool kbd_bl               : 1;
>> +		bool cam_ctrl_via_ec      : 1;
>>  		bool touchpad_ctrl_via_ec : 1;
>>  		bool usb_charging         : 1;
>>  	} features;
>> @@ -163,6 +164,24 @@ static bool no_bt_rfkill;
>>  module_param(no_bt_rfkill, bool, 0444);
>>  MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
>>  
>> +static acpi_status acpi_find_device_callback(acpi_handle handle, u32 level,
>> +					     void *context, void **return_value)
>> +{
>> +	struct acpi_buffer ret_buf;
>> +	char buffer[8];
>> +
>> +	ret_buf.length = sizeof(buffer);
>> +	ret_buf.pointer = buffer;
>> +
>> +	if (ACPI_SUCCESS(acpi_get_name(handle, ACPI_SINGLE_NAME, &ret_buf)))
>> +		if (strstarts(ret_buf.pointer, context)) {
>> +			*return_value = handle;
>> +			return AE_CTRL_TERMINATE;
>> +		}
>> +
>> +	return AE_OK;
>> +}
>> +
>>  /*
>>   * ACPI Helpers
>>   */
>> @@ -675,7 +694,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>>  	bool supported = true;
>>  
>>  	if (attr == &dev_attr_camera_power.attr)
>> -		supported = test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
>> +		supported = priv->features.cam_ctrl_via_ec;
>>  	else if (attr == &dev_attr_conservation_mode.attr)
>>  		supported = priv->features.conservation_mode;
>>  	else if (attr == &dev_attr_fan_mode.attr)
>> @@ -1527,6 +1546,37 @@ static void ideapad_check_features(struct ideapad_private *priv)
>>  
>>  	priv->features.hw_rfkill_switch = dmi_check_system(hw_rfkill_list);
>>  
>> +	/*
>> +	 * Some IdeaPads have camera switch via EC (mostly older ones),
>> +	 * some don't. Fortunately we know that if DSDT contains device
>> +	 * object for the camera, camera isn't switchable via EC.
>> +	 * So, let's walk the namespace and try to find CAM* object.
>> +	 * If we can't find it, set cam_ctrl_via_ec to true.
>> +	 */
>> +
>> +	priv->features.cam_ctrl_via_ec = false;
> 
> There is no need to explicitly set this to false since the entire
> struct is allocated with kzalloc() and a bunch of other features
> flags are also not explicitly set to false. Please drop this line.
> 
>> +
>> +	if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg)) {
>> +		acpi_handle temp_handle = NULL;
>> +		acpi_handle pci_handle;
>> +		acpi_status status;
>> +
>> +		status = acpi_get_handle(handle, "^^^", &pci_handle);
>> +		if (ACPI_SUCCESS(status)) {
>> +			status = acpi_walk_namespace(ACPI_TYPE_DEVICE, pci_handle,
>> +						     ACPI_UINT32_MAX,
>> +						     acpi_find_device_callback,
>> +						     NULL, "CAM",
>> +						     &temp_handle);
> 
> Why not just use acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ... ?
> 
> The PCI root is usually pretty much the only object under the root anyways
> and this way you can avoid the acpi_get_handle() call + its error handling,
> so using ACPI_ROOT_OBJECT would lead to a nice cleanup.

Note when you send out a new version of this patch + patch 6/7,
please base it on top of my current review-hans branch since
a bunch of other ideapad-laptop changes have landed there.

Regards,

Hans


