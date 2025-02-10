Return-Path: <linux-input+bounces-9920-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE4A2F71F
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 19:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A0BA164104
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 18:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BD045C14;
	Mon, 10 Feb 2025 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LooriH4d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9225B668;
	Mon, 10 Feb 2025 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212327; cv=none; b=CZ1y5nGhdz9EVw2pY/O5C04mhVxxVtyJnnm/7kM52bORPyapCw3Y2mFIh1oqD2rsyNTMKSoFuyG0vGM3jJ/R0Z+CgIk4DwwHOidYIctM1wFjNz45E5Y1GmU1+Ky/5USGR6nPk38mH9JYAuElC0okB4TE6f3hO53fESPHl9SHJjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212327; c=relaxed/simple;
	bh=i+axvSnIq4V8Aflv8Q6EN9xkzYvNBjD+qKtdTYGMHfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCiRYtoSizRs5GgS2jmxVYdqfq3iRpjt+X1WVxelHJ4gO0v/Mo1cOX/w2TWMdG9mLpBg6NCcSEHm4BekNUqZbliOVKUbBWqIkRHB50ZpKmMj3hkelf543Z1mGm0pSy6u5d/9tBY4Qh9VcOxfS+fOPhqQAjmlAZoKjuQ6mIcWWf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LooriH4d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43675b1155bso52689995e9.2;
        Mon, 10 Feb 2025 10:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739212324; x=1739817124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i+axvSnIq4V8Aflv8Q6EN9xkzYvNBjD+qKtdTYGMHfI=;
        b=LooriH4dhOjzS7glZP4Bkhz85p+8PbsDELSWgUKTGZMPGPMTgXVx1gI5iP+fX9etnR
         c4X7a+xjpHSSfeJJlyuc7a1gbCWpI0ZQ2S3O1GbXYx02ODTmQJlbQz2n9M0k7GkL7Iyh
         GXJMXRitng+A+ml3uMvhE+90a7+zRK4UJNzrPm4gM7A4DFj+lZfqpwk6QmOjgfIRIQEp
         FoluihlnY2aQcqbpISj/femtb8cqHU0HJlAGSRdWDHAIhttuMHuAYNkijo756uF8aUR2
         d18nHc29LobST9r+amV+uKR/3F+YuIdpFUpwg186cC4/QB8EoyUo3n9T1XoJPqDjH7Gy
         jgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212324; x=1739817124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+axvSnIq4V8Aflv8Q6EN9xkzYvNBjD+qKtdTYGMHfI=;
        b=pKSt2IZhEf4uAFqO3vBD/PLceMsn+Mjou77ouH7yaNJmyxUbZjJejL600OUEoAzN6M
         0xj2WUMBdheoS8f/OwO3DpMWt+bLkXZ8RdmpGfXWHl0CD4aokSX7PbAeYh+H0qtpcRiP
         HsQVd45OBpHJ7JKAIMT6YrMIoiCIRpfTL6ZjhRVMOis3yfjWwkfLKuccNbSxMGb0+ls+
         nvoTg653XEA/4SqRuOwRru9XswDAXrq03oJ++NTeltg3ClL9aFIOwfe0+k9fsf8Th0vl
         Yk8vCU7dUxRmIyAq4E+zt9Hb3CIJ/fjzU6sUGgyFjyW3mBLxr/Uqg/IiQ9341UJ8GJes
         qVSg==
X-Forwarded-Encrypted: i=1; AJvYcCUsq3+WxUxwaIzfVZKOr0smeDc2oYE2FkoqgC4t2cJ0E2puFgva6ViS3QHFDE7HPFJN+l6za2Vf/VdceDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5xXMwxI+zy/jnuHacjRIjh46ZRW+QZrsNKg3ACaeNW/YGx+o
	MnYDmDl+Jz8BkTwa5hp1ovskqqbLU+0IVWyniH66MJXFhCd3QTKX2ON8hFdBWnYhljR/fsUz2ew
	X3kKHNIz9WOP+jTTZokD6KoCM/qQ=
X-Gm-Gg: ASbGnctc7QhkA/jUjnOOVV23JCgncsWqQQcpzquzS399u+gEAS6cDQJwVIsg/fKdolb
	nYCy2T7Raf9pkqYjaLPWYgMJ5LT7kV/IcNNwZkV6MGU8NTxl7sAMB+kNHJAdWbpBnOIcwxUG30w
	==
X-Google-Smtp-Source: AGHT+IFZRUg3vgqOHbXKD/8b6fxEAEIuRBjBidVUC4VL0IrjNHXznvi4ScLMOwRKZBs9uaMSFCbVjfcvo6yQ19GkDSI=
X-Received: by 2002:a05:600c:1c92:b0:439:4589:1abc with SMTP id
 5b1f17b1804b1-43945891eaemr40169715e9.14.1739212324249; Mon, 10 Feb 2025
 10:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
 <5cf187db-1eae-41a8-a33e-ef68a4f66db6@kernel.org> <afb96547-7ff3-4070-b960-33f4af7e3edc@kernel.org>
 <CALTg27kaxGOzq2k-dAqbXZ0ez5e-WZRU47Z2eP5297VVHF81kA@mail.gmail.com> <0bc098bf-6c02-4d62-bcb1-939e1f0b9f95@kernel.org>
In-Reply-To: <0bc098bf-6c02-4d62-bcb1-939e1f0b9f95@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Mon, 10 Feb 2025 18:31:53 +0000
X-Gm-Features: AWEUYZk2U1px9bQ8_mYcGrAptjmCrGXp_iVBcj_SVpdT7l8akzKd7GfoeunPz4Q
Message-ID: <CALTg27meqwVyR_+doDzT6v-frx9hfy=fqkz-S2fTJpk8SMmThw@mail.gmail.com>
Subject: Re: [PATCH v5] HID: corsair-void: Add Corsair Void headset family driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Not that easy, as AFAIR power unregister cannot sleep.

Sorry, I'm not sure I follow, why would power_supply_unregister sleep?
I thought the issue was about locking mutexes in an interrupt context,
why wouldn't using spinlock_irqsave work instead?

Stuart

