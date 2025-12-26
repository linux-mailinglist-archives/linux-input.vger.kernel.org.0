Return-Path: <linux-input+bounces-16697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A54CDF231
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 00:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75A9630088B7
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 23:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1940B28641F;
	Fri, 26 Dec 2025 23:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agvX5hlA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850D285CA9
	for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793270; cv=none; b=MwqkZzUdfy8OQKk7sK/HpC70GAXval5YvZvGFA6ITEPo0ZYbRJzHgRNZlYVBRxwgR4tgY4SCLFGNaLom0ZxQJHYjK+nrMDUGB81TZehFoioTmgId7SXr8R1OnMOREVkJcbIYwyYAQgl3qGACneTB2mp0PRxtkGTlxzt3PeKROgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793270; c=relaxed/simple;
	bh=1SdlCZOHH1KcWWYXNTcQtIYihCh8YljUkPPX7+T+Z3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oc1YjN9HVDJYwCmXvbe2q5fmukd6pufI1yLP9eiN0E2sHs/CIk0r8z3Ulesy14Z70pIF+tFafDxk6NqJYi2NUGM4+GfrMta6fyEp14ktgEsoElqLad9ISykV1csB7FT48mvxLJYL4HRMH4rl4GfxEtawE03oTTk43W0K1QgmRtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agvX5hlA; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso10501847b3a.1
        for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 15:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793267; x=1767398067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rRrf9jdBX343iQYo4lj0lM0On8e8PTdq9pmhf6wv5Y=;
        b=agvX5hlAeWVZM/7fqir6cRmeDDiMVL0FX2QPCOXzpddMtpXUcQ76gIWOInWEoW681/
         HBzIX9riWfjLnzhgJ93RPcKSP+J/KJik+y6rPtXHXqhgZl5tchJos0dSLr9giAdCtu/8
         fT0pVRp4MrF1PTj3vEiJusCI4NPV6dwiPcHFJeOeqWHEB7f3slg7u+2NZN3AHM/892va
         My5zq0Shdzr8rJvO7ligK8U911+3IHVYGG0nawzDcQ1dC+Tp9n+2vpbEjOEwHaboqPQc
         TmJ9cv+w5WujcYl/cH8NpoZg+WD3G4vZbOHJdBcFGHDOlGBCA7aixlBitbBtp6MbOfQ1
         uiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793267; x=1767398067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rRrf9jdBX343iQYo4lj0lM0On8e8PTdq9pmhf6wv5Y=;
        b=j115qgJo2b0jdDNtShzT2cw+6LgLVRMwbvPAY/Q1dvvhpIaeVIF5mo5WD0SAyo9Eaq
         edWhnqhUjciUJEx4SGdjgNi6idpte+fdSeFPvcCj4mkJD4FqxzYTa797eVECdgRptHmY
         QwvJU4ys888d5+m9aCCpUq8rx5B5BbVjhfXbAHCKecuadqoO5wco0qEj1ud72SCWPUOP
         ndjYfgJTHmyyVdY4Nf1cZwgLMXdy704d7EIOk1B7B7A2Sz1C7jY1tMkeU3udzabjquKP
         hVemu7bAOBh8AzqbWMiJWVOK2zScyx2bN9aAu/7W/7QJEIWGae9wUUy+mVsqbWPIbEI5
         vfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+o2TcNN2ffZnhOm7uLBDCAn7lHVlukNqViAOJvaj0tiQWr1j9FdrpIMO+7hqGeyscChz8hwnVFZtD4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG6m090eBSi7ZejGB4D7MOgIxmj2CYMhmCjuKqSwUkbuHsBy5h
	x20oG/ZUtttvAMUCTZtOCc2DK91KDaK2KHrHD2C50lpqgxSlAyDinErA
X-Gm-Gg: AY/fxX5Wg8JApjwi4Rrem7zwz0w2GyQZmKlvyuQMJ/MKUwHsDSKHwkKiKdZTLUjm7Sr
	XD15XiXacdKV0MG1NyioltTTXBbKJWBq2LKDRglNCPeHMYB7NN/xMl9/sRyMwDr858O7RIJB0zL
	gxuRcHjaNtuPwvQaSPb6qeN5e5PxnO2VjBqNa1hWO6NScEzv7ogjYZ9aE06yr0XkSet+6MsM3yW
	AtnJFyjO8hAaK8iJACI0Z3GvlQ6tg0e3Eg7kDe4cyOUptH1+M7fEmTwX+dOz1dTrfMb+I1aR06q
	L2GNq751TpqdabpSXazKRS9lm/ZNil2z+zTUHRCGNmzCceTTasuwDcUbpZiAPBCzkiDxAuYuIyx
	aNrELCgSSzLel8NkTlbAbF0U+Bmhh3MwlZbQsp6KCR0xdsOXokmqzkU07zzXNVOK9aCB+o92uhz
	0G4Xchv3sLYemy7AvDvIf0uO3NN4bFYvBARRw9BKYZuyqIgzqfyFHFV24UCVT65dxWye768icoq
	WdQ
X-Google-Smtp-Source: AGHT+IGuFiGBjFMS9oYCwzOarwUo5Emq3cwg6KxdhIJ3EU9w1ec9sB8aCPtiMnCJKi13ZbL4mqZLuQ==
X-Received: by 2002:a05:6a00:8014:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ff651c3519mr23692817b3a.30.1766793267546;
        Fri, 26 Dec 2025 15:54:27 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:54:27 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
Date: Sat, 27 Dec 2025 08:51:01 +0900
Message-ID: <20251226235101.106451-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..23bc84b0475d 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,26 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_enable
+----------------
+
+sysfs: doubletap_enable
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+
+Values:
+	* 1 - doubletap events are processed (default)
+	* 0 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0


