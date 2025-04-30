Return-Path: <linux-input+bounces-12084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E43AA52C3
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 19:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4707B0471
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 17:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB829267B04;
	Wed, 30 Apr 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YL9+tNCV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2390266562;
	Wed, 30 Apr 2025 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034856; cv=none; b=XRlD+8JhuLGrEurOzP+4yr0sPXUvvvBr43n55RE6r531OmglP+uy6Dfo2RlxfB5FAJ6bZSDQwmSCgFU3bqAa5gFUcGgLgrGeLCNzrrN/AlqRWGsmqChQ8mHWzND5+keHL3DS6/yyQQa8zbQH3FZLq1ivQfT7Nl3yc537guOZajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034856; c=relaxed/simple;
	bh=3QFh2R0eajSy4f3mjOSVV3c1SueO+JBSzWRBoEzVmAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PXZrBhIenMlHYizWin7u8t+0M+waWUm7IozqESoFFPYETHg8gamFad8NhoYQVIS4K0/I0cvmGYNeIXVJ0ITLZuTlZPgXogNRIkbmhAEl2gi3Hfby/YJpP5vE7Tq1hLw9BqC1bEyBe+NnzryVHbAOfY364ch/yIwCp2N1JQCrUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YL9+tNCV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso393505e9.0;
        Wed, 30 Apr 2025 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746034853; x=1746639653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB95G5Dp+M7W1EFdGvxTXvDQf6oivitArJ2763PJPIo=;
        b=YL9+tNCVE4OvivAugwsiaeBbVC32KX5pgCFrQGNhKeSQWDUrh1Q4KAeBtOWz6jFtyS
         5trFIJmC9swIQ3kF901K4eZtTlbNUO8OZmpS/q5W2RFSJxz3ApqsTkJxHhNAD2ZTg10A
         wk1BWDHDRCARg7IBebMN/gS6cT15DM3tpiLrsrvwI9qn+zvhBmp1RGZRnLnnzDmigG6/
         zXZzoWGzPIyPEsI8jVP6AMIdWPVUOG4+EWtLetzMgf87d0an59Fdr/vT977sO+EST9Aq
         /Ju5JcsI5y4fCHREtJF1w8m0VPG70gP2jL3Kkgof3vVyd+BQN7UTdn4t2dTfVgrBoaAr
         ryfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034853; x=1746639653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MB95G5Dp+M7W1EFdGvxTXvDQf6oivitArJ2763PJPIo=;
        b=hShxdnox6aQk1BNeyilHE5Vkce3r0W2i5rJZzJFDkbe32hsFktKi9++hwz7eqKyANj
         rCIX2zs2wQZuwav7xDB63Zju/7XV+YeE+8c7aOqKpIrN/UAkS435JJpB9r1sZWV9fZ02
         7fVRyHjaDZkCGkK40K/41fQAskXGQjt6oZdb8K3T1JbW6NzVvbK8/FYkxOv6eUaJNCQs
         XDEfpu8n9OZg8beNSFDrqqUGrTisKzzzPZVbR8SRRhGmi1eioLZMNZBq4nAnEy1ej+Eb
         BpOnY5zw7CyR+fGIo4obXoygORNIaGcr36ZfKA7HtCtwezNopWvpg+/YI4Y0QY+oTUDQ
         GlfA==
X-Forwarded-Encrypted: i=1; AJvYcCW5EQoNYsKRJj91AgAHKF5WGHt+oNqWaDqgbdgT/er54Z9y2Hf4zrhBwAy1zWfT0RgjS9HCC/ke@vger.kernel.org, AJvYcCWHV9Y++MkC6Ofnny6oOJTWrNynWcUSjwpojO75oSCDbtlsMpeqEmWDJMuityRIRNetVB+WLvPnERPp+Q==@vger.kernel.org, AJvYcCXF19F2bKZ6IXfq0iiiBOW0dmW1zxRQUx01lIpRS2pJbv466FLVEBLCQVlS2i2cPaFFJX6h4CgTDFINylMx@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3hUW61xPh1Vf8GgsOW4+weWSaIjJgDbnxVCnvdyV+m13MHBI
	/j5sjsCsr3Gdrn4mBIQlfV+yq5jg/mpkSi+bjzIUIlkUfCvotXBv
X-Gm-Gg: ASbGncvEyGjzown3d9oeNPR7YzZZdn35GojXYzOoMrmPfmTosW+f/BTBav05r7ri1eV
	IFtQ3TAkRAzk8ZMPSl+gDNZA5lvc/glK+jfek0aXUJ8IdtQrrDhk8gqvpnm5LRm+gJDLZupTE39
	WWrAtYzBqhOKBs5mKTP71B5IzRiBZa9/BSE80NxlMtIm93AMjlj1mR+iWVFMzE0ZdnwhsTL8FpJ
	fxlJSJzi1JWIte69bsRZ66YSPf9NDA+iflPNc0FAXtgQelL/GMLhb/BX9J+6MNn4rbGwU/RnsQJ
	U/dv0poAR4IT3IwwsU+oD/Dec1iGJx/91fT0qCG8aQ==
X-Google-Smtp-Source: AGHT+IHyjBLLr+7BEizALNKCtxGKGNNRezJGu94ArQYh3DZ4AGnIijBmL+QKVFiKJZZ+7jhYbG4AEw==
X-Received: by 2002:a05:6000:430b:b0:391:3aaf:1d5d with SMTP id ffacd0b85a97d-3a08f7a2739mr3870486f8f.27.1746034853123;
        Wed, 30 Apr 2025 10:40:53 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:7d1e:a9b9:e7a2:cc4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5473sm17765934f8f.31.2025.04.30.10.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:40:52 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] HID: wacom: fix memory leak on sysfs attribute creation failure
Date: Wed, 30 Apr 2025 18:39:10 +0100
Message-Id: <20250430173911.84705-3-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430173911.84705-1-qasdev00@gmail.com>
References: <20250430173911.84705-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sysfs_create_files() fails during wacom_initialize_remotes() the
fifo buffer is not freed leading to a memory leak.

Fix this by calling kfifo_free() before returning.

Fixes: 83e6b40e2de6 ("HID: wacom: EKR: have the wacom resources dynamically allocated")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index ec5282bc69d6..58cbd43a37e9 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2058,6 +2058,7 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 	if (error) {
 		hid_err(wacom->hdev,
 			"cannot create sysfs group err: %d\n", error);
+		kfifo_free(&remote->remote_fifo);
 		return error;
 	}
 
-- 
2.39.5


