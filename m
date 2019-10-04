Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EB6CC067
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 18:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfJDQWO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 12:22:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11015 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728666AbfJDQWO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 12:22:14 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C3B672D6E7C
        for <linux-input@vger.kernel.org>; Fri,  4 Oct 2019 16:22:13 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id 59so6971404qtc.5
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 09:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fji+Iqzc5wAEUxBW6qjiPUg88rRvJVL1xWDmoForx+4=;
        b=ohgIKOyk4iTTae0d7s0Tj0Y2MJFH+N4y/6wAf/FAc/EXvJNor9vr+8K/qygTT6AA0Z
         7FlNk75wPJgxgKR992E0qSYMgZ5L2jr50ojz63mGfomJsVzzqw1q6rNvXsa4KEyWe+ro
         NS4JqUKGMtpL3xl3/86XbDv1eK/eQuFGx/0qH9aP+yUaT1BVM7VFIrprGOnPkSI6+dWB
         duN1gjqZwByQHX7Kr+RnSSeT2wUyLYM4b8ws1H27R6aMvviBEf/z50Hpr7bYVB46D8Se
         UkdX6XwjQKSTVgRuCsqFX4S2vXCXoGTHg8ugwx2xDxQbIsPSSlJ66FtgSI6/Yj7aiFzv
         XhZA==
X-Gm-Message-State: APjAAAV0S7et1GwwzUbxfECJvtrNrXUen6KT7nvzkQNx28Opgf7+X0MF
        NlAO2vEavmkl010f49gBRbB8mydGZ4MTCXhUF8FFVOMKRKPVZSgX8eseaW4bFLVem/X9beugL1l
        gibKitnJpz41ku5gSTq7ZYdVIyeYS5NpcrQ7j320=
X-Received: by 2002:a05:620a:13d9:: with SMTP id g25mr10928209qkl.230.1570206133043;
        Fri, 04 Oct 2019 09:22:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsHW6YIwq8+b1SLeZ50CiWiV47adwRH7o/GVfIYFfGbZ+rGoV3eVJHeS9pGrkrMWomsHeJQt844MbbZVXBJlI=
X-Received: by 2002:a05:620a:13d9:: with SMTP id g25mr10928161qkl.230.1570206132757;
 Fri, 04 Oct 2019 09:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191004073715.6075-1-hdegoede@redhat.com> <CAO-hwJ+kGmQSJZTO=PHKO6kTpwV6GwkbCkCMTtYV4=LabkUTNQ@mail.gmail.com>
 <a4342ade-f5c6-f981-3957-8820937f89f2@redhat.com> <CAO-hwJ+_nQJgPqtWAhp==rR-k40ARf_-2GOOpFbzGziFSp_o6Q@mail.gmail.com>
In-Reply-To: <CAO-hwJ+_nQJgPqtWAhp==rR-k40ARf_-2GOOpFbzGziFSp_o6Q@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Oct 2019 12:22:01 -0400
Message-ID: <CAO-hwJKJY+_Wi73FGm51wd50qgLZAMTsfdn9K+nDvkcTrL9aTA@mail.gmail.com>
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

On Fri, Oct 4, 2019 at 11:01 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, Oct 4, 2019 at 8:05 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 10/4/19 1:30 PM, Benjamin Tissoires wrote:
> > > Hi Hans,
> > >
> > > On Fri, Oct 4, 2019 at 3:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > >>
> > >> Commit 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
> > >> makes the hid-lg15 kernel module, which gets configured through config
> > >> HID_LOGITECH depends on symbols from the led class. Add a depends on
> > >> LEDS_CLASS to HID_LOGITECH to avoid undefined reference errors on the
> > >> led class symbols.
> > >>
> > >> Fixes: 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
> > >> Reported-by: kbuild test robot <lkp@intel.com>
> > >> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > >> ---
> > >>   drivers/hid/Kconfig | 1 +
> > >>   1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > >> index 1ecb5124421c..494a39e74939 100644
> > >> --- a/drivers/hid/Kconfig
> > >> +++ b/drivers/hid/Kconfig
> > >> @@ -525,6 +525,7 @@ config HID_LENOVO
> > >>   config HID_LOGITECH
> > >>          tristate "Logitech devices"
> > >>          depends on HID
> > >> +       depends on LEDS_CLASS
> > >
> > > My CI failed with this patch. It seems this creates a loop in the
> > > dependencies and I can not create the config file. Also, it seems
> > > weird to have a depends on LEDS_CLASS when you surely wants to enable
> > > it. How about using SELECT instead?
> >
> > That is weird, there is a whole bunch of other HID_FOO config
> > symbols in drivers/hid/Kconfig which also have a depends on LEDS_CLASS,
> > so if this is a problem then it should be a problem for those other ones
> > too.
>
> Yeah, it seems it's my script that generates the config that is bugged...
>
> >
> > I do see that there are others which use select instead of depends
> > (yeah consistency) so I guess that changing to select is fine here...
> >
> > Please let me know how you want to proceed with this.
>
> I'll try to fix this and will push the depnds preferably or the
> selects if no other options is possible.

I just fixed my config script and pushed your patch on top of for-5.5/logitech.

Thanks!

Cheers,
Benjamin
