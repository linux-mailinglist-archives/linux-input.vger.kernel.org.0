Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7032836CF7
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 09:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfFFHHF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 03:07:05 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44522 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfFFHHF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 03:07:05 -0400
Received: by mail-qk1-f193.google.com with SMTP id w187so814158qkb.11
        for <linux-input@vger.kernel.org>; Thu, 06 Jun 2019 00:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpE5F2PryY/7ekaCFARM6Uj5LXLqn4ImiAP5wBAaGFc=;
        b=G9J3JXTzqMdnJ0s67hDcAk5ymNHahRpEK70ZzkUKgHaDmpZ4UnxDNSMkvloMqQVISI
         6yc6nuECllK/nnKoiR66BvOAL29WObWhOQ9N3cAhOe09FnpxmsZl60820Ix9PNW+fj9o
         JE4VIueUxvZ9TtHWBBlr9mP2c/F56x21UWmc0I5ETwrt2HzMlHRZpz/CYHxa03BUAU2Z
         J3xvOMMAFvQZ+0eWEvMUl5j8ah9vON608HZKOpWwykSFdJC/lw6IoTD/xvkVjHiNaROl
         yPOa1Tssl4kDrNYzjQmzPuAHgziK8J/wA20aEJ2mne9CvFkonr7JOXzyxMxF38U5KEpb
         bY+w==
X-Gm-Message-State: APjAAAWX/qntutD0+6KrsQErIjWJuHLm85SUmukU7HCex5CTZqNlyod2
        EQlou68+RxVcylctm6ZdJ8ro3jsNvq1uM1mxK6EEscnd
X-Google-Smtp-Source: APXvYqwFRTz20CD8M6Kwg2Np+AkH9v6bF7YwNEs8nIQpd/ztnd685i07+sFMbB/EzUwlkQYxhQWAuYDDIW0U/bPJIAA=
X-Received: by 2002:a37:8847:: with SMTP id k68mr37265523qkd.278.1559804823661;
 Thu, 06 Jun 2019 00:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160605.9970-1-jeffrey.l.hugo@gmail.com> <20190521164324.GA2085@tuxbook-pro>
 <CAOCk7Nr-a=ek7xOhBwMgxG55jvKQK2tyy15oknrDn7OYvxtEwA@mail.gmail.com>
In-Reply-To: <CAOCk7Nr-a=ek7xOhBwMgxG55jvKQK2tyy15oknrDn7OYvxtEwA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 6 Jun 2019 09:06:51 +0200
Message-ID: <CAO-hwJKeS06Tsz8BzbWZw2TW74ZowvRqJue=Od-cMmfNH9N7Tw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
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

On Thu, Jun 6, 2019 at 1:25 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Tue, May 21, 2019 at 10:42 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 23 Apr 09:06 PDT 2019, Jeffrey Hugo wrote:
> >
> > > There needs to be coordination between hid-quirks and the elan_i2c driver
> > > about which devices are handled by what drivers.  Currently, both use
> > > whitelists, which results in valid devices being unhandled by default,
> > > when they should not be rejected by hid-quirks.  This is quickly becoming
> > > an issue.
> > >
> > > Since elan_i2c has a maintained whitelist of what devices it will handle,
> > > use that to implement a blacklist in hid-quirks so that only the devices
> > > that need to be handled by elan_i2c get rejected by hid-quirks, and
> > > everything else is handled by default.  The downside is the whitelist and
> > > blacklist need to be kept in sync.
> > >
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > Jiri, the two patches in this series doesn't have a build time
> > dependency, so if you take this one through your tree I'll take 2/2
> > through arm-soc.
>
> Ping?  Is this good from the HID perspective?  I would really like to
> see this queued for 5.3.
>

Sorry, this felt through the cracks.

I'm fine with the idea of the patch, but I just realized what bugged me:
we should instead have a static array of the various ACPI matches,
instead of duplicating the various strncmp.

So IMO, we should:
- merge patch 2/2 through Bjorn's tree (or with any changes he would request)
- have a v5 for the HID/input part with:
  * a static array of the names to match against in hid-quirks.c
  * separate the elan_i2c trivial change in its separate patch as
there are already a few changes committed in the input tree, which is
different from the HID tree. I don't expect any conflicts though, so
if Dmitry is fine, I can take the whole input/HID part through the HID
tree, but a separate patch would be more obvious in case of a
conflict.

Cheers,
Benjamin

> >
> > Regards,
> > Bjorn
> >
> > > Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >  drivers/hid/hid-quirks.c            | 64 ++++++++++++++++++++++++-----
> > >  drivers/input/mouse/elan_i2c_core.c |  4 ++
> > >  2 files changed, 58 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > > index 77ffba48cc73..656485e08eb7 100644
> > > --- a/drivers/hid/hid-quirks.c
> > > +++ b/drivers/hid/hid-quirks.c
> > > @@ -987,17 +987,61 @@ bool hid_ignore(struct hid_device *hdev)
> > >               break;
> > >       case USB_VENDOR_ID_ELAN:
> > >               /*
> > > -              * Many Elan devices have a product id of 0x0401 and are handled
> > > -              * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
> > > -              * is not (and cannot be) handled by that driver ->
> > > -              * Ignore all 0x0401 devs except for the ELAN0800 dev.
> > > +              * Blacklist of everything that gets handled by the elan_i2c
> > > +              * input driver.  This should be kept in sync with the whitelist
> > > +              * that exists in that driver.  This avoids disabling valid
> > > +              * touchpads and other ELAN devices.
> > >                */
> > > -             if (hdev->product == 0x0401 &&
> > > -                 strncmp(hdev->name, "ELAN0800", 8) != 0)
> > > -                     return true;
> > > -             /* Same with product id 0x0400 */
> > > -             if (hdev->product == 0x0400 &&
> > > -                 strncmp(hdev->name, "QTEC0001", 8) != 0)
> > > +             if ((hdev->product == 0x0401 || hdev->product == 0x0400) &&
> > > +                (strncmp(hdev->name, "ELAN0000", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0100", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0600", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0601", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0602", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0603", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0604", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0605", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0606", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0607", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0608", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0609", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN060B", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN060C", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN060F", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0610", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0611", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0612", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0613", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0614", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0615", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0616", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0617", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0618", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0619", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN061A", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN061B", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN061C", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN061D", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN061E", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN061F", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0620", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0621", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0622", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0623", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0624", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0625", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0626", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0627", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0628", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0629", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN062A", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN062B", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN062C", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN062D", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0631", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN0632", 8) == 0 ||
> > > +                 strncmp(hdev->name, "ELAN1000", 8) == 0 ||
> > > +                 strncmp(hdev->name, "elan,ekth3000", 13) == 0))
> > >                       return true;
> > >               break;
> > >       }
> > > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > > index f9525d6f0bfe..3ded19528cd4 100644
> > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > @@ -1332,6 +1332,10 @@ static const struct i2c_device_id elan_id[] = {
> > >  };
> > >  MODULE_DEVICE_TABLE(i2c, elan_id);
> > >
> > > +/*
> > > + * when these whtielists get updated, the corresponding blacklist in hid-quirks
> > > + * needs to be updated to match.
> > > + */
> > >  #ifdef CONFIG_ACPI
> > >  static const struct acpi_device_id elan_acpi_id[] = {
> > >       { "ELAN0000", 0 },
> > > --
> > > 2.17.1
> > >
