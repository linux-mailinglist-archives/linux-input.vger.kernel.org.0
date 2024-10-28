Return-Path: <linux-input+bounces-7731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDE9B2C75
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 818B91F22435
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 10:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61251D6188;
	Mon, 28 Oct 2024 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jJtFebvL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9281D54D6
	for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110353; cv=none; b=fZBdI//Em/YGy+WGrQh/PL/kKFHJdbIN80jW1JdCYQ7c+dO3f6qBRvoUPUW9Z7JAmXmemD6R+IPq39NzzbJ3WWjyIN/G1KUneZgdXrrouo1BOk1UnYfYe76vgq1bYSbwf+TSfx0+M3P3oxvWRO3ne82PjuXeBF32Z1VaaR45+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110353; c=relaxed/simple;
	bh=CUtvkf+t59QX4prslptAVYmO9B9yIfrnRI6r3hKSoAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWzop1HEnR+BltqMvhvi+EIpngwuyzG1xVeFdD4D2RoplzokmUhnAJPKgUiaM9qKa3jGtnO0L3lcP+mHWiz91i1tss7pQZ2YoXmYgWMctN5RYRQjh2xDLFtCPBVX8BpBHWFs8hUVG7Rx/+HNHzknH7J5OSW0eJ3dRai/ymdVgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jJtFebvL; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b1488fde46so327173285a.2
        for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730110351; x=1730715151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adgmJOhHcaFkex36EFAe1BXPWl8Ng3rQHGIFjAA8UGA=;
        b=jJtFebvLLF0asJft9hXpQ6nSjl4dbDOVD1SFuDbo4Vk7qc2g4nwkH28z2JhA6sC/pQ
         t9hKRWlYJaAg08UYdWNkMmRSJT2GeeqWj52GIowJN86J79jdYHohkERrAYAJG9nBwIC8
         nJ8E9fipb28kE8RilyhQRekd7L4aooWnhR42Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110351; x=1730715151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adgmJOhHcaFkex36EFAe1BXPWl8Ng3rQHGIFjAA8UGA=;
        b=Ww1rg5dPMZ7eLVS+3VO0V4r2jmbtiteqatO7DhjazwWe9GCNPBzZJXn7CEq24Pe39k
         5588N+mtxr6q7BhHuN2FpRPGoc8nLKzuTrCpa2N++681WCkEW1CUxN3x6L7l7q6AtqDT
         obtYAc9iWalomL1PFtQBOBMGmg33X+ytn8OZ2jjvllX+++on69oliYM2N29SmIhXqIq9
         us1iXVoaLV9RkcU7jqsEp8zPsjNucUbjFw6cMiNj2GyJtzKCYV7xSeNbZ2OiyrsoX3Eg
         iKDuFZFz0XaZ/vIrVxJybEQjMC51Yf03I0vjwz44by13KwDa4oA59zwrmfLeR+ZkbDDY
         v41Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFNhlYgkjQwFAMv3s0oDkN2ZZVRPzO0682d/wxQhLU6x9j/LgH6OHEsibvW/Dunh0UGVWXnt6w/Yb0PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqVq5/fJGtjZbY/CLumNqPQQVDX4r1DLzeXkN6KYonwcj5nXc
	DkELS+b1yMPEipv56FLkuy12kDobZ2OaZ3X0nGwzVrxPgVBue3u4JRBvUte4FA==
X-Google-Smtp-Source: AGHT+IEvNa1/u021S1k1XErRR5bkD/RvaCZqUFQg81oUJKijF5rpiMRdpeKxB40Z9diyYoooWSmBCw==
X-Received: by 2002:a05:620a:2801:b0:7af:cf73:d70 with SMTP id af79cd13be357-7b193f0b137mr1497661185a.39.1730110350726;
        Mon, 28 Oct 2024 03:12:30 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d279126sm305483385a.9.2024.10.28.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:12:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Oct 2024 10:12:24 +0000
Subject: [PATCH v2 4/5] iio: hid-sensors-prox: Make proximity channel
 indexed
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-hpd-v2-4-18f6e79154d7@chromium.org>
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

We are going to introduce more proximity channels. Make proximity a
indexed channel now, in a simple patch, so the change can be easily
bisected if there are any issues.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/iio/light/hid-sensor-prox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index d38564fe22df..0f12a8a83790 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -40,6 +40,7 @@ static const struct iio_chan_spec prox_channels[] = {
 		BIT(IIO_CHAN_INFO_SAMP_FREQ) |
 		BIT(IIO_CHAN_INFO_HYSTERESIS),
 		.scan_index = CHANNEL_SCAN_INDEX_PRESENCE,
+		.indexed = true,
 	}
 };
 

-- 
2.47.0.163.g1226f6d8fa-goog


