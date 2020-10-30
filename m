Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EADB2A0CF3
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 19:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgJ3SAs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 14:00:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35645 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ3SAr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 14:00:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id n11so6345114ota.2;
        Fri, 30 Oct 2020 11:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lr4y4KoOe23xrjqNwW8I6PIt//Qb7SqS16VoByKxO7E=;
        b=luoRkr1eCebIAD+kOUfEEYgRqoaGCXeKDsYbwtDULXLlvT2eulraaHK9nex84hXYWw
         i5kjCS/zelakjPjDM75WKZrs6r3Ig2U2hzxdKqhV/F43tKTycnIOXKWvICau3v15e4bs
         I14xC3V5KvKRFCP18tvH26Md4Lewe0oheHAgXK6oq2/BgpIcA83J/Q0OBZKHaat92GF3
         vAaUYOqYIyDKnfRvPwjhJlsFWgNTxdBcOwvLPajGlqUdmqBZ/N6AuUr9ow1PahsAXtOP
         EJYPSoFP3x/8H2hmfGQE3bMrUuGA0Wpa4zKhlkg7cr8kSWOrGGCs6j721lU55KdV1W2e
         abiA==
X-Gm-Message-State: AOAM533zIk1/VwmEEjdBaWjz0lca1ck2m7CZ4K5l/HSvMfBIx1/7nh0k
        HLUWc7wLX2dwjOSnEOKXsg==
X-Google-Smtp-Source: ABdhPJxGs7yVMgVQYSktpFKDHpqq3xduuddkl2U/2zQoDnipcdutMUifZehDC8fqGYid00IMFD8aBA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id e14mr2542560otj.253.1604080844650;
        Fri, 30 Oct 2020 11:00:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k21sm1502672otr.27.2020.10.30.11.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 11:00:43 -0700 (PDT)
Received: (nullmailer pid 4068454 invoked by uid 1000);
        Fri, 30 Oct 2020 18:00:42 -0000
Date:   Fri, 30 Oct 2020 13:00:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        andrea@borgia.bo.it, Kai Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Hans De Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as
 deprecated
Message-ID: <20201030180042.GB3967106@bogus>
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <CAO-hwJLn5XKV+cp+fCRY395uBWuX=JrxgiGSHUnJXFpTzFWu4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJLn5XKV+cp+fCRY395uBWuX=JrxgiGSHUnJXFpTzFWu4w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 11:51:53AM +0100, Benjamin Tissoires wrote:
> Hi Doug,
> 
> Foreword: I was about to say "yeah, whatever" to please Rob for once.

Read my other reply first... I think we mostly agree.

> But after re-reading this and more specifically patch 3 of the series,
> that won't do. More comments inlined.
> 
> On Sat, Oct 24, 2020 at 1:23 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > As pointed out by Rob Herring [1], we should have a device-specific
> > compatible string.  This means people shouldn't be using the
> > "i2c-over-hid" compatible string anymore, or at least not without a
> > more specific compatible string before it.  Specifically:
> >
> > 1. For newly added devices we should just have the device-specific
> >    device string (no "hid-over-i2c" fallback) and infer the timings
> >    and hid-descr-addr from there.
> 
> And that's a big NACK from a maintainer point of view. I know in the
> device tree world these strings are important so that people can just
> say "I have a device compatible with X", and go on, but in the HID
> world that means we will have to implement one compatible struct per
> vendor/device, which is not something I want to do.

It's not really any different than PCI and USB VID/PIDs.

> You can think of it as if you are suddenly saying that because it
> would be easier for a few particular USB devices that need a quirk,
> you "just" need to add the list of *all* USB HID devices that are
> around. i2c-hid should be a driver that doesn't change unless 2 things
> happen:
> - there is a change in the spec
> - there is a specific quirk required for a device that doesn't follow the spec.

Or does something outside of what the spec covers. 

> So if having device tree support for these means we suddenly need to
> add every single device around in the compatible table, I would be
> tempted to just drop the support for those new devices.
> 
> Again, you (or anyone else) have to understand that the descriptor
> address is just a parameter which is known at the manufacturing time,
> but that can vary with different vendors and or products. In the ACPI
> world, this parameter is provided in the DSDT, and there is no reason
> for it to not be provided in the DT.

Whether that makes sense as a standard 'hid-over-i2c' property is a 
separate discussion. Seems like it might be.

It's trying to parameterize power sequencing to be generic and a never 
ending stream of quirk property additions that I'm against. That's based 
on the mistake of accepting those to some point in the past. 
hid-over-i2c is not special here.

If we wanted to parameterize power control/sequences in DT, then we'd 
need to handle any number of controls (GPIO, regulators, clocks, power 
domains, register poking, firmware loading, etc.) in any order and 
amounts of time in between. What we'd end up needing is some programming 
language in DT (Forth anyone?).

> The last thing I want to see is people using device tree having to
> recompile i2c-hid to register their own device.

That's fine if they don't need extra things like power control...

> If this part of the Device Tree binding is so important for the DT
> world, then we should split up the DT bindings from i2c-hid, and have
> some platform driver that would handle a conversion between devicetree
> and platform data. But this driver won't be maintained by me.
> 
> I agree adding the various sleep parameters in the platform data is
> not good, but I prefer that over having to maintain an endless table
> of parameters for every single i2c-hid device out there.

How is match data any different from platform data? It not other than 
one is all in the same file and the other adds a bunch of boilerplate 
and a pointless driver. If it's really such a maintainer burden, then 
perhaps the driver model could learn how to add match entries 
dynamically or from multiple sources (like a 2nd file of ids and 
data). Just throwing out ideas here...

Rob
