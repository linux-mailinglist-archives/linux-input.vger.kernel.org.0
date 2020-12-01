Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72BC2C97C6
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 08:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgLAHBv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 02:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbgLAHBv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 02:01:51 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841EDC0613CF;
        Mon, 30 Nov 2020 23:01:11 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id b12so659889pjl.0;
        Mon, 30 Nov 2020 23:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ngvoe86XzVxBfY2DEjilLAjY3kEDlzG9OjcsBvIxHYc=;
        b=QC+OVFANJzpHO5Nu2sN5nqotWc9pcesf/sigDDcm6aqOkldfQm4AfMiaC2JDVkI/Ip
         8cY2gdBKRIKQGZdEx31oqyGP3/XKRiZ7mIZW4mjht2qjQPlDHOI28pJfkefwrX7IQ4d+
         /Y7eJQD/egEq4oTf5gWW4EAUzFT6R0MkDRVeqhSurz7/grGLdwpfILvZqBhPwfYIwTzG
         88/997TMGVZJteafhUXdbYd7dfeUtHuqs62tLTPrCcJx2n4z8meRgMElfKG89NSRV2kh
         nd9r6wP7hyhNtv0JstzmfuGeQGMxx6Ev8ekD24DJlynRN5h9f2LJlRK8xmTDBpzytmmJ
         5Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ngvoe86XzVxBfY2DEjilLAjY3kEDlzG9OjcsBvIxHYc=;
        b=sl3WU3BBrp5r8Zn77nA7+gW7krwoDa50sEVExcSD8SbpqQSzuck6zQlF7V0uxEfoUO
         Jop85vUN81Eat4wZwbjnCYqq092RyN6PnsYa4WOlMijCVUJok8UEvtPF0WoNPZQfbJAo
         MRiCHHbrNp0oe4psTgcV2BFhv4PKlNY6pJfMIZNjJPX8Y9QHneaZk/a3+fwJUGWY2zBW
         7KbZUZKp3CXduyRVicNeDJoVnuFA1nxq0KnOOBCzBN8gRFV4fa7xXp3ALiDPXVbftkhk
         xTgX40VPJRYbGdzX9XZFpVvOy7dEZl1oT5yUQUgTFgNK+kv48pq9bu8wFf267zLh5wt4
         fXyA==
X-Gm-Message-State: AOAM532BFw79wseF7MHJHOolrcBc/hnMTZ3UOfRDe3jkpm2p3vqJOw71
        3tmuo+TK7NuGCioXWJ6Cy7MuzmdywPI=
X-Google-Smtp-Source: ABdhPJziOej+w4a6O49GSjDIbdGXWv7MO0iRD/vkiANDYmPRC/F/ol3EWWwMWIheOlYhLAo4N3Wh6w==
X-Received: by 2002:a17:90a:7343:: with SMTP id j3mr1333032pjs.51.1606806070980;
        Mon, 30 Nov 2020 23:01:10 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h5sm1437075pfk.126.2020.11.30.23.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 23:01:08 -0800 (PST)
Date:   Mon, 30 Nov 2020 23:01:06 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] input: Add support for Azoteq IQS626A
Message-ID: <20201201070106.GS2034289@dtor-ws>
References: <1606084748-4097-1-git-send-email-jeff@labundy.com>
 <1606084748-4097-3-git-send-email-jeff@labundy.com>
 <20201123070307.GE2034289@dtor-ws>
 <20201124001516.GA6249@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124001516.GA6249@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 23, 2020 at 06:15:16PM -0600, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> Thank you for taking a look.
> 
> On Sun, Nov 22, 2020 at 11:03:07PM -0800, Dmitry Torokhov wrote:
> > Hi Jeff,
> > 
> > On Sun, Nov 22, 2020 at 04:39:08PM -0600, Jeff LaBundy wrote:
> > > +
> > > +		if ((sys_reg->active & tp_mask) == tp_mask)
> > > +			input_set_abs_params(iqs626->trackpad,
> > > +					     ABS_X, 0, 255, 0, 0);
> > > +		else
> > > +			input_set_abs_params(iqs626->trackpad,
> > > +					     ABS_X, 0, 128, 0, 0);
> > > +#ifdef CONFIG_TOUCHSCREEN_PROPERTIES
> > > +		touchscreen_parse_properties(iqs626->trackpad, false,
> > > +					     &iqs626->prop);
> > > +#endif /* CONFIG_TOUCHSCREEN_PROPERTIES */
> > 
> > This should not be separately selectable from CONFIG_INPUT, so there is
> > not need to have this guard.
> > 
> > The reason it is a separate symbol is historical - it used to depend on
> > OF in addition to INPUT. I suppose I can drop it now.
> 
> Without these guards, the build fails if CONFIG_INPUT_TOUCHSCREEN=n and
> I felt it too heavy-handed to add a 'depends on' for what is ultimately
> a corner-case of sorts for this device.

Ah, I missed the fat that we got outside of the
drivers/input/toucscreen.

> 
> The touchscreen helpers are useful for more than just touchscreens, and
> we can extend them to all of input with something like the patch below.
> If it looks OK to you, I can insert it into v2 after I collect feedback
> from Rob for the binding.

Yes, I guess we should move into core. Can you move the file into
drivers/input and maybe we should rename it into touch-properties.c? And
start renaming the API form touchscreen_*() to touch_()?

Thanks.

-- 
Dmitry
