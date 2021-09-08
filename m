Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8E14033F4
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 07:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244290AbhIHF4m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 01:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbhIHF4m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 01:56:42 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FDFC061575;
        Tue,  7 Sep 2021 22:55:34 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so680207pjb.0;
        Tue, 07 Sep 2021 22:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L3vl6usoHGhpUF1x7qOF+dGSpbcyMcdv8hhHAzIQk+k=;
        b=UqYOJxgwwRZOLExLmhbF+apv6ywXNOQ9wSMlzbsFRUkHMsf+Jr5kH4jmqtI4iIWoX0
         aw+yLRNysfq8a5I6FJAkL15QqvYJhtVdDswOn/iUQjlw9R0xBPCSC/8ZcQiycupEXWh2
         vcygMCpANjRC9lThtIbDZ1o1wrTeUEq3euyq5KEDgCSlOJhWlx/mFNvo+TPGuiBaqVw6
         M8iGsmlBYU9z8aISp1VNHEE3KpPMgsInXyMfW7rGO7RMdsGAgEJ2QwG/NlTbme6zNq29
         g0fEEhyiKZRG5q8AJYzvvI2XssvpRK/+0ucfsZJ7NuoaxCy7vpnI33K2Kx59P7m6x/3g
         luEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L3vl6usoHGhpUF1x7qOF+dGSpbcyMcdv8hhHAzIQk+k=;
        b=UfFQuwDtXBTWyH42VVjm51u3KGK+7CvVJEOyZuC7Oim8GMKdMaern1gORiPWi3svtj
         uQMxGQTr5lmcrP3UwtzHsXOiyREyUoMh1pt2xCI+aGLrigab5J+tFoOsockAWpzJhPcL
         tZ28d1pweGcNQWe0hMjy0q7E5OCQqTz0P+IugdqQDq263pjzKrXAVrNfwzIU3JdXyrou
         dGpFCrDVfBaTf+2WcwIXKydDkptCJHuHrsQeWBK7XYlG0e8JkNqHUTMQsAgHKuK43Wm3
         2g3OCAbIrHVy3sCsjUd6b9GZyxbxeveVPEWPnA9QXUO1DnggBGH1imFg5cpqHX3QiiAB
         p0hA==
X-Gm-Message-State: AOAM5303NHoNb+L4ZLxJQs0+iMpxHeN8OzBzFV8Ian6BxbA8GjmmLfnT
        L4Dcapr9IIo9fP9q9cGZLPw=
X-Google-Smtp-Source: ABdhPJy1hlxUNrVGW3B9a2Ct4Ma2+1gmYUK/i67BNJPkXH+DLp5BLZz8fkMQ5cWSECd44HomL4t9/Q==
X-Received: by 2002:a17:90a:8c8b:: with SMTP id b11mr2242842pjo.14.1631080534144;
        Tue, 07 Sep 2021 22:55:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:ded6:ee2d:2354:13b7])
        by smtp.gmail.com with ESMTPSA id x19sm941314pfa.104.2021.09.07.22.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 22:55:33 -0700 (PDT)
Date:   Tue, 7 Sep 2021 22:55:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>,
        linux-input <linux-input@vger.kernel.org>, linux-imx@nxp.com,
        kernel@pengutronix.de, Tatsunosuke Tobita <junkpainting@gmail.com>,
        linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Message-ID: <YThQUtE757b/ExR4@google.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me>
 <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com>
 <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ping,

On Tue, Sep 07, 2021 at 10:25:43PM -0700, Ping Cheng wrote:
> Hi Dmitry,
> 
> On Mon, Sep 6, 2021, 11:05 PM Dmitry Torokhov <dmitry.torokhov@gmail.com>
> wrote:
> 
> > Hi Tatsunosuke,
> >
> > On Thu, Sep 02, 2021 at 07:33:49AM +0000, Tobita, Tatsunosuke wrote:
> > > Hi Dmitry,
> > >
> > > Yes, our firmware supports HID over I2C.  However, some of our
> > > customers often do not want to use HID to handle our hardware; even
> > > they don't install the generic HID driver neither.  In such case, we
> > > need to distinguish what generation of our device customer's has. And
> > > to do so, we check I2C HID descriptor even though the driver is not
> > > working with HID driver components, but this one.  That is why I2C HID
> > > descriptor is used there. It is called, but the situation with this
> > > driver is not supposed to work as a HID device.
> >
> > I would like to understand better why the customers do not want to use
> > HID.
> 
> 
> Those customers normally run embedded Linux. Their hardwares have very
> specific use cases. They don't need to support any other HID devices except
> the Wacom i2c device.
> 
> >
> There needs to be a _very_ strong reason to essentially duplicate
> > HID layer in a vendor driver and I inclined to say that such customers
> 
> would need to patch their kernels themselves.
> 
> 
> They most likely don't want to duplicate HID layer. They just don't need
> most of the HID layer code.

They just need touchscreen support. Plus stylus support. And maybe
battery support. And maybe something else down the road... And they need
to introduce DT and ACPI descriptors to be able to mould the behavior to
platform needs. Which is pretty much the purpose of HID layer.

> wacom_i2c simplifies their deployment and
> testing process. Most of those customers are very small companies...

And now please continue this train of thoughts and consider every touch
vendor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
etc. Vendor drivers were acceptable before we had I2C standard, but now
it is much better for everyone to share the efforts and use HID instead
of replicating it for every vendor.

Thanks.

-- 
Dmitry
