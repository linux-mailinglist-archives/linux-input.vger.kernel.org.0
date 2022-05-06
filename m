Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C422B51D1C6
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 08:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386782AbiEFHDP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 03:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242356AbiEFHDO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 03:03:14 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2443766AF8
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 23:59:32 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2f7d19cac0bso71360087b3.13
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kzORQUoyvRJQUvEdHNt7Jz6jSvGnKB7mZMfhZt5H3o=;
        b=GlKJmMC8oKZx/RZTGXjAAP8WVGCLtNF/9pSYFNxfpjPL2IdmMXW95ymEoZyGltxNMc
         +OiVG7tIeIxkCahzkgKEupIZxU+HFHkcsPjNyAwmO7Ey2wRcdlrkSGL93LCafRaZHogz
         qIA9VJ6Nl214IojtsearqVk3iJIEfUQrTgE1zThPUI3oS/yZZ83ajLxRSNkmBb/85QQi
         wZ9V603Mo00szqVvhsG7qwqWXeynPrsSh6XZ4pVRhvR2pZJq+914Za2oOSVB+FfhSO33
         o8kMcYIoXNk9PA/XwQacyQVZUa3A6gYoWpbW+7AZx1rbc3McRQEheeJK3Ypw21bRfQa2
         qVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kzORQUoyvRJQUvEdHNt7Jz6jSvGnKB7mZMfhZt5H3o=;
        b=0giuwcYkybflLrskVAUJZQy+ZExIsEjhfBcKD/sdzaV2xLuzx3MdHiqoWbNIeLGx9W
         k7ahO3u6tDSIIW2a0bgJvlwIUYjbNV2mjzok23sKx0QgrGJfCUSEg++w/uT+/axte1Rk
         zLQ275TaEnX5tA/f0E8iewTFvLBMDYF6KtuiL3YjO55umrlzuUlk7YVEgrB6B8hCQywT
         GB/bhG1oVnOCWcoZ6LI/dogal/78GUSGAKUlToAai7R93R+8klqloVnd+xLOA8LJByEP
         1GgKypEc7V1PrHCpRtf1jf0gQdQSAz0qbNHckJz9QBcUU6Sbl9dmrJB0u7Zhp0rbpdwt
         g/7g==
X-Gm-Message-State: AOAM5314hqhH7oUFpFk97ZUwa6SHZFcbo1z4vd6bckwWW46lQquZDnd4
        eyCOGv8kREgIzKQFyPSZS2cmSawMOw7U6+TmxWEbyVui
X-Google-Smtp-Source: ABdhPJwuezhKwZmyQnyOd63a6zgf8DgJs4cb6nkb8PvWD0qufE5EEMFDAi7xwV0Q33G/8FOnoHKGyndjPC/wbnwXoN0=
X-Received: by 2002:a81:2f8a:0:b0:2fb:5:acfd with SMTP id v132-20020a812f8a000000b002fb0005acfdmr1417941ywv.481.1651820371416;
 Thu, 05 May 2022 23:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
 <YnQBkd5V3lmC9cGr@google.com>
In-Reply-To: <YnQBkd5V3lmC9cGr@google.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 5 May 2022 23:59:20 -0700
Message-ID: <CAEc3jaA=nYGSZP2i0g-F_3uhx71t1Ut4PCotNokFPj-Ru1OH_w@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Vicki Pfau <vi@endrift.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 5, 2022 at 12:47 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, May 05, 2022 at 10:50:24AM +0200, Benjamin Tissoires wrote:
> > Hi Vicki,
> >
> > On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> > >
> > > This allows the touchpad input_dev to be removed and have the driver remain
> > > functional without its presence. This will be used to allow the touchpad to
> > > be disabled, e.g. by a module parameter.
> >
> > Thanks for the contribution.
> > I'd like to hear from Roderick, but I have a general comment here:
> > We had Wii and Steam controllers following this logic. Now we are
> > adding Sony PS ones... That seems like a lot of duplication, and I
> > wonder if we should not have something more generic.
>

Using this to hook into the thread with Benjamin. It didn't make it to
the list (due to HTML I guess) and replying from work email messes
things up (Outlook...).

There is definitely a need for some type of hidraw / evdev interop.
What it should be I'm not fully sure. I think it needs to be some
explicit request or something from user space.

In case of the Dualsense it is a very complicated device and many
features work through HID including many audio and other features,
which I hope to support at some point. I feel the need for the driver
to be able to 'snoop' what is going through hidraw. The extra node
hack allowed for that, though ideally if a hid driver could get some
callbacks without having to go through all this extra setup code,
would be great.

For me the use cases for snooping include:
- Keep sysfs nodes in sync e.g. LED nodes with whatever a hidraw user
is setting.
- Error handling in case of a crashing hidraw client. E.g. a hidraw
client may enable rumble. If the application crashes, we probably want
the kernel driver to disable rumbling.
- Handling of audio features (speaker, microphone, headphone jack
settings, ...). One day we will provide a proper audio driver over
HID. Many of the control features work over the same HID output report
as used for rumble, LEDs etcetera.
- When no users (hidraw / evdev) are connected, potentially enable
some of the power management features (e.g. disable touchpad / sensors
at the hardware level)

There are probably some others as well.

Thanks,
Roderick
