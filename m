Return-Path: <linux-input+bounces-5074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47D9345E3
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 03:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DFA01F22135
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 01:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7EB394;
	Thu, 18 Jul 2024 01:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFHLKzbh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0BB19E
	for <linux-input@vger.kernel.org>; Thu, 18 Jul 2024 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721267161; cv=none; b=ic+LacB392I//UOUutm4oCx1v/g1tIeaWoXlFvdE5ok+7WnbRaZO4tp5qFyEf8pktm5w0Ier4zIGffiqUIMXVvwogcT3tHRW/FBzy/WJO0i2clfGH9Q2SlpBWz2DV5zPPLAnzQiuWBQ8qZqXWQOocx3T4NxsKJPAzWSiKpJcMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721267161; c=relaxed/simple;
	bh=C4cYj/AZJXOY0GKs4lSM1PqXy1CGM2PpM/8NvLRTkhA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eDNyP8YUcoWVCgaTawmxO4EQho5UYJET1whr3YDjovcKjjBXWZ/Hbr7QPhLWzP7QXpJCpbaWHSbidd5KKKtqXBS8xQuiK6qT8yqfwHEAabhl9sLey+aOZKH0BRlQmzFWZYKQyCMnWAElsjQ6ZHPyuMfBWasb8GFGmx+RSShZw7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFHLKzbh; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e05eccfcdb3so323622276.1
        for <linux-input@vger.kernel.org>; Wed, 17 Jul 2024 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721267159; x=1721871959; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yBTa1DgCIrHiqKoM9szQI7ksCer3BGPGT+ClgJ/Ju1k=;
        b=GFHLKzbhQS7j/BLKxkRfh6jBKpxcZO6hQQ8oKSgLyCkBSZVsRvnMM5beZHprwFDzrG
         3Gn9kqL4NUQVeNzKaG8EvzK531ZENlzJ6ZDO+5rx882yv5plpnB1ju0ozlQg+VTVkSkn
         RAlrpdAGPy3YwI+HNGtwFpZNMX/HrweRIr0/8re3stf4t/n+dqdxNl7MxOBJ89U7DuqW
         nbUwipv3axhdrfmog6/EkPQNdMR6lll06HAxMcy9s+2z9r6Y5g7h/lW0j99e3l8bQxzy
         FFJeu3sCkWcM8/vTYq8B52RrjSypdjKEYfDXVsyyZ177MFyfSguq5aaQBl0kr2Fi7vxw
         z6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721267159; x=1721871959;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBTa1DgCIrHiqKoM9szQI7ksCer3BGPGT+ClgJ/Ju1k=;
        b=Tc45HX1JDt6Z5kBIYeYWJ/92VJTUR33DEeSgFuHF/N/MGKkmXacwidOTKz1abTATGq
         3vAPvqUbNMFjqfeIYGYfFG6sOigAkmGKvzcP19uR4OtlVU5PTorqiH1DYu7MYCSD1f/U
         zNtHnHohZPuQW3q3tk0itzaRm9NJo/Cm9PThF59bx79mwOQiK9CSu09p7L0UTrzswH5a
         Nuqezn6Olhc5yZX99ZN6e8CBa6QepOvF6jn8dHd/ohE4ZjEquF7KnFeCuQkKZiyqIovs
         /NoxUPM09d9HVy76hvqeUVYkD9ShZ6v4M/vX1qh74oo5KpR7lMZtkpzc8kQ2ULW0zAA5
         cJsA==
X-Gm-Message-State: AOJu0Yy83awq3234i/8Ga85svl1gssaRxtdgDLYUlXBxgDPaShe2G4HH
	SUEYunJNk/SwroI80YYH02ZK2bQ+kNrHO63arChyPro72IWU2OP+FawP+Um3rVkDO+MrFNW3dKK
	djnZoFFBvFStGY2uI+CtUeSYjqZCc/EwBBkw=
X-Google-Smtp-Source: AGHT+IGn5UaIk/ycQGxuPpxjbgIyww152RZywhTL5+4Bewv9VffB6tFBmvIrAHhHWAFIT0Ig76/7oa9QSTJdZLhHIpU=
X-Received: by 2002:a05:6902:1242:b0:e05:61af:d490 with SMTP id
 3f1490d57ef6-e05ed848684mr3597923276.59.1721267158716; Wed, 17 Jul 2024
 18:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Mario!!" <oiramxd@gmail.com>
Date: Wed, 17 Jul 2024 19:45:47 -0600
Message-ID: <CAPR0m+d4P1X2fiigJ4pd1wdG89cmez80cS+qTfTJ9Uu0BjwUMg@mail.gmail.com>
Subject: Thinkpad T440p Touchpad not working
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To whom it may concern.

Hope I am communicating through the right channel.

Since about a two months ago my touchpad stop working.  At first I
thought it was a hardware problem.
I bought a new one and realized that it was not the case.
Tried to roll back to a previous kernel and I had no results.
After a some weeks of looking trough internet I realized that the
touchpad was detect by libinput (or xinput) after suspend my computer.
But still can not record or debug-evente via libinput, it just doesn=C2=B4t
show any event.

I am currently using debian 12 with kernel 6.1.0-21-amd64.

## Steps to reproduce
`libinput list-devices` does not show my touchpad. After suspend it
shows the device.
If I shutdown my computer the devices is not detected again.

## Required information
- hardware information:
  - Thinkpad T440p
  - The current touchpad had separate physical hardware buttons. The
previous one hasn't, but still was not working.
- libinput (version 1.22.1):
Device:           SynPS/2 Synaptics TouchPad
Kernel:           /dev/input/event16
Group:            8
Seat:             seat0, default
Size:             98x54mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge
Click methods:    *button-areas clickfinger
Disable-w-typing: enabled
Disable-w-trackpointing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a

After report it in a issue
(https://gitlab.freedesktop.org/libinput/libinput/-/issues/1011) to
the libinput gitlab.
Peter Hutterer kindly point me in the right direction.

The command 'dmesg -H | grep -i TouchPad' shows:
  [  +0.000012] psmouse serio1: synaptics: Your touchpad () says it can
support a different bus. If i2c-hid and hid-rmi are not used, you
might want to try setting psmouse.synaptics_intertouch to 1 and report
this to linux-input@vger.kernel.org.
  [  +0.066526] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2,
id: 0x1e2b1, caps: 0xf006a3/0x943300/0x12e800/0x410000, board id:
3157, fw id: 2403511
  [  +0.042611] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input25

Any idea what could possibly be going on? Anything I could try?

Thanks for your attention.


--=20
Mario Villasante Barahona

