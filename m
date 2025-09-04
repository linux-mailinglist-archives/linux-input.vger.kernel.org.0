Return-Path: <linux-input+bounces-14482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F81AB43CAD
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 15:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B774C188CA31
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 13:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB032FD7A8;
	Thu,  4 Sep 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDB95XJT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2514D277CA4
	for <linux-input@vger.kernel.org>; Thu,  4 Sep 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991535; cv=none; b=PSGK1l+HSsJzysmTDKmpL4B93uB1Bi3ERAM+v5SjuuQiwguY0d1P+Fzy5cyFACzGIW5V4wLLBSC2aaEO1fbPcONTB4pCry7Na8nOMBJfTxxXk3yDaDr/pghAxTn4B8fjCenW2o4sgv3VR/56YJLBa7R2NDIq7sOwfVx/LwsbLVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991535; c=relaxed/simple;
	bh=ec/KvvoKbEENb2LavGjyZbfezE0uIP8KPjuOVXbDKU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F94Zw2g5ai5dvoEsnj/Vh3QGOCqOXZOMx+GVtV5xJTZ38UaJ28TVZb3mbknMvsnT8raHQSjOwj2TG2mInGuK1tOSj1OUbA4HfL0m0SzjwKcomMrO1HT19LCPBd08whjEPLrrDMnAhyuQU9TvXBL4QZqW/c9FJ/2KW2HpkQnZb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDB95XJT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso627075f8f.0
        for <linux-input@vger.kernel.org>; Thu, 04 Sep 2025 06:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756991532; x=1757596332; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dpzGRMvpU5+wBtzn4p02ePfJoml3OILLddTZb49OX4E=;
        b=QDB95XJTha0/uHFiVm1TYICbvD0A5DpSn6alB3vs/5ACVASBhXhN1JB2h5y7TqXP1D
         SKiZtQNFNmIxwl4/+8ITSnw/PacTk0tSUl6VUk8LnXkK9pDfPSrFGg7ckcbsZRCWf9Lr
         +QMR7bICwL4ebRndk08iUQxwJj/7gXX3HY/o1JpnrVPLWyBS8RBUODTP2rAf3U7zuByG
         h+l3hnbvlydErMsl5JLXFbm+2h79ZA5yThwMOir6GuMWv4byO9jgbAbmgmR0he8toJaV
         UOZlh9UO4s/Kap8ZDWI2P8+LUCC8zlhBa0fPw9XGsHbKFBpuJiOL/1tD8s1GFaAPl9Ph
         SNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991532; x=1757596332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpzGRMvpU5+wBtzn4p02ePfJoml3OILLddTZb49OX4E=;
        b=VS40or4xphTGuG79oLzOwiplM1+eABj61ZklHr7YZVFhQu0jZC4ik8ZeAiGTgDC0vL
         /nzD4Fdx4yw/9vz//beYyuxkxjO46zjbnVYrmdjabEo/K2fUYGZFYSFG7X4j5BOr8oJW
         vnQ+ObXb+nRTgzJOOeKY4H+mLZLMKgklIGM2gZ8+XILieiBDwVnxiyaQt13Scu4IcHXT
         es2cHjQNX/oO16pGeIIM8yDP1PSL+z3Rm2SaZa70ecRWBGs4u8WdK2pZ52dJjxM20SWb
         GUKdhMt24ClgCtbSKbId+B3bwUWegz1qfiPFhUAHnTAC2APvWY/DsHt08+38kPBbcPs7
         nLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu1scq+82jkBGjaQXkrmptgbJ+O4rTuUlp+xtrzXh+IA3wExvJqKE7ZuwBAGYavAfF4hJ4GwRUgHERmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbOdRSQf+PkAgKRzIvORh0k29Y/pM7RkSXBBkE48qWsRFCkT+v
	ho5y6bVUBPS0i5rEcnlq4MeAknbOdgOEBm6UeAFNdildTWjycoafMULxJRDPNrTd9/M1svsMMjT
	rFisvQOmU/XH0ukT3LSgZUQX6Hrp4gxw=
X-Gm-Gg: ASbGncvRGCrzZptBXgPPaFdt3hrUSPLuLcFiW7v+Ai3la0lEvg9vUSu523jWB3tLq3E
	+2fLOYL82u/X/3UdSkCnZab0hQHNqTVZX8S6ODYWNA5GXOSuN6C9xw1+iLMgDPAjORFtxQQ/5nr
	3EdhbqAfapDw06VzkxxUQvELHr45hMd4VRnbMohvGuQdDXTHPwOqbvjKS1vyJuaI0dFbX36+Mcp
	GmqkZs5MPRItM4X/lB6AijNfUCr2nW/aw2MZMiwbvMvSuWF/YFP
X-Google-Smtp-Source: AGHT+IH76rHbVyTKMAmqAGjhO32vR0jgHVom1joj5iW7wZfw2Qwingm0axsM99kY4dslxl3lYB8UPxSLCHSqhU+/LVQ=
X-Received: by 2002:a05:6000:288b:b0:3cd:2328:898b with SMTP id
 ffacd0b85a97d-3d1e05b5c25mr14841326f8f.47.1756991532148; Thu, 04 Sep 2025
 06:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
 <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
 <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
 <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com>
In-Reply-To: <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Thu, 4 Sep 2025 14:12:00 +0100
X-Gm-Features: Ac12FXzDy5kKXUYHUog8zXKHw7HZ6MZxzBupwFx9V-DAmiP4FY2spZNweDKNZyQ
Message-ID: <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

> Hm. It appears I may have misunderstood how this works. Please undo the
> previous diff and apply the following on top instead:

Done, still no change :(

> I think it happens when the devices paired to it disconnect/reconnect.

Yep, that matches

> Can you also dump the HID report descriptors when the keyboard is
> plugged in directly via USB?

Sure (046d:c343):

003:007:002:DESCRIPTOR         1756991366.823468
 06 00 FF 09 01 A1 01 85 10 95 06 75 08 15 00 26
 FF 00 09 01 81 00 09 01 91 00 C0 06 00 FF 09 02
 A1 01 85 11 95 13 75 08 15 00 26 FF 00 09 02 81
 00 09 02 91 00 C0

003:007:001:DESCRIPTOR         1756991366.827464
 05 01 09 02 A1 01 85 02 09 01 A1 00 95 10 75 01
 15 00 25 01 05 09 19 01 29 10 81 02 95 02 75 10
 16 01 80 26 FF 7F 05 01 09 30 09 31 81 06 95 01
 75 08 15 81 25 7F 09 38 81 06 95 01 05 0C 0A 38
 02 81 06 C0 C0 05 0C 09 01 A1 01 85 03 95 02 75
 10 15 01 26 FF 02 19 01 2A FF 02 81 00 C0 05 01
 09 80 A1 01 85 04 95 01 75 02 15 01 25 03 09 82
 09 81 09 83 81 00 75 06 81 03 C0

003:007:000:DESCRIPTOR         1756991366.831465
 05 01 09 06 A1 01 05 07 19 E0 29 E7 15 00 25 01
 75 01 95 08 81 02 95 05 05 08 19 01 29 05 91 02
 95 01 75 03 91 03 95 70 75 01 05 07 19 04 29 73
 81 02 95 05 19 87 29 8B 81 02 95 03 19 90 29 92
 81 02 C0

