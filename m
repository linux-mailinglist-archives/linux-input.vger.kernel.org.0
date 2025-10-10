Return-Path: <linux-input+bounces-15358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0412CBCBC15
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 08:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA09C4E36A1
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 06:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7848323816C;
	Fri, 10 Oct 2025 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMdf/wLq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997A2264CC
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760076744; cv=none; b=oiBtT2FN+Cr2Hvh3FQaTJAjM7HYoygPX1d/kEaMM8SzG0TgjjqROUQen73ujN0m5L5TlWAXE7Qg97f4KFqt8p6NN/3HhcVtsj+vfm4w4VnhmscBWuE/NhiOOmmYtkSUDnOV866blppqnXbsM2O9GmM5wZUUc1BOqpkTCy8ML2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760076744; c=relaxed/simple;
	bh=Ox5HfcBIa0Pd9ImGqX26Z7WFjqhZmoCpc19fwDDvGvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZhafx1MmfLol2uoJOYKZTBc4EYYl2OfNnHOd2uXQUNP+E4PVRQelWFnotLzpSr4wI8fIcD9OTPAxzzSfJMLPoU63oQYXMztpSqyihDkE+sgwoO45ytOQWghuywmHQfH3AFGBw7cfcnEEy0mGJlhJm/yhj/1aWIEnn8c9BOkcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMdf/wLq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26e68904f0eso17021575ad.0
        for <linux-input@vger.kernel.org>; Thu, 09 Oct 2025 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760076742; x=1760681542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAUs4mxyOS0iY2X7XLxfa0TcqLPgyAiOiZoIgTVsHYk=;
        b=FMdf/wLqcLPS2zE04mMptPwnCx1xTmRUSart/DGd/954Md5mZDtGodYVq8lg7J09L4
         FzpMBB5vBp9W7RGTkrKAsvSLD9tkZqDRjJGYj0DEC8GrKhjm7n282Gj09B94Y31UQJn9
         EwoHDae/RaL5qpFi4ZxsZKQH+jU8ICt21GzwtNSp0L2Hx0dL1k6U4ZsasOYWDImhnAsJ
         XnEPKIflxmgkR2VyCej1b3a8VdNAVIhuY9CWYj2Qtv325sQ9bMVr9p/jHBiLH8rEByDd
         U4T0gn5CgxZd+PULdW5VM3e3hdd6B6qPF0QTlA5LOux5l3d1/MhbVXp0FfaYj+vwNreB
         qf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760076742; x=1760681542;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAUs4mxyOS0iY2X7XLxfa0TcqLPgyAiOiZoIgTVsHYk=;
        b=HrNEuwqYEDLLO8SAbSXDPqauRsjudikYcp3BUdz3e+cpNZJN6pTWBvzchzP8a0XsLw
         LAy04l2cXudqVJVEf3L9HERABvnKLJMiYKs06a7TBle8l8oWRt6xYKAkS9DN8Qa2prxl
         IgNr41hniCd8NTEeVtH1Vgpy6FP6vD8Yq+hYcKB1Wdwobo+WMR5kL9jcru9T6DcgAWru
         QA6R0KuCzGPZYpp4IyOA91h40nPJTD0POmb/1eoh3tykF7zj8yTtyAcSFIuEG2Ab9y3p
         KuZfQIlwBZCoEvn4cdMWguwoCN24+QWt2csxAopihGlsj42lzONH6ermAkFFgVx+BqwX
         fyyw==
X-Forwarded-Encrypted: i=1; AJvYcCXmL5UKHd5Z/xV/O0B+DNFXujbHcJoNjETrWVCQoCEIGXNtE2vDAvkL8m0qbaGP+VUU9tC0jlEW9aEkEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIOEIw5E6pyqdAzzXEE+OHP+6t4vxdSGM7eoz91H8fEdX+H4V3
	1mC2UjDubHP1HX7feiLFNtL6BiECXxXsKFSooiAye2oZ4Kd1/G4qT3kG
X-Gm-Gg: ASbGncuf25ZIbdVOS58L6jti9TbZNFrvTbun3A/DWMk81vV3kb1ASu2rrFDUk4UwqAp
	vCfB0+gLS+3iui0y0vGarzhZlXVNZO6iu58saZLTLeFIhEi8DsuPdiJDlzMNbRUM5he/yb5iYc4
	Ri5DGy6Lh5cMJcsqGXpaYKpUt+sca2Ced1J+b9Ge/DeM1jPidsysCchj4Yqakielsc8CIj2vGan
	hntyQrAXIEGCbXrZr02jdbWFmC877X9EF4yjcdinnBWZqXCV1LI4P23jita9HG1LmPk1hVBhJnV
	EzZKuolSQvcLZNdbadkKo+ZDPPG1Dkz3DexQykrWbIb1Owm1DbG+HjaKCI00o4BY1eQL+n27Wwm
	Z4IdyI5+6qABTjJZ7u9UAhBZ9EKLZzU8MXULr/EWyiZ1Vja/KFiAIFr4EXBj50Ah6pAPT2ECtOf
	wjknXnSg6EPjISNm0=
X-Google-Smtp-Source: AGHT+IHibCd1Wm0g2BhXInFGKhNjAxMweDeOENyDko3pQXv/8IbBDLJrvtBuzPxZdKeg8K1kCgaeBQ==
X-Received: by 2002:a17:903:17cf:b0:24c:b39f:baaa with SMTP id d9443c01a7336-290272e1fe5mr143061995ad.49.1760076742145;
        Thu, 09 Oct 2025 23:12:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c593:2dc:16de:acd1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b71sm46446495ad.114.2025.10.09.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 23:12:21 -0700 (PDT)
Date: Thu, 9 Oct 2025 23:12:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>, kenalba@google.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hid-input: only ignore 0 battery events for digitizers
Message-ID: <of5qjeij72wduee3zyf26drfcwhpsl4sjs3v6tfjv3tgl3xsol@sss7zcyawwaz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Commit 581c4484769e ("HID: input: map digitizer battery usage") added
handling of battery events for digitizers (typically for batteries
presented in styli). Digitizers typically report correct battery levels
only when stylus is actively touching the surface, and in other cases
they may report battery level of 0. To avoid confusing consumers of the
battery information the code was added to filer out reports with 0
battery levels.

However there exist other kinds of devices that may legitimately report
0 battery levels. Fix this by filtering out 0-level reports only for
digitizer usages, and continue reporting them for other kinds of devices
(Smart Batteries, etc).

Reported-by: 卢国宏 <luguohong@xiaomi.com>
Tested-by: 卢国宏 <luguohong@xiaomi.com>
Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-input.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ff1784b5c2a4..ba3f6655af9e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -595,14 +595,18 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 	dev->battery = NULL;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev,
+				    unsigned int usage, int value)
 {
 	int capacity;
 
 	if (!dev->battery)
 		return;
 
-	if (value == 0 || value < dev->battery_min || value > dev->battery_max)
+	if ((usage & HID_USAGE_PAGE) == HID_UP_DIGITIZER && value == 0)
+		return;
+
+	if (value < dev->battery_min || value > dev->battery_max)
 		return;
 
 	capacity = hidinput_scale_battery_capacity(dev, value);
@@ -1518,7 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		bool handled = hidinput_set_battery_charge_status(hid, usage->hid, value);
 
 		if (!handled)
-			hidinput_update_battery(hid, value);
+			hidinput_update_battery(hid, usage->hid, value);
 
 		return;
 	}
-- 
2.51.0.740.g6adb054d12-goog


-- 
Dmitry

