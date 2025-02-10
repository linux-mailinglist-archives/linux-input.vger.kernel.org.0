Return-Path: <linux-input+bounces-9899-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF82A2E861
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 10:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39763A9BE6
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6943F1C4A0E;
	Mon, 10 Feb 2025 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK7SV3vO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA92E628;
	Mon, 10 Feb 2025 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181450; cv=none; b=NaXVIjRGarwXHeUcU06NaK+t3u6QChA+99ginoZOVqMwhE8j7Pjth0UuHeBTB1diBu3RMmX1L7D4l4UhwpCwdYq5csEBi5PZp/WWTn1O+iQZe14ds1uRzTmRy2gWp74SEATkKAxkz6NVTUXLQ5y41Pv61GU85f4PEqMlNnG+qvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181450; c=relaxed/simple;
	bh=ai5rpfVE3YWo/segFVBNNIo2GaJLfZnlgVB9MtJv96A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfwFENP7StstkTkC9TO4F8PiLZFPe3jTMxFTfjO3WVBq682j6Np0zTj2pf5LZHrLblIYMGa7zV8o2E8FWu7n2k9AgdvnoBNju3Yp8E89aOwEd1tX4lmMHYNuWgzUT+YdqzTQ0Kxmwsl+zlSgD0kH8QvUvw5/WbZZpa7oLGFqqeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK7SV3vO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dbf5fb2c39so1007769a12.2;
        Mon, 10 Feb 2025 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739181447; x=1739786247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgD+CMxFE/KwSI3UguVnz7zPQRFZKYX6OX7SdjOprpI=;
        b=SK7SV3vOuCEP9wAZBkMHQehigK6f/8lb5P5jTnt1UZ3NiAUYzSpvBRzul0GOMv1pcG
         emcM0reQrL4tOpU9xFo9FtEnpsrQXzgxAapUfxopg7D/mCxg7tHqX0mDjMif6cuXHbaI
         eihpNOZMBBZPaZuaYrY1E0AfoKBlB7Ewll+VzuV4xSQBE3a8XaqO7L90qlk13P0G/6ET
         3Kfog0kcf5JFs+b3p4SXhRNGE6VYc/kAtqO2fYUHzvoRSf7AwHQkfmyiPfziCfh56idd
         W2F3X8JhrZ11bPRoS7poHof5LbfNmAhQO4Eef2JGgkDLp5XbdVAmLtMUZ7bQb132EZUG
         u70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181447; x=1739786247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgD+CMxFE/KwSI3UguVnz7zPQRFZKYX6OX7SdjOprpI=;
        b=P03tLOfLkdNidLqo5Rmx6otjiiQTaHCNuzoxlNS9IUcxveSxwWzryOp1ItEqpOEjmd
         JV04GI6s2cu8bmwYKvs1nT1d5BleHEyRzUJkvkCAzQTS6rHTNI59zPLvdrfbk2c8bVHk
         bKITZGXJSQHcp5pz4NNR9xnHWOgNw/hAJhx26sv3NdcoTL6caNPFoOiN5OAXXn57+d5d
         Zt997zXHVPLQGAuvu1WadWfLUD9B1/R6rUHhOHw4oDAuchPuFNJTx9ny7dKghqdd0dJG
         0LRpcL/2Og5Q6PceRObIZY1rN2jW6/VthGV5QQ6diB4F3SqzlvnrLMGW/00WMQWTenwx
         OtTg==
X-Forwarded-Encrypted: i=1; AJvYcCU3TUCnvXMScYuInekX4aQH7avKFGyNqsFPVUcMyftEPd5ly37PvVaauSgs2Vls63zVuDYY6iBAnCfU@vger.kernel.org, AJvYcCUsVirjgdpOJEv+dskSY1CRMii+A8FX994ws1OVrTe87whbSHPY+tfDbuqr44YB0JKTIjdqrarcTGty4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+mFkv/t9A91211NDfy/l13Oj6+MOzYloAOeiluUY1fryI7yIP
	oThgSlNmFbVDi/fc7cHfLRkr3gObkoxidTR29pTduzigM/BR1D3zu7PgfEvEdkC4s4ruY0VYK0k
	3GJxe7nUKJIz3LkLUjJ0KpkAeEK8iZQ==
X-Gm-Gg: ASbGnctHn4jnzY0e9yQZrvc6nSzwaNnmqyJzgiwHiu2vqihyvp98Tx7iM1f2UJvSuDA
	lj8GsCZF39t02DbTPqOQeME1mrVk7aA+x5OzFOOQ/g34IE1vMlIxlcRSXA/+3vjVVIXEQSJY=
X-Google-Smtp-Source: AGHT+IGfiXmbZwvbymMxM+V5CAxJ1cvcTzPfdew0QCJAP+LYUrYLqXs6wSSgzcYFbfhCy7TmVhTibtMAX0rNC6UllZ8=
X-Received: by 2002:a05:6402:210e:b0:5dc:8845:6a00 with SMTP id
 4fb4d7f45d1cf-5de450d7065mr5709074a12.8.1739181446727; Mon, 10 Feb 2025
 01:57:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
 <20250208173628.5734-3-tomasz.pakula.oficjalny@gmail.com> <773ns28r-189s-9s5o-71q3-3286s376866r@xreary.bet>
In-Reply-To: <773ns28r-189s-9s5o-71q3-3286s376866r@xreary.bet>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Mon, 10 Feb 2025 10:57:13 +0100
X-Gm-Features: AWEUYZlQlMwJvcAddYMDGWiI6-CZ754CpQRIKMpRMKB05r3csVFUO2SlzZjcneA
Message-ID: <CAFqprmwgTRC7OOaRbcHNKL-AcReeSVPnjP=g=2XQwSmU+7Jd=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, anssi.hannula@gmail.com, oleg@makarenk.ooo, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Feb 2025 at 09:52, Jiri Kosina <jikos@kernel.org> wrote:
> On Sat, 8 Feb 2025, Tomasz Paku=C5=82a wrote:
> > +     /* Try 20 times if PID_SIMULTANEOUS_MAX < 2.
> > +        We must make sure this isn't just an error */
>
> Sorry for annoying nit: this is not really consistent with Kernel / HID
> comment style :)
>
> --
> Jiri Kosina
> SUSE Labs

No problem! I must say I did think this might seem janky as simple two-line
comment didn't feel right when it took up 4 lines, but on the other hand, t=
his
looks just a bit out of place as well.

I'll send out an improved v2 today.

Thanks, Tomasz

P.S.
Thank you for merging this. I worried we'd have to wait for Anssi to leave
his comments/reviews as he told me recently he's quite busy and doesn't
have much time to go over all this PID work but he appreciates the CCs.

