Return-Path: <linux-input+bounces-16541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D706CB6E4B
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 19:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED543015AB5
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 18:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85CF2F60C1;
	Thu, 11 Dec 2025 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kunysz.be header.i=@kunysz.be header.b="0QjIRwJW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565931960B
	for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765477353; cv=none; b=o4VCqVFBiPExXf3U0JEgSs+S5jUWEOv2dxUHnnbeai2qYHl2Ir8OkAaUnWVoEWjK38DAbuKK0Y0T500RVB06LNuJKtMIIBnNta+5D2jiw8CKx44XXao6GFJKRfgj0pvIVyB836gY45d6/iIahPBkf7CxN7JMydQ+CGmJfz1O3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765477353; c=relaxed/simple;
	bh=4Nvuudsyo+xvPKJZxKQRWusH242kLFCw5y4sLJb3JnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uxu3q3ce0+Jx1E3ib4qazFQdfmgQeCZiinFy/2HnpXB8C9Ec/2tl0PSocQLWEDpP1oAwhyZAv15pfe2w59vWfkdxPilqr7VnGmO80+qVn/Jbg95IUElIOhbuGXjtP4lAoRkpLQWy44Wi5sexUHcBFUUCVo1kTj6AkWDW5c2tOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kunysz.be; spf=pass smtp.mailfrom=kunysz.be; dkim=pass (2048-bit key) header.d=kunysz.be header.i=@kunysz.be header.b=0QjIRwJW; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kunysz.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunysz.be
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dS0sj2tz6zQ2Q;
	Thu, 11 Dec 2025 19:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunysz.be;
	s=20230901; t=1765476425;
	bh=KR8rMgIl8PPrETZlkP1hXxxJaeC0jssk+OqIdL1CVXY=;
	h=Date:From:To:Cc:Subject:From;
	b=0QjIRwJWRqC6CaYJrrFBBshsWxMPw/ioYcvL17w6kGXxUS5mW5sOSTjZZEbU/uvr5
	 7lc4bWaYRxlA/Ti/93kP3Co22ZK6bsIGrAy9UBDymUEJGHxV6FVzjYkpw9Ya0XmyYL
	 ltySJtdC7I1UbKQwrcfNfbFVTFR+KcTwII8I2SQy6QL2DQt8eZk1NENN8rPQiVNNA9
	 IRm1LW+rqYooKHDSSkpoR8bhrBF5v0Mcd9rmwdUveEsPBV6lyQ3ix+E8oRB1ugL3I3
	 1ub5nQD/k2Hm7AjPbsBXKbhTYW2X9+8IzQgMNhFjW+Ai277R8ikuRAPKCxnY7xCaW/
	 wEhwrkfJeEdGA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dS0sh6mbfzBB1;
	Thu, 11 Dec 2025 19:07:04 +0100 (CET)
Date: Thu, 11 Dec 2025 19:07:04 +0100
From: Adrien Kunysz <adrien@kunysz.be>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: controller is wrongly labelled as "Generic X-Box pad"
Message-ID: <aTsISNi0WZb8YCGA@rodenbach>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Infomaniak-Routing: alpha

Hello,

I have a game controller that is wrongly recognised as a "Generic X-Box pad".
It is clearly a PS4 controller but the xpad driver works fine.

The physical label on the controller says "Nacon Revolution Unlimited Pro Controller".
dmesg reports its name as "Generic X-Box pad".
lsusb says "BigBen Interactive Revolution Unlimited Pro Controller".

I am unclear what the "mapping", "xtype" and "packet_type" fields should be or
whether this controller should be handled by another driver but I do know the
"name" field is wrong. So I propose to fix it.

--- a/drivers/input/joystick/xpad.c 2025-10-29 14:04:43.000000000 +0100
+++ b/drivers/input/joystick/xpad.c 2025-12-11 17:20:28.733440851 +0100
@@ -286,6 +286,7 @@ static const struct xpad_device {
        { 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
        { 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
        { 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+       { 0x146b, 0x0605, "Bigben Interactive Revolution Unlimited Pro Controller", 0, XTYPE_UNKNOWN },
        { 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
        { 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
        { 0x1532, 0x0a29, "Razer Wolverine V2", 0, XTYPE_XBOXONE },

