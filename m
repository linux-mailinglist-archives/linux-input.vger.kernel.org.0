Return-Path: <linux-input+bounces-16849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3ECFF97C
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 19:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3B6B332C23C
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 18:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E6C358D39;
	Wed,  7 Jan 2026 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlKkr2WU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED6735C196;
	Wed,  7 Jan 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807949; cv=none; b=FzWbEFnQPS8ixNAlIB9ROJ/f25pq9jzbPWVfJf2k53LME4NYzEDePpBKnMruXS4lGfQDOlzknbGmLgA4ZukDS+UXETFV5jssAT+4Fes/9LgDwa/ykWA9pgVnSXKWp13qUPbGqiX95X6JShtK5Tl+v+gcoaSvSza+mC8qC2WEx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807949; c=relaxed/simple;
	bh=yVyjqWNuQCgORMfCWk7brXz3w9nK/RYyXq9Bp89XJhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HETGJbppT8nqd2X/W2ivzQUdiRtZdK39irxwgIYY/usB/edkaSKfG8DHYdUsPGxDua4tUdt3SP4qI8ReX4GtXbVuYLpw7WpDhcGN7c4W9Gn3Qe/MTU0j8oLSa7uAOe97YJwesgwbozFr1Mp6+4m6Fyplke+28ObKj6O6UodkswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlKkr2WU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76DFC4CEF1;
	Wed,  7 Jan 2026 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767807948;
	bh=yVyjqWNuQCgORMfCWk7brXz3w9nK/RYyXq9Bp89XJhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlKkr2WUSkYEytPvrqFeAFEazK0cGEtSqLOc7oNuFCqThW1BfTgww0vLCLvOWo2bV
	 8jyr5UflJQGhPD5KiCUPiKfx56EOMJSFqySfflzUz3hC2YyyUSJuSwm7tka7RF2pX/
	 rM05Q6hwns0slASEE/weOXJCdyz9IVDkWD6ZYt3oNhoniZiGWoccmepSl2VAl4DK7h
	 hKkhN9Z13+/U1G0ayK7EG4lH/RMIN8U2y0+pEVEZeDoZ6zLVc2Y9ZncHG8f2W4LAdr
	 7CkRMCK+sFucWPkY/GzK8kNHiex6erlguxcRkx03zk6hHwRYJyb9FoPT01t/7OpUW+
	 PBAxhZMRdEibA==
Date: Wed, 7 Jan 2026 18:45:45 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Kwok Kin Ming <kenkinming2002@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: override HID descriptors for some Haptick
 5288 touchpads
Message-ID: <3sbccjhicn22ubkbgz23njhsektkrva3b2udaavg2onxmo5uah@2vt472vdjehm>
References: <20251225190822.150872-1-kenkinming2002@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225190822.150872-1-kenkinming2002@gmail.com>

On Dec 26 2025, Kwok Kin Ming wrote:
> On some Samsung laptops (750XFG) with Haptick 5288 touchpads over
> designware i2c bus, the supplied HID descriptors and report descriptors
> can become partially corrupted under some circumstances.
> 
> In particular, this can happen if the touchpad attempts to generate
> input reports while we try to retrieve the HID descriptors or the Report
> descriptor. This can be reproduced by repeatedly reloading the relevant
> kernel modules (i2c_hid_acpi and i2c_hid) and attempting to use the
> touchpad at the same time. The usage of a script is suggested for the
> reproduction of the issue.
> 
> Since it is a race condition, one of the symptom of the issue is that it
> will eventually resolve itself after repeated rebooting.
> 
> There is currently no way of handling malformed HID descriptors and
> report descriptors and per the I2C HID spec, it is not necessary for the
> HOST to re-retrieve a report descriptor under such circumstances.
> Instead of having a system to deal with malformed HID descriptors and
> report descriptors, we simply hard-code them.
> 
> A related issues on another samsung laptop (750XED) have been reported
> on the archlinux forum.
> 
> Links: https://bbs.archlinux.org/viewtopic.php?id=289627
> Signed-off-by: Kwok Kin Ming <kenkinming2002@gmail.com>
> ---
> Other fixes were attempted at the issue but none of them work. In
> summary, they included:
> 
> 1: Remove I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk.
> 2: Do not send power on command to the device before reset.
> 3: Detect if any interrupts have fired when we are reading HID
>    descriptors and report descriptors in a racy manner.
> 
> Other suggestions are welcomed.

