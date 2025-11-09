Return-Path: <linux-input+bounces-15959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17824C4415F
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 16:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4CB44E30D5
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 15:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF682F7ADA;
	Sun,  9 Nov 2025 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eJtTcAiG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CBA1EE7B9
	for <linux-input@vger.kernel.org>; Sun,  9 Nov 2025 15:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762702356; cv=none; b=JqfjjX/3LzmzrZsYJDnkf/wu/KVsMm/r/EK3fYNbn7nod+HSwVtYM2b4INvoRN+ZPPEpVtere6FA+oy8Om0cDXh/MVb1+O1jiza8fz0OS2wOHeb30kW4opCnzR2gIfILKpXieyWBriMRbouXX9I/gRD2SXkXHBxCaEJrMb+LQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762702356; c=relaxed/simple;
	bh=kmDxENfaEcbz/TbEvYUFSetPqBnNlLyKxADFquWNyn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP13u0fYXd28NE1oEkg7GYGFWilV7iZ9dDqzcFSINBkNGEQLezlZpUwssjvepVJy+6FwhpeFPcNVIYTD2bDtZULm9V1WLUhFdxNLC/M/4zRT+AqJkoqrf8XE0+4BFf730pSpSZVPvXv1K84Jl2Q4bNXfoZ1lXF2ShgM5kTG3g2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eJtTcAiG; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-882360ca0e2so12821176d6.0
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 07:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762702354; x=1763307154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HylUmDGq0x2o3654HIZ/OI476mBrwAyXvRuXG44SoZg=;
        b=eJtTcAiGVzE57SQe2by41cV1NRDY5xu9339HsC+dXXOjUKr2QttV/pwLT7nUk+36y0
         3qRNAfdc2HuBHUtiObkGR8d9tHg+6AQhqxJvEUHPtRNu9G/AoqEWpDoV1Iy1cl6xN5Iu
         VodvvHNDrOZxmut8mOg2boj3o17V8Qr2vSEZMtWmnAAwFbeqSSsd1gG6f3CRp1MaphDd
         HU21mM5PYW7BaOxVCz7hpPgz+WIlurpH9DhKJFNY2JU2fXMBDO92SNon1SfQsCMH5sKn
         MIqnpn2Ysd5Kj4UfCI5SVIbcRtLP/pMlZy+tSFuP/poi80f389KWihDLzm0lcbwfDlzx
         o9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762702354; x=1763307154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HylUmDGq0x2o3654HIZ/OI476mBrwAyXvRuXG44SoZg=;
        b=jyjOdAMNUPNAwJYAdiKtNzLeXPzsW4HIh1VU9VSr+XHCELojfd2PDt8CfO3paFUM5F
         IvMTLLZlFV1dc0ZyioZQ6Cxy98zP3f1SWjqlkykJqoPeIlnlTEzY+dSpqJOwvSBfNa8n
         36BRUrguXIJHu44WNoUOB3PPvaY9uM20ER2nEZ/lDG8VtpQk0Q7MdH02SRC3PmAZPm1g
         EQC7lCOHuZeaCI6RAOnujFWXU2VrZY7GCQJbND5aww8avHfmaZzf539857HrMtY/SL75
         CCNpmjMGQJRJxsoUyd6vzuzp5gvECrmzP0vz5fjWObti7hd+kD9M/o7L6BIjl45AuUxY
         HXcw==
X-Forwarded-Encrypted: i=1; AJvYcCVLLquUw84NWVBiTxkbXnT7pwEAztmK9BruaTsjwuJvz3XpdZbzugFHssZKTF+QeZQ5q7id3iszIG9YBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjdp3eZJ/4FH1OXjpl6ZNq54V+I1SKEcGXBSeuSDt1on/2sKg
	IeeorIUKVoLJYWVUEeeA8PGFi5NbcELiiuqrBrnjQQmyEu0PInvE02A8Eonqe7XUcg==
X-Gm-Gg: ASbGncs4ImEuTuk/AXkHoF5mBsKcAgTiEbB9UhIg3H2LMhLdVnITRLDXIH4xIZkhUzL
	N1onpHgdAu7vduvGKX0duqWL0WxswIIeQnpYSPEnyhbX9pGOW5OxjmbT7Hxx9DQuM7ZEzXFY3G+
	LVEYRwepm1zUpZDQYV4Q1Gic87mkaJEPnh/K+ThBTM912PbNTn6NraNNKfAduAVqnx5Eib/5UqW
	qjggQORVos6GdtlRLIWo/tDxLFUDa0DEJsL30yvclNzADJDKXw6UNNxntFy2deqp+HIK4xgNO/s
	1Nx7EX0hphaks6UrcZ8kuA7WA5kq+8WvFDLBzr+YYfxeoqr+WS6i//S1ySqTOJkGvYuqj6pypwm
	omEPswXeuyHCMREQtBlkQZGFbMSvn8AJVYYs33h0lQssWodVHngPbYTjT06B7sVKxFNyR1k4aZe
	WjKLoN7HJ2kKM8
