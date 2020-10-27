Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6249A29A373
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 04:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440661AbgJ0DxN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 23:53:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34821 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437156AbgJ0DxN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 23:53:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id b3so136811pfo.2;
        Mon, 26 Oct 2020 20:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2CpzabHsCE8TItVvEzNTjVwsKjXSLRxC0ex3X4n5g2w=;
        b=sMfl4TnAd8itXscROAFloMMat9691uXGARrULfH/HgvyN2tJQvq68kawcic4udSMqN
         g6avDU46DQyJ4evlc9oAaYWm2IXh4KiqZ6bkosjl7vGKU9WF5Rv9A3SXXXEgltv3cznK
         o4Pz69mbUQ3Nc15Hu+P1MjUmh2NxpZI4EXqMlH5VddEyz5Xevsj6Ta8Q8KJ/bbhnUAuN
         3ygUCeWNUOBTbA6/I2oDdiLk/IxQwGmRx6kPxtnHmi09i4e/GySlUWtal07W5OJ3QvHM
         1RtcFt9R+8Xx9DLOjXSzgjPHLV0tqkUp0K1vSGeGrJaMttlsPiF5qOqk5ftAWGQzFWFc
         1EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2CpzabHsCE8TItVvEzNTjVwsKjXSLRxC0ex3X4n5g2w=;
        b=eD08jALB366lrzigIRfQ4yhc1wWri8k2ydKH9qYwjkZq8LRpdMncw4qW81xWEiwCVw
         w/gMIzyb7CAiLDTDMmp/y26dNHD4ReZ0lN+q6pM1cVRwQVo+tyFG8G//htW/DggaOfgy
         GA7R3Dzstv+N8bF/JJ/aGWtkml8zjpGnHixVIAfM3lisZS7QuyV+q0slp7oaIa+ef71E
         j7Gn/sSTfZKD7rIopS2X+J5V8E9HejuazFjZmUGzhnCaiFmI8277+PYRmSsE4tXFQh7V
         G3umCQCbVkzRxQIBbc0K73sc/OXkXqRquaZ7eNSCRWfxCOCSOcGE3K0Y1rYVspWfSwVd
         DwwQ==
X-Gm-Message-State: AOAM533WIvTh8G0poS7ouVN3bFrVtNlKxtpCu+2gu9r3L3IzK6RUETAY
        2PukeYtnJwaUh9IcZLMIxko=
X-Google-Smtp-Source: ABdhPJw9kaXWKD/jSKb+nBaV443AnMwAmvK4O5undBh3ndUjCnF8FmlSp9xuu4iIT+hJ6RBRk8B2bA==
X-Received: by 2002:a63:40c1:: with SMTP id n184mr180993pga.215.1603770792251;
        Mon, 26 Oct 2020 20:53:12 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 5sm271190pfn.83.2020.10.26.20.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 20:53:11 -0700 (PDT)
Date:   Mon, 26 Oct 2020 20:53:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        David Jander <david@protonic.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Message-ID: <20201027035309.GI444962@dtor-ws>
References: <20201021090434.16387-1-o.rempel@pengutronix.de>
 <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
 <20201021105614.tc3jnv5g62hvl5vg@pengutronix.de>
 <20201021182757.GA444962@dtor-ws>
 <20201022065402.x7hlp2zncmnjyum7@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022065402.x7hlp2zncmnjyum7@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 22, 2020 at 08:54:02AM +0200, Oleksij Rempel wrote:
> On Wed, Oct 21, 2020 at 11:27:57AM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 21, 2020 at 12:56:14PM +0200, Oleksij Rempel wrote:
> > > 
> > > As you can see, I would need to configure my dts with spi-cs-high flag,
> > > even if the hardware is actually ACTIVE_LOW. If I will go this way, I
> > > would risk a regression as soon as this issue is fixed.
> > > 
> > > Since the spi framework is already parsing devicetree and set all needed
> > > flags, I assume it is wrong to blindly drop all this flags in the
> > > driver.
> > 
> > Yes, but I wonder if the devices can only work in mode 0 we should be
> > doing:
> > 
> > 	spi->mode &= ~SPI_MODE_MASK; // to be defined as 0x03 in spi.h
> > 	spi->mode |= SPI_MODE_0;
> > 
> > as we can't simply "or" mode value as is
> 
> Why not? This values are taken from device tree. If some developer
> decided to add them, then driver should take it over. Even if this
> values will break the functionality.
> 
> Other properties of this driver will break the functionality too of this
> driver too, so why should we silently filter only set of this bits?

What I was trying to say is that if driver wants to set mode to
particular value it should not "or" the value, as it will not reset the
relevant bits. I.e. if there some undesirable data in spi->mode mode
bits it will not get set properly by essentially doing "spi->mode |= 0".
That is why I said the driver needs to clear mode bits and set them to
the desired mode.

Thanks.

-- 
Dmitry
