Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E38606387
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 16:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiJTOsu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 10:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiJTOst (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 10:48:49 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60D0BE39
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 07:48:48 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 101-20020a9d0bee000000b00661b54d945fso11535765oth.13
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G7/rmPvFhevFRpfN+9ghc+3xfW/TwKRXhIcTua9FlLk=;
        b=Pi3naS6s8LovYodrVmGmL7TBYarXR96xFwomycarsJ2nQ1EHQbrUd6mKIzDzHa6w5p
         2ApiJlLHiB5/15QZYrNZc1QEAq83bevltyAwlsNrSVaFQvjyZP0TdgNfo/j2+lZApuiX
         mJfUmM85WQvGYDxlZ753evvRJESeqGIz1tOXHALP8btgIKJ/hu07bYN5Fx0oqWGG3Nqr
         Dg9ExS0MrRecJsh0JXsi++LVd1u03cYAgzTu8r+vBTjNHPXPcefheGAU8p5Vs91EHsvI
         UlSeRsZVPwr27R9uBObbn4w4Sm7//qpZplrymfDKgUrK+uyf0FQPfgnCqOm1sYRGMF3Y
         zNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7/rmPvFhevFRpfN+9ghc+3xfW/TwKRXhIcTua9FlLk=;
        b=XouOdQwxx4Exzyy+WEIMiX8zxg1mwuqC/a4TB/0oHaoKNLxkDct2t4lku6mZqoTULK
         YgmwNwYOc/4j1yPhd1ZBndf61WpLRYm7uRoRfK1bO/PFur2gZJmN6M7EHgOAa9U521wI
         jJ3x33nfqrgi+k5Y9Ul/QJkbxzsG7V0qFpHzT9KLPTyIqiHHIOBmPrO4izDkOEIwP25M
         7fgE+BWTAhHYcvdL+yTc/KriDcbo3uqTs2M8WRp7Tua58yGNV9SV5f8GGD73B49tKTuZ
         mMh8B7H5Qrpip+S1cms34XZq6yvV1AaGuWdsTPomYOKxtuTdHl97Nu+OTDQ7DhT0LuiN
         OdAA==
X-Gm-Message-State: ACrzQf0ykIytw+Ctd1wR5+xbpMTrcySN0ML1OLiMIvXrWX5vaEfPr3YP
        p1rIgJ2Le9vyHE3MAsGrhFwLvaS8agl4Eyr2JzDElpOAFglQCw==
X-Google-Smtp-Source: AMsMyM60enLpgZqeV6+feXI8zDHuvnXcUxNpssKF6UYn/ZYyndVFChpkJ4h5zpQxKh8IQQh8YSzK/Zh4ZYe8yW7iZ0Q=
X-Received: by 2002:a05:6830:4114:b0:661:a008:3777 with SMTP id
 w20-20020a056830411400b00661a0083777mr7305139ott.200.1666277327948; Thu, 20
 Oct 2022 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221019151832.44522-1-jason.gerecke@wacom.com> <CAO-hwJLnuvfic+8vw6OzM0NV66eL40-QEVvXj97dxVimbF7PDA@mail.gmail.com>
In-Reply-To: <CAO-hwJLnuvfic+8vw6OzM0NV66eL40-QEVvXj97dxVimbF7PDA@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Thu, 20 Oct 2022 07:48:35 -0700
Message-ID: <CANRwn3SDwUKZ_o_O2Mua8LjVQbkMxBUmU1hOhODGNY0kpekonQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input application
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua@joshua-dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
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

On Wed, Oct 19, 2022 at 8:40 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 5:18 PM Gerecke, Jason <killertofu@gmail.com> wrote:
> >
> > From: Jason Gerecke <jason.gerecke@wacom.com>
> >
> > "Digitizer" is a generic usage that may be used by various devices but
> > which is particularly used by non-display pen tablets. This patch adds the
> > usage to the list of values matched by the IS_INPUT_APPLICATION() macro
> > that determines if an input device should be allocated or not.
> >
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> > ---
> >  include/linux/hid.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 4363a63b9775..07803e144d98 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *hdev)
> >  /* We ignore a few input applications that are not widely used */
> >  #define IS_INPUT_APPLICATION(a) \
> >                 (((a >= HID_UP_GENDESK) && (a <= HID_GD_MULTIAXIS)) \
> > -               || ((a >= HID_DG_PEN) && (a <= HID_DG_WHITEBOARD)) \
>
> FWIW, this has always been problematic, and I am pretty  sure this is
> breaking existing devices.
>
> Have you been running the hid-tools testsuite to see if there were any
> regressions?
>
> Cheers,
> Benjamin
>

I was slightly worried that this usage might have been explicitly
excluded for some compatibility reason, but I didn't see anything in
the commit history that said that. I also had a hard time convincing
myself that allocating an input device for a weird device where it is
unnecessary would cause too much trouble.

I didn't see any regressions when running the hid-tools testsuite. The
output from the 5.15.74 kernel with / without the patch applied is
almost identical (there are numerous test failures in test_tablet.py
even in the unpatched case; maybe I should re-run with Linus's latest
master instead?)

Jason

> > +               || ((a >= HID_DG_DIGITIZER) && (a <= HID_DG_WHITEBOARD)) \
> >                 || (a == HID_GD_SYSTEM_CONTROL) || (a == HID_CP_CONSUMER_CONTROL) \
> >                 || (a == HID_GD_WIRELESS_RADIO_CTLS))
> >
> > --
> > 2.38.0
> >
>
