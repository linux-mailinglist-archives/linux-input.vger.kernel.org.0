Return-Path: <linux-input+bounces-9926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F05A2FABF
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 21:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F00C3A594A
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 20:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D071B81741;
	Mon, 10 Feb 2025 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oh64/dDK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D118DF93;
	Mon, 10 Feb 2025 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219568; cv=none; b=qH4V6J07xrX4g5u8IwsAsii9XK3y74Wg1+LxFyRE59MCZTEaW/o/lzy9pVzI27OPfW6PIsEZ9109aK2rAsruyNQqyg12MYZMHHpUBK5bl/jx8XsjIMvfOzz5bTyk/NG2KNJtQKiAGYNZBtX/m/3ajf3ZyCp9XxHXFvV4nADxKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219568; c=relaxed/simple;
	bh=9mdv6LcPyVc+fMTZTyCEvDgqCBzpS6DH19XaKBWYQdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jc9WuqwQc5IGWItWKPIBXkrPzDZyNnNxD6FCo5zE5BvBuUYImttRdgeLKWnIbCWVg2qHaq4v1ZpY8EzB5D4bZk9DRlUvrRj5QoK6IgNEAeZdTaGRqtAtSZKrgKtlX6lAgpFLAg6ztBvYFiAaJPXMwrBv1nDjDScL351xdFRdw8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oh64/dDK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4368a293339so53746485e9.3;
        Mon, 10 Feb 2025 12:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739219565; x=1739824365; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9mdv6LcPyVc+fMTZTyCEvDgqCBzpS6DH19XaKBWYQdY=;
        b=Oh64/dDKsvjn4pLK9SQsczwRMdlAkToH/v/QNcxKdstS7nr8MY7nubEXjHasVfmtxs
         QrdtEXeL500faAM55px49LYL3kfL0Uq/rN81MIjKOU4sS3vn2So+EJ3vzjXFuOZGExQp
         sdqSJ6QFNUuyoslRk5HkBRd31XhUFW/oAB3403AD0BtBpwjToE6DSBKIroaSMPO6WPCg
         czlOX5lmraTJwZiO5/B15AySIgNby+kSK9i5fAZypab9oVcF7Q8GuuMZHGbGknoOT2ZB
         kUp+G/rUocuwxbDO0lMv0sCEc5f1FT+xpWEDEVVRALolXvMStFvIZTxK2iee0CXKtDpw
         Wp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219565; x=1739824365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mdv6LcPyVc+fMTZTyCEvDgqCBzpS6DH19XaKBWYQdY=;
        b=dxs5JEHceA0lNNl1TmHJ3x9sIKrtFHqF3RWsPwNkaRIk/du869+I0Gxk7wVy8fvhsA
         nCGo7aLct12HTIVDzRJA2hcDAQwZf0YOXVk6amkS+l7YxQhX0Ew2EP4Dv5hefTVhGEBF
         5iGKjubQ9gwssjdNNWRD6AL2jzhiJW6Uc9DsF2uDMVbFEAK0WTiyR7Wh+IV64SeNoTmD
         vQWfMpG+63Jt/WlPvKusyrtt6DDztV8T8umHKZ/Q5zZ+lqvHFdp/z5agFjSWaFrDK6Zz
         eUKtgaMbngxAq0MVhJH1uPMqXRqX6xRsWPgGG3N7B6odGXqYtEzDfiyQ6BH1M1sKV9VM
         YlOw==
X-Forwarded-Encrypted: i=1; AJvYcCXq4n61gYTHQRmaRMcSfaUcISBwBpnmqWoyM+/DyVdn9iIdistvm6GQvLjFAUMflXH6ifQqf9NFLvLs6L8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztVb5C0QZXgztS05pZU6ViyXHlGIhcyH0cWOkAZYChwbZ6ZNvS
	MOaFQdfXiAHnDdsftxz6Y6EdHGfLNaCQMS46gBo+u2spcF6hoimxTP4WPTRKi5aVl0ThSxh5bCU
	adHDiKJzGS9+e+iwyJa4HryK/YHk=
X-Gm-Gg: ASbGnctLPPpnFTug4QaD6vE298c7eJdVU8bUVTuVvPpL+/eL2Gg17fuDaVxhJUqOS0y
	k5/S0o/w6oew8q9Pt2bY8KJ5+eJbezyzCvEbM4SD1YugegL2xBFU9H9jjBvhCPNuHOqiZWf22kA
	==
X-Google-Smtp-Source: AGHT+IHTltxbzZhMknfHPeSreQJkpDgzpdwguOODM4obPq1rCpesDOy3aPlIh67rPrgXe928VlBwtAcpotspyvkvbkE=
X-Received: by 2002:a05:6000:1fab:b0:38d:df05:4f5 with SMTP id
 ffacd0b85a97d-38ddf05078fmr4456732f8f.42.1739219565186; Mon, 10 Feb 2025
 12:32:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
 <5cf187db-1eae-41a8-a33e-ef68a4f66db6@kernel.org> <afb96547-7ff3-4070-b960-33f4af7e3edc@kernel.org>
 <CALTg27kaxGOzq2k-dAqbXZ0ez5e-WZRU47Z2eP5297VVHF81kA@mail.gmail.com>
 <0bc098bf-6c02-4d62-bcb1-939e1f0b9f95@kernel.org> <CALTg27meqwVyR_+doDzT6v-frx9hfy=fqkz-S2fTJpk8SMmThw@mail.gmail.com>
 <373c2d57-a513-4c2a-ae38-1aa01262c197@kernel.org>
In-Reply-To: <373c2d57-a513-4c2a-ae38-1aa01262c197@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Mon, 10 Feb 2025 20:32:33 +0000
X-Gm-Features: AWEUYZk2UlFOwsIx94uOf1FXZqReK9Hor8cGroTp8HR7Xr6GLyq-WUJMsy8HmM0
Message-ID: <CALTg27mhZ_O5=Q5QwmtAbFuz+phcmt7nVfJo7OAUcvCvDu9ggA@mail.gmail.com>
Subject: Re: [PATCH v5] HID: corsair-void: Add Corsair Void headset family driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Anyway, maybe I misunderstand, please send a patch and we will see ;)

Nope, you're right, I gave the spinlocks a test and it did not like that at all

In that case, I can just move the power_supply_changed call into its own
work and then schedule that from corsair_void_process_receiver()?

