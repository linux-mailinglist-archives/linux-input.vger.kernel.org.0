Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E761C45AF
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 20:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbgEDSVF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 14:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729958AbgEDSVE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 May 2020 14:21:04 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A3EC061A0E;
        Mon,  4 May 2020 11:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=p2ee0uWm9T8Gzchj6ZhxPHc6i5laqcjVX3CZrQoFGpE=; b=sUIdr5uoTzu//3oDhmTqGrmIeE
        PJPG5ZePoyAH17rhWTX/rGa3s0RufHAnwdIcBPvz8rw88HrhrgqllOqZAYsb21Wi+P+aQpy/7p97p
        yFUQRdSkFMr2PcNyJoD+5QfZkqEzkE1S1UMIzv/I2zjXBWDEoiaOoh8dlXHQJFpDB6ZpBp2+T4ro2
        i9kvDkAaHZuWeX5opL7YGJnf/Sddw0oAKYC3939ID6rP8YKdsZIDaToRQ1FfsdrkJJKgIdD3o42Ej
        nha2BqyUQr3l6DEIKjwyxBw7LWhdZvh34KjwDND1cSxb0dyoGx7y6tYwB5fQWCoCESY3RlytQcNos
        +Pyo47xw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVfi8-0003p4-1N; Mon, 04 May 2020 18:21:00 +0000
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     Andrew Dunai <a@dun.ai>, linux-kernel@vger.kernel.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20200504164514.18641-1-a@dun.ai>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
Date:   Mon, 4 May 2020 11:20:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504164514.18641-1-a@dun.ai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Usually you need to send patches to a maintainer who could then
merge/apply them.


On 5/4/20 9:45 AM, Andrew Dunai wrote:
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 93177e6e5..a3ab19ab0 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>  	.properties	= trekstor_surftab_wintron70_props,
>  };
>  
> +static const struct property_entry vinga_twizzle_j116_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data vinga_twizzle_j116_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= vinga_twizzle_j116_props,
> +};
> +
>  /* NOTE: Please keep this table sorted alphabetically */
>  static const struct dmi_system_id touchscreen_dmi_table[] = {
>  	{
> @@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
>  		},
>  	},
> +	{
> +		/* Vinga Twizzle J116 */
> +		.driver_data = (void *)&vinga_twizzle_j116_data,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
> +		},
> +	},
>  	{ },
>  };
>  
> 

thanks.
-- 
~Randy

