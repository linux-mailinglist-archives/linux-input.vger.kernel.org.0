Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F7B2D5306
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 06:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgLJFF4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 00:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgLJFFz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 00:05:55 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AFAC0613CF;
        Wed,  9 Dec 2020 21:05:15 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so2912926pfg.8;
        Wed, 09 Dec 2020 21:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KEudqUFqGPkUAoxeIbaMpPz1LOum15uD3QilNe6YxHE=;
        b=KfiCTbmEBgANiNdV55b+9VqXDXvNY6oLEMJHtRIq/fbchtyaO2pEjD4C551jEEz56j
         h2SA60QuuxyXtPbrdUrwl+GSOYxs/QYIARmz9ghXZTiZEjuJEK8WDmQ0ClLUqQ8s6Dfx
         eZ1n3etYCfWrdH9QYLKUd/seyq18DvlJZeJDfxFTLjAF3wKe/WDj+6ZfICSVT/thhacR
         1So1bgPj1+JjMJ4WdRDG0mO2eO1yoycDokN8+6SSsJL4rcohCsbwDjXP7Y5GLOlgLI4y
         k/YvDYVjYDqqsJyix+qhF4ZmcnyrQ7Fa8gBnzWKUBFMSbFPJOXTt1pz5s1L0GbFAy1Xv
         lyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KEudqUFqGPkUAoxeIbaMpPz1LOum15uD3QilNe6YxHE=;
        b=gSSXEjRgdPg299q/zfc/qRE1aKLL2479F0HNsWLoq+u7IoFP88mQS05H00GLYsr+yt
         UK+m4+RMgKlgRYZCGjNPFyPsOVKobZPrfQ8VVhbC4CJOBZc9GYetGlQ/Cs+EWRNvT4Dr
         wjuaFzdH/xI6DvlSUvasId1h/XV1YcBhswKP4/Qw1KjHku8dRICJoDsRAHhry+zYJAv/
         KqvCL8hfJWHZeL7U320zlaU5wsgckTmJn9bNP0uPiDjf8ftaXvGaIgNOIXUhdPYjMfyj
         dTLv8cjKHeTAkjWwcZML9x8mDKAS/RDMq6rjINhf3PofmAvuMzULDNN7C6b6wje870G3
         4UMw==
X-Gm-Message-State: AOAM531TN7m41wiErtevH1EP1akKHJq2BtmIkLIrvSgle73C5w1/vyKn
        G6pcrENg+K9rBUjTgVrLVAA=
X-Google-Smtp-Source: ABdhPJwHObAyuW1gZ1EDgDT+e1eD3hq17RIFiSlm1woCN8nCfSF6sRuk//j8hf48/VxoPLmSRPkJhA==
X-Received: by 2002:a62:84ca:0:b029:19e:6f95:11b1 with SMTP id k193-20020a6284ca0000b029019e6f9511b1mr5295198pfd.68.1607576714974;
        Wed, 09 Dec 2020 21:05:14 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 92sm4451072pjv.15.2020.12.09.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 21:05:14 -0800 (PST)
Date:   Wed, 9 Dec 2020 21:05:11 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Chiu <chiu@endlessos.org>
Cc:     kevin@kevinlocke.name, hdegoede@redhat.com, limero1337@gmail.com,
        rajatja@google.com, jkosina@suse.cz, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@endlessos.org
Subject: Re: [PATCH] Input: i8042 - add Acer laptops to the i8042 reset list
Message-ID: <X9GshyqpLNEwplMb@google.com>
References: <20201207071250.15021-1-chiu@endlessos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207071250.15021-1-chiu@endlessos.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

On Mon, Dec 07, 2020 at 03:12:50PM +0800, Chris Chiu wrote:
> The touchpad operates in Basic Mode by default in the Acer BIOS
> setup, but some Aspire/TravelMate models require the i8042 to be
> reset in order to be correctly detected.
> 
> Signed-off-by: Chris Chiu <chiu@endlessos.org>
> ---
>  drivers/input/serio/i8042-x86ia64io.h | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
> index a4c9b9652560..f5ce656dc73f 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -607,6 +607,48 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-332"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-132"),
> +		},

I sorted this alphabetically and applied, thank you.

-- 
Dmitry
