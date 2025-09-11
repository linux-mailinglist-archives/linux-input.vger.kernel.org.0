Return-Path: <linux-input+bounces-14608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1AB53669
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 16:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7190B3B0863
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 14:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89CC25CC4D;
	Thu, 11 Sep 2025 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI8ddGnN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA647F4A
	for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602522; cv=none; b=oBW7CiqBpifo1XSKeHxUvqhU/4OPt70XR1dKUwcNKAsXoUBzkAr7eRsb3pt/EhZArf78nfnx6/n0tbhn0OAVR+s8+UPo37xzz9AZ17hPd5N8zbSdHBo2SOTziLAPAjtdueq6E5cU58A2w31Y8BWQXhhb/rszSnp32Zu7JO+OK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602522; c=relaxed/simple;
	bh=CZZu+EVnMRONNxARgdsMttpuaBe4WlVkz89HLp70ngU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4Bc+PSDpyMY6cA5I3Uu3i6WKW4SZxF+d8igWj+bdUow5R8t1IANKdLUOsvTONI2BIqO7EI/Aq1q/xyF4sWXs0eJ4XU4ahI9O1LckeSps7aK0bwf42gCGgX92C0Y5/lYnycsDxbllojKxzuYmdT/IkP8zisSOaROQOiTtWFnEDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kI8ddGnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F97C4CEF0;
	Thu, 11 Sep 2025 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757602521;
	bh=CZZu+EVnMRONNxARgdsMttpuaBe4WlVkz89HLp70ngU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kI8ddGnNNtTWaNxvrLNVZf+vhHnSbVcAezpP6C1i6wJqYQZNcEvghsqV9I3ZuJeCt
	 SwA8LUaybzMYJg4ify+izxuiBul9g/LGb+t3rLXM7ZA/kpOmn+FF/l9u/Xplis8GP2
	 i3lL1jMVmkRu94R+hFQzGQKxEVVswiYNvvmsmI/jd0R25f+euJIQ2LK//1kbOzZ8gO
	 IO+NFX292JtQdtG08vLWJKAqJe4AGbKZcz5E1wNZ/WIKK92t9jZKrRV06Rf9e8KEAv
	 kbsEBsWaIxWS4e4vP+8jezoJYqUaqH/QcoqeAHLOaQZivofqw41pvF8BUFQxPp2WcB
	 CA2ekQZwnPp0w==
Date: Thu, 11 Sep 2025 16:55:17 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: Resolve touchpad issues on Dell systems
 during S4
Message-ID: <fq72hafbttdajz5pwivwnoam5mvu6u2cnpfc6sj63niqb5bqi6@ylj3vkm4sjxi>
References: <20250909110012.1218226-1-superm1@kernel.org>
 <vy4g5xpppfy3wy6c6ncjeqiywumuv2al5lowwbt3x4qtc3rpwv@2mvzwivdhhlc>
 <06b2e03e-056d-4012-98c9-1741f2493c0d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06b2e03e-056d-4012-98c9-1741f2493c0d@kernel.org>

On Sep 11 2025, Mario Limonciello wrote:
> On 9/11/25 8:49 AM, Benjamin Tissoires wrote:
> > Hi Mario,
> > 
> > On Sep 09 2025, Mario Limonciello (AMD) wrote:
> > > Dell systems utilize an EC-based touchpad emulation when the ACPI
> > > touchpad _DSM is not invoked. This emulation acts as a secondary
> > > master on the I2C bus, designed for scenarios where the I2C touchpad
> > > driver is absent, such as in BIOS menus. Typically, loading the
> > > i2c-hid module triggers the _DSM at initialization, disabling the
> > > EC-based emulation.
> > > 
> > > However, if the i2c-hid module is missing from the boot kernel
> > > used for hibernation snapshot restoration, the _DSM remains
> > > uncalled, resulting in dual masters on the I2C bus and
> > > subsequent arbitration errors. This issue arises when i2c-hid
> > > resides in the rootfs instead of the kernel or initramfs.
> > 
> > In the downstream Red Hat bug it was mentioned that the kernel
> > configuration had an impact though. But as I understand it now that I'm
> > re-reading it for the 4th time:
> > - on stock fedora kernel (i2c-hid in initramfs): works
> > - on stock RHEL kernel (i2c-hid in initramfs): bug but config issue
> > - on vanilla kernel without i2c-hid in initramfs: bug fixed by that
> > 		patch
> > - on vanilla kernel with i2c-hid in initramfs: works
> 
> The detail you're missing here for #4 is vanilla kernel *with Fedora kernel
> config* not with a defconfig.  A defconfig kernel I don't expect enables all
> the config options needed for this hardware.
> 
> I've reproduced it with my own kernel config as well which is not the Fedora
> or RHEL kernel config but rather a narrowed down config of options that I
> normally use for testing.
> 
> > 
> > So that patch is needed no matter the config bug we have there and it
> > will also fix that config bug. Am I correct?
> 
> Yes there are certainly circumstances it is needed if i2c-hid isn't present
> in the kernel used to restore the hibernation image.
> 
> > 
> > > 
> > > To address this, switch from using the SYSTEM_SLEEP_PM_OPS()
> > > macro to dedicated callbacks, introducing a specific
> > > callback for restoring the S4 image. This callback ensures
> > > the _DSM is invoked.
> > 
> > I'm a little bit hesitant to include this patch without proper testing.
> > Did you run this through a wider range of laptops than just the
> > problematic one?
> 
> I have been including it in my (local) development and testing tree ever
> since I made it about a month ago so I've thrown it at a random assortment
> of hardware I boot that on.  I have also been doing S4 testing explicitly
> because of checking that I didn't break S4 with by S4 at S5 series [1].
> 
> That hardware is all biased to be AMD hardware though.

