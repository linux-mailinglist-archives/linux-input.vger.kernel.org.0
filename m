Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F8F33FCF3
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 02:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhCRB6n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Mar 2021 21:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhCRB6V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Mar 2021 21:58:21 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17C9C06174A
        for <linux-input@vger.kernel.org>; Wed, 17 Mar 2021 18:58:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso2286294pjb.3
        for <linux-input@vger.kernel.org>; Wed, 17 Mar 2021 18:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l/Ov/hfl3hGPrraA8M6pnauba1uS39CLBSUPqEGoRE8=;
        b=lD4Sc+W+PDdwVhlGo94tpkcsYOZWInxfnrL5VXOXgiondpyuUE9/Fc18SwNnvcehHu
         3eVm+M7NYSJBilisV9bR0e4xPovECDolERWVdjQN5e7Q00gPg9jK1Okp32cit/VIFO/S
         9w2NO5O2ur8KeeI/HRtwB/rdDCe98aHNsflHAl/oldKYdYyfwZpQyxsEgHz/3sTsUubg
         +dEilMsgxvdmutHbDkzfkOqpmFTPkAQinnFUpCcSRqCaZXvq71KmABBUvYgTWwupeUpt
         TtCmkaRab9/wsPb7mmw71A0AN+3FUJDVPA0zQmfVWDgEWzsBxvJE0429g7SHOSEnb1jc
         nGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l/Ov/hfl3hGPrraA8M6pnauba1uS39CLBSUPqEGoRE8=;
        b=FJ6f3cHb0kJGqNnF8p0a5QiDXzLkaeINn3PaJQ4e2HbNrDVMlEcWXo8AKZD0Xxq9zH
         knlOj+c3sdF37/s7S+XKgTyN1x7b0r9zOlrfo59+FJ9efLRKykvvTY94a4GdmgYPEZ9x
         ZrDrE2Mj2ASs50WaHmbNvV/syT/gzAtmgUdMOaEsCZcR5lvgY1eGM1sGvKz07rgcPODq
         pczbn2Im++zsnR4wHiAiPn14fSzp0q7XpZ+ULyDp13Cs/qI4TtVSbvOeuU/4O5fhh7IC
         GqAtDpUExvOr7SmVbnxH5kgZbFpp2F79bGg+C3c2iKIGibIRtJiVbjOsenna8joq20tb
         Ct1Q==
X-Gm-Message-State: AOAM530cfIJdfylsTCXT1zGkcz7sjTwGACMoCYY7vXg8OTu+/VAiXY8n
        FoW9iRiucMYzlfnFtgvXyGgxffgHu44=
X-Google-Smtp-Source: ABdhPJzEp3vHp/EAArNHUAFwhbKk/GVqi1imkPwjRrsLCzVJVeIy6VQkK9h0OrRjIXRSPuI1PIBNdQ==
X-Received: by 2002:a17:902:c952:b029:e4:89ad:fae2 with SMTP id i18-20020a170902c952b02900e489adfae2mr7357823pla.14.1616032700434;
        Wed, 17 Mar 2021 18:58:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:60d3:f9fb:39d9:9088])
        by smtp.gmail.com with ESMTPSA id v2sm318071pjg.34.2021.03.17.18.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 18:58:19 -0700 (PDT)
Date:   Wed, 17 Mar 2021 18:58:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhai Zhaoxuan <kxuanobj@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, Markus Rechberger <kontakt@sundtek.de>
Subject: Re: [BUG]an input device can not support more than 568 keys due to
 uevent buffer too small
Message-ID: <YFKzuP2Phh1RRQ8V@google.com>
References: <CAAnY7J2yYdsLMG=07u6QPf5SKN6ba=D+v=SE1vSMxWgP4A05pQ@mail.gmail.com>
 <YEy5Ki/lF2cbQxCH@kroah.com>
 <CAAnY7J3KDb094ZDZ7QEUQ9biUBBSVr=ru0x7cWPSGsCi-=9quw@mail.gmail.com>
 <YE8M+/LZPDOrOCPh@kroah.com>
 <CAAnY7J3YQDe1=OR0U66UnS8JE4ALfV9CzugazwAYa7c4TX6F=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAnY7J3YQDe1=OR0U66UnS8JE4ALfV9CzugazwAYa7c4TX6F=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Zhai,

On Mon, Mar 15, 2021 at 07:58:58PM +0800, Zhai Zhaoxuan wrote:
> 
> In the real world, I think, it is nearly impossible that a physical
> device contains so many keys or buttons.
> 
> But I think a virtual device may need this. Such as a server remote
> management card, it simulates a virtual keyboard,
> registers keys and forwards all keys from user's computer to server.
> And the user's computer may have any keys. So the card needs to
> register all possible keys and send them to the kernel.

I believe the best approach is to forward input devices to the remote
system one by one, exactly as they are on the local end, instead of
trying to crate a frankenstein monster out of them. You will not be able
to do that in a meaningful way anyway, as for example a touchscreen
needs to be handled differently from a touchpad, and if you smash them
all together into one composite device you will get a mess on your
hands.

> 
> I have tried to register only all **known** keys instead of all keys,
> but it still fails on the kernel.
> (The userspace source file has been placed in attachment.)
> 
> > What functionality does it allow that we do not have today?
> 
> If programs are unable to register all known keys on only 1 uinput
> device, programs have to register
> keys on two or more devices. But this may result in unexpected behavior.
> 
> For example, the program registers Key A on device1, and registers Key
> B on device2.
> When the program needs to send a key combination A+B to a target
> application, it has to:
>      1. emit Key A down on device 1
>      2. emit Key B down on device 2
>      3. SYN_REPORT on device 1
>      4. SYN_REPORT on device 2
>      5. emit Key A up on device 1
>      6. emit Key B up on device 2
>      7. SYN_REPORT on device 1
>      8. SYN_REPORT on device 2
> 
> Then, the target application polls input events on both devices 1 & 2.
> It reads on device 1, and gets Key A pressed down and then released,
> so it does feature A.
> Then, it reads on device 2, and gets Key B pressed down and then
> released, so it does feature B.
> Finally, the target application loses the A+B key combination.

Which is exactly what would happen in a real life with 2 hardware
devices.

Thanks.

-- 
Dmitry
