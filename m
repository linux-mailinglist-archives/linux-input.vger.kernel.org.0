Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB69373D0D
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 16:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhEEOKy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 10:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40111 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233654AbhEEOKy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 10:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620223797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BCehOakkY6M3NGmE20hZ34gBRldCFoBFVx1MLP4b5Gc=;
        b=PcG1lF12tGfkn5vFtfxJfuj7QZ6zAyq5WdILIJDP3McVQ3YwuuoOAt98n9UMlysQJ5cRop
        Iqujoao5j6yieCVnoPxA7hkvqcjMKrCU8bnyXL2bV2G3m+ErbfFLN9OdASDbWDxoykUxLo
        uZes31Oh/Jy5Yqpl717DJx7sCK43LGg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-KWquvP4QM8-x3erTFz7cJQ-1; Wed, 05 May 2021 10:09:55 -0400
X-MC-Unique: KWquvP4QM8-x3erTFz7cJQ-1
Received: by mail-pg1-f199.google.com with SMTP id r22-20020a63ec560000b029020eba8e44f7so1426767pgj.4
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 07:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCehOakkY6M3NGmE20hZ34gBRldCFoBFVx1MLP4b5Gc=;
        b=qCMvnaJoHzPFXLuilZwxXN9imvX2O9E1MNgjXLv9+OBSlI9e0T0OySUvn92O9K/GAK
         4wPbce4o1UWzUs5FWm/zP+BHyMIwLm15kEZL5CVXfNpiq7w321xUyZTWPzoygfmujpQ0
         gIpBfA4fjJv12etXPhrrz8jpSgatPdQ9J53Ui5TlF8aoxU2ywFc7qPOu8HLw3M2vJ8B3
         DVs1S8/9QNdEUrACt7ZL3imvcfly0YJtEWk8rVufiXGr+fU93U+rVfZ5ENjvKETwAyp1
         fqFM1ZCyVKRogq1afEqg0e26XcpDxWo5fErVBF6vh6H38cN/6LPvlFx+jh1TcJgKpX0g
         Utlw==
X-Gm-Message-State: AOAM5337i/V/IUq+QDhGRdnW2kOBKpkiC03iEhUmmhEgFNc+StgYashs
        plI4neBr3mAr3ceXYxzsldKV2uOrmGumcGzKS1kSnKZ60dFdEVT9/A/dScjiqlZOQwPOtQbLyYI
        ea1jBQyUrr/oU8v30s2SMXfy2nzLGUO3gYzxh8qo=
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id a19-20020a62bd130000b029025c5ec4c2f3mr28430422pff.35.1620223794320;
        Wed, 05 May 2021 07:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJb7UdmjBbvQC0QrORDm6EcuNj/TJRU6m9p3BcHXA8yApRNJjU+oMLaVPhSlZhLDQMgkdftbx8KPNt6hQOkOY=
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr28430384pff.35.1620223793842; Wed, 05
 May 2021 07:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210306133716.453447-1-hdegoede@redhat.com> <20210306133716.453447-3-hdegoede@redhat.com>
 <CAO-hwJLdNiKG-+YZVSZ1hPztjgCTYrmeh2qdVvropkeeRxpYAg@mail.gmail.com> <2c62d70f-4878-a286-cc78-7f6360378253@redhat.com>
In-Reply-To: <2c62d70f-4878-a286-cc78-7f6360378253@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 5 May 2021 16:09:43 +0200
Message-ID: <CAO-hwJ+GG_ZyLsqgCKxcXW9am+an+Ym0brZ7B9hfBFYkJXUrCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: multitouch: Disable event reporting on suspend
 when our parent is not a wakeup-source
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 5, 2021 at 4:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/5/21 3:40 PM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > On Sat, Mar 6, 2021 at 2:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Disable event reporting on suspend when our parent is not
> >> a wakeup-source. This should help save some extra power in
> >> this case.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/hid/Kconfig          |  2 +-
> >>  drivers/hid/hid-multitouch.c | 23 ++++++++++++++++++++++-
> >>  2 files changed, 23 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> >> index 786b71ef7738..5cbe4adfd816 100644
> >> --- a/drivers/hid/Kconfig
> >> +++ b/drivers/hid/Kconfig
> >> @@ -675,7 +675,7 @@ config HID_MONTEREY
> >>
> >>  config HID_MULTITOUCH
> >>         tristate "HID Multitouch panels"
> >> -       depends on HID
> >> +       depends on USB_HID
> >
> > I tried really hard during the past 8 years to not have a usbhid
> > dependency on hid-multitouch.
> >
> > The code below should not break the test suite, but still I am not
> > that happy about the Kconfig change.
> >
> > I don't see an immediate and better way of doing what you are
> > achieving here, but maybe you have some magic I did not think about
> > that would help to no pull USB_HID with HID_MULTITOUCH.
> >
> > FTR, I think the use case of hid-multitouch *without* USB is rather
> > non-existent, but there might be some weird systems with I2C only
> > (edge computing?).
>
> Interesting how you often manage to pick out the bits of patches
> which I'm not 100% happy with myself either. I was thinking the
> same thing myself.

