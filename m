Return-Path: <linux-input+bounces-9751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60617A273C6
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 15:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672BB3A9345
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 14:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36E8218AB9;
	Tue,  4 Feb 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gelCU+Sv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1222153CD;
	Tue,  4 Feb 2025 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676900; cv=none; b=bI+vbRdDpxP+6eVzwPDmk5fV1F6gN3143C+w2LW+H6uJEsIhndNZp0wHZPsc2CvwKnj8evajhnl0dyX0zY9C14eV5BXOSj9iqEUfOH8Axk2v9371YruNXm68Ng9S2kq2utvSUlw50kpPYyWxAXv0GN/LA00DHjnqS4R5DfDfWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676900; c=relaxed/simple;
	bh=t9kC/g402z2JVDT24nu7PaP2adZ5QAf5FefhnjyZfYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NrmlLtvVJIw/tuSkF1xoROesisXiiZOBaCDPhA3UQCCXGI4dmt7gGTuusRJMva3lbFrKW/Rorn6evh60j/8No4a/yai7UVSJ7NtGAMkrvGuTSg72hyCFCrmWrel4rL5dJeZEqB46WR35KHc1Uqj+79dHn5HuGgE6eQpEIpiBYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gelCU+Sv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21661be2c2dso95105795ad.1;
        Tue, 04 Feb 2025 05:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738676898; x=1739281698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta3glYBq6VzxThKic21qmWC3DLvGb8Gi/TbelUGZEvk=;
        b=gelCU+SvEQj3GceeFSkPPUdrcDAwSeXt7An1sA3Ltr7DDquCO+cq6TuZzVyo4xx8gO
         Oxl22AvDujQ4vSN8G4b7weQ80DvGYbYdGWPMSG/g1Oa5wbKfdn3UtjTAv3n2NHx6H1+K
         e+g6i79V18GTDRJh+PXkdUMOMLoYtt7IXP7bSa4rRZHRDdDXi171BMtqLvds3DBk2huX
         /P34wMgXFI8FimnlNM87E5dlLmTxcXGuAmHzY73XxieeVtt0F2DakCNgYyPOgC2b3jQx
         hYnLfcfcpfBs8REx4pb31vGPqEWMzteY90OPObekRAaO4DeNtTEL1cZ31Lu+UpYbjoaQ
         Z0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676898; x=1739281698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ta3glYBq6VzxThKic21qmWC3DLvGb8Gi/TbelUGZEvk=;
        b=jtZTipdBlL6FytwjjU1wlC4JF6+JfMWldcBWqSANWC8gFpZlBemvUoXGnN8sjkiZT0
         dB/eIwq+Go3CXNIEqAQ9YLkpzXWDqmWBMm8e+zhw+lSSGxd6m1XlF3Y3d7PjdxuWb2eU
         9hH9VVqlaWLF/g5j9mX7ni5FlJRiDurk7WcB0yNcBhA4NybnThpYjSDI+TohJnTRVG2Y
         cq+i8ACnVe1kEWJtckk0l56jBfsx+E6UV7W5tBmtKq0Qz9UX4QOkC53kfl6RYzAn6kQF
         WRA7/m8VO2yjGwuS0a+4BIcySAMapSlDEiy4MbIy+EtXvKY5BtR3LQlIxSdyuHLcGzi8
         y5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCURsP1tnRUVgTjwxWuDAANRTIB0vhrpkzTutOHSuOGwxa25JOPyvmZ+2/w2u+CF7xb8ZhHiCGtCA88=@vger.kernel.org, AJvYcCUZr/YAzoOuj6wIjlygBnJy1tWUqqF4ks3ewQ9eF8kEdjhW/oA2T5qhR0h1fQHpR9iEMrr1ddui8xedHdM=@vger.kernel.org, AJvYcCV9fyaYoxEsHt1mvGRv3m+qthyZ2zprBL1W8q5u/CiIMyD+LjhbK9e3bMh2q3YXBE6VJbC4CtspkmM5KlA=@vger.kernel.org, AJvYcCW0n4njSl1j0NadI/1IUero7COw51ehlM0HiKjL/Tl1Fm9SVGEwwiFagt9lO/qNoOtkTfw++lUeMByr@vger.kernel.org, AJvYcCXapooT6ayYUgRs+T53waODxqplkLH+pxxGzB8gpecmj9NkLR7gvgQjhomrDzMK5nZWhjGQC1ZlzZUQ8vn7@vger.kernel.org
X-Gm-Message-State: AOJu0YwbsZj25MMeYxUQxWG/Eyt2J0KF70OHNT8RaXg5xc6tV+aoRSSx
	NyAnf8dN1NBSOm6JuwiJ+aS/hahsPlDbMqgwWFmhUCblnOaA/xCksqLADC57WzU=
