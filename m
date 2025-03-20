Return-Path: <linux-input+bounces-11017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DBA6A76B
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 14:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B444F189F198
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 13:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1ECE1DF25D;
	Thu, 20 Mar 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IPqctJEv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADA1388
	for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742477728; cv=none; b=I/ME4pFSJSyMWL+lAjOj8wrdvu6HoDX4L1cFN5EX0nCcPUfbiqIA5ALaC4DzdkE7umOMjx9qITXDHToSTlUp4WhuUOKGIl99Vmp5uYYFhhC9ZzqGwNn8+Z/tShjBqJY9Ci75O5oYRRvHBsdZPvmxAVdiSx/l82ZsIEH22SaOu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742477728; c=relaxed/simple;
	bh=tyb3BSyfsLVoxWPpw7pFhPtqnX9u3B36IHsuhOl39LY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=asCMqXfI3WA1v+h0AULlFi/GjuJIyF5Vb9GWoa0fCEuPUBGg1Lv2tA1sTAwdxJR3iYIpDnyUUwaqD3K2aV3Aq0Ix74GTHQd7Iu1d0ak4KTbs0HSoP8SGvoThalFtcitskUOt4enNKWmMecamBINrQKidF2uDEGL5yqGnUJEUv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IPqctJEv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so7224245e9.1
        for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742477725; x=1743082525; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uI37EnNIDJW1PlynZLhXmPNYAgRnAkW+7mg8+W9Muj4=;
        b=IPqctJEvmHHnC039+8R366jpoSeYx/2LPSziHkrNpDBOd3vq/JOqok+1hO5Xmb2wts
         Hm/g/tMhW0FADCdzMGif9batPCVgBrZ2Dzz0RbJx6VhEhw6DbK1KLrBEfykAHukkPBDo
         H/N4Ku8wMVrJq0x8Ot35+B847PR8exk3u/QexNWIk/5djHcHzBaGCnsYgRr0tHBqVjv/
         TPdeOw5K5Weq/2X9bkBXy2TF7+d7weLGcYWf8NnWkt7ujSAutabMhSBA2/kFPx8FIWx5
         0+FJ3pC6cm/IbOJf62kPdzCNkiizCbvTLlhBrAyh5HcSVx62uKMV5dyRUDvte5OiJRQf
         QGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742477725; x=1743082525;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uI37EnNIDJW1PlynZLhXmPNYAgRnAkW+7mg8+W9Muj4=;
        b=QJJIiI9zbYOsbLVThYAxpKY7kZ3NgOQDQVojURqqpRgAD3sT23i+Z2Wbu08NJBjtUK
         vRF3Q+UhflSgq95PTQV0/2dK5rZVjiN2MArXuU6jNF8ujF/NXzCwiziL/Q+U4g/GOfqn
         M0B9TEX4cu5K2sffoQRiLpG8Jw3wAJX7ofpmZmSZHoEL/iRCa7QCBV/vBv6FhBuzfJsi
         NTvPkcqCwLnwAWnjUiHFvrZWpNBSdAVIuUZa5Bd2cFpeyFy5DPY/KaJ6/394XlUbjJAy
         O0Ec8tqn+kdKCwEt1Z7ma+SfnhAT/XQHb6RBI8Rg333a4xsABn9wOxtBG1RCQ/pJa/FY
         tk+A==
X-Forwarded-Encrypted: i=1; AJvYcCUYaQie7OdjbXScEBMgsLy2WHJwrHaPam39b+1qAn6X1IwMo1srhResip2VjZbtj5GGxlOOhAlJsAEDSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwaTxBKIFfqDlyaSOHaX8o7TveBulsEyqWw61H4gKHVJnapHP
	SnUqBJfGTEc00PNS6ZOBZ+7hdL+OIuFkpQaEC0deyxVW/GcZkUrHpxzkZMr8IUM=
X-Gm-Gg: ASbGnctaul2NBdZvFaNylNVhHHdz2JF1E2BgxqJRBtTcc27a5k/6nEYQntny+7IZG48
	Ox9P7x18OUTS53jHhYIN/dV7A4COWvOf/om5E5VGDdjcNGWXFgeBTN+F1A1jmb9ermFT7gKVP9O
	IsQQHGmKWeW9FmTx+ka4Grf/widW907MsclRxgqk9hOyF1g4N2zhTBuReZA2jZtRfJBxc2EsanK
	0ZgnvFyPNix2BKqU8o8Nir5nFuhSX+tBuQi/HyaZ8kGxd+AeeOP6vWd1wmlq0nMpv449OzwnsHD
	zTVIFSSrJGTpzLJmCSiZllOh3BZ0ohUzDhWWcJuwPhNxBnRivtX6ecRU6rNYJ6viEdQLA0zekYq
	K7TLzyYythlteo71AbGiOUg==
