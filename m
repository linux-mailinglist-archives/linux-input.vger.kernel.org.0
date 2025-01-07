Return-Path: <linux-input+bounces-9015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE42A04A37
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC7DA163AE7
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8531F5415;
	Tue,  7 Jan 2025 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLF3plUY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0231F63D5
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278126; cv=none; b=Sd6bvYit+S066ozcN505rM+DyCYMm36XJrpjjbSDRy/JpLUTIPGDrsf5j0ivGuqK6ReF90jpgJV6LaoCA/TERv4PL5SnhAPWBwhtgrNwrzFVJc7oZV0W+ARBzZtARjKzumNsKVKMLbrxUTY9TQwX8r96MT9FaM7Lh7VixkEDdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278126; c=relaxed/simple;
	bh=cmLmTqtHsHd8tosZyJWdWKuB7OT6o00+r330HAROfx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6hNDNGaNEmhZ9iBdoz8PQS8iZvop3cm7xI6MjJVUaNBAoXAk48W8y+3dW9bIpbCtthRUYnZ9SbV0pTz7ZsXY4b9vFV2DrMZm8hSBQVEu5eaRwNuRoLU0nDmoF08IB3RSXo2P//0myK1HWIz1CTqBcRe1e4Gbq1tX7GanLSlEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLF3plUY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3863494591bso8202701f8f.1
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278123; x=1736882923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDZ87D+E1jT8Tk4d9nRm6jOIYNP/hH6VP5Pj/OjHQAo=;
        b=DLF3plUYXoMDm7IZPXghWvhDclZMoM3G760Xf3owl9R1iImESCYL2lLW2MYr7/656+
         dOTAikqnPEa8D9WKolQY7QvT7zGPxWZbW/ag2GH/+vp1zqs3C7t2rV1enQuL7iYdeoTY
         Q6rx0vxdsvNO69bVrWAU/xmUusliOznFCy12X+NdVk6ZV3q1H97DJkw7xnwl4y+eRMLD
         enGlfKXbBLV9Ut/fGq07BI2q2VaT40SPESAI1EoIBbmnoiNTYMYJlY1EEe7frGDA+a/6
         IgkNGh7evfuOPm9n+zhQVYKJxM0UFReIDoI2Ai/ODbriy17wNlE6YTUHV1fa9r8oKRMX
         Es/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278123; x=1736882923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDZ87D+E1jT8Tk4d9nRm6jOIYNP/hH6VP5Pj/OjHQAo=;
        b=WHysLCh6wfdo8l1HCGJQ7/RS/3YF8xHBpQ+56810HP3PSUtkmAiEvt/qGIadEfVGG6
         qLZBCFLcW8tuiDsneeSKNTgsHJgumAZuycd/BjAsc8Us22+L61Dg+0MrypJLXfa4jjZq
         yT3oZ8ljkzQXx7v/p0qOw2MIh+nj/qi5IoR1KeVSr24civjgHmCgPASe+jPMsOQScxYC
         9WW2pvdDlggUEeD2g1n85NvShAW5PMDLYPurE5e+1xOjF/zKnYQpb2YBllnBmc1xSget
         OjktI3kKC/i4i4pPrmgqrMqWSC9E/Udr1LaICedm/1ynYg34hxOsD8cw8gYH89wJBsXc
         lTlg==
X-Gm-Message-State: AOJu0YwMn/xVllBz7bwOcnuXepiNjssms84SL18EvfSOGQDmY3K2DXh7
	UbrWt/JSIaWZrLScRu/v8inriLpKesMGzzkzCR9++R4ixukX/serG45Jbw9LwJyAaA==
X-Gm-Gg: ASbGncuwYDim/HJx86fiEh11HJ50ktgbZIFOMiLvZo3xVMiVRaVWrAngCrtY1EmO8RU
	4XfEZMRenUglJRov2WNrmPB2lAfNp7MIJrXSGmyVsP9i+7pZP+VBUfmmgQNPNH077kvSRRdQ5v4
	p1lsz5UP5bhEwVQcGDRlNCkZFUDXRl0IodV/ia8w0qC/NvUMRnXBmvfnXaNdwhl+/8/R960b7vT
	X1qNHgqHyEgyR11p1aILmUmQFNQgWlDTI6ah4KbHVBXJyLqVZGSx271PyijASqIma8H
X-Google-Smtp-Source: AGHT+IEaCvIF5QP8aLBjvvfPDglb3PlA+08y2jALVppPV9qOGm5O4byL7kHb0R+c/y2B13JY+tbheg==
X-Received: by 2002:a05:6000:4a03:b0:385:fcfb:8d4f with SMTP id ffacd0b85a97d-38a221fae8amr54505336f8f.21.1736278122414;
        Tue, 07 Jan 2025 11:28:42 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:42 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Fernando Petros <fernandopetros@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 10/11] Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING
Date: Tue,  7 Jan 2025 20:28:29 +0100
Message-ID: <20250107192830.414709-11-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fernando Petros <fernandopetros@gmail.com>

Signed-off-by: Fernando Petros <fernandopetros@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 509e8681e5dd..647c788ec5d1 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -140,6 +140,7 @@ static const struct xpad_device {
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
+	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
@@ -497,6 +498,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x044f),		/* Thrustmaster Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
-- 
2.43.0


