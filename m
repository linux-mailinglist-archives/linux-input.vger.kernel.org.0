Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E921DC6E4
	for <lists+linux-input@lfdr.de>; Thu, 21 May 2020 08:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgEUGMw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 May 2020 02:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgEUGMw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 May 2020 02:12:52 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E657FC061A0E;
        Wed, 20 May 2020 23:12:51 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z26so2828742pfk.12;
        Wed, 20 May 2020 23:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E1bUS1DwXbcNarXlLUJhRMjEtkCyEDhIR3WHDttEkBs=;
        b=WM0ec6WVU8WUvURCpFqogCa2gnrL0qBn+E7961puvsy8KkVOP2YLJLkEFxNuTsERGO
         +9rVEcJINuDZllf7uU2XoWOe5Oc1SjyU+X7ikSbwuM5qLpyTgc1YlFgSO0fqtc7mXeOy
         RVol/u5bMeDiqTAH88kAl6iHC+CI1hMyvt96iinz8qZmzxnvTf4M8Paj4nDR3udgIHC/
         U5zAhA/03XO7nTrIxhqKPRmrwuYODwzZeiUO9MYVCaK3LI1wrkgWZROAbqDRDnHNxqS4
         OfQbrM5bS8XbnkqFo8hpi/CvYOVGvHrDooL77/iWlLXcyjY/4EnN37fKRbE6inMAKUdO
         3RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E1bUS1DwXbcNarXlLUJhRMjEtkCyEDhIR3WHDttEkBs=;
        b=BUbuE7qsQEdYkb+ww0Cf4YKLyp8sLZTAvBP56KxjTHJAMAvB2bj2fEn0uXppENGNzd
         Tg1hIIDKZt/aBSdTzmUMYJ5AGf0Y783zy3cPn4G2zTultpWspS8iqfPfXpf8iHBt37RY
         Ubh8mf/kFa/HDduOGezP1DlD3TDtPA8ylNLmRIM6ydMbDnCH/Io6+KMO2T4NvJZRrCu4
         v4s4AhzDy0kGIMsd6LsiyT5WEmL1ShGovBGX/oRg+qHYRbUD4Q611DbxH9bIJCP+w2+5
         soxkzs07V9ImMJHoZseyATpYs+IDnp/QR5GIB0Gt0Z0Ovf2G7HqttutuMde56o5wVm0o
         5zPg==
X-Gm-Message-State: AOAM5310F2YKM0TKrkuaTPIyrnUHITTv+xtTQc2oycwDgoSfL/c2mClQ
        u+x1j8ablCdmiwNxwYKCQRc=
X-Google-Smtp-Source: ABdhPJwT6KewtNVL+Sw4ITa7PELlP0duf05kHcEmdoucI68w2LIfcVysV3x6nwUOsILJgNS1TT+3Og==
X-Received: by 2002:a63:e143:: with SMTP id h3mr7646329pgk.85.1590041571296;
        Wed, 20 May 2020 23:12:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a71sm3702029pje.0.2020.05.20.23.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 23:12:50 -0700 (PDT)
Date:   Wed, 20 May 2020 23:12:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 3/5] Input: EXC3000: add EXC80H60 and EXC80H84 support
Message-ID: <20200521061248.GY89269@dtor-ws>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-4-sebastian.reichel@collabora.com>
 <20200520174519.GV89269@dtor-ws>
 <20200520212003.fxxi4uytifkeb2ca@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520212003.fxxi4uytifkeb2ca@earth.universe>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 20, 2020 at 11:20:03PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, May 20, 2020 at 10:45:19AM -0700, Dmitry Torokhov wrote:
> > Hi Sebastian,
> > 
> > On Wed, May 20, 2020 at 05:39:34PM +0200, Sebastian Reichel wrote:
> > >  
> > >  	data->client = client;
> > > +	data->info = device_get_match_data(&client->dev);
> 
> The above is for DT (and ACPI, but driver has no ACPI table).
> 
> > > +	if (!data->info) {
> > > +		enum eeti_dev_id eeti_dev_id =
> > > +			i2c_match_id(exc3000_id, client)->driver_data;
> > 
> > I believe i2c devices can be instantiated via sysfs, so I think we
> > better handle case where we can't find matching id. Also driver_data is
> > enough to store a pointer, maybe we can have individual structures
> > instead of using an array and indexing here?
> 
> The above code is only for exactly this usecase (loading via sysfs).
> There is zero chance, that we cannot find matching id. The sysfs
> based probing works by providing the device address and the name
> listed in driver's id_table. I took the above code style from
> drivers/i2c/muxes/i2c-mux-ltc4306.c.

Ah, OK, so i2c does not provide the "new_id" attribute to extend the
match table.

> 
> We can store the pointer directly in i2c_device_id's driver_data
> field, but that requires two type casts (field is ulong instead
> of pointer). The array variant feels a bit cleaner to me.

OK, fair enough. I'll wait for Rob to ack the yaml conversion and will
apply.

Thanks.

-- 
Dmitry
