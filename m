Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0AB399886
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 17:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbfHVPuW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 22 Aug 2019 11:50:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49078 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729069AbfHVPuW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 11:50:22 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 80F9C285AE
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 15:50:21 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id x28so6211567qki.21
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 08:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e33KgK5g3O2XLfmnWFACPhTCEze1U4J8Z33SDjP74cg=;
        b=lgQlflVfjM4967JD+vvdU1BF+qEJSyuz3/X51GuX6bxbRFJNEy1ULrN4ZmTqJfJ6Xg
         UATm7YaTtvTjUqhU98FmgLfmRLQw3zMLaiKBpxABY/2SeZ04iy0upVi9hYKVMISNoCGg
         DLQ8fhxr5GyHlfU8B0IewoSCGQKQiDV0V0RXtrZgrGoA+xfY5q8yVVVYLCEIffSmaZy6
         xCX86iGetcoxlFMT9NAaV8sXRcCpcuhKdtYjerVeVtAJsqtJ79beew4LvfBwgOC4+igE
         C1eubnETgtyb75X/9RximZZRtEe8XTiUVJ/Pi+vup8qZ7gySxOsKHq+VkurHXlPN/QKQ
         pQiA==
X-Gm-Message-State: APjAAAVN2QuMwzb2E21/fomzz94hol0JAOY2iSKnSICfjcNZMj+4O26b
        +UiJiYWCujdIYs/tFDBJ/8EMUM/t0hCofHPNxuOAgKJswJD+p3AfWVc7DGRb6tHNntRUhA8b7Vd
        4qM0wxEG9ZOBhIrEXoz8UCIcUzfzBWEI5NR33/WE=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr199538qti.345.1566489020852;
        Thu, 22 Aug 2019 08:50:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRgOzepRKfTeAqRTqi7wUGOejeOBFZfIFjjdiBfCpr2htlaQFncT/AR+JSo1yb4xgQ3hq2ONwRKd7bXhpahuI=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr199526qti.345.1566489020648;
 Thu, 22 Aug 2019 08:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190812162740.15898-1-benjamin.tissoires@redhat.com>
 <20190812162740.15898-2-benjamin.tissoires@redhat.com> <20190813075358.2a3cbfbd@pluto.restena.lu>
In-Reply-To: <20190813075358.2a3cbfbd@pluto.restena.lu>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 22 Aug 2019 17:50:08 +0200
Message-ID: <CAO-hwJJUT3eWMrnGP6zsaqdaWNfv=h6tcwyHJsu=Q5Mhp4_Pcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: do not call hid_set_drvdata(hdev, NULL) in drivers
To:     =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 13, 2019 at 7:54 AM Bruno Prémont <bonbons@linux-vserver.org> wrote:
>
> On Mon, 12 Aug 2019 18:27:39 +0200 Benjamin Tissoires wrote:
> > This is a common pattern in the HID drivers to reset the drvdata. Some
> > do it properly, some do it only in case of failure.
> >
> > But, this is actually already handled by driver core, so there is no need
> > to do it manually.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> For hid-picolcd_core.c:
>   Acked-by: Bruno Prémont <bonbons@linux-vserver.org>

Thanks for the acks.

Applied to for-5.4/cleanup

Cheers,
Benjamin

