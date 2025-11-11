Return-Path: <linux-input+bounces-15986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF119C4B5AC
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 04:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 63C9234C063
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 03:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F3E3491D6;
	Tue, 11 Nov 2025 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="k+bnOdjc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A1314B8E
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762832580; cv=none; b=a8vSsN/6aIPJDPN5dExJEZNxnVWhOGt0OQ+BGD06Cv/IBbMVf5dsl3BA+IUIjP1mJYIXmNFNCgedwE/z1pkBvyURls9tDmbJYGtCvAQqEJhkSfC6LrPwux+x774ouWebAO5z7GYDzbDoiZEJHw3JlihjZbkyeRentQym9Wc8C2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762832580; c=relaxed/simple;
	bh=g6jGAcvwVh/icnz8bdIbPAM/IeCRuZBYyx7sd28ajFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1sYFx36ae+MD0+WkNTxJzeNqgoJF+cgQROPTEftSDKfK7teNoeNRO/G7fbCtGV5jzWQ7PnTds3pHHTd0As7ml5dutYv3e2S3/pfnxup1f3I+0AdzglQrG5Yl9KC5LCEDgv9KoYQR4gFcBxrn4Shz/bYb7upafan9J3XpLJaUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=k+bnOdjc; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b21fc25ae1so406293685a.1
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 19:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762832578; x=1763437378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6/LD0uDQCSe+chbTWf3H4rmcFTKbJ4PUWI7IjCyqUo=;
        b=k+bnOdjc3h3fN0DBJEjWccRsZENJafZK8a46Jr7Oz61VgisSscX5Fux+Ds1UEocPgB
         gRuhd6Uf7C6Qo9/EKpKXbPiB/BJmo1avHlI96pNifmPGm8IFjp6p3FT3DeWBZtpA1BtM
         e+4vmt+/pJ+69rTzsXm8xi2isbDlHToGefxuwSifW95Mb4C8emAL711j09jVru44ugye
         6cdMwahbScmpiJZauCpoM5i8MO2xr3Ehk5lXBCtv6d0mj/aFADzR0g8YCq0zl/Lgu0Uo
         Wuvn6V6QrqHHlb7Mpp9Yj1I20+H13idjJi9E7B1ojB5ZOdJRUDK2oNL+BaVAYrXQiiRt
         clvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832578; x=1763437378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6/LD0uDQCSe+chbTWf3H4rmcFTKbJ4PUWI7IjCyqUo=;
        b=Z79cz2+zmxJLFxeAQhb8d0RfQWbqmQ+riAHSXUI8UvuG75PaUePM/FXiQ+Zs2HIB+t
         rpDBhtpC5RPy+RiRYxbtFIlwaVKcyRTIrOVkKUT1dBb2Url35qLtgDgPzlDKt0F/qj+U
         jXHcmzeeI7SJphDA0BoFejz3wkQKx3wooQlA4DKyPfYXNYvNbgYepgTiBCWjQjuPpXmW
         jfPvHzPzfcC1X24Z8yQ0WobpnTPTbhOc/Gu2VieWRmxXngHJxPsF3YngQ/E4huvPw6dF
         HuDqjQfRCKJDbyR74OxtTrsc6fy84MjVekZHcbeIZDaRmJPMxdLnUbXIP+VI2xcNdOi1
         cILA==
X-Forwarded-Encrypted: i=1; AJvYcCWQMrHCfXrq/64VsLgySABNxA2jZ3HVDfXvA9RikrfTmzE7voZsJCzCZbpjg2Fvu94IpsGopec9tDqP+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1U6ScT0CVmbqx73cw+YIQ3ohyHEg+JDLS0AIfItw019qNDWQ
	TS7RMT6PkaJd2h1m8GPp7WJAbmr2mTT6SxLCjbQmQb3tNoOzdVXL9lZ0JNESHJ9POg==
X-Gm-Gg: ASbGncuakdU1ojxBisfTZiVa71gVMo6isZgGuNxlmgQr9taYmQuWokvIFdaOnD03sFd
	81pKOtYYDyZx+rU9N3lRFiPLTEDiiTzaxBCue/WrDiu/udwwQRtYhAT9XkB3IkrUgM+vhyvotOI
	GlEZbr0VBVS7aee9Qt95moVN+cmNkVZ3YZQopxwGMToU6C1x+ATSQMCGwuizE6Vo1lIzRbdDaWe
	VBPimJFXlbkP4Xa7p2aAeawXutjfGg1gQW4vKj6kzOok1HDFgYdC9+F7DWXOgjaEEmLrbzwk5Ju
	Hxe/YhpQFRG8c6qOKYhvr3TC4B79MGdgJDA/cvL7sFZtRF1xzOHRX8sqxByLiJd0rizYogQWkn7
	OhXcmB0U5itKpnFHxr/k9bnc3TortIUhps9fgippyu/g+zyMZKq6ualnDzt6MqmQApyT9D8JgKo
	3c5Lu4UUPSYD3f
X-Google-Smtp-Source: AGHT+IHYC3JVh4zkjwBpZ+raijFxCEzh4VWT1zLA6Gt658oaINkv6SV2JCD2CK20MPRQgCSoIXoI5w==
X-Received: by 2002:a05:620a:2a06:b0:8b2:77aa:73f2 with SMTP id af79cd13be357-8b277aa7784mr860421685a.12.1762832577612;
        Mon, 10 Nov 2025 19:42:57 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e615bsm1135123385a.19.2025.11.10.19.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:57 -0800 (PST)
Date: Mon, 10 Nov 2025 22:42:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <46ecf459-85f8-473b-83da-99fc0ae78463@rowland.harvard.edu>
References: <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>

On Mon, Nov 10, 2025 at 08:48:57PM -0300, The-Luga wrote:
> From: https://github.com/torvalds/linux/blob/master/include/linux/hid.h
> 
> #define HID_QUIRK_ALWAYS_POLL          BIT(10)    ->  2^10=1024=#400
> #define HID_QUIRK_NO_IGNORE            BIT(30)    ->  2^30=1073741824=#40000000
> 
> Sorry about that. I'm still learning and the documentation was not
> very clear on this.
> 
> Trying the 0x40000000: `usbhid.quirks=0x2d99:0xa101:0x40000000`  the
> usbmon stays silent when changing volume/button and reboots when
> changing brightness.
> 
> With HID_QUIRK_ALWAYS_POLL: `usbhid.quirks=0x2d99:0xa101:0x400`
> (reboot does not happen).
> 
> Is there a different quirk to try?

Why would you want to try another one?  You've already found the quirk 
that fixes your problem.

Alan Stern

