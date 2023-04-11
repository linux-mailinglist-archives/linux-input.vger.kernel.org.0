Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1E36DE1A0
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjDKQ5s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjDKQ5r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34715E2
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681232221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZFz2FGS35Rk+GU7STeR/8BA+m4eVpvnR/Zzy/si8BfQ=;
        b=df6tD4DNi6rh4BRiG5IFhmUbZkbwFWZPLyhdfpZQiQ0FojjDxXwXjANiEL2690uSANofhv
        QuSO58yGYUmULnDuYskNcaNu7uAZiLDS7XOqiLNHc9lfBvYeQTqIGD1UT+2N9CLaJXwlIM
        oud7/L8JiQHu4c7IAKWKIv5PAywtU7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-S0HRcdRtOZaalSor0-mfCg-1; Tue, 11 Apr 2023 12:56:58 -0400
X-MC-Unique: S0HRcdRtOZaalSor0-mfCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D240811E7C;
        Tue, 11 Apr 2023 16:56:57 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B0414171D5;
        Tue, 11 Apr 2023 16:56:56 +0000 (UTC)
Date:   Tue, 11 Apr 2023 18:56:53 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
Message-ID: <20230411165653.rw3ivfjdhjv5dmc3@mail.corp.redhat.com>
References: <20230409144243.25360-1-hdegoede@redhat.com>
 <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
 <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com>
 <20230411125036.3ojjdrjzxhasu5du@mail.corp.redhat.com>
 <eafe8744-49d4-31e3-2329-ddd452358915@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eafe8744-49d4-31e3-2329-ddd452358915@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
> On 4/11/23 14:50, Benjamin Tissoires wrote:
> > On Apr 11 2023, Hans de Goede wrote:
> >> Hi Benjamin,
> >>
> >> On 4/11/23 11:02, Benjamin Tissoires wrote:
> >>> Hi Hans,
> >>>
> >>> On Apr 09 2023, Hans de Goede wrote:
> >>>> Hi All,
> >>>>
> >>>> This series consist of 2 parts:
> >>>>
> >>>> 1. Patches 1-3. Allow using i2c-hid-of on non OF platforms to allow I2C-HID
> >>>>    devices which are not enumerated by ACPI to work on ACPI platforms
> >>>>    (by manual i2c_client instantiation using i2c_client_id matching).
> >>>
> >>> Patches 1 and 2 are looking good, but I wonder if you can not achieve the
> >>> same result by relying on an ACPI SSDT override. I got something similar
> >>> working on this thread[0].
> >>
> >> Yes this could be made to work with an ACPI override. But the goal is
> >> to make things work OOTB for end users when they install Linux and
> >> ACPI overrides are very far from something which works OOTB.
> > 
> > Fair enough.
> > 
> >>
> >>> I understand the "post-reset-deassert-delay-ms" might be something hard
> >>> to express with an SSDT, but we should already have all the bits in
> >>> place, no?
> >>
> >> Actually if an ACPI override is used then the setting of the GPIO
> >> can be done in _PS0 and _PS3 (power on / off) methods and those
> >> can simply include a sleep after setting the GPIO.
> > 
> > Though this is all conditional if we can make ACPI SSDT override
> > something that can be shipped while installing the device...
> > 
> >>
> >>> Also, the problem of "post-reset-deassert-delay-ms" is that you are not
> >>> documenting it, because the OF folks do not want this in device tree,
> >>> and I tend to agree with them. So this basically creates a brand new
> >>> undocumented property, which is less than ideal.
> >>
> >> I'm merely not documenting it because there are no devicetree users yet.
> > 
> > AFAIU, the non devicetree properties should also be documented through
> > DT bindings, no? So not documenting feels very much like "I want to slip
> > this one in without having to deal with DT maintainers" (and before you
> > take it personaly, I know this is definitively not the intent). So I'd
> > rather much having a public API documented, even if there are no users.
> 
> Right, so as a hobby I have a tendency to work on these somewhat niche/weird
> x86 devices, like x86 tablets which use Android as factory OS :)
> 
> As such I have encountered the need for device-properties to pass info
> from drivers/platform/x86 code to more generic drivers a number of
> times before.
> 
> Each time this happens, if I try to add them to bindings I get
> asked for some example devicetree code, I then respond that these
> are *device*-properties not of-properties and that there are no
> current devicetree users after which the DT maintainers tell me
> to then NOT document them in the DT bindings, at least not until
> actually DT users show up. I fully expect any attempt do add
> this to the DT bindings to go the same way.
> 
> And now I have you telling me you really want to see this
> documented at the same time as it getting implemented. Which
> I fully understand, but does leads to a bit of a catch 22.

