Return-Path: <linux-input+bounces-16398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE1C93538
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 01:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 918A434AFF7
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 00:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D21D1946DA;
	Sat, 29 Nov 2025 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5xWHzJa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4919C54E
	for <linux-input@vger.kernel.org>; Sat, 29 Nov 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376368; cv=none; b=LP4y0oskp2sl7okm4GqeiLqiKNoR2fbJ5bBO/dc7x8ttfpA3V9eHBzGA1UKJPA29y47EohowJAilkjd8cojwhuJiAjHaJ8SeplOy1DXBv4805g7foqeY7dv3etAIZWg4JsLc+Ik9Kaz8n0heikFDk4McJQAFa3Yfr0QqA23/g04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376368; c=relaxed/simple;
	bh=Jh/783xqciUdedh9IDWPXZ2+CVD4b9ocBmZqKoH0yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXfvzF65xj+7X1eiG5lWC3YECokudNaVC5Zf1WqcDeqMtQJ12AS2KhaHArY2ijO+7v4E8x4zqMFlBjvXnDSmQbQ4u6fg1wBQvv4NNR3Ae78pzAHSp88VVcOoGQzjqQFMdLeeJr9EcnZtFVxY+Ih++MC+cYP7yYSME7JwmDaKgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5xWHzJa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2984dfae043so20601085ad.0
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376366; x=1764981166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/sv0PvGQwRqr1vhXxlC6sNnbZ+cS/dp1dWnLHgBvKk=;
        b=m5xWHzJaC25waKlq8PWRMMsWaBuRYjbdHb4bxvMtihJg6qriRih3ZS1UjNSVBmv2hp
         jjzJ7Px8EV+BkMtlM4BDvuPDg5pXOKX1V4TW7x61B6tFGZLaQdzQ4nkvnTNBONq3v4j7
         i6FwR70xsWvB22LsB4/UBwWR6lZgg+EhPirPTOehl3qeyLkqLHB290vMjPGOQr0Smfu3
         2Ukszl2IUwqqhYhlmuArNcetE19nVMjQ8SSYDc0q87f14ibs1mQ1W2QFMl2h4Du8clUD
         dTStBoYiGDQmUtt8uTHn6VbWq5EJTCJ14NsTD/kDMLnqg3hujMxyYsIde1Fe+KQEFhHT
         Nh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376366; x=1764981166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/sv0PvGQwRqr1vhXxlC6sNnbZ+cS/dp1dWnLHgBvKk=;
        b=KuDj/RjntZIJ6MvCVWU/UmGsJ1Fy+oPd6voYCeyATK4XmGNpRzt1Qto/UxywdpHZvY
         KtQY/3P2PZCDaE5LqDJ32AhAMEh08AfIcwAy4cK4tpnFiEAyFDaWdn58sxX7EXh3G+vS
         PjmgP2WDY+IVBp783LWvmKpKpouZ8IXAWFUVqWagQXhFf/oKHHZ08RtIVjqa9jaRw/Oz
         VtpcaDTbJKqwN6/JWjxzzLvFYoFw58uK/YxWX0LsOFnDYqokNB4XGQvbFGJqNvyHmjpw
         +1RXVgaNsfzlPlnp00mec04H3KE61NRJf2+QtdRiiB5kQ69xwC3cCCOYQ5nZUMQHn1QI
         wLnA==
X-Forwarded-Encrypted: i=1; AJvYcCWcrdo8r+OHRBmgTmal2baarsQdN/Yy5OvZj+iydYVNVo6DFaTFDZVPQfEzvVrdcSGXR4fJ2ErCPDmjJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYqN7ZNFF47OnHYgeWYDJa+ip5ier4WidxRGybOQkZ+a0PHRYx
	tcF5Vv3dt9wAA1Ur5ZJAia4h+FHcKcNAoDYmbjoppOiFsxytKQGsKTa1
X-Gm-Gg: ASbGncu1HscRSvCv44we8E97ZKzKX4zWjXY+fiTsZ0Yq/5dMGvrJ4QEHN0G0ksPJ8DI
	4aksQqd4r1plijjM/drONLG5p1+LxvDePL96hIVvv6Zly/E/HReFLllh78qp0+dKCtKAD+yhgAC
	vP7lSERpqK2ccCvJopq3MfKKDqE7tE030D3B3OkE5XIkBGPKCQeYEmPFMzpvpHsPQTcfhvkEKQp
	oOgEQArCrlIGa/eSOHLE0aOkkTl9Pc9pAa0ns1gLOazRfOdiihxLUxQAs9ytD3QMIylI0sZCwWa
	vIN/ZLdWz0IIpTTuXEAhC9O4W4xZWLE6iVMmoKb2yVb+BzMgjm2NbapLNzfcT7fshMxHHbK9T8J
	yA7c3jO/fRKUKzyjFSS8VXRb6pjrcH0cFq9fwmpmu7faIA3U6MHyG+tfZpaVLNGaQq7UX1hCRmj
	5B0twrSX2x/A8HsdWRYZHpbRODfihWNN6aS+arp5bVxBKeWAUBbEV6NnIsvibOZ3FUERMQ7nGJN
	cn8
X-Google-Smtp-Source: AGHT+IGaG7HX0TRE9DPtAnNXxioWmI46iVYPjVATZ6u7cdhnEXZz3iP5AEmvXo+W0mfvPpLft8hqUQ==
X-Received: by 2002:a17:902:fc43:b0:295:6e0:7b0d with SMTP id d9443c01a7336-29b6c6bb2f3mr323906235ad.56.1764376366189;
        Fri, 28 Nov 2025 16:32:46 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:45 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 3/3] Documentation: thinkpad-acpi - Document doubletap_filter attribute
Date: Sat, 29 Nov 2025 09:25:33 +0900
Message-ID: <20251129002533.9070-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129002533.9070-1-vishnuocv@gmail.com>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_filter sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..a1e84d25e151 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,26 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_filter
+----------------
+
+sysfs: doubletap_filter
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_filter
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_filter
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_filter
+
+Values:
+	* 0 - doubletap events are processed (default)
+	* 1 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0


