Return-Path: <linux-input+bounces-2355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335F878AD6
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 23:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11592821E5
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 22:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA995810E;
	Mon, 11 Mar 2024 22:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="ssVSCewM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Khf5xBph"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7D2E40E
	for <linux-input@vger.kernel.org>; Mon, 11 Mar 2024 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710196911; cv=none; b=vFnsFX2Xhb1GIjzjT+3FKIjOL4p/Q5m+FVkDXl1bN3+TQTEwAjsP68+gaAzfYFPDo3X1li6FtyWAwe2JQhmI3DwFyLOLmEgpBMB3h9uaBVh/9KK4W59nk20hmMzVljDPTJWkZey5cUzQ1JZ/fnzZ02sz0VeS/Ox0N8dmxuNZOEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710196911; c=relaxed/simple;
	bh=kCgyqxA5fAoTBjl4Trrh5IGsCpoqfDOeJEHUJa3SeOA=;
	h=MIME-Version:Message-Id:Date:From:To:Cc:Subject:Content-Type; b=B9G8J6DnB0s3I84UrFgDUquFD7svsjn2bjbYHzvoDb0Ov51xraqvQOg1k9LJ1R0vrPO7moRJwDdK92z1N7wkZRcDqxJ9QXvEHfhZCO2EgwIRqqZBpTGrN9zXZ5Y7iolYfwE4yhT8vlTh9pUglxLrTgejOO9aQwRI8USUAcASJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm; spf=pass smtp.mailfrom=fastmail.fm; dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b=ssVSCewM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Khf5xBph; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.fm
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 95F47114008A;
	Mon, 11 Mar 2024 18:41:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute2.internal (MEProxy); Mon, 11 Mar 2024 18:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1710196907; x=1710283307; bh=fdOX4B9JBnWPNcMwTCYcASy4674199ms
	u1LWzFR46cw=; b=ssVSCewMDnSI+Q3vK8qm1mbNNfvi6DLier/QLFZlESopQhsb
	a4qJtcPcgn8b6JLfMUlGwfEzojaC/IUi+RISZ9O0+xxgucFzBT9kYzwXjxDUXIwq
	3RG6vknSVpRTEeuDpTy2jor8jQWnbgl2bykADB4Xb7CVqNKEawRZwyrmgnJ0lh6v
	ZLMDG7XFc0eJsGGKBml8bfoZgI/s9BdzoTWjqsd8DdSnk+2IvCQNAICvXujmfod2
	FbyCIFJaU1z0mob6MGZNUz+6ourOTwliAesgZBaDsic6r3UjtIqmU8yVs71XckPG
	U1j9jEdu96eXUxlsM6CVlEbb9gk8NxmyGf4OlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1710196907; x=1710283307; bh=fdOX4B9JBnWPNcMwTCYcASy4674199msu1L
	WzFR46cw=; b=Khf5xBphD8J1eJi3VszdwydX55Q7sXrvf18r+ioNz8/Hzmq7IMk
	a7OMUng3N5XKo9wESqbmsw4Qm7E4sw9XIx8wUdJISprFE4mziIvhBULhKDMnrLac
	aKcr5EusFCr92pswzI3FJ1mWrkPBQG+VXgZddrboY1JjMgkPGoXINWRDAkewNlrk
	Aqql9bDVrYUQUik/tE8eiUUNr9Ajx0BeXGDITdwTKP/1/TkyT3n15xsZfqMwhCNq
	dtYnAxboK8ugsxKo2rADio6HTFeXS8qH+15uNse5eymFtaj1eXKbYsbW/bIW3x1M
	OdvYNU1n8Ad+tZnzlo5L4vhW6wukVkQVx8Q==
X-ME-Sender: <xms:q4jvZQENilbQvekQvNeQ8X5UURRl86HKPDqHNUW2ZI7amA1gnxtzWg>
    <xme:q4jvZZWLWANd8bTqVRB1fWqSym8uSycynPU--NpoJrenScynUNKZT2km0y6I4TZcg
    b7DiQPDXp7n1iVDeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedvgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvfevufgtsehttdertd
    erredtnecuhfhrohhmpehmrghtthdrghhithesfhgrshhtmhgrihhlrdhfmhenucggtffr
    rghtthgvrhhnpeduledvfedtveduteffieevjeehiedtueetteffgfekkeeuffeftdeuge
    duiedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghtthdrghhithesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:q4jvZaKk19REyM-mDplHLWgVNWla7rWA4-csCm9vlJ-CdNu1AgQaCw>
    <xmx:q4jvZSER9uMxYBirn588syAn2ZfKb5QXag91Tag0wTyZitxbwSVdhA>
    <xmx:q4jvZWW12MeYwS2Lj6_P4S25VCFTghAeDXIzj6uaGqB0AA56x8xeDA>
    <xmx:q4jvZZe_d0udiMmGwi3zOXCOMQTvxNEbm9pip921FdRAtwt2INKq_A>
Feedback-ID: icc494911:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5F201B6008D; Mon, 11 Mar 2024 18:41:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <efbfb428-06b0-48f9-8701-db291c2a9d65@app.fastmail.com>
Date: Mon, 11 Mar 2024 17:41:24 -0500
From: matt.git@fastmail.fm
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH] Add xpad support for Snakebyte GAMEPADs
Content-Type: text/plain

Support for Snakebyte GAMEPAD BASE X
Support for Snakebyte GAMEPAD RGB X

Signed-off-by: Matt Scialabba <matt.git@fastmail.fm>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 14c828adebf7..712f79ed3259 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -366,6 +366,8 @@ static const struct xpad_device {
        { 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
        { 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
        { 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
+       { 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
+       { 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
        { 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
        { 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
        { 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
@@ -507,6 +509,7 @@ static const struct usb_device_id xpad_table[] = {
        XPAD_XBOXONE_VENDOR(0x24c6),            /* PowerA controllers */
        XPAD_XBOX360_VENDOR(0x2563),            /* OneXPlayer Gamepad */
        XPAD_XBOX360_VENDOR(0x260d),            /* Dareu H101 */
+       XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
        XPAD_XBOX360_VENDOR(0x2c22),            /* Qanba Controllers */
        XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
        XPAD_XBOXONE_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller for Xbox */
-- 
2.39.2

