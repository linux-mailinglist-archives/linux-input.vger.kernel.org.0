Return-Path: <linux-input+bounces-15440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05042BD661D
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 23:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B87594031F5
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 21:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02032EBDE0;
	Mon, 13 Oct 2025 21:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/rJ89GC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ABF2DE1F0
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391433; cv=none; b=Xn4DscLZEW6YMhVpjzrTSG6hYHXuUdhiCJ4PZKh4kWUmQiPCII8KFEcFz3KRwZ2MdIjFCHj01Ex2rFSwvtHyLfsaAT1qEJ+m5gvGMgRE0nBTP4Z7V7N01wpxi+ev0agHP3Cye3hYFHeM2X3haHdEdJhfAfJWaIbbce0Vj94Z/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391433; c=relaxed/simple;
	bh=Hl2Anxuye8XRplAJpKbBSmfQh0rViqCT52nKsVmNPvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYhzw+UFebfTNpjWZwJTrQ6XCMPjxxTuGiduiRNdf72ZB94+pboNci8GpaACh64gWjYtcFLCDRGI4xdOYazgDKvBz/UQIG9LDaH6PVWGnGZaX++yAe2cGIORHv0wRuM4jgvMOgBamu19rPsBHhovdQ/RmqkfcNY4qBSdxRIJ/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/rJ89GC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so43921615e9.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760391430; x=1760996230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIibZ9AZHKQDiWSHleSWVU3Q4WsDJCCftwbYeVk68tk=;
        b=P/rJ89GC+1m1oydzy4+4/TJyVKjjZ37quhREDtfJS4tF/8kGHB5TYtC/HdxCLJ9AXy
         QhBRWHpqBQYU1FgCsZGn1QvI6YTF+jSFtq8+HvLmUrg4UV0pZXGnJN9pe/6RRyH+KUGb
         JlUmLeOw/1/0gJQev3KFfGXg5dKSbNcsDQJnoLeUZ+n9XFPrglldnv73KZbNpTnnbEQS
         AFTV2dD0faVjL/znIdfT1X3rlL9CURyVFI7ibCP/JcLO+EQJyCDWmxymjCsFgd09VcT4
         RE4N59LKZFQei+veIEb0FEW97ngfDNTjhvzpxR5GGCU9hiRQTbcXtAEebx1CNMkwhUj/
         HBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760391430; x=1760996230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIibZ9AZHKQDiWSHleSWVU3Q4WsDJCCftwbYeVk68tk=;
        b=fFlZHcYA1ykAd4rXij3JAjt27DxUCaYMMFzZWYQVG7kl/cmVwLMT1wpc/LdVXM7BDt
         AMZvJpJnPuQa0AlTw/tmgO4qqtQMSfkDRTkhititoJ/4sDjHuT5jYfg5JB1Jifw2a+sv
         +0LAwFxJIhv2YQNAg/TN47emSRgPjiw+YemD8BvDvGTcLKvdGwRYerc6iTZagI7SN9JR
         HTPmibbGsK669gS85WoxQJlamn2aLGY8ASHfGMOD0DKzdlY3zWc285/UmSx3/B7voAXU
         lib/jsgYOnbCyLR3W6QuVrd1Pqybz/D99Ipt7O4igqnhqJ6jzPvcTQvD+Z6ERN2pMCby
         YMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIYc8yhN0KuCzLJjaxS/Iank4g7tsWt5QLxyBAEWNHNchr7t5SfohI+6Cwx1bDwMA7lL46E5PsPtbsQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMN/KzSsBY1fOAVWD4J45MFzhNfQmijAK6QlyOfwC3JMY5XfvT
	XYvdORjCak57P1N4O5162V1aquO055VjnU1NqMeA56gc9JxBEvjuMLZM
X-Gm-Gg: ASbGncvXYold0YWGKCp2MFdLk+2Rs66kG7a6tygFuOBuamNZMTJfztkoOEOwUrDRKkQ
	iek0M3OuxskqjqdMabJcM95Ib2I+uKdptGA+TJjKQ5GRAWEBYlTgRcpWcPksbhcU3kVnHbNR0T/
	hTkPWI3TVY4oofXw6Y3nrOfNjOhaP34hHMNUyArbnEc1cKZI0RLxT3POzWHIoHm18vzbX0uXir6
	ZOw/lSmDDWLHwC0Tnn3X4JiEwljLgdshajdl6axCeWGRuPidBhDMqkXMSy6QN+ruEiNAViI3S7Z
	/MKKO9z/r7cf/J51Ze+KTk1IELjGbrrD44qr28Su/6Y8VqApBMDNhjtO9uYlI4W52wftQb47Mp6
	AxlOJQmpEBM3WakQB+GX5UvMz26jeh96o+t4aLOEwkF1o6czmb+fQOX8oUwNW3N4N3g==
X-Google-Smtp-Source: AGHT+IH1SREQLCa/Svd3IxN7xi9fuGo+yF1EqJ1MubqO02MGbIzYuC4TGh4/KXqezsvdEuSc4H2L1A==
X-Received: by 2002:a05:600c:19d0:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-46fa9b06c8cmr162443775e9.28.1760391430115;
        Mon, 13 Oct 2025 14:37:10 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489accbsm234768025e9.14.2025.10.13.14.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:37:09 -0700 (PDT)
Message-ID: <e6f4a811-6f70-407a-930b-f533fdefc2bf@gmail.com>
Date: Mon, 13 Oct 2025 23:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] HID: asus: add support for the asus-wmi brightness
 handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-8-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251013201535.6737-8-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/13/25 22:15, Antheas Kapenekakis wrote:
> If the asus-wmi brightness handler is available, send the
> keyboard brightness events to it instead of passing them
> to userspace. If it is not, fall back to sending them to it.
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 0af19c8ef035..1f904bb66396 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -324,6 +324,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  			 usage->hid & HID_USAGE);
>  	}
>  
> +	if (usage->type == EV_KEY && value) {
> +		switch (usage->code) {
> +		case KEY_KBDILLUMUP:
> +			return !asus_hid_event(ASUS_EV_BRTUP);
> +		case KEY_KBDILLUMDOWN:
> +			return !asus_hid_event(ASUS_EV_BRTDOWN);
> +		case KEY_KBDILLUMTOGGLE:
> +			return !asus_hid_event(ASUS_EV_BRTTOGGLE);
> +		}
> +	}
> +
>  	return 0;
>  }
>  
Neat. I like this.


