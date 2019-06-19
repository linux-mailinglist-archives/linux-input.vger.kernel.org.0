Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2404BF5E
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 19:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbfFSRKY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 13:10:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44384 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFSRKX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 13:10:23 -0400
Received: by mail-io1-f66.google.com with SMTP id s7so130199iob.11;
        Wed, 19 Jun 2019 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XhL3s8+n+4LGUXBuzDp4IsaYK1WrhS3U2p4eeQfXjpc=;
        b=Snh4HaJ6D0gAdd3snS+p+l4+PyNNuEzBd8e/jVTUOHHlzXx4CxhQ4o4GUdIFkEDllk
         55RoOzINcofFZx5xJODItpcMV4uKLjUbdCrDvy1P4RrP1lGTdG+UElUZvIbveOtMyhwF
         MMnVn1DMI64NE5pvU+drxmV0fNfO0SFdVnX6yTN5YDcg0+lFlOvm/eePCee43VAgxJRk
         9bQN3hFsYtz+k6cAGDfr7Gpk43yhi5DKNgf3SwsjlT4iDytUnUJVZ9SBBr970csxyhTn
         nqQa60emHJz62OLCpV7GgYacW2mkwaXwLUpZoLH6qU/q7d9Zxz/mRoJilxCCJBsxFLbV
         vn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XhL3s8+n+4LGUXBuzDp4IsaYK1WrhS3U2p4eeQfXjpc=;
        b=Z9RAhFMZozHbCtgJN7E1YU1JRDHcHDWNIBFaIVBrITkOc086CmhTVV97WUV7g6LwpL
         MMg04tuqjmYPqrN8HW4ST8iF38A32VUvLiPb7iSQBVIWWjvy/lMcKWBto5CD5hNc8Q+T
         PhyYbfu+Xd39j9Hgpzh2ANwxeLZschKQK358PLqL0hry7RpIZSzvh9+4VeFTE2F0Lq3F
         N4es9r/5GgT9pQDHB4RVHxvwvULdzOZ/3/RUfRw2XKwz2KiklwHNedCf1gGYyoF06M8W
         ac6309CDiztbVIC3UPCY3H4DfVFEHsvB77jaY4t4F/7vz2G7C9t6pT7QClGEOEndZxkw
         5pwQ==
X-Gm-Message-State: APjAAAXYvYSjP+kHWDqVlLmbtZLVfig/938R4YnqKMqDqtBbtPqEx3ze
        PgLCO8ZvOxZeNq5D6Hhn2sc=
X-Google-Smtp-Source: APXvYqyxuMh3AG1RHmRopVXp6U25HjpMxXsOWehKV/m73XRb63Gl7uuwLz5wbKfIqGVJJNv53nnN1A==
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr5171499ion.239.1560964222523;
        Wed, 19 Jun 2019 10:10:22 -0700 (PDT)
Received: from localhost ([8.46.75.67])
        by smtp.gmail.com with ESMTPSA id l5sm16367942ioq.83.2019.06.19.10.10.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 10:10:21 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:10:10 -0500
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        hdegoede@redhat.com, bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v6 2/5] HID: quirks: Refactor ELAN 400 and 401
 handling
Message-ID: <20190619171010.24c25oenpmjpiayw@penguin>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
 <20190612212721.32195-1-jeffrey.l.hugo@gmail.com>
 <20190612214636.GA40779@dtor-ws>
 <84e7d83f-e133-0281-612a-94d8c4319040@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e7d83f-e133-0281-612a-94d8c4319040@codeaurora.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 12, 2019 at 04:20:42PM -0600, Jeffrey Hugo wrote:
