Return-Path: <linux-input+bounces-16443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EDAC9B484
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 12:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91B994E02A6
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 11:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EF428BAB1;
	Tue,  2 Dec 2025 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pl+2BtKe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1A201033;
	Tue,  2 Dec 2025 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764674278; cv=none; b=b4YEn5WIWWw9jlrsneAj5YFmwgQISUUwF/s9RFfzWXQV6dlG4TXtpbn2s0LXAWF9KuWbomn6a1NBdfY183tlorMbDij6e5BjX562F/NoIlg3glxm9uHyh3NFJ366lYMIHV/ienfFLIqlPFpeoY/8ro5TCGozfEVZMUlkfD/XqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764674278; c=relaxed/simple;
	bh=Vg/kESYweMbvVR9oNn9OhODE0wOUxGhP+6cW3lG1gzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E73ACkptPfH54eYYV1UtT0TrL3J6GCY/xC8oGE7IsDjztHcDdipoKeWUOM/3GRAjjxu90inBypLvxc8HLovjcBekpuceQz/jregkskYALGPlGTXAQvmafTdOQB5bO7I3BAc8cyy1F8KgYxm8/mss4gWzuUBj5O948l5/Vw2hWkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pl+2BtKe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63676C116D0;
	Tue,  2 Dec 2025 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764674278;
	bh=Vg/kESYweMbvVR9oNn9OhODE0wOUxGhP+6cW3lG1gzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pl+2BtKeg+7K0IOZsHAvu3kO67GiFrl9TSGcWplGmDBF3KNXZX5z48SUtrh70rpmP
	 F/ePS1MNE2UDvdscaCAKGpTjkA61x0C3GtE8dqX/Ak56SZs/odMzlMuZJrS84nvLe2
	 GwKKQGStcaFw/3ooTa3Yq7th9EFPmeQZphs7/Og+9BtSKhJwBAR+aScMoznJZgIEMw
	 nzjnGQ7vtxIZDVQpML+3JTbpe3bisZR+YPYKUVfVvp2IaLAQUHqhz5IPpsJ5rCIfKg
	 kQDzOemk8xTu9q4vV8Zw/o+T4Kq7XcHmRuDkWdqv6GZeF3dtMyai8nGFCoaPxGLKig
	 yhDBX0BTQwfDA==
Date: Tue, 2 Dec 2025 12:17:53 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 04/11] HID: asus: fortify keyboard handshake
Message-ID: <nfshh5ts2e2x45yeact2chs2pmtuan62exsnvpjknyoaqzqpfl@llmdzmurn65e>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-5-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122110032.4274-5-lkml@antheas.dev>

On Nov 22 2025, Antheas Kapenekakis wrote:
> Handshaking with an Asus device involves sending it a feature report
> with the string "ASUS Tech.Inc." and then reading it back to verify the
> handshake was successful, under the feature ID the interaction will
> take place.
> 
> Currently, the driver only does the first part. Add the readback to
> verify the handshake was successful. As this could cause breakages,
> allow the verification to fail with a dmesg error until we verify
> all devices work with it (they seem to).
> 
> Since the response is more than 16 bytes, increase the buffer size
> to 64 as well to avoid overflow errors.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c1a36a8beb35..2a412e10f916 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -49,7 +49,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
>  #define FEATURE_KBD_REPORT_ID 0x5a
> -#define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>  
> @@ -395,13 +395,37 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>  
>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  {
> +	/*
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report. They should be equal.
> +	 */
>  	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>  		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>  	int ret;
>  
>  	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> -	if (ret < 0)
> -		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> +		return ret;
> +	}
> +
> +	u8 *readbuf __free(kfree) = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> +	if (!readbuf)
> +		return -ENOMEM;
> +
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);

Nitpick here: previously we would not check for the answer after the
ping, so the ret value would be positive for those devices where we fail
to receive the handshake.

So basically, there is a mismatch between the commit description which
says that we keep existing devices working when there is a slight change
in the behaviour. OTOH, I guess that if the Windows driver reads back
this value, there are very little chance to return a negative error
code, so this is probably just fine.

But at least we know there is this change :)

Anyway:
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			 FEATURE_KBD_REPORT_SIZE, readbuf);
> +		/*
> +		 * Do not return error if handshake is wrong until this is
> +		 * verified to work for all devices.
> +		 */
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.52.0
> 
> 

