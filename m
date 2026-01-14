Return-Path: <linux-input+bounces-17096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB28D1F51F
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 15:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 231A2300FEC1
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 14:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB282D3ED1;
	Wed, 14 Jan 2026 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="GTdkGLhl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAE2C0293
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399852; cv=none; b=samihGyPn21QvdEysoQp+wKj3mI5VGU97kvsRDL9plDgz329fJggpWm9Dr9YyHdvgRglwm9pH5u9j+3O4Eto8MzCoEt9pDiyHB4TRKXZ6nT6kj+6uZrwyUx/bOWP80b2ckSmUqolZv/YCltKRYynqVmustgEwJfuo+zmbyAtShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399852; c=relaxed/simple;
	bh=35spYV1p8vkmBQIa7eMRZJGS0wFg8B+sNGW6KV4ukIc=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=TrxGR4rp9td6ETqJIV5/PlitkYcnc4u/hDH6gxXtTMMcNoWQ0xutq9UmhEaCVy0tAlM0gKQ6t/OZQ8AZM+wJhk44cKMvfcwXrQu11xDl2lLLMNWkaWujah/OhGquEd2zwj8eDI9A1HN5qBaYqOcI0mIiCI7gH60QLXQObmmz1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=GTdkGLhl; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1768399836; x=1768659036;
	bh=35spYV1p8vkmBQIa7eMRZJGS0wFg8B+sNGW6KV4ukIc=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GTdkGLhlzG9KEAaUilPe5joj97mRbsLnQAEY1uJgz8P+mXztBSI5n1M/f839XqdAc
	 oQ+lSWoAHjDExxRCkUY5alBnWozclgkdCj4niLuOQBThNcms1QNeMhh9eXZSDhaFzA
	 0ark5y3vO4VUwUYIwFgmHeXbgGWdNfmu3lpYq/N3gdl++pYkJOSTxcAk86Ln1hubTc
	 terNdIoPRlvAzpVRkaVJKApiyXp/z0La/cjNlGhZhNSXC4XkonLHGH0usrd9jegYSd
	 VJ5kPFkPtaNpI3PPK7uk4V30lcZzLYSczV+0E54L7PxGrsfoyRYbXJ29dBdZk9ENsK
	 ogb55B+lorK7Q==
Date: Wed, 14 Jan 2026 14:10:31 +0000
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: minecraftend <minecraftend@protonmail.com>
Subject: Report
Message-ID: <cYCstPQ08orON0NDHNQ11zK2ZMkPFZVKZU6J3xJIA284Xncl_Qj32XtJPGfSnQqOHExVQmL35l1Iu7vw7zP3-69ZEP_s17ne1f7XjC_fcY0=@protonmail.com>
Feedback-ID: 148776411:user:proton
X-Pm-Message-ID: 5b979805c742cca6f5d116bc5252b0a068af1dec
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


psmouse serio1: synaptics: Your touchpad (PNP: LEN2043 PNP0f13) says it can=
 support a different bus. If i2c-hid and hid-rmi are not used, you might wa=
nt to try setting psmouse.synaptics_intertouch to 1 and report this to linu=
x-input@vger.kernel.org





