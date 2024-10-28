Return-Path: <linux-input+bounces-7728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777859B2C6D
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8FAB1C21B96
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 10:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41BD1D27BE;
	Mon, 28 Oct 2024 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y59vsHYe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDA1D0E38
	for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110348; cv=none; b=OyD+RcGU6qBaesyQ7s4QNlorCDJqaXvLGud6RES+UI+/3QkHcNIV7baz6T4KCsoIk90E3hNufwAyg1/N+f1OnpNgrtIXr/7C3lKMG1jj4BYMwgYXQXp82B0x4zjgei17Z7S2J8DPvyO22+WopgBOaFZgJmQvE6eIeL/g1R2Crh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110348; c=relaxed/simple;
	bh=E5IKpWlBrs6BrNxKGj8gL69lGAFGxkNE1Vi/39M/35Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUKndPGCYV6RNUG4aeIKfMlC7Jw39YbbOdTFheCcI5pTz3UAJu/glYqT36yyDkwEKvApiZDr3OMrRiVLHDYxk/Teyjf4+vVMjmh+fdhAXNRiT5AliRKASx3unJSlsSwaYIc+WtyRjNQo2cN9p4bqKUPbTlW9hTEPgUwYrWPtfts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y59vsHYe; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b154f71885so399029385a.0
        for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730110345; x=1730715145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRIQcTwMhYqGctEPu/xoF4uEWBP35j2ZdxAtYHSbb2E=;
        b=Y59vsHYecOLkSWgZLMMjGcvS6rtWiYWPwkWp/UtBM2/+2/K1eeS7nRhcpxJ5FBqxLU
         fJNqw4hGZuJRDiCoNfOour4uOP6iYVMluRQy2rnZUXXE8DQOnC0M7LfmgFP1GR+g0DNO
         pgq9Rktkud2RsBaYUNC33C1O1tnkVbWZZbZP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110345; x=1730715145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRIQcTwMhYqGctEPu/xoF4uEWBP35j2ZdxAtYHSbb2E=;
        b=otNXsBd4nbPXBv/V2DTTi7+D74Z3olj+lTqnyiIgcQ41IHseyc2cB3JaShgr8dKnSB
         Ddx5NLYTKNRT4f+XXc96S40z2Lae6L0lcTMbyRLSGwVIcG26nsc2ZMWtpyGdCfBmLUAo
         mBNcS3jiExu00C7paZ603+z3lrlDMeemLI4Ez1MgnoavQjfGBV16xn7XoB2tmmZQ+UXj
         95Y3HcHhkyMP71IL7HGpCWGbTaJzfsTjUGqKGkUH2QtJg61xlW3WRXAwztZQ212trcUr
         QxsYwkAPXjHbhX9HjQnEoMbJFMk+ZsWqHqwjNk0Y4pYC1V4mtihaPXVScxjRM1anGpdw
         zUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGORsAYQaX42Ppls4w3pQVk1rZ53QKz5MzvqPc84ZfSNEiQOoToOMP/Vn5/B/+A6GgjRCHGbtpeuUmgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJvBVPEohs7RBWExY+jkr5i7rcNuZHkbggYHf9/9jnA7RUMozN
	Eaa0CEOI9FH1hbfl3XLzWECesysA31mU32sI+MvzqUuX0kEIlaR+6eQSOqkmHQ==
X-Google-Smtp-Source: AGHT+IHsZfrL95wV+H91XB+R0gfoIc0eDU5H8YGXxr3YjqWTDf3Oef34MoOXLotCH0ugOLZSOTidVw==
X-Received: by 2002:a05:620a:2482:b0:7a9:d14f:2374 with SMTP id af79cd13be357-7b193f3e043mr1206071685a.44.1730110345653;
        Mon, 28 Oct 2024 03:12:25 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d279126sm305483385a.9.2024.10.28.03.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:12:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Oct 2024 10:12:21 +0000
Subject: [PATCH v2 1/5] iio: hid-sensors: Add proximity and attention IDs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241028-hpd-v2-1-18f6e79154d7@chromium.org>
References: <20241028-hpd-v2-0-18f6e79154d7@chromium.org>
In-Reply-To: <20241028-hpd-v2-0-18f6e79154d7@chromium.org>
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
Distance between a human and the computer. Default unit of
measure is meters;
https://www.usb.org/sites/default/files/hutrr39b_0.pdf

- 0x4bd for Human Attention Detected
Human-Presence sensors detect the presence of humans in the sensor’s
field-of-view using diverse and evolving technologies. Some presence
sensors are implemented with low resolution video cameras, which can
additionally track a subject’s attention (i.e. if the
user is ‘looking’ at the system with the integrated sensor).
A Human-Presence sensor, providing a Host with the user’s attention
state, allows the Host to optimize its behavior. For example, to
brighten/dim the system display, based on the user’s attention to the
system (potentially prolonging battery life). Default unit is
true/false;
https://www.usb.org/sites/default/files/hutrr107-humanpresenceattention_1.pdf

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


