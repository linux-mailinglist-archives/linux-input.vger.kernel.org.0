Return-Path: <linux-input+bounces-14826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28167B825BA
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 02:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9732A67F8
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 00:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B531917ED;
	Thu, 18 Sep 2025 00:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="lElWtNb+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A334BA3B
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 00:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758154538; cv=none; b=q3Yp/2rbltAFuGL4i6TqULiehGN99ElOiyXjb2d8pbCua49+iIdhjrQxbN82YyDmY1IJGHpPGYLkcj1Ji9gbsX4EMzk54HUbTecZkIl3zqeQo0pYCXsN5wiNuILZ8i+b+GDtmCxf9HgpQBaIsaH/ZeIdV2bziOEyD58IqhhuV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758154538; c=relaxed/simple;
	bh=CCJTdml2C078GoaCiwVI6vSDHAvVPnkQCJTTyWdAmSw=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=MZrzvIqonEeNcQoVXklgvShbnypVRE3schVCPQxiUWreCLk8KaGGWdjhnKDkGR8iAu6P6mBFhW0ytdSaEX3r7rpJB+RfTt2gYlRnivSqQfR9vfdgXyjTaKWb+uLSK6eCjwoO+GH4BEHO/2/kBG+pnP48fvp7XyrWJddrGlDNBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=lElWtNb+; arc=none smtp.client-ip=79.135.106.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758154528; x=1758413728;
	bh=HB4HgSm59Y5YdVau0roDmeEckS/aWB/v03CpTzC2vrk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lElWtNb+ofeMev9ApXXliUcg5Pd8ZCkx1oBpfXTBEuPzgBMyFUFs4xjU7Q48daDw4
	 e8icDWdQGzTRPyvLvZEv3/tzyUvwUths3RncuVRdjQpaJMqiaZODiT63fUK98Kcl+C
	 OS3oPAAXdQ+AQiWgyKLhmsvq1KT512wrVFyC2dCkLxHYPbbMimQSxzxgCjxnucmO10
	 X8+v5W4Kh0MKv547q3/hl2Lr+lHpFJ8x+99Hi0uATx30i4tE1cSkgOD1BZMg6f8F4C
	 xUK756JDiyqoBvGsr7YLswpoJ9vzItKIyLyCcEqI/ewyXte468uspKkhytonrAgYsc
	 pH/z2tKen4iZA==
Date: Thu, 18 Sep 2025 00:15:24 +0000
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: Vladimir Staykov <vladimir.staykov@protonmail.com>
Subject: [BUG] FTSC1000:00 2808:5662 touchscreen not working until HID modules reloaded (Huawei MateBook 14 2024)
Message-ID: <vJUVkk6_M54HXNNmIcoVnjZo8obRscF0F5cAJO23KT14xFUWeYHAdhUaZb7xgdN5WaK39EDtXU3y92nnVtapXDvyWM7-Bg2tQZmYHcotyNI=@protonmail.com>
Feedback-ID: 3705988:user:proton
X-Pm-Message-ID: 2d0c2370c4c65bc93b35f22bd8386b8722ddf6d1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On a Huawei MateBook 14 (2024) with Arch Linux and kernel 6.16.7, the built=
-in OLED touchscreen
(FTSC1000:00 2808:5662) is detected but does not generate any touch or pen =
events until HID modules
are reloaded.

Steps to reproduce:
1. Boot kernel 6.16.7 (vanilla Arch package).
2. Touchscreen appears as /dev/input/event5, stylus as /dev/input/event6.
3. dmesg shows:
   i2c_hid_acpi i2c-FTSC1000:00: failed to get a report from device: -11
   hid-multitouch 0018:2808:5662.0002: failed to fetch feature 5
   hid-multitouch 0018:2808:5662.0002: failed to fetch feature 12
4. evtest shows ABS ranges but no events when touching.
5. After running:
   modprobe -r i2c_hid_acpi i2c_hid hid_multitouch
   modprobe i2c_hid_acpi hid_multitouch
   touchscreen and stylus work normally and produce multitouch + pen events=
.

Hardware:
- Huawei MateBook 14 (2024), 14.2" 2880x1920 OLED touchscreen
- Touch controller: FTSC1000:00 2808:5662

Kernel: 6.16.7-arch1-1
Firmware: linux-firmware up to date (Sep 2025)

It seems this FTSC1000 variant may need a quirk in hid-multitouch or i2c_hi=
d_acpi.

Please advise if more logs are needed. I can provide full dmesg, libinput l=
ist-devices,
and evtest output before and after module reload.

Best regards,
Vladimir Staykov





Sent with Proton Mail secure email.

