Return-Path: <linux-input+bounces-8951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA1A01F93
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24DEA1884BD7
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C2A19F41D;
	Mon,  6 Jan 2025 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNwchtD5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0417108A;
	Mon,  6 Jan 2025 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147469; cv=none; b=l9zVeaYf6Wx8VlUTwokNg3gv7vnGV7Xfvs5KOoU+1GoNU3crc5J3MUyRWI6SF/X02pEfXMvHVGGGkRiB5Kxyb2GuvQc7WZtbyKLCpyU+ZoFySFiBK1U5Ahql1FPUMfZCRiPIQGYJ1oB4CsiAESYWHpmj8iHTxk38buB2f63ts8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147469; c=relaxed/simple;
	bh=TgC+BSs9IJu2+r2WPQ4YtzsY+zuTVRLrcUfj3w5MW3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPNU1Pm0sTIRIkXXv0DJqa7rz41FPM1wTwdUyd+BFBOaQoALEhYliiHKEirsncsqKXDrL3G60/Kc0vy7KJ8LOC1JHeL417FnjrCex4LF9ueAvr2cX5tkN94EcTCuKWR8SU4DZmdkTGa3/sZYalmPYwhMGbw/TBJTGRYCu1/r5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNwchtD5; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so20285721a91.1;
        Sun, 05 Jan 2025 23:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147467; x=1736752267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpDqkVhuFVncv6SnB4iX/fmy2x3UEMXFzac7tmVDAec=;
        b=YNwchtD5O1FWNUrM2HgvBLcwW+QKg7R0rk6kP05f5omCt0YTyFSWHcT4hcCT4YZ0Mb
         iZCp4RxczFzY0yG2aE7SNwwdzg98w9edjPITZCbNh5UB8TCB6sULQyKqrf/soc1heI0/
         vrtTFSnuYmGaoCw7OBTCmijeQIi1g3HZHOFPWwT5oY2/MHOXjIQajgR/e9pBbgewVsa0
         4nFXWXFIg6fbLlJfu/+I8Ao7zbxJKzme14bOYbJYEcT4pLJiB5f6MifrUZEYHAeyRgbu
         1dGHfQxBTVXugxiuQbqmSk1hkK9tQn0gHpR1KxAZcV5erXUvK+tsbW5ZJlrEIBaN7pkj
         Vjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147467; x=1736752267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpDqkVhuFVncv6SnB4iX/fmy2x3UEMXFzac7tmVDAec=;
        b=HdS4JN7wF018N5TQ8CaPBgIAemKYNxhBkL9uRSzuiJXYxh4dAyiS8NYKoQSd/wnLVN
         v/rFJ3j77UT8jfKCivCVzkTG8IDTMNc+K5H8kesIJ8BVldPQolINJApqjiowbuoP4INc
         47nAjBAaiknk3CJsRuxhPyPRvM3QJ2yYloDW79yIrNgqMFJTSwprHUAUUyHjBjFaxa3A
         /sFS+DsI9Zv0Htanhj/JOL9U3zfwda0KnADv5Tgn6XeDnuMM/tJvBQm81fWrqZu6T7WL
         iRICeWlrz9JlbupNA+N0RykDGN4fSVNC5HvGu756P9z6ndhSf4cRxeHhhTJgI28MOjh9
         dw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZmX310B0Wxhb9W+vrVYnt4eJZVT/75zdb6DeSWyQunk+sIde6NKF+ogZMbD5xNghwmAmuACJxuVeMK7W@vger.kernel.org, AJvYcCWTvdR5JccEKSSNP/A44gqYa5psxGafwz0nbbvGmnMR56JI2S6W9VY50cuCrHF8Y6jSpiET3WhfI6GvLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvSqP1DGvfAERiCfmtdDB57e5OY7cgyn9PRo4v/gvEDCBObf3K
	sGz2bEJ1i7ZRs+cZEN56QxpVEsmmM5qZml/XqHBAxvSEVEZtDA6I
