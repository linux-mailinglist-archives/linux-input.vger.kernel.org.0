Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAC9376B5
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 16:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfFFOaT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 10:30:19 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39706 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfFFOaT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 10:30:19 -0400
Received: by mail-io1-f66.google.com with SMTP id r185so350931iod.6;
        Thu, 06 Jun 2019 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/yj82Fs8PWSimbkwdLXQDVQhsdSqtLP9f1+tIxwZUo=;
        b=stLElHvgRoUMyr0hBMa1CbvUvZf5YKHWo2RUTNXF7SZCDBZgDoxW6nf8xIvvyRuZBa
         TgkaVzm+dQfxaku9NSF+M+Ehdw1UOkEiizHchhQEl6lrnErNqrUfJ6tCGD/U9qWjEyKu
         fT4r9c9YelxyVehL6b3SewA+Jv5ND1v3ff9V0XNDsd4qQ/4vKbGDi5ecIlWI/8VNRswE
         9No9Vl9LOIEpuBAPV6rTj+Se8VTTL4oouR5ugl3jGaPcaR7jAKcjPUhlXBRwGoyWhpwf
         mhccwo20cpkCq+rnjEhkVVBitzSO7m2wkNZDhdcKsTZ7zngk+YPvBZ3G+Ev+L7gtaSsR
         cXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/yj82Fs8PWSimbkwdLXQDVQhsdSqtLP9f1+tIxwZUo=;
        b=b96wHpK4A0BVJZkvFEn2y0purMyyBCfJWrF58XsORR6YrPaAVVWn6d28o/I/9SAzTp
         twQLXslb9Gx33Zpw7icWse86Bx/+9bD5nreQoOtpd3Vm4uzetErIfNUMnGHJSWwq4ue6
         HMBOSkBYS/qbAdIH3bmv0ioresgJ7pZKS/8XR/otkKHkjgWcoDPl3bCwpxAjiy0E14my
         RwRgUc/3V+Jm0JNNApE2fn8gzvIWhBYE6xh3fKEXzwm+qNS9KppV32XP/3dye5vVEwy/
         QT+55A68F1TASxzcqE7oIzC9fBt/6kaFuonuIK5osJU6VOS2Roh96svJ53kVQdjFKJPI
         Uttw==
X-Gm-Message-State: APjAAAVclFp9mf3JhUl8OK+6rCm9iZW5LldGp79t3aWOiXiWx+jKcM+b
        pQW3VQEPLYXoiJHa+eOBMGZjVYujemWDh8va0J8=
X-Google-Smtp-Source: APXvYqzh3Mjs0+gLbXg8sw4Xqm2kamB9b0jr/4CUBNgTZbP5GpAzpLX9uXSoLYY5ybgkRSDtdfO0R5B4xkIT2BO93dQ=
X-Received: by 2002:a6b:901:: with SMTP id t1mr22966094ioi.42.1559831418114;
 Thu, 06 Jun 2019 07:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160605.9970-1-jeffrey.l.hugo@gmail.com> <20190521164324.GA2085@tuxbook-pro>
 <CAOCk7Nr-a=ek7xOhBwMgxG55jvKQK2tyy15oknrDn7OYvxtEwA@mail.gmail.com> <CAO-hwJKeS06Tsz8BzbWZw2TW74ZowvRqJue=Od-cMmfNH9N7Tw@mail.gmail.com>
In-Reply-To: <CAO-hwJKeS06Tsz8BzbWZw2TW74ZowvRqJue=Od-cMmfNH9N7Tw@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 6 Jun 2019 08:30:07 -0600
Message-ID: <CAOCk7Nr5d_Ox7B7FfMM9+8RF31pk=cwo+sRsa=nBYtifwZQNgQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
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

On Thu, Jun 6, 2019 at 1:07 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Thu, Jun 6, 2019 at 1:25 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Tue, May 21, 2019 at 10:42 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Tue 23 Apr 09:06 PDT 2019, Jeffrey Hugo wrote:
> > >
> > > > There needs to be coordination between hid-quirks and the elan_i2c driver
> > > > about which devices are handled by what drivers.  Currently, both use
> > > > whitelists, which results in valid devices being unhandled by default,
> > > > when they should not be rejected by hid-quirks.  This is quickly becoming
> > > > an issue.
> > > >
> > > > Since elan_i2c has a maintained whitelist of what devices it will handle,
> > > > use that to implement a blacklist in hid-quirks so that only the devices
> > > > that need to be handled by elan_i2c get rejected by hid-quirks, and
> > > > everything else is handled by default.  The downside is the whitelist and
> > > > blacklist need to be kept in sync.
> > > >
> > >
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > Jiri, the two patches in this series doesn't have a build time
> > > dependency, so if you take this one through your tree I'll take 2/2
> > > through arm-soc.
> >
> > Ping?  Is this good from the HID perspective?  I would really like to
> > see this queued for 5.3.
> >
>
> Sorry, this felt through the cracks.

