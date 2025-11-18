Return-Path: <linux-input+bounces-16197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD1C6BF8D
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7C904E5F43
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 23:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E5D2F6593;
	Tue, 18 Nov 2025 23:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce4T7l23"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F692DCC17
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508010; cv=none; b=u9Xljpb3U4ixhFaI+5EiNHtOK60aHka+YVp2N2Jze6vSJhKrei86i4estTlVHanACl82UcwjOwI98u7Ca2FLcdN+6zlLtDcAn9q6rw6Ff+PEELiJE+kq/DcDEu11RyAhcs3ovkP3oVrfKfU1jpe68tRaXg0YrVz1k4LxHTXVFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508010; c=relaxed/simple;
	bh=fb5/owsgtAXIVYWAYWUDjXTvXh92XGrGE7WgKwPpm0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leGtmnI096OwNctI4u1of7gwXHW+qbke5CiMcB0d3Cku8yw60o05lS20odHlVeOMQy+wXr6DDRbYvPTEAj1lo79pBH6+PxcV/ZtTIdumwwWdcAZDZ5LDA54djghfwUqq9I91mITadjP463Q5fQcfKP6uDPcZ2RAmRswujvvi85I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce4T7l23; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47796a837c7so24308555e9.0
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 15:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763508006; x=1764112806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzqqnoDdXWWHNMolyasI4kCpWUg/+xfxBfopUxHg9XE=;
        b=ce4T7l23YZnEGuHSQLk3vfBGbkdbsZtKyN1op9s9tAGecdeKGHl6zeguazqrzEnomx
         wOEnvtYu8fx2QFZm6z0OJkW0Q0hWMc9llMHsJGEYN6Z4JnPZ4mDRpeHpl2yQC/n/nr3I
         ag44GJ7E8klHv4O0nYzGpLQKjoC7RtHo/+B53NuwNgiA5SzFPKr20bhxc3GoDBCUsR5p
         P1Fkhag9o0xwrYdSBOCa5VaNawjy05NMjbudvzQa2PdRvvgxOFW/cw29/vnH7u1Nk6aU
         2VMACGZPVWdwr+ewD0tb8PgQic1WmzzdlYmC4TNZmyhLLnos10LhSobcdZ+GbGNBV3q6
         9lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508006; x=1764112806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzqqnoDdXWWHNMolyasI4kCpWUg/+xfxBfopUxHg9XE=;
        b=Q9jM2K2nZp0FWcX5+y4VEUXtZMVR9VdzrPscdPJwr4fFolhzqNB6WObo3Q1ehYpAKj
         9qO+tKzyBNVT6GfLxWXprexsD3trY++FIg9qoNOl4yZQFO3h5/FDKHQVdqIPR03q7XQB
         e7ciMvPjtdWYWVG+eZ2G5/AbMTFlf7p4dfu4LO5rwlKQkrHNlzgKulssgzCKByeztmpc
         uMys3K1bL6Y7FpHQpyYeh2XoeMsPSC7SF5WVtp+gHfkchbkQHcoh5HTa3WyCIsnp/54N
         Rv05YTJ79NyvbkrCXe6pskXqxfEXXJqtoPzBvheP+GjuI689YYUNqUHXocoJFbwyTm+k
         UPAA==
X-Forwarded-Encrypted: i=1; AJvYcCVfekik1zmVI3T8edAzSfh2W/UQnmYiLyjxbnxzGlKbk49GaTliWTDkZKzy+w/cFmQ4EDOqaQclbS69eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZ39kMkewJEBGUutY5XPk4L18lLpbwcmf8vF2i5tDUSM9X6jt
	Rd/Hfp3I4yolBvt1iXnSYghY85U67oGlNws5AoE8rBhERAcjwqikOU4+
X-Gm-Gg: ASbGncu5dOOCspgEsbYfRghHM3fKMn1fQ1Fts3mUvTV3nPH/XmULaLICpZa4n796apG
	lJajP0e0Mzdz9U/rDK0vnu7cuMwx3cFT8sL0dvLnv9/1bC1e8suO1RPGcnZYqhXWQz2sPRgGbna
	Rqje15Y1Oqj18Oc+qYW7IgCY3TdXq25+QALLPE1niJGN2/GdL6HwICDj1uaInsUS/IFHf32SVjO
	1U9PubDn4Q2kBJK8FEjEvDxN1JrOKrEGGgMEfwSGqEsKwiyr+W3qH0qoot2/e87mOi0WBAWCOI+
	uveiN7tjYuU+dcxpxap9NjJ5/InRNBQ3qJugSkQjQdVy5O9PtxAwYVWmO/eeJZNIYjGpPSq/m2a
	gB4PoQVnO5nvUt4nDrFCUBYLwYGgKNeCr5ULKdwpzIx9hhbD3V15n1WIZVq9oAIZjxotga1N69p
	PBXPaN+IQPzjUglo/5Tq97O/Q=
X-Google-Smtp-Source: AGHT+IFrZYsH7ugR59NVWvTYdlBeWWMeFulVZI3RcRVYVNUdpIZcURUlWhDyX59TBxf5WrPixV/zBw==
X-Received: by 2002:a05:600c:c8c:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-477b19ee67emr1627475e9.36.1763508005670;
        Tue, 18 Nov 2025 15:20:05 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm35014605f8f.3.2025.11.18.15.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 15:20:05 -0800 (PST)
Message-ID: <773d1033-bcc6-49f0-8da6-4a90ea31ce45@gmail.com>
Date: Wed, 19 Nov 2025 00:20:04 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] HID: asus: use same report_id in response
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-3-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251101104712.8011-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/1/25 11:47, Antheas Kapenekakis wrote:
> Currently, asus_kbd_get_functions prods the device using feature
> report report_id, but then is hardcoded to check the response through
> FEATURE_KBD_REPORT_ID. This only works if report_id is that value
> (currently true). So, use report_id in the response as well to
> maintain functionality if that value changes in the future.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 7ea1037c3979..4676b7f20caf 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -422,7 +422,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>  	if (!readbuf)
>  		return -ENOMEM;
>  
> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
>  				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>  				 HID_REQ_GET_REPORT);
>  	if (ret < 0) {
Why is this patch even here? This should have been sent as a fix on its own
months ago.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>


