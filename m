Return-Path: <linux-input+bounces-14470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C42B42B1E
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 22:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE11416E045
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 20:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973C92E8E01;
	Wed,  3 Sep 2025 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIssFSS3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69452DCF69
	for <linux-input@vger.kernel.org>; Wed,  3 Sep 2025 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756932031; cv=none; b=FxgmkLbhk6U6pc4Mv2vfpLmnNa7gqeUotS6DdzAcyEY1ahdU7iCbs3INwrVqB5NgF+ft7ELdd9MHydL6nL6liMATT+3KM9+qA7FQ1o4N6axKhQpC6vQMTaXN3/ycXkQEbqhD1UL0fsaERL9mJWIFriRnOrQPcGJXMqtBv2V4m0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756932031; c=relaxed/simple;
	bh=U2B0eoeQWV9Eic+hhtRnUnPuoMzm6lWpoR0Ga3vFxPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6Q+3SogI1mE+1sSaLUTE7XP5ed/ammOkS1jI7I3bx3GpZ4GHhdfGkzoOsQbN85+wrW6JOv38NN99sxFUICHqFm411jelVb9gEm5M6tXgJsPQ9AKCfylHbAP+55xlpZLC/pPq05h22YyPK67qmlbGV8VTU3rAeRrkIRDyNWegeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIssFSS3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so2591845e9.3
        for <linux-input@vger.kernel.org>; Wed, 03 Sep 2025 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756932028; x=1757536828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2B0eoeQWV9Eic+hhtRnUnPuoMzm6lWpoR0Ga3vFxPE=;
        b=IIssFSS3xcy2LX//0a90t7fzupTCUG/HjdjmgfKGdqrDKPXeY7RsnlJEZ0YOsq/oMf
         4Cpq++4kqIwMmdjWTc8KY1mB4CWU7LsZH+n1Gq4ZJPEPP8BSRq6vo/d7pnKfWICZbDiK
         6envKqBdmp7qeiDWx+zZReYnng4MpJJBc9QJcc4JBq48kFBuu42hxvh5AS74XNIfLiaA
         KRBt5dhAv07DDIQ030e4KRvJIPcYDr4vroTq2av5BjNJfl1KnkUSUw1qn2zM+8q4Fr8Z
         4CTPMJcVLYpbsdfyE71aqLbSaEQR2jmJlVmgfMCBEPbmrZWSp/XXDzBS3dBV5Amzr1v8
         qTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756932028; x=1757536828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2B0eoeQWV9Eic+hhtRnUnPuoMzm6lWpoR0Ga3vFxPE=;
        b=DHtxObSszLyK5cMeZoAghEun/20oF2MjFiAj+hHe94DPAoWDI8pHkSP960q/X0MAsu
         3IbkTxa0zOU0HAvrrESdy3XFlXrxO0pxBTbVugRVAZzRSHnT03d+2LaJjjWYu2hWKXwm
         Cfzq8wl5EskM/7W9Xy6FkMO/Vu2QPiUjBSztTY2zFckwN97J5oFy1YeJWoyP7yxG5H2o
         rVWxpO7aV5dSWm8sdvtNQWLGTRoIuNQTT6FxakB/k2d5eTFQBxu4VzCUQ2uA3aN9s1Pr
         VSCLQcESb44ZtGqjG5YcgfrBYKbDPJ7m57cx56kRBPSFex+LkehQQr/myLJzrm+nwHXG
         8fgg==
X-Forwarded-Encrypted: i=1; AJvYcCXpPyIChfE6fI1kkLKQtYe2yGVgHH2I2d4l9Wea6D4XROGSCtJK8ONomfGYJo48zN7cBHxG3rSghaJyTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SS3cbHf47hjdDm9QVMQ9e2XxfGTdTCBb506hq3Un2lxHGs7r
	jlHm4fSbgImSa4H/D0PKvJ05dEQdmmcnDwOSbL2D87IL3i5JNAONMPCUFo58K0/eGBk4RNuQcyD
	SFq9h+l6dq9OhtSL3JdnLhLf6CSqVkbQ=
X-Gm-Gg: ASbGncvLHVmfOU6hlm7Wo1DJeMiW9sx7bYKVq5Xyw96QWMa3gEfez5OeUE+I+PF4xsT
	vcO5cwA2nH6BDse6X1xt+lKVFT36VvQD+bd5CtsWhvPSn1Dh2XmZhT/lE/CtEx464pTbp7WaudU
	rxHkE4k2V6omGUgWWwowiheEeN7DCylGud+TrsGmcoLfpYMdV4McZul3uYEtqgh7pMTB7ChVw8R
	lu6L5n+vVHFZaeUB86j9aJgBqORfY5f17G29lQL
X-Google-Smtp-Source: AGHT+IE6TZMQgYgxpfwYsKEF718Nkb32Wr00bdz1nhPuZKh9IbtC1eLF6P/hwXdvU0+MCi1S4G7uunIjDHm2zv4Ed0Y=
X-Received: by 2002:a05:6000:2909:b0:3d1:b8dd:c1c2 with SMTP id
 ffacd0b85a97d-3d1dc5a2febmr15393887f8f.13.1756932028089; Wed, 03 Sep 2025
 13:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
 <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
 <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com>
In-Reply-To: <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Wed, 3 Sep 2025 21:40:16 +0100
X-Gm-Features: Ac12FXxMCOj6nFFBcqzRT2o-v-2Sl_dbeQ41-Byz2I73pDio_t018uBZtJrqhcI
Message-ID: <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

> Can you apply this on top of the existing changes and test again?

Unfortunately, no change in behaviour

I forgot to mention in my original testing, I get a warning in my dmesg:
logitech-hidpp-device 0003:046D:408E.0007:
hidpp_root_get_protocol_version: received protocol error 0x08

Thanks,
Stuart

