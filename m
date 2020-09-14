Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2862696C6
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 22:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgINUfl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 16:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgINUfD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 16:35:03 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59691C061788;
        Mon, 14 Sep 2020 13:35:03 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u9so75995plk.4;
        Mon, 14 Sep 2020 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pMB0Ag7Pei/DIT9yK8UmQSEgb3pDJq2+7+wIvyk+/pg=;
        b=Ho1Us7JXWMZMZkABJB7kQUAaAS1enMeMYS2XOiVo/GoDaGYAF8f0oPyrmoeVCqUQzp
         ECHf5bXFhg19YzIl7dixT7x4j1/vfN3ShdmVgb1iMcKCN9gSNiHHnN47amPvW8rGt34A
         eUoImRQv/NC0VBP9Mo7l7UprHAJaJPFzPNGXv4ro9B7PFGwM+vnoddSf94yxrPb0ee6N
         fa99qR/tJnbuv6zHsVyY6Mrj9OSFjyZoEAmv3lH57zYuym8x2U9htM5SU/OB/RKlCZo6
         /0jfGEMT+DvJdKQipipaIPqraUbb0f/OLMlTIabGEoMiiMhozIs86NPs+8ZTUBaY5HiE
         PupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pMB0Ag7Pei/DIT9yK8UmQSEgb3pDJq2+7+wIvyk+/pg=;
        b=rfpJ9UyB3ShcUdge1ub96nv6i3kieiKAQy8ND+WX9fEMvuUppzEa7w/AymShsBtoc9
         MZsDJ5E/An+ttue6oGRM0V7D2yG6FSjKkOM04+EmUhYwjOCMq3Uax1aIwDQwyHP1CDLG
         +PnMRxS1QvSaUK6r8SMV7XvbpX3WLFOJ65L+NZGBCybxhF8wtWJaPvGpy4T9sNjw+xah
         PAL3kyUpQSXpAchDFBQN1dQ7OacAXVo/XBWMhQ0vlMySeei8nLBRyueb2aRfCdssp5nW
         lMdEsV0ISzPrOqdM4aFSnvY3skip1x+at19uYNkY0v683dpMdVerLVOc0wHwprbOHu3Q
         4Kxw==
X-Gm-Message-State: AOAM531A+i4moVZdYuR6gOpIXJpUP3IVgnnJMB+gX32VQtoe/V1zFkO2
        c/1dPSeetELOE3fVlHHFCng=
X-Google-Smtp-Source: ABdhPJzRCmpeykEkB5Ex11setBgc+6inwvw/GJ6l3Yd0z6bRhDRvfNuv4ilmSESjSReic1cILN0oYg==
X-Received: by 2002:a17:90b:374b:: with SMTP id ne11mr936804pjb.21.1600115701539;
        Mon, 14 Sep 2020 13:35:01 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x4sm11175032pfm.86.2020.09.14.13.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:35:00 -0700 (PDT)
Date:   Mon, 14 Sep 2020 13:34:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 2/2] input: joystick: Add ADC attached joystick driver.
Message-ID: <20200914203458.GA1681290@dtor-ws>
References: <20200905163403.64390-1-contact@artur-rojek.eu>
 <20200905163403.64390-2-contact@artur-rojek.eu>
 <CAHp75VfixOwpVSXoG1MqaZR2nmgEKumyKW8etLsRj1g=YjgiKw@mail.gmail.com>
 <2f2047e7ada6fcb70489ea6e5917e20a@artur-rojek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f2047e7ada6fcb70489ea6e5917e20a@artur-rojek.eu>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 06, 2020 at 02:09:28PM +0200, Artur Rojek wrote:
> Hi Andy,
> 
> thanks for the review, replies inline.
> 
> On 2020-09-06 11:22, Andy Shevchenko wrote:
> > On Sat, Sep 5, 2020 at 7:34 PM Artur Rojek <contact@artur-rojek.eu>
> > wrote:
> > 
> > > +static int adc_joystick_open(struct input_dev *dev)
> > 
> > > +static void adc_joystick_close(struct input_dev *dev)
> > 
> > Just wondering if this is protected against object lifetime cases.
> Can you clarify that in more details?

If there are lifetime issues they would be in input core, not individual
driver. But input core ensures that it calls close (if open was called
earlier) before doing input device teardown.

> > 
> > ...
> > 
> > > +err:
> > 
> > err_fwnode_put: ?
> > 
> > > +       fwnode_handle_put(child);
> > > +       return ret;
> > 
> > ...
> > 
> > > +       /* Count how many channels we got. NULL terminated. */
> > > +       for (i = 0; joy->chans[i].indio_dev; ++i) {
> > > +               bits = joy->chans[i].channel->scan_type.storagebits;
> > > +               if (!bits || (bits > 16)) {
> > > +                       dev_err(dev, "Unsupported channel storage
> > > size\n");
> > 
> > > +                       return -EINVAL;
> > 
> > -ERANGE?

/* Math result not representable */

? Seems not any better than -EINVAL.

Thanks.

-- 
Dmitry
