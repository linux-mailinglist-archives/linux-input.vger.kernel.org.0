Return-Path: <linux-input+bounces-15910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64641C3C2A1
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 16:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C5AE4E18CD
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DB5322537;
	Thu,  6 Nov 2025 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="DN59AzoY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9D322A27;
	Thu,  6 Nov 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444127; cv=none; b=TL9ycPGZmbfd+DEAbNciHvKUAPu0BmiX+IaSHxBo7r57eDW+jWzpRh02jQqgfLn41LOSmfp37wfY6ypJlb0Ege87mYgpGNn25bLWCL+zNA2656s/qTArCSKQ3ZQI0g6i4Dxo4ERcNsEGVDwQQjOY8aR+rCww1XQZdTB35Ib8oPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444127; c=relaxed/simple;
	bh=yTr5ewjzH5gDCnkLsJg5hHA6D3H4axJSdzcGEQF5SII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDx2ITxzOr6FQe4pLbs3x/yb0D2ku4sF/7asWFbHga0nKakaHr1KIp6vEFmhna84pYcUaGl29Th9BQBREmdVTfVuq2tWfA4zN/MpuV38LQPeoibSUMo/0qszEQY1f7olWO81RNWVmgb2i9ckZH4xM01gCHwUzg6vvtaNjG1bWj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=DN59AzoY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p50878061.dip0.t-ipconnect.de [80.135.128.97])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 50D4E2FC0061;
	Thu,  6 Nov 2025 16:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762444122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxjYOhRovuf4oy5yll5QGNQs8C8q9BYLIAPewGNwpFM=;
	b=DN59AzoYZfACHrzd3ZfAw5iG+0TsQl1C6l9SymzGY+Z5ZAFOszIrKrvLxnb4iGTYkZqQw3
	iwaEu5vY4/6+qi8LsRsAW+7G8CgrSh/awkWGApoMeT7QxL+XUhAG7WjWCSfAbrc5mcOg4c
	DO+/U2Wzml5mR2bZDGLEib2mLdrjHrE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <a37c9ee0-dece-4a91-8dd1-beab7a6aa816@tuxedocomputers.com>
Date: Thu, 6 Nov 2025 16:48:42 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid/hid-multitouch: Keep latency normal on deactivate for
 reactivation gesture
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106154636.985427-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20251106154636.985427-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.11.25 um 16:45 schrieb Werner Sembach:
> Uniwill devices have a built in gesture in the touchpad to de- and
> reactivate it by double taping the upper left corner. This gesture stops
> working when latency is set to high, so this patch keeps the latency on
> normal.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Forgot again to add cc stable, please add it if the patch gets accepted.
> ---
> Or should I better implement this as a quirk?
>
>   drivers/hid/hid-multitouch.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 179dc316b4b51..df64cb6c41699 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1998,7 +1998,7 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
>   
>   static void mt_on_hid_hw_close(struct hid_device *hdev)
>   {
> -	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
>   }
>   
>   /*