X-Google-Smtp-Source: AGHT+IH4JUukHITRQUmhMxxvC3m+ezaaNPBF2MAA+YZllIv4Sn+StoSOhopRFHWFdXJ7KQFMa1fZyQ==
X-Received: by 2002:a05:600c:354c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43d4378c2d9mr55676215e9.7.1742477724617;
        Thu, 20 Mar 2025 06:35:24 -0700 (PDT)
Received: from ?IPV6:2001:a61:1348:8f01:d3d3:1b29:8986:519c? ([2001:a61:1348:8f01:d3d3:1b29:8986:519c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f7460fsm48668355e9.28.2025.03.20.06.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 06:35:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------v00cVtf1YB61aEnjeVUoy6fg"
Message-ID: <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
Date: Thu, 20 Mar 2025 14:35:23 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
To: =?UTF-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, syzkaller@googlegroups.com
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>

This is a multi-part message in MIME format.
--------------v00cVtf1YB61aEnjeVUoy6fg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20.03.25 05:39, 白烁冉 wrote:
> Dear Maintainers,
> 
> When using our customized Syzkaller to fuzz the latest Linux kernel, the following crash (94th)was triggered.
> 

Hi,

is there a way to use the syzkaller for testing a patch?

	Regards
		Oliver

--------------v00cVtf1YB61aEnjeVUoy6fg
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-USB-cm109-fix-race-between-restarting-and-close.patch"
Content-Disposition: attachment;
 filename*0="0001-USB-cm109-fix-race-between-restarting-and-close.patch"
Content-Transfer-Encoding: base64

RnJvbSAwM2Q3OGNhOGM0N2M4Yzg4OGRmN2M3YWUyYzcxMDk4MjU3OTlkMjM2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDIwIE1hciAyMDI1IDE0OjI5OjE3ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gVVNCOiBjbTEwOTogZml4IHJhY2UgYmV0d2VlbiByZXN0YXJ0aW5nIGFuZCBjbG9zZQoK
Y20xMDlfaW5wdXRfY2xvc2UoKSBjYW4gcmFjZSB3aXRoIGNtMTA5X3Jlc3RvcmVfc3RhdGUo
KQpIZW5jZSBjbTEwOV9zdWJtaXRfYnV6el90b2dnbGUoKSBuZWVkcyB0byBjaGVjawp0aGUg
c2h1dGRvd24gZmxhZwoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBz
dXNlLmNvbT4KLS0tCiBkcml2ZXJzL2lucHV0L21pc2MvY20xMDkuYyB8IDIgKysKIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0
L21pc2MvY20xMDkuYyBiL2RyaXZlcnMvaW5wdXQvbWlzYy9jbTEwOS5jCmluZGV4IDBjZmU1
ZDRhNTczYy4uOGFlNjJiNWU0NWY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L21pc2Mv
Y20xMDkuYworKysgYi9kcml2ZXJzL2lucHV0L21pc2MvY20xMDkuYwpAQCAtMzQ4LDYgKzM0
OCw4IEBAIHN0YXRpYyB2b2lkIGNtMTA5X3N1Ym1pdF9idXp6X3RvZ2dsZShzdHJ1Y3QgY20x
MDlfZGV2ICpkZXYpCiAJZWxzZQogCQlkZXYtPmN0bF9kYXRhLT5ieXRlW0hJRF9PUjBdICY9
IH5CVVpaRVJfT047CiAKKwlpZiAoZGV2LT5zaHV0ZG93bikKKwkJcmV0dXJuOwogCWVycm9y
ID0gdXNiX3N1Ym1pdF91cmIoZGV2LT51cmJfY3RsLCBHRlBfQVRPTUlDKTsKIAlpZiAoZXJy
b3IpCiAJCWRldl9lcnIoJmRldi0+aW50Zi0+ZGV2LAotLSAKMi40OC4xCgo=

--------------v00cVtf1YB61aEnjeVUoy6fg--

