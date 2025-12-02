Return-Path: <linux-input+bounces-16441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 57732C9AAA5
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 09:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB0A2345BCD
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 08:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575A83016F0;
	Tue,  2 Dec 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW1/1Kky"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C421FF35;
	Tue,  2 Dec 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663916; cv=none; b=u1CZp5fd9Pq9aZJLUXBWxM5yDVNk6xJWTP0+kCsHZC5430/Zd/pR2MAgKrU0EqHzKN4t/NkfptsTsQk9CKxAukML6HVKyhxSQJ8MdY64COTY9UyZmA7XD4H/M9G3kbiCJgHhrw85Ucrnx7F11uuue344vq23wJFFGGBNgcogCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663916; c=relaxed/simple;
	bh=FMbt3RNtaQwqtBGk8AvCuu6rmeEz1qj0c83Z9BmSNZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl286/A9yKQ42+O4nRH2DlnWhTfte8gK7sY+6DOe7z60Z6BiEx6yR3WLx+LYf3gZ3M2xFWLaxAIw40Lh+Wys/CcsJHybQ748/glFddAY76djxS/+5QPRXxYwH4fQi8G+WbQuST2y66G/IMmYIJn7xpbik3b7J4pzbR0bML09LwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW1/1Kky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6913CC4CEF1;
	Tue,  2 Dec 2025 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764663915;
	bh=FMbt3RNtaQwqtBGk8AvCuu6rmeEz1qj0c83Z9BmSNZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bW1/1Kky2R8cqKGsDU6Zv5K5k6kv9xAEHV9nDV392gLQzl3+nF/kw63bhTzfWvBhe
	 v1KMfUAaLg9h+p0OojpJaOHXPJVC2BKysZ1lLGBUzYMZ7nIgF0Jk8nT7lfWvBZIFS1
	 DGOPOTAN6XDjsIl9zpvK/LuibyRazG9CGOg9UWo9i4Z7tCevdsmuA+BaImFy1T0I5n
	 ml3nVG1OgcviMNauxByv/+L4kgrWoLUFZkiHQ0cpTucey9wFoG6Qy1u+8oSczfKuFf
	 3V2iOgMU0I4v/3OWzhndsL6JM2aRP8sUeCjJub9QxNKhzh7x12eg1QrwTk1LGV/CqZ
	 Rqk2M+yvZJ/iw==
Date: Tue, 2 Dec 2025 09:25:11 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Siarhei Vishniakou <svv@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: playstation: Center initial joystick axes to
 prevent spurious events
Message-ID: <jjdutn6mqboz4wviqvywvt4yxyrq3zco264fifrv34jcue35pv@fr3y7skspevl>
References: <20251111234519.369652-1-svv@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111234519.369652-1-svv@google.com>

On Nov 11 2025, Siarhei Vishniakou wrote:
> When a new PlayStation gamepad (DualShock 4 or DualSense) is initialized,
> the input subsystem sets the default value for its absolute axes (e.g.,
> ABS_X, ABS_Y) to 0.
> 
> However, the hardware's actual neutral/resting state for these joysticks
> is 128 (0x80). This creates a mismatch.
> 
> When the first HID report arrives from the device, the driver sees the
> resting value of 128. The kernel compares this to its initial state of 0
> and incorrectly interprets this as a delta (0 -> 128). Consequently, it
> generates EV_ABS events for this initial, non-existent movement.
> 
> This behavior can fail userspace 'sanity check' tests (e.g., in
> Android CTS) that correctly assert no motion events should be generated
> from a device that is already at rest.
> 
> This patch fixes the issue by explicitly setting the initial value of the
> main joystick axes (e.g., ABS_X, ABS_Y, ABS_RX, ABS_RY) to 128 (0x80)
> in the common ps_gamepad_create() function.
> 
> This aligns the kernel's initial state with the hardware's expected
> neutral state, ensuring that the first report (at 128) produces no
> delta and thus, no spurious event.
> 
> Signed-off-by: Siarhei Vishniakou <svv@google.com>

Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

FWIW, we are in the merge window for 6.19, so unless we sneak this one
in an early rc (which should be doable), I do not think we'll take this
one right now when we need to send the PR for 6.19 as we speak.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-playstation.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 1468fb11e39d..a145b5ea4405 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -718,11 +718,16 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
>  	if (IS_ERR(gamepad))
>  		return ERR_CAST(gamepad);
>  
> +	/* Set initial resting state for joysticks to 128 (center) */
>  	input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
> +	gamepad->absinfo[ABS_X].value = 128;
>  	input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
> +	gamepad->absinfo[ABS_Y].value = 128;
>  	input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
>  	input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
> +	gamepad->absinfo[ABS_RX].value = 128;
>  	input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
> +	gamepad->absinfo[ABS_RY].value = 128;
>  	input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
>  
>  	input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
> -- 
> 2.51.2.1041.gc1ab5b90ca-goog
> 

