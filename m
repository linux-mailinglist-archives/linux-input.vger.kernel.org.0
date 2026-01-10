Return-Path: <linux-input+bounces-16937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CCD0D47A
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 11:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D95A3008CB0
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB362FD1D6;
	Sat, 10 Jan 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZvQv8wj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA442FB093
	for <linux-input@vger.kernel.org>; Sat, 10 Jan 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768039767; cv=none; b=PgDwJBMNIyt1A2Lu0LV4dCoKvm+m/JzzdIY4cFWMKALv/pbYLIm0bRJoNDUytzZRUs0naUZ4nB6eTZnQh+ZjQzEsAsXLI3LrfeRoGJujapn47JMJWImM/VPA4VkPUsuCBi95enBiXK6CEXoongZtOnR5AfJ9fJTIIRrt8jGOnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768039767; c=relaxed/simple;
	bh=U4v9kwQRVvoj02aLZqAXKJktDFGF0pJ4xXYG47v7dps=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z7rO7Lkl2L7BiOzdJszrmqH/+13VjXfAfLXEiq7uQmu+f7sBygIHPS0suoaczWDrViPy8duZmNHVDLAkta3SIpSrzlyDSh1X9uEqsB8LCT13+qlXQa4kHlCoRvoiudPXUnlB6BiO+t7bqrZ04DgWKzFT8KPXSvHte3N0/ag77AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZvQv8wj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8F3C4CEF1;
	Sat, 10 Jan 2026 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768039766;
	bh=U4v9kwQRVvoj02aLZqAXKJktDFGF0pJ4xXYG47v7dps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GZvQv8wjOjdw5Tthycqs0AEzGjN7puxC60IO6uexL4Ak2VAw0f7XBmXyXzVHT7Vtm
	 fhm7liKg0DQMaQD7PWrAXU07FMqVKBrzLks0YQ6sBkojFdauLGi2qJ9nNHpdh2dlW5
	 TzfRh5J4t8lqUg5pLIDuEIDX5Ys270SE//vQlwkRL5wqqiPp7D4PdvWVI35laooXK5
	 gYfjHKYvNbt3Gmg8b/rr1/C8zayBCdke6fruniLJti9TrK68G8LJDSzwQjtrQJoOs8
	 dCRHcXcX/CNlyn0+hCAdAmzvC2sDlKMy4t41lgxST/Rfs+bxuq0bwtss2GuufTfFQ2
	 nCeTAbcP/sN9w==
Date: Sat, 10 Jan 2026 11:09:23 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Luis Yanes <melus0@yahoo.es>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH] Off-by-one error in CP2112 HID driver affecting SMBus
 block read output
In-Reply-To: <68F7C063.5049@yahoo.es>
Message-ID: <7o2r376p-q39r-r858-46n9-492oq5n6s8pq@xreary.bet>
References: <68F7C063.5049.ref@yahoo.es> <68F7C063.5049@yahoo.es>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Oct 2025, Luis Yanes wrote:

> Affected file: drivers/hid/hid-cp2112.c
> Kernel version: v5.15.195 (verified) - master (suspected)
> Tool used: i2cget -y 8 0xb 0x78 s <-- reading a battery gauge chip
> 
> Observed behavior:
> Incorrect trailing last byte in 32 bytes SMBus block read response.
> 
> Expected output:
> 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xaa
> 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x55
> 
> Actual SMBus block data read output:
> 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xaa
> 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00
> 
> I2C block data read output (from i2cget -y 8 0xb 0x78 i):
> 0x20 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff
> 0xaa 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff
> 
> Description:
> When performing an SMBus block read using the CP2112 HID USB-to-SMBus
> bridge with the i2cget utility, the last byte of the response for a
> 32 bytes block read is, in this case, always 0x00 instead of the actual
> value. In this sample case shown above the actual last byte is 0x55 but
> the driver returns 0x00 (uninitialized value).
> This happens consistently for any 32 bytes block read on any register.
> Shorter than 32 bytes block transfers are unaffected.
> 
> Suspected cause:
> For what I could understand checking the source code this seems an
> off-by-one error in the read request and buffer handling, limited by the
> I2C_SMBUS_BLOCK_MAX 32 bytes read value and the response parsing logic
> within the CP2112 driver since that with a custom hacked module
> (see patch below) I could read that last byte.
> 
> Steps to reproduce:
> 1. Connect a CP2112 device and a proper slave device to read from.
> 2. Use i2cget to perform a known 32 bytes block read with this device:
>    i.e: i2cget -y 8 0xb 0x78 s
> 3. Compare the output against the expected data from the target
>    SMBus device. The last byte probably could appear as any other
>    uninitialized buffer value, I guess.
>    From 'i2cget -y 8 0xb 0x78 i' the initial 0x20 is the block
>    length and the last 32th byte is completely missing.
> 
> Impact:
> This bug produces incorrect output and will lead to data corruption
> or data misinterpretation when reading from SMBus devices using this
> driver.
> 
> Suggested fix:
> Review the buffer handling and read length in the CP2112 driver SMBus
> and I2C block read and write implementations.
> I have not checked if write operations are affected, but probably would
> be a good idea to verify that the 32 bytes block transfers are handled
> properly.
> 
> Additional info:
> The issue is reproducible with different CP2112 devices (silicon rev F04)
> and v5.15.x stock kernel builds. Probably also affects newer versions
> since for what I could understand, despite the additional checking
> changes added to the driver the logic seems basically the same.
> 
> Patch: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/hid/hid-cp2112.c?h=v5.15.195
> --- a/drivers/hid/hid-cp2112.c
> +++ b/drivers/hid/hid-cp2112.c
> @@ -703,7 +703,7 @@
>  	case I2C_SMBUS_BLOCK_DATA:
>  		if (I2C_SMBUS_READ == read_write) {
>  			count = cp2112_write_read_req(buf, addr,
> -						      I2C_SMBUS_BLOCK_MAX,
> +						      I2C_SMBUS_BLOCK_MAX + 1,
>  						      command, NULL, 0);
>  		} else {
>  			count = cp2112_write_req(buf, addr, command,
> @@ -796,7 +796,7 @@
>  		memcpy(data->block + 1, buf, read_length);
>  		break;
>  	case I2C_SMBUS_BLOCK_DATA:
> -		if (read_length > I2C_SMBUS_BLOCK_MAX) {
> +		if (read_length > I2C_SMBUS_BLOCK_MAX + 1) {
>  			ret = -EPROTO;
>  			goto power_normal;
>  		}

Your explanation and the fix look good to me. Could you please do a proper 
submission (with proper shortlog+changelog, SOB line, etc?)?

Thanks,

-- 
Jiri Kosina
SUSE Labs


