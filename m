Return-Path: <linux-input+bounces-6624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F697D74B
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 17:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412971F25535
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 15:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57BA17C9FB;
	Fri, 20 Sep 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYwDgtZo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626417C7C9;
	Fri, 20 Sep 2024 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844859; cv=none; b=JG1QUGd3IPDqNWfNeHWg5GqtivWtthP4s874TpbuxaaHbyGS5wGdqORnKOlZOnL1sxbOE1s7R6hWnqArbZc0eJhHCQLsajDGJrTUIJoTSfp7sj4fFjXNtuqcQSOYM1uY5qeAwqGL3IMBGEtIEv23p9XFjt6pPIzQNN6K47SRxjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844859; c=relaxed/simple;
	bh=T3Bx79A9fpSpiBg/sM2LWVV+GyyLV76LWhZ1clxz26o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YgJj3nriLlPth1Buvx2Szz+j15MIDR5AtJzZ/v5IElO+8qt210byKyrrRNu1vlx+XvOfRMCYxJQcF6u0lzSFjAJOIkoisee43S+xPGSe70AzA5Kvm8c3PhO2J7Y8qg8+0AP3onD4ne2ujd+SkpHm7sE7irhSJvtQBqelKpiR6Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYwDgtZo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718d606726cso1492039b3a.3;
        Fri, 20 Sep 2024 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726844857; x=1727449657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qqssmp9/Q4bMnylmVAyuApOL66R83xQywZPSLREzBdw=;
        b=eYwDgtZoKnvDLvEolCIgRuQ5xEaQtLMVqHfLXUXpkLYPy/bbnt7MzDKUjeC0GeAy8I
         WrI4jZjP7OI+4H6A7QsS+/y/RE9zhPwy55+cDOZjv/lUpOXeIgXDp60ywl/6oKTH1ByU
         I7HEpzIwTEKWPqdqIRPJp8mWqKjMLue/hNlwVE4sjFLyXjzGexy8YdTt3ZyMP7UUrkna
         +GC6Rxq6OseuGdU0HDRE4CAnGjPaPv2PLGd7r2Q2nFPWTFVl3orlAIVs9WBORo3x9/QD
         ApTaw1NuMBiWLX7PLUl3BAHYag2lCm4Ap52zZ6VRJJmiA95YX5CH4StoOls1lwjJrqPv
         ok6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726844857; x=1727449657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqssmp9/Q4bMnylmVAyuApOL66R83xQywZPSLREzBdw=;
        b=RwKSVDEDdwbd12bx7bTvncYNaAHOXASEi7Qdz4k0zXG1CIgOTea3ss5vYBFJGetzm9
         AcsCAVeCXikR+QIYLvT7LhZ9FY9Ga6mPpPsO2RDta846hM8RyM9Iu3zONSZYqgFdAi3s
         HTdm/4ZGajTZ8BG4k/StAdtqt9R/97KF8a2Ar/axVPdJaKo6M7OvoyJhiZpG8hUNy34w
         QMNaYsu/pqfsLJYx8ocKMnprit29W50+HNsefQ9ebLvPkVpvQHLzHNYiZU1B4OBd2XNK
         RB2axtBnLtFoECFsQw7J0L5zces4deKjYdVjeYYwI5UMX3ElW9/xbktMbuTIPZwrjL2y
         NVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPJw3E6i5vFu4sMUEgjjWPBnvHXgt1GQn6FtRFN9hKzLxH9Wqqc1mVVlnoPBPiJ2itJ5ZZ8js4d83/oQA=@vger.kernel.org, AJvYcCWenGfkoXF5aNGyogRY1K2mYfYfwsuNK/9LQRKO0YxsMtOewzg7E6OiNqJ7SPBK4bW2XPpfn3A00fR+@vger.kernel.org, AJvYcCWqDh0k82s148Bfb205IX/PVPRU2D0KpPjiF+jMtCOyfmp0BFsQOfnhrJIP8aMuRLrG9Osa9+t+iVHemChO@vger.kernel.org, AJvYcCXD6jqrBahn4en8EXCV8cjla6FghpcXnjVEExk+MRwZQ9U/6Je91G2fbEontauuD8SioaYnA+SMMmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw95ImUaX2zyirVLLuZX8x6GzzcfECVD+jfPd729HVxgHKGMZzf
	n4W67KWSsWyBVuO77lzcvg+SiRsKnZMbCRa4IwUqvpi3e7H06RngzYNlzVua
X-Google-Smtp-Source: AGHT+IHEzdh15TOy6+vECMW1tVXFloHn7UQoapI0TK3/tNqpmkHmb5bjWq9xhi2e9iQ7SLX0EC4omQ==
X-Received: by 2002:a05:6a21:3489:b0:1cf:2a85:722d with SMTP id adf61e73a8af0-1d30c9897d1mr4086676637.3.1726844857214;
        Fri, 20 Sep 2024 08:07:37 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:223:9c18:4232:3cbf:2f25:b7b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a97799sm9910403b3a.23.2024.09.20.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:07:36 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: SurajSonawane2415 <surajsonawane0215@gmail.com>
Subject: [PATCH] docs: fix spelling and grammar mistakes
Date: Fri, 20 Sep 2024 20:37:16 +0530
Message-Id: <20240920150716.15821-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix grammatical and spelling errors in the HID documentation files. 

Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
---
 Documentation/hid/hiddev.rst        | 4 ++--
 Documentation/hid/intel-ish-hid.rst | 2 +-
 Documentation/hid/uhid.rst          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
index 9b82c7f89..073485f84 100644
--- a/Documentation/hid/hiddev.rst
+++ b/Documentation/hid/hiddev.rst
@@ -15,10 +15,10 @@ To support these disparate requirements, the Linux USB system provides
 HID events to two separate interfaces:
 * the input subsystem, which converts HID events into normal input
 device interfaces (such as keyboard, mouse and joystick) and a
-normalised event interface - see Documentation/input/input.rst
+normalized event interface - see Documentation/input/input.rst
 * the hiddev interface, which provides fairly raw HID events
 
-The data flow for a HID event produced by a device is something like
+The data flow for an HID event produced by a device is something like
 the following::
 
  usb.c ---> hid-core.c  ----> hid-input.c ----> [keyboard/mouse/joystick/event]
diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
index 2adc174fb..fdabf6ec6 100644
--- a/Documentation/hid/intel-ish-hid.rst
+++ b/Documentation/hid/intel-ish-hid.rst
@@ -21,7 +21,7 @@ mainly use HID over I2C or USB. But ISH doesn't use either I2C or USB.
 Overview
 ========
 
-Using a analogy with a usbhid implementation, the ISH follows a similar model
+Using an analogy with a usbhid implementation, the ISH follows a similar model
 for a very high speed communication::
 
 	-----------------		----------------------
diff --git a/Documentation/hid/uhid.rst b/Documentation/hid/uhid.rst
index 2243a6b75..2681038cd 100644
--- a/Documentation/hid/uhid.rst
+++ b/Documentation/hid/uhid.rst
@@ -106,7 +106,7 @@ UHID_INPUT2:
 
 UHID_GET_REPORT_REPLY:
   If you receive a UHID_GET_REPORT request you must answer with this request.
-  You  must copy the "id" field from the request into the answer. Set the "err"
+  You must copy the "id" field from the request into the answer. Set the "err"
   field to 0 if no error occurred or to EIO if an I/O error occurred.
   If "err" is 0 then you should fill the buffer of the answer with the results
   of the GET_REPORT request and set "size" correspondingly.
-- 
2.34.1


