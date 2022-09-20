Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C29A5BE735
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 15:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbiITNf6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 09:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiITNfm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 09:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D3D101D0
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663680941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9x8e5qkUjMznghkBDdwOcBCIS07P7DOG6g3UpXG3akw=;
        b=ExYtTqRXGu91PBxkHmNbDe1HEXCTuR7xoYhlDBxQtAkXtnBRRSCTF0H86zv5b8XNjCMr4H
        6vN5xnsEuKNbdvmEqt1FRbuzcaQRm2szvRaKjlOjfWedRr/ignu6I+UF6pZtTC4eSJTLVs
        f8atFI+10+qVmLrJDoZQb1gohTavYs0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-RpzHbUf2OgaL9mK5NSSLCA-1; Tue, 20 Sep 2022 09:35:39 -0400
X-MC-Unique: RpzHbUf2OgaL9mK5NSSLCA-1
Received: by mail-pj1-f71.google.com with SMTP id js4-20020a17090b148400b0020061aa46d7so1623593pjb.9
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9x8e5qkUjMznghkBDdwOcBCIS07P7DOG6g3UpXG3akw=;
        b=NNoh9jPS/v3i8nmM6LRh3IYHgcf6N5frYAO0B75xhx/AJ/IfqQOcd75vHL9jh5udOd
         IX+2ZnJ7ELXxJ3VlyfHUIsz1dUuMxsnoDVo6B/dGAolnB0sb15s7kLnJtvBuBY4FBPeV
         Cc2X4s0F14W4cJMiEerSLld39OxUeIsmPwhv5nLBmNqNucow7qhPyslZiCVTdBf8W+H6
         Z3H8F62FAibT/CRYGoNOWaol96TLvqz+MciiuCPkf2iad0COqubPLa7tks1d8JhtYIto
         QoJs8Sb89OfPYGprCji5BJgWOqcA6DRRE8SEP8TZSswIogcMUjUy2+smw47w5/2Iqfs2
         UyEA==
X-Gm-Message-State: ACrzQf0kb5UlFExiUcgsyVL73cWSZMSMBzf7vPHO5foP8rhLEEsCgG5Q
        JFDHZ9noBLdLatQWzrEUeHdf675MnCfpctED8gb4iqg2ulAULEH2EJAMTCeI5v0Hk9hRsiTlL5w
        oGY1tyIGFRXnjbSDIyBZkqTLD8wmjJKCoU/ucRb4=
X-Received: by 2002:a17:90a:f28b:b0:203:627c:7ba1 with SMTP id fs11-20020a17090af28b00b00203627c7ba1mr4026013pjb.191.1663680937965;
        Tue, 20 Sep 2022 06:35:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zTvy/bDvHyBrE+JUUsKur2adqFplid6MucMFNyIBVKKvLas2J1c7TNrnt2m4PiaCFrmunxu8S0yD35UFJ7tc=
X-Received: by 2002:a17:90a:f28b:b0:203:627c:7ba1 with SMTP id
 fs11-20020a17090af28b00b00203627c7ba1mr4025983pjb.191.1663680937706; Tue, 20
 Sep 2022 06:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220907150159.2285460-1-andri@yngvason.is>
In-Reply-To: <20220907150159.2285460-1-andri@yngvason.is>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Sep 2022 15:35:26 +0200
Message-ID: <CAO-hwJLAxcBB9sDHeQMZKDdbHpkz6L3vZX9f0pmg_moeRuvX6A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] HID: multitouch: Add memory barriers
To:     Andri Yngvason <andri@yngvason.is>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "3.8+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 7, 2022 at 5:02 PM Andri Yngvason <andri@yngvason.is> wrote:
>
> This fixes broken atomic checks which cause a race between the
> release-timer and processing of hid input.
>
> I noticed that contacts were sometimes sticking, even with the "sticky
> fingers" quirk enabled. This fixes that problem.
>
> Cc: stable@vger.kernel.org
> Fixes: 9609827458c3 ("HID: multitouch: optimize the sticky fingers timer")
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> ---

Applied to for-6.1/multitouch in hid.git

Sorry for the delay

Cheers,
Benjamin

>  V1 -> V2: Clarified where the race is and added Fixes tag as suggested
>            by Greg KH
>  V2 -> V3: Fix formatting of "Fixes" tag
>
>  drivers/hid/hid-multitouch.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 2e72922e36f5..91a4d3fc30e0 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1186,7 +1186,7 @@ static void mt_touch_report(struct hid_device *hid,
>         int contact_count = -1;
>
>         /* sticky fingers release in progress, abort */
> -       if (test_and_set_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
> +       if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
>                 return;
>
>         scantime = *app->scantime;
> @@ -1267,7 +1267,7 @@ static void mt_touch_report(struct hid_device *hid,
>                         del_timer(&td->release_timer);
>         }
>
> -       clear_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
> +       clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
>  }
>
>  static int mt_touch_input_configured(struct hid_device *hdev,
> @@ -1699,11 +1699,11 @@ static void mt_expired_timeout(struct timer_list *t)
>          * An input report came in just before we release the sticky fingers,
>          * it will take care of the sticky fingers.
>          */
> -       if (test_and_set_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
> +       if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
>                 return;
>         if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
>                 mt_release_contacts(hdev);
> -       clear_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
> +       clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
>  }
>
>  static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
> --
> 2.37.2
>

