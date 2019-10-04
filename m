Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C20ECBE6C
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 17:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389210AbfJDPBr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 11:01:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40610 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389131AbfJDPBq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 11:01:46 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 92F4291761
        for <linux-input@vger.kernel.org>; Fri,  4 Oct 2019 15:01:46 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id f15so6726342qth.6
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 08:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PihxWe7ZSqU2vmEmqDljruyeyzMfdPKypZbLtLMcJg4=;
        b=JVGZJ0VNXx4DeteA9hZltGCEgRXVKl4xLw+T/6QBEt+9rC99TJ+tKkclAAkTKGuaN0
         BCPWVvNEZawz/i0X9873am2mxEGDX8XWKUCrZRXeaNmIK0VCw5lirNDD6B7QqXlxbeD7
         SfjlT06J5bdVsuRoi9IkwXFOgyxcE8op26NS8WKi/eAfchtfIIAZ/fYKZCNVe4nam5Xu
         QkxKn0ujQ1lv/p4bF+vbGXslEqCRiH9QbXNpy9qhLCbUMHs9oxfB7swEu+JGDNaUR7Vk
         y0imA7IN0N43+Ek4izMcbeeec/3cJf7qvp9sblx5g4V5Al963BGhGSC0udPi2ORhZSaT
         DuEQ==
X-Gm-Message-State: APjAAAXwhC5Y1QEZQPBE7DcL+0AJh0+G8Z+jd7lWRU8ApDREaO4NgyR/
        4qk0vABcBKwfzVRqV/uqG1WzZltaQfEFPFnOntfEM3a5fy/B9JnLU8AO+fOC8R6lSK/SbTBn79d
        2T6glU5XNs9d3nSKDEKfEPOfcvTulsbk+/dmtFYE=
X-Received: by 2002:ac8:1a45:: with SMTP id q5mr16236856qtk.345.1570201305867;
        Fri, 04 Oct 2019 08:01:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwiJF+4H8+qfJSDxsB0UVE/ONR5SDa8aI5t/r4XP14tNw4u37sRhUsIA6EZc5atyXAt5SrmCx4/DWm3ljy7XII=
X-Received: by 2002:ac8:1a45:: with SMTP id q5mr16236825qtk.345.1570201305572;
 Fri, 04 Oct 2019 08:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191004073715.6075-1-hdegoede@redhat.com> <CAO-hwJ+kGmQSJZTO=PHKO6kTpwV6GwkbCkCMTtYV4=LabkUTNQ@mail.gmail.com>
 <a4342ade-f5c6-f981-3957-8820937f89f2@redhat.com>
In-Reply-To: <a4342ade-f5c6-f981-3957-8820937f89f2@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Oct 2019 11:01:33 -0400
Message-ID: <CAO-hwJ+_nQJgPqtWAhp==rR-k40ARf_-2GOOpFbzGziFSp_o6Q@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech: Add depends on LEDS_CLASS to Logitech
 Kconfig entry
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 4, 2019 at 8:05 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 10/4/19 1:30 PM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > On Fri, Oct 4, 2019 at 3:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Commit 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
> >> makes the hid-lg15 kernel module, which gets configured through config
> >> HID_LOGITECH depends on symbols from the led class. Add a depends on
> >> LEDS_CLASS to HID_LOGITECH to avoid undefined reference errors on the
> >> led class symbols.
> >>
> >> Fixes: 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/hid/Kconfig | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> >> index 1ecb5124421c..494a39e74939 100644
> >> --- a/drivers/hid/Kconfig
> >> +++ b/drivers/hid/Kconfig
> >> @@ -525,6 +525,7 @@ config HID_LENOVO
> >>   config HID_LOGITECH
> >>          tristate "Logitech devices"
> >>          depends on HID
> >> +       depends on LEDS_CLASS
> >
> > My CI failed with this patch. It seems this creates a loop in the
> > dependencies and I can not create the config file. Also, it seems
> > weird to have a depends on LEDS_CLASS when you surely wants to enable
> > it. How about using SELECT instead?
>
> That is weird, there is a whole bunch of other HID_FOO config
> symbols in drivers/hid/Kconfig which also have a depends on LEDS_CLASS,
> so if this is a problem then it should be a problem for those other ones
> too.

Yeah, it seems it's my script that generates the config that is bugged...

>
> I do see that there are others which use select instead of depends
> (yeah consistency) so I guess that changing to select is fine here...
>
> Please let me know how you want to proceed with this.

I'll try to fix this and will push the depnds preferably or the
selects if no other options is possible.

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
