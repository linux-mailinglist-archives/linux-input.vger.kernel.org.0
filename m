Return-Path: <linux-input+bounces-7683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58B9AE695
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 15:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4657DB266A1
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 13:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01C71E377C;
	Thu, 24 Oct 2024 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C2L0ccF8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24851E2009
	for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776551; cv=none; b=Vtx1CJzakLhLKKD6QFrMfAwa0EtUED+Wj1/gumfHQDf5iHZvIsuZbbbgjsE3NBM1Tooud42nIgMXuDZPIkgMo8K+nn9hpWzlBvOYJwUmhL65DzGKU/KzZkwW/wuG7zUEQ/lfZJ7OcgaITd+REuMBbUbrq6SMTuLQwQgY2JMPV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776551; c=relaxed/simple;
	bh=bFwyN+jEa2XvW5Q/VvqMtLqk9XXyDIBC0cTMCtFmW8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAnpLfRK5H3BU2F5u2tXnAPeNGnEHqVC0qSWDLjVzRZypTwaV+IcDFDbf04BLdtvaG8sxHBBRnaUStDG5MXPmaBtwcI8+StoMXgIlCD/eQLDwHSNcpuBiGnd59gDs0qg6Ea6tBQ+fYuTAw0mC9PCYYYmQgoDfJYQ4OUrzFtChgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C2L0ccF8; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b155cca097so74913785a.1
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729776548; x=1730381348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzgB0Dmc7SbGSRkZ42QPW9VmAklZSsdEpabG3evbtX4=;
        b=C2L0ccF89lMnCzO/lOABh9M2irnWtNlV01UNnDvwggDQWRVMbTuXginOlkd9tXDFYz
         jLADbOLpGsn4fEvcPOw1zPUFuRE5fwGkevfhGowXHdiCUXopCz9YPhdBDprM9Oj1j9CL
         NHSySKqLQdu8900ssc+GlEZ8O8iOJjy5PdHwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776548; x=1730381348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzgB0Dmc7SbGSRkZ42QPW9VmAklZSsdEpabG3evbtX4=;
        b=UG9JGd3k0IR+Ptf6EwC//4BH2je2+3Dtyn/G/7O/y6fCRgHGyartUXWVWvHKtXBkei
         JaKfT6cpcT3PVOeevqAh0mN48InfQIH0yReNlKveSr+PAZRUr7N4rT4Ebrgz9d2TYtFu
         N8JuMgXUYiF401jtX+50gWtSS9sjkQfix+pCrEMJQTuU+PryZQWKTCs+/zb9uxtb0roU
         1HPncrjCn5ibYJKB4FEMSP0B8vQeX65ZaLt1277s35OBMOtTmOjcdHCosChZ1u8gfY3W
         b9ZmwaVVBY9qq/Ji7BpaNV/JdPuVHVAyKudQSIrP3yVi/+aV8dKNZLZWIJnRr9sORYs2
         U0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWflragAMJEIUPgiyUm7m1z50jjtpKh0+4XhXlec+mFIVgoTc98I7ypV8Bi12yW3nIZnecb+eT65orTTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTyIMUwNJuHA63niMsyIDVle3Vp4Ko5H9UqolDMX9mteLxLbx
	koX1FNEpdzYT8tuNOOjB1ZZ+uho56UDT0yIzl+WGwOCjDId7mFWR+d1npYt2+g==
X-Google-Smtp-Source: AGHT+IHOq1CHjjVbrTOuW87w2sexGCJD7U4FXEseprlQ/Sd8ltK1U55/s300FMFOWnd7m15YHmBXEA==
X-Received: by 2002:a05:620a:4621:b0:7a9:aa9e:3a9a with SMTP id af79cd13be357-7b1865e2a18mr350813885a.18.1729776547888;
        Thu, 24 Oct 2024 06:29:07 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a5d663sm484204885a.94.2024.10.24.06.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 06:29:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Oct 2024 13:29:05 +0000
Subject: [PATCH 1/3] iio: hid-sensors: Add proximity and attention IDs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-hpd-v1-1-2a125882f1f8@chromium.org>
References: <20241024-hpd-v1-0-2a125882f1f8@chromium.org>
In-Reply-To: <20241024-hpd-v1-0-2a125882f1f8@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Harvey Yang <chenghaoyang@google.com>, linux-input@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The HID Usage Table at https://usb.org/sites/default/files/hut1_5.pdf
reserves:

- 0x4b2 for Human Proximity Range
- 0x4bd for Human Attention Detected

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/hid-sensor-ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/hid-sensor-ids.h b/include/linux/hid-sensor-ids.h
index 6730ee900ee1..8a03d9696b1c 100644
--- a/include/linux/hid-sensor-ids.h
+++ b/include/linux/hid-sensor-ids.h
@@ -30,6 +30,8 @@
 #define HID_USAGE_SENSOR_PROX                                   0x200011
 #define HID_USAGE_SENSOR_DATA_PRESENCE                          0x2004b0
 #define HID_USAGE_SENSOR_HUMAN_PRESENCE                         0x2004b1
+#define HID_USAGE_SENSOR_HUMAN_PROXIMITY                        0x2004b2
+#define HID_USAGE_SENSOR_HUMAN_ATTENTION                        0x2004bd
 
 /* Pressure (200031) */
 #define HID_USAGE_SENSOR_PRESSURE                               0x200031

-- 
2.47.0.163.g1226f6d8fa-goog


