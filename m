Return-Path: <linux-input+bounces-15973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CAC45219
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 07:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F087E3AE5BF
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 06:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BD32E8E0E;
	Mon, 10 Nov 2025 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHVMA1zO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967526B760
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762757661; cv=none; b=eMlr53wpVnngsoKQWXFll0/+6K3bo3QAqOCJFbnEiVX8WlSjqjeJEOTg9HUx+zoLUprHKu1jvgSecgQ/YlOSRhfgv8CFc+ZfS7YKFx7MxtCgi3BggHuwn6F3XWgt1ajZwk5avZ4+G9SAd54bhpMONrJtVbQp3WoK42XAPLfSy8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762757661; c=relaxed/simple;
	bh=IGzhJR3ET+kJgytVpdYEBFo9n95/yM3ijudhx2ByC5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jy5JPyDD9XTE/bm9bL6IoCxXxQL4MrvQCpE/sfEqU6t9RNCYbYzQH0Uvsk0N6ztO+/h1Mh/c4SECEjgF0tVcC4Lonpc0RCzB936M9gIWsmyN6eCAOPj7ENQyo9S4MzDK0/3iLw5tbmpQ595goZC835IyLvAQ3SoUxx45PVA42qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHVMA1zO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477770019e4so15363395e9.3
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 22:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762757658; x=1763362458; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGzhJR3ET+kJgytVpdYEBFo9n95/yM3ijudhx2ByC5s=;
        b=UHVMA1zOXkCqkAySe9f1V21jFbmbO4FJLuxYihOKQkivRmSP878dgmhnN5c85l5gts
         F4T5i9Bet5LOZ6RTpe3RghRB1XCoBDTSJIDif+uYT+qK50yMTs0dbp59GDR1sWSCcT0i
         K9iMOisrQ69LaJH0p+rElh0FPlk8uux67v7vhtZJtTNirHzcJQ+BANW9/nKsq1ZzEanO
         P4wxpPfc03buYwCMcXMeGC3utb8qSerlSqaKiYQdQhrZj9l3XDZ9cSRXNjRYX2enPZ+r
         tGZxkjfXKTKxxuhKifPFfU+JbxMh8+IwdTVlrGDoLJQNU+Sj6Jqw3UZ9ljJO+JwmF2Jp
         AKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757658; x=1763362458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGzhJR3ET+kJgytVpdYEBFo9n95/yM3ijudhx2ByC5s=;
        b=uwVijbteoBX3YrOUXdhh/UJbqQUIeiX4slPIuh3W5KKXFRVWxzL8jYXmndVPx7X5av
         EZpU/+FsQKVr+QrEjns2fsd5eFfCfIf0kj1cxfT90tnWaw+gMeH7WIHWZR+vUZD3/Il5
         RqRHVkJrRCfsi5MGK1OWz984bWYK2KlA40sd2xRVUwVxdDb2ltICeyJE+2v9fPaJjGFk
         8dHbdAR7xZIzrgdcc9RHfzseQ7u+H52TpfHJPfEqEvebb0BGifhtftpdB+VT/wYk3XY3
         M8KEVun3ON8BsgRKeV9v96Twvfrlc8OfndOotOoS+WkR+kTg1AGBVass9bPHMxedrCli
         Tjvg==
X-Forwarded-Encrypted: i=1; AJvYcCWlrYB9JSiAmRBwxYRek/4TuDFtlm7WrOr7ajv8httYOL11ieEQux0buVM21NAVf/1rdbE7EL8VDemzaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZ5XuGn67rHSpQR78c5xrE+HNu8tuzAdKbAZiieifA5f3O96n
	lAkK8HCFasw7JpVpjYiX1nhm1Mlyg+s/zNlP4G5wYiQoXumu6anXDvpbnHMPhcbJc3GzKfixQWq
	qGOOZ+jYS4/vOMW8imBTX1KKY2Jtnnok=
