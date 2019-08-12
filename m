Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D9889AEE
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 12:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbfHLKIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 06:08:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40629 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfHLKIt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 06:08:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so4951800wrl.7
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iSUWZthkT5NzdIgl34+cYotng+ccjbgaBsS9HBt2QpI=;
        b=fDdqVHCRpjoHrQfUYYjb7rs/gyyidY3ytmy/UeoeKwQJgSBSpkd6BIOeUlatWuDg6c
         Vq6aor2/IeaEEbMUdepTGe+20qI+GJBleu7gnh1fTEy0AtD22SaAt92/ljzmWtmBsD2h
         J3MnfLJns9LGkZ22sSsN4sAGKQ7/ouMNxpU1Je/9KmVrTNcZCg7ueUrKhDzCekaHkgS7
         a8r12ZS/0pRSGJL2RGV5tnrHH8IDbxRizpZK+cPLYVmLuZuWfJtiv9t6z08drKV3g2wA
         GXQoNIfqsrvNEBJkoZh66iknbQh8ZpOYe+OtI21kj9Mfme5CnyyFRVCdC/0FnZscc6ka
         2yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iSUWZthkT5NzdIgl34+cYotng+ccjbgaBsS9HBt2QpI=;
        b=qQaScf5ZFR/v/Wix5rlQ07HpdQlXxtlVqo2HbNDE+8lQuAQwgqD9yTFKY6cotrlH+u
         3dIsAtO3/viWfwYwOCTFcTIww4mBDIHRORQgcDV/OBsYxIjE7KImQjsB3IWQtmhNwGAw
         p/jLaI6xgjhV6XHK2kRhHK4qnUae3xjO6dtmyFCN0AIPkHS/1AQI1w85DNOGfYh5iOFB
         A7MT+mFMnondcTDnHVpzioyqrHPQsopOuBXq/+ZV9Jy0VqbXbiLBcgKJfj2uiDAmgluA
         iHK9wfQt8bVwYE51kOq08zyqwwPjTnVoziCgS0iumUdM9krgpT/ax7X54MVP9Gjcq9RT
         H7Kg==
X-Gm-Message-State: APjAAAV71HSirrsDMDra8MfP8OuZvf5udV7ke6F5iBFZwaqyfxqF/uSX
        tTEBHVDoVUPgqPtyLWZF35NyhA==
X-Google-Smtp-Source: APXvYqxXdcW7172rHwWqsloeJ92Ae2s3Za7LKpR+s//Kn+kNFnC//fGd81qnjDWE0u84R3aq4MlUUw==
X-Received: by 2002:adf:c803:: with SMTP id d3mr41322658wrh.130.1565604526947;
        Mon, 12 Aug 2019 03:08:46 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id 4sm620554wmd.26.2019.08.12.03.08.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 03:08:46 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:08:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mfd: mc13xxx: Add mc34708 adc support
Message-ID: <20190812100844.GE26727@dell>
References: <20190717222602.2912-1-lukma@denx.de>
 <20190717222602.2912-2-lukma@denx.de>
 <20190725123641.GJ23883@dell>
 <20190725182020.3948c8d9@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725182020.3948c8d9@jawa>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 25 Jul 2019, Lukasz Majewski wrote:
