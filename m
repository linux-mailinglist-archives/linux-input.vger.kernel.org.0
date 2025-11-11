Return-Path: <linux-input+bounces-15984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3850C4B2A7
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 03:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 023B83A4CCE
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 02:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B20D307AC6;
	Tue, 11 Nov 2025 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcLXkrN9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313D30597E
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762826413; cv=none; b=mxdmNzJvoXoMme13P8wFjxTHFccty3gB/og+t8xkxFNXqflR6ZuGBeyFK+zCy0GBv86FKA4HOQXwEOa+W1tqgdPpxEtctR0uqUShqmbV4HnxHkOyUtplowDUKJGERqINFkpI2TzxNI9eA+W1AM169uFT84tr6Z0aJ01m2NfXAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762826413; c=relaxed/simple;
	bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMXLU/SdZ0FNZ/Uvc3SuQS9VMLXa8mlX0bQ97P6xLUUA0EFjBpsyS/u9d1EaF8m+H49pqwQviE/y5keQggaEZomZb6KEZn9x8aNsZE6jEucRkPRpCcB9ICt8ep2A4GGYSdGIwX/X2MDZVdfjYXIq9UvrwpD33go+3t7UMEpM53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcLXkrN9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b312a089fso1283291f8f.2
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 18:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762826410; x=1763431210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
        b=lcLXkrN9XAhA0FcMneCG/VerjdhmK6GmOxJIOiM74om3unhsGaJUS3Dl9RwzePUPaE
         ev994qA3BS/0djCoYSv1RfmFq2P8muiHQkXlbVChY/MnWKWGgpyBxbnyE4yQVrEuFyS2
         GTGHGxdjIP7zLYj8nPRp6Wofc4AMXF7uz0bkAnVAymUZnMjeheOrNwp9H8EPqXztdF9z
         g/vQi47tcQR2RzXOxMqr5Huxr60OfbQr0bXtepIx5RdzPNaBPFzTiJJD187iGjLB372U
         xg6Lh7u+XtsAHkQ3hwue9JDlL5VfzKL1MaR82yE8ryILRwamln/7G/576xNxX44sAhbj
         gKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762826410; x=1763431210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JGfOj2u5jUcqRu2eyzSWFIfgFG0OpFssDocNLWH0ns=;
        b=EMwi2x8hZLvjW3zgU9ozIv2RYcq8xlygiha5fSP7dDtCwZbbyYwjcqbEjwvjdjH1It
         Yj60vDtK4Uhxi8mp/HAWA4zSD46+cNE3minRp5f1+UI/hZp+CyXWnZw2LOWanHXPsUur
         9qPplRvMK28DXstVVQk6cK7afm1IXCy0vhzDpg+zHVcE9pLXWcgp7GUU9z24qUv2qJzs
         aLYybnlim0t+nVb1TYm/jO0/Vf8Txy6mhARR4DDadejqoQbqh7o94r6EuvPfvL+STGNW
         znbRvw1Z7bNjjJNvA+lBgO82521+U+R6WJ1E6gRIhr8IY2esqpQbQtoUkFJQfibDCara
         Xh+A==
X-Forwarded-Encrypted: i=1; AJvYcCXU36hKPhFBhILpM6GYSWi+8b6essFZnAem8EaoyUGZAWBbqetsgI/lxndirGlfCS6P5RcmOskuWbIokQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCNQVZE7TKYMWJDDSJznG+N5FIiURK5lEdXIuj5uobnSvp3FX
	/jqpr1SGctiufK+T7Pb+J7/wNxSq5yQtWVz9PiwkxL/xsorC1P60mj34/Hs5jwcpFipOinKhH7K
	FcvniQRytAAzQzaIzaYcfzPBZyksPvzA=
X-Gm-Gg: ASbGncu4/tOpfEBp2SP1ll+L7YLYnhgffcvS7zS7OfVLi8OuCLfqSpaTkeulHf6Jj0Q
	zYtAnUw13IP+K2xd5VtgxBrGIGc7YwStfliS70Pmu9Qwcd2fPDAkuLGqXaTwUAbkqb4LqzTBYiI
	Ww/RBxwKcOqlktyEnMkiIWqS7bUerfY7630o1AJb/jswpU+o85wvuyz53qNCpa27snDk6h6OtuR
	8yEyTmR3X1eKQY3B7wJbMvC/QsZNKWnYDqvkNOG7Gr+SscsWeJgt9Pg/PC/JMjbcRVss72fwkL5
	thi3Q/eNBz2nW3f3n/tX6+5qEWtFK6x4rcvMr584g5fR8y1EeDbMRwl1wm/sUHrCw9aXJBEdKDo
	=
X-Google-Smtp-Source: AGHT+IHdzeUCRfRm2M3JLVLCfmUpbNDJkdXF6cBlJJVtOjdev9N9wpa7IojmZlK6ySR3xDYbcIQXtAMXqpgvL0kJ748=
X-Received: by 2002:a05:6000:310c:b0:427:8c85:a4ac with SMTP id
 ffacd0b85a97d-42b2dc39158mr8864208f8f.47.1762826409780; Mon, 10 Nov 2025
 18:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu> <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Mon, 10 Nov 2025 22:59:57 -0300
X-Gm-Features: AWmQ_bmkQVFF_-Ouaj7ZbqnDQSjb9J11j_X9uoX0YCihiAVIePZwZDN4iEmTHEc
Message-ID: <CALvgqECiTae_zUmrJ8-i9Gd-XENBYFpkpxCo_6DxL+Ct7GUEvw@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> If, I mean it's a very big IF. I wanted to have this device with
> hardware volume control working with alsa/pipewire/wireplumber/etc.
> What would be needed?

I realized that I also needed a way to query the volume whenever was
needed to implement it in a sane way.

And I found it: 2eaaec66 0000fc00 00000000 00000000 00000000 00000000
00000000 00000000

Query volume:
`echo \
 "2eaaec660000fc00000000000000000000000000000000000000000000000000" \
| xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`


And the it works perfectly:

Quering with full volume:
ffff8d49fef1ccc0 1029983421 S Io:3:005:4 -115:1 64 = 2eaaec66 0000fc00
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d49fef1ccc0 1029984020 C Io:3:005:4 0:1 64 >
ffff8d49512cb680 1029985012 C Ii:3:005:4 0:1 64 = 2fbbec66 00021010
2f000000 00000000 00000000 00000000 00000000 00000000
ffff8d49512cb680 1029985015 S Ii:3:005:4 -115:1 64 <

Quering with a volume 2:
ffff8d4af3d70780 1130255084 S Io:3:005:4 -115:1 64 = 2eaaec66 0000fc00
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d4af3d70780 1130255438 C Io:3:005:4 0:1 64 >
ffff8d49512cb680 1130256427 C Ii:3:005:4 0:1 64 = 2fbbec66 00021003
22000000 00000000 00000000 00000000 00000000 00000000
ffff8d49512cb680 1130256429 S Ii:3:005:4 -115:1 64 <

Now I have sufficient data for: query volume, set mute, set volume 0-15.

