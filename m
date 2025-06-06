Return-Path: <linux-input+bounces-12729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22505AD0846
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 20:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D943B32CC
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 18:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4551F3BA9;
	Fri,  6 Jun 2025 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PG881Zy1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6641E1F4168;
	Fri,  6 Jun 2025 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235837; cv=none; b=pXZLEZmFaYFEGEfav8OtCV7eVodwg1uUsdntP2q6iXfkC+70M7fx3IH235JASd5erJyEtyOaz6qQYBuWTATans7Uw8wvZOmIXTRtET3lhJgOlAGIUXuEGBtOHk6kGxmUFmX98k1DYRRgFoxVF8d6OfO5ZzbaDWC3f5SnkP+LtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235837; c=relaxed/simple;
	bh=NdLZx6SNrtrx4SwH5gojmNTGg6eqHtkXjAak/CamQvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BqLAoq3y4TXLARpgHVlg4xSQkf9A4VHPGIlcJQl6cEMN9nMBJstH3Vt5hlDVAYkoJnP3vCKpt0Z8mRJU9MTEdO2UuPxNupDwURf3ohsKn11IcpqqCxm64nQZUAE9mEgUBujIa7c6g7kH0a3i2Mi3XObAwKVAkApf5BZr3wO5Quo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PG881Zy1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a5096158dcso2090665f8f.1;
        Fri, 06 Jun 2025 11:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749235833; x=1749840633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X9KHOsc9F0ZidCqJwKzDvYsUjyRXhITd5dF3RTeynU=;
        b=PG881Zy1hQggnmBG1qGrvQAftswSrkRd/xzmiNzksKBcCvBKk6ddyXpcbKrtWYt2CX
         r5d74B/jvaaMSX50tSjLL65My0c9jLbmJAXJ1sY92JiNwpcQh5UbcLbsAMpdn4zeCiuL
         ao3ZiXUR5I+8AuiIbMPaGiZnhlCYDxXMaNDBX6lXbNC8YW/xW+hTtquRlhnkzaq5y1WN
         6YT2KV4mOh7oA747vkTCGySRD/FfoRjOAnZBUJ6IH0Qr+WjTfez9BOeBpewpgK4siihZ
         5iYdUWoouBrxIoFWmCxi+xh6ko6++mu8G3Qui+1kDab/qt2zBubZMvgn9SSpkUooICtz
         sV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235833; x=1749840633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X9KHOsc9F0ZidCqJwKzDvYsUjyRXhITd5dF3RTeynU=;
        b=SsNNp+b7C2rVVCm+Jc1/9LQOZ6D9M4g1o+s0r+ih+z8ZfwyTFklxUUS2jsBrVINljd
         MoJWtpk8AkuJYA3Yj0uioFLRtYVPOeNsWOiphwefAKiRx5ApYr3SjcfKCPb0bMb4DF+5
         Q+2c5baU4pj8BVVna5lyvZ5B0hfl88UzLk/lzp22azilbzwLvuBFh7qOu74GJNBLkwox
         wM+sG/aqIT2s9HLdf57w50BFoYZ/LTy0OQmnF/bBCBccTCZN1a1sDHu0NVHet2rZVS2Y
         3gVuOvcNGspJoLMN5/+IfrTrdbr4bVwGwWHiZpdo5f/+h669JJlQz0pSsqT5HwcL/tUN
         9WGA==
X-Forwarded-Encrypted: i=1; AJvYcCUdLBKLDHzHZPTVsj9RFDt6L7XsmNlc0numJuZFkNVm5npK5mGj8+PiF6PEERPKw4T8j0k29Ygv+Xagr+JV@vger.kernel.org, AJvYcCWqPhB7sr+YVxVut+dZ0sZ9zwjK2hPCjB7W4kdloTk7sh9aZv91NeEHkJ0rh9CX43yfqOHtTPlM@vger.kernel.org, AJvYcCXStuDFmmG+IebMGRxRq3oXe4MkF0XoOBjiIYZFqgKK570nqTLy8XXzUPWiR1Em7T59KXNdwNA2514RBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzizqsO5PDoklX9yaz1vCW1xFKBYGh6wH8TSKKhF0kmGEEPNCma
	p2HtfQTzUEvNHcCMiFtF7pMcXiA9x007lz21WollYHglZDZJha8x2gEv
X-Gm-Gg: ASbGncu6i9btpM1P7DP3+YnQbAqx3fED672lxEgt/4gvv+T7/NBeW2/hrNP6awMpB15
	ehVoDDw7+Apn/slFcZiBHl2kAdQXoo7z5mkxMwI54F4G+fWBzYNZ2PvxwcDkRIq1/qG/3H0tPYp
	1VIjGG8ZVaV7ubt8iSTMka5pJABA6CtZ9UTzqSWinuiwLgaaJx8RSc6X7NsQJslEtius/UdORbg
	rFCyuS42XA9dHNl1vs0/Gyg/od12+0H+0ttcfGcDsbzLn+/ItLmlyGpYhglplKfXPuSw3QZf3ep
	aFXjWgEBgUwgqE6lIVLeNT9uXkRGDeXXPNRcPImt4KumLknuaT4tqXkzrxg4y7M=
X-Google-Smtp-Source: AGHT+IGnMAGQpDA3bxgIqVeDYLg7txF+FfUKJgcUdxE9mxm3KBo3HRNuKAnnkuXFaZPTqmSQdkyb0A==
X-Received: by 2002:a05:6000:220d:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3a531cec3e7mr4688607f8f.56.1749235832447;
        Fri, 06 Jun 2025 11:50:32 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:44e7:a1ae:b1f1:d5a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm2713057f8f.63.2025.06.06.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:50:31 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND 1/3] HID: wacom: fix memory leak on kobject creation failure
Date: Fri,  6 Jun 2025 19:49:57 +0100
Message-Id: <20250606184959.35915-2-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606184959.35915-1-qasdev00@gmail.com>
References: <20250606184959.35915-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During wacom_initialize_remotes() a fifo buffer is allocated
with kfifo_alloc() and later a cleanup action is registered
during devm_add_action_or_reset() to clean it up.

However if the code fails to create a kobject and register it
with sysfs the code simply returns -ENOMEM before the cleanup
action is registered leading to a memory leak.

Fix this by ensuring the fifo is freed when the kobject creation
and registration process fails.

Fixes: 83e6b40e2de6 ("HID: wacom: EKR: have the wacom resources dynamically allocated")
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com> 
---
 drivers/hid/wacom_sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index eaf099b2efdb..ec5282bc69d6 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2048,8 +2048,10 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 
 	remote->remote_dir = kobject_create_and_add("wacom_remote",
 						    &wacom->hdev->dev.kobj);
-	if (!remote->remote_dir)
+	if (!remote->remote_dir) {
+		kfifo_free(&remote->remote_fifo);
 		return -ENOMEM;
+	}
 
 	error = sysfs_create_files(remote->remote_dir, remote_unpair_attrs);
 
-- 
2.39.5


