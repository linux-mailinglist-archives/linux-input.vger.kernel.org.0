Return-Path: <linux-input+bounces-3721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46B8C702D
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 04:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C082833A5
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 02:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C81366;
	Thu, 16 May 2024 02:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM1B4py1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AC9522E
	for <linux-input@vger.kernel.org>; Thu, 16 May 2024 02:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715825313; cv=none; b=jzt9RT3sm0jROE91YClOLsPSxlSyK2hOlBUVu849qDnCSJswifg+GWmyUMougYxNV/UkyrvYnZtWmFr6n6YO496eKLinC05oaKEtA0k6YXSVQGCocOQJ0K8JC/zzhSUi//xQn5sNHfvvlQanb85FVvS2GTxVU9Z4HtvBvcpN6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715825313; c=relaxed/simple;
	bh=295IpEzTzKBaMDAoGocww58UcyV23v+o+qb1caBVtqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+2BfmF+fUf+jjm8rq7MO9pe62CLGeKvfU0ZivI8We8V9np+w2AKpi9E3Y5Jlg6A/GyWngrwAQCnmIZ2Nw/XaOGJrkqBy6Suo7mxlisnnEn6GBvlvprIjihd1LvuH27NkYmnJxgvNOtNI93wJotTg5rrUmhbly28O9oiD2ojRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM1B4py1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f60817e34so258210e87.2
        for <linux-input@vger.kernel.org>; Wed, 15 May 2024 19:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715825310; x=1716430110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DldcK2P1iYmtNDcDWuOdhj9eFZz8bUkLUMpagmINlU4=;
        b=UM1B4py1yg/C3zHlInmOzwfr9XJk4URcEGuP2se0+VyEa6RFEYBn61q4ZhhSFGemCs
         PQ0t3sTRTB/oZ2Wqv2cWX4v4FUFPZQMiJrA1r+Hnrgns/4todYLdT0MsLYvMVd8DzpOx
         DU6aY1ZNJhxDsl3fUxOsTkDpTfRjvUdmrYbvcUbjnVyBAE1+hPC+RD3TUIR85el3BByi
         1HAVk8xIUhL9rOMYuvH3sqxDqG+6krZd3jkhqaDkOB4OKacjMDPsh9xkl7OyuJoFxrTT
         JkF857l62CSkcHRsHByde+CwL6w36cP/jGnkZrThezNcHk6lj6TZDzHtej3ysEAWmYq1
         lV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715825310; x=1716430110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DldcK2P1iYmtNDcDWuOdhj9eFZz8bUkLUMpagmINlU4=;
        b=cLhdA3h5wfaqsk30TphIud3Hs0ZzkLf3eqv8zYoEqcHAjKqh3q5X/hoqejMZ7GzquV
         SAjtdfLtgvcsRfaTZ8BXeUZH3YEc+DVUAnUk8KHaHMH41PiF1eJKYkwPxEAzw0mjhtyo
         /bUe2rHBlsHO1dBfLX4HEYih1BmVmlI5iNhmnenrZ47SVT/SSmy6rjxfhwA/0gzPpZi7
         RPNm5275Zs+MjSWf53Swmx1O9KSKpOhStn1hMBcOdCJrxKzkjI/ilgBa+4VGBtFq9ZKg
         WRLdKaC13sl1MPy6Z7GC1U2FsLnQ1b1S0yPUfADMK8fpjkqdwZlalveKcWH/OY7yuh2x
         Cqxg==
X-Gm-Message-State: AOJu0YytVVcdiQvZkJKHdEt1bj3fJ/1+MdMo/NkS+bALkL0vjJTStLpt
	OwVwknRAaBdJ9PGrkmMRpNsMYErNmhJ3RgBDGxIs18P/xTvSap3W8EGAZg==
X-Google-Smtp-Source: AGHT+IGl/oZdJDE81J3cyGk6ZGGpwNh8wX68Mw/Zo2dlrK3pSVaN/3wUwHf+ABiYwAGQYDcCnEiEVg==
X-Received: by 2002:a19:ca5e:0:b0:522:29f5:3b09 with SMTP id 2adb3069b0e04-52229f53d70mr9798668e87.47.1715825309754;
        Wed, 15 May 2024 19:08:29 -0700 (PDT)
Received: from localhost.localdomain ([94.25.179.14])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d3791sm2748843e87.174.2024.05.15.19.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 19:08:29 -0700 (PDT)
From: Kirill Artemev <artewar6767@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	Kirill Artemev <artewar6767@gmail.com>
Subject: [PATCH] Input: xpad - add support for Machenike G5 Pro Controller
Date: Thu, 16 May 2024 07:08:26 +0500
Message-ID: <20240516020826.4051-1-artewar6767@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add VID and PID to the xpad_device and VID to the xpad_table
to allow driver to use Machenike G5 Pro Controller, which is
XTYPE_XBOX360 compatible in Xinput mode.

Signed-off-by: Kirill Artemev <artewar6767@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1697ff90fe10..45cee8339b58 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -332,6 +332,7 @@ static const struct xpad_device {
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x2345, 0xe00b, "Machenike G5 Pro Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
@@ -495,6 +496,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
 	XPAD_XBOX360_VENDOR(0x1949),		/* Amazon controllers */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
+	XPAD_XBOX360_VENDOR(0x2345),		/* Machenike controllers */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA controllers */
-- 
2.45.1


