Return-Path: <linux-input+bounces-8918-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC731A01BA0
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8CA9160E80
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCAD1CCEF8;
	Sun,  5 Jan 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTmpv6hc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE61B5ECB
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105896; cv=none; b=T9hlaqSHCRW6+7sl8U/zHaHYU5/C7DgjOUMptczubADz7HdWikaJ/X7Nu2Mb6THOjI02eC4mTtAPZ5DClGGNkr7T3einiYFdsLqrw8uohzyQNTI22sdCqYNY/a39lpQeohvbWku3MJlV1GNcdR6OcPUwhp6bzWBiPqlvZ4rJqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105896; c=relaxed/simple;
	bh=xaGQFB/3tHoelS+lAm4HlmNSPyjqkE4xvVsDWOYfmOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1rJ1XqHNvGvPc4ofN6fGU1RO34oX6BhovVSs8lgU2TLfaFq/KcQCwH8A6cK9JdkU+1+WgjwMfNQJx90GGH1SBPAtlB3m5DWTzrc1CjadV7EvfI2L7KnMFeGRSzhkj7h++0gRMZXbzs7CgQp1a06TBAX8OFequ6Jv27QUlpeQXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTmpv6hc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e87b25f0so9127648f8f.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105893; x=1736710693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uww1KxRaoTyZr8TTwGtplN/ZUFEPEypX88fWvlepoWo=;
        b=bTmpv6hcgDw60buNColaDaBY84sXWoYQP7M5qe5WHmlmcZs4i8vqXSjUm8r72ZfRT1
         wH6ojeY0JowcfbuOoDOviHjPUg9f6XiZGbyF+/4fw4bZPl2DyzjDO4cnEm+Z9K7reSK7
         oX97u2AkBUh6jzyhdkWP9pkYq5dTQVza65QtBOuxMusv6wigbAxyi+qCWOQBQ519NJDg
         jiix8n0//x3dkKY/WKc+jXCGt8+9Dx77hlOOsBAYJnCWbjBEOHPOi+IqPCHMgWoYS0xv
         e7fr/yRljXm/mQxMKwlAat4DwdYkZjdcuA0FfBEFr3MWyn3fliHdiKL4panjalnoQPtQ
         qvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105893; x=1736710693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uww1KxRaoTyZr8TTwGtplN/ZUFEPEypX88fWvlepoWo=;
        b=o4S2AOFLtZhAb2YEfS5zddGZKA4Q3tKlAE0qXSqz8vALUWqTCM6k3HnmGXjA7RBRgB
         RbFKNpLx8LfKtmIWfip8B7+/uaGuDMn1BCOVhvidW1M6/150+0Xc1xrFnHccPWZd8ZWs
         E0FShfk6+r0YwLxAdaqk1MrKf8PpA6fPBWBGv9JXwh3QwaAfiN/SofEVgGiNTu9qqSUd
         NPLwKJlGVBbkyaSRS1WzfmEnmiXKVylsDnR4M2Ie3f7hstPrRi5ii15VWNGmPN7Q/4Hi
         YWX2fk/JWB8YiKZkDXEd2/iXNbQGTK7kL6oJObN0rfqFpgMs6Rlb8JNavInqirmCPJbd
         +9mA==
X-Gm-Message-State: AOJu0YzXX3B+8yCym5552dD9yLNBIO51E/rZhzQRUspt6hh6MBqMIvP4
	eScAJcqPP32X31dozwkG/r7CPI15UKuU2agP4Hn9MfP0Sz2iWhUur2nabEXJAiVPaw==
X-Gm-Gg: ASbGncvnPlYoq58hacv/mzIRR2evCyMWhlfgryQE5VPcqKvra8YVONTb7tE3BiOlMSB
	vPQGheqw0dijvElMkOxMCHOAWloqDRXFLO7jZDqlYm225bMVNSDbcHIWyx+p+5Vr5Fd0l7xCN20
	IvY/PhPSWvGtqvYTozqq+RtHvhdBvRmPxCuL/CkwEsmRXTJEC6J66/9noMtnAsoBlfFYwnQ3/4H
	XGFlvy62TgycqLWqCeGzbed5xkYm0NoUJ9A5EegZjg4+AsUzMhZu/h0NySdOeIo3fXS
X-Google-Smtp-Source: AGHT+IFIyaJOwRM0G69WULus0Fzy5dCWbVpW7KaV+YWEtlT4VVlLtH6wLQGe0xff+hEfRRzEI5njPA==
X-Received: by 2002:adf:a3d0:0:b0:38a:49c1:8345 with SMTP id ffacd0b85a97d-38a58e0cbc3mr13169689f8f.18.1736105893228;
        Sun, 05 Jan 2025 11:38:13 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:12 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Fernando Petros <fernandopetros@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 13/13] Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING
Date: Sun,  5 Jan 2025 20:37:50 +0100
Message-ID: <20250105193750.91460-14-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fernando Petros <fernandopetros@gmail.com>

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


