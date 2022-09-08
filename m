Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0E25B152C
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 08:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbiIHGwY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 02:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiIHGwT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 02:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6162318369
        for <linux-input@vger.kernel.org>; Wed,  7 Sep 2022 23:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662619931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hsijMxTSad9+etIswpyvNlofc7rOPZg7qkz5qLNTm5U=;
        b=iCtWlpN7n78jcwwGckQMAL6gW0IEwnhSn4mMY2egP26mssNz5Myn7HTqZghPV97QMIRgn5
        gVG8Bfo3f1DH352ueEaUmhqncZUF4VANATKBbwrXtZQRSoSUI3UKDKI2F/GGnEPkaALmMR
        Poxv77vJil5C5H2E6NCkrMu0HdPsRtM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-2yoB0RSgMaWLuYhaT4TjDg-1; Thu, 08 Sep 2022 02:52:09 -0400
X-MC-Unique: 2yoB0RSgMaWLuYhaT4TjDg-1
Received: by mail-pf1-f197.google.com with SMTP id 14-20020a056a00072e00b0053689e4d0e5so8720458pfm.5
        for <linux-input@vger.kernel.org>; Wed, 07 Sep 2022 23:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hsijMxTSad9+etIswpyvNlofc7rOPZg7qkz5qLNTm5U=;
        b=4Yu1mBDPR9ZSn3Koj9gaEBjUtwm1W2SyYxdBB6Jkiss41nSClUvse/c8NYX0/k24qo
         lkKmWgrzjBwyfWsY/xtAxsJ93tZY/8knnjmlIvtyk/LzUDmGumcmN71S9tDoqYEVpHWC
         rH70tUKQLAgd/s28ow/o19b0jVDoqlAc+LUNGeiAmE1ocNUPXb0ILTmf1KF0tyfzsPwM
         kmcLCZM0Vj0iAIvmqK2k7TcxsAiJ3WBfLblzDf2E0TpF7K9waXyBpIArJJKAxVBpiyhY
         HpElw7Sxaf8uiGSyjeU+eAAACLCFTztHYIGTaaLECt0Sw89ECfWzya4WKNiy2C+L+oW9
         yEMQ==
X-Gm-Message-State: ACgBeo2SM4VXsyh8FgnRWMFKLE/0C/aF9qvmWm8hGwrKJRg8Lqh/Iqeq
        RMrhH8n3b2oVRipKKOZB6DmvR6qtmspzRLR7V7fxLOZJTRi7Ebf1Y4Lluy3Y7ulN6PMxgGPjTpe
        UQupkEXXiGdt0+ZFcSLVQyS6AZ73USvql00Mi54A=
X-Received: by 2002:a17:903:120c:b0:172:728a:3b24 with SMTP id l12-20020a170903120c00b00172728a3b24mr7284534plh.61.1662619928445;
        Wed, 07 Sep 2022 23:52:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4HjG9eauKPMtAdqBVzAeY9G0t626mqYn6+lAMqJFuESU6xLOUh649xA+CLbMXfFvNlCtFJSoUmtmssd7c2IT8=
X-Received: by 2002:a17:903:120c:b0:172:728a:3b24 with SMTP id
 l12-20020a170903120c00b00172728a3b24mr7284515plh.61.1662619928200; Wed, 07
 Sep 2022 23:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220825222420.6833-1-nate@yocom.org> <20220825222420.6833-3-nate@yocom.org>
 <3e48ef8d13337ce1c3ec68baffc612fde4740b0e.camel@hadess.net>
 <Yw0OjoVzKV3QOYah@ghaven-kernel> <661ee8227c96aeba7aae9fff6ac9a73f1d81e765.camel@hadess.net>
 <Yxl/YxSRtV9Hv271@google.com>
In-Reply-To: <Yxl/YxSRtV9Hv271@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 8 Sep 2022 08:51:57 +0200
Message-ID: <CAO-hwJLYSG=AT0CyputHBWNexV3NtFpvfu=jM2Fp60=3s4wauQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] Input: joystick: xpad: Add ABS_PROFILE axis value
 to uapi
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, Nate Yocom <nate@yocom.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 8, 2022 at 7:36 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Sep 07, 2022 at 05:41:08PM +0200, Bastien Nocera wrote:
> > On Mon, 2022-08-29 at 12:07 -0700, Nate Yocom wrote:
> > > On Sat, Aug 27, 2022 at 12:40:46PM +0200, Bastien Nocera wrote:
> > > > On Thu, 2022-08-25 at 15:24 -0700, Nate Yocom wrote:
> > > > > Add an ABS_PROFILE axis for input devices which need it, e.g. X-
> > > > > Box
> > > > > Adaptive Controller and X-Box Elite 2.
> > > > > ---
> > > > >  include/uapi/linux/input-event-codes.h | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/include/uapi/linux/input-event-codes.h
> > > > > b/include/uapi/linux/input-event-codes.h
> > > > > index dff8e7f17074..7ad931a32970 100644
> > > > > --- a/include/uapi/linux/input-event-codes.h
> > > > > +++ b/include/uapi/linux/input-event-codes.h
> > > > > @@ -862,6 +862,7 @@
> > > > >  #define ABS_TOOL_WIDTH         0x1c
> > > > >
> > > > >  #define ABS_VOLUME             0x20
> > > > > +#define ABS_PROFILE            0x21
> > > > >
> > > > >  #define ABS_MISC               0x28
> > > > >
> > > >
> > > >
> > > > You probably also want to add it to the absolutes array in
> > > > drivers/hid/hid-debug.c.
> > >
> > > doh, roger.
> > >
> > > > Again, you might want to wait for confirmation from Dmitry that
> > > > this is
> > > > the right way to do this for the profiles.
> > >
> > > Makes sense.  Dmitry?
> >
> > Dmitry, could you please confirm whether ABS_PROFILE definition is
> > correct?
>
> Yes, I think this makes sense. Do we have a buy in from userspace folks
> (Peter H, etc) for this?

AFAICT, libinput wouldn't use that new axis, simply because it doesn't
care about game controllers.
So it all comes down to game users to validate this (and probably only
android is now the main consumer of these given that SDL and Steam are
directly using hidraw or libusb to talk to controllers).

Cheers,
Benjamin

>
> I'd like some documentation added to Documentation/input/event-codes.rst
> and potentially to Documentation/input/gamepad.rst even though profile
> does not have to be gamepad specific event.
>
> Thanks.
>
> --
> Dmitry
>

