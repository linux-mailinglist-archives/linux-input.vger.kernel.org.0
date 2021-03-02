Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0851D32B4AA
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhCCFYs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1836117AbhCBTnX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 14:43:23 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7A3C061788
        for <linux-input@vger.kernel.org>; Tue,  2 Mar 2021 11:42:43 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o188so7841504pfg.2
        for <linux-input@vger.kernel.org>; Tue, 02 Mar 2021 11:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PoJDU3w9Xe7GI5cAX+2QLfJx7gCAqw5S0O1ojYjFPP8=;
        b=DZaRhl8BexShAyawj7TU0r5YP0OIK6+kaSXhbifPZHutUSGiTOCpKZZr1tACiZqyYR
         UGL4uyCM0tyddafGtSUjPVMCRgaj2n4ysxyYPXc3gf6fCO/fKtVOKtNGqdHpZWPeDXoS
         dJCTbT8Lh40sMoPWh6cAq9ZRc0V3g9FgqFTLXuPa9VcztKZSOcL1q/AApj96XiZM+U5H
         88MjCP0Q2JwCuoUZbVPzpf6WlqgTnDrxtfoqrrWFBP6+j7GtscOYSvnzTlhZGakO7M2H
         37D4pdP+anqhYLGLIJd7HNt+Ac3qkNR7e2U/ajUoRmShFSFn3h/Aeq+elM/7y2fUP6fs
         poSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PoJDU3w9Xe7GI5cAX+2QLfJx7gCAqw5S0O1ojYjFPP8=;
        b=nqP0s5wzSk6HVHcBm05u7ehyG7q20tSKvxjHgiJU6E+EFMypv1fOJdSyj1xir5QCnk
         C4AmnU29CwaGbk/Sz+/JWq/z31eEqFNdgyDIgANjrgS9s4Mcvq8KMiBNxbI9NFH6SMvA
         ydn3xvSiW5lPWqmv0IH82p7W9/UXpGKRlX68MfZzpFglBAeJ3wvuOB4srRVEok+fVEhK
         tBKvLeadYgR+f17S9DYty9DfS6T/Sf3VpEFReBJekV52HlsMH4Xxm9LWH1Ki5O/vIrkO
         vWaMF2pHL/NOgGKzvqnYNgpgfupZV2ks1fGwPROSsSLxD7DTcStI7SZuFVfrNnI3+c+c
         raHA==
X-Gm-Message-State: AOAM5316j8CZoU4ryo2NSR5Nsx38ZncK71aGZ08x5YoWtz0dkSfZbAjO
        SSTgoGK/UBxruUdljIHkb/o=
X-Google-Smtp-Source: ABdhPJzVpK6GL/r8bXnITuTH4t28VcXS8Cau6TpqO4Kg63n76xDvMgdZwabJrJFcox4d00d4RmNmRA==
X-Received: by 2002:a63:c90a:: with SMTP id o10mr19535833pgg.172.1614714162876;
        Tue, 02 Mar 2021 11:42:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:2074:dba8:1918:3417])
        by smtp.gmail.com with ESMTPSA id z28sm22336264pfr.38.2021.03.02.11.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:42:41 -0800 (PST)
Date:   Tue, 2 Mar 2021 11:42:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: elants_i2c - Do not bind to i2c-hid compatible
 ACPI instantiated devices
Message-ID: <YD6VL4CwudwKs5Vo@google.com>
References: <20210302145057.112437-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302145057.112437-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 02, 2021 at 03:50:57PM +0100, Hans de Goede wrote:
> Several users have been reporting that elants_i2c gives several errors
> during probe and that their touchscreen does not work on their Lenovo AMD
> based laptops with a touchscreen with a ELAN0001 ACPI hardware-id:
> 
> [    0.550596] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vcc33 not found, using dummy regulator
> [    0.551836] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vccio not found, using dummy regulator
> [    0.560932] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.562427] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.595925] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.597974] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.621893] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.622504] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.632650] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (4d 61 69 6e): -121
> [    0.634256] elants_i2c i2c-ELAN0001:00: boot failed: -121
> [    0.699212] elants_i2c i2c-ELAN0001:00: invalid 'hello' packet: 00 00 ff ff
> [    1.630506] elants_i2c i2c-ELAN0001:00: Failed to read fw id: -121
> [    1.645508] elants_i2c i2c-ELAN0001:00: unknown packet 00 00 ff ff
> 
> Despite these errors, the elants_i2c driver stays bound to the device
> (it returns 0 from its probe method despite the errors), blocking the
> i2c-hid driver from binding.
> 
> Manually unbinding the elants_i2c driver and binding the i2c-hid driver
> makes the touchscreen work.
> 
> Check if the ACPI-fwnode for the touchscreen contains one of the i2c-hid
> compatiblity-id strings and if it has the I2C-HID spec's DSM to get the
> HID descriptor address, If it has both then make elants_i2c not bind,
> so that the i2c-hid driver can bind.
> 
> This assumes that non of the (older) elan touchscreens which actually
> need the elants_i2c driver falsely advertise an i2c-hid compatiblity-id
> + DSM in their ACPI-fwnodes. If some of them actually do have this
> false advertising, then this change may lead to regressions.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4c2b579f6c8b..510638e5ba5a 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1334,6 +1334,12 @@ static void elants_i2c_power_off(void *_data)
>  	}
>  }
>  
> +static const struct acpi_device_id i2c_hid_ids[] = {
> +	{"ACPI0C50", 0 },
> +	{"PNP0C50", 0 },
> +	{ },
> +};

This ideally needs to be protected by CONFIG_ACPI.

> +
>  static int elants_i2c_probe(struct i2c_client *client,
>  			    const struct i2c_device_id *id)
>  {
> @@ -1342,6 +1348,25 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	unsigned long irqflags;
>  	int error;
>  
> +#ifdef CONFIG_ACPI
> +	/* Don't bind to i2c-hid compatible devices, these are handled by the i2c-hid drv. */
> +	if (acpi_match_device_ids(ACPI_COMPANION(&client->dev), i2c_hid_ids) == 0) {
> +		static const guid_t i2c_hid_guid =
> +			GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
> +				  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
> +		acpi_handle handle = ACPI_HANDLE(&client->dev);
> +		union acpi_object *obj;
> +
> +		obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
> +					      ACPI_TYPE_INTEGER);
> +		if (obj) {
> +			dev_warn(&client->dev, "elants_i2c: This device appears to be an I2C-HID device, not binding\n");

No need for "elants_i2c" prefix as dev_warn already gives driver info I
believe.

> +			ACPI_FREE(obj);
> +			return -ENODEV;
> +		}
> +	}
> +#endif

Could we tuck this away into "elants_acpi_is_hid_device" and have #ifdef
protecting that and have a complementing stub?

> +
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>  		dev_err(&client->dev,
>  			"%s: i2c check functionality error\n", DEVICE_NAME);

As a cleanup should probably drop device prefix from this message as
well.

Thanks.

-- 
Dmitry
