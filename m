Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9635B9F92
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 18:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiIOQWI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Sep 2022 12:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiIOQWH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Sep 2022 12:22:07 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496A79DF88
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 09:22:07 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1279948d93dso48127652fac.10
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kIZF7U62VhlKQ/wsT9kXxUWvD5ul4B0Zexz0rH7KxH0=;
        b=dmTbYZK01Z+jat9aGUxZxkD8Imdflo3gSi4+Q0GPKYQ7ZZwhCf6XQBEeBWWU2YpIn7
         /tlkC/LvyNz1CtSIvPDe+CSV+dzBAt5p45/NdSXDOK/Ip0lY4Q23rlb6qxulNzSxXMwD
         aMblJjXZUMIL+xCmY+R5Z69MZ3+bMj2hbJglE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kIZF7U62VhlKQ/wsT9kXxUWvD5ul4B0Zexz0rH7KxH0=;
        b=dP1aN5yIrl4/ZifS+hVFaG8qqKJnJcnyy9ErWFd2f6YTozq7psgjANsilu0PfLdwKH
         EMMpOKRCpcTnftQ2hMx9G/91k4J8qgp9L5EjWiPKKiyyK/qPIplgpEuqKrjhEoZM2HwB
         tuepuD3jC9kLmmGMMBBNE3LW9d1Arch75IfleksimDYRDwYUOpU2nkmpY7bk3Cf4Q/t9
         ar7v2GVwFUWz8c3Dx7A7Sy27NkdXdmm0K+hXPxrmbf3OVAWFQ+s5vl2j7UkTPVEdILLQ
         jnKEs2PkRUvMCi7DYHmVe1G6F4W1uCJK0DeD7m7CKy7GUZtWwmSB7SVGSKD77cyuhq96
         RiiQ==
X-Gm-Message-State: ACgBeo0Oa3HZJyLtu37U+/glCOF6jTdjxM4I1k0L82zHRbArmd5/0jgX
        IatzWFo9duhFdPQzuU7V+fSioOVPJRn9vHk3QBU=
X-Google-Smtp-Source: AA6agR4CV9JhgYjrrjlY3JTP6SrkXn+qUoyBm0CCaDOUAwKha29GA1+n/70L5u66xL0PjGHa5j16Qw==
X-Received: by 2002:a05:6870:c0c1:b0:10d:96:737f with SMTP id e1-20020a056870c0c100b0010d0096737fmr5869687oad.101.1663258925882;
        Thu, 15 Sep 2022 09:22:05 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id q8-20020a4aac48000000b00425806a20f5sm7989061oon.3.2022.09.15.09.22.03
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:22:04 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id cm7-20020a056830650700b006587fe87d1aso2402945otb.10
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 09:22:03 -0700 (PDT)
X-Received: by 2002:a05:6830:698e:b0:636:a515:35eb with SMTP id
 cy14-20020a056830698e00b00636a51535ebmr214988otb.169.1663258923000; Thu, 15
 Sep 2022 09:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220914132146.6435-1-hadess@hadess.net>
In-Reply-To: <20220914132146.6435-1-hadess@hadess.net>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 15 Sep 2022 17:21:52 +0100
X-Gmail-Original-Message-ID: <CA+jURcvMcKgLzrCxXoYoxvR9uQY-J5GfQhcrpkm6mBgqqKHqmQ@mail.gmail.com>
Message-ID: <CA+jURcvMcKgLzrCxXoYoxvR9uQY-J5GfQhcrpkm6mBgqqKHqmQ@mail.gmail.com>
Subject: Re: [PATCH v1] HID: logitech-hidpp: Detect hi-res scrolling support
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 14 Sept 2022 at 14:22, Bastien Nocera <hadess@hadess.net> wrote:
>
> Rather than relying on a never-ending stream of patches for quirks.
>
> This change will detect whether HID++ 1.0 hi-res scroll, HID++ 2.0
> hi-res scroll or HID++ 2.0 hi-res scroll wheel is supported, and enable
> the feature without the need for quirks.
>
> Tested on a Logitech M705 mouse that was unsupported before this change.
>
> [    9.365324] logitech-hidpp-device 0003:046D:406D.0006: input,hidraw3: USB HID v1.11 Mouse [Logitech M705] on usb-0000:00:14.0-4/input2:3
> [   57.472434] logitech-hidpp-device 0003:046D:406D.0006: HID++ 4.5 device connected.
> [   57.616429] logitech-hidpp-device 0003:046D:406D.0006: Detected HID++ 2.0 hi-res scroll wheel
> [   57.712424] logitech-hidpp-device 0003:046D:406D.0006: wheel multiplier = 8
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216480
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 118 ++++++++++++++++---------------
>  1 file changed, 61 insertions(+), 57 deletions(-)

Ah, I'd been wanting to do this in my initial implementation, but
couldn't work it out for some reason. Good to see the need for the
quirks list replaced!

Reviewed-by: Harry Cutts <hcutts@chromium.org>
