Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D227A2A455F
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 13:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgKCMnG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 07:43:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57007 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728435AbgKCMnF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 07:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604407383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F84fRXLZfMfvouZKtilNzMebEPZg/rkOtWVtPorkAYY=;
        b=dx+5QDBGQgsbWfWUhtPh5r2yGMEqD6YMSepsGnXl5l9kNA44ntAtSTlWdCJWz3udcDPqTS
        jLnS8Dcdz0UULQQnx587vwFNO8v9Hlc8k0JZmPv4QZR5Kyu1ENHknLPthJermWNJHcVSa6
        W/vBfv8YqxaH9bkEQsPTdUIGdqEbGew=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-54eyGplcMCmpg-THrd4H1g-1; Tue, 03 Nov 2020 07:43:00 -0500
X-MC-Unique: 54eyGplcMCmpg-THrd4H1g-1
Received: by mail-pg1-f198.google.com with SMTP id o11so9846450pgj.21
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 04:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F84fRXLZfMfvouZKtilNzMebEPZg/rkOtWVtPorkAYY=;
        b=kQMkE9aQKl620LkYU9alyPn5OF2XnjmnJApiTY/1qFL+2IcLzEXknlMFPvKSWmDeZt
         H0kS1GntsBoyDmWw6wpUW8bhdQgNsy35sfevofQ4RNW1itW9HsY2wDU7dKLl0oYrN9w2
         OMMdVaV9VCmHosoJ4Fwwwr8TNO+i7h5IHbH8p+G3x4gcPMM8urDM13bV7hivxXGk1ycE
         T5lAUWLLktDD+7U4lstlbs5nsQzXaBLFz6y+tGmI7n5oHilkpiw5HA0ib6B6OTF4/lXk
         Yx140Hk7KWBLpi+vM98zn+6tA1gtOXwXN8zdC3Rn0uShIW9C/snRCEpLIbngSNqxbavm
         wx/A==
X-Gm-Message-State: AOAM532BfZVoTiUbXhhE81hYfGO8EtHEovLP6E12NKnJybrs7V1YCVPp
        nIi3bZ9Zdrw/GKuO+ye0BkOxH5DcONAuK9m79e18OKd9LQGAGKmzdwtqqy3i9ZoodiPZiug48cX
        wEsrav0rQve1TIXnR6uY9JcE/OELd8AN6RQTTFaA=
X-Received: by 2002:a17:902:8341:b029:d4:e3fa:e464 with SMTP id z1-20020a1709028341b02900d4e3fae464mr25504391pln.66.1604407378929;
        Tue, 03 Nov 2020 04:42:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCSfQ64saOLX5LWijdtM2Fq5blGHymwhge3rMASlkcCq2TButQB+Up8kV9F5JnSR0PJcWZA4MtXbke5oigqkE=
X-Received: by 2002:a17:902:8341:b029:d4:e3fa:e464 with SMTP id
 z1-20020a1709028341b02900d4e3fae464mr25504358pln.66.1604407378497; Tue, 03
 Nov 2020 04:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
 <20201102161210.v3.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <CAL_JsqLxGugWg7Xwr-NQa1h+a_=apQsfFCU0KF-97xt1ZB8jMg@mail.gmail.com> <28e75d51-28d8-5a9a-adf9-71f107e94dfb@redhat.com>
