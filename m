Return-Path: <linux-input+bounces-7821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D79379B8C34
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 08:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ADD3B218C6
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 07:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4AD14F10E;
	Fri,  1 Nov 2024 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EouYWk0K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3E14D444
	for <linux-input@vger.kernel.org>; Fri,  1 Nov 2024 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447193; cv=none; b=K8UdqJASr9UJRRGPuP28OKklHtEqUOPrguxlFt3nS9xx6rIean3jwBDubGffYbip61rT6m1aus21YmcQUyZ3LPmHxzeTIBOywXwwhjS+OXw1GNEqI4ysuWE/QSberZBSDk960qGFLQfdWfhUNgul8DsJhRxdS2N4yX9s6qzHk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447193; c=relaxed/simple;
	bh=7oyqoYAZJ0gGfbJjT6X/Fu83uh1qveXspIJipeFQvcM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WEswcC12/aQ5gYi6InMFxmGnq3v5Pcf0HdOAaxY4R+7Zpq0PwgTh4D0Bt/yZmPY8awnGQd1J1Sw0BW3aTUo6Nd39FOxDaSj9C41vJSGwJRziJnoKDFngg1iSTtQ7/LlW0QrondFzB5AylgiUjvnYRl42ICl6Is2aiLUg2i8YfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EouYWk0K; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e390d9ad1dso14731377b3.3
        for <linux-input@vger.kernel.org>; Fri, 01 Nov 2024 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730447191; x=1731051991; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3aKq6CnvOZI2TVkmKTbWKWHY8LJPTSe8Jutza5MdE4=;
        b=EouYWk0Kt6MmXM4jynRnZPWLkEahQCW99d5/iu+Nbzw7I4Gm1fj7NrQ6ksELFtSe7L
         woEtAQYgO1qK0lRlfkvYApjnm2jMfvm1xp2H+UNtf85TSloUFLjfvcaDSJv3KbEbh3mz
         6sjlgzKTHIEymmBLc2xthYD4YBc36W9MVMEbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447191; x=1731051991;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3aKq6CnvOZI2TVkmKTbWKWHY8LJPTSe8Jutza5MdE4=;
        b=fapQrlf8Ajqn5BKOGxViFnmN43kQxChdy2HZr9Er71QQFB91nWYdiWJzoIDRUECXge
         LOMTiNpEBOrThQcx2Q7cij5fViXWTDidZwBQWuHDkXbHxTbOL5542LkQaKfzq2jvjcXq
         8Z4++FoauIJ1rc/lWFbE/GRET17lmJFpMD8MfShIDj+L0ZeybsbDtSOY1sS/IQu3zThs
         0xqCYG6YXXesez5lLGt2yZKXLHsK/YlDoqAJqercPzXHVBattBV+NU1ekVf01EwMIJdr
         z/9h1MRYH2speHGiNCB53/sh0E9C2LaUJj1+ANbopBOqPM8dbeM/33LKoDbSZOyGbgPZ
         Rliw==
X-Forwarded-Encrypted: i=1; AJvYcCUjKTrMoY2QnJ1ntBdVkwmy0rKpT2atyYHquuxrVzgaObAyT7E2mmkhnIkPvm5+CAFKPdZkOJhWMtNINg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdm2kwy6xqV67jXbJLay7/6cjTmispWL4EBvncX8+pLEDLDmb5
	lIVlzodKec6hplser2cpbkTYECFSZqWVt5F7nqJ+NLZ8dCcCXnDZfRZaz7oOxw==
X-Google-Smtp-Source: AGHT+IH20R7XRxWI1RSTumQ0lC2tj6dVSIE7SoL2mi9HjVgdEmX6PF6aQq/YAwxBUE/8KKjA26yrtQ==
X-Received: by 2002:a05:690c:6506:b0:6dd:b9d4:71a1 with SMTP id 00721157ae682-6ea52378522mr72312107b3.16.1730447190788;
        Fri, 01 Nov 2024 00:46:30 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1casm16444236d6.78.2024.11.01.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:46:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/5] iio: hid-sensors-prox: Add support for more
 channels
Date: Fri, 01 Nov 2024 07:46:26 +0000
Message-Id: <20241101-hpd-v3-0-e9c80b7c7164@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOHJGcC/13MQQ6CMBCF4auQrq1hhiLVlfcwLpBO6SygpNVGQ
 7i7BWNiXL7JfP8sIgWmKE7FLAIljuzHPKpdITrXjj1JNnkLLFFBiZV0k5Fk6FY1FqztlMifUyD
 Lz61yuebtON59eG3RBOv169XmE8hSYgtYa405o8+dC37gx7D3oRdrIuEv0x+GmYG2B2qOUCvT/
 LFlWd4kZroG0AAAAA==
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Harvey Yang <chenghaoyang@google.com>, linux-input@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

EgisVision 620 provides two additional channels:
- proximity
- attention

Add support for them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Make attention CHAN_INFO_PROCESSED.
- Fix comment style.
- Multiply attention by 100 to make it a percentage.
- Link to v2: https://lore.kernel.org/r/20241028-hpd-v2-0-18f6e79154d7@chromium.org

Changes in v2 (Thanks Jonathan):
- Create new attention channel type.
- Improve documentation for HID usages.
- Link to v1: https://lore.kernel.org/r/20241024-hpd-v1-0-2a125882f1f8@chromium.org

---
Ricardo Ribalda (5):
      iio: hid-sensors: Add proximity and attention IDs
      iio: hid-sensors-prox: Factor-in hid_sensor_push_data
      iio: Add channel type for attention
      iio: hid-sensors-prox: Make proximity channel indexed
      iio: hid-sensor-prox: Add support for more channels

 Documentation/ABI/testing/sysfs-bus-iio |   8 ++
 drivers/iio/industrialio-core.c         |   1 +
 drivers/iio/light/hid-sensor-prox.c     | 195 ++++++++++++++++++--------------
 include/linux/hid-sensor-ids.h          |   2 +
 include/uapi/linux/iio/types.h          |   1 +
 tools/iio/iio_event_monitor.c           |   2 +
 6 files changed, 122 insertions(+), 87 deletions(-)
---
base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
change-id: 20241023-hpd-edeb37f1ffc4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


