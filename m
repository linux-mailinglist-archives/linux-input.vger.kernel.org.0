Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA07373C8C
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhEENll (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41743 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233638AbhEENlj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620222043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uMkkNQ1tKwhAWkYqdTZvIK99akfUJ1LfL0r9InR3MrA=;
        b=bpWKyGRp5sh5x7DtCazI9L7o/p0y58FpoNThPt6r7ddf84HtV771iFy5UJ6xzYjiKY4HzR
        hWK9pV8KH438UXb2Y6wpt+9tR1/ksGCMwI7o4oqnUTGz096TNW++1kQGwreW886+I8fvf7
        4r2CoTzPMu4orfaVLwXWsKdFZFfvoc8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-iJSFIa6ZPDmTDDPDBhg2Eg-1; Wed, 05 May 2021 09:40:41 -0400
X-MC-Unique: iJSFIa6ZPDmTDDPDBhg2Eg-1
Received: by mail-pl1-f198.google.com with SMTP id a8-20020a1709029008b02900eccb4b7296so657448plp.23
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 06:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMkkNQ1tKwhAWkYqdTZvIK99akfUJ1LfL0r9InR3MrA=;
        b=XqbRf+SIlsG3+iNMm5fkXs3wn22Vgg8lhKK4AOfA6SpYT0I/E5sWuI8mnOmOyzpjfj
         COpHVzKwWzXLIh/o20H8n11m1qQYF5rrmCviQd+uwJzl2bS4tW7WW4q9vG4g/7Jy9LiD
         DMLis3fyNcoMdt4cSdKq20D9UA74iL86wK8LArGtEeZjvOn6vOd5Pe5S3wl3Hq/t69zA
         XASkEnfB/+RuzkYUw7y0K45uyv4uE77h4+E7Am1yMFaCLpIjukLoH6i4U2Dyg7fDFTFr
         JRPL+pj+DZJnT6xfSCVfTsQ2EpclHes/PPn5V632aVFiBhKMOulTksnelmemxFnWFnhh
         738g==
X-Gm-Message-State: AOAM53284qCsC+TS7vrSSLDm7iUZ9sxaQmWtb1aV5Q19jKdmPc5awbt6
        2B2nHXQByYU6Mtg8Het52X1utBYUPS/08C/AO2Gmaz5fDI2FQiicJipaHEyDsS5/Lsz85cES4oG
        bj1CzkpPEmtl7PVADPd4xxoORq3y7HeSaJEDrz4Q=
X-Received: by 2002:a17:90a:c28e:: with SMTP id f14mr34822875pjt.56.1620222040344;
        Wed, 05 May 2021 06:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7cnIiu+WxfeCwjS5tyfsPvVXHGPhlhdZd7BLJCPPapF4VYnPTcvdDgYGZppFLhonQeNs+mG8XmgQ9zgIiUvk=
X-Received: by 2002:a17:90a:c28e:: with SMTP id f14mr34822858pjt.56.1620222040130;
 Wed, 05 May 2021 06:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210306133716.453447-1-hdegoede@redhat.com> <20210306133716.453447-3-hdegoede@redhat.com>
In-Reply-To: <20210306133716.453447-3-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 5 May 2021 15:40:29 +0200
Message-ID: <CAO-hwJLdNiKG-+YZVSZ1hPztjgCTYrmeh2qdVvropkeeRxpYAg@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: multitouch: Disable event reporting on suspend
 when our parent is not a wakeup-source
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Sat, Mar 6, 2021 at 2:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Disable event reporting on suspend when our parent is not
> a wakeup-source. This should help save some extra power in
> this case.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/Kconfig          |  2 +-
>  drivers/hid/hid-multitouch.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 786b71ef7738..5cbe4adfd816 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -675,7 +675,7 @@ config HID_MONTEREY
>
>  config HID_MULTITOUCH
>         tristate "HID Multitouch panels"
> -       depends on HID
> +       depends on USB_HID

I tried really hard during the past 8 years to not have a usbhid
dependency on hid-multitouch.

The code below should not break the test suite, but still I am not
that happy about the Kconfig change.

I don't see an immediate and better way of doing what you are
achieving here, but maybe you have some magic I did not think about
that would help to no pull USB_HID with HID_MULTITOUCH.

FTR, I think the use case of hid-multitouch *without* USB is rather
non-existent, but there might be some weird systems with I2C only
(edge computing?).

Cheers,
Benjamin

>         help
>           Generic support for HID multitouch panels.
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index cfb68e443ddd..7926295bab81 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1759,12 +1759,33 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  }
>
>  #ifdef CONFIG_PM
> +
> +/* Check if the parent which has the power/wakeup* sysfs attributes may wake the hdev */
> +static bool mt_parent_may_wake(struct hid_device *hdev)
> +{
> +       struct device *parent = hdev->dev.parent;
> +
> +       /*
> +        * USB-HID is attached to the usb_interface (our parent), the
> +        * power/wakeup* attr are part of the usb-device which is its parent.
> +        */
> +       if (hid_is_using_ll_driver(hdev, &usb_hid_driver) && parent)
> +               parent = parent->parent;
> +
> +       if (parent)
> +               return device_may_wakeup(parent);
> +
> +       /* Huh? Play it safe and keep reporting events. */
> +       return true;
> +}
> +
>  static int mt_suspend(struct hid_device *hdev, pm_message_t state)
>  {
>         struct mt_device *td = hid_get_drvdata(hdev);
>
>         /* High latency is desirable for power savings during S3/S0ix */
> -       if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
> +       if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
> +           !mt_parent_may_wake(hdev))
>                 mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
>         else
>                 mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
> --
> 2.30.1
>

