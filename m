Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539182AE494
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 01:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732029AbgKKAFE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 19:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731984AbgKKAFE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 19:05:04 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADDDC0613D1;
        Tue, 10 Nov 2020 16:05:02 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so401909pfu.1;
        Tue, 10 Nov 2020 16:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1VEs0o+nsMDorHoMLUHmM+Xmj5XOsdY/7qiX8QRbC/U=;
        b=dQRCcZPk9TuqGWd0J4OEMBT3NP0Zj7UD3GBHsiK7RS+UrAFDha5DNmNzvmvPVVi+qq
         dHO+aKjdF2On7kLJqgZcLUGAXjX4Ea70/0CDP/cA91LvH79JBBrWS4SHDyoUv03EIMl9
         +HMTMHPTj9Ik9rQ7e81KfQAkxRLRfCsVdAgDC57kTIJY8uWJPLCYacZ/O4cN8fFU9qbe
         xQ8OC5NtJejty36oPzOKgcDs6desxNWtmf267cXunT2R5VJJ6cuodnItwBk91BSG/f6d
         LUr77JmJjE2T35fd9br3Z3sOlafpl1vfshX/Lpt7CgGlVsFIHKL0gbdXD9lTIaWJT3An
         nY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1VEs0o+nsMDorHoMLUHmM+Xmj5XOsdY/7qiX8QRbC/U=;
        b=YUpeRWy9m5kTEMoQaEq9cwK0Pa2/IwHea0uA3/uxl/vfEE0kQHlGSq/HV4I03EwJBT
         ngOgIFeBQCedzM/79d4eUmNJD2xVxuwTK5b2woHrHgti+vWsBBme4HGnV4aENm8mTDjN
         XU7q4vVUonbtIwJRkDfoS5yJLOsPJgDl1GCX4/7caaXe51lOxd5HEuIh6aPQb4+eaTQ/
         +zT4BU5ZPt15fs0GfmIQafrBsx7h9rOX3ILhjBOk84vOH3qUS4Wi1JOiYCKpKa1wdwUp
         aHle11Gsq/8e7j8fJogZ7UjN5YEq36jBVE5sNv0lwmKRVmo04bKGzb0TtbsuWDlUiOyb
         E/jQ==
X-Gm-Message-State: AOAM533bXBoAhOa6b+mgYGA2XeQsaGr/LDLH/+kvJarq+NUR1cp1+XI1
        VE5jKOeRmjDz16GAIeZ/OVg=
X-Google-Smtp-Source: ABdhPJwnfIuENM6ztZT1PA62l4IOafE83CtvWjIDfYcM0qYA9YMv5JG/BbInpmt763yc7YTwnCHUSA==
X-Received: by 2002:a63:e004:: with SMTP id e4mr7625859pgh.51.1605053101819;
        Tue, 10 Nov 2020 16:05:01 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y8sm262749pfe.33.2020.11.10.16.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 16:05:01 -0800 (PST)
Date:   Tue, 10 Nov 2020 16:04:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
Message-ID: <20201111000458.GW1003057@dtor-ws>
References: <20201109213636.1267536-1-dianders@chromium.org>
 <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <d51318d1-5d26-f840-2651-42a1134d407b@redhat.com>
 <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 10, 2020 at 02:17:27PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 10, 2020 at 1:01 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 11/9/20 10:36 PM, Douglas Anderson wrote:
> > > This patch rejiggers the i2c-hid code so that the OF (Open Firmware
> > > aka Device Tree) and ACPI support is separated out a bit.  The OF and
> > > ACPI drivers are now separate modules that wrap the core module.
> > >
> > > Essentially, what we're doing here:
> > > * Make "power up" and "power down" a function that can be (optionally)
> > >   implemented by a given user of the i2c-hid core.
> > > * The OF and ACPI modules are drivers on their own, so they implement
> > >   probe / remove / suspend / resume / shutdown.  The core code
> > >   provides implementations that OF and ACPI can call into.
> > >
> > > We'll organize this so that we now have 3 modules: the old i2c-hid
> > > module becomes the "core" module and two new modules will depend on
> > > it, handling probing the specific device.
> > >
> > > As part of this work, we'll remove the i2c-hid "platform data"
> > > concept since it's not needed.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v5:
> > > - Add shutdown_tail op and use it in ACPI.
> > > - i2chid_subclass_data => i2chid_ops.
> > > - power_up_device => power_up (same with power_down).
> > > - subclass => ops.
> > >
> >
> > Thanks this looks good to now, 2 small remarks below (since you are
> > going to do a v6 anyways). Feel free to ignore these remarks if
> > you prefer to keep things as is.
> >
> > And feel free to add my reviewed-by to v6 of this patch:
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks!
> 
> 
> > > +static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
> > > +     { "hid", 0 },
> > > +     { "hid-over-i2c", 0 },
> > > +     { },
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);
> >
> > Hmm, I do not think these old-style i2c-ids are necessarry at
> > all in this driver. I expect all use-cases to use either
> > of or acpi matches.
> >
> > This was already present in the code before though, so
> > please ignore this remark. This is just something which
> > I noticed and thought was worth while pointing out as
> > a future cleanup.
> 
> Yeah, I wasn't sure if there was anyone using them.
> 
> Hrm.  Thinking about it, though, is it really OK for two drivers to
> both have the same table listed?  I'm not sure how that would work.
> Do you know?
> 
> I don't know a ton about ACPI, but for device tree I know i2c has a
> fallback mode.  Specifically having this table means that we'll match
> compatible strings such as:
> 
>   "zipzapzing,hid"
>   "kapowzers,hid-over-i2c"
> 
> In other words it'll ignore the vendor part and just match on the
> second half.  Just to make sure I wasn't remembering that from a dream
> I tried it and it worked.  I don't see any mainline device trees that
> look like that, though.  I could delete it, though it doesn't really
> take up much space and it seems nice to keep it working in case anyone
> was relying on it?
> 
> For ACPI is there a similar fallback?  If not then it seems like it'd
> be easy to remove it from there...

Just a random thought - will all this still be working with ACPI PRP0001
and DT-style compatible string and properties in _DSD?

Thanks.

-- 
Dmitry
