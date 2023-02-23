Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64AFA6A0B41
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 14:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbjBWN4c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 08:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbjBWN4b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 08:56:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1969C4DBC0;
        Thu, 23 Feb 2023 05:56:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CD73EB81A2C;
        Thu, 23 Feb 2023 13:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2855FC433D2;
        Thu, 23 Feb 2023 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677160587;
        bh=1gWKPlAXdrR5hhk0WnK1PEZQpNwJnsWVqfEEC4TsUrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QbQejqM5luP4J9OuGqELRZ0ZbWk4LogvtuLg3jJEBwFp0+e3xK27PuyNYCiJFIphD
         SnmnfS8ztxnkWcP/qmLcUzGhIw/5dasN9E3N2irRYuIcODbz7OZL5xgYL74l/NJnE0
         Gtx8eX0UtGsEq1CxUkAzXw3nKn30Qx3b0+EIS1p8=
Date:   Thu, 23 Feb 2023 14:56:24 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH 1/5] HID: logitech-hidpp: Add support for ADC measurement
 feature
Message-ID: <Y/dwiDpaBBQItu0a@kroah.com>
References: <20230223132452.37958-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223132452.37958-1-hadess@hadess.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 23, 2023 at 02:24:48PM +0100, Bastien Nocera wrote:
> This is used in a number of headsets to report the voltage of the
> battery.
> 
> The voltage to capacity conversion is based on the C implementation
> in HeadsetControl.

What is "HeadsetControl"?

> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216483
> ---
>  drivers/hid/hid-logitech-hidpp.c | 174 ++++++++++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index ff1fcebf2ec7..f6365cdf2e21 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -94,6 +94,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL	BIT(7)
>  #define HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL	BIT(8)
>  #define HIDPP_CAPABILITY_HIDPP10_FAST_SCROLL	BIT(9)
> +#define HIDPP_CAPABILITY_ADC_MEASUREMENT	BIT(10)
>  
>  #define lg_map_key_clear(c)  hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
>  
> @@ -145,6 +146,7 @@ struct hidpp_battery {
>  	u8 feature_index;
>  	u8 solar_feature_index;
>  	u8 voltage_feature_index;
> +	u8 adc_measurement_feature_index;
>  	struct power_supply_desc desc;
>  	struct power_supply *ps;
>  	char name[64];
> @@ -1744,6 +1746,164 @@ static int hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
>  	return ret;
>  }
>  
> +/* -------------------------------------------------------------------------- */
> +/* 0x1f20: ADC measurement                                                    */
> +/* -------------------------------------------------------------------------- */
> +
> +#define HIDPP_PAGE_ADC_MEASUREMENT 0x1f20
> +
> +#define CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT 0x00
> +
> +#define EVENT_ADC_MEASUREMENT_STATUS_BROADCAST 0x00
> +
> +static int hidpp20_map_adc_measurement_1f20_capacity(struct hid_device *hid_dev, int voltage)
> +{
> +	/* NB: This voltage curve doesn't necessarily map perfectly to all
> +	 * devices that implement the ADC_MEASUREMENT feature. This is because
> +	 * there are a few devices that use different battery technology.
> +	 *
> +	 * Adapted from:
> +	 * https://github.com/Sapd/HeadsetControl/blob/acd972be0468e039b93aae81221f20a54d2d60f7/src/devices/logitech_g633_g933_935.c#L44-L52
> +	 */
> +

No need for a blank line.

> +	static const int voltages[] = {
> +		4030, 4024, 4018, 4011, 4003, 3994, 3985, 3975, 3963, 3951,
> +		3937, 3922, 3907, 3893, 3880, 3868, 3857, 3846, 3837, 3828,
> +		3820, 3812, 3805, 3798, 3791, 3785, 3779, 3773, 3768, 3762,
> +		3757, 3752, 3747, 3742, 3738, 3733, 3729, 3724, 3720, 3716,
> +		3712, 3708, 3704, 3700, 3696, 3692, 3688, 3685, 3681, 3677,
> +		3674, 3670, 3667, 3663, 3660, 3657, 3653, 3650, 3646, 3643,
> +		3640, 3637, 3633, 3630, 3627, 3624, 3620, 3617, 3614, 3611,
> +		3608, 3604, 3601, 3598, 3595, 3592, 3589, 3585, 3582, 3579,
> +		3576, 3573, 3569, 3566, 3563, 3560, 3556, 3553, 3550, 3546,
> +		3543, 3539, 3536, 3532, 3529, 3525, 3499, 3466, 3433, 3399,
> +	};
> +
> +	int i;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(voltages) != 100);

Why is 100 magic?  If you want it to be 100, say so up in the declaraion
so that the code will enforce that.

> +
> +	if (voltage == 0)
> +		return 0;
> +
> +	if (unlikely(voltage < 3400 || voltage >= 5000))

Why unlikely?  That should only ever be used if you can measure the
performance impact, otherwise please remove it.

> +		hid_warn_once(hid_dev,
> +			      "%s: possibly using the wrong voltage curve\n",
> +			      __func__);
> +
> +	for (i = 0; i < ARRAY_SIZE(voltages); i++) {
> +		if (voltage >= voltages[i])
> +			return ARRAY_SIZE(voltages) - i;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hidpp20_map_adc_measurement_1f20(u8 data[3], int *voltage)
> +{
> +	int status, flags;
> +
> +	flags = (int) data[2];

Why is this now an int?

> +
> +	switch (flags) {
> +	case 0x01:
> +		status = POWER_SUPPLY_STATUS_DISCHARGING;
> +		break;
> +	case 0x03:
> +		status = POWER_SUPPLY_STATUS_CHARGING;
> +		break;
> +	case 0x07:
> +		status = POWER_SUPPLY_STATUS_FULL;
> +		break;
> +	case 0x0F:
> +	default:

You are only checking it for a range 1-f, u8 is just fine, right?

> +		status = POWER_SUPPLY_STATUS_UNKNOWN;
> +		break;
> +	}
> +
> +	*voltage = get_unaligned_be16(data);
> +
> +	dbg_hid("%s: Parsed 1f20 data as flag 0x%02x voltage %dmV\n",
> +		__func__, flags, *voltage);

I doubt you need the __func__ line, right?  dynamic debug provides that
for you automatically if you ask for it.

thanks,

greg k-h
