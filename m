Return-Path: <linux-input+bounces-3930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4DE8D2A04
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C1A281F2F
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B642C15AAB6;
	Wed, 29 May 2024 01:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="XcXcHwRX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MZvuoPm/"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB687F6;
	Wed, 29 May 2024 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946248; cv=none; b=se2UxX4DsgmNpRHYCNcNIlOZqAytkwPpvSwHt3hnnipnpexG5d5IXhjY/0TJaQ9mVlo1I7kRkwr3Y1KoV9K20XNgD2FijmudUtXYrZvQ/JrON9sSeYzx6h7vkR/4g1Y0Xigi6XBiKYIJqJKEhP72TUrTGct0pi3QTaga7rfiH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946248; c=relaxed/simple;
	bh=Zxowav663I4us3VlL74j5SzvZntOcAZwBh3FnfjX6mk=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Ih0tw7z9mSZfDgxZKlhnApdzArz8wBbh1/g+CQCJ8Ky5eem+f+BkV88BlW1TjDPB5BLw8J1zLMHsm0DSdxTlK/CaJKY+sAFxnZqa6BrNfiLmdSa2M46TwtHIzjCvN+MsQBtm0Y7K4Oqtb183uDLwdp9CCDGSvZwwVoNfwzI1DLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=XcXcHwRX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MZvuoPm/; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 18CF21C00190;
	Tue, 28 May 2024 21:30:46 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Tue, 28 May 2024 21:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1716946245; x=1717032645; bh=b+Ph6oLBNu
	d09yeKziOGHOeZzPdVlwgT/NYdwJyJwDc=; b=XcXcHwRXWdw+cGws0gjW5HMN/X
	JgiA0zx3fiOoMp2sZn82GHBKG963xwnaUgs7LMe/VeDepST5FvegKWJaVJqem1WF
	eeSrERESb1CkbWQu9HRaRELmyTLMRgCzyINNDqkn/gyvZXUSzlQ1X5b1NJ7K77Ao
	8/EQUW5tppNiLlibAErE9kFR15B68tUTOwQvUua3tQ/6xf+YAyZZLnmaYbaWEZw0
	TQakQr9WW8lz8Uki931s4e9q00+8lrihGzyLyxzW/cEx62U4hsAS5MFYXedUj+IR
	hBPV2rU7+EGOdrBGmW2ZkiBYBzpBMd40biSJGQEZJSgcRC6f5pFdjbVihhtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716946245; x=1717032645; bh=b+Ph6oLBNud09yeKziOGHOeZzPdV
	lwgT/NYdwJyJwDc=; b=MZvuoPm/2aY3dqSWunai1Nr0VkKYDCg/L7o48vZov6vo
	FFn3ud2Wu0mq+aXSmEoL8tABaSzSW8QfkNuciUrqbPruJONox10JAJw50/sTNX6q
	LRpyWop+8/vGjt6PmNJrHkhiY4k7GejCf+4DYkYIY5QvON3oYo+8Cik8+WBujGRn
	fr7GBL8ymDuebIl+/7ub9mjPFTdw2VlBlyIB1Q7EIE9DX6hV7Pg7NU+1fTYft+NY
	T809Gcxu36yNDYpXN3FeqF2hNyoG5mHlTK7Pkp1SPWsDS8w8WIlALftaDhvq359U
	DNS+qk0oO8ev4v9wadWW/vhaxo7jp4d1Hx1L5U18zQ==
X-ME-Sender: <xms:RYVWZlrPUZ8LxAHXXgJz6t1MMPgyVgXDhCgvTMCXczFXtVfbaXkRIQ>
    <xme:RYVWZnpBDtEEkgokPX0Jaki6eupWjsIv04IT5m9_ud7vAeLCLWu8-ih9q8bZzuugr
    2fsfJBUe_nlOG6Nms0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfnfhu
    khgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtth
    gvrhhnpeelffevveffhfeuteetteevteelteduudfgjedvleejteetlefhieeiudfgveel
    feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:RYVWZiPVvfGozuM2YK_JEDE--85jLbd2E904Bj6M0tJkes_8Yu1djw>
    <xmx:RYVWZg6eeJYLioh7JlYLlmCYHs0LINHV-o4JTY1al1pnuvBtN_krbg>
    <xmx:RYVWZk6kh4SEO78lRHG29cZ1qC3Kd5PAkveIXAxjZKzWoyt_8oUMzw>
    <xmx:RYVWZoilLehXndgvcUKzL4BlWVTLqvT5Ymr6G9dTC8iF3h1FLDFQzA>
    <xmx:RYVWZhu_mXetrOLay7fc5IGoYLl-jGPuxQSxcKKWfP7b7_IkqAtoFxfT>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6C8322340080; Tue, 28 May 2024 21:30:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ea9262bc-3b5a-4f7a-be99-871361a544e3@app.fastmail.com>
In-Reply-To: <20240529012447.145088-2-luke@ljones.dev>
References: <20240529012447.145088-1-luke@ljones.dev>
 <20240529012447.145088-2-luke@ljones.dev>
Date: Wed, 29 May 2024 13:30:25 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Jiri Kosina" <jikos@kernel.org>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH v1 2/2] hid-asus: change the report_id used for HID LED control
Content-Type: text/plain

Sorry about the doubleup. Wifi is spotty and it looked like the initial send didn't work.

See https://lore.kernel.org/linux-input/20240529012827.146005-1-luke@ljones.dev/T/#t for cover-letter

On Wed, 29 May 2024, at 1:24 PM, Luke D. Jones wrote:
> On some laptops the report_id used for LED brightness control must be
> 0x5D instead of 0x5A.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
> drivers/hid/hid-asus.c | 26 +++++++++++++++++++++++++-
> 1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 4cba8e143031..ec3556cc4eef 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -94,6 +94,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  
> #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>  
> +static const char * const use_alt_led_report_id[] = { "GU605", "GA403" };
> +
> struct asus_kbd_leds {
> struct led_classdev cdev;
> struct hid_device *hdev;
> @@ -101,6 +103,7 @@ struct asus_kbd_leds {
> unsigned int brightness;
> spinlock_t lock;
> bool removed;
> + int report_id;
> };
>  
> struct asus_touchpad_info {
> @@ -473,7 +476,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> static void asus_kbd_backlight_work(struct work_struct *work)
> {
> struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> - u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> + u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
> int ret;
> unsigned long flags;
>  
> @@ -513,6 +516,23 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> }
>  
> +static bool asus_kbd_is_input_led(void)
> +{
> + const char *product;
> + int i;
> +
> + product = dmi_get_system_info(DMI_PRODUCT_NAME);
> + if (!product)
> + return false;
> +
> + for (i = 0; i < ARRAY_SIZE(use_alt_led_report_id); i++) {
> + if (strstr(product, use_alt_led_report_id[i]))
> + return true;
> + }
> +
> + return false;
> +}
> +
> static int asus_kbd_register_leds(struct hid_device *hdev)
> {
> struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -555,6 +575,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> if (!drvdata->kbd_backlight)
> return -ENOMEM;
>  
> + drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
> + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
> + drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
> +
> drvdata->kbd_backlight->removed = false;
> drvdata->kbd_backlight->brightness = 0;
> drvdata->kbd_backlight->hdev = hdev;
> -- 
> 2.45.1
> 
> 

