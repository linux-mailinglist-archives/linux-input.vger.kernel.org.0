Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6506D6DDB36
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjDKMvb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 08:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDKMva (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 08:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB283598
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681217444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3/m90kyzpcuhfEbVLNKKGSF4lETG9qdo9zHkD3PocJo=;
        b=Z0mj6f+j8H4oWBwd9RNP8ZMEi+9HGCYRXtrZyQ9V4p7TgrUIMwHpqKTTMxJGzCUTLfb8/o
        pSpTrFeczaMNBHZ1oWkPuykus6SZudJh+98796iXx2bu/tLR8cB/kRwUvGZ4zzxgc6Y70r
        cKq0TTizzb6OTbDyRD+33m1/brJiAi0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-r3to90JHOYOmrGgpeVbtFw-1; Tue, 11 Apr 2023 08:50:41 -0400
X-MC-Unique: r3to90JHOYOmrGgpeVbtFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B18CB29ABA22;
        Tue, 11 Apr 2023 12:50:40 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6945E2166B30;
        Tue, 11 Apr 2023 12:50:39 +0000 (UTC)
Date:   Tue, 11 Apr 2023 14:50:36 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
Message-ID: <20230411125036.3ojjdrjzxhasu5du@mail.corp.redhat.com>
References: <20230409144243.25360-1-hdegoede@redhat.com>
 <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
 <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Apr 11 2023, Hans de Goede wrote:
> Hi Benjamin,
> 
> On 4/11/23 11:02, Benjamin Tissoires wrote:
> > Hi Hans,
> > 
> > On Apr 09 2023, Hans de Goede wrote:
> >> Hi All,
> >>
> >> This series consist of 2 parts:
> >>
> >> 1. Patches 1-3. Allow using i2c-hid-of on non OF platforms to allow I2C-HID
> >>    devices which are not enumerated by ACPI to work on ACPI platforms
> >>    (by manual i2c_client instantiation using i2c_client_id matching).
> > 
> > Patches 1 and 2 are looking good, but I wonder if you can not achieve the
> > same result by relying on an ACPI SSDT override. I got something similar
> > working on this thread[0].
> 
> Yes this could be made to work with an ACPI override. But the goal is
> to make things work OOTB for end users when they install Linux and
> ACPI overrides are very far from something which works OOTB.

Fair enough.

> 
> > I understand the "post-reset-deassert-delay-ms" might be something hard
> > to express with an SSDT, but we should already have all the bits in
> > place, no?
> 
> Actually if an ACPI override is used then the setting of the GPIO
> can be done in _PS0 and _PS3 (power on / off) methods and those
> can simply include a sleep after setting the GPIO.

Though this is all conditional if we can make ACPI SSDT override
something that can be shipped while installing the device...

> 
> > Also, the problem of "post-reset-deassert-delay-ms" is that you are not
> > documenting it, because the OF folks do not want this in device tree,
> > and I tend to agree with them. So this basically creates a brand new
> > undocumented property, which is less than ideal.
> 
> I'm merely not documenting it because there are no devicetree users yet.

AFAIU, the non devicetree properties should also be documented through
DT bindings, no? So not documenting feels very much like "I want to slip
this one in without having to deal with DT maintainers" (and before you
take it personaly, I know this is definitively not the intent). So I'd
rather much having a public API documented, even if there are no users.

> 
> Between the 2 currently supported of devices with a reset GPIO +
> the I2C-HID capable touchscreen + wacom digitizer on the x86 android
> Yoga Book 1 I'm trying to get to work that is 4 I2C-HID devices which
> all follow the pattern of: 1. They have a reset GPIO, 2. they need
> some delay after reset is deasserted.
> 
> It seems silly to keep adding more and more device-ids + match-data
> with just the delays in there when it seems that many many I2C-HID
> capable controllers/chips follow this pattern.

The problem, AFAICT, is that I2C-HID is only described through ACPI, and
a lot of the HW specific is let to ACPI. So i2c-hid-of, is basically OEM
bringing components together on a DT platform, and hoping for the best.
This works well in the way that we don't need to add a new driver for
it, but they can not easily describe what they need (or even fail like
your tablet which is supposed to be working thorugh ACPI).

So if we had one big competitor, like Google for Chromebooks, who just
said: "this is what you need for OF i2c-hid devices, and you can not
rely on anything else", life would be much simpler.

> 
> Also note that there already is a very similar "post-power-on-delay-ms"
> property. I really don't see what makes specifying a delay after
> enabling regulators through a property ok, but specifying the delay
> after reset-deassert not ok. Allowing one but not the other is not
> very consistent.

Agree :/

> 
> The reason why I'm not documenting the property now is because of
> lack of current devicetree users. It can be documented once
> the first DT users show up and getting it accepted should really not
> be an issue given that "post-power-on-delay-ms" already exists.

Honestly this is not a good way of doing thing IMO. This is basically
what I did with i2c-hid, and it pissed the DT maintainers. (I did it
because at the time the maintainers were not reactive, and/or the ML
were not correctly set IIRC).

> 
> Note if just the existence of the property is the main stumbling
> block I can go the match_data route for the wacom digitizer on
> the Yoga Book 1 too and add an extra i2c_device_id with match-data
> setting the delay. This could then either be its own specialized
> driver, or we could still go with the current patch-set
> (minus the property) and add an i2c_device_id with match-data
> to i2c-hid-of.c .