X-Gm-Gg: ASbGnctb2b3YrnrFkUvx6voL4nlp7SjQmubzROS4rrEONHcXyq8KZ3ml904hnYcpAfM
	TGImw00/g7UtbJifnlhhLO+LLJkZDeS+Zr3NtpgcThhs7y8uAIgClbyZm3ZCgRd0Bg6SSR44OG+
	0F3ldT+WlmOrhkhtn6MStwEiE0DS4Mrcyqf24GwQWFCwo459gTvLhPF5UcftmTxvn1CNDR68hl3
	ovx9oi/DydJO1+B1ucUISEfZ/OZfGYkHHP03O4wLT1arWWgmK/Ewi2e2w==
X-Google-Smtp-Source: AGHT+IH2Td29Pks9G/9PcpolJcbk1lbMTaN2/gL3FZtKJ9RluhhDhdV4OZpEZGmfaKTWDlybzJw8mA==
X-Received: by 2002:a17:90a:f950:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f452d258bfmr102006044a91.0.1736147467266;
        Sun, 05 Jan 2025 23:11:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6998:e192:65f1:e7c0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9a661esm22025298a91.2.2025.01.05.23.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:11:06 -0800 (PST)
Date: Sun, 5 Jan 2025 23:11:04 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Peter Hutterer <peter.hutterer@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Message-ID: <Z3uCCOxIXia78nhf@google.com>
References: <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
 <Z2Ri3cuiRYDap2f6@google.com>
 <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>
 <Z2Rmj6V0FFbWUhCd@google.com>
 <e16e0f6f-9eb0-487f-8c71-3023a17f8afb@app.fastmail.com>
 <Z2RxW6K-_Ujrxeim@google.com>
 <65fbce93-5f73-4b09-af55-c5d782691773@app.fastmail.com>
 <7b7d00d2-ebef-4d0b-840a-44d6ceda8d07@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b7d00d2-ebef-4d0b-840a-44d6ceda8d07@app.fastmail.com>

On Sun, Dec 22, 2024 at 10:33:56PM -0500, Mark Pearson wrote:
> On Sun, Dec 22, 2024, at 3:16 PM, Mark Pearson wrote:
> > Hi Dmitry,
> >
> > On Thu, Dec 19, 2024, at 2:17 PM, Dmitry Torokhov wrote:
> >> On Thu, Dec 19, 2024 at 01:40:24PM -0500, Mark Pearson wrote:
> >>> On Thu, Dec 19, 2024, at 1:31 PM, Dmitry Torokhov wrote:
> >>> > On Thu, Dec 19, 2024 at 07:26:19PM +0100, Hans de Goede wrote:
> >>> >> Hi,
> >>> >> 
> >>> >> On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
> >>> > And mapping to F23 as I said should be done through udev. I doubt they
> >>> > will get all OEMs settle on the same scancode.
> >>> >
> >>> 
> >>> I'll see if we can find a way to check on other vendor platforms what scancode is used.
> >>> If it is a common scancode, across multiple vendors, would the patch be acceptable?
> >>
> >> It is currently unmapped by default, so maybe.
> >>
> >> FWIW:
> >>
> >> dtor@dtor-ws:~/kernel/work $ grep KEY_6e /lib/udev/hwdb.d/60-keyboard.hwdb
> >> KEYBOARD_KEY_6e=wlan
> >> KEYBOARD_KEY_6e=left                                   # left on d-pad
> >> KEYBOARD_KEY_6e=search
> >>
> >> That 2nd entry is actually from one of Thinkpad models ;)
> >>
> > I got confirmation from the keyboard team that 0x6e is the scancode 
> > from F23, and is common for all PC vendors for Windows.
> >
> > They pointed me at this page as confirmation: 
> > https://learn.microsoft.com/en-us/windows/win32/inputdev/about-keyboard-input#scan-codes
> > (F23 is in the table of scan codes)
> >
> > Does that make this patch valid again for consideration, in your opinion?
> >
> Apologies for the multiple emails, but just wanted to add a note that
> Canonical kindly tested for me on a Dell and HP platform, and
> confirmed they are using the same scan code (as expected at this
> point). This change should benefit all vendors.

Alright, then please update the commit to mention that this is common
behavior between several vendors, and let's apply it.

Thanks.

-- 
Dmitry

