Return-Path: <linux-input+bounces-14386-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47236B3C245
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 20:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D92E1CC3CAB
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 18:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC91304973;
	Fri, 29 Aug 2025 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=emergence.ltd header.i=brandon@emergence.ltd header.b="QFOaEoqU"
X-Original-To: linux-input@vger.kernel.org
Received: from sender2-of-o51.zoho.eu (sender2-of-o51.zoho.eu [136.143.171.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FFC21019E
	for <linux-input@vger.kernel.org>; Fri, 29 Aug 2025 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.171.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756491055; cv=pass; b=UHMoGe1wJMqommzhAsJP5uD3HRk+DFo1qS6qqm2N1BDHjXJL6SFNgVY8GGyfHzxXlGRzE+3PziVXxMjR5wKmv1uQGClFFa8ws+SOpN5bKJU2cRvp94/V4IDFPCeeyV8GQpvuVIiJ70VV+oRhlwt8hUK4TyEw1cdyKC2W//nC1rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756491055; c=relaxed/simple;
	bh=hAb6lQUexnkNdskk6vOZusKMuovzzN9Cfq0wS8vNk8I=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=P6h39C21eD/6bg2CupA44FGy+lPR+Z888VJo3qd7eVlMUe/qd3De2TTKfLUgA/yi2usdOF3FXvxds2OSOSUhME+fCyBF9eqF6OiQaCzLi7s+0YRhyCAdRnnJHrUYtUB+b0ik0fYUH3uM0fd8CSjMrGBFLp5u5Kcz64EfjMm1TTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emergence.ltd; spf=pass smtp.mailfrom=emergence.ltd; dkim=pass (1024-bit key) header.d=emergence.ltd header.i=brandon@emergence.ltd header.b=QFOaEoqU; arc=pass smtp.client-ip=136.143.171.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emergence.ltd
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emergence.ltd
ARC-Seal: i=1; a=rsa-sha256; t=1756491043; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ifgnYeGWjxm9WF9KUJlyjX6eFtCuPyKRp87B32kQzUTS6pP2Szg7tXlacHzBS1cORqwLubSzMgHqd9U0iJNOVrEZQBsCQVLrTdRsWEpNzwzhZn+MrJQ4ag2PySY1zrDxOBB5yMBjPDlL6s6cRmhGzHmd5SBw5xYoNXLa7SzLsNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1756491043; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=o8a+8O8f/4m8zJrzxZlLSa5bb04Vn32cMQAfVdDaMfo=; 
	b=PFbKlO1QD0+Xpw1AiK1Q0ppzdNq+f5/dxpVA1D39hU5wpeSqMw1OWOngPW8CjtTCZO4yWjqI1WhJuCYgihx/e4MDZEIl8tfQW5g7ccPY5v+FvCTUjv+ga+/IfnVZjlgQOq/f4h75a0lxLx+YxCfL1mUACDfF8NU2anvljZFelms=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=emergence.ltd;
	spf=pass  smtp.mailfrom=brandon@emergence.ltd;
	dmarc=pass header.from=<brandon@emergence.ltd>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756491043;
	s=zmail; d=emergence.ltd; i=brandon@emergence.ltd;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=o8a+8O8f/4m8zJrzxZlLSa5bb04Vn32cMQAfVdDaMfo=;
	b=QFOaEoqULyzvO++fYAfQfo/3lJAWNuzfltgMEZ88Kjo7SQzw1u9h0pwM+1IdVxi1
	rbk0Y3RlBK9fOpCrhc5bdYgXFkbqURKoQyNPHdSzvI1OSFwLxN8KusWdA+LQVUT94cQ
	XUb6+OdOyx83Y/A7BtMOpBmMnzbjsiw22je0rCMk=
Received: from mail.zoho.eu by mx.zoho.eu
	with SMTP id 1756491041598252.66904715773205; Fri, 29 Aug 2025 20:10:41 +0200 (CEST)
Date: Fri, 29 Aug 2025 19:10:41 +0100
From: brandon <brandon@emergence.ltd>
To: "trivial" <trivial@kernel.org>, "vi" <vi@endrift.com>,
	"linux-input" <linux-input@vger.kernel.org>
Message-ID: <198f7064b23.1194b1b9d477339.120973386817363979@emergence.ltd>
In-Reply-To: 
Subject: Adding Kernel xpad support for Flydigi Apex 5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,

This adds support for the Flydigi Apex 5 controller to the xpad kernel module. This has been tested as part of: https://github.com/paroj/xpad/pull/328

This patch is very small and simple, it simply white lists the controller so it can be used. The trigger and stick mappings are none standard, but SDL has the correct mappings already shipped so it's not a problem in Steam or games I've tried.

Here is the patch:

--- linux/drivers/input/joystick/xpad.c.orig 2025-08-29 18:20:56.157442704 +0100
+++ linux/drivers/input/joystick/xpad.c 2025-08-29 18:19:29.539174760 +0100
@@ -422,6 +422,7 @@ static const struct xpad_device {
{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x37d7, 0x2501, "Flydigi Apex 5", 0, XTYPE_XBOX },
{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
@@ -578,6 +579,7 @@ static const struct usb_device_id xpad_t
XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
+	XPAD_XBOXONE_VENDOR(0x37d7),		/* Flydigi Controllers */
XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
{ }
};

Thanks,
Brandon Lin

