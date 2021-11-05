Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF2446ABA
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 22:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbhKEV6C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 17:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhKEV6B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 17:58:01 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01E1C061570;
        Fri,  5 Nov 2021 14:55:21 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso4293114pjb.0;
        Fri, 05 Nov 2021 14:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wf2WN6HefyrQHqdRn636Wu8eKmnAVoIwGYs4XKC3BQM=;
        b=PJhw8aPharqWHsNZA8yx57zgLyk6c0QBjlqA+wDpzzboGwa/015LQDWC4cIX4lq1O0
         EseHzlGQGS3omtuqyQLE4lffWEMw15D2VjV433siRhAoCTjm4LHn58tjg3yEk6Ov1vYu
         65pOEPeDByBDWS/DC/6HnsHxaHvwtLrI5eNfJS/4V0teWtryo1t7kjK8d/YUNfL0Txws
         LgOuesffDxRrsxh1ZeqAnMLQeL/7tlZswQnKcjF4+Op03GJ2oqAoe08Cn0g6mUB5u9EA
         gfbOt/UwEV54LXSonkJwZS5962AXoh5pLBQN3vjgar5Ad5yEJBd2tR1J9ff6f71aS5O5
         EyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wf2WN6HefyrQHqdRn636Wu8eKmnAVoIwGYs4XKC3BQM=;
        b=ARMjlBChmkkMkdrDMqnO3wg/e9wQny2KV18N34nIOYh+kjThHUlTbmL7/HnZxGuUz+
         Bo1tG65uaImNA7zvx1hg38zv47YJIOMimNi9eANMmRoD7c+6W+YhFt/qWL6qI5Nm245n
         z9IB+bSSo/n+e8ukTXdhyMBIVt0Hc5M+PGxt7ZFu63c1aSLYPfmLxWJMGv5FPpmzXNWZ
         fOO2/NIGtXMX8ggDlDSJZ7Kf8iW06WEB2Jz3H/CWuquhjt63g3MjIVjhKfi5p2iflY9n
         iD1EAeLNlR6Hjp9HyTXVOosyKzKsnbjdhTgNOA2XJVtvVA8t5MWbFt3xjhQEQ113FOkT
         iJZg==
X-Gm-Message-State: AOAM530u0YHEElzp856NKwCyikxnoo1kDImyMoFoYAlH+lytrtFoNA7l
        SWv9Buq9D7X5UgvFY6JviUMXyfUCA64=
X-Google-Smtp-Source: ABdhPJyvEVDayFk+vPCzjUHsHcuf6MEgKgxATPpaQAApueGCwZ/8Ir1HEITf71+SO44KMNZWHR0pyA==
X-Received: by 2002:a17:90a:3045:: with SMTP id q5mr33202996pjl.58.1636149321037;
        Fri, 05 Nov 2021 14:55:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:837c:e765:475f:22d3])
        by smtp.gmail.com with ESMTPSA id w13sm6696589pgm.3.2021.11.05.14.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 14:55:19 -0700 (PDT)
Date:   Fri, 5 Nov 2021 14:55:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?iso-8859-1?Q?Vin=EDcius?= Reis <itsme.vreis@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, angiolucci@gmail.com
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to
 KEY_SCREENLOCK
Message-ID: <YYWoRW9NRC58zQ9w@google.com>
References: <20211008222327.9324-1-angiolucci@gmail.com>
 <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
 <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 05, 2021 at 12:16:45PM -0300, Vinícius Reis wrote:
> Em qui., 28 de out. de 2021 às 13:07, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> escreveu:
> >
> > Hi Vinícius,
> >
> > On Fri, Oct 8, 2021 at 3:24 PM Vinícius Angiolucci Reis
> > <itsme.vreis@gmail.com> wrote:
> > >
> > > On Windows systems, ASUS laptops uses the "turn display off" key
> > > (usually fn+f6) to turn both display and keyboard backlit off. On Linux
> > > systems, this key has no effect at all since most desktop enviroments
> > > don't deal with KEY_DISPLAY_OFF. By mapping it to KEY_SCREENLOCK
> > > instead, would enable desktop environments to handle this key as a
> > > screen lock intent from the user, out of the box.
> >
> > But is it the intent of the user? The fact that current desktop
> > environments do not handle this key is not a reason to change kernel
> > behavior.
> >
> > If screen lock is simply your preference then you can change the
> > mapping via udev on your system without the need to patch the kernel.
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> (Sorry, I'm sending this response again because it seems the first
> attempt didn't make it to the mailing lists for some reason.)
> 
> Hi Dmitry,
> 
> I've picked up this particular key event because it would trigger a close
> behavior to the one seen on Windows. It is far from being my preference,
> which would be an exact mimic of the Windows behavior (and can be
> achieved by xset dpms force on/off from user space).
> 
> The idea of this patch is to improve the user experience, by giving that key a
> behavior as close as possible to what users might experience on Windows.
> Because most Linux desktop environments also turn the display off after
> locking the screen, this would be a good approximation to what happens on
> Windows. I think it is more about giving (consistent) behavior to it
> than changing it.
> 
> I agree it is possible to control that via udev or something else. But
> most regular
> users won't be able to do that, ending up with an unused key, though.
> The hardcore user that would prefer a very different key behavior
> could keep using
> udev to do that.
> 
> So IMHO I think that setting this up on the kernel would be a good
> approach in this case.

I am sorry, I disagree. I understand that patching the kernel might be
easier than implementing new shortcut/behavior in various desktop
environments, but that does not make it the right approach.

Thanks.

-- 
Dmitry
