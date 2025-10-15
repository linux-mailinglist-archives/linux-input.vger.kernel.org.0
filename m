Return-Path: <linux-input+bounces-15492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E7BDE190
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 12:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EDE64EAA9D
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 10:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8537631A07D;
	Wed, 15 Oct 2025 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJDcYcnc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207A30DD16;
	Wed, 15 Oct 2025 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525624; cv=none; b=r76oveRygpLC2fSb/0HpgUTf2qkXSbojHvBYg0LjwyGDsY5wUDAfyxIco37uam7DV7zBxJDAwSLPjLmgiRw6DAbKpVDv+wCPqVIJMpguuqWZFBZ7d8bsUBjTl5/tMLQ5YF5KlAaeYO06eY803Iv6jUZbvsaIq791l6h8qxRWStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525624; c=relaxed/simple;
	bh=uc3lnn4q4U9midR6foFDGDfP9rqpKW1jI3q7aR3E5hA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZA7GhwyFacHp0RkS29Uih61z9//gK433MxF2v4dfM/u/aIwS0xbGRgE1a5KJZPiVV68wd+AOSKsTQWbBfpj+pwsyy4C005pvSiskCVzxJV3CeWJg4/UVrHZDmn/9pQHXIlFKTc/h4O65Yezk6kw/rbyK2wC6JwS3vksac+GXFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJDcYcnc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760525623; x=1792061623;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uc3lnn4q4U9midR6foFDGDfP9rqpKW1jI3q7aR3E5hA=;
  b=TJDcYcnckPt5HDdipvltGsWOIYmu52DaNJQ37XFgAiNCCt12qST62P3n
   1fEFT1SQnQg3SQnUJk6UQt1BQ94lrZb4tbt7UyYs5jz9zV5BSJia1qVxG
   JqgcqY1T0UZfLi490K2NZtDFGyjc9NuPDMV+bw7bPRCLg/2u43PRI/YFs
   RFt02JICxMgSTaocPAvp9xepEaqQYDW8+L1SNrWAXLZwwaQ3Jv4EMmAR7
   2Q6VvcBfKBVQoNcj6hi97TKZGI5SmekgWX9DZygPMQ4SK8L2llxhCnnyg
   1AxKrKUN+rFV/pb757xdAFLoYuEzeOyeHHwDsldWd08yKtbX1paLgRcQu
   w==;
X-CSE-ConnectionGUID: dykEzec5R+eeWoQ0h41Htw==
X-CSE-MsgGUID: cmbnNau0SNmxvxl37hd2nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62739484"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62739484"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:53:42 -0700
X-CSE-ConnectionGUID: H7d+BQD4TamvViAil1ikjw==
X-CSE-MsgGUID: cxSTNH1/RjmPBagKDxWe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182606400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:53:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Oct 2025 13:53:34 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 1/7] HID: asus: refactor init sequence per spec
In-Reply-To: <20251013201535.6737-2-lkml@antheas.dev>
Message-ID: <3d59f42f-2e24-6011-23b5-369be7eb4b3b@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-2-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:

> Currently, asus_kbd_init() uses a reverse engineered init sequence
> from Windows, which contains the handshakes from multiple programs.
> Keep the main one, which is 0x5a (meant for brightness drivers).
> 
> In addition, perform a get_response and check if the response is the
> same. To avoid regressions, print an error if the response does not
> match instead of rejecting device.

I'm none the wiser on "why?" question after reading all this. Please 
describe the change properly. Besides, you do many thing changes which are 
not mentioned here at all.

And what "spec" is the one you mention in the shortlog?

> Then, refactor asus_kbd_get_functions() to use the same ID it is called
> with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
> in the future.

Can this be in own patch?

> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 91 ++++++++++++++++++++++--------------------
>  1 file changed, 48 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a444d41e53b6..d0c783df99bc 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
>  #define FEATURE_KBD_REPORT_ID 0x5a
> -#define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>  
> @@ -393,14 +393,37 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>  
>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  {
> -	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> -		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	/*
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report. They should be equal.
> +	 */
> +	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
> +		0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };

Why was layout of this changed?

> +	u8 *readbuf;
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
> +	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> +	if (!readbuf)
> +		return -ENOMEM;
> +
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		// Do not return error if handshake is wrong to avoid regressions

This driver so far is using only /* */ comments.

> +	}
>  
> +	kfree(readbuf);
>  	return ret;
>  }
>  
> @@ -422,7 +445,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>  	if (!readbuf)
>  		return -ENOMEM;
>  
> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
>  				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>  				 HID_REQ_GET_REPORT);
>  	if (ret < 0) {
> @@ -638,50 +661,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	unsigned char kbd_func;
>  	int ret;
>  
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* The LED endpoint is initialised in two HID */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> -		if (ret < 0)
> -			return ret;
> -
> -		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> -			ret = asus_kbd_disable_oobe(hdev);
> -			if (ret < 0)
> -				return ret;
> -		}
> -
> -		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> -			intf = to_usb_interface(hdev->dev.parent);
> -			udev = interface_to_usbdev(intf);
> -			validate_mcu_fw_version(hdev,
> -				le16_to_cpu(udev->descriptor.idProduct));
> -		}
> +	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -	} else {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> +	/* Get keyboard functions */
> +	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -		/* Get keyboard functions */
> -		ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> +		ret = asus_kbd_disable_oobe(hdev);
>  		if (ret < 0)
>  			return ret;
> +	}
>  
> -		/* Check for backlight support */
> -		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -			return -ENODEV;
> +	if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> +		intf = to_usb_interface(hdev->dev.parent);
> +		udev = interface_to_usbdev(intf);
> +		validate_mcu_fw_version(
> +			hdev, le16_to_cpu(udev->descriptor.idProduct));
>  	}
>  
> +	/* Check for backlight support */
> +	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> +		return -ENODEV;
> +
>  	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>  					      sizeof(struct asus_kbd_leds),
>  					      GFP_KERNEL);
> 

-- 
 i.


