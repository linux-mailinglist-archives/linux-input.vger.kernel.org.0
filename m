Return-Path: <linux-input+bounces-6838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52951988E1E
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 09:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224DB2827FB
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39711166F23;
	Sat, 28 Sep 2024 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5ur83Kj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2D15A8;
	Sat, 28 Sep 2024 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727508431; cv=none; b=FnTsGeJ3MEI8lzHxQyMBqMwKPKytyegpfSWRedPuHoyp8azcyWo6vp7Qf6GKg92rs33CZb1s6m+n9iJ5XTieatiW7t2/7HPyKdcHp9Bag+fC5VeuocuYZ0hotooROFbb8jNVF6lQNFt2PNtKL0OyWYF27VWZEe+kHf0s++SJdsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727508431; c=relaxed/simple;
	bh=KBQjJWEKVccbdf6AgMatMxz7QMXieL7+u23vwdxnYUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTb/94y4nJf/yAziqAjwMnInCuigp9iAtM9d10xIITc/DQTm+CE3xqtEBRqcV80/xhQ0aMZXkUj8qP2CSmqf79zlqK5PNFe4U9m4yP2YUH4SUUU7e0OBW+EUqVmYKhXK5mvdTe6wXHv2PKlyuf/3QJT+ALesb+LW1kjhoGVubb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5ur83Kj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59568C4CEC3;
	Sat, 28 Sep 2024 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727508430;
	bh=KBQjJWEKVccbdf6AgMatMxz7QMXieL7+u23vwdxnYUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5ur83Kjx4GAtoz6tfT4qscd3sx2T0MwZWzvw0L1pJ7lQDDH/XV3at0jhYm4S7koV
	 04aFIocTFaHyR8YuzvbRKxE35B0jOsFDZbtdl/PIoqB2kyT7ChTDLwoGP4Miw4yHNw
	 gPbXc5DHnNwmFETgIZ94Z19a/+UtWciEqWFdpF4IcGZkwpnPIoCIq/+/y3vr2qXkac
	 mEQTxnEX4NNW1c4edBKVVu40gHGjuW1YNd26qHy5YTlOUtjuKdNFFXN09lBOEU0qC+
	 FmlT8KCHZS8bcJqo2TEFIjLwBWKKXZ1pKc5aPWo1afwBcI7bVFaTifsWaCDd33jG1f
	 G8deQRHK94Icg==
Date: Sat, 28 Sep 2024 09:27:04 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Pavel Machek <pavel@ucw.cz>, Werner Sembach <wse@tuxedocomputers.com>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ZvcdNXQJmc8cjifw@amd.ucw.cz>
 <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>

On Sep 28 2024, Armin Wolf wrote:
> Am 27.09.24 um 23:01 schrieb Pavel Machek:
> 
> > Hi!
> > 
> > > The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
> > > controllable RGB keyboard backlight. The firmware API for it is implemented
> > > via WMI.
> > Ok.
> > 
> > > To make the backlight userspace configurable this driver emulates a
> > > LampArray HID device and translates the input from hidraw to the
> > > corresponding WMI calls. This is a new approach as the leds subsystem lacks
> > > a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
> > > needs to be established.
> > Please don't.
> > 
> > a) I don't believe emulating crazy HID interface si right thing to
> > do. (Ton of magic constants. IIRC it stores key positions with
> > micrometer accuracy or something that crazy. How is userland going to
> > use this? Will we update micrometers for every single machine?)

This is exactly why I suggest to make use of HID-BPF. The machine
specifics is going to be controlled by userspace, leaving out the crazy
bits out of the kernel.

> > 
> > Even if it is,
> > 
> > b) The emulation should go to generic layer, it is not specific to
> > your hardware.

Well, there is not so much about an emulation here. It's a different way
of presenting the information.
But given that HID LampArray is a HID standard, userspace is able to
implement it once for all the operating systems, which is why this is so
appealing for them. For reference, we have the same issue with SDL and
Steam regarding advanced game controller: they very much prefer to
directly use HID(raw) to talk to the device instead of having a Linux
specific interface.

Also, starting with v6.12, systemd (logind) will be able to provide
hidraw node access to non root applications (in the same way you can
request an input evdev node). So HID LampArray makes a lot of sense IMO.

