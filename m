Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267E415CF5C
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 02:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgBNBIg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 20:08:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43123 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgBNBIg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 20:08:36 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so3981357pfh.10;
        Thu, 13 Feb 2020 17:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+5/gdogPoTT+Pz8V5rRHhUt1xE5pml79Vl2iDdJYL7s=;
        b=N9p8xewaiVZqtun97pzToeyCXO3JTy1f6stuKFn8t4lsXGSa2CHwubvoK79qJr4MKd
         Cy0r+RyAzhd1wQAuVSXs1Ft/Y1+Kiwj1lmBdPcEBPR2mmCywwlm2h6Rg0TAdWGipXvGY
         f4WgYAG0mFu9r81ioQ/0nvNiNxlYm6mj6vdB7bvDs/EtRwa+khjaBacDjJhAHfdODovV
         YYzwp9GEwJAwpxUhsavYj5+yaXW3joNO5XS2LlmNVDri9FbBTBVIHONCzWkNMGPiZizC
         akw1f6K7zn4K8ZNj0gU+O4fgCmO0vSq/3nmb82nrdDiIhEdem00yNrvjQCvEUlD+rhtt
         hYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+5/gdogPoTT+Pz8V5rRHhUt1xE5pml79Vl2iDdJYL7s=;
        b=kh0dvR0HPkMPwF40Eff90v+JpNnU82jZl4P8eta8s3fCaYr9L0u6vxPTqZnXKTrwCy
         OcgWyI8/eINXhWdum002LjPBcYxyo63B9EDKrAQDL3TbXhOKZ/o92P/NiNM9eu9tQhFO
         ZNHgrxkrlNtpM3GuzNf18o4PsJQS+x0hkhSukwmT1yD8xJmkSJhVzPDK6mcCt1gZaaFm
         Ajg/PyAQzJ6KFJelB/2FszeXNij5PX/JF2Eh4cN+AyKfyqyUetytGiZLxtQL7/8S/Qpi
         lZyQ2P8A95JnLWwN46gtc5DV/OLckLE3Lal4qb4u8uxkFgzd+Vv5brUbKo4S93U3BSQW
         c2PQ==
X-Gm-Message-State: APjAAAVkhsyYtH8/xjGJDiEUCEztjmNixAQ6iL1rudkYhnv01cBVAmKs
        bO1gtQjBaCNta8hVQQHMWb8=
X-Google-Smtp-Source: APXvYqwtplA8tGyB6aIIHOA7JaRfj3JsTjhdzewHWggEe+LOAfGBihMGinV4AXNoNcSgPRydMXXS/g==
X-Received: by 2002:a63:2010:: with SMTP id g16mr772627pgg.314.1581642514488;
        Thu, 13 Feb 2020 17:08:34 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i68sm4595662pfe.173.2020.02.13.17.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 17:08:33 -0800 (PST)
Date:   Thu, 13 Feb 2020 17:08:32 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: synaptics - remove the LEN0049 dmi id from
 topbuttonpad list
Message-ID: <20200214010832.GE183709@dtor-ws>
References: <20200115013023.9710-1-benjamin.tissoires@redhat.com>
 <CAO-hwJK38mpMp0yL1v+4KAhhuUuwAPrTm7kSTGhXPL2JC1F-6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJK38mpMp0yL1v+4KAhhuUuwAPrTm7kSTGhXPL2JC1F-6w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 12, 2020 at 09:53:25AM +0100, Benjamin Tissoires wrote:
> On Wed, Jan 15, 2020 at 2:30 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > The Yoga 11e is using LEN0049, but it doesn't have a trackstick.
> >
> > Thus, there is no need to create a software top buttons row.
> >
> > However, it seems that the device works under SMBus, so keep it as part
> > of the smbus_pnp_ids.
> >
> >
> > Link: https://gitlab.freedesktop.org/libinput/libinput/issues/414
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > --
> >
> > Hi Dmitry,
> >
> > Sending the patch to the list untested (sanity only), and I'll ask
> > for the reporter to provide a little bit more testing.
> >
> > I will keep you updated when you can merge the patch.
> 
> Hi Dmitry,
> 
> Sergej tested the patch last week and it works well. So I think we can
> merge it now.
> Maybe we should also add a stable@ tag here...

Tagged for stable, thank you Benjamin.

> 
> Cheers,
> Benjamin
> 
> >
> > Cheers,
> > Benjamin
> > ---
> >  drivers/input/mouse/synaptics.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> > index 1ae6f8bba9ae..7aa84f743c48 100644
> > --- a/drivers/input/mouse/synaptics.c
> > +++ b/drivers/input/mouse/synaptics.c
> > @@ -146,7 +146,6 @@ static const char * const topbuttonpad_pnp_ids[] = {
> >         "LEN0042", /* Yoga */
> >         "LEN0045",
> >         "LEN0047",
> > -       "LEN0049",
> >         "LEN2000", /* S540 */
> >         "LEN2001", /* Edge E431 */
> >         "LEN2002", /* Edge E531 */
> > @@ -166,6 +165,7 @@ static const char * const smbus_pnp_ids[] = {
> >         /* all of the topbuttonpad_pnp_ids are valid, we just add some extras */
> >         "LEN0048", /* X1 Carbon 3 */
> >         "LEN0046", /* X250 */
> > +       "LEN0049", /* Yoga 11e */
> >         "LEN004a", /* W541 */
> >         "LEN005b", /* P50 */
> >         "LEN005e", /* T560 */
> > --
> > 2.24.1
> >
> 

-- 
Dmitry
