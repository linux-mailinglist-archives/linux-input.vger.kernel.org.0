Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719E1509E81
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 13:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242426AbiDUL0P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 07:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbiDUL0O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 07:26:14 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4652BB2C
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 04:23:24 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2f18982c255so48632717b3.1
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IpNE+8WBaqpz2pi2KGqw71IsYRjZbumLdmNq2fOmYP8=;
        b=7+eOax+mAyqiDvs/xX0jIvGZ3dB6wJa5xUP4n2cBh4+QF5elNo2LHwg5CgS64pV+pi
         jC4jI8XDl8fDtptet1nx/qbXS8LF48/+DBqokbAZF/l5JLYy8orOMAtOdfmab/edPV7p
         yzgjIsxPzoYW5hDcL097q7LYyXC4QsjA62S/i2/GB0ljSFT2Mv5FiaWFkhZa31ogguLe
         WXgZnU2ejpnseFiro0VMCj5jY8R8YID9fN2oip0lm+jnEtoHXq9pPFPNhEeWwOM4kfpk
         qvWM0yMNBBhPBO+ZLPuM8JcqEa+DaBkME2VRYV0/D7SOk4mS4MDmdxbSqxsevK7VUM2z
         Areg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IpNE+8WBaqpz2pi2KGqw71IsYRjZbumLdmNq2fOmYP8=;
        b=bsqGu3U4Oj7/seEYujjJf7exJFsn6T38mooMoR600oRPgGs2abrx7I8ziuzpj5lhal
         +zX+oTvjDOpQxtXU2fZ6LZ08WontHZnRl2mH1Vac04AH9eGmITfy2CFVdbmACuXs93I3
         IeOuEHJEZxiUwS3nX2JGWJfAHehR1HiFckPdEFNPiSx8dduyRXUESWmeTkZm8NNlfDcd
         HLkzZekzzHI30i7hvRfd6MtY6dY3+rOldUkonAgRhYS1cjHQnFdYek+7ygbm5lCqrvTi
         olQxQpz+QRa1fCtiuAG/l2RKFQoFsswvhwLBPqNQEN198QZhN3oB6suht9dQQF1DgUbp
         VlHA==
X-Gm-Message-State: AOAM532i004w8KX68syqvwlyrmMjz4sCPYQXppx9vOE0pfvSlk5EkOOm
        lgXo6dwVhegY/VzJKGtTrYAysjxtB6fVSO8lWevCvg==
X-Google-Smtp-Source: ABdhPJxxLYRhCBJSfh33cRgd5g5Rq3w/IoMxWE2M1FbL0mnnS6n2/PyaSeD5H46EsjiivUaEAOOXMfFirDMbOFecdCo=
X-Received: by 2002:a81:348a:0:b0:2f4:d78f:4d99 with SMTP id
 b132-20020a81348a000000b002f4d78f4d99mr2257066ywa.282.1650540203969; Thu, 21
 Apr 2022 04:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220419122632.2988786-1-acz@semihalf.com> <YmByPhFWkzpPrpYe@google.com>
In-Reply-To: <YmByPhFWkzpPrpYe@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Thu, 21 Apr 2022 13:23:12 +0200
Message-ID: <CAB4aORXvVzD4YPC2RdA6pFzSSeLj2oqMpanbGziWkf99WSHGsQ@mail.gmail.com>
Subject: Re: [PATCH] HID: add HID device reset callback
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Wed, Apr 20, 2022 at 10:51 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Angela,
>
> On Tue, Apr 19, 2022 at 12:26:32PM +0000, Angela Czubak wrote:
> > @@ -529,6 +529,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
> >               /* host or device initiated RESET completed */
> >               if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
> >                       wake_up(&ihid->wait);
> > +             if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
> > +                     ihid->hid->driver->reset(ihid->hid);
>
> I wonder if this would not be better to execute the reset callback
> first, before signalling that the reset has completed instead of racing
> with i2c_hid_hw_reset()?
>

I think it could result in a deadlock. If we don't clear
I2C_HID_RESET_PENDING, and if it has been set, then reset_lock
is still taken. This way, if the reset callback wants to send a report
to the device, it will keep spinning on reset_lock
in i2c_hid_output_raw_report().
Since the reset callback will be most likely used to re-configure
the device, we need to be able to send any report and not hang
on reset_lock.
Let me know if you think this not an issue or there is an additional
comment needed in the patch so that the reasoning standing
by the order of issuing the callback and clearing the bit is clear.

> Thanks.
>
> --
> Dmitry
