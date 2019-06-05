Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461B0367F1
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 01:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfFEXZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 19:25:28 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:56226 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbfFEXZ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Jun 2019 19:25:28 -0400
Received: by mail-it1-f194.google.com with SMTP id i21so267646ita.5;
        Wed, 05 Jun 2019 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+WWUao+0KYKJX7/eCyyrGifWT6Z32ta9Z0LQFgrFodk=;
        b=sPrd/xgnfWj8aOIB6h6viaBvaeccIwX4YNlrf2bwLiCoBmGVbA9nKJG5+UCyALqqiz
         nFlZNWmPqfL1yyJwRWeZ7yLRTytcqNDRn8nb11oLYfXVVCoHHqTxxs5Qj/AaIsw9BwAJ
         XIvCCUhyKGADDjVS60sEt5Hw0G0fegqPJh7Ke2CheWlPbTBOP74gSQD/3iIR6P2kuu3M
         UKSN3S4PYkKuk8s9mROHVMM3hDVgR1Q7OE3Kc998hiKqwMSFyRrKGNA/qJl8Vozs3JsU
         YMNuX9sQdAWdg+q3XURtApz1N85A7oPP34f8tOUXZa+gCZDTDx/8utlP7TspmDAW8EhG
         huQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+WWUao+0KYKJX7/eCyyrGifWT6Z32ta9Z0LQFgrFodk=;
        b=lJBVdJUgAx5bUlhu0BAPnNrqTLS6lxikZyMbE90+uPnpPldjFz5HHDtoDTjsfRdfv7
         G60IhzO1WlJP56FD2/tyu/OE8dPU+ExPDobt8ZNdM0YlSfTAcEmG/XNrT5ssAhfbUNWo
         kpko7deGJOI0m+Kt39noC03uZICEY2tgM8YIUk6aQtqZ0o6FS1PuglpFpUK9kKWWQL7r
         msPH0yvFnxUUDvhSRgV8gqvCWC2Y1OMcR/APNXTk/weXIJNwVnm3A48BLqW6BzEnDEwF
         U3ip9FNqMkaWnWPTOpp4I26KUnqVCURHNm9WbdCNmfg9pTfoneFU9O4lsHLK6JwtTWUm
         MqLA==
X-Gm-Message-State: APjAAAXVp6pdtb81Tw9oYioCXSsb8j5bvEYx71Wrq6hp3I3teR007MXs
        9+9gxpNe1YdR0kkUmxDBHrND7GPp5KDq3roSllk=
X-Google-Smtp-Source: APXvYqwpdcZVyBlfikTfWGuw0wAUUPxpTv7H6zcpYDq+kqKd32iTlgG/bPmu0brEdKgxbIA1aMDsfwK3+FbkIf0KMnM=
X-Received: by 2002:a24:6c4a:: with SMTP id w71mr29571756itb.128.1559777127054;
 Wed, 05 Jun 2019 16:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160605.9970-1-jeffrey.l.hugo@gmail.com> <20190521164324.GA2085@tuxbook-pro>
In-Reply-To: <20190521164324.GA2085@tuxbook-pro>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 5 Jun 2019 17:25:15 -0600
Message-ID: <CAOCk7Nr-a=ek7xOhBwMgxG55jvKQK2tyy15oknrDn7OYvxtEwA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 21, 2019 at 10:42 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 23 Apr 09:06 PDT 2019, Jeffrey Hugo wrote:
>
> > There needs to be coordination between hid-quirks and the elan_i2c driver
> > about which devices are handled by what drivers.  Currently, both use
> > whitelists, which results in valid devices being unhandled by default,
> > when they should not be rejected by hid-quirks.  This is quickly becoming
> > an issue.
> >
> > Since elan_i2c has a maintained whitelist of what devices it will handle,
> > use that to implement a blacklist in hid-quirks so that only the devices
> > that need to be handled by elan_i2c get rejected by hid-quirks, and
> > everything else is handled by default.  The downside is the whitelist and
> > blacklist need to be kept in sync.
> >
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Jiri, the two patches in this series doesn't have a build time
> dependency, so if you take this one through your tree I'll take 2/2
> through arm-soc.

Ping?  Is this good from the HID perspective?  I would really like to
see this queued for 5.3.

>
> Regards,
> Bjorn
>
> > Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/hid/hid-quirks.c            | 64 ++++++++++++++++++++++++-----
> >  drivers/input/mouse/elan_i2c_core.c |  4 ++
> >  2 files changed, 58 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 77ffba48cc73..656485e08eb7 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -987,17 +987,61 @@ bool hid_ignore(struct hid_device *hdev)
> >               break;
> >       case USB_VENDOR_ID_ELAN:
> >               /*
> > -              * Many Elan devices have a product id of 0x0401 and are handled
> > -              * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
> > -              * is not (and cannot be) handled by that driver ->
> > -              * Ignore all 0x0401 devs except for the ELAN0800 dev.
> > +              * Blacklist of everything that gets handled by the elan_i2c
> > +              * input driver.  This should be kept in sync with the whitelist
> > +              * that exists in that driver.  This avoids disabling valid
> > +              * touchpads and other ELAN devices.
> >                */
> > -             if (hdev->product == 0x0401 &&
> > -                 strncmp(hdev->name, "ELAN0800", 8) != 0)
> > -                     return true;
> > -             /* Same with product id 0x0400 */
> > -             if (hdev->product == 0x0400 &&
> > -                 strncmp(hdev->name, "QTEC0001", 8) != 0)
> > +             if ((hdev->product == 0x0401 || hdev->product == 0x0400) &&
> > +                (strncmp(hdev->name, "ELAN0000", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0100", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0600", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0601", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0602", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0603", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0604", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0605", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0606", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0607", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0608", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0609", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN060B", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN060C", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN060F", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0610", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0611", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0612", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0613", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0614", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0615", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0616", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0617", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0618", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0619", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN061A", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN061B", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN061C", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN061D", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN061E", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN061F", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0620", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0621", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0622", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0623", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0624", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0625", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0626", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0627", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0628", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0629", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN062A", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN062B", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN062C", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN062D", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0631", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN0632", 8) == 0 ||
> > +                 strncmp(hdev->name, "ELAN1000", 8) == 0 ||
> > +                 strncmp(hdev->name, "elan,ekth3000", 13) == 0))
> >                       return true;
> >               break;
> >       }
> > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > index f9525d6f0bfe..3ded19528cd4 100644
> > --- a/drivers/input/mouse/elan_i2c_core.c
> > +++ b/drivers/input/mouse/elan_i2c_core.c
> > @@ -1332,6 +1332,10 @@ static const struct i2c_device_id elan_id[] = {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, elan_id);
> >
> > +/*
> > + * when these whtielists get updated, the corresponding blacklist in hid-quirks
> > + * needs to be updated to match.
> > + */
> >  #ifdef CONFIG_ACPI
> >  static const struct acpi_device_id elan_acpi_id[] = {
> >       { "ELAN0000", 0 },
> > --
> > 2.17.1
> >
