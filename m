Return-Path: <linux-input+bounces-11244-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE23FA706ED
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7083B1587
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 16:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6984D25B690;
	Tue, 25 Mar 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCAws/4E"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C278F24;
	Tue, 25 Mar 2025 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920060; cv=none; b=kH8bF8Qiav24USWe5aow77c8+F1joYi4jDmcld3W1AJxTPu/481XslzLVEFyMzRgXnerl0o80WMFbmXP2+R4ZJJO9IKQNWtuuyGvkrdjbopA5UVmFVwplvbWYsofDB+0iYkZrTDgcWB1F23BEU9aGI3amaqnTFBIW8cCagluZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920060; c=relaxed/simple;
	bh=tJlzdJvvn50GZ/sbX4QRHPW0Nvdqdn08rXhb8dievTU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Waw577t5iKuCX60cZlBrHfTcyvLYAJ3SEf4f/alVycSF3wtzolj3BnzkB0ZUFx7tNouvRy4WUqOrioHwt1pI4jWADg5H6mvIuGZ5hMZW3+IrCaNrHg36iHUxczt4OaDJAlRCHWT9Hkmc5JOK1xAJG4mRqxfN3QyaJvwufybzQXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCAws/4E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742920059; x=1774456059;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tJlzdJvvn50GZ/sbX4QRHPW0Nvdqdn08rXhb8dievTU=;
  b=bCAws/4E9ib38y7qMMDBJ6YcVW+h3IRcSgbLZhxH75NlvXzzHcttGNFc
   K+duQkWCKXu5BuEp9JeGvae5U8VNONv7kHaS7V8mdO/5Y7PG6splC+CFf
   1Gi4Pfs905evPkDkHl8N2Zcj2sqOex5bugjHFGAZ0yFRl1lNW+Uq5abBN
   wpnJB9DRuasyx+JkzUsp+Gud8bNmGKb8elf1EHgCnz8D6HQc2zHgM/E4B
   JdyVWYW72k0x2nO7m5By+raPsc4lZdxH4SeG4+dJM+Z1Nst4CQq3j0VDt
   KVGmj7HkDc5tqJdWAN5NZE4SpJ60IboyFcCZ5b1dg+wSnCmTa/Imj71c1
   Q==;
X-CSE-ConnectionGUID: itrhp2V/Sv6SoKXnbNp9bA==
X-CSE-MsgGUID: qFserG0hQImZK1JLkR3Row==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44103870"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44103870"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:27:38 -0700
X-CSE-ConnectionGUID: 0935cxWlRCaJvTpWnVRpLg==
X-CSE-MsgGUID: H0iIP9+XQFyod2BiBEe8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124402118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:27:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Mar 2025 18:27:31 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 01/11] HID: asus: refactor init sequence per spec
In-Reply-To: <20250324210151.6042-2-lkml@antheas.dev>
Message-ID: <9ab75a7e-621d-1fb9-fc16-0a837d5c27ed@linux.intel.com>
References: <20250324210151.6042-1-lkml@antheas.dev> <20250324210151.6042-2-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Antheas Kapenekakis wrote:

> Currently, asus_kbd_init() uses a reverse engineered init sequence
> from Windows, which contains the handshakes from multiple programs.
> Keep the main one, which is 0x5a (meant for brightness drivers).
> 
> In addition, perform a get_response and check if the response is the
> same. To avoid regressions, print an error if the response does not
> match instead of rejecting device.
> 
> Then, refactor asus_kbd_get_functions() to use the same ID it is called
> with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
> in the future.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 46e3e42f9eb5f..8d4df1b6f143b 100644
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
> @@ -388,14 +388,41 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>  
>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  {
> -	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> -		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	/*
> +	 * Asus handshake identifying us as a driver (0x5A)
> +	 * 0x5A then ASCII for "ASUS Tech.Inc."
> +	 * 0x5D is for userspace Windows applications.
> +	 *
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report to verify the response.
> +	 */
> +	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
> +		0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
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
>  
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
> +		hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		// Do not return error if handshake is wrong to avoid regressions

Should it be on warn/info level if the error is ignored.

> +	}
> +
> +	kfree(readbuf);
>  	return ret;
>  }
>  
> @@ -417,7 +444,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>  	if (!readbuf)
>  		return -ENOMEM;
>  
> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
>  				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>  				 HID_REQ_GET_REPORT);
>  	if (ret < 0) {
> @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
> +	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> -			ret = asus_kbd_disable_oobe(hdev);
> -			if (ret < 0)
> -				return ret;
> -		}
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
> -
> -		/* Check for backlight support */
> -		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -			return -ENODEV;
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


