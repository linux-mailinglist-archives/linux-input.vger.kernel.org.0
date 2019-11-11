Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F73FF7A9C
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2019 19:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKSRB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Nov 2019 13:17:01 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35674 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfKKSRB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Nov 2019 13:17:01 -0500
Received: by mail-pg1-f193.google.com with SMTP id q22so9955688pgk.2;
        Mon, 11 Nov 2019 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7qrMYDp0euCWEHyyqHK8bV17w/DIHCeBKekHUjn17T4=;
        b=rXEvMw45I/JV4/H3N9I2da1HxxfWVdb69nA3CP7MRU5StO2Z/Fn4V8R9/alJrSSXct
         0NwTBOAAzGy7wo/oAeU30Dc28bl+S6H53mX/d6Co3Wl3yu7IAnZO6J2fP5v3fZeVR1Ba
         7cox3eKiijlbQULuozzTpyM1HMsxCPKqaoNJ/CrX7H6a9mRjGtqMXUIgetZMU+pDF05v
         SpKBdqQEm3FbgLyIIt/5qaS15F0NbfnFraNdFScWa/8jLY8hn//q4cnUWprTqEJ2sn7S
         ebilAP9buoE5RASFEnZN8x9wRCn/zYPhE8lc6wbcXM2YWr43MDT/rUCzz6J4LAHSAZrW
         5IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7qrMYDp0euCWEHyyqHK8bV17w/DIHCeBKekHUjn17T4=;
        b=LareJ9MR0e5heE64ohjpOT8HVS14dMyHlQ2NpaHsKzEKNU116qvxDhpFJTXyyBWjlJ
         2Gz8SQhxceCqPqIgakbmbzJFzH7OQAt7wYkOTT+Sn63teYfxUyT8bJWiaD6VoPPzzQnV
         2mWNEwohV1TEW1B41W/pmpc8WNZFudQZYZ9ALiXopH/ZM6cDTG4TcixXl1+q+E4C7NZ6
         JGEMt2vGnZhXQWMi0Md3g8Py3+261uVvvHXO+E19lPJOaZEFUqGjTjeHBPj6s2Q2/hcW
         YTLLkOs2URUtKt0tVPb7draAyppZScKI9SAJunXiHJicZnVeMvtlfBVkIVuENGQ0Ar7i
         22lQ==
X-Gm-Message-State: APjAAAX3Yz5sGxX2GQFvbaAzB0pe/pUFkgxjrUIiokujEBrn0IlPZ6ya
        +212FQaWbRfQXCVlWA+JI5w=
X-Google-Smtp-Source: APXvYqwhnFvAu6IsJr9jM9/n5KGne3Y7fLlh/eE8r4P/1OANwdxwAXqq7GpqRzhw8IgW8du+uiOGJA==
X-Received: by 2002:a17:90a:1a56:: with SMTP id 22mr464568pjl.100.1573496220105;
        Mon, 11 Nov 2019 10:17:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b17sm17414895pfr.17.2019.11.11.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 10:16:59 -0800 (PST)
Date:   Mon, 11 Nov 2019 10:16:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Rob Herring <robh@kernel.org>, Marek Vasut <marex@denx.de>
Cc:     Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20191111181657.GA57214@dtor-ws>
References: <20191104070116.GM57214@dtor-ws>
 <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
 <20191104233621.GP57214@dtor-ws>
 <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 05, 2019 at 10:29:53AM -0500, Sven Van Asbroeck wrote:
> On Mon, Nov 4, 2019 at 6:36 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > OK, I refreshed the branch with fixes and a couple of new patches. It is
> > on top of 5.3 now. If this works for you guys I will be merging it for
> > 5.5.
> >
> 
> According to the ili2117a/2118a datasheet I have, there are still a
> few loose ends.
> Some of these might be too inconsequential to worry about.
> Dmitry, tell me which ones you think are important, if any,
> and I will spin a patch if you like. Or you can do it, just let me know.
> 
> >       { "ili210x", (long)&ili210x_chip },
> >       { "ili2117", (long)&ili211x_chip },
> >       { "ili251x", (long)&ili251x_chip },
> >
> >       { .compatible = "ilitek,ili210x", .data = &ili210x_chip },
> >       { .compatible = "ilitek,ili2117", .data = &ili211x_chip },
> >       { .compatible = "ilitek,ili251x", .data = &ili251x_chip },
> 
> My datasheet says ILI2117A/ILI2118A, so maybe the compatible string should
> really be "ilitek,ili211x", just like the other variants ?

We have not landed the DT for 2117, so we can either rename it as
"ilitek,ili211x" or have 2 separate compatibles.

Rob, do you have preference?

> 
> In addition, should we add ili2117/ili2118 in comments somewhere, so others
> can find this driver with a simple grep?
> 
> >       error = devm_device_add_group(dev, &ili210x_attr_group);
> >       if (error) {
> >               dev_err(dev, "Unable to create sysfs attributes, err: %d\n",
> >                       error);
> >               return error;
> >       }
> 
> The ili2117/ili2118 does not have a calibrate register, so this sysfs group
> is unsupported and perhaps may even be harmful if touched (?).
> 
> Perhaps add a flag to struct ili2xxx_chip ?


I guess we need is_visible() implementation for the attributes here and
yes, a flag to the chip structure.

> 
> >       input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
> >       input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);
> 
> The max position on ili2117/8 is 0xfff. The OS I'm using (Android) likes to know
> the correct min and max. So it can map touch coords to pixel coords.

What about the others? I doubt any of them actually support 64K
resolution and I expect everyone simply used device tree to specify
correct size.

Marek, you worked with other versions of this controller, what is your
experience?

> 
> Perhaps add this to struct ili2xxx_chip ?
> 
> >       /* Get firmware version */
> >       error = chip->read_reg(client, REG_FIRMWARE_VERSION,
> >                              &firmware, sizeof(firmware));
> 
> On ili2117/ili2118, the firmware version register is different (0x03), and
> the layout is different too:
> 
> byte    name
> 0       vendor id
> 1       reserved
> 2       firmware version upper
> 3       firmware version lower
> 4       reserved
> 5       reserved
> 6       reserved
> 7       reserved
> 
> But, does it even make sense to retrieve the firmware version? All it's used
> for is a dev_dbg log print, which under normal circumstances is a noop:
> 
> >       dev_dbg(dev,
> >               "ILI210x initialized (IRQ: %d), firmware version %d.%d.%d",
> >               client->irq, firmware.id, firmware.major, firmware.minor);

I'd be OK with simply dropping this.

Thanks.

-- 
Dmitry
