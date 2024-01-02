Return-Path: <linux-input+bounces-1072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD3821993
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 11:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763FE282DED
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7E1D26A;
	Tue,  2 Jan 2024 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RYkvxhAp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09546D27E
	for <linux-input@vger.kernel.org>; Tue,  2 Jan 2024 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-556ab26227cso41815a12.1
        for <linux-input@vger.kernel.org>; Tue, 02 Jan 2024 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704190883; x=1704795683; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srpG0ery4V9Udddfug87nbICaLqD5vEisHypY/QUI/c=;
        b=RYkvxhAp0tpl2dmoMcrMs7OPYw5pQKJDK2Pi3R4ZYKSzxwL7+/Bmmutl1LZQWP6URO
         HNCqKGcZOMmP1BjgI8vOJpy35FsbjUwO6adCSt2Shm1ubUQs3xvky72VBYv/KAw/vf9e
         2gsJYTlnemjJS57IAZuEl4M6CXijqdH2saio3+EyG+ToZaAK6zCRBa8i5SSv5Zh4fJat
         NEK+5xM7auGL6wbthGRrPCp4+kUxGipatn1EyHZWzcDGxfMCO4NsvdjWegNXzT5G2D0t
         /uFAYd/PPwXKZuqsWYKkU2hEJ72Ebr5+ovXxZ1CoCgfKF8oN0TUqt8edRvvExwcA836J
         AB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704190883; x=1704795683;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srpG0ery4V9Udddfug87nbICaLqD5vEisHypY/QUI/c=;
        b=aJ4wvB861ZUj53ZKnLFb4muQQF4eDY8XPRNzwvBWGze19f510QcHHjEB40iEKr+f0h
         4cqrHym13ovAN+m71QtkvEFrkf9bwyRn6Rj2p05m6swYHeD5RHy8u40hS8VUMqBCpTZp
         SDEmFnlDHKe5L30wL+yGylkp8M4BJtiV6P1sVpPDqL0g13q34xWn0qQY84/YyqCE8Bdg
         LdK8JCA63fdA+P47kNAFbNbt2vTgNJDjXtpiouIuhx7EijCIxkh7uzTOajcJcQofhRAv
         MKo8GBmcIex2x6mYsr2oIq7iFy+nYVENAEKpj0TbG7AOIAQNvaAbcGgQzWNj12cIiYli
         ScCA==
X-Gm-Message-State: AOJu0YwM6GMZEiX1nyb7mIX2ac0uB2v0v9gk5JHV7vcca+qTiTcMWnwi
	pe5DDVhOVKVzxrNQfhRcM8U9h4w2N/rDJQ==
X-Google-Smtp-Source: AGHT+IE/ubc8BuhQOqRCmwYeZwqt3aocu1iV8enEmY9wNljdbZjXF45tpunhtTLZ7qWv6o2NFQH4Dw==
X-Received: by 2002:a50:d74e:0:b0:554:877e:837 with SMTP id i14-20020a50d74e000000b00554877e0837mr7367564edj.64.1704190883286;
        Tue, 02 Jan 2024 02:21:23 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id x7-20020a50ba87000000b005527cfaa2dfsm16238868ede.49.2024.01.02.02.21.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:21:23 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 2 Jan 2024 11:21:24 +0100 (CET)
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 0/7] HID: hid-steam: Upstream more SteamOS patches
In-Reply-To: <20231220033609.2132033-1-vi@endrift.com>
Message-ID: <nycvar.YFH.7.76.2401021121040.29548@cbobk.fhfr.pm>
References: <20231220033609.2132033-1-vi@endrift.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Dec 2023, Vicki Pfau wrote:

> This is a slew of patches that have been in testing for a while in SteamOS
> betas in one form or another. Most of them are pretty straight-forward, though
> I expect the gamepad-only mode may be preferred to be offloaded to a userspace
> daemon. Right now, the gamepad-only mode is handled by Steam when it's running,
> but has utility when it's not running too, given the presence of Lizard Mode
> (the keyboard/mouse emulation system).
> 
> Vicki Pfau (7):
>   HID: hid-steam: Avoid overwriting smoothing parameter
>   HID: hid-steam: Disable watchdog instead of using a heartbeat
>   HID: hid-steam: Clean up locking
>   HID: hid-steam: Make client_opened a counter
>   HID: hid-steam: Update list of identifiers from SDL
>   HID: hid-steam: Better handling of serial number length
>   HID: hid-steam: Add gamepad-only mode switched to by holding options
> 
>  drivers/hid/hid-steam.c | 547 ++++++++++++++++++++++++++++------------
>  1 file changed, 391 insertions(+), 156 deletions(-)

This is now queued in hid.git#for-6.8/steam.

-- 
Jiri Kosina
SUSE Labs