X-Gm-Gg: ASbGnct2C/FtCyrX14crM7krLAvB1QHQXVb2sjr2L1wNfiUEa/PQuYCNoyJTja/c2wf
	F7HqUH76mzg+dyU6KcCoaHY8jiIgp3j+eLbaUzSZp8YHD3aghIM/7+iihudhi0l9XoyNAGpAf4l
	MynUyO21wEfxr7T4gkvy5bYletHlQDy3eYDcEYlu+Fb39OE3K3rIJD0+fSziRDFDD6t+s8dUV2E
	ZzKjsac6uyTMdDkCz8zd8Dcbg5CMA7gQ76yfQwrC0WUgDQWxIC9A7CV28NJVguGK0jUsFgcokcn
	9kihTJuehwDnu2szv3YbeBEMZ43NB6jpbAoVzKl5EYG39A==
X-Google-Smtp-Source: AGHT+IFQvTQwJV/nAmQ2SWSWFKg/E65Pd9UcC3wbML/8fhOdTHuMoFkbR1u1R13P9AOBsH4PdpBQCQ==
X-Received: by 2002:a17:903:11c9:b0:216:6769:9ed7 with SMTP id d9443c01a7336-21dd7dd53e8mr449600825ad.40.1738676897965;
        Tue, 04 Feb 2025 05:48:17 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:1019:6a4a:7b6:abc:27dd:e5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ea37sm95806745ad.213.2025.02.04.05.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:48:17 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] docs: Fix spelling and grammatical issues
Date: Tue,  4 Feb 2025 19:18:06 +0530
Message-Id: <20250204134806.28218-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several spelling and grammatical errors across multiple
documentation files.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 Documentation/hid/hiddev.rst                | 4 ++--
 Documentation/hid/intel-ish-hid.rst         | 2 +-
 Documentation/hid/uhid.rst                  | 2 +-
 Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
 Documentation/hwmon/abituguru.rst           | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
index 9b82c7f896aa..073485f84793 100644
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
index 2adc174fb576..fdabf6ec60db 100644
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
index 2243a6b75914..2681038cd526 100644
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
diff --git a/Documentation/hwmon/abituguru-datasheet.rst b/Documentation/hwmon/abituguru-datasheet.rst
index 0cd61471d2a2..8c55874061d4 100644
--- a/Documentation/hwmon/abituguru-datasheet.rst
+++ b/Documentation/hwmon/abituguru-datasheet.rst
@@ -6,9 +6,9 @@ First of all, what I know about uGuru is no fact based on any help, hints or
 datasheet from Abit. The data I have got on uGuru have I assembled through
 my weak knowledge in "backwards engineering".
 And just for the record, you may have noticed uGuru isn't a chip developed by
-Abit, as they claim it to be. It's really just an microprocessor (uC) created by
+Abit, as they claim it to be. It's really just a microprocessor (uC) created by
 Winbond (W83L950D). And no, reading the manual for this specific uC or
-mailing  Windbond for help won't give any useful data about uGuru, as it is
+mailing  Winbond for help won't give any useful data about uGuru, as it is
 the program inside the uC that is responding to calls.
 
 Olle Sandberg <ollebull@gmail.com>, 2005-05-25
@@ -35,7 +35,7 @@ As far as known the uGuru is always placed at and using the (ISA) I/O-ports
 ports are holding for detection. We will refer to 0xE0 as CMD (command-port)
 and 0xE4 as DATA because Abit refers to them with these names.
 
-If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC an uGuru could be
+If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC a uGuru could be
 present. We have to check for two different values at data-port, because
 after a reboot uGuru will hold 0x00 here, but if the driver is removed and
 later on attached again data-port will hold 0x08, more about this later.
@@ -46,7 +46,7 @@ have to test CMD for two different values. On these uGuru's DATA will initially
 hold 0x09 and will only hold 0x08 after reading CMD first, so CMD must be read
 first!
 
-To be really sure an uGuru is present a test read of one or more register
+To be really sure a uGuru is present a test read of one or more register
 sets should be done.
 
 
diff --git a/Documentation/hwmon/abituguru.rst b/Documentation/hwmon/abituguru.rst
index cfda60b757ce..4a5ee16b1048 100644
--- a/Documentation/hwmon/abituguru.rst
+++ b/Documentation/hwmon/abituguru.rst
@@ -40,7 +40,7 @@ Supported chips:
 
 .. [2]  There is a separate abituguru3 driver for these motherboards,
 	the abituguru (without the 3 !) driver will not work on these
-	motherboards (and visa versa)!
+	motherboards (and vice versa)!
 
 Authors:
 	- Hans de Goede <j.w.r.degoede@hhs.nl>,
-- 
2.34.1


