Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64DA94AEFE
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 02:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfFSAYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 20:24:51 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45550 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFSAYv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 20:24:51 -0400
Received: by mail-pg1-f196.google.com with SMTP id s21so8557878pga.12;
        Tue, 18 Jun 2019 17:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zDLMTb5z/e9f0x8VnHsDz9VTVurQ6LAQhprPL9htvWY=;
        b=Q2L2WLML3NKcjuNidH5ZnM0W0kM4YAeThnXPpLo3vsYM0/M4wGjWN7tUXctMv+1CtH
         X/IY0Do9I+QjFT5yktHLoQJSSU+HCjqNyMr5RZE9i6L6ttt/ZVzQcCw0ZuJ8AUq0WBzC
         dQN0J8Ab/hOKzPw9yQEFUe/p22coWvUyYh2afJtI2+10LYDDloEFX9fVZWXOEaIOSdCe
         hSXT1wY56IbRfJjMDKBv/RlBcpe2nC3hig1GcjBU5RA2J5bNxtd1D29e+0FgeYJjJCp+
         S6UY6Hj2I3WbZOp+YuKYNS3nJnvYXZu9hrXztBk1TYRgA5As5UGO2ff/Jm9yngqYoCyD
         teug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zDLMTb5z/e9f0x8VnHsDz9VTVurQ6LAQhprPL9htvWY=;
        b=ov4jwBFJ21y5dPXvAawJKhf56gSf5E2r4FBjMx9s+Gf4SW0nNiA3vP47FkUlsC+Dul
         h1pAKY55wpmF+/jtGcJPo4AiLGx3aGXFA2w3Och63rgAMm3zjH5rJhMU5sjOmBtMbR6q
         bIbes4as4az2MjIHw6l0AJMSk3UBRKEWNqW8s1NopdoUCI73Rw8/QVE0JJKugxprmySs
         tKLHj2WfbXvSV0/yNCIqiCvr9EVkXqc4KusRSDgRQVGtLAB3lVG16Dt1L+//48NSMd84
         7SO2sfPBss8YLN/AX6+Nf+M6EAW568kSaXN/8nhwxApfCcLNGLxnAUTtFuyZxIbQ73Gx
         RT1A==
X-Gm-Message-State: APjAAAXPJphbK/xKjmNaenFOApg4q64lpnugtmo7pl2awlfpM6GJ7DQ+
        okQhKGT1XMtKFpypPD+00Gk=
X-Google-Smtp-Source: APXvYqy8AHrt4C4bYMxtDDbVT47euN+9eQ3OCORRiIWM/rgAYj/gO8ibtloD1WDG2ASF8CFwHN6f6g==
X-Received: by 2002:aa7:8a95:: with SMTP id a21mr123909077pfc.215.1560903890387;
        Tue, 18 Jun 2019 17:24:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x3sm482722pja.4.2019.06.18.17.24.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 17:24:49 -0700 (PDT)
Date:   Tue, 18 Jun 2019 17:24:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tim Schumacher <timschumi@gmx.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/20] Input: iforce - remove "being used" silliness
Message-ID: <20190619002448.GC62571@dtor-ws>
References: <20180918004732.9875-1-dmitry.torokhov@gmail.com>
 <0541f46d-1f4f-05f4-8e93-6663f6c13bd9@gmx.de>
 <20180919171039.GA116719@dtor-ws>
 <3505434a-f5ec-de50-5f94-7347c6926f40@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3505434a-f5ec-de50-5f94-7347c6926f40@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 12, 2019 at 04:44:00PM +0200, Tim Schumacher wrote:
> On 19.09.18 19:10, Dmitry Torokhov wrote:
> > On Wed, Sep 19, 2018 at 04:51:26PM +0200, Tim Schumacher wrote:
> >> On 18.09.18 02:47, Dmitry Torokhov wrote:
> >>> The kernel is supposed to handle multiple devices, static flags
> >>> in packet handling code will never work.
> >>>
> >>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> ---
> >>>
> >>> This is a random assortment of iforce patches that I made a few weeks back.
> >>>
> >>> Tim, I do not have hardware, so I was bound to screw it up, but if you
> >>> have some time I'd appreciate if you try them out (and if I indeed broke
> >>> things if you could identify issues that would be even more awesome).
> >>>
> >>> Thanks!
> >>>
> >> Hello Dmitry,
> >>
> >> I tested those patches and I didn't find any obvious issues. The basic functions
> >> do work (i.e. buttons and axes, don't have a HAT so I can't test that), force
> >> feedback seems to work to the extent it was before (I only have fftest though,
> >> no games that support force feedback). I'll go through a few more applications
> >> and see if anything not obvious is broken.
> >>
> >
> > Thank you for taking a look.
> >
> >> Unfortunately, I only have that one wheel and I can only test USB connections
> >> at the moment (unless I find a proper serial adaptor, but I'm not sure if that
> >> would even work).
> >>
> >> Are those patches planned to go into 4.19 or are they intended to be merged in
> >> the next development cycle?
> >
> > Definitely not 4.19. Could be 4.20 or 4.21...
> >
> > Thanks.
> >
> 
> Hello Dmitry,
> 
> as a followup to the last E-Mail I sent about this topic, the complete chain
> of patches has been in my personal tree since September of 2018 and there
> have been no issues so far as well. I tested a few more games and utilities,
> and I was able to test with multiple wheels simultaneously as well.
> 
> In the end it's still your decision, but imo those patches should be fine

Thank you Tim, I'll put your name down as Tested-by then.

-- 
Dmitry
