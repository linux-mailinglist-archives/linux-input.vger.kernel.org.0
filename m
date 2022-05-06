Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629C951D1FB
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 09:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357767AbiEFHMX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 03:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbiEFHMX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 03:12:23 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 33C73644F2
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651820920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AbrdpOEBVjCoR01UHnvqVEVcSNNH/918yczItPTviEY=;
        b=QNd+AFImXooTQsNK+Yu2UjpX/1EDwYWUvwkx/31rswVHhoNV1/IYIvrBdKAHhxFxNfxDmW
        Cqr9joZ/5+5hpt1cL2TrusenrXKtCK26s73z9Vt9/TUP0RN9jSEmnHXGdKiqFkyrfOsv4W
        ZtUKh3T3ptHZSKF/B2zD1t7PusHXu5w=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-E2jkobZHNs6X91KkeaQ8jQ-1; Fri, 06 May 2022 03:08:38 -0400
X-MC-Unique: E2jkobZHNs6X91KkeaQ8jQ-1
Received: by mail-pg1-f198.google.com with SMTP id h9-20020a631209000000b0039cc31b22aeso3247121pgl.9
        for <linux-input@vger.kernel.org>; Fri, 06 May 2022 00:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AbrdpOEBVjCoR01UHnvqVEVcSNNH/918yczItPTviEY=;
        b=j/azCuoTyAl+x94JjbqR4XjXIa290eJZEJIpwdMEL+OTUjTXOZH9saZjN5YJH7lzGW
         AnnACtI7yxcyd+bFc0sAHBWdH0DUg+eGl9Qf/mnhQRXI6DOOxJfHV1V9PBdtOyVC8Hej
         4dn0ALUF9vSAMuBBUuq7kmqKWkXi/z51lO9HYpUsGt5mTV2WYVMEZYad6+XJ1EAeGhKH
         7fGwEmr2iFdqA6bwu87UhZEYAsHaicObJK3qSB7fOWf5edEiEZWP/kZvX0MdX5QCmsk7
         yi0/8ME3brQg5FlO+p8NKbr0YBg0PBZ6NWhCi+rlPQ39j4RfRTX5r/wHhSb1cC4hO3rL
         kJ6Q==
X-Gm-Message-State: AOAM532jXf51XXj05T5Rktd5uA/EKnUwRJXqBDj9U/51NDVtUyX/n2aw
        y7Q2KHFr3zVwEPaBLvwgkm3qsdAIHl51ZZdpdPUQVrAeVrXrOhGFVBtGfoIBNa7GJ7Qk8gOE7Fw
        rexCWQC5CWwKynum4FxTPoIFXcHuyjOGg42KJP2U=
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id h7-20020a056a00218700b0050cef4def3bmr2155535pfi.83.1651820917781;
        Fri, 06 May 2022 00:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcfj1Efeu70x95cGdjpQj/n14kfl3in4c/4CdgbzAjQfHFDtBiPIxpUV7zcqOR0d0KIuSqTRMMHRX5BmN8EaE=
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id
 h7-20020a056a00218700b0050cef4def3bmr2155516pfi.83.1651820917517; Fri, 06 May
 2022 00:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220419122632.2988786-1-acz@semihalf.com> <YmByPhFWkzpPrpYe@google.com>
 <CAB4aORXvVzD4YPC2RdA6pFzSSeLj2oqMpanbGziWkf99WSHGsQ@mail.gmail.com>
In-Reply-To: <CAB4aORXvVzD4YPC2RdA6pFzSSeLj2oqMpanbGziWkf99WSHGsQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 6 May 2022 09:08:26 +0200
Message-ID: <CAO-hwJKuDRQOWVyv5eudq8QF1yV=1C-HC0hR-AD5JDOQBw0reA@mail.gmail.com>
Subject: Re: [PATCH] HID: add HID device reset callback
To:     Angela Czubak <acz@semihalf.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 21, 2022 at 1:23 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Hi Dmitry,
>
> On Wed, Apr 20, 2022 at 10:51 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Angela,
> >
> > On Tue, Apr 19, 2022 at 12:26:32PM +0000, Angela Czubak wrote:
> > > @@ -529,6 +529,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
> > >               /* host or device initiated RESET completed */
> > >               if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
> > >                       wake_up(&ihid->wait);
> > > +             if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
> > > +                     ihid->hid->driver->reset(ihid->hid);
> >
> > I wonder if this would not be better to execute the reset callback
> > first, before signalling that the reset has completed instead of racing
> > with i2c_hid_hw_reset()?
> >
>
> I think it could result in a deadlock. If we don't clear
> I2C_HID_RESET_PENDING, and if it has been set, then reset_lock
> is still taken. This way, if the reset callback wants to send a report
> to the device, it will keep spinning on reset_lock
> in i2c_hid_output_raw_report().
> Since the reset callback will be most likely used to re-configure
> the device, we need to be able to send any report and not hang
> on reset_lock.
> Let me know if you think this not an issue or there is an additional
> comment needed in the patch so that the reasoning standing
> by the order of issuing the callback and clearing the bit is clear.

I think you are both correct, and that this patch thus needs some changes:
- first, I'd like to have one user at least of this reset callback in
a subsequent patch. Adding one callback without user is just adding
dead code
- then there are 2 types of reset that probably each need a special treatment:
  * host initiated resets: those are the ones "racing" with
i2c_hid_hwreset(), in a sense that this function call might also call
POWER_ON on some devices, which means we can not immediately do
transfers to the device with this current code
  * device initiated resets (when I2C_HID_RESET_PENDING is not set):
that code is fine in that case, because we have no other entry point
- there is a third type of resets happening: on probe and resume, so
maybe there we do not want to call this callback simply because we
already have probe and reset_resume callbacks.

Cheers,
Benjamin

>
> > Thanks.
> >
> > --
> > Dmitry
>

