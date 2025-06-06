Return-Path: <linux-input+bounces-12731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A9AD084C
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 20:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232F317B2CF
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 18:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349B61FBEA2;
	Fri,  6 Jun 2025 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct7SeWIh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58C1F8AF8;
	Fri,  6 Jun 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235846; cv=none; b=LhrVDzrmB0RGe43Glh+vSLJesIvy274IZS5uFOsF8QXMbrZte3GBaHoAuib30pftK01b2J5ss4mRVfNAg0rwG/B47ZS154LiVk4VMLQ/FRk8/ibrSVNYpqFpI0UFPReZvAwO09L1c94iEnkt0IGBMa9skhEUSgglCPJTp70khpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235846; c=relaxed/simple;
	bh=1Y561gxotfU2M/XWcCQd7mQekukJTHXTG9krmV/xt5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STqwlCKzNCLoOAKaHkhO6owQIXQyrH3krfyRiOagwRfsgVa661DCf++MPIIipdxUGIyYFvXftf2+DnV6NrCIdAWJ43y4Q+BROY8qZn/07Wz/kW2QIZ/E+N0bSG49wFk4CyqCgiXMQHapS2wip74DWhXIkpRYj8uq1NpQlvZ+M5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct7SeWIh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a522224582so1496340f8f.3;
        Fri, 06 Jun 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749235843; x=1749840643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz0vQt7877ZXer9aIaRJd98DwV3rwF/l+2VwGrUZkNM=;
        b=Ct7SeWIh/gDVvCC1BU3wANxWiH1d4DZCxquheWkYGvqibm6gdBSofQHymO8JACzlCx
         bHvfpOrWdVE7nMDyQAGZz8Wwi0LuAAdPT7/D/18oEhZ7tfIwCW+o/G8MXuVKh2ysgPsx
         9lQ9uY18s8E6X8o1m+DRVagy2nda0dvV4P6IYUCdc1mlx09ZSzfyERGXSNoy7iVX9Xkb
         tZHN4jHIcB4jXhISBjawj3feMe4EPUoU8NDoOIMPgnZJQQvH/uz8T6kog0YeARVKU4fM
         LvS90Ai0IwKFt02huF5ZMxuk5e1WxpNFypXClvOhb0haa1ttkDbfutxLGtsC5AxdWAJJ
         xJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235843; x=1749840643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nz0vQt7877ZXer9aIaRJd98DwV3rwF/l+2VwGrUZkNM=;
        b=JZ8qkuENIFyXf4tKzAmF3cI7rQXAxBEoTgl+LPpyQkS6xolNXwCemUc0UrtMV2+Tad
         3+2zyFwlLogEiKVWpzGnRydV0c1W+QNt9T9Nrd0Q2Qa2RYub2Yv9oe3tufc3bD1nF3sI
         2nrypcnm7b+oi/xqyWjEinGwQw2ndSlLrGzLIrdnHh+/FTlxwNPpF0pXrHcd1Y0qJ0PY
         ig5ZB/RrMXZSz4iwJBAOVi4hg1rhGWRPrLqe1LgN7j/xaGiABdCVvhpOZWUvzXK1Jmyo
         ZEDcaJiGodH0kffkImtkDDL4ougRRVWqGcAmohlLnlCSe4Qb0Ie8piQqFetczRyqHMT6
         BAWw==
X-Forwarded-Encrypted: i=1; AJvYcCVLkTm36hhEhBteDG0UFyp4xOiOJ+So6HwGOi49M6fPQwSuIKcI/iyNGASWHecVYhqtAI04CGenRxYmUr9y@vger.kernel.org, AJvYcCVoEX9XUuQRALb2spW0BUh2WlQ4bZqnXHBM/WHNJFaiqH4CPuOsR5SyNX4Hbkyer4qr09WYNh44@vger.kernel.org, AJvYcCVr3LPwpXuFdNFdFBnHILAe6+bLllG7x3uL/gg5n3pg4GVSDe8/VP0A8VUqZFXWN0GiGet4sG2k0jx5LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGGDItwDh6IrQfV12MljBumMARGbdABl3tmy2npbK5GhRN/f/F
	BwrcOIP06SqIWtxPzi0i+CIJ2Y5eWXmG4csAQRcf/iVhT+rB1rS1G3gj
X-Gm-Gg: ASbGncsg+ihR9rLm/bmvPODpmNNm/L5eBMxNpkCO0c6u8Q1S5E4DT/4DV35OKzYI2Gr
	1YJxJnEDUMliFU77gRY5sAr/Fz4kD8+dNoWfdbh3Biqoc0sZIl7tyTS0xdvYY6OyB6DQq6/lmcX
	av2DXb0WYdoriYo9UuBqB+1jrIC+/kl+C2kzGR7UWfZgNn46Tf6kcYfhkUarmJ9ZEVdU/UD8+iL
	bqNHDMcUVcaFPbKrc1X5upDVnlBTAGyLqnOgHElANd59Ot94XbxIrKgheC1LUhZJ83Y4xi672yK
	4sJWlFlJoliK9hjbUDgHcqv5N9+Vz6syjvNrP2Qa10hNmZMlE8Y9
X-Google-Smtp-Source: AGHT+IFh+cYdb0g9mBFjnbpI441TkiJq6KGm4lUKoKGDJhcnOFv+cJ5fOUYOeLuvGPqAmbNvBpveZw==
X-Received: by 2002:adf:e68b:0:b0:3a4:e6bb:2d32 with SMTP id ffacd0b85a97d-3a53189bc60mr3150683f8f.22.1749235842678;
        Fri, 06 Jun 2025 11:50:42 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:44e7:a1ae:b1f1:d5a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm2713057f8f.63.2025.06.06.11.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:50:42 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND 3/3] HID: wacom: fix kobject reference count leak
Date: Fri,  6 Jun 2025 19:49:59 +0100
Message-Id: <20250606184959.35915-4-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606184959.35915-1-qasdev00@gmail.com>
References: <20250606184959.35915-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: 8bit

When sysfs_create_files() fails in wacom_initialize_remotes() the error
is returned and the cleanup action will not have been registered yet.

As a result the kobject’s refcount is never dropped, so the
kobject can never be freed leading to a reference leak.

Fix this by calling kobject_put() before returning.

Fixes: 83e6b40e2de6 ("HID: wacom: EKR: have the wacom resources dynamically allocated")
Acked-by: Ping Cheng <ping.cheng@wacom.com>
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 58cbd43a37e9..1257131b1e34 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2059,6 +2059,7 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 		hid_err(wacom->hdev,
 			"cannot create sysfs group err: %d\n", error);
 		kfifo_free(&remote->remote_fifo);
+		kobject_put(remote->remote_dir);
 		return error;
 	}
 
-- 
2.39.5