In-Reply-To: <28e75d51-28d8-5a9a-adf9-71f107e94dfb@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 3 Nov 2020 13:42:47 +0100
Message-ID: <CAO-hwJK2DfU_v==uwWyyPkH9N6zb9Vh_pJOxz8dZ_mqJ1+CdsA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] HID: i2c-hid: Allow subclasses of i2c-hid for
 power sequencing
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        andrea@borgia.bo.it, Aaron Ma <aaron.ma@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Nov 3, 2020 at 10:09 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/3/20 2:46 AM, Rob Herring wrote:
> > On Mon, Nov 2, 2020 at 6:13 PM Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> This exports some things from i2c-hid so that we can have a driver
> >> that's effectively a subclass of it and that can do its own power
> >> sequencing.
> >>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >>
> >> Changes in v3:
> >> - Rework to use subclassing.
> >>
> >> Changes in v2:
> >> - Use a separate compatible string for this new touchscreen.
> >> - Get timings based on the compatible string.
> >>
> >>  drivers/hid/i2c-hid/i2c-hid-core.c    | 78 +++++++++++++++++----------
> >>  include/linux/input/i2c-hid-core.h    | 19 +++++++
> >>  include/linux/platform_data/i2c-hid.h |  9 ++++
> >>  3 files changed, 79 insertions(+), 27 deletions(-)
> >>  create mode 100644 include/linux/input/i2c-hid-core.h
> >>
> >> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> >> index 786e3e9af1c9..910e9089fcf8 100644
> >> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> >> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> >> @@ -22,6 +22,7 @@
> >>  #include <linux/i2c.h>
> >>  #include <linux/interrupt.h>
> >>  #include <linux/input.h>
> >> +#include <linux/input/i2c-hid-core.h>
> >>  #include <linux/irq.h>
> >>  #include <linux/delay.h>
> >>  #include <linux/slab.h>
> >> @@ -1007,8 +1008,33 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
> >>                 pdata->post_power_delay_ms = val;
> >>  }
> >>
> >> -static int i2c_hid_probe(struct i2c_client *client,
> >> -                        const struct i2c_device_id *dev_id)
> >> +static int i2c_hid_power_up_device(struct i2c_hid_platform_data *pdata)
> >> +{
> >> +       struct i2c_hid *ihid = container_of(pdata, struct i2c_hid, pdata);
> >> +       struct hid_device *hid = ihid->hid;
> >> +       int ret;
> >> +
> >> +       ret = regulator_bulk_enable(ARRAY_SIZE(pdata->supplies),
> >> +                                   pdata->supplies);
> >> +       if (ret) {
> >> +               if (hid)
> >> +                       hid_warn(hid, "Failed to enable supplies: %d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       if (pdata->post_power_delay_ms)
> >> +               msleep(pdata->post_power_delay_ms);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void i2c_hid_power_down_device(struct i2c_hid_platform_data *pdata)
> >> +{
> >> +       regulator_bulk_disable(ARRAY_SIZE(pdata->supplies), pdata->supplies);
> >> +}
> >> +
> >> +int i2c_hid_probe(struct i2c_client *client,
> >> +                 const struct i2c_device_id *dev_id)
> >>  {
> >>         int ret;
> >>         struct i2c_hid *ihid;
> >> @@ -1035,6 +1061,9 @@ static int i2c_hid_probe(struct i2c_client *client,
> >>         if (!ihid)
> >>                 return -ENOMEM;
> >>
> >> +       if (platform_data)
> >> +               ihid->pdata = *platform_data;
> >> +
> >>         if (client->dev.of_node) {
> >>                 ret = i2c_hid_of_probe(client, &ihid->pdata);
> >>                 if (ret)
> >> @@ -1043,13 +1072,16 @@ static int i2c_hid_probe(struct i2c_client *client,
> >>                 ret = i2c_hid_acpi_pdata(client, &ihid->pdata);
> >>                 if (ret)
> >>                         return ret;
> >> -       } else {
> >> -               ihid->pdata = *platform_data;
> >>         }
> >>
> >>         /* Parse platform agnostic common properties from ACPI / device tree */
> >>         i2c_hid_fwnode_probe(client, &ihid->pdata);
> >>
> >> +       if (!ihid->pdata.power_up_device)
> >> +               ihid->pdata.power_up_device = i2c_hid_power_up_device;
> >> +       if (!ihid->pdata.power_down_device)
> >> +               ihid->pdata.power_down_device = i2c_hid_power_down_device;
> >> +
> >>         ihid->pdata.supplies[0].supply = "vdd";
> >>         ihid->pdata.supplies[1].supply = "vddl";
> >>
> >> @@ -1059,14 +1091,10 @@ static int i2c_hid_probe(struct i2c_client *client,
> >>         if (ret)
> >>                 return ret;
> >>
> >> -       ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
> >> -                                   ihid->pdata.supplies);
> >> -       if (ret < 0)
> >> +       ret = ihid->pdata.power_up_device(&ihid->pdata);
> >> +       if (ret)
> >
> > This is an odd driver structure IMO. I guess platform data is already
> > there, but that's not what we'd use for any new driver.
> >
> > Why not export i2c_hid_probe, i2c_hid_remove, etc. and then just call
> > them from the goodix driver and possibly make it handle all DT
> > platforms?
> >
> > Who else needs regulators besides DT platforms? I thought with ACPI
> > it's all wonderfully abstracted away?
>
> Right with ACPI we do not need the regulators, actually not checking
> for them with ACPI would be preferable, if only to suppress kernel
> messages like these:
>
> [    3.515658] i2c_hid i2c-SYNA8007:00: supply vdd not found, using dummy regulator
> [    3.515848] i2c_hid i2c-SYNA8007:00: supply vddl not found, using dummy regulator
>
> To be fair the i2c-hid-core.c code does have some acpi specific handling too.
>
> With the latest fixes from:
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-5.10/upstream-fixes
> taken into account we have the following acpi specific functions being called
> from various places:
>
> i2c_hid_acpi_fix_up_power   (called on probe)
> i2c_hid_acpi_enable_wakeup  (called on probe)
> i2c_hid_acpi_shutdown       (called on shutdown)
>
> Not I'm not Benjamin / not the MAINTAINER of this code, but I think that
> splitting out both the ACPI *and* the of/dt handling might make sense.

Yep, fully agree.

>
> Maybe even turn drivers/hid/i2c-hid/i2c-hid-core.c into a library
> and have 2 separate:
>
> drivers/hid/i2c-hid/i2c-hid-acpi.c
> drivers/hid/i2c-hid/i2c-hid-of.c
>
> drivers using that library.
>
> That would change the kernel-module name, but there only is the debug
> module parameter which is affected by that from a userspace API point
> of break, so I think that changing the kernel-module name is fine.

Ack, this is a small downside compared to a better extensibility of the driver.

Also, we could then delete entirely the platform_data as the register
of the hid_descriptor_address could simply be added as an argument to
i2c_hid_probe. Though that would force me to rewrite my testing patch
with custom i2c-hid devices over an USB<->I2C adapter.

>
> So you would have 2 i2c drivers, one with an acpi_match_table and one
> with an of_match_table. And then either also have 2 separate probe
> functions, or have a probe helper which gets passed some platform_data
> given by the acpi/of probe function + some extra callbacks (either
> as extra arguments or inside the pdata).
>
> Having a separate drivers/hid/i2c-hid/i2c-hid-of.c file also allows
> for a separate MAINTAINER entry where someone else then Benjamin
> becomes responsible for reviewing DT related changes...

I like that :)

>
> Anyways just my 2 cents, it is probably wise to wait what Benjamin
> has to say before sinking time in implementing my suggestion :)

I also want to say that I like the general idea of Doug's patch.
Having a separate driver that handles the specific use case of goodix
is really nice, as it allows to just load this driver without touching
the core of i2c-hid. I believe this is in line with what Google tries
to do with their kernel that OEMs can not touch, but only add overlays
to it. The implementation is not polished (I don't think this new
driver belongs to the input subsystem), but I like the general idea of
having the "subclassing". Maybe we can make it prettier with Hans'
suggestion, given that this mainly means we are transforming
i2c-hid-core.c into a library.

As for where this new goodix driver goes, it can stay in
drivers/hid/i2c-hid IMO.

Cheers,
Benjamin