X-Gm-Gg: ASbGncubgEH7GJeM0KJSFZw2GLkmIGZpIdk/18AxO/fywjvLFKol8uUE8v+1ShdubTc
	jtqWVZF7S6FbSb8l4/OtqHAtngpGOLjxZftnCGnH/ZMTK1/bACCvEaLK5z05BK9hMJY6npsyxdR
	LjV6x8imMu2YMwMRz9ZWDNBQ+BwEn3H5IdV9oeFjnhk1G2fcmxanPDF8qRRQU9CasE4JphDfxhl
	QLF2fqnN2H6QjzS7QsEG9Q87K+D5PrOJR/tLgQcJ7SbgXd9r9qBSP1DjHVD/6jIQWy2++aZm7Wa
	fgJsYu1SBGttMzwjidPRD16Vm9V0rw4d+8Pdy1ou1cMcr/6XxQmx+XptX1xiITcb
X-Google-Smtp-Source: AGHT+IFjOuzV7J5oUl4SknNn7zmTju1vL3jK2MgUqw01Xjh4yLtqmM5jA3P/0AT8jD67ZSS+rD6Scfsa6cZXnhkJYnA=
X-Received: by 2002:a05:600c:820d:b0:477:7991:5d1e with SMTP id
 5b1f17b1804b1-47779915eb0mr28436985e9.25.1762757657595; Sun, 09 Nov 2025
 22:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com> <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2> <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
In-Reply-To: <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Mon, 10 Nov 2025 03:54:05 -0300
X-Gm-Features: AWmQ_bnMi5f4xI3hauwUdiDvSmWZ0cfq3GyeyQNoDyoFUscGZuBD4yHULAKwCRQ
Message-ID: <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Terry Junge <linuxhid@cosmicgizmosystems.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

PROBLEM IDENTIFIED AND SOLVED (almost)

Reading this: https://docs.kernel.org/hid/hidintro.html
and https://github.com/torvalds/linux/blob/master/drivers/hid/hid-quirks.c

I decided to try the HID_QUIRK_NO_IGNORE:

I added to my kernel cmdline:

usbhid.quirks=0x2d99:0xa101:0x400

And everything works as it should.

The usb bus is finally not silent and the speaker is not rebooting.

I guess, this device just need to be included on the quirk list to
close this bug?

```
>sudo cat /sys/kernel/debug/usb/usbmon/3u
ffff8903020c1800 42570546 C Ii:3:002:4 0:1 64 = 2fbbec66 00021002
21000000 00000000 00000000 00000000 00000000 00000000
ffff8903020c1800 42570552 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 44428557 C Ii:3:002:4 0:1 64 = 2fbbec66 00021001
20000000 00000000 00000000 00000000 00000000 00000000
ffff8903020c1800 44428560 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 47318560 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
0d020102 00001403 02000000 14ff0302 000014ff 04e200ff
ffff8903020c1800 47318565 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 47319560 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
0d020700 000014ff 08ff2f15 14ff09ff ffff14ff 0a32ff82
ffff8903020c1800 47319563 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 47671570 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
0d020102 00001e03 02000000 1eff0302 00001eff 04e200ff
ffff8903020c1800 47671581 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 47672558 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
0d020700 00001eff 08ff2f15 1eff09ff ffff1eff 0a32ff82
ffff8903020c1800 47672563 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 52600567 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00001e03 02000000 1eff0302 00001eff 04e200ff
ffff8903020c1800 52600577 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 52601562 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00001eff 08ff2f15 1eff09ff ffff1eff 0a32ff82
ffff8903020c1800 52601569 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 54112562 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00002803 02000000 28ff0302 000028ff 04e200ff
ffff8903020c1800 54112569 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 54113557 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000028ff 08ff2f15 28ff09ff ffff28ff 0a32ff82
ffff8903020c1800 54113562 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 54316567 C Ii:3:002:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00003203 02000000 32ff0302 000032ff 04e200ff
ffff8903020c1800 54316576 S Ii:3:002:4 -115:1 64 <
ffff8903020c1800 54317559 C Ii:3:002:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000032ff 08ff2f15 32ff09ff ffff32ff 0a32ff82
```