Alright, thanks for the precision.

I'll run on my intel based laptop a few tests then and will include this
upstream.

Cheers,
Benjamin

> 
> [1] https://lore.kernel.org/linux-usb/20250909191619.2580169-1-superm1@kernel.org/
> > 
> > Other than that, patch looks good to me, but I would have liked to have
> > another opinion on it.
> > 
> > Cheers,
> > Benjamin
> > 
> > > 
> > > Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > > ---
> > >   drivers/hid/i2c-hid/i2c-hid-acpi.c |  8 ++++++++
> > >   drivers/hid/i2c-hid/i2c-hid-core.c | 28 +++++++++++++++++++++++++++-
> > >   drivers/hid/i2c-hid/i2c-hid.h      |  2 ++
> > >   3 files changed, 37 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > > index 1b49243adb16a..abd700a101f46 100644
> > > --- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > > +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > > @@ -76,6 +76,13 @@ static int i2c_hid_acpi_get_descriptor(struct i2c_hid_acpi *ihid_acpi)
> > >   	return hid_descriptor_address;
> > >   }
> > > +static void i2c_hid_acpi_restore_sequence(struct i2chid_ops *ops)
> > > +{
> > > +	struct i2c_hid_acpi *ihid_acpi = container_of(ops, struct i2c_hid_acpi, ops);
> > > +
> > > +	i2c_hid_acpi_get_descriptor(ihid_acpi);
> > > +}
> > > +
> > >   static void i2c_hid_acpi_shutdown_tail(struct i2chid_ops *ops)
> > >   {
> > >   	struct i2c_hid_acpi *ihid_acpi = container_of(ops, struct i2c_hid_acpi, ops);
> > > @@ -96,6 +103,7 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
> > >   	ihid_acpi->adev = ACPI_COMPANION(dev);
> > >   	ihid_acpi->ops.shutdown_tail = i2c_hid_acpi_shutdown_tail;
> > > +	ihid_acpi->ops.restore_sequence = i2c_hid_acpi_restore_sequence;
> > >   	ret = i2c_hid_acpi_get_descriptor(ihid_acpi);
> > >   	if (ret < 0)
> > > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > > index d3912e3f2f13a..3257aa87be898 100644
> > > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > > @@ -961,6 +961,14 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
> > >   	ihid->ops->shutdown_tail(ihid->ops);
> > >   }
> > > +static void i2c_hid_core_restore_sequence(struct i2c_hid *ihid)
> > > +{
> > > +	if (!ihid->ops->restore_sequence)
> > > +		return;
> > > +
> > > +	ihid->ops->restore_sequence(ihid->ops);
> > > +}
> > > +
> > >   static int i2c_hid_core_suspend(struct i2c_hid *ihid, bool force_poweroff)
> > >   {
> > >   	struct i2c_client *client = ihid->client;
> > > @@ -1360,8 +1368,26 @@ static int i2c_hid_core_pm_resume(struct device *dev)
> > >   	return i2c_hid_core_resume(ihid);
> > >   }
> > > +static int i2c_hid_core_pm_restore(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct i2c_hid *ihid = i2c_get_clientdata(client);
> > > +
> > > +	if (ihid->is_panel_follower)
> > > +		return 0;
> > > +
> > > +	i2c_hid_core_restore_sequence(ihid);
> > > +
> > > +	return i2c_hid_core_resume(ihid);
> > > +}
> > > +
> > >   const struct dev_pm_ops i2c_hid_core_pm = {
> > > -	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_pm_suspend, i2c_hid_core_pm_resume)
> > > +	.suspend = pm_sleep_ptr(i2c_hid_core_pm_suspend),
> > > +	.resume = pm_sleep_ptr(i2c_hid_core_pm_resume),
> > > +	.freeze = pm_sleep_ptr(i2c_hid_core_pm_suspend),
> > > +	.thaw = pm_sleep_ptr(i2c_hid_core_pm_resume),
> > > +	.poweroff = pm_sleep_ptr(i2c_hid_core_pm_suspend),
> > > +	.restore = pm_sleep_ptr(i2c_hid_core_pm_restore),
> > >   };
> > >   EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
> > > diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
> > > index 2c7b66d5caa0f..1724a435c783a 100644
> > > --- a/drivers/hid/i2c-hid/i2c-hid.h
> > > +++ b/drivers/hid/i2c-hid/i2c-hid.h
> > > @@ -27,11 +27,13 @@ static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product)
> > >    * @power_up: do sequencing to power up the device.
> > >    * @power_down: do sequencing to power down the device.
> > >    * @shutdown_tail: called at the end of shutdown.
> > > + * @restore_sequence: hibernation restore sequence.
> > >    */
> > >   struct i2chid_ops {
> > >   	int (*power_up)(struct i2chid_ops *ops);
> > >   	void (*power_down)(struct i2chid_ops *ops);
> > >   	void (*shutdown_tail)(struct i2chid_ops *ops);
> > > +	void (*restore_sequence)(struct i2chid_ops *ops);
> > >   };
> > >   int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
> > > -- 
> > > 2.43.0
> > > 
> 

