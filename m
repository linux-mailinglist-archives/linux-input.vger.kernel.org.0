Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F77234111B
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 00:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbhCRXgg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 19:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbhCRXgL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 19:36:11 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D01CC06174A;
        Thu, 18 Mar 2021 16:36:11 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id i3so2831967oik.7;
        Thu, 18 Mar 2021 16:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YNjpfJk0448TLWFUwKknNdPtfhbYapoGME7vRJxOjdU=;
        b=O4UdLDFJ9qhRn6HtKnAXZDBGZZr1P5O6P/HW+eQhrxTFHtLdVOA4+t+kWbfbGM9fe9
         UEu4P51WVI9ijHm1d8K4UltvOMBUP/JICUfkY3vAWLzRa99u5sGtVY6N9DX5TG91rfsX
         vFQfD8O6vQbe9LcnD97KnqBU5Lsp7oz/JXz8ePZTymoFTAGPKSr4Vj3dFqBOtvNneO9H
         r4JNbHGYyGbT8g777UFBKDhfQE0a54BtRU+iQaYpLjNU4MCG5ZzXYOUekHpUVbHfWBCy
         u4wQDTHydV8TWmf0s/844JzmXswkU8wGjwKa6qjm8l1qJosFrh2wvXjk+UfB0GpI4Mhk
         Ptqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YNjpfJk0448TLWFUwKknNdPtfhbYapoGME7vRJxOjdU=;
        b=kdBKxlWp14WgFssORb/frkCyxmjI7u99iu88iQywqndM8t8EVZZBQqdraWOf7gtLuM
         vN+MZuCyidGdPhHRb+th2etylmJsWPl199HQYxM5156HZ09+DKlR9i7lao5JQtmLUR2D
         d8lreJHSQsk9QQUsvPC7Aq2pQuTN0EVhkef+S2WVVg8OCERsPochLtc0PV/CPJ40r6mc
         4SZ64idrGpArgluR7q8zw8v157/CKrT00udhUuS4q7LUZvM2lwS13mIfWhOIDhaqLZA1
         aUAqBhJZEY6OeNMnjWZ3ul+YuxECZHUoHJatsd95zAjqDL5nxV2/J+UrRDa23uVfL5sd
         di7w==
X-Gm-Message-State: AOAM531KaBbzctaOtFmUAYDEyCUkk6KwuTuMPAHDuTNGtKwkRrc1zqBQ
        WAKMrFx7Ay+nBsP8CMeFaJIV2iGEkcU=
X-Google-Smtp-Source: ABdhPJz6Vcsfo36hQOglcEG6v7PQjxjcOHHaevstv2qYZUHvk6thwo6kN1+yonDpmBpDlzKQIsjS6g==
X-Received: by 2002:aca:eb8c:: with SMTP id j134mr4840611oih.3.1616110570613;
        Thu, 18 Mar 2021 16:36:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14sm595043otj.50.2021.03.18.16.36.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 16:36:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 18 Mar 2021 16:36:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonas Malaco <jonas@protocubo.io>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
Message-ID: <20210318233608.GA140894@roeck-us.net>
References: <20210318164824.21374-1-jonas@protocubo.io>
 <8d59a1fe-e38d-3f1b-601d-26a9bcf7272f@roeck-us.net>
 <20210318231506.v4dvz4jtvqazdoo2@calvin.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318231506.v4dvz4jtvqazdoo2@calvin.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 18, 2021 at 08:15:06PM -0300, Jonas Malaco wrote:

[ ... ]

> > Either case, the spinlocks are overkill. It would be much easier to
> > convert raw readings here into temperature and fan speed and store
> > the resulting values in struct kraken2_priv_data, and then to
> > just report it in the read functions. That would be much less costly
> > because the spinlock would not be needed at all, and calculations
> > would be done only once per event.
> 
> Oddly enough, this is very close to how the code read last week.
> 
> But I was storing the values in kraken2_priv_data as longs, and I'm not
> sure that storing and loading longs is atomic on all architectures.
> 
> Was that safe, or should I use something else instead of longs?
> 

Hard to say, but do you see any code in the kernel that assumes
that loading or storing a long is not atomic, for any architecture ?

Also, I don't see how u16 * 1000 could ever require a long
for storage. int would be good enough.

> > 
> > > +	memcpy(priv->status, data, STATUS_USEFUL_SIZE);
> > > +	spin_unlock_irqrestore(&priv->lock, flags);
> > > +
> > > +	return 0;
> > > +}
> > 
> > For my education: What triggers those events ? Are they reported
> > by the hardware autonomously whenever something changes ?
> > A comment at the top of the driver explaining how this works
> > might be useful.
> 
> The device autonomously sends these status reports twice a second.
> 
> I'll add the comment for v2.
> 
That would be great, thanks.

> > 
> > Also, is there a way to initialize values during probe ? Otherwise
> > the driver would report values of 0 until the hardware reports
> > something.
> 
> The device doesn't respond to HID Get_Report, so we can't get valid
> initial values.
> 
> The best we can do is identify the situation and report it to
> user-space.  Am I right that ENODATA should be used for this?
> 
Yes, I think that would be a good idea, and ENODATA sounds good.

Thanks,
Guenter
