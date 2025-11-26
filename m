Return-Path: <linux-input+bounces-16370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48085C8BC7D
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 21:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E3F74E3EDC
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 20:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE06341050;
	Wed, 26 Nov 2025 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvHRVCYS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B8340A79
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187782; cv=none; b=L1uguoBumNfylGFgc2TVHRB9catIISuvWSiGP057mDUe9hTYggrELTvBrVA9VWgFiqbRKKt7lcnpgAkmNngdQGsD7ArFWyCaDBAy1pe3XX1ZMPaNOkmnaVh3Lex8VVenngq9A00shx7xc/HwWQT3IlEJixfT6sD+y9+uiBsPrcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187782; c=relaxed/simple;
	bh=CqBgh0NfMOWFNQ99RGxFMKMqRNLUuKtUjLxVDeHfBl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqpztuw9taDypMGvK1zyzjAtvnp9hpu1NNN95wcdkNODtOkSWqEaGezcZfVD3MxDU8igtMuM3skUKmRMsYLsqeb/rm7vH+EP+6zdH58pe5dhl+TzhmoR7gyDJDptMjhwh3iLoZ3axJaTDGGJIVCWD+FzNT/aRdwWycll83OpKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvHRVCYS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32a5494dso121966f8f.2
        for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764187779; x=1764792579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFWIQEeWmjjWkOuXAEfNPx8P9RntOrfIpL+mS7UhVYg=;
        b=GvHRVCYS0lAOp1DFWy0ypuSlnJZ1yJCBq2UUpaEkM/j6hPRZ4+eYYEwuTALyS3a2F+
         BFDAN5yCN8uQvFvj2BEr88n8lXIQjQ0509HmSQLoaU5McNW1MxE3nY/bCx7qkOu9jmAt
         WvegClbqtw8vuuUcaIwggvBxayIxhNsXzHnklQiRkfQKYqjZeCW3iaShiBFkBwGf//tC
         qoZyRsGqAUbz53Jy/xZ733l7T6XLGFmfkhl93G0459tpN+QyOXk/TMHfhqb/cSRrQ6wZ
         B5gY2DZy1au9yms3ba3xJgXI7BCuvi/TfjdhYmbji4f3qdgmSK/LEOu3R4qvzk/tICeS
         NtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764187779; x=1764792579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFWIQEeWmjjWkOuXAEfNPx8P9RntOrfIpL+mS7UhVYg=;
        b=J7YxMG4JKfvhGc6P5IG3QzchvOQXLxGWYYHpfPwwhHGE934GG8wQrz6Otwq5hn6Gcx
         Mv2eJWUEOQHu78zHdE8weISFt5i3M+/cqczA422vimeI8woAMWZkSb24Kh3X2iBqKa+B
         A+X5lmRcsDYRQsNc5Y3G50Qg1hBg9C6qsGIClpwW9xxdWqAR/SowwrMdo6c/5XNGKY69
         F+in2VhhBJhAHr/fjER05w1arVIv1bkfQunkbiJyHCYgyuk0bgyIDOpbNM2qL9TEx6xU
         r67xLCmAksdsBEVhfnYswCooyZ15dJSu7OYKBeg9W5ZarRD7FZWpVYIYITxkEbHANQek
         C+kg==
X-Forwarded-Encrypted: i=1; AJvYcCXpNIKSszxex2hXM1wGA32tURAHx+7V2/vgf/iY7c7eQFFfRR2rzCyyEIyQK8bXURMDe77HmpucqsLeCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8Rr4hJJKHcYF9RR93kCMmX1S6ZwKSDjl8S2yRcvqyCh9VRpq
	jh6aKXjnr28PZUljWmZcIA5aYnUN43ywrp69kpYnaTwsa9Aqk+Lxj7Tn
X-Gm-Gg: ASbGncuWPUXJ8vbjKipNek7Ctub0uct2Efszajpoy4gaH/xo7nwctTdh9sH2hpoy+0S
	ogyrtF0GnwJNP3XDj0zBLSDnf6SOPa4xjzxBtT6cvyoMrdXCGOPQcrzsLnWusfUyZpYCZfCHXqU
	90h2Es0zXg9yHkjk4VRLAHJ0tWJLHGgdjZY4UFfi0skUc4yXVub0nj58xII9ugrYEytKDlhLXpO
	oIecfKTG0zjMr1i5b8BCszhssLVRlaXaMER64NvT3rVAAUZ9371FNuhq1u4J0X5tU0Jkh2Rl9o1
	ypwpXF3RKsGOmuWsoNIYUUTB6gZIlNd34sL3o+aihX0JZ16/syh4q4kTAEh/F36mi8Ufdi+D3o9
	6AQPT/Z1MquCdOJlORVnJtu5merKpgN81FXiKboT1Va5RZ1D5YCKqH4hv+O1qw/7mgx8KR4BVrS
	NzYo0zb4ZIdKJY2J3iCIFJCP9+t2OnGgr+NA==
X-Google-Smtp-Source: AGHT+IEFnf9PMg79v6R9fDoXMzQIf74bZGJVD4+Ha5ciCyMz8Oy5atWDpuvQVx3VoT/LsL8PcAh2QA==
X-Received: by 2002:a05:6000:400f:b0:42b:3c3e:5d53 with SMTP id ffacd0b85a97d-42cc1cedbf7mr23399794f8f.16.1764187778532;
        Wed, 26 Nov 2025 12:09:38 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm42155216f8f.19.2025.11.26.12.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:09:38 -0800 (PST)
Message-ID: <36c089f2-1d61-496a-845c-2b7adca34249@gmail.com>
Date: Wed, 26 Nov 2025 21:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/11] HID: asus: fortify keyboard handshake
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
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
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
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

