Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C657F4045B5
	for <lists+linux-input@lfdr.de>; Thu,  9 Sep 2021 08:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhIIGmD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 02:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbhIIGmC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Sep 2021 02:42:02 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7920BC061575;
        Wed,  8 Sep 2021 23:40:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so724082pjw.2;
        Wed, 08 Sep 2021 23:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k+zNeRpnAY0AiVF0w7zkI6qu5/69/UsVSfeaSwm39z8=;
        b=XLy4GAqROOFnaRABnbWp1L7qkKPMFkQc4Ley+0Vehqlw7JWvgkZSRnk9uWNnrI2TPT
         XYjnZEbYcVD2UGdtIvXDH/XwG/oFXnQrPDhLTjPM1QyXatjCB4NjGnfKKDni3vQ60f6X
         +yJolVedmkvSmjigB7WfFLBENE58jsLVUMu2SQezYJDc1M2UtrepejA3IYgH/173EHI4
         cDlD8s7gNQsQep/AjMc/tlBXe5IT5EEO1FvjvKrApBvUSsymjmDPAyqxaL/YYofG0BJJ
         rzMiwELVTZ64RKKOA5tvPRFyGIvH4A+TT+q56jg0NN62lDalF5dJJuhbKGelwyQYmftG
         0HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k+zNeRpnAY0AiVF0w7zkI6qu5/69/UsVSfeaSwm39z8=;
        b=aFyPFCt9i8dZUKNc9x7ZCiSIH74WBJ0lFNT9MEkCgxqoc8LT1rTnjTOHSYakrG4uIS
         Ki+NnJXM2Us+AGPs3XzmCwwjLduLsBU4KsIcInrLke/Jzgp1UfQYdL2QVQpa441F9c6X
         zIZtxDqgjOkPlcCbQHmR3pCBt/idl/PULNI6h1KI74Urzq8Uxzirzay6BwYxVjEk0mMA
         Movs0IvNZMv1WVtJC5VHahmkzYDKZUiqL0AMcBNhZ6SXB6DAjGuHIsGzkLcp0qj4kiNC
         TpDha09qokoHsgBjtnlXV5M4NMyoQIGILTFTpHx0yVB/SV3VQCu/eF8BPI2f3IdDJPsc
         g4Lg==
X-Gm-Message-State: AOAM531dHS0xVtn0oC56zPveOI43yORSs6XRb6p99y4SY+/Xi/sF6NOY
        aZHkhZY/ecTO4x+zNPtu1jU=
X-Google-Smtp-Source: ABdhPJzm0fBIjBoxCER9HcjyzDYfpLT+9ZbD/TXwkkTR8QcI5WYNnGz7KrgNARIfEaoLV1kgXYsbfw==
X-Received: by 2002:a17:90a:a389:: with SMTP id x9mr1796658pjp.167.1631169652827;
        Wed, 08 Sep 2021 23:40:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7e3:1f1a:6f65:553c])
        by smtp.gmail.com with ESMTPSA id d15sm861105pjw.4.2021.09.08.23.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 23:40:51 -0700 (PDT)
Date:   Wed, 8 Sep 2021 23:40:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: analog: Always use ktime functions
Message-ID: <YTmscXQO3HaGxi6z@google.com>
References: <20210907123734.21520-1-linux@roeck-us.net>
 <YTgVUWzFSOg/I4C+@google.com>
 <a07d3486-ab7e-24c1-63f9-b1566636015c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a07d3486-ab7e-24c1-63f9-b1566636015c@roeck-us.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 07, 2021 at 07:29:36PM -0700, Guenter Roeck wrote:
> On 9/7/21 6:43 PM, Dmitry Torokhov wrote:
> > Hi Guenter,
> > 
> > On Tue, Sep 07, 2021 at 05:37:34AM -0700, Guenter Roeck wrote:
> > > @@ -241,11 +176,11 @@ static int analog_cooked_read(struct analog_port *port)
> > >   	int i, j;
> > >   	loopout = (ANALOG_LOOP_TIME * port->loop) / 1000;
> > > -	timeout = ANALOG_MAX_TIME * port->speed;
> > > +	timeout = ANALOG_MAX_TIME * NSEC_PER_MSEC;
> > >   	local_irq_save(flags);
> > >   	gameport_trigger(gameport);
> > > -	now = get_time();
> > > +	now = ktime_get();
> > 
> > There are time[4], now, etc variables above this block that are u64. I
> > think they can be make ktime_t. I can do it myself if you agree.
> > 
> Sure.
> 
> > > @@ -378,35 +313,19 @@ static void analog_calibrate_timer(struct analog_port *port)
> > >   	u64 t1, t2, t3;
> > 
> > I think these should also be ktime_t.
> > 
> Ok. Do you want me to resend or are you going to make the changes ?

I made the changes and applied, thank you.

-- 
Dmitry
