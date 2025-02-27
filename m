Return-Path: <linux-input+bounces-10422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912D4A48A7B
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 22:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A340C188D052
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 21:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B017A21B9CB;
	Thu, 27 Feb 2025 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="rgjAFfOe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD781AB6D8
	for <linux-input@vger.kernel.org>; Thu, 27 Feb 2025 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740691773; cv=none; b=RJcyeRQGFPkvZpl/0erpiuGzGO7+OHrLHtG2wsp6YsdstaFIwBQ5xywRST73tt4WP6//ZIOAxBg3Yp0DFHlp6Ri654ZJT6lHu2pwICakCTyieAmXfFMyKHSArcmAIrNKB2euMvymrhIVZFO4YIHkdoQwningGck6FQxwwaAozhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740691773; c=relaxed/simple;
	bh=1HLpNDJ3fEoULhmkQ3fUDzMZ84Q7qqhFf+QaNIG1Y/0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LFQG6eCruY4dI0Gwlx9UwF9KalHauiuGqyoY0WzExjuor3NISzjQyiGkG64gMdJhqvjGHm6FYLscbwxpUzS7GF7g71A+BYyBaSoP3768JjVlmc9yh9qfpFIqihHejmVf6HW5szQSgvdyhn/cyeKtB6TR87rxnfaE9VuwHxHvW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=rgjAFfOe; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 099D52FC005B;
	Thu, 27 Feb 2025 22:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1740691761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyigUA2hXQpe0ifQOyT2K2HgKhiyStd7wxuLs8QSp3s=;
	b=rgjAFfOe6piOwHIodl62Ht+ByVMIC4j8xBcB0lTtYIRUEI/dX1GO9aG2hImtm8SiQhpTB4
	Z9wybcsK6LiVoNcqU1QjiYZmOMXUQOUfwlJkWVKog4Kyiiby/Xck4eUJ1xu8+KI3eFRKSk
	3j43VT5/gjFoM3bVYVTYCmJ/AdXb+z4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <d41e5d88-818f-40a8-8691-b5ebc42ec042@tuxedocomputers.com>
Date: Thu, 27 Feb 2025 22:29:20 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fix strange media key for PS/2 keyboard in a driver
From: Werner Sembach <wse@tuxedocomputers.com>
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <75f6f0bd-084d-48a2-b7d9-b8a05fa80f55@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <75f6f0bd-084d-48a2-b7d9-b8a05fa80f55@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 02.01.25 um 18:49 schrieb Werner Sembach:
> Hi,
>
> TongFang/Uniwill Notebook barebones have their internal keyboard connected via 
> PS/2 and pressing the touchpad toggle media key sends the 3 key combo 
> KEY_LEFTMETA + KEY_LEFTCTRL + KEY_ZENKAKUHANKAKU.
>
> If it were a HID keyboard I could use a HID-BPF program to remap this 3 key 
> combo to a singular press of F21 which seems to be the default for touchpad 
> toggle and now I wonder if something similar is possible for PS/2 keyboards?

Gentle bump.

In the meantime I tried fixing it on the XKB level but that comes with it's own 
challenges: 
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/794

Best regards,

Werner

>
> Kind regards,
>
> Werner
>
>