Ouch. Sorry for that. Then I guess if the DT maintainers have a tendency
to accept those hidden properties, this is the simplest solution from a
i2c-hid/HID maintainer point of view, no? It's going to be a pain for the
platform driver because you still have to hardcode those properties
somewhere I guess.

> 
> Anyways lets just go with the alternative of treating this
> similar as the existing specialized drivers, see below.
> 
> <snip>
> 
> >> Note if just the existence of the property is the main stumbling
> >> block I can go the match_data route for the wacom digitizer on
> >> the Yoga Book 1 too and add an extra i2c_device_id with match-data
> >> setting the delay. This could then either be its own specialized
> >> driver, or we could still go with the current patch-set
> >> (minus the property) and add an i2c_device_id with match-data
> >> to i2c-hid-of.c .
> > 
> > I'd much rather have a i2c-hid-of.c internal API, yes. Whether it's a
> > function call, a callback or a match-data (or a driver-data), this is
> > something we are in control and we can change.
> 
> Ok.
> 
> So I see 2 options here:
> 
> 1. Take the approach from patches 1-4 here, but drop the property and
>    use match data on a new "wacom0169" i2c_device_id instead.
>    This would also pave the way to merging patches 5 + 6 once tested
>    by google to reduce some code duplication. Although you write below
>    you would prefer to keep these around as example code for other
>    specialized drivers...
> 
> 2. Add a new specialized i2c-hid-of-wacom driver for this.
>    Question: Since this will be using i2c_device_id binding not
>    DT/OF binding the -of- in the name is technically incorrect,
>    but it would be consistent with the other specialized drivers
>    and could be seen as preparation (avoiding a rename/confusion)
>    for when any DT enumerated devices which need special handling
>    show up (note only relevant if you prefer this approach).

Well, option 2 is probably too much work for little gain. So I would go
with option 1, but with the following questions:

- a device property is public, so it can be seen as public API, right?
  So should we document it some way (not through DT) so we "guarantee"
  some behavior for it?

If the above is correct, then that means that the device property can
be used, which makes little changes to your series.

But then, why aren't you using that property directly for those 2 other
drivers? Can't we have elan and goodix i2c-hid-of variants, be just a
stub around adding the gpio names and the specific reset? (A plain "this
is completely dumb" answer is fine, just trying to get my head around it).

So, given the above, and your experience with the DT maintainers, I
would go with patches 1-3 + a documentation of the new property, likely
in the header or in kernel docs.

Patches 4-6 either dropped, reworked, or left as they are, and we would
merge them only if the maintainers of those files tested the changes.

And if you prefer storing the post-reset delay in the hid tree, that's
fine too, but I guess you would prefer having less friction by keeping
it in the platform tree.

> 
> Either way is fine with me really. So you get to chose. If you
> let me know which route you prefer, I'll go and prepare either
> a v2 of this series, or a whole new patch for the new specialized
> driver.

Sorry for being a PITA, but having those driver separated allowed to
move forward without having to have a spaghetti plate in i2c-hid, which
was the case before the split (because *everything* was entangled: ACPI,
DT, OF, properties). So that's why I'm trying to understand and
minimize the changes.

Also, before you sending v2 and involving too much, we could try to wait a
few days for Doug to answer, and hear if he has an opinion. But if you
rather send v2 right away, that's your choice obviously :)

Cheers,
Benjamin

> 
> Regards,
> 
> Hans
> 
> 