> On 6/12/2019 3:46 PM, Dmitry Torokhov wrote:
> > On Wed, Jun 12, 2019 at 02:27:21PM -0700, Jeffrey Hugo wrote:
> > > There needs to be coordination between hid-quirks and the elan_i2c driver
> > > about which devices are handled by what drivers.  Currently, both use
> > > whitelists, which results in valid devices being unhandled by default,
> > > when they should not be rejected by hid-quirks.  This is quickly becoming
> > > an issue.
> > > 
> > > Since elan_i2c has a maintained whitelist of what devices it will handle,
> > > which is now in a header file that hid-quirks can access, use that to
> > > implement a blacklist in hid-quirks so that only the devices that need to
> > > be handled by elan_i2c get rejected by hid-quirks, and everything else is
> > > handled by default.
> > > 
> > > Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >   drivers/hid/hid-quirks.c | 27 ++++++++++++++++-----------
> > >   1 file changed, 16 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > > index e5ca6fe2ca57..bd81bb090222 100644
> > > --- a/drivers/hid/hid-quirks.c
> > > +++ b/drivers/hid/hid-quirks.c
> > > @@ -16,6 +16,7 @@
> > >   #include <linux/export.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/mutex.h>
> > > +#include <linux/input/elan-i2c-ids.h>
> > >   #include "hid-ids.h"
> > > @@ -914,6 +915,8 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
> > >   bool hid_ignore(struct hid_device *hdev)
> > >   {
> > > +	int i;
> > > +
> > >   	if (hdev->quirks & HID_QUIRK_NO_IGNORE)
> > >   		return false;
> > >   	if (hdev->quirks & HID_QUIRK_IGNORE)
> > > @@ -978,18 +981,20 @@ bool hid_ignore(struct hid_device *hdev)
> > >   		break;
> > >   	case USB_VENDOR_ID_ELAN:
> > >   		/*
> > > -		 * Many Elan devices have a product id of 0x0401 and are handled
> > > -		 * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
> > > -		 * is not (and cannot be) handled by that driver ->
> > > -		 * Ignore all 0x0401 devs except for the ELAN0800 dev.
> > > +		 * Blacklist of everything that gets handled by the elan_i2c
> > > +		 * input driver.  This avoids disabling valid touchpads and
> > > +		 * other ELAN devices.
> > >   		 */
> > > -		if (hdev->product == 0x0401 &&
> > > -		    strncmp(hdev->name, "ELAN0800", 8) != 0)
> > > -			return true;
> > > -		/* Same with product id 0x0400 */
> > > -		if (hdev->product == 0x0400 &&
> > > -		    strncmp(hdev->name, "QTEC0001", 8) != 0)
> > > -			return true;
> > > +		if ((hdev->product == 0x0401 || hdev->product == 0x0400)) {
> > > +			for (i = 0; strlen(elan_acpi_id[i].id); ++i)
> > > +				if (!strncmp(hdev->name, elan_acpi_id[i].id,
> > > +					     strlen(elan_acpi_id[i].id)))
> > > +					return true;
> > > +			for (i = 0; strlen(elan_of_match[i].name); ++i)
> > > +				if (!strncmp(hdev->name, elan_of_match[i].name,
> > > +					     strlen(elan_of_match[i].name)))
> > > +					return true;
> > 
> > Do we really need to blacklist the OF case here? I thought that in ACPI
> > case we have clashes as HID gets matched by elan_i2c and CID is matched
> > by i2c-hid, but I do not believe we'll run into the same situation on OF
> > systems.
> 
> I think its the safer approach.
> 
> On an OF system, such as patch 3 in the series, the "hid-over-i2c" will end
> up running through this (kind of the whole reason why this series exists).
> The vendor and product ids will still match, so we'll end up going through
> the lists to see if the hdev->name (the compatible string) will match the
> blacklist.  "hid-over-i2c" won't match the blacklist, but if there is a more
> specific compatible, it might.
> 
> In that case, not matching OF would work, however how it could break today
> is if both "hid-over-i2c" and "elan,ekth3000" were listed for the same
> device, and elan_i2c was not compiled.  In that case, if we skip the OF part
> of the black list, hid-quirks will not reject the device, and you'll
> probably have some odd behavior instead of the obvious "the device doesn't
> work because the correct driver isn't present" behavior.
> 
> While that scenario might be far fetched since having both "hid-over-i2c"
> and "elan,ekth3000" probably violates the OF bindings, its still safer to
> include the OF case in the blacklist against future scenarios.

Yes, I believe it is quite far fetched. We are talking about someone
setting compatible sting to something that is decidedly not compatible.
I.e. we know that devices driven by elan_i2c are not compatible with
hi-over-i2c driver/protocol, so why do we expect that they both will be
specified in the same compatible string? I know ACPI case is messier in
this regard as 2 drivers look at the different data items when
evaluating whether they should bind to the device, but here we are
dealing with the same string.

Thanks.

-- 
Dmitry
