Return-Path: <linux-input+bounces-5515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C42994E8B1
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 10:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0842328311B
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 08:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825D41547CB;
	Mon, 12 Aug 2024 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="x8CPpckq"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007814F9F4;
	Mon, 12 Aug 2024 08:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723451497; cv=none; b=Y8kqKVXS0Qd6iGfK1cjHMQy0n/V1RBz635x53h3Lz15TY1ydYE2G0RHJhftd2+lhk/c90CMhSUOfDSm9PpAUpnQPp99eagTdEIgeKJgT6Ue/fu3zraMS0MusngvmPOJVEZijc3etM4Npi2GvigtszpoEGSY2kmTwj+P44dJi+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723451497; c=relaxed/simple;
	bh=gArwq0eGABeef/TNDtuTItU6TBFvrr4tiffxyHFNF3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfqKUbUDYOmamExVutF8tPcUc7bYIIOly8uI4oi/y7xp3OWw9/qrvOEPVcNIvzehKPY5z3aLTybAHA9cqnfACE3TrGtpKwfAy+NhybTT1Q9UVRQHMA08F78TyXb5fl0Ojd99qeOKr4l2r+6sw1bPynjasz7wLnYNyTs8SHLxgzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=x8CPpckq; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id B2D1B2E0973D;
	Mon, 12 Aug 2024 11:31:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1723451491;
	bh=gArwq0eGABeef/TNDtuTItU6TBFvrr4tiffxyHFNF3I=;
	h=Received:From:Subject:To;
	b=x8CPpckqrjIWJbfcMuKCMMYZhR5lhixc95s1rD1hVvA/CxVP2lPfkyY3wQSmG/JgE
	 C57b76Z+5I2MTnPw6VEn8WsPFYsq0QBIskGRuWjJpDV0fsST53TXWAYs1u0rAxGxCw
	 he0pCZC3XZJPCQoP8Kxd3AU6EsS0ogg0fkYYDH+M=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso46110331fa.2;
        Mon, 12 Aug 2024 01:31:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWdaYa4iigWECKum6oCmEUwA81XHqQN/zgBx4ofOhy7muFrTL+bGV9u5UcjJMgj+podcctIIvEgDZIblkjFP1YXNud8v5cRAzMORqqU46cLXac/SOBdoYCT0RgbRu9kPPhbgGehMy/ctE=
X-Gm-Message-State: AOJu0YzPFBcFJsui8BhttbvjsKSCgOhtw0TXvErEuRaLR5rQ9wt0kYPu
	B0huTXvTFpx30nU9FbcItW1Q/aBNP5cY3liRrmswHqDYtxuamyh3IIAC7qva7PxMnFAAIhn6u0c
	AP+HewVcBx7BfUZ5KRpj/0FRG4TU=
X-Google-Smtp-Source: 
 AGHT+IGbE3Vccrv2hHGjFPSfPfx2vsvdl9g2LOutDDSjx2DiGdA2mfEZQy1fVWVt/aMf3JHjo5xGU291sPuQIgTa89U=
X-Received: by 2002:a2e:97d8:0:b0:2ef:3126:390d with SMTP id
 38308e7fff4ca-2f1a6cf4c85mr62287911fa.42.1723451490063; Mon, 12 Aug 2024
 01:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
 <20240811231443.43986-1-derekjohn.clark@gmail.com>
In-Reply-To: <20240811231443.43986-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 Aug 2024 11:31:18 +0300
X-Gmail-Original-Message-ID: 
 <CAGwozwFN6neJf2RGOR_e916KvpPWpsyKJd5pMcE+WoOS+M5o=Q@mail.gmail.com>
Message-ID: 
 <CAGwozwFN6neJf2RGOR_e916KvpPWpsyKJd5pMcE+WoOS+M5o=Q@mail.gmail.com>
Subject: Re: Re: [PATCH] hid-asus-ally: Add full gamepad support
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: luke@ljones.dev, bentiss@kernel.org, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	benato.denis96@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <172345149105.4799.16321279704519321719@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Derek and Denis,

Let us be civil. If I could have bug reported you I would have bug reported
you. However, for some weird coincidence, I do not have access to the
ShadowBlip bug tracker or the relevant communities. Nevertheless, this is
not relevant public discussion. Let us refrain from this discussion further,
including e.g., name-calling.

The MCU of the Ally is the embedded microcontroller that runs the RGB and the
controller of the Ally. Therefore, the discussion of the MCU powersave and
wake is relevant here. What is not proper is that I should also have replied
to the original patch. I admitted that much in my original email. However,
since you are now aware of it, I trust that you can block the patch for
merging until you review it.

If the patch does not function under normal operation, this is relevant here.
It means this extended patchset is built on reliance of the broken patch,
which raises questions. Nevertheless, calling the patchset "experimental"
is hearsay. Therefore, I will refer to it as ambitious from now on :).

> This is 100% an issue with your software. I just completed an exhaustive
> battery of testing at 8w STAPM/FPPT/SPPT on Quiet power profile with only
> 2 cores active. The tests included using Steam by itself and the kernel
> implementation, as well as running InputPlumber (which also has an
> 80ms delay).

Please refrain from name-calling. I was very specific to say that the issue
here is that under load when in a game, Steam will either let A leak through
to the game or not respond, sporadically. While in Steam UI the combination
always works, regardless of TDP. Since you did not test while in a game,
this renders your test invalid.

To save you some additional invalid testing for the other issues: using
ryzenadj on the Ally causes misbehavior, especially after suspend, where the
TDP will reset. In addition, modifying SMP and core parking can freeze the
Ally during suspend. Therefore, for further testing, I expect you to disable
your "PowerStation" application and instead use the low-power platform
profile, which is provided by asus-wmi, and is the vendor specific way for
setting TDP on the Ally. Or use asusctl, which does the same.

As for using direct HID commands to program RGB, asusctl does the same,
including many other userspace apps, and prior to this patchset there was
no way to do different, so I do not see the problem here.

Best,
Antheas