> > 
> Maybe introducing a misc-device which provides an ioctl-based API similar
> to the HID LampArray would be a solution?
> 
> Basically we would need:
> - ioctl for querying the supported LEDs and their properties
> - ioctl for enabling/disabling autonomous mode
> - ioctl for updating a range of LEDs
> - ioctl for updating multiple LEDs at once

You'll definitely get the API wrong at first, then you'll need to adapt
for a new device, extend it, etc... But then, you'll depend on one
userspace application that can talk to your custom ioctls, because cross
platform applications will have to implement LampArray, and they'ĺl
probably skip your custom ioctls. And once that userspace application is
gone, you'll still have to maintain this forever.

Also, the application needs to have root access to that misc device, or
you need to add extra support for it in systemd...

> 
> If we implement this as a separate subsystem ("illumination subsystem"), then different
> drivers could use this. This would also allow us to add additional ioctl calls later
> for more features.

Again, I strongly advise against this.

I'll just reiterate what makes the more sense to me:
- provide a thin wmi-to-hid layer that creates a normal regular HID
  device from your device (could be using vendor collections)
- deal with the LampArray bits in the HID stack, that we can reuse for
  other devices (I was planing on getting there for my Corsair and
  Logitech keyboads).
- Meanwhile, while prototyping the LampArray support in userspace and
  kernelspace, make use of HID-BPF to transform your vendor protocol
  into LampArray. This will allow to fix things without having to
  support them forever. This is why HID-BPF exists: so we can create
  crazy but safe kernel interfaces, without having to support them
  forever.

Cheers,
Benjamin

