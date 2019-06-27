Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E860258E29
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2019 00:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfF0WvA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jun 2019 18:51:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37791 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfF0WvA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jun 2019 18:51:00 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so4257236wrr.4
        for <linux-input@vger.kernel.org>; Thu, 27 Jun 2019 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W9iMcV3G6zmKoXAUKhxFYSE5NHaLZFq1HtBlqyBDI7U=;
        b=kD0KGez9g8V3QNzMNGtOGPFaochLQvdhOnbZuctuiTxzZbPEVaCVhANHaBCmA8S79U
         0MOkNHWtW713IIKkeQ6pPsDMBwYGoelTD0EhDtfWm8Jx1Hfqk7m0edpxkPsAo1pL0brx
         +RpOlv8lK1ajehh1QtfSVs5MdYDypgYO6+beAkfwh22/V1tzswHRhGGvYdiAiDj0POOF
         vNhfu9VwJWLxrdy+htmoUFOtEzzdyc3FG9MTvdDEjCq4yXXa2KqYZG/pDxeMyy7s1evz
         m6q9tLqDVUA40OTVcdT/2Yf7M8/8Aj1G1vPBRVOfmDM6wXGAAC1gDpnTK8aBiuowZqWQ
         9sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W9iMcV3G6zmKoXAUKhxFYSE5NHaLZFq1HtBlqyBDI7U=;
        b=t2ujCuAcefgBC4rtJ+HddDaCTm+JQcDM5TzEl+PRikEeT5kqG+6JTTm8mmUdFoupEt
         o8hHAXy429wEd3tUol5KmzX6EVaRl+q1pcBQHfL6Fykmcun0UbcwFNwHD/A0ynmVWfFc
         gHcmqe4a3DexR/BU0GFqiPtJA6bebxNR62RbrFNutADmVPf8PkmYo/4GcEiKf5zLG5pb
         4xMzX90XPlOksk1jQvqRxyE/ke9h7eopgoQfyMcw8qKyn2fBN/m7ND+b2sHzrO0DKV1k
         GB7ID/nIq/3EuAm2y1P/8m1Dw8Tk2tcH+8pIAUJBoubbXd2DNNAJEht6p1gvJle7E3CC
         G0KQ==
X-Gm-Message-State: APjAAAVE2m/fAnnnFs+bO2huPktSGznzWeiB+rPmk+3C0XdJsIVaLUtl
        icDC1WNvtV5eeEVTnY0zoKA=
X-Google-Smtp-Source: APXvYqzThx+qo1DAZzPBb8buMDMpKgujLnm3/pUFjOexxrk16qhnIKSpEGtQupnq/YVp4tjzSB0OPQ==
X-Received: by 2002:a5d:40c2:: with SMTP id b2mr3247741wrq.326.1561675858001;
        Thu, 27 Jun 2019 15:50:58 -0700 (PDT)
Received: from Wall-E.localdomain (146.93.117.91.dynamic.reverse-mundo-r.com. [91.117.93.146])
        by smtp.gmail.com with ESMTPSA id t80sm595868wmt.26.2019.06.27.15.50.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 15:50:57 -0700 (PDT)
Date:   Fri, 28 Jun 2019 00:50:55 +0200
From:   Daniel Otero <otero.o.daniel@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for 'Chuwi Hi10
 Pro' touchscreen
Message-ID: <20190627225055.GB9615@Wall-E.localdomain>
References: <20190605232204.24679-1-otero.o.daniel@gmail.com>
 <e434bca4-51d9-e601-5130-55eb48649ce5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e434bca4-51d9-e601-5130-55eb48649ce5@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Hans!

Anything else that I can do to get this accepted?

Regards,

On Thu, Jun 06, 2019 at 09:33:17AM +0200, Hans de Goede wrote:
> Hi,
>
> On 06-06-19 01:22, Daniel Otero wrote:
> > Add touchscreen platform data for the 'Chuwi Hi10 Pro' tablet touchscreen.
> >
> > Signed-off-by: Daniel Otero <otero.o.daniel@gmail.com>
>
> Patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
> > ---
> >   drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> > index b662cb2d7cd5..d942082c5b7b 100644
> > --- a/drivers/platform/x86/touchscreen_dmi.c
> > +++ b/drivers/platform/x86/touchscreen_dmi.c
> > @@ -87,6 +87,23 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
> >   	.properties	= chuwi_hi10_air_props,
> >   };
> > +static const struct property_entry chuwi_hi10_pro_props[] = {
> > +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1911),
> > +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
> > +	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
> > +	PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
> > +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> > +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
> > +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> > +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> > +	{ }
> > +};
> > +
> > +static const struct ts_dmi_data chuwi_hi10_pro_data = {
> > +	.acpi_name	= "MSSL1680:00",
> > +	.properties	= chuwi_hi10_pro_props,
> > +};
> > +
> >   static const struct property_entry chuwi_vi8_props[] = {
> >   	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
> >   	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
> > @@ -601,6 +618,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
> >   			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
> >   		},
> >   	},
> > +	{
> > +		/* Chuwi Hi10 Pro (CWI529) */
> > +		.driver_data = (void *)&chuwi_hi10_pro_data,
> > +		.matches = {
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
> > +		},
> > +	},
> >   	{
> >   		/* Chuwi Vi8 (CWI506) */
> >   		.driver_data = (void *)&chuwi_vi8_data,
> >
