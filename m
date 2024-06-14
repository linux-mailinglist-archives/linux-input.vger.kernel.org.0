Return-Path: <linux-input+bounces-4364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DD908FFC
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B13F1C214D9
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 16:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36D0195F28;
	Fri, 14 Jun 2024 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjZM7oQe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129D192B7B;
	Fri, 14 Jun 2024 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718381984; cv=none; b=MnuTRR7pxf6dIBY0Ou5qBF8B1m6zgWP1t4ToqvpxnuF0beAWWlb9fH58CjxNK60/vkwdWU7eM+AZp3AkcCrJeyZ1VlByoKeWwj4PjuHfL2ibl2BnMDg0jMP8nQQ+rpFmQfN9oIMr992ILlFjNPEvuZ7w7cUrLoGq/rPl4gNdki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718381984; c=relaxed/simple;
	bh=A8ti7FkIhPnz4QDYyrWnAxpZlEHI2kD6idXCq/AEJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbigzEAmaKAD7U+jSiZqNDqYJ5xG7aIKjVp84ddOp7/QfpmRxDxUoW4kMGt7FzEpBI5Bw7w4kwkQVeCvc39YWc+98VSSTdlBcmasWkjWCPGnTYNtOe4Aoz+lVC52/1UdKnuVM9s9nWgCUCGbAzTbsLbqCUBZTPJg5UlsXI8u6Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjZM7oQe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4218314a6c7so21623665e9.0;
        Fri, 14 Jun 2024 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718381981; x=1718986781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx92rTQEBfMt/TWKPgxcRiRauNazbCbxwV3wI4CW7v8=;
        b=VjZM7oQePWox5Ft/HX09S8oMegCcR0LLxNzMCSrV4g8pKMpO5QoL7hoN/UTPxEiuZq
         8k3jmlUUePhXTtZ4dhwZcFAjORmZLjsEdoozFLcuLEJtMPYj/jkwo+bysnVl444lUwSY
         WrjPbkNDVvMjem/Y/+2ISOo8hYPXcS1AmCGxpx3pjEoEKmCxUrFR4Lg/wj7GjaxdyJaW
         mYQ1951kl9K1LLVL8BcRaHjF8K5da6sawxKptIHXTXwnBk7zGs/Vtp+8TzPPGl0uV5iE
         5G/LPGKrQOn1dSmrQxJFars4NpMNzkdiOxvNBLfHWCurnSMIg2BxbGYcbpYZDxNSHIoL
         XR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718381981; x=1718986781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx92rTQEBfMt/TWKPgxcRiRauNazbCbxwV3wI4CW7v8=;
        b=Md8jyvBOfpOC/BrlaSbUI5Rhv2f2g/VTlw/R1c8z4fgLiPmTLcaDcG9lTYVN5EQ+yB
         yr0unY3WC8qjd24Uoe+vv/caIr+DVbIkyY/Kn+vXEKWhhjswu7fGCSqw7dBKQkPlG37Z
         WD744Do/ImfyaOFpzucqCthE8izAc9MHbwstgwSNPm4ofkKgZFoM9OO9HbtRDwtOIVf0
         Ir0Smw/na+24h7YiTOBZBVEz2V9C1RF4wd1pqBbsYySjpGdOEwGIAnmKuQC81e9IFJSb
         VlmQzq+p5S+ILbzRLEM0HxjOtqcHlX226yKepR8KVEQBkHU1OJSLsaP+FYSRMzTrqb7k
         JBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFlWArnWzVc0MJoAV+3qPhjcztuxzvap98kfavfBjzqY+HJPOPdcBURxsHHKohpoKUxiuO3LFVgzToG7yu0jYGnsCRhJH0pPeeSUVtEK0WNpPswDl4rdIUjwyoPbuPyEYqvwxpu4UWYIs=
X-Gm-Message-State: AOJu0YwDsCq4cJeZK4pwpWn6sD024FHiQQUIwA0QtZmQuLAzf3/PGRCZ
	F65bVe0l+LKGmyxknjOLEoKhsKUP3tcCNIQJ4DGZ86ulTpVsg2ju
X-Google-Smtp-Source: AGHT+IGQC227lpe6RF1fg6+a56ixyE3sDU3b3R4G828UvCIRli7H9wPpBrFY7HoX6QHyJz1ozSm+Hg==
X-Received: by 2002:a05:600c:4588:b0:421:6b83:2a65 with SMTP id 5b1f17b1804b1-4230482fcb4mr29779925e9.17.1718381980994;
        Fri, 14 Jun 2024 09:19:40 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eefa63sm104638905e9.1.2024.06.14.09.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:19:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	arnd@arndb.de,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 1/2] HID: uclogic: Avoid linking common code into multiple modules
Date: Fri, 14 Jun 2024 18:16:05 +0200
Message-ID: <20240614161935.230529-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614161935.230529-1-jose.exposito89@gmail.com>
References: <20240614161935.230529-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The hid-uclogic-params.o and hid-uclogic-rdesc.o files are linked
into both the driver module and the unit test, which triggers a
W=1 warning:

scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-rdesc.o is added to multiple modules: hid-uclogic hid-uclogic-test
scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-params.o is added to multiple modules: hid-uclogic hid-uclogic-test

Avoids this by moving these two files into a separate module
that is used by the driver and the unit test.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/Makefile                 | 6 ++----
 drivers/hid/hid-uclogic-rdesc-test.c | 2 ++
 drivers/hid/hid-uclogic-rdesc.c      | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index ce71b53ea6c5..e40f1ddebbb7 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -154,10 +154,8 @@ obj-$(CONFIG_HID_WINWING)	+= hid-winwing.o
 obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
 obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o
 
-hid-uclogic-test-objs		:= hid-uclogic-rdesc.o \
-				   hid-uclogic-params.o \
-				   hid-uclogic-rdesc-test.o
-obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o
+hid-uclogic-test-objs		:= hid-uclogic-rdesc-test.o
+obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic.o hid-uclogic-test.o
 
 obj-$(CONFIG_USB_HID)		+= usbhid/
 obj-$(CONFIG_USB_MOUSE)		+= usbhid/
diff --git a/drivers/hid/hid-uclogic-rdesc-test.c b/drivers/hid/hid-uclogic-rdesc-test.c
index 90bf4e586e01..d6b18213f45f 100644
--- a/drivers/hid/hid-uclogic-rdesc-test.c
+++ b/drivers/hid/hid-uclogic-rdesc-test.c
@@ -9,6 +9,8 @@
 #include <kunit/test.h>
 #include "./hid-uclogic-rdesc.h"
 
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+
 struct uclogic_template_case {
 	const char *name;
 	const __u8 *template;
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index b6dfdf6356a6..6c7a90417569 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -17,6 +17,7 @@
 #include "hid-uclogic-rdesc.h"
 #include <linux/slab.h>
 #include <asm/unaligned.h>
+#include <kunit/visibility.h>
 
 /* Fixed WP4030U report descriptor */
 __u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
@@ -1242,3 +1243,4 @@ __u8 *uclogic_rdesc_template_apply(const __u8 *template_ptr,
 
 	return rdesc_ptr;
 }
+EXPORT_SYMBOL_IF_KUNIT(uclogic_rdesc_template_apply);
-- 
2.45.2