> > On Thu, 18 Jul 2019, Lukasz Majewski wrote:
> > 
> > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > 
> > > The mc34708 has an improved adc. The older variants will always
> > > convert a fixed order of channels. The mc34708 can do up to eight
> > > conversions in arbitrary channel order. Currently this extended
> > > feature is not supported. We only support touchscreen conversions
> > > now, which will be sampled in a data format compatible to the older
> > > chips in order to keep the API between the mfd and the touchscreen
> > > driver.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > 
> > > ---
> > > Changes for v4:
> > > - None
> > > 
> > > Changes for v3:
> > > - None
> > > 
> > > Changes for v2:
> > > - Change the return code patch when the mc13xxx ADC is performing
> > > conversion
> > > - Introduce new include/linux/mfd/mc34708.h header file for mc34708
> > > specific defines
> > > 
> > > Changes from the original patches:
> > > - ADC conversion functions prototypes added to fix build error
> > > - Adjustments to make checkpatch clean (-ENOSYS, line over 80 char)
> > > 
> > > This patch applies on top of v5.2 - SHA1:
> > > 0ecfebd2b52404ae0c54a878c872bb93363ada36 ---
> > >  drivers/mfd/mc13xxx-core.c  | 102
> > > +++++++++++++++++++++++++++++++++++++++++++-
> > > drivers/mfd/mc13xxx.h       |   3 ++ include/linux/mfd/mc34708.h |
> > > 37 ++++++++++++++++ 3 files changed, 141 insertions(+), 1
> > > deletion(-) create mode 100644 include/linux/mfd/mc34708.h
> > > 
> > > diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
> > > index 1abe7432aad8..01473d6fda21 100644
> > > --- a/drivers/mfd/mc13xxx-core.c
> > > +++ b/drivers/mfd/mc13xxx-core.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/mfd/core.h>
> > > +#include <linux/mfd/mc34708.h>
> > >  
> > >  #include "mc13xxx.h"
> > >  
> > > @@ -45,6 +46,8 @@
> > >  
> > >  #define MC13XXX_ADC2		45
> > >  
> > > +#define MC13XXX_ADC_WORKING		(1 << 0)  
> > 
> > BIT(0) ?
> 
> The same convention - i.e. (1 << 0) is used in the rest of the file.

Very well, but please consider converting it subsequently.

> > >  void mc13xxx_lock(struct mc13xxx *mc13xxx)
> > >  {
> > >  	if (!mutex_trylock(&mc13xxx->lock)) {
> > > @@ -198,22 +201,30 @@ static void mc34708_print_revision(struct
> > > mc13xxx *mc13xxx, u32 revision) maskval(revision,
> > > MC34708_REVISION_FAB)); }
> > >  
> > > +static int mc13xxx_adc_conversion(struct mc13xxx *, unsigned int,
> > > +				  unsigned int, u8, bool, unsigned
> > > int *); +static int mc34708_adc_conversion(struct mc13xxx *,
> > > unsigned int,
> > > +				  unsigned int, u8, bool, unsigned
> > > int *); +
> > >  /* These are only exported for mc13xxx-i2c and mc13xxx-spi */
> > >  struct mc13xxx_variant mc13xxx_variant_mc13783 = {
> > >  	.name = "mc13783",
> > >  	.print_revision = mc13xxx_print_revision,
> > > +	.adc_do_conversion = mc13xxx_adc_conversion,
> > >  };
> > >  EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783);  
> > 
> > I'd prefer to keep the call-back functions as close to zero as
> > possible.
> 
> If I may ask - what is wrong with having per device callback(s) ?

Call-backs are ugly and hard to read/debug.

If they can be avoided, they should be, IMHO>

> > It would be better to turn mc13xxx_adc_conversion() in to the catch
> > function
> 
> Could you share any example? 

Just put the code doing the conversion into mc13xxx_adc_conversion()
and remove the call-back.

> > choose an execution route based on some platform matching.
> > 
> 
> Could you help me with giving a hint of how shall I do the "platform
> matching" in this particular driver ? 

We normally match on some platform ID, rather than passing around
pointers to structures containing pointers to device specific
functions.

> The mc13xxx driver seems rather complex with SPI and I2C support and in
> which the subdevices are added (e.g. rtc, adc, etc).

Not sure I follow your point?

> This particular patch just follows current driver design and fixes its
> usability for mc13708 drvice.

Right, but it is the current driver design that I'm trying to change.

> > If you could do the same for print_revision too, that would be even
> > better.
> 
> I would prefer to fix the driver (for mc13708) without the need to
> change the working code.

Okay, but no additional call-backs please.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
