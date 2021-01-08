Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561982EF359
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 14:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbhAHNox (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 08:44:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:38998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727477AbhAHNow (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 08:44:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1D252399A;
        Fri,  8 Jan 2021 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610113451;
        bh=h+vDHTOmaGWbBmJWkFpmvIx5STIK8nENF4fEjQtdhuk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=q1RDuBeMA8aiW2uuttqMmoK+rCxfzwEaw5CQAb1NbGfQCv8xd4p/eGF6xg2/yStjx
         wAlJtZai7dJDFJWdyY2k9UBpPYf3Lv/FaB8p4DEUfTL14skDoSgF61L2pNSJLiwM/G
         XjSByFc2jzvheU5C9+2pFsT17bGDd1K4v5RtKwAP8cHlqgmIIwO7NYdvD5CaCcwHNm
         R3X9lteQdoLXwFJVdbq6LpeXu++38KoVJKNLuWvQ77wCL8GDB/nuBNmo5GHMqJ0GgH
         lj7EAsWawnrbJHeSDH9n3OKv342iA7M03lKzvLmS2siRp8a3H2MuWVysYactj1enbk
         4LEbb3iN7wUyA==
Date:   Fri, 8 Jan 2021 14:44:08 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
In-Reply-To: <20210104182937.1472673-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2101081438530.13752@cbobk.fhfr.pm>
References: <20210104182937.1472673-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 4 Jan 2021, lains@archlinux.org wrote:

> From: Filipe Laíns <lains@archlinux.org>
> 
> This new feature present in new devices replaces the old Battery Level
> Status (0x1000) feature. It keeps essentially the same information for
> levels (reporting critical, low, good and full) but makes these levels
> optional, the device exports a capability setting which describes which
> levels it supports. In addition to this, there is an optional
> state_of_charge paramenter that exports the battery percentage.
> 
> This patch adds support for this new feature. There were some
> implementation choices, as described below and in the code.
> 
> If the device supports the state_of_charge parameter, we will just
> export the battery percentage and not the levels, which the device might
> still support.
> 
> Since this feature can co-exist with the Battery Voltage (0x1001)
> feature and we currently only support one battery feature, I changed the
> battery feature discovery to try to use 0x1000 and 0x1004 first and only
> then 0x1001, the battery voltage feature.
> In the future we could uncouple this and make the battery feature
> co-exists with 0x1000 and 0x1004, allowing the device to export voltage
> information in addition to the battery percentage or level.
> 
> I tested this patch with a MX Anywhere 3, which supports the new
> feature. Since I don't have any device that doesn't support the
> state_of_charge parameter of this feature, I forced the MX Anywhere 3 to
> use the level information, instead of battery percentage, to test that
> part of the implementation.
> I also tested with a MX Master 3, which supports the Battery Level
> Status (0x1000) feature, and a G703 Hero, which supports the Battery
> Voltage (0x1001) feature, to make sure nothing broke there.

Thanks a lot for the patch, Filipe. Minor details:

> Signed-off-by: Filipe Laíns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 244 ++++++++++++++++++++++++++++++-
>  1 file changed, 237 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index f85781464807..291c6b4d26b7 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -92,6 +92,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_CAPABILITY_BATTERY_MILEAGE	BIT(2)
>  #define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS	BIT(3)
>  #define HIDPP_CAPABILITY_BATTERY_VOLTAGE	BIT(4)
> +#define HIDPP_CAPABILITY_BATTERY_PERCENTAGE	BIT(5)
> +#define HIDPP_CAPABILITY_UNIFIED_BATTERY	BIT(6)
>  
>  #define lg_map_key_clear(c)  hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
>  
> @@ -152,6 +154,7 @@ struct hidpp_battery {
>  	int voltage;
>  	int charge_type;
>  	bool online;
> +	u8 supported_levels_1004;
>  };
>  
>  /**
> @@ -1171,7 +1174,7 @@ static int hidpp20_batterylevel_get_battery_info(struct hidpp_device *hidpp,
>  	return 0;
>  }
>  
> -static int hidpp20_query_battery_info(struct hidpp_device *hidpp)
> +static int hidpp20_query_battery_info_1000(struct hidpp_device *hidpp)

That '_1000' suffix looks strange to me, as it's not completely obvious 
just from looking at the code what it actually means. Would it perhaps be 
more readable to call it something like hidpp20_query_battery_level(), and 
symmentrically change hidpp20_query_battery_info_1004() to e.g. 
hidpp20_query_battery_voltage() ?

[ ... snip ... ]
> +	/* if the device supports state of charge (battery percentage) we won't
> +	   export the battery level information. there are 4 possible battery
> +	   levels and they all are optional, this means that the device might
> +	   not support any of them, we are just better off with the battery
> +	   percentage. */

Could you please use standard kernel commenting style here?

Thanks,

-- 
Jiri Kosina
SUSE Labs

