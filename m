Return-Path: <linux-input+bounces-16173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325AC694AC
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 13:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6590A2B11A
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 12:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB5633F8BF;
	Tue, 18 Nov 2025 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1mK4OPh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C034EF17;
	Tue, 18 Nov 2025 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467838; cv=none; b=a14lW8zOzeH5u+V8g9pThuDqqp2EHbeQCFMY/siOzzdxqRmyVr76UCKD2nSmZ3PTjDy53UrZeNGUPCFTSul8Gp6gHDMAXU+SvP3z+NuzhDXGq4qnBTAu8XVi/pbX2CazRY7a0FJVTs55CDKxf92T1yodwap+ZEN2N5uAfvWSrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467838; c=relaxed/simple;
	bh=PiFZOw0/Xx4AvtPlCNs7dAU/S0CFTOOStCgj1mFItks=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kuk0s7sUqbHTZJQAeSajXtn4stPqKnsBaZRr4CarT1zsGXV9HsSguXYlwps0AmjqSdwiNcBm4wGVL7nRiChyoMytpH6ga4lrTh6VDnxYYY9xCe74QgH6l+EMH3LRIAxdLBSXI6BLzblkH15gpmQgL+QF/B1OM6TbJeWh2+ZXXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1mK4OPh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763467836; x=1795003836;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PiFZOw0/Xx4AvtPlCNs7dAU/S0CFTOOStCgj1mFItks=;
  b=W1mK4OPhgULUVmlPlIO7aS/hjmKZb+hwReJBll5JcE+kH5K0sAht9SyQ
   kOacz1X//27dnU/suY9ls+l3lsVsj74W/hTf7fCTAtEaXuAsjTQF+Gtdx
   LJpOXpF343EPxhmaso5leIiGOhEH2TbzSEchZrAMQema5b3lKymltsXcE
   Fm6Rd0VBfovwcniLAPaDrJP50S5sIU0s9q6djsaSLWAv/44qBCPA9Syfg
   7adPIc9dfUl6FcoHbT0234uGHwPaoBLVi98OCAFt6bSsJHAhyFm3hDCaZ
   lO7iH92Bpx2GWskTo+iS5kkZozIZhU04TakzYCbH2IkQXHcUbV7JBFxlr
   w==;
X-CSE-ConnectionGUID: 1dkFGnyIQb6QZh+b+8Vkiw==
X-CSE-MsgGUID: KGJgS+3/TQqf56ftWzBE/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69339111"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69339111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:10:36 -0800
X-CSE-ConnectionGUID: ruLnQxK3TW2ofDvRmk7UhA==
X-CSE-MsgGUID: dOzivj8sQ6uMrxARbPOseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="214132200"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:10:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 14:10:27 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for
 old NKEY keyboards
In-Reply-To: <20251101104712.8011-6-lkml@antheas.dev>
Message-ID: <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev> <20251101104712.8011-6-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:

> These keyboards have always had initialization in the kernel for 0x5d.
> At this point, it is hard to verify again and we risk regressions by
> removing this. Therefore, initialize with 0x5d as well.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 726f5d8e22d1..221c7195e885 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
>  #define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
> +#define QUIRK_ROG_NKEY_LEGACY		BIT(15)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> +		/*
> +		 * These keyboards might need 0x5d for shortcuts to work.
> +		 * As it has been more than 5 years, it is hard to verify.
> +		 */
> +		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	/* Get keyboard functions */
>  	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>  	if (ret < 0)
> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },

You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remove 
+ add back in different patches.

I suppose the cleanest would be to add a new patch as first which moves
asus_kbd_init() outside of if/else so you can make this refactoring of 
FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.

I note there's still contention with this series overall.

-- 
 i.


