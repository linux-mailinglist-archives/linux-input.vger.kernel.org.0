Return-Path: <linux-input+bounces-16451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F301CC9D1F0
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 22:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E3273495F7
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 21:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8763B2D12EB;
	Tue,  2 Dec 2025 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b="AhqMnR6V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.softether.network (mail.softether.network [103.41.62.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC2F2F8BC0;
	Tue,  2 Dec 2025 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.41.62.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764712471; cv=none; b=uv/nlRWsl+390lV9ZbZy1XE9b3bPWzuMIogi3/KDnXX4+YK9JrQWqA4pfK5z4LR6MUnSSIIhnEHYrfuK51ZoY3IayzbcF3Ukepaiu6BSXmE0wDQS2g2cogKCpsZ7T76GGt+UpWBd7MJQZ0dPdCzvwYy+GBrO/HT8bc0iwIn4Iao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764712471; c=relaxed/simple;
	bh=P1LaLEdGYtSZvjG0aZ2YIAF2MyZ+DyS6NDJl1RFkO5o=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lNoKo48lcXVuGr7Z/zABeAnYz/EH5+8/gSq0wJoow3OYSDCoTz+ZIvySvSzfOqDbWhjAWTd5nG4HCrYAPq6s4v1y6axZMLXINONSFMEqsuhJqJPWpApHYeFK41n5yiaOwBFBQkOFfuE79X6p1AUTG8GWJm2bC0nvMdU/iie4T9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev; spf=pass smtp.mailfrom=davidebeatrici.dev; dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b=AhqMnR6V; arc=none smtp.client-ip=103.41.62.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidebeatrici.dev
Received: from mail.softether.network (localhost [127.0.0.1])
	(Authenticated sender: me@davidebeatrici.dev)
	by mail.softether.network (Postfix) with ESMTPSA id B84D1407BE;
	Tue,  2 Dec 2025 21:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mail.softether.network; s=2025; t=1764712466;
	bh=P1LaLEdGYtSZvjG0aZ2YIAF2MyZ+DyS6NDJl1RFkO5o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AhqMnR6Vcg4Dk4isqF83sMeKdWW7Rkjs9ap9coEOePFIjIexCquoxSRcduxMIwQSI
	 bsE+YxoFuhoSDQkZ9qp27JoYoqBu6Ikm+8zKCNzPuXNG3wU1mz8WHuIOC+FakfC/Lp
	 Z24kwCEakUGKnvqp7UdNGU6VM438rdq1yQ8xE+jhP8CXV8XLbL/wBzy7gvuQf1PTQz
	 jvpeuilYf50BoBm0SJME5PB2uZdy5t7+8pG8fPBEgoCUqhoHMap9vL5p7gdxiUuoih
	 qHkNKmGjyy+ziOZkSSzFKVEsY3ZUVMe78O6JEhwMx3Y4aenKo+afYdRyJgJahxQiE5
	 u+hUUDgaPRCCQ==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 22:54:26 +0100
From: Davide Beatrici <me@davidebeatrici.dev>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
In-Reply-To: <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
 <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
Message-ID: <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>
X-Sender: me@davidebeatrici.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

> Can you supply the Device, Configuration, and Report Descriptors?

Sure.

Device Descriptor:
   idVendor           0x373b Compx
   idProduct          0x1107 ATK X1 SE Nearlink
   bcdDevice          1.21
   bcdUSB             2.00
   bMaxPacketSize0    64
   iManufacturer      1 Compx
   iProduct           2 ATK X1 SE Nearlink
   bNumConfigurations 1

Configuration Descriptor:
   wTotalLength       0x0054
   bNumInterfaces     3
   bmAttributes       0xa0 (Bus Powered, Remote Wakeup)
   MaxPower           494mA

Interface 0: HID Keyboard
   HID Descriptor: wDescriptorLength 77
   Endpoint IN 0x81, Interrupt, 64 bytes

Interface 1: HID (non‑boot)
   HID Descriptor: wDescriptorLength 156
   Endpoint IN 0x82, Interrupt, 64 bytes

Interface 2: HID Mouse
   HID Descriptor: wDescriptorLength 87
   Endpoint IN 0x83, Interrupt, 64 bytes

Report Descriptors:

Interface 2 (Mouse):
   05 01 09 02 A1 01 09 01 A1 00 05 09 19 01 29 05
   15 00 25 01 95 05 75 01 81 02 95 01 75 03 81 01
   05 01 09 30 09 31 16 00 80 26 FF 7F 75 10 95 02
   81 06 C0 A1 00 05 01 09 38 15 81 25 7F 75 08 95
   01 81 06 C0 A1 00 05 0C 0A 38 02 95 01 75 08 15
   81 25 7F 81 06 C0 C0

Interface 1 (HID composite):
   05 0C 09 01 A1 01 85 05 15 00 26 14 05 19 00 2A
   14 05 75 10 95 01 81 00 C0 05 01 09 80 A1 01 85
   03 19 81 29 83 15 00 25 01 95 03 75 01 81 02 95
   01 75 05 81 01 C0 05 01 09 06 A1 01 85 04 05 07
   15 00 25 01 19 00 29 9F 95 A0 75 01 81 02 C0 06
   02 FF 09 02 A1 01 85 13 15 00 26 FF 00 75 08 95
   13 09 02 81 00 09 02 91 00 C0 06 02 FF 09 02 A1
   01 85 08 15 00 26 FF 00 75 08 95 10 09 02 81 00
   09 02 91 00 C0 06 04 FF 09 02 A1 01 85 06 09 02
   15 00 26 FF 00 75 08 95 07 B1 02 C0

Interface 0 (Keyboard):
   05 01 09 06 A1 01 05 08 19 01 29 03 15 00 25 01
   75 01 95 03 91 02 95 05 91 01 05 07 19 E0 29 E7
   15 00 25 01 75 01 95 08 81 02 75 08 95 01 81 01
   05 07 19 00 2A FF 00 15 00 26 FF 00 75 08 95 05
   81 00 05 FF 09 03 75 08 95 01 81 02 C0

