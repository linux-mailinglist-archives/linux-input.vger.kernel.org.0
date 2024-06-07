Return-Path: <linux-input+bounces-4239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC06900E6D
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 01:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310022841C5
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 23:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEC678C95;
	Fri,  7 Jun 2024 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="FaO38iqN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iOQRv3OG"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7745A1BC43;
	Fri,  7 Jun 2024 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717802679; cv=none; b=pN4OMZdhvsMj/saoZjoqiPk37BUq/AjjllZXwgoy8zGN5BXI90ou/uEgxZaMia+n9sP0pFHBMJZzW+DKIwiBxEDHajUEAMSULrHZ3hSiJ+vYvFpR717PoyeGLI6wOpP3Scune5hIf6PcBTr53ZunRKlgJLXzLPmuwbfMWczfNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717802679; c=relaxed/simple;
	bh=zIeqne16BwDiZQ1VqsqawTkYKwGdDB54W8llrRudiuA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=DdFTqkvGlKiLPUNltjfaQExmmUz9CLaVWgT/zFLX9z7CJBHbo4FXsJVmhrMn0ACaWU3VAiISYbpzEmqvoBfcblsmdV3GVE4VZ7dyCk2CQhxZmzGVhjnTUqJJ2tfZfPDuR2zqHKtMkus5K9sLRiOq9SXuLfuXm9anBSJii7Q8rFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=FaO38iqN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iOQRv3OG; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 658DD180010B;
	Fri,  7 Jun 2024 19:24:36 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Fri, 07 Jun 2024 19:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1717802676; x=1717889076; bh=D3BVDpFGac
	nL62lkOUcLI8ChMXesyNkzJLZOKjAF7kM=; b=FaO38iqNKFOQXD5ozxJmCsLWUn
	aJFZ6uCT4DtWJ+rUL6MvWZt+om/ovudqCWC68rmxt2S8INXIGOuStFHsUnh5vIji
	rOdxRTbwHL6UWlB+w6MMtqcxhXATQNzOP17aQpvgkMi/kKFh/jQiW9nP9o0fMr1a
	7UVwlhh5s7PO2kX8bFHAdzA7JQdPpwk6XSrpFTv0BN0QRuvxs97yHJ4EvwIEBzmQ
	2WIh5xZhHi+P/0GE9Ften36HaSzZHluP5l7bt9tCPRcxeZxAMIN8ctS4fOcGR6PP
	c4Vsv1a5gafQDeKG84QrUGzzx4oKrix9mQ+BqG4KXTGez34g+wfOu/L514hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717802676; x=1717889076; bh=D3BVDpFGacnL62lkOUcLI8ChMXes
	yNkzJLZOKjAF7kM=; b=iOQRv3OGdYiw5MU8hheyjZLWdZ7aVSSgtJruv4wXtO9l
	eoP4zX8IofklGus8JtwY9StFtw8R0ggKTo8UfA5dUaZxRRtSL11aZtiSUPZ8A5Zg
	NIw1m8KjD8ElUhw11TDGb3fUevCyRg7llkjqv8m/SZStITNOjno4TaX6aH8lYXfw
	JM8hT/7M0eEbgdJbLRd0zVd+E1GkxL7Jb/Kx7NDGHNx5icSF1LSO5UsaGCXhRHi8
	P58Ex4lDZcAOAcJdddB/9YyK/uwxXAxhXc6EIyvJ7RrsYRtyqwVdFnHx4e3FUYk0
	NNQtmHu5VHBH4EB9efMcbOLTwZNQimHviSKr/sAbAw==
