Return-Path: <linux-input+bounces-14409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F68B3E627
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 15:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D34017A55E
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 13:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A864338F5B;
	Mon,  1 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtIC1UqZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239733769A;
	Mon,  1 Sep 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734859; cv=none; b=qMrNRpiUeXC5W6jGIY4Y8/hRdG6FMHk+Q3B8l3/asT1zzExNTqHJ0adI8Q9Dw7x++aILZ1LlDt0oampsT1r3ToAYB2D84SbSLrBT6ZEp+gauaCtRdFa4JmU4qHT009wm/5UM94LLao+ZsBa5axag2XueHm1zuYRGR2Y51cToY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734859; c=relaxed/simple;
	bh=XJVHQZKT54LS6zSdKtYkawScq/8Er7MDU6CuNO2smvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Clu4oZO0H/rCzfIcWx27xyPXQsRuUhCQFVkmISiYCxTFDvrrhCaMWIAGa9GefItQDgzWaPNiHNkCJl6Ah8aSMEc+MrvbVwodAwfMTmPyxpd/wXA+Hl0Nv+Sv0fuMyOEMhdPib+oYhpJzV5IGCdw81/VDp0yxnNCmOhpgJdVUJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtIC1UqZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso2755668a12.2;
        Mon, 01 Sep 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756734856; x=1757339656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yoFb9PtvIMlCEAZZ6KmSHzzXADL+MeykRb8EG3MZoA=;
        b=JtIC1UqZdDg/0G04GPTOeE4wu/D6QzYQvIs9lqiNvPFR6yDnJJJN1zDTFTJWMtmO2K
         +a/+fXCxsgP/stW3emFtFnajG+Q8l6fG8TTeg4X4ZRQL0QU9xnZtlmgWux6ZjxpPjyy7
         5gxQUR8UoJiHr/9YRgwqhEux/LuB5OqmXWw3YMknqrsClmfaL/mfvQDfeVp5U+EwyYXr
         QvLjLd7pTtP9A1W9uPe0FxyyASg9Qx0uS9nLtyb90VIFVmzJuHGMCvcitWEuUC9IELZG
         xPBCuXizywOFt6dhjtOu1hJoXByPPkINGkqIBf4guE9Wqon+VqblsIVFHdTD4BDDnFkX
         sJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734856; x=1757339656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yoFb9PtvIMlCEAZZ6KmSHzzXADL+MeykRb8EG3MZoA=;
        b=xMV4N1RwMI+ExIBKPNoOuHRqKooHtb7di9GRivTNy2U9lgkJ0zfCUsqq62VUGyzUE4
         aVMYLDuttoovFpxNkXsB0dMWgTxRzq+xPaoc4rA74IIoamTIvox9GmfdF2CsURer9HDF
         zYa/gNrxH1kOQxr87IkbCS0Dw7z7xmN84gdVF9BUJoIpdJ6tLSWNZmxZSlrSpFfaWNZV
         h/9fmgkpScSi8PuxgHJrQPvbXzy7ew0OY0I6YmKqEMVbHRk/9LzwSY0T7j1ywy72gBwr
         VuWT1hOEAaCaeROwYlsvX3+XTeN2//T1m+O8DdAK+qIcnyRp1jdogQ6/A30VpNnU3xwk
         a9Og==
X-Forwarded-Encrypted: i=1; AJvYcCVj5ZXxkluCaZnhZSqLy5KMXf3sOLAbwoHLxT9b9ITwCE8Am+IsNQhaEU/5TLnzk0a/1uGPeKEnvZ5lhrbvCaXNz9mUTw==@vger.kernel.org, AJvYcCXQwhPQB6hvWnP/Mzwc2bpC2i7jL2fL+w18o4m6agybnpru0S5xn62ERujaG6ykmz5rJf4s4zG9x7hgks5Q@vger.kernel.org, AJvYcCXVszZkFoi+v6537HBheS0v31u+VvTEpJdJvgOPeu3VOFLmQ2jk1gBRCBT2i7jAaW/GvYg7O/c3t80wyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqKcQOwCVOBsXuEUEBol0O8SOHs2Pi2vIOikp5ZLzXrFUIsph
	1mDgkn8McsnmnyJnzLg7aOeb1XF2DvxSNcnFQpKq6ZA54Wk9J9g52+fbzY9srweEW66xZeA5
X-Gm-Gg: ASbGncvv3yRQkjqoU71ulSRfCCqOECaf9Xc6ryyCvQCOomyCEL/AFP0aftCz5lIJxwR
	hDsADFMT+qlUITLMwpZhMmOH+BLMUgLVESWgY65b5v5Bon9BAt7m7piTH4q5Dcj9LLgPJbzXmGj
	ZOxP6ASfBdHDchb1c5jeiZ1vv4R00TJiFgHKQxz43Yuaj+DfUaVR07VldvRtNl1bM/SSQQ+TDtm
	T9mvbLMDaFZzmItufqHC8MuyDqA4l7VJheqadgGJp1dVPYpOGMx2BbgNTQerA3OQ7InW8RK2/b3
	j6gi1rxEmDHZomSPOI2ns+boMkxrUTtA44FTBhcumFBXaOjTPxoTc/IQi1ayBPiQt2n0k/5+awb
	Ou5D3Jg+R3tdtbWwhhBQUHa2uE2mlQBjgJJqWjoPn5kHqS93/rmDINA==
X-Google-Smtp-Source: AGHT+IH605PcG8MPvdK4ZhtnTG2KGrv8GllghJSH4eogkiZXkBbUS0mysBOXm8Dd93+Xp6Xwk1IIFg==
X-Received: by 2002:a17:902:f60a:b0:240:2efe:c384 with SMTP id d9443c01a7336-249448db132mr96167615ad.19.1756734855866;
        Mon, 01 Sep 2025 06:54:15 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12.. ([2404:7a80:b9a1:7100:d5e9:d016:7fe4:a7c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906390e6bsm106733415ad.96.2025.09.01.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:54:15 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v3 2/3] Documentation/ABI: Add sysfs documentation for TrackPoint doubletap
Date: Mon,  1 Sep 2025 22:53:06 +0900
Message-ID: <20250901135308.52340-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250901135308.52340-1-vishnuocv@gmail.com>
References: <20250901135308.52340-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding sysfs documentation for trackpoint doubletap.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes in v3:
- Add sysfs documentation.
---
 .../testing/sysfs-driver-trackpoint-doubletap   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-trackpoint-doubletap

diff --git a/Documentation/ABI/testing/sysfs-driver-trackpoint-doubletap b/Documentation/ABI/testing/sysfs-driver-trackpoint-doubletap
new file mode 100644
index 000000000000..d7cd63005523
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-trackpoint-doubletap
@@ -0,0 +1,17 @@
+What:          /sys/bus/serio/devices/serioX/doubletap_enabled
+Date:          Aug 2025
+KernelVersion: 6.17
+Contact:       linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
+Description:
+               A read/write attribute controlling TrackPoint doubletap.
+
+               Reading returns the current state:
+               0 - disabled
+               1 - enabled
+
+               Writing:
+               0 - disable doubletap
+               1 - enable doubletap
+
+               The attribute is only present if the TrackPoint firmware
+               supports doubletap functionality.
-- 
2.48.1


