Return-Path: <linux-input+bounces-15337-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D95ABC7BC9
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 09:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EF23AE053
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 07:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D1F18DB35;
	Thu,  9 Oct 2025 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/GwBC3i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1337F4FA;
	Thu,  9 Oct 2025 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759995535; cv=none; b=FlXbDD9hGiL0e+urrwN3mWF3EBtU9/bvAqzUZf2HkmJmlXg6Y8zMeokgHh+7RCXk6LuKoTgIazdE6AM58zHqWNiIWL6zu/H4JUOC9PpTf1ovb5wsHGGg3icq2blITrQ/wl/AAujm23AeL4K/XjrDE6AKEgALSRShSXKi+N95l7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759995535; c=relaxed/simple;
	bh=2mMu6kOhVPf03SVsCqm0CpeqPDE+im2OXyunq9ZbPsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYyWHXQPs2q0ld1KhKDAq8dUa3uTd0SyTpAJrpDy6jvdQXh5wYJK0Q4pukP09Jkl36Lb0pkHcTzqOdNzc7WmyO6ddyG55bLxJQl+aNfzSucOal1rURE2otomWVsCZrseoggxO+b0nS7c3zvjvtMKvK8Ue/6dhMpJgRyYr2+C/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/GwBC3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD0BC4CEE7;
	Thu,  9 Oct 2025 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759995534;
	bh=2mMu6kOhVPf03SVsCqm0CpeqPDE+im2OXyunq9ZbPsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/GwBC3iQwj0P8jPvAhoWQ57HRFX0PoCqLs4wCl0/5m9IM+URbi32keOKTdsOAWDe
	 f16NdGJIpiqfDac+qKHq+AgtsROgjxJ8VhYX30ahrY3L4UROrLf55Ce/n+MKc7b9Ju
	 qksKsBBebmwE0gS6oVa0PyacotVzKYirL/vj1aYcn2/uzKzmaTjcrIo+qLhWPAsMAg
	 JZErdb171aUNt6g9Op3otyycrhevvdeHfMcEr5yoJSlHEosFLnS9GT2GOAbUU5SfDY
	 LW3u/l4m305QJaL3ntQXGFgU+YCwpZxPv5f4dSRuNYcljVw49IJY7QaSKv9A2WChCs
	 b3ErO9/uVWeaA==
Date: Thu, 9 Oct 2025 09:38:50 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Lauri Tirkkonen <lauri@hacktheplanet.fi>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: patch Lenovo Yoga Slim 7x Keyboard rdesc
Message-ID: <lxtbtu5frygbw7qzfaelc63vgientm7d6oo7dt6jeassl3ttbh@f22h223wehbm>
References: <aOdLxAEYQpV2zp77@mail.hacktheplanet.fi>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOdLxAEYQpV2zp77@mail.hacktheplanet.fi>

On Oct 09 2025, Lauri Tirkkonen wrote:
> The keyboard of this device has the following in its report description
> for Usage (Keyboard) in Collection (Application):
> 
> 	# 0x15, 0x00,                    //  Logical Minimum (0)                52
> 	# 0x25, 0x65,                    //  Logical Maximum (101)              54
> 	# 0x05, 0x07,                    //  Usage Page (Keyboard)              56
> 	# 0x19, 0x00,                    //  Usage Minimum (0)                  58
> 	# 0x29, 0xdd,                    //  Usage Maximum (221)                60
> 	# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               62
> 
> Since the Usage Min/Max range exceeds the Logical Min/Max range,
> keypresses outside the Logical range are not recognized. This includes,
> for example, the Japanese language keyboard variant's keys for |, _ and
> \.
> 
> Patch the report description to make the Logical range match the Usage
> range, fixing the interpretation of keypresses above 101 on this device.
> 
> Signed-off-by: Lauri Tirkkonen <lauri@hacktheplanet.fi>
> ---
>  drivers/hid/hid-ids.h              |  1 +
>  drivers/hid/i2c-hid/i2c-hid-core.c | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 5721b8414bbd..bbb932145d2c 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -715,6 +715,7 @@
>  #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
>  #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
>  #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
> +#define I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X	0x8987
>  #define USB_DEVICE_ID_ITE8595		0x8595
>  #define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
>  
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 63f46a2e5788..d78bd97ec24e 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c

Why patching i2c-hid-core when this is clearly a logical bug, not a
transport (I2C) bug?

I would rather see this fixup in hid-lenovo.c along with the other
lenovo fixes.

Cheers,
Benjamin

> @@ -740,6 +740,26 @@ static int i2c_hid_raw_request(struct hid_device *hid, unsigned char reportnum,
>  	}
>  }
>  
> +static void patch_lenovo_yoga_slim7x_keyboard_rdesc(struct i2c_hid *ihid,
> +						    char *rdesc,
> +						    unsigned int rsize)
> +{
> +	if (!(rsize == 0xb0 &&
> +	      rdesc[0x34] == 0x15 && rdesc[0x35] == 0x00 && // Logical Minimum (0)
> +	      rdesc[0x36] == 0x25 && rdesc[0x37] == 0x65 && // Logical Maximum (101)
> +	      rdesc[0x38] == 0x05 && rdesc[0x39] == 0x07 && // Usage Page (Keyboard)
> +	      rdesc[0x3a] == 0x19 && rdesc[0x3b] == 0x00 && // Usage Minimum (0)
> +	      rdesc[0x3c] == 0x29 && rdesc[0x3d] == 0xdd))  // Usage Maximum (221)
> +		return;
> +
> +	u8 logical_max = rdesc[0x37];
> +	u8 usage_max = rdesc[0x3d];
> +
> +	rdesc[0x37] = usage_max;
> +	i2c_hid_dbg(ihid, "%s: patched logical max from %u to %u\n", __func__,
> +			logical_max, usage_max);
> +}
> +
>  static int i2c_hid_parse(struct hid_device *hid)
>  {
>  	struct i2c_client *client = hid->driver_data;
> @@ -793,6 +813,11 @@ static int i2c_hid_parse(struct hid_device *hid)
>  		}
>  	}
>  
> +	if (ihid->hid->vendor == USB_VENDOR_ID_ITE &&
> +	    ihid->hid->product == I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X) {
> +		patch_lenovo_yoga_slim7x_keyboard_rdesc(ihid, rdesc, rsize);
> +	}
> +
>  	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
>  
>  	ret = hid_parse_report(hid, rdesc, rsize);
> -- 
> 2.51.0
> 
> -- 
> Lauri Tirkkonen | lotheac @ IRCnet

