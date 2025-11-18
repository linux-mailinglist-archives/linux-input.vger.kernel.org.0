Return-Path: <linux-input+bounces-16199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7AC6C09A
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 041703521AD
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 23:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167683112C0;
	Tue, 18 Nov 2025 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKIaa0in"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C072F5A06
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509419; cv=none; b=YQfvyZYExjgPJqGVSnr3f9cBmcpmsh8QdTh/ag6/8P8JJ8thlA+5APTyrzokkxcBu/1VCTS7Cdo8n+vAHouOZuH0553Wh7S18iawE9xAB0nWxTkhZN8fEnz10LkAoL/4Rw1UtRE3gKbR4IULGDycK8ye3aPCXhA4mssLQW9yz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509419; c=relaxed/simple;
	bh=KRxJp4oqZnN0m8G2sNvQV0JA2QLdsy09RKAgqURSOaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANcTwfYfX4zDGkKJQbSC3klQyX7Gxq2RC/xyX2Q8ejOEwx2wP6TOCcsqM+QY2OKUROmCO3xe/B6HfmczlJaXALWddsnNlTMQR1I2VRwGAFKLVo+wQ35EyabAi/Ph9cbHaWNUsHON2q0umw70hUTBwRoTz3voeLZm+e/iWhzJe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKIaa0in; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a637712so25596855e9.1
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 15:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763509415; x=1764114215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkiUduVyh4bpWwTTiLv09ZNzrBmsb5PcGluQvqo0dQg=;
        b=SKIaa0in3gi7gMigQl2S/ibt/kkYXZAec8oTmogA470qLU3229PpX7D25jtIKtmeFT
         xukexGYm70UHrEzuRO5CHLSsu7dtr06XOonL0pi4pbrUKE5PCNVRcI2KNh+40ZOqiA8U
         88ot0aQlw9R2lZdD4BCVW0i7E9fm9mw8XB5sy1HapHjKUNi47pFVb9GF2ob8U0hWg1bx
         JfEb/mm6fKXs8+7weoErPvS9dchpIf/rt/cUsMQUrB87S0MC/MfOHH+mkC/MqD6FQMAA
         GF3EvCCxPbwYVXPu99mErFkNZ0k7mPX/pYLcH1+sCMiQVmvEdqkeyUnm44aWa7g5r8sf
         zKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763509415; x=1764114215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkiUduVyh4bpWwTTiLv09ZNzrBmsb5PcGluQvqo0dQg=;
        b=giq28YVyYDm9sFi0wZog77DZUwZW/3OOijHyz6uqsSgpjYK9ZZPkWBUM76Zqt6FIQq
         p1zIcScFGK4kMWh3FKIVLdIFgtjn6GUOYHRb/oAh97E58PUOAIWfsCm966NxwRw+JtYy
         uNitaDw3o7NwhAfyDYYD3wYL2g3bsQOTvu0NtkbFrGhaSDce6cQ4S25aR7AmgMJSGbKS
         GI7teisdM4IpFHrRplOKOz4m9YYz3uevOT+TON3+9NSBdon4BL940wytz0vjZxc7LDvM
         Pin3GzkjC3FDwCVv52Sc6HgqFN9DcR1xgFq+i+lxqDPs4KFILiiCGvaAqLX4o+jN28TU
         qR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYFJEyJgLPgx87EZgaJz2IppV4VjE+Yjzs0f7k/kE4ZbYeBVJaLkm1ADmWv0oc9vdo8ZFH9YMW+KyQ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTfg0rbo6NYUha5fjHwwdh+kg74hkVfFFOExnkKL0qHXp6jjhw
	SibMwgsWUWXlqzEfXOVqqgUAR/PUjRg5/Ttv73/toErcnp1DS8vsvvgI
X-Gm-Gg: ASbGncs3e/9LTOGOMCNaiQRo83El4lUUEX/wg5G1le5O4TtGSNzaUvFiX4j8QdsIgkL
	mYZmEbM/aeuk+r2MtAsdNE8FwtOs6jq0a2+FmHKBuuv6pVgr+cI0LKYW6FPwjesZMnlrRI5gJTC
	bKpf7L5HcL9tfIaze0hUnAJ0B5Tj0WKlZ/xvozeVPxDHsGSUwCpRgempoWHZRPF68Nd80lPDL+g
	Z4a3GyCLcp75S+jD4dRlZZxLXC7tYZ9QQHtPmPQm3TfoDWBSNNNvWbbRu08U4nBobsYzsY/5EEE
	H3TdvDBgpB4koijHXGtyI3rxfKcwDxq+xUCocgO7dd0LLd+Gpei/8o15/WEld3y1NAGcA66N2RO
	wI4YZ1DitqsF6+x9evcItfrC3W75o7LUI5OqybHMtNjC78HwXuQfR/+xRTafQFREv/Ov2AaxAR8
	6WF7mZEeMwM1HOkCwv2bPa53o=
X-Google-Smtp-Source: AGHT+IEpttPN9NW87xtKijYXHInJAC9nSR6e8xX5mZwxo9mPWV0P3OC0k/e9lHBFsVs5ZBpI/5JEAg==
X-Received: by 2002:a05:600c:1c0f:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-4779cdbe7e1mr127734255e9.7.1763509414479;
        Tue, 18 Nov 2025 15:43:34 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm34548801f8f.11.2025.11.18.15.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 15:43:33 -0800 (PST)
Message-ID: <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
Date: Wed, 19 Nov 2025 00:43:33 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-4-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251101104712.8011-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/1/25 11:47, Antheas Kapenekakis wrote:
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
>  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 4676b7f20caf..03f0d86936fc 100644
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
> @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>  
>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  {
> +	/*
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report. They should be equal.
> +	 */
>  	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>  		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	u8 *readbuf;

__free(kfree) = NULL here? Would simplify the code.

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
See comments on patch 1 (also reported below): not sure if others
report_id are going to answer, my guess is that we will have to try
if you choose to go that route.
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		/*
> +		 * Do not return error if handshake is wrong until this is
> +		 * verified to work for all devices.
> +		 */
In review of patch 1 I requested this function to be called with more report_id
than just 0x5a so this will have to be checked against those values too.

In alternative you can fork based on the report_id, but having confirmation that
this is valid with those ids too would be of great help. Perhaps I can help you
with this asking to asus-linux users.
> +	}
>  
> +	kfree(readbuf);
>  	return ret;
>  }
>  