X-Google-Smtp-Source: AGHT+IF7TpSTMNrjz8fE8VnGjKwFFs+rUsL9iSNKySkjqNGkirn5aakcE6ZeaeWmXGVXyO2iAmV+XA==
X-Received: by 2002:a05:6214:402:b0:882:33ac:824f with SMTP id 6a1803df08f44-8823872a410mr73514576d6.53.1762702353647;
        Sun, 09 Nov 2025 07:32:33 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b7527fsm32625416d6.42.2025.11.09.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 07:32:32 -0800 (PST)
Date: Sun, 9 Nov 2025 10:32:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>

On Sun, Nov 09, 2025 at 11:25:27AM -0300, The-Luga wrote:
> Searching and learning more about USB capture. I decided to try and
> see on my terminal what is happening.
> 
> Running: `sudo cat /sys/kernel/debug/usb/usbmon/3u` and changing the
> knob of brightness the terminal stays silent until the reboots
> happens. Then the terminal has the handshake until it stays silent
> again.
> 
> Rotating the volume knob, the terminal is also silent. Pressing the
> button to change RGB effect it's also silent.
> 
> Pressing the play/pause button is the only signal it shows when
> connected to Linux:
> 
> ffff8c983daac6c0 3999343353 C Ii:3:023:2 0:1 1 = 08
> ffff8c983daac6c0 3999343375 S Ii:3:023:2 -115:1 1 <
> ffff8c983daac6c0 3999359352 C Ii:3:023:2 0:1 1 = 00
> ffff8c983daac6c0 3999359365 S Ii:3:023:2 -115:1 1 <

Note that this play/pause information is carried on endpoint 2.

> Now, I passing it to the Guest:

...

> And it stays silent after the initial hand-shake.
> 
> Now every action is performed with speaker connected on Guest.
> 
> This is pressing the play/pause button:
> 
> ffff8c9585e55e00 100205721 C Ii:3:023:2 0:1 1 = 08
> ffff8c9482ddd5c0 100205786 S Ii:3:023:2 -115:1 16 <
> ffff8c9585e54fc0 100221735 C Ii:3:023:2 0:1 1 = 00
> ffff8c9482ddd500 100221772 S Ii:3:023:2 -115:1 16 <
> 
> This is increase of volume by 1 step from 0 (muted) to 16 (max):
> 
> ffff8c9585e54780 196978419 C Ii:3:023:4 0:1 64 = 2fbbec66 00021001
> 20000000 00000000 00000000 00000000 00000000 00000000
> ffff8c9482ddd740 196978486 S Ii:3:023:4 -115:1 64 <
> ffff8c9585e55ec0 197611423 C Ii:3:023:4 0:1 64 = 2fbbec66 00021002
> 21000000 00000000 00000000 00000000 00000000 00000000

Whereas the volume and brightness information is carried on endpoint 4, 
which belongs to a different HID interface from ep 2.  It seems quite 
likely that the speaker's firmware doesn't work right when the host 
ignores the second HID interface.

The log posted earlier showed this for when the device was plugged in:

[  997.106087] usb 3-2: New USB device found, idVendor=2d99, idProduct=a101, bcdDevice= 1.00
[  997.106094] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  997.106097] usb 3-2: Product: EDIFIER Hal0 2.0 SE
[  997.106099] usb 3-2: Manufacturer: Jieli Technology
[  997.106102] usb 3-2: SerialNumber: 4250315A34383502
[  997.180035] input: Jieli Technology EDIFIER Hal0 2.0 SE as /devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-2/3-2:1.2/0003:2D99:A101.0014/input/input51
[  997.230824] hid-generic 0003:2D99:A101.0014: input,hidraw0: USB HID v1.00 Device [Jieli Technology EDIFIER Hal0 2.0 SE] on usb-0000:06:00.4-2/input2
[  997.237434] hid-generic 0003:2D99:A101.0015: hiddev96,hidraw1: USB HID v2.01 Device [Jieli Technology EDIFIER Hal0 2.0 SE] on usb-0000:06:00.4-2/input3

It mentions the input device on usb3/3-2/3-2:1.2 but says nothing about an
input device on usb3/3-2/3-2:1.3 (the interface that uses endpoint 4).  
Instead it mentions hiddev96.

So now the question becomes why the input subsystem doesn't register the 
second HID interface.  The HID subsystem is aware of it (the line that 
says "HID v2.01", whatever that number is supposed to mean).

Seeing its report descriptor might help, but to get it to show up in the 
"lsusb -v" output you have to first unbind the device from its drivers.  
Doing something like:

	sudo echo 0 >/sys/bus/usb/devices/3-2/bConfigurationValue

should work.

Alan Stern