X-ME-Sender: <xms:s5ZjZl_PPA21X50Zjdur1c_lqHxrdL2T6IrxdEv-tXEmATqqyDQ5hQ>
    <xme:s5ZjZpvBvRoHlmgoWjUPHyGZna3R4nFvMUwoYmgwnINJM-Mzj8rBhNthl8a2bzy_X
    JVMF7fNmYe9vgBIbQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtvddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfnfhu
    khgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtth
    gvrhhnpedutdelgfdvgeekueeuteevffelfedukeeitedugfdvtdeutdetjeduudeuvdeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:s5ZjZjAJAbskuz5giznyezVHHBJ-66dPU8cUiLfNnSi8HMawaZQ75g>
    <xmx:s5ZjZpd11erRylIrkE3X5BpdZgmm5pfGLiaBgHAjEs9c3of339KxUA>
    <xmx:s5ZjZqN_AFrMln_fBv9apBfbWyvEHqWKYwPSEiSOYj3287aLmM8gag>
    <xmx:s5ZjZrlmDUrNMPMUtZhjkxZYFzs7khwru6GYVCN3gEZOlVsknVvh8g>
    <xmx:tJZjZja-sFVJw9rumwGHcakArg6b23QWCf1XMowcF3o7FdXiUunAI0qN>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C03572340082; Fri,  7 Jun 2024 19:24:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <dd0a211a-bef1-4eb2-8d1f-2d63799af94c@app.fastmail.com>
In-Reply-To: <20240607040532.1074379-2-luke@ljones.dev>
References: <20240607040532.1074379-1-luke@ljones.dev>
 <20240607040532.1074379-2-luke@ljones.dev>
Date: Sat, 08 Jun 2024 11:24:14 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Jiri Kosina" <jikos@kernel.org>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hid-asus: use hid for brightness control on keyboard
Content-Type: text/plain

I thought this was finalised but I'm still getting conflicting reports.
Please don't merge until I confirm the fix.

On Fri, 7 Jun 2024, at 4:05 PM, Luke D. Jones wrote:
> On almost all ASUS ROG series laptops the MCU used for the USB keyboard
> also has a HID packet used for setting the brightness. This is usually
> the same as the WMI method. But in some laptops the WMI method either
> is missing or doesn't work, so we should default to the HID control.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
> drivers/hid/hid-asus.c                     |  7 ++++
> drivers/platform/x86/asus-wmi.c            |  3 +-
> include/linux/platform_data/x86/asus-wmi.h | 45 ++++++++++++++++++++++
> 3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 02de2bf4f790..0ed3708ef7e2 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -492,12 +492,19 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>   */
> static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> {
> + struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> u32 value;
> int ret;
>  
> if (!IS_ENABLED(CONFIG_ASUS_WMI))
> return false;
>  
> + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> + dmi_check_system(asus_use_hid_led_dmi_ids)) {
> + hid_info(hdev, "using HID for asus::kbd_backlight\n");
> + return false;
> + }
> +
> ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
>        ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f9b6285c9a6..799d928c7d3d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> goto error;
> }
>  
> - if (!kbd_led_read(asus, &led_val, NULL)) {
> + if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> + pr_info("using asus-wmi for asus::kbd_backlight\n");
> asus->kbd_led_wk = led_val;
> asus->kbd_led.name = "asus::kbd_backlight";
> asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 3eb5cd6773ad..6ba0015e4386 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -4,6 +4,7 @@
>  
> #include <linux/errno.h>
> #include <linux/types.h>
> +#include <linux/dmi.h>
>  
> /* WMI Methods */
> #define ASUS_WMI_METHODID_SPEC         0x43455053 /* BIOS SPECification */
> @@ -160,4 +161,48 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> }
> #endif
>  
> +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> +#if IS_ENABLED(CONFIG_ASUS_WMI)
> +bool asus_use_hid_led(void);
> +#else
> +static inline bool asus_use_hid_led(void)
> +{
> + return true;
> +}
> +#endif
> +
> +static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> + {
> + .matches = {
> + DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> + },
> + },
> + {
> + .matches = {
> + DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> + },
> + },
> + {
> + .matches = {
> + DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> + },
> + },
> + {
> + .matches = {
> + DMI_MATCH(DMI_BOARD_NAME, "GA403"),
> + },
> + },
> + {
> + .matches = {
> + DMI_MATCH(DMI_BOARD_NAME, "GU605"),
> + },
> + },
> + {
> + .matches = {
> + DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> + },
> + },
> + NULL,
> +};
> +
> #endif /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> -- 
> 2.45.1
> 
> 

