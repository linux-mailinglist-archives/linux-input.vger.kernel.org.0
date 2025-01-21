Return-Path: <linux-input+bounces-9414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81487A17B43
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 11:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 490063A3AA2
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 10:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238A21EE007;
	Tue, 21 Jan 2025 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjc+4aZG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7371BD018;
	Tue, 21 Jan 2025 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454664; cv=none; b=CPzSrW+webqwEbzCZfg/GbRQm8pvQVwPZRfbHaenbosA71YJoz+LpaO+zPuTeOILbLOO6ShI1GqKY2RuMaw6C8wRtZ78Btnpu1RXJKenZyFIASXbUVzds4Et6u5t3G7T+aBXm6uPudr9vkooX4GROQFFq3F9OmInILF/4SB+0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454664; c=relaxed/simple;
	bh=zt2C8n7wcGnVt6tr39NRSwNTLndPiYanBVzStB7lr74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEorpckn3LZuDkJWjV/oJx2+K57loP5g+gHov3jBfpudvEcMdsGsNZqIweJkb/o1Uv9MugZO0siPueVxB3n93LDhS41JM5sloCqrqC/2wk8D/004yZDQPswS2dAsg3rd873VIPPjJeKSBOHZwp87sDv524x+2kzsQAtP3r63UI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjc+4aZG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so983974a12.3;
        Tue, 21 Jan 2025 02:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737454661; x=1738059461; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QunOkm0KJZwWuL9wuvfpBTONC1mwKVPIoJPe2RssJP8=;
        b=fjc+4aZGNNUcM8i5eFYj2QKUYAYCsmHXR/hNEfCG967nztlLDQQqhezFcVzvbRojs5
         ecaU6FrpBnKGAYNeabJjazXftXcJyuVni0UqGhfY4suhgedoxTg5WXSHzPlQa0z3dsY3
         2UJeQszo8sG8Fi0ym8Dc7GAt4+Lyez+X5r4bqR+vJr85nV7pEcSs9L50qjdf2bzht0h8
         5uGSQ/p72tx0U2nbizUKqc/6qUy3T6E8G0EU8EW3Tmn0JOHx7USyn3s0FbdZYEfkMI+t
         MY7fjSETeAAyExHmPWMbZ3DTOLdW7PRC9Jjz3ofEw9vriku/2J7xOzNCYHpHrMYfV6iU
         9X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454661; x=1738059461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QunOkm0KJZwWuL9wuvfpBTONC1mwKVPIoJPe2RssJP8=;
        b=UL5G0tbkp6m5HKGZW3vBPIH38sN8mTDMui01Hntk3hU8ru5FH6hz4gG+mprYxdFs85
         DO5uDjdYhwsqkhiFoEa4Ii3t1uaZcR/XFOBMdRa2Vy/6Xkw3ay5EzbOVpSEQAaKxxyZD
         h2LJ+KMpHEWsq4fkRUblTz/BzkAH4hjVTgtPV65O6fDHvcPCHtUtJK8cg9V/PPE/DFKO
         xjUhoEW7mujkOb3qMowhyLweg8AzpXslrCBXUAfdk+txendeL0NR6pWTyjg2h9OPKXMH
         RuPRgnooBK3Eq4pdAYrxhhLEA9sN6xvMY47SvPW/8tplcT7ZjEAt5dnglblGeGJT3IXh
         gvNw==
X-Forwarded-Encrypted: i=1; AJvYcCVEHH2LdJQot4akqxIpYrO69SQ00RcJzMfn02BPXfQfPfaYaTZ/HxlokOjYE/4qhYEkUvbdtiKgw0qOlg==@vger.kernel.org, AJvYcCWBH8vS75ZVrTdeAwN11dDMEfouKs0qy3iLqagynMNxeUxdauCfYWVIL1CBocgoH7+75pDnXeSW4AGd@vger.kernel.org
X-Gm-Message-State: AOJu0YxlAJeC0kVzIMKAxi83sKdKGDBTQ960vgfTsnSDy1Qw3pqiWiVg
	C248jNMsnWM8fwvzCuO0/j0Qx/xIMaeMs/b67riK//uEsuBL0b2ID8VuLJ/eCfL3PSu/WS2ZO20
	IT0nuqhdt4nPvi0JTf6qXbM+OIfo=
X-Gm-Gg: ASbGnct4szwz/hZb1bg8CEAuB3JbEcfw6othAltjtZ/Dz9AsvrK1P1E5Xt0mK3ibG0w
	jQGFlXmuYqjywBHx1VjLewzqrEC8VnHXigfSoHfOWewQ+Hn/4Ow==
X-Google-Smtp-Source: AGHT+IGRdOqPY8TYTsgVF2CEYSlS9ySpMMpEKTieuMxxcJo2j/fxWcaQ6MY3eRh8moIxVcYGSUBhoBbkDBhCxEaUM9Y=
X-Received: by 2002:a05:6402:3595:b0:5d3:fdf5:4b28 with SMTP id
 4fb4d7f45d1cf-5db7dba5474mr6252064a12.10.1737454660403; Tue, 21 Jan 2025
 02:17:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com> <a7df5090-ff71-44d9-83e3-442876522c74@suse.com>
In-Reply-To: <a7df5090-ff71-44d9-83e3-442876522c74@suse.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Tue, 21 Jan 2025 11:17:28 +0100
X-Gm-Features: AbW1kvaowjzEh-_ul8n9YrHWmSrxRSXS8PJbKeiXIRRfQGfQNMDRI8s1sUCYU6o
Message-ID: <CAFqprmzt2+dngxVDEiLNmR1AmjU0d0AvsebrSz0Y9w23BJ+8Aw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] HID: pidff: Do not send effect envelope if it's empty
To: Oliver Neukum <oneukum@suse.com>
Cc: jikos@kernel.org, bentiss@kernel.org, anssi.hannula@gmail.com, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 10:59, Oliver Neukum <oneukum@suse.com> wrote:
> I am afraid this is the most convoluted piece of boolean algebra I've seen
> in a long time. In particular because it mixes things that do not belong together.

Could you elaborate on that? What here does not belong?

I think the diff is a bit unfortunate and doesn't make it justice, but
this is based on
code that was already there. Instead of just checking if the new
values differ from
old values, we first check if any values are different from 0. If
neither are != 0 OR
the effect didn't contain an envelope previously (NULL here), we
return the value
of the check.

Only if envelope isn't empty and if the effect already had an
envelope, we compare
the new and old values to decide if we need to send an envelope to the device.

if (!needs_new_envelope || !old)
        return needs_new_envelope;

Could be represented as:

if (!needs_new_envelope)
        // empty envelope
        return 0;

if (!old)
        // effect doesn't have an envelope yet
        return needs_new_envelope;

The last part works exactly as it did before.

Just to make sure we're on the same page here, here's the resulting code:

static int pidff_needs_set_envelope(struct ff_envelope *envelope,
                                    struct ff_envelope *old)
{
        bool needs_new_envelope;
        needs_new_envelope = envelope->attack_level  != 0 ||
                             envelope->fade_level    != 0 ||
                             envelope->attack_length != 0 ||
                             envelope->fade_length   != 0;

        if (!needs_new_envelope || !old)
                return needs_new_envelope;

        return envelope->attack_level  != old->attack_level  ||
               envelope->fade_level    != old->fade_level    ||
               envelope->attack_length != old->attack_length ||
               envelope->fade_length   != old->fade_length;
}

