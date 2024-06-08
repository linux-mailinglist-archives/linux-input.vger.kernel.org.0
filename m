Return-Path: <linux-input+bounces-4267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0069013E2
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 00:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58F9AB212EB
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 22:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDD51BF24;
	Sat,  8 Jun 2024 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de header.b="hk13Gt31"
X-Original-To: linux-input@vger.kernel.org
Received: from shout11.mail.de (shout11.mail.de [62.201.172.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D71E2E84E
	for <linux-input@vger.kernel.org>; Sat,  8 Jun 2024 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.201.172.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717885441; cv=none; b=HjzEul5MQNT740+bjDhrH7hrtKAdNVW8hQdMMIA7CeqKofHSyVNuQyBk4lAVajrEq4ezgBcBPxPdzru78IcUfuKGV9eiFEE5qYpb29c+ytii5UPfMV2+7xASKG+olvoBuNSpTPraUUESzBGIKm5LJ0nWY2SgzVhG//uhbKfnOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717885441; c=relaxed/simple;
	bh=qQUJI9G8Jm15ZRsiHhnAvWbhd8iCXT7pmWx5q8PDMqk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=KCXJXC/GRCbyKoVXCZI0plnFeJ4foI60ntLiSmsQzioRIfoYI0vuMQsn5GbiJkdmtzIAB7o826lQehb5UyANRqgfEwmePARDeSrbyPyaak85wiLLPQUZ/jpP/FFlrodNZTOZgitTbktBgI5aFd0PJDK2GpCowT4qM0mg4tCrxTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.de; spf=pass smtp.mailfrom=mail.de; dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de header.b=hk13Gt31; arc=none smtp.client-ip=62.201.172.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.de
Received: from shout01.mail.de (unknown [10.0.120.221])
	by shout11.mail.de (Postfix) with ESMTPS id 1A79B241946;
	Sun,  9 Jun 2024 00:23:58 +0200 (CEST)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
	by shout01.mail.de (Postfix) with ESMTP id 093C1240B7C;
	Sun,  9 Jun 2024 00:23:58 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
	by postfix02.mail.de (Postfix) with ESMTP id E152EA00E2;
	Sun,  9 Jun 2024 00:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
	s=mailde202009; t=1717885437;
	bh=qQUJI9G8Jm15ZRsiHhnAvWbhd8iCXT7pmWx5q8PDMqk=;
	h=Message-ID:Date:From:Subject:To:Cc:From:To:CC:Subject:Reply-To;
	b=hk13Gt31WU0boKa6qrnvKVV1HrvsgHtp5z7ZUzkXzOMWJjWmgCqqjBdQFE3hifCrH
	 8ihWf8m91hUnVRLo6K7WyQBs3I1fGn8iS8qbcP4oQra1l705+edIrbTKeo7A9bwSSg
	 X8SnMU0yeqQPxzqUl0ZTg8n3+bbEYUrOYu1bTbuCj7+ydk2fQeh3C+psKoAR39TBEb
	 lMzym5/T6PRMff4Y2olWyJmDozJlw+EZa+PSYL9KbR9wSJ57w/nwGfHpWBEFdiNKUI
	 4gyVF0+Mkg+TxDIGDwHC4hpBaCPgNpjls+Wr71yO/OB16uCjd/ULIJI3lWKM+vqpHQ
	 6JWFFUjDz8cyA==
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp01.mail.de (Postfix) with ESMTPSA id 93E2D240C7C;
	Sun,  9 Jun 2024 00:23:57 +0200 (CEST)
Message-ID: <a4bed14a-ffa1-4985-bfd2-517999a8ca54@mail.de>
Date: Sun, 9 Jun 2024 00:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sebastian Kropatsch <seb-dev@mail.de>
Subject: input: Adding definitions for recovery and maskrom button?
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1360
X-purgate-ID: 154282::1717885437-FE5BF670-F736BF3E/0/0

Hello!

Many Single Board Computers (SBCs), especially those based on Rockchip
SoCs, come with on-board buttons labeled "Recovery" (for entering some
recovery mode) and "MaskROM" (for entering MaskROM mode for software
flashing). These are usually GPIO-based keys or ADC attached resistor
ladder buttons.

When defining devicetrees for these boards, the current approaches
include e.g. using "linux,code = <KEY_VENDOR>;", <KEY_SETUP>,
<KEY_PROG2> or <BTN_1> if these butons are even defined in the
devicetree source. So basically, there is no common approach
currently, since a clearly defined key label is missing.

The "linux,code" symbols used in the .dts files come from
"include/uapi/linux/input-event-codes.h" which is included by
"#include <dt-bindings/input/input.h>".

Would it be a sensible approach to add two defines to input-event-codes.h
e.g. KEY_RECOVERY and KEY_MASKROM (or a more generalized name)? Or is
this out-of-scope for input-event-codes.h?

Please let me know. Thanks! I can send a patch if I get green light :)

In case you'd like to see examples of these buttons, you may have
a look at devices like FriendlyElec NanoPC T6 [1] or Orange Pi 5 Plus [2].


Cheers,
Sebastian

[1] https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6
[2] http://www.orangepi.org/orangepiwiki/index.php/Orange_Pi_5_Plus