> 
> Thanks,
> Armin Wolf
> 
> > > +
> > > +// We don't know if the WMI API is stable and how unique the GUID is for this ODM. To be on the safe
> > > +// side we therefore only run this driver on tested devices defined by this list.
> > 80 columns, /* */ is usual comment style.
> > 
> > To illustrate my point... this is crazy:
> > 
> > (and would require equally crazy par in openrgb to parse).
> > 
> > Best regards,
> > 								Pavel
> > 
> > > +
> > > +static const uint8_t sirius_16_ansii_kbl_mapping[] = {
> > > +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> > > +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> > > +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> > > +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> > > +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> > > +	0x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
> > > +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> > > +	0x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
> > > +	0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
> > > +	0x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
> > > +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> > > +	0x4f,                                 0x62, 0x63, 0x58
> > > +};
> > > +
> > > +static const uint32_t sirius_16_ansii_kbl_mapping_pos_x[] = {
> > > +	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600, 175300,
> > > +	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 327900, 344600,
> > > +	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000, 190500,
> > > +	209000, 227500, 246000, 269500,                   294500, 311200, 327900, 344600,
> > > +	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000, 199500,
> > > +	218000, 236500, 255000, 273500,                   294500, 311200, 327900,
> > > +	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500, 205000,
> > > +	223500, 242000, 267500,                           294500, 311200, 327900, 344600,
> > > +	 37000,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500, 214000,
> > > +	232500, 251500, 273500,                           294500, 311200, 327900,
> > > +	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000, 273500,
> > > +	292000,                                           311200, 327900, 344600
> > > +};
> > > +
> > > +static const uint32_t sirius_16_ansii_kbl_mapping_pos_y[] = {
> > > +	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,
> > > +	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  53000,  53000,
> > > +	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,
> > > +	 67500,  67500,  67500,  67500,                    67500,  67500,  67500,  67500,
> > > +	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,
> > > +	 85500,  85500,  85500,  85500,                    85500,  85500,  85500,
> > > +	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500,
> > > +	103500, 103500, 103500,                           103500, 103500, 103500,  94500,
> > > +	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500,
> > > +	121500, 121500, 129000,                           121500, 121500, 121500,
> > > +	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000, 147000,
> > > +	147000,                                           139500, 139500, 130500
> > > +};
> > > +
> > > +static const uint32_t sirius_16_ansii_kbl_mapping_pos_z[] = {
> > > +	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,
> > > +	  5000,   5000,   5000,   5000,   5000,   5000,     5000,   5000,   5000,   5000,
> > > +	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,
> > > +	  5250,   5250,   5250,   5250,                     5250,   5250,   5250,   5250,
> > > +	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,
> > > +	  5500,   5500,   5500,   5500,                     5500,   5500,   5500,
> > > +	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,
> > > +	  5750,   5750,   5750,                             5750,   5750,   5750,   5625,
> > > +	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,
> > > +	  6000,   6000,   6125,                             6000,   6000,   6000,
> > > +	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375,   6375,
> > > +	  6375,                                             6250,   6250,   6125
> > > +};
> > > +
> > > +static const uint8_t sirius_16_iso_kbl_mapping[] = {
> > > +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> > > +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> > > +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> > > +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> > > +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> > > +	0x13, 0x2f, 0x30,                     0x5f, 0x60, 0x61,
> > > +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> > > +	0x33, 0x34, 0x32, 0x28,               0x5c, 0x5d, 0x5e, 0x57,
> > > +	0xe1, 0x64, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36,
> > > +	0x37, 0x38, 0xe5, 0x52,               0x59, 0x5a, 0x5b,
> > > +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> > > +	0x4f,                                 0x62, 0x63, 0x58
> > > +};
> > > +
> > > +static const uint32_t sirius_16_iso_kbl_mapping_pos_x[] = {
> > > +	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600, 175300,
> > > +	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 327900, 344600,
> > > +	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000, 190500,
> > > +	209000, 227500, 246000, 269500,                   294500, 311200, 327900, 344600,
> > > +	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000, 199500,
> > > +	218000, 234500, 251000,                           294500, 311200, 327900,
> > > +	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500, 205000,
> > > +	223500, 240000, 256500, 271500,                   294500, 311200, 327900, 344600,
> > > +	 28000,  47500,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500,
> > > +	214000, 232500, 251500, 273500,                   294500, 311200, 327900,
> > > +	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000, 273500,
> > > +	292000,                                           311200, 327900, 344600
> > > +};
> > > +
> > > +static const uint32_t sirius_16_iso_kbl_mapping_pos_y[] = {
> > > +	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,
> > > +	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  53000,  53000,
> > > +	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,
> > > +	 67500,  67500,  67500,  67500,                    67500,  67500,  67500,  67500,
> > > +	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,
> > > +	 85500,  85500,  85500,                            85500,  85500,  85500,
> > > +	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500,
> > > +	103500, 103500, 103500,  94500,                   103500, 103500, 103500,  94500,
> > > +	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500,
> > > +	121500, 121500, 121500, 129000,                   121500, 121500, 121500,
> > > +	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000, 147000,
> > > +	147000,                                           139500, 139500, 130500
> > > +};
> > > +
> > > +static const uint32_t sirius_16_iso_kbl_mapping_pos_z[] = {
> > > +	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,
> > > +	  5000,   5000,   5000,   5000, 5000, 5000,         5000,   5000,   5000,   5000,
> > > +	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,
> > > +	  5250,   5250,   5250,   5250,                     5250,   5250,   5250,   5250,
> > > +	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,
> > > +	  5500,   5500,   5500,                             5500,   5500,   5500,
> > > +	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,
> > > +	  5750,   5750,   5750,   5750,                     5750,   5750,   5750,   5625,
> > > +	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,
> > > +	  6000,   6000,   6000,   6125,                     6000,   6000,   6000,
> > > +	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375,   6375,
> > > +	  6375,                                             6250,   6250,   6125
> > > +};
> > ...
> > > +
> > > +static uint8_t report_descriptor[327] = {
> > > +	0x05, 0x59,			// Usage Page (Lighting and Illumination)
> > > +	0x09, 0x01,			// Usage (Lamp Array)
> > > +	0xa1, 0x01,			// Collection (Application)
> > > +	0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
> > > +	0x09, 0x02,			//  Usage (Lamp Array Attributes Report)
> > > +	0xa1, 0x02,			//  Collection (Logical)
> > > +	0x09, 0x03,			//   Usage (Lamp Count)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> > > +	0x75, 0x10,			//   Report Size (16)
> > > +	0x95, 0x01,			//   Report Count (1)
> > > +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> > > +	0x09, 0x04,			//   Usage (Bounding Box Width In Micrometers)
> > > +	0x09, 0x05,			//   Usage (Bounding Box Height In Micrometers)
> > > +	0x09, 0x06,			//   Usage (Bounding Box Depth In Micrometers)
> > > +	0x09, 0x07,			//   Usage (Lamp Array Kind)
> > > +	0x09, 0x08,			//   Usage (Min Update Interval In Microseconds)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> > > +	0x75, 0x20,			//   Report Size (32)
> > > +	0x95, 0x05,			//   Report Count (5)
> > > +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> > > +	0xc0,				//  End Collection
> > > +	0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
> > > +	0x09, 0x20,			//  Usage (Lamp Attributes Request Report)
> > > +	0xa1, 0x02,			//  Collection (Logical)
> > > +	0x09, 0x21,			//   Usage (Lamp Id)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> > > +	0x75, 0x10,			//   Report Size (16)
> > > +	0x95, 0x01,			//   Report Count (1)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0xc0,				//  End Collection
> > > +	0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
> > > +	0x09, 0x22,			//  Usage (Lamp Attributes Response Report)
> > > +	0xa1, 0x02,			//  Collection (Logical)
> > > +	0x09, 0x21,			//   Usage (Lamp Id)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> > > +	0x75, 0x10,			//   Report Size (16)
> > > +	0x95, 0x01,			//   Report Count (1)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0x09, 0x23,			//   Usage (Position X In Micrometers)
> > > +	0x09, 0x24,			//   Usage (Position Y In Micrometers)
> > > +	0x09, 0x25,			//   Usage (Position Z In Micrometers)
> > > +	0x09, 0x27,			//   Usage (Update Latency In Microseconds)
> > > +	0x09, 0x26,			//   Usage (Lamp Purposes)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> > > +	0x75, 0x20,			//   Report Size (32)
> > > +	0x95, 0x05,			//   Report Count (5)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0x09, 0x28,			//   Usage (Red Level Count)
> > > +	0x09, 0x29,			//   Usage (Green Level Count)
> > > +	0x09, 0x2a,			//   Usage (Blue Level Count)
> > > +	0x09, 0x2b,			//   Usage (Intensity Level Count)
> > > +	0x09, 0x2c,			//   Usage (Is Programmable)
> > > +	0x09, 0x2d,			//   Usage (Input Binding)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> > > +	0x75, 0x08,			//   Report Size (8)
> > > +	0x95, 0x06,			//   Report Count (6)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0xc0,				//  End Collection
> > > +	0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
> > > +	0x09, 0x50,			//  Usage (Lamp Multi Update Report)
> > > +	0xa1, 0x02,			//  Collection (Logical)
> > > +	0x09, 0x03,			//   Usage (Lamp Count)
> > > +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x25, 0x08,			//   Logical Maximum (8)
> > > +	0x75, 0x08,			//   Report Size (8)
> > > +	0x95, 0x02,			//   Report Count (2)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0x09, 0x21,			//   Usage (Lamp Id)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> > > +	0x75, 0x10,			//   Report Size (16)
> > > +	0x95, 0x08,			//   Report Count (8)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> > > +	0x75, 0x08,			//   Report Size (8)
> > > +	0x95, 0x20,			//   Report Count (32)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0xc0,				//  End Collection
> > > +	0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
> > > +	0x09, 0x60,			//  Usage (Lamp Range Update Report)
> > > +	0xa1, 0x02,			//  Collection (Logical)
> > > +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x25, 0x08,			//   Logical Maximum (8)
> > > +	0x75, 0x08,			//   Report Size (8)
> > > +	0x95, 0x01,			//   Report Count (1)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0x09, 0x61,			//   Usage (Lamp Id Start)
> > > +	0x09, 0x62,			//   Usage (Lamp Id End)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> > > +	0x75, 0x10,			//   Report Size (16)
> > > +	0x95, 0x02,			//   Report Count (2)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0x09, 0x51,			//   Usage (Red Update Channel)
> > > +	0x09, 0x52,			//   Usage (Green Update Channel)
> > > +	0x09, 0x53,			//   Usage (Blue Update Channel)
> > > +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> > > +	0x75, 0x08,			//   Report Size (8)
> > > +	0x95, 0x04,			//   Report Count (4)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0xc0,				//  End Collection
> > > +	0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
> > > +	0x09, 0x70,			//  Usage (Lamp Array Control Report)
> > > +	0xa1, 0x02,			//  Collection (Logical)
> > > +	0x09, 0x71,			//   Usage (Autonomous Mode)
> > > +	0x15, 0x00,			//   Logical Minimum (0)
> > > +	0x25, 0x01,			//   Logical Maximum (1)
> > > +	0x75, 0x08,			//   Report Size (8)
> > > +	0x95, 0x01,			//   Report Count (1)
> > > +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> > > +	0xc0,				//  End Collection
> > > +	0xc0				// End Collection
> > > +};
> > > +

