Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9B968D6D6
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 13:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjBGMes (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Feb 2023 07:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjBGMes (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Feb 2023 07:34:48 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA82CEB6D;
        Tue,  7 Feb 2023 04:34:46 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id m1so14230813vst.7;
        Tue, 07 Feb 2023 04:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Io2DVVtP8sZ7cytcPBP+5vCjRogmBz7P97FYusLNMo=;
        b=QeZoBIaW3NpaciWyFuCzOKEuhFNT/UmPoJ1F0q0hSthdyq4EmPUW2XPuA+5Xixf2e+
         rGLEzQIx+vj5Jv7/mjsjfQBBEsOUpvpjbKPp/kQzTGB8leb8hDGnMBNKBiSzJZS3dhhK
         TyRU+3osfakZnUgA8KIak3duHm+NBFx2MjSlXxsoNnVVLqPv+3MIZHFz0MnSySy6ySu6
         xoQtFHl/26LxkTHzEgGWw3oq+5X4Pq2wvJfMMkNdcW5Q7WgzTJkziTAsesap84TqK2Ek
         FBhX97UnBKbeuQEEzDbCQRHRgh3kD0Fy+OvHptbpPtqRCF4SDizxfNxAehgh+zCv9Jbt
         04Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Io2DVVtP8sZ7cytcPBP+5vCjRogmBz7P97FYusLNMo=;
        b=Et2NxuRMrQkh1SqcBr9IxciAxsrqC1HeBwU9kRci6h197VKIyg7BvjZYJccM6kYxg+
         B9aT7ALvpgDdy/3F9HbhRdoNvEI4n6lmZal5sceDT8nlQd9k48czhCf24AeRxSVfDJy/
         xyYGkES5r6JfepR9QhiPESAngEsO5JeqxsTFEzgAix/EwiabsPevQn6+zyGrHkt4+DR3
         264xTBBblPq6BgcQunpv8Wu3PIZEjpw7LbOPPKWrE0nBjKLwHHM2hKdkcA0qbb2qjfkr
         SZCb4ACwNkOmYJnNDpEqWlASIlFsL9Y7yrXjpndBxToaIEgToia5jiwBPskYgPKFxUJS
         XDQw==
X-Gm-Message-State: AO0yUKUA4QreSG68wHGYlsie2dCyEyUwacTVPAeBExhlQ/o53f72Tk3W
        O60uY5O7FLmEW3gRRXC6G4+5LMOyF/guIZlcOek=
X-Google-Smtp-Source: AK7set/wPOMIL9OTkb4WEoDMKk/ZqWi3QnZOMBVLBr/snLyz/jXHS/dDxH5d0jNkXg5lGx4pQbjsvc2kOjSGhCIynKc=
X-Received: by 2002:a67:d60d:0:b0:411:a8fb:4f41 with SMTP id
 n13-20020a67d60d000000b00411a8fb4f41mr115733vsj.67.1675773285564; Tue, 07 Feb
 2023 04:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20230206135016.6737-1-kaehndan@gmail.com> <20230206135016.6737-4-kaehndan@gmail.com>
 <Y+GKFlcVA2hB+3rU@google.com>
In-Reply-To: <Y+GKFlcVA2hB+3rU@google.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Tue, 7 Feb 2023 06:34:32 -0600
Message-ID: <CAP+ZCCfnbMpQX4qQee3QZgOft=vQ0BLBgqQUwzPNH7qYopufAQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] HID: cp2112: Fix driver not registering GPIO IRQ
 chip as threaded
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 6, 2023 at 5:15 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Feb 06, 2023 at 07:50:15AM -0600, Danny Kaehn wrote:
> > The CP2112 generates interrupts from a polling routine on a thread,
> > and can only support threaded interrupts. This patch configures the
> > gpiochip irq chip with this flag, disallowing consumers to request
> > a hard IRQ from this driver, which resulted in a segfault previously.
>
> This looks like a bugfix not dependent on anything else in the series
> and can be applied separately...

This is correct (though usage of this patchset to instantiate drivers
which request interrupts will most of the time be broken without this
patch). Does this mean I should submit this patch independently from
the rest of the series? Or should I just include a message to the
maintainer describing what you said (that this can be applied
separately)?

Thanks,

Danny Kaehn

>
> >
> > Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> > ---
> >  drivers/hid/hid-cp2112.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
> > index 1e16b0fa310d..27cadadda7c9 100644
> > --- a/drivers/hid/hid-cp2112.c
> > +++ b/drivers/hid/hid-cp2112.c
> > @@ -1354,6 +1354,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >       girq->parents = NULL;
> >       girq->default_type = IRQ_TYPE_NONE;
> >       girq->handler = handle_simple_irq;
> > +     girq->threaded = true;
> >
> >       ret = gpiochip_add_data(&dev->gc, dev);
> >       if (ret < 0) {
> > --
> > 2.25.1
> >
>
> --
> Dmitry