No problem.

>
> I'm fine with the idea of the patch, but I just realized what bugged me:
> we should instead have a static array of the various ACPI matches,
> instead of duplicating the various strncmp.
>
> So IMO, we should:
> - merge patch 2/2 through Bjorn's tree (or with any changes he would request)
> - have a v5 for the HID/input part with:
>   * a static array of the names to match against in hid-quirks.c
>   * separate the elan_i2c trivial change in its separate patch as
> there are already a few changes committed in the input tree, which is
> different from the HID tree. I don't expect any conflicts though, so
> if Dmitry is fine, I can take the whole input/HID part through the HID
> tree, but a separate patch would be more obvious in case of a
> conflict.

Ok.  Will respin today.

>
> Cheers,
> Benjamin
>
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > ---
> > > >  drivers/hid/hid-quirks.c            | 64 ++++++++++++++++++++++++-----
> > > >  drivers/input/mouse/elan_i2c_core.c |  4 ++
> > > >  2 files changed, 58 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > > > index 77ffba48cc73..656485e08eb7 100644
> > > > --- a/drivers/hid/hid-quirks.c
> > > > +++ b/drivers/hid/hid-quirks.c
> > > > @@ -987,17 +987,61 @@ bool hid_ignore(struct hid_device *hdev)
> > > >               break;
> > > >       case USB_VENDOR_ID_ELAN:
> > > >               /*
> > > > -              * Many Elan devices have a product id of 0x0401 and are handled
> > > > -              * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
> > > > -              * is not (and cannot be) handled by that driver ->
> > > > -              * Ignore all 0x0401 devs except for the ELAN0800 dev.
> > > > +              * Blacklist of everything that gets handled by the elan_i2c
> > > > +              * input driver.  This should be kept in sync with the whitelist
> > > > +              * that exists in that driver.  This avoids disabling valid
> > > > +              * touchpads and other ELAN devices.
> > > >                */
> > > > -             if (hdev->product == 0x0401 &&
> > > > -                 strncmp(hdev->name, "ELAN0800", 8) != 0)
> > > > -                     return true;
> > > > -             /* Same with product id 0x0400 */
> > > > -             if (hdev->product == 0x0400 &&
> > > > -                 strncmp(hdev->name, "QTEC0001", 8) != 0)
> > > > +             if ((hdev->product == 0x0401 || hdev->product == 0x0400) &&
> > > > +                (strncmp(hdev->name, "ELAN0000", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0100", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0600", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0601", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0602", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0603", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0604", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0605", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0606", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0607", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0608", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0609", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN060B", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN060C", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN060F", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0610", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0611", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0612", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0613", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0614", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0615", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0616", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0617", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0618", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0619", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN061A", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN061B", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN061C", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN061D", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN061E", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN061F", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0620", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0621", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0622", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0623", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0624", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0625", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0626", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0627", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0628", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0629", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN062A", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN062B", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN062C", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN062D", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0631", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN0632", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "ELAN1000", 8) == 0 ||
> > > > +                 strncmp(hdev->name, "elan,ekth3000", 13) == 0))
> > > >                       return true;
> > > >               break;
> > > >       }
> > > > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > > > index f9525d6f0bfe..3ded19528cd4 100644
> > > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > > @@ -1332,6 +1332,10 @@ static const struct i2c_device_id elan_id[] = {
> > > >  };
> > > >  MODULE_DEVICE_TABLE(i2c, elan_id);
> > > >
> > > > +/*
> > > > + * when these whtielists get updated, the corresponding blacklist in hid-quirks
> > > > + * needs to be updated to match.
> > > > + */
> > > >  #ifdef CONFIG_ACPI
> > > >  static const struct acpi_device_id elan_acpi_id[] = {
> > > >       { "ELAN0000", 0 },
> > > > --
> > > > 2.17.1
> > > >