>
> > ---
> >  drivers/hid/hid-cougar.c       | 6 ++----
> >  drivers/hid/hid-gfrm.c         | 7 -------
> >  drivers/hid/hid-lenovo.c       | 2 --
> >  drivers/hid/hid-picolcd_core.c | 7 +------
> >  drivers/hid/hid-sensor-hub.c   | 1 -
> >  5 files changed, 3 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/hid/hid-cougar.c b/drivers/hid/hid-cougar.c
> > index e0bb7b34f3a4..4ff3bc1d25e2 100644
> > --- a/drivers/hid/hid-cougar.c
> > +++ b/drivers/hid/hid-cougar.c
> > @@ -207,7 +207,7 @@ static int cougar_probe(struct hid_device *hdev,
> >       error = hid_parse(hdev);
> >       if (error) {
> >               hid_err(hdev, "parse failed\n");
> > -             goto fail;
> > +             return error;
> >       }
> >
> >       if (hdev->collection->usage == COUGAR_VENDOR_USAGE) {
> > @@ -219,7 +219,7 @@ static int cougar_probe(struct hid_device *hdev,
> >       error = hid_hw_start(hdev, connect_mask);
> >       if (error) {
> >               hid_err(hdev, "hw start failed\n");
> > -             goto fail;
> > +             return error;
> >       }
> >
> >       error = cougar_bind_shared_data(hdev, cougar);
> > @@ -249,8 +249,6 @@ static int cougar_probe(struct hid_device *hdev,
> >
> >  fail_stop_and_cleanup:
> >       hid_hw_stop(hdev);
> > -fail:
> > -     hid_set_drvdata(hdev, NULL);
> >       return error;
> >  }
> >
> > diff --git a/drivers/hid/hid-gfrm.c b/drivers/hid/hid-gfrm.c
> > index 86c317320bf2..699186ff2349 100644
> > --- a/drivers/hid/hid-gfrm.c
> > +++ b/drivers/hid/hid-gfrm.c
> > @@ -123,12 +123,6 @@ static int gfrm_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >       return ret;
> >  }
> >
> > -static void gfrm_remove(struct hid_device *hdev)
> > -{
> > -     hid_hw_stop(hdev);
> > -     hid_set_drvdata(hdev, NULL);
> > -}
> > -
> >  static const struct hid_device_id gfrm_devices[] = {
> >       { HID_BLUETOOTH_DEVICE(0x58, 0x2000),
> >               .driver_data = GFRM100 },
> > @@ -142,7 +136,6 @@ static struct hid_driver gfrm_driver = {
> >       .name = "gfrm",
> >       .id_table = gfrm_devices,
> >       .probe = gfrm_probe,
> > -     .remove = gfrm_remove,
> >       .input_mapping = gfrm_input_mapping,
> >       .raw_event = gfrm_raw_event,
> >       .input_configured = gfrm_input_configured,
> > diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> > index 364bc7f11d9d..96fa2a2c2cd3 100644
> > --- a/drivers/hid/hid-lenovo.c
> > +++ b/drivers/hid/hid-lenovo.c
> > @@ -866,8 +866,6 @@ static void lenovo_remove_tpkbd(struct hid_device *hdev)
> >
> >       led_classdev_unregister(&data_pointer->led_micmute);
> >       led_classdev_unregister(&data_pointer->led_mute);
> > -
> > -     hid_set_drvdata(hdev, NULL);
> >  }
> >
> >  static void lenovo_remove_cptkbd(struct hid_device *hdev)
> > diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
> > index 5f7a39a5d4af..1b5c63241af0 100644
> > --- a/drivers/hid/hid-picolcd_core.c
> > +++ b/drivers/hid/hid-picolcd_core.c
> > @@ -534,8 +534,7 @@ static int picolcd_probe(struct hid_device *hdev,
> >       data = kzalloc(sizeof(struct picolcd_data), GFP_KERNEL);
> >       if (data == NULL) {
> >               hid_err(hdev, "can't allocate space for Minibox PicoLCD device data\n");
> > -             error = -ENOMEM;
> > -             goto err_no_cleanup;
> > +             return -ENOMEM;
> >       }
> >
> >       spin_lock_init(&data->lock);
> > @@ -597,9 +596,6 @@ static int picolcd_probe(struct hid_device *hdev,
> >       hid_hw_stop(hdev);
> >  err_cleanup_data:
> >       kfree(data);
> > -err_no_cleanup:
> > -     hid_set_drvdata(hdev, NULL);
> > -
> >       return error;
> >  }
> >
> > @@ -635,7 +631,6 @@ static void picolcd_remove(struct hid_device *hdev)
> >       picolcd_exit_cir(data);
> >       picolcd_exit_keys(data);
> >
> > -     hid_set_drvdata(hdev, NULL);
> >       mutex_destroy(&data->mutex);
> >       /* Finally, clean up the picolcd data itself */
> >       kfree(data);
> > diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
> > index be92a6f79687..94c7398b5c27 100644
> > --- a/drivers/hid/hid-sensor-hub.c
> > +++ b/drivers/hid/hid-sensor-hub.c
> > @@ -742,7 +742,6 @@ static void sensor_hub_remove(struct hid_device *hdev)
> >       }
> >       spin_unlock_irqrestore(&data->lock, flags);
> >       mfd_remove_devices(&hdev->dev);
> > -     hid_set_drvdata(hdev, NULL);
> >       mutex_destroy(&data->mutex);
> >  }
> >
