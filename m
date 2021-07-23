Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D223D3998
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 13:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhGWK5O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 06:57:14 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:35797 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbhGWK5O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 06:57:14 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 12946100006;
        Fri, 23 Jul 2021 11:37:45 +0000 (UTC)
Message-ID: <ac1c288bc64183128d7bc0da09573ca6aaa6f299.camel@hadess.net>
Subject: Re: [PATCH v2] HID: logitech-hidpp: battery: provide CAPACITY
 property for newer devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Hamza Mahfooz <someguy@effective-light.com>,
        linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        linux-input@vger.kernel.org
Date:   Fri, 23 Jul 2021 13:37:45 +0200
In-Reply-To: <20210723112337.101495-1-someguy@effective-light.com>
References: <20210723112337.101495-1-someguy@effective-light.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-07-23 at 07:23 -0400, Hamza Mahfooz wrote:
> For devices that only support the BATTERY_VOLTAGE (0x1001) feature,
> UPower
> requires the additional information provided by this patch, to set
> them up.
> 
> v2: use ARRAY_SIZE() and set voltages[]'s size to 100

This information should be under the "---" below, so that it gets
stripped when the patch is applied by git. I'm sure Jiri can fix that
up though.

> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 61635e629469..6d63804a9a0f 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -1331,6 +1331,31 @@ static int
> hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
>         return 0;
>  }
>  
> +static int hidpp20_map_battery_capacity(int voltage)
> +{
> +       static const int voltages[100] = {

Looks good to me.

Is there a way to make sure that there are actually 100 values being
set in the array?

> +               4186, 4156, 4143, 4133, 4122, 4113, 4103, 4094, 4086,
> 4075,
> +               4067, 4059, 4051, 4043, 4035, 4027, 4019, 4011, 4003,
> 3997,
> +               3989, 3983, 3976, 3969, 3961, 3955, 3949, 3942, 3935,
> 3929,
> +               3922, 3916, 3909, 3902, 3896, 3890, 3883, 3877, 3870,
> 3865,
> +               3859, 3853, 3848, 3842, 3837, 3833, 3828, 3824, 3819,
> 3815,
> +               3811, 3808, 3804, 3800, 3797, 3793, 3790, 3787, 3784,
> 3781,
> +               3778, 3775, 3772, 3770, 3767, 3764, 3762, 3759, 3757,
> 3754,
> +               3751, 3748, 3744, 3741, 3737, 3734, 3730, 3726, 3724,
> 3720,
> +               3717, 3714, 3710, 3706, 3702, 3697, 3693, 3688, 3683,
> 3677,
> +               3671, 3666, 3662, 3658, 3654, 3646, 3633, 3612, 3579,
> 3537
> +       };
> +
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(voltages); i++) {
> +               if (voltage >= voltages[i])
> +                       return ARRAY_SIZE(voltages) - i;
> +       }
> +
> +       return 0;
> +}
> +
>  static int hidpp20_query_battery_voltage_info(struct hidpp_device
> *hidpp)
>  {
>         u8 feature_type;
> @@ -1354,6 +1379,7 @@ static int
> hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
>  
>         hidpp->battery.status = status;
>         hidpp->battery.voltage = voltage;
> +       hidpp->battery.capacity =
> hidpp20_map_battery_capacity(voltage);
>         hidpp->battery.level = level;
>         hidpp->battery.charge_type = charge_type;
>         hidpp->battery.online = status !=
> POWER_SUPPLY_STATUS_NOT_CHARGING;
> @@ -1378,6 +1404,7 @@ static int hidpp20_battery_voltage_event(struct
> hidpp_device *hidpp,
>  
>         if (voltage != hidpp->battery.voltage || status != hidpp-
> >battery.status) {
>                 hidpp->battery.voltage = voltage;
> +               hidpp->battery.capacity =
> hidpp20_map_battery_capacity(voltage);
>                 hidpp->battery.status = status;
>                 hidpp->battery.level = level;
>                 hidpp->battery.charge_type = charge_type;
> @@ -3717,7 +3744,8 @@ static int hidpp_initialize_battery(struct
> hidpp_device *hidpp)
>         num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
>  
>         if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
> -           hidpp->capabilities &
> HIDPP_CAPABILITY_BATTERY_PERCENTAGE)
> +           hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE
> ||
> +           hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
>                 battery_props[num_battery_props++] =
>                                 POWER_SUPPLY_PROP_CAPACITY;
>  