I'd much rather have a i2c-hid-of.c internal API, yes. Whether it's a
function call, a callback or a match-data (or a driver-data), this is
something we are in control and we can change. A blind undocumented
property is going to be a pain if we get to change it.

(unless of course you can get Rob's ack on the preperty itself).

> 
> The only question then is how to name the i2c_device_id for the wacom
> digitizer. It has a vid:pid of 056A:0169 So maybe "wacom0169" ?

Seems reasonable to me :)

[few minutes later]

Well, maybe we don't want the PID to be used here, because we will end
up having to quirk every single device. But OTOH I do not see a
different solution...


> 
> 
> >> 2. Patches 4-6. Remove the special i2c-hid-of-elan and i2c-hid-of-goodix
> >>    driver, folding the functionality into the generic i2c-hid-of driver.
> >>    Since 1. requires adding reset-gpio support to i2c-hid-of there was
> >>    very little difference left between the generic i2c-hid-of code and
> >>    the specialized drivers. So I decided to merge them into the generic
> >>    driver instead of having duplicate code.
> > 
> > I understand the spirit, but I am not a big fan of this. The reason is
> > just detailed your following statements: getting tests on those is hard.
> 
> Actually AFAIK the chromeos folks have an automated test lab where
> all supported models get tested and they regularly test the latest
> mainline kernels. So even without me asking for it any regressions
> here should have been caught in this case since support for both
> special-case i2c-hid-of drivers was added for chromeos.
> 
> And the code is almost identical, the only difference is using
> the bulk-regulator API vs enabling the regulators 1 by 1, which
> should not make any difference.

Well, it's nice to know regressions, but it's nicer to know them before
we introduce them in linux-next :)

My point is if you don't manage to get tests on those devices, and we
can "guarantee" that the changes in i2c-hid-of.c will be a noop for
them, why bother merging them together? If the files have dedicated
maintainers, we should probably rely on them instead :)

> 
> > So there is code duplication, yes, but OTOH this guarantees that we do
> > not break those devices while working on something else.
> > 
> > I can always be convinced otherwise, but I still think the approach of
> > the devicetree-bindings maintainers works better: if you need a new
> > property that isn't available in the core of i2c-hid-of, and which is
> > device specific (even if it's just a msleep for a line to be ready),
> > make this a separate driver. Trying to parametrize everything with
> > properties will just end up in a situation where one "meaningless"
> > property will break another device, and it's going to be a pain to
> > trace, because those drivers are not tested every single kernel release.
> 
> This is not trying to parametrize everything, this is trying to
> parametrize something which turns out to be necessary over 4 different
> chips/controller models. And I'm pretty sure that if I start looking
> into ACPI tables I will find many more controllers which use a reset
> GPIO + a delay after de-assert like this.
> 
> IOW something which is clearly a very common pattern.
> 
> You have been advocating to make HID code more generic allowing
> device-quirks in BPF format to avoid adding drivers for every
> tiny descriptor fixup.

Hehe, fair enough :) But my problem here is more who is responsible for
this code, and merging them together means more responsibility to the
i2c-hid-of.c maintainer. Having separate self-contained drivers for
handling device subtleties (when they are not generic) allows to not
break one device when fixing one other.

> 
> Do you really want to go the route of a tiny driver for every
> i2c-hid chip variant used with devicetree, rather then having
> a single extra property ?

I'd like that property to be validated by Rob first. You raised the
inconsistency above, and I'd rather have an ack from him first.

Having a "this is how every i2c-hid device works" kind of argument might
make it enough for him to change his opinion (because I think that was
the argument for the post power delay).

> 
> Note that if patches 1-3 had been in place when Douglas
> started adding support for the "elan,ekth6915" and
> "goodix,gt7375p" devices that the devicetree on
> the chromeos devices using those would then likely
> have simply used the "hid-descr-addr", "post-power-on-delay-ms"
> and "post-reset-deassert-delay-ms" properties and no
> separate drivers would have been necessary at all.

I think that's how the whole separate driver started. And the argument
of having separate drivers still stands, for devices that are not doing
the same things like others.

The compatible allows to store a set of device specific data that will
not change whatever board the device is placed in. So though technically
easier for the maintainers, having a dedicated property is putting the
burden on the user. While OTOH, if this property is internal API, we can
have a table with it, that says that Goodix needs X ms, when Elan Y and
Wacom Z ms.

But then, you're going to say that this requires a kernel bump, when a
device property is just on the board side, so much convenient from an
OEM point of view :(

> 
> (We need patches 4-6 now only to keep compatibility with
>  existing devicetree files which don't set these)
> 
> So I really see patches 4-6 as a way to reduce future
> work reviewing specialized drivers for you and Jiri.

And I thank you for that :)

> 
> Yes there may still be some special cases in the future
> which need a specialized driver which we have now, but
> I believe that covering the common reset-GPIO pattern
> will drastically reduce the need for those drivers and
> thus will lower the maintainer burden.

Just a small thinking here: if we keep the current compatible drivers
here, we have an example we can point people at if they need fancier
things. So maybe keeping them (or one at least) is a good thing, no?

Cheers,
Benjamin

> 
> Regards,
> 
> Hans
> 
> 