I'm really not found of this patch. AFAICT, from the archlinux bug, the
device is presenting itself to HID, and we "just" have a truncated
report descriptor. I'm not sure if you can trigger that bug at the HID
descriptor level, without scripting it (so in real case scenarios).

The simplest "solution" following what you are doing is making a HID-BPF
fixup which checks whether the device properly sent the report
descriptor and if not puts the one here. The HID-BPF has the advantage
of being compatible with hid-multitouch so you won't get into troubles
with a separate module.

The proper solution should be to detect those situations. But you
mentioned above that the detection of the interrupts wasn't working.
Could you tell us more?

I'd very much not have a report descriptor written in stone in the
kernel when the device returns a correct one. Especially not at the
i2c-hid level (I would be happier with a HID module, but this might
break mutltiouch functionality).


Cheers,
Benjamin

> 
> The patch triggers style check warnings due to long line but it should
> sitll be readable. The comments could be removed if necessary.
> 
> Other samsung laptops affected by the issue could also be added if it
> can be confirmed.
> 
>  drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 262 +++++++++++++++++++++++
>  1 file changed, 262 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> index 210f17c3a0be..befec7a0c2fd 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> @@ -290,6 +290,260 @@ static const struct i2c_hid_desc_override sipodev_desc = {
>  	.i2c_name = "SYNA3602:00"
>  };
> 
> +static const struct i2c_hid_desc_override hantick5288_desc = {
> +	.i2c_hid_desc_buffer = (uint8_t [])
> +	{0x1e, 0x00,             /* Length of descriptor          */
> +	 0x00, 0x01,             /* Version of descriptor         */
> +	 0xe2, 0x01,             /* Length of report descriptor   */
> +	 0x21, 0x00,             /* Location of report descriptor */
> +	 0x24, 0x00,             /* Location of input report      */
> +	 0x1f, 0x00,             /* Max input report length       */
> +	 0x25, 0x00,             /* Location of output report     */
> +	 0x11, 0x00,             /* Max output report length      */
> +	 0x22, 0x00,             /* Location of command register  */
> +	 0x23, 0x00,             /* Location of data register     */
> +	 0x11, 0x09,             /* Vendor ID                     */
> +	 0x88, 0x52,             /* Product ID                    */
> +	 0x06, 0x00,             /* Version ID                    */
> +	 0x00, 0x00, 0x00, 0x00, /* Reserved                      */
> +	},
> +	.hid_report_desc = (uint8_t [])
> +	{0x05, 0x01,                   /* Usage Page (Generic Desktop Ctrls)                                                       */
> +	 0x09, 0x02,                   /* Usage (Mouse)                                                                            */
> +	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
> +	 0x85, 0x01,                   /*   Report ID (1)                                                                          */
> +	 0x09, 0x01,                   /*   Usage (Pointer)                                                                        */
> +	 0xA1, 0x00,                   /*   Collection (Physical)                                                                  */
> +	 0x05, 0x09,                   /*     Usage Page (Button)                                                                  */
> +	 0x19, 0x01,                   /*     Usage Minimum (0x01)                                                                 */
> +	 0x29, 0x02,                   /*     Usage Maximum (0x02)                                                                 */
> +	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
> +	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
> +	 0x95, 0x02,                   /*     Report Count (2)                                                                     */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x95, 0x06,                   /*     Report Count (6)                                                                     */
> +	 0x81, 0x01,                   /*     Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position)              */
> +	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
> +	 0x09, 0x30,                   /*     Usage (X)                                                                            */
> +	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
> +	 0x15, 0x81,                   /*     Logical Minimum (-127)                                                               */
> +	 0x25, 0x7F,                   /*     Logical Maximum (127)                                                                */
> +	 0x75, 0x08,                   /*     Report Size (8)                                                                      */
> +	 0x95, 0x02,                   /*     Report Count (2)                                                                     */
> +	 0x81, 0x06,                   /*     Input (Data,Var,Rel,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0xC0,                         /* End Collection                                                                           */
> +	 0x05, 0x0D,                   /* Usage Page (Digitizer)                                                                   */
> +	 0x09, 0x05,                   /* Usage (Touch Pad)                                                                        */
> +	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
> +	 0x95, 0x01,                   /*   Report Count (1)                                                                       */
> +	 0x55, 0x0E,                   /*   Unit Exponent (-2)                                                                     */
> +	 0x65, 0x11,                   /*   Unit (System: SI Linear, Length: Centimeter)                                           */
> +	 0x15, 0x00,                   /*   Logical Minimum (0)                                                                    */
> +	 0x85, 0x04,                   /*   Report ID (4)                                                                          */
> +	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
> +	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
> +	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
> +	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
> +	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
> +	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
> +	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
> +	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
> +	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
> +	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
> +	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
> +	 0x09, 0x30,                   /*     Usage (X)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
> +	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
> +	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
> +	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
> +	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
> +	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
> +	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
> +	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
> +	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
> +	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
> +	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
> +	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
> +	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
> +	 0x09, 0x30,                   /*     Usage (X)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
> +	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
> +	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
> +	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
> +	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
> +	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
> +	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
> +	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
> +	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
> +	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
> +	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
> +	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
> +	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
> +	 0x09, 0x30,                   /*     Usage (X)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
> +	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
> +	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
> +	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
> +	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
> +	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
> +	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
> +	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
> +	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
> +	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
> +	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
> +	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
> +	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
> +	 0x09, 0x30,                   /*     Usage (X)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
> +	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
> +	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
> +	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
> +	 0x55, 0x0C,                   /*   Unit Exponent (-4)                                                                     */
> +	 0x66, 0x01, 0x10,             /*   Unit (System: SI Linear, Time: Seconds)                                                */
> +	 0x47, 0xFF, 0xFF, 0x00, 0x00, /*   Physical Maximum (65534)                                                               */
> +	 0x27, 0xFF, 0xFF, 0x00, 0x00, /*   Logical Maximum (65534)                                                                */
> +	 0x09, 0x56,                   /*   Usage (0x56)                                                                           */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x25, 0x05,                   /*   Logical Maximum (5)                                                                    */
> +	 0x09, 0x54,                   /*   Usage (0x54)                                                                           */
> +	 0x75, 0x04,                   /*   Report Size (4)                                                                        */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x05, 0x09,                   /*   Usage Page (Button)                                                                    */
> +	 0x09, 0x01,                   /*   Usage (0x01)                                                                           */
> +	 0x25, 0x01,                   /*   Logical Maximum (1)                                                                    */
> +	 0x25, 0x01,                   /*   Logical Maximum (1)                                                                    */
> +	 0x75, 0x01,                   /*   Report Size (1)                                                                        */
> +	 0x95, 0x01,                   /*   Report Count (1)                                                                       */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x06, 0x01, 0xFF,             /*   Usage Page (Vendor Defined 0xFF01)                                                     */
> +	 0x95, 0x01,                   /*   Report Count (1)                                                                       */
> +	 0x75, 0x03,                   /*   Report Size (3)                                                                        */
> +	 0x09, 0x41,                   /*   Usage (0x41)                                                                           */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x09, 0x42,                   /*   Usage (0x42)                                                                           */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x75, 0x01,                   /*   Report Size (1)                                                                        */
> +	 0x09, 0x40,                   /*   Usage (0x40)                                                                           */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x75, 0x24,                   /*   Report Size (36)                                                                       */
> +	 0x81, 0x03,                   /*   Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                  */
> +	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
> +	 0x85, 0x02,                   /*   Report ID (2)                                                                          */
> +	 0x25, 0x0F,                   /*   Logical Maximum (15)                                                                   */
> +	 0x75, 0x04,                   /*   Report Size (4)                                                                        */
> +	 0x09, 0x55,                   /*   Usage (0x55)                                                                           */
> +	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
> +	 0x09, 0x59,                   /*   Usage (0x59)                                                                           */
> +	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
> +	 0x85, 0x06,                   /*   Report ID (6)                                                                          */
> +	 0x06, 0x00, 0xFF,             /*   Usage Page (Vendor Defined 0xFF00)                                                     */
> +	 0x09, 0xC5,                   /*   Usage (0xC5)                                                                           */
> +	 0x26, 0xFF, 0x00,             /*   Logical Maximum (255)                                                                  */
> +	 0x75, 0x08,                   /*   Report Size (8)                                                                        */
> +	 0x96, 0x00, 0x01,             /*   Report Count (256)                                                                     */
> +	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
> +	 0xC0,                         /* End Collection                                                                           */
> +	 0x05, 0x0D,                   /* Usage Page (Digitizer)                                                                   */
> +	 0x09, 0x0E,                   /* Usage (0x0E)                                                                             */
> +	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
> +	 0x85, 0x03,                   /*   Report ID (3)                                                                          */
> +	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
> +	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
> +	 0x09, 0x52,                   /*     Usage (0x52)                                                                         */
> +	 0x25, 0x0A,                   /*     Logical Maximum (10)                                                                 */
> +	 0x95, 0x01,                   /*     Report Count (1)                                                                     */
> +	 0xB1, 0x02,                   /*     Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)  */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
> +	 0xA1, 0x00,                   /*   Collection (Physical)                                                                  */
> +	 0x85, 0x05,                   /*     Report ID (5)                                                                        */
> +	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
> +	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
> +	 0x09, 0x57,                   /*     Usage (0x57)                                                                         */
> +	 0xB1, 0x02,                   /*     Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)  */
> +	 0x09, 0x58,                   /*     Usage (0x58)                                                                         */
> +	 0xB1, 0x02,                   /*     Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)  */
> +	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
> +	 0xB1, 0x03,                   /*     Feature (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
> +	 0xC0,                         /*   End Collection                                                                         */
> +	 0xC0,                         /* End Collection                                                                           */
> +	 0x06, 0x01, 0xFF,             /* Usage Page (Vendor Defined 0xFF01)                                                       */
> +	 0x09, 0x02,                   /* Usage (0x02)                                                                             */
> +	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
> +	 0x75, 0x08,                   /*   Report Size (8)                                                                        */
> +	 0x85, 0x0D,                   /*   Report ID (13)                                                                         */
> +	 0x09, 0xD5,                   /*   Usage (0xD5)                                                                           */
> +	 0x95, 0x18,                   /*   Report Count (24)                                                                      */
> +	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
> +	 0x85, 0x0C,                   /*   Report ID (12)                                                                         */
> +	 0x09, 0xD6,                   /*   Usage (0xD6)                                                                           */
> +	 0x96, 0x91, 0x00,             /*   Report Count (145)                                                                     */
> +	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
> +	 0x09, 0x30,                   /*   Usage (0x30)                                                                           */
> +	 0x85, 0x07,                   /*   Report ID (7)                                                                          */
> +	 0x95, 0x07,                   /*   Report Count (7)                                                                       */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x09, 0x70,                   /*   Usage (0x70)                                                                           */
> +	 0x85, 0x0E,                   /*   Report ID (14)                                                                         */
> +	 0x95, 0xC9,                   /*   Report Count (-55)                                                                     */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x09, 0x71,                   /*   Usage (0x71)                                                                           */
> +	 0x85, 0x08,                   /*   Report ID (8)                                                                          */
> +	 0x95, 0x97,                   /*   Report Count (-105)                                                                    */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x09, 0x72,                   /*   Usage (0x72)                                                                           */
> +	 0x85, 0x09,                   /*   Report ID (9)                                                                          */
> +	 0x95, 0xFD,                   /*   Report Count (-3)                                                                      */
> +	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
> +	 0x09, 0x73,                   /*   Usage (0x73)                                                                           */
> +	 0x85, 0x0A,                   /*   Report ID (10)                                                                         */
> +	 0x95, 0x20,                   /*   Report Count (32)                                                                      */
> +	 0x91, 0x02,                   /*   Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)     */
> +	 0xC0,                         /* End Collection                                                                           */
> +	},
> +	.hid_report_desc_size = 482,
> +	.i2c_name = "SPPT2600:00"
> +};
> 
>  static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
>  	{
> @@ -415,6 +669,14 @@ static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
>  		},
>  		.driver_data = (void *)&sipodev_desc
>  	},
> +	{
> +		.ident = "Samsung 750XFG",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "750XFG"),
> +		},
> +		.driver_data = (void *)&hantick5288_desc
> +	},
>  	{ }	/* Terminate list */
>  };
> 
> --
> 2.52.0
> 

