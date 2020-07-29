Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170A1231732
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 03:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbgG2BXq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jul 2020 21:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgG2BXp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jul 2020 21:23:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BE9C061794;
        Tue, 28 Jul 2020 18:23:44 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k27so13365806pgm.2;
        Tue, 28 Jul 2020 18:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=39Fa9ZWtwvl7NbKoGzRfKnzpxN8mlG9ibr8kyfnWLig=;
        b=nXwe4SMQObUre653mpr+8/vgQq0+w/Buw5OH9WA6GWzqGygo5VX6XTsF0xACpUUpWZ
         3Q58bRXvyZT9gN4ebmV4V/gjo8HIov/HPt4mPA5hIisnkU0ezs69PaxS1ZK7fKaWBEVN
         hwJwBtorrFl4wce0opgoNLJXXK5U8WKEEcBs80ItyVLWKxG3OfPhLNdUoj7IBAY1Y49B
         BE/Ske5XIYDUjnWuCS4lf3se9tMqTy2oH8rNQj94DOSKDsUmKKnsmoKd0LhcDUc5dwl2
         QhLJv7gl+bSFyZjCUkAeqzMkk0Yo04JBD6i3NtBR5LpaIBPeW1drQVrd+apVzF+hSxJT
         w3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=39Fa9ZWtwvl7NbKoGzRfKnzpxN8mlG9ibr8kyfnWLig=;
        b=Sw0BWvizvmcxhiDLl7mNEV6zGYOZCl7v0oKw9+gIRFB6V90yLuhpRW1z1b4hRH/do9
         a3YJFqCXea6mnDbcfUNhwP6LRMkuLVJAfHVAeuST8dXlvdGDDN+Mb9FBimK5Ue6QS2Nm
         AP3JDaNaicWZUWqSMa7EfWdPZ2BTVuUAvzGboGxQ53vqoMFHBBBQ9gmTSw9brTQzW35T
         FHI7+wdWsIBSywB/KLCSUY/ruDg3nD2OweSgpu3l0A8CaVVQfF9+hmnzJPRVzMEORWWB
         D4N22HzwQ1wkPKSuNquie15ZePK9Z9a7Jv2s4yiD2fcIlIAYaWTatl1dGglDF1nb6cA2
         +bLA==
X-Gm-Message-State: AOAM530wq6fBGaM41M8byzvb2y7BYDko8YWSdbR1ZCf4d6emwhKboC2z
        DqzjdEtf1JdV8iuF+o8Y1zs=
X-Google-Smtp-Source: ABdhPJzSmPN1CuhBlK64vxmgtlEOgYy5sVjI3onVqCYmbXIzpiJVMUCSV5lSchdS6OSHaXP+yPe4vw==
X-Received: by 2002:a63:1406:: with SMTP id u6mr26395140pgl.108.1595985824127;
        Tue, 28 Jul 2020 18:23:44 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f3sm299250pju.54.2020.07.28.18.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 18:23:43 -0700 (PDT)
Date:   Tue, 28 Jul 2020 18:23:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org
Subject: Re: [PATCH] Input: fix typo in function name documentation
Message-ID: <20200729012341.GW1665100@dtor-ws>
References: <20200724084025.GB31930@amd>
 <20200727163208.4e956816@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727163208.4e956816@lwn.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 27, 2020 at 04:32:08PM -0600, Jonathan Corbet wrote:
> On Fri, 24 Jul 2020 10:40:25 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > Fix non-existing constant in documentation.
> > 
> > Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
> > 
> > diff --git a/Documentation/input/uinput.rst b/Documentation/input/uinput.rst
> > index b8e90b6a126c..10c62e62a0a6 100644
> > --- a/Documentation/input/uinput.rst
> > +++ b/Documentation/input/uinput.rst
> > @@ -99,7 +99,7 @@ the sake of simplicity.
> >  
> >        /*
> >         * Give userspace some time to read the events before we destroy the
> > -       * device with UI_DEV_DESTOY.
> > +       * device with UI_DEV_DESTROY.
> >         */
> >        sleep(1);
> 
> Seems good...Dmitry, do you want this, or would you rather I picked it up?

I picked it up, thank you.

-- 
Dmitry
