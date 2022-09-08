Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28EB75B24C8
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 19:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiIHRha (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 13:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiIHRhN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 13:37:13 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D9CEE513
        for <linux-input@vger.kernel.org>; Thu,  8 Sep 2022 10:37:01 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id iw17so11965412plb.0
        for <linux-input@vger.kernel.org>; Thu, 08 Sep 2022 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=yvwRDRcZM8L6JHil16m7teYV4wceQygldN8f81FISnM=;
        b=oPzs650E3cV1ZP7+ksTS6gxhzOPZ94wkyrb0zINZ+JEOAnbvatF3d37RMJojiNfYwr
         8gD4dVd0ry9JfFw4gC/qS2USvq4ov8VDqrLdYPjhH7tZQmP7xesDweaAaqptzIM+RiST
         xYu8+yW8lO7pn1LSYoJiHENKLCne05wlSebz7gpN4ReLd0BjejGw5ZjQs4MUliszaWJx
         I8k998gYnzD4eYZcpLwKYiYOuxdO4CjFEYKu5YHFkYoHkGy/jih/GS0HLc6OdO7cT1lh
         pFyMhsA9sTAV/KUfNxqqtRORJ5b6DWHUX0I5DgoFINPtGbg0fvASBhXfxrLEuG6Jhh1f
         rulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yvwRDRcZM8L6JHil16m7teYV4wceQygldN8f81FISnM=;
        b=z9TCBTcxOXA+FYxDhOAn9x/Iou9tUbo0x+JsvczWHx5I/kTiGDo3DO4wSlcHoNani5
         u3UiwRv7Y7NoAC4z8xCJucG9LqDKfnWkpkDzC55LBO6CritSVUQU/EjUdG23oORhMuS5
         QAmnsYsemiRdTug5OBxv8dnI/f3WEHgDQgx4WO3lvfmvB9rGQdOe930QF8W8ggeeInXh
         PATVgzmcrgoK0aJIf4Bh4AEimUrFd4r2Lray1dtOQBPbR5K/8dgmdhzabCeGWLSW2uru
         nqB3bir+2XV+HAQbZoZhVQHoocJ6+ZuoHZO3i+ZLvF+tf2raZgi3aUSBlIsg21G9gmfH
         GXaQ==
X-Gm-Message-State: ACgBeo3SublQVXujMQvziJKYkQgfuH+hLC6gtVKygGXvmbK0W1y/Llfs
        c/1xLs8khrq/FfL1ApLzNcEnXA==
X-Google-Smtp-Source: AA6agR6siBaUT5c0m6RQpirS/n3YWTGnxr4qv2KYpiH2Y+MBMZg9RpemhWAHvAn5XP9srZnA0NSn+w==
X-Received: by 2002:a17:90b:4a91:b0:202:59ed:94d5 with SMTP id lp17-20020a17090b4a9100b0020259ed94d5mr5102190pjb.213.1662658617954;
        Thu, 08 Sep 2022 10:36:57 -0700 (PDT)
Received: from ghaven-kernel ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id k3-20020a628403000000b0053e5b905843sm5149847pfd.203.2022.09.08.10.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:36:57 -0700 (PDT)
Date:   Thu, 8 Sep 2022 10:36:55 -0700
From:   Nate Yocom <nate@yocom.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH v5 2/4] Input: joystick: xpad: Add ABS_PROFILE axis value
 to uapi
Message-ID: <YxooNwOxeIXPKbBE@ghaven-kernel>
References: <20220825222420.6833-1-nate@yocom.org>
 <20220825222420.6833-3-nate@yocom.org>
 <3e48ef8d13337ce1c3ec68baffc612fde4740b0e.camel@hadess.net>
 <Yw0OjoVzKV3QOYah@ghaven-kernel>
 <661ee8227c96aeba7aae9fff6ac9a73f1d81e765.camel@hadess.net>
 <Yxl/YxSRtV9Hv271@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yxl/YxSRtV9Hv271@google.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 07, 2022 at 10:36:35PM -0700, Dmitry Torokhov wrote:
> On Wed, Sep 07, 2022 at 05:41:08PM +0200, Bastien Nocera wrote:
> > On Mon, 2022-08-29 at 12:07 -0700, Nate Yocom wrote:
> > > On Sat, Aug 27, 2022 at 12:40:46PM +0200, Bastien Nocera wrote:
> > > > On Thu, 2022-08-25 at 15:24 -0700, Nate Yocom wrote:
> > > > > Add an ABS_PROFILE axis for input devices which need it, e.g. X-
> > > > > Box
> > > > > Adaptive Controller and X-Box Elite 2.
> > > > > ---
> > > > >  include/uapi/linux/input-event-codes.h | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/include/uapi/linux/input-event-codes.h
> > > > > b/include/uapi/linux/input-event-codes.h
> > > > > index dff8e7f17074..7ad931a32970 100644
> > > > > --- a/include/uapi/linux/input-event-codes.h
> > > > > +++ b/include/uapi/linux/input-event-codes.h
> > > > > @@ -862,6 +862,7 @@
> > > > >  #define ABS_TOOL_WIDTH         0x1c
> > > > >  
> > > > >  #define ABS_VOLUME             0x20
> > > > > +#define ABS_PROFILE            0x21
> > > > >  
> > > > >  #define ABS_MISC               0x28
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
> > > Makes sense.  Dmitry?
> > 
> > Dmitry, could you please confirm whether ABS_PROFILE definition is
> > correct?
> 
> Yes, I think this makes sense. Do we have a buy in from userspace folks
> (Peter H, etc) for this?
> 
> I'd like some documentation added to Documentation/input/event-codes.rst
> and potentially to Documentation/input/gamepad.rst even though profile
> does not have to be gamepad specific event.
> 

Will do, v6 incoming shortly.