:)

>
> We have this: "hid_is_using_ll_driver(hdev, &usb_hid_driver)" check
> in various drivers under drivers/hid and so far the dependency fix
> of adding a "depends on USB_HID" was not pretty but ok, because it
> would be weird to enable those HID drivers on a system without
> USB_HID being enabled. But I agree with you that hid-multitouch
> is different. So I did try to come up with something better and
> failed.
>
> But now that I look at this with fresh eyes I think I see a
> nice solution for this.
>
> I propose to add a hid_is_usb_device() helper which is defined
> in hid-core.c (1) and this helper would look like this:
>
> bool hid_is_usb_device(struct hid_device *hid)
> {
> #if IS_ENABLED(CONFIG_USB_HID)
>         return hid_is_using_ll_driver(hid, &usb_hid_driver);
> #else
>         return false;
> #endif
> }
>
> And then I can use this helper function instead of directly doing
> the hid_is_using_ll_driver() check in hid-multitouch.c fixing
> this dependency ugliness.
>
> 1) hid-core.c is controlled by CONFIG_HID which gets selected at
> the Kconfig level by CONFIG_USB_HID so there is no chance of
> builtin vs module issues.

OK, sounds good enough to me. The one thing I dislike about IS_ENABLED
is that it is not very friendly with out of the tree modules. But
here, I guess if you have a system without CONFIG_USB_HID, you will
probably never need to enable it without recompiling your tree.

So ack by me.

>
> As an added bonus I can then also do a follow-up patch-set to
> remove more depends on USB_HID stuff by switching to the helper
> in other places too.

That would be wonderful :)

>
> ###
>
> Unrelated but something else which I was wondering about while
> working on this patch.
>
> I think that it might also be useful to change the
> mt_parent_may_wake() helper introduced here into a generic
> hid_parent_may_wakeup() helper in case we need a similar thing
> in other places. I decided it may be best to do that once we
> have a second driver needing such a check, but since we're
> discussing this anyways, what is your opinion on this ?

I can definitely see the benefit of it, but OTOH, I would stick to
your first approach. If we are just needing it for one driver, we
probably want to keep it local to this one driver.

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
> >>         help
> >>           Generic support for HID multitouch panels.
> >>
> >> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> >> index cfb68e443ddd..7926295bab81 100644
> >> --- a/drivers/hid/hid-multitouch.c
> >> +++ b/drivers/hid/hid-multitouch.c
> >> @@ -1759,12 +1759,33 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>  }
> >>
> >>  #ifdef CONFIG_PM
> >> +
> >> +/* Check if the parent which has the power/wakeup* sysfs attributes may wake the hdev */
> >> +static bool mt_parent_may_wake(struct hid_device *hdev)
> >> +{
> >> +       struct device *parent = hdev->dev.parent;
> >> +
> >> +       /*
> >> +        * USB-HID is attached to the usb_interface (our parent), the
> >> +        * power/wakeup* attr are part of the usb-device which is its parent.
> >> +        */
> >> +       if (hid_is_using_ll_driver(hdev, &usb_hid_driver) && parent)
> >> +               parent = parent->parent;
> >> +
> >> +       if (parent)
> >> +               return device_may_wakeup(parent);
> >> +
> >> +       /* Huh? Play it safe and keep reporting events. */
> >> +       return true;
> >> +}
> >> +
> >>  static int mt_suspend(struct hid_device *hdev, pm_message_t state)
> >>  {
> >>         struct mt_device *td = hid_get_drvdata(hdev);
> >>
> >>         /* High latency is desirable for power savings during S3/S0ix */
> >> -       if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
> >> +       if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
> >> +           !mt_parent_may_wake(hdev))
> >>                 mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
> >>         else
> >>                 mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
> >> --
> >> 2.30.1
> >>
> >
>

