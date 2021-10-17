Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C80F430C82
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 23:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344683AbhJQWBL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 18:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242831AbhJQWBK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 18:01:10 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611FCC06161C;
        Sun, 17 Oct 2021 14:59:00 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id m13so9218983qvk.1;
        Sun, 17 Oct 2021 14:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAYR04dhIfH5S+bn2Qux0e8c7yDxYYlYP/P2nJsD3vU=;
        b=AkjuwHpW5R51V84paJ8ElkJ52uNL2z3ED5c5AFGvqSQCac0J2hocQ6qdVeys9Blgzz
         FVrtWOzbKG89PhNVzqkSyqzkwXsX0JowUg2gFzEqJz9HUMo815ny9KG4WCVKmtiKcy41
         mvZDOPEV2SQz9+X6KoMBja2dPhzytWld6YArJ6GaQYDgBhaTDZVFUctGfg+ITaWE/wQu
         5BDlFz4CUy5mF2qjKGaxdiOJFrz/8Bag6zIvIhxmMhxu+laKxIFsWZon8U2LZ+Nmv7JR
         tskL2G2PkjlI2AV8y56hJGb4zUbqAoZr0N/mMeZ09hqI7XOH0UeXyb19jj6eM3avJJUp
         Z7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAYR04dhIfH5S+bn2Qux0e8c7yDxYYlYP/P2nJsD3vU=;
        b=E1D0zPREyJELJBOR0ThXKCR8z9OpWRDxVJyVsOEF08qkt90564TjwHd01vlbSRTBD6
         GRB90ttRCVZp/pJ/rBzaNlVnqJWkWWrf9e3Stu5iP+Rpiw16pZAfDTndlw3sTubS6A/H
         pXaPaKo1m/+jfq4Tg1nkVZML/74G287Hq0UPDxXOMHG9izAQ5NW9zbEq5JR/DVgzmp6L
         5BQm6+gBEuJqJqHrHvmdQ8aFfby0Ld77kDXnlZPMpP8MB996RfXkPxnYG0BougD1Mym9
         Fk2TnkEXLYj6cVJyoYG3bqlVIhHM7Vs00YAmVU+LTc8pfPuzFK01RfNnk/6C1aVSGyuO
         cOsw==
X-Gm-Message-State: AOAM532Emx8q8eHPghKIpaLWXJXT2ScOEQIFLT0enLVmZeWyvaroVU0I
        d5sqfObEhyrh2VIcktTPLPP5uQ6aMJwK658nSbs=
X-Google-Smtp-Source: ABdhPJw/GPrNCMvIPZopG7TCUhCasU6kY67aJ41lEsQW2vLypC/X03Yl/J6LGA2BqjiAyGx+SE+EPyedkVjzVfktzyg=
X-Received: by 2002:ad4:5bcf:: with SMTP id t15mr22427849qvt.59.1634507939139;
 Sun, 17 Oct 2021 14:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125939.427-1-caihuoqing@baidu.com> <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm>
 <CANRwn3SZagP7uCSHVDGMPMqQiKyUQJSjq143_DA1y0UPvsmkAA@mail.gmail.com>
 <DB6PR07MB4278FF50AB23B9B69411CA3B9BB19@DB6PR07MB4278.eurprd07.prod.outlook.com>
 <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com> <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com>
In-Reply-To: <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com>
From:   Ping Cheng <pinglinux@gmail.com>
Date:   Sun, 17 Oct 2021 14:58:47 -0700
Message-ID: <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Make use of the helper function devm_add_action_or_reset()
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jason Gerecke <killertofu@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Aaron Skomra <skomra@gmail.com>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>, caihuoqing@baidu.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I tested the set of two patches. I didn't see any issues with them
applied. But, while reviewing the patches, I noticed a minor logic
mismatch between the current patch and the original code. I'd hope at
least one of the maintainers (Jiri, Benjamin, or Dimitry) reviews this
patch, especially the part that I commented below, to make sure that
we don't trigger any race condition.

Thank you Huoqing, Jason, and the maintainer team!

> > From 7adc05783c7e3120028d0d089bea224903c24ccd Mon Sep 17 00:00:00 2001
> > From: Jason Gerecke <jason.gerecke@wacom.com>
> > Date: Thu, 14 Oct 2021 07:31:31 -0700
> > Subject: [PATCH] RFC: HID: wacom: Shrink critical section in
> >  `wacom_add_shared_data`
> >
> > The size of the critical section in this function appears to be larger
> > than necessary. The `wacom_udev_list_lock` exists to ensure that one
> > interface cannot begin checking if a shared object exists while a second
> > interface is doing the same (otherwise both could determine that that no
> > object exists yet and create their own independent objects rather than
> > sharing just one). It should be safe for the critical section to end
> > once a fresly-allocated shared object would be found by other threads
> > (i.e., once it has been added to `wacom_udev_list`, which is looped
> > over by `wacom_get_hdev_data`).
> >
> > This commit is a necessary pre-requisite for a later change to swap the
> > use of `devm_add_action` with `devm_add_action_or_reset`, which would
> > otherwise deadlock in its error case.
> >
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > ---
> >  drivers/hid/wacom_sys.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > index 93f49b766376..62f50e4b837d 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> > @@ -881,8 +881,8 @@ static int wacom_add_shared_data(struct hid_device *hdev)
> >       if (!data) {
> >               data = kzalloc(sizeof(struct wacom_hdev_data), GFP_KERNEL);
> >               if (!data) {
> > -                     retval = -ENOMEM;
> > -                     goto out;
> > +                     mutex_unlock(&wacom_udev_list_lock);
> > +                     return -ENOMEM;
> >               }
> >
> >               kref_init(&data->kref);
> > @@ -890,11 +890,12 @@ static int wacom_add_shared_data(struct hid_device *hdev)
> >               list_add_tail(&data->list, &wacom_udev_list);
> >       }
> >
> > +     mutex_unlock(&wacom_udev_list_lock);
> > +
> >       wacom_wac->shared = &data->shared;
> >
> >       retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
> >       if (retval) {
> > -             mutex_unlock(&wacom_udev_list_lock);

The mutex_unlock was called after devm_add_action is finished, whether
it is a failure or success. The new code calls mutex_unlock before
devm_add_action is executed. Is that ok? If there is no concern from
the maintainers, the patch has been:

Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
Tested-by: Ping Cheng <ping.cheng@wacom.com>

Cheers,
Ping

> >               wacom_remove_shared_data(wacom);
> >               return retval;
> >       }
> > @@ -904,8 +905,6 @@ static int wacom_add_shared_data(struct hid_device *hdev)
> >       else if (wacom_wac->features.device_type & WACOM_DEVICETYPE_PEN)
> >               wacom_wac->shared->pen = hdev;
> >
> > -out:
> > -     mutex_unlock(&wacom_udev_list_lock);
> >       return retval;
> >  }
> >
> > --
> > 2.33.0
> >
>
