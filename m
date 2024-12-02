Return-Path: <linux-input+bounces-8341-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0B9E0249
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 13:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5FA16363C
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 12:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB14B1FCFF5;
	Mon,  2 Dec 2024 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAkDTYH+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0261A9B2A
	for <linux-input@vger.kernel.org>; Mon,  2 Dec 2024 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733142869; cv=none; b=arxfyjw99f3x8tj1i3Ln5GRc9yOVgRRHtqpceQyuXj7Du/Nbnt++mhZpyFsz464u7Ec+1T1Yrr5Nbv6gpkHR4fAFTj/pbSyMvc36wm3RgkVxLWnqN3NChaFSPbC0ne7klNoMEZCnnYy9/h4qUw7KByfgXvIaPY+i3YFngvFVsQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733142869; c=relaxed/simple;
	bh=2Uk3a9Qp8JSvHompwK90+THunNltHsmaEj5i1f6w6Q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3fy96W9aEuuxIY4Wa4/p0uHLNno6n+yT2FxLe8ydWBxwGEUz2IHhVqYxgodBsZdRyWY4X8vwQmcXu/kVmJvHiLXwHPF0P9n+DAR8vrRcJa+nC1QTN+t/vCtfzDAMIADLwdEfaDaP1ShdzXMzWmMklVD7L+alvTvxscfuyMul+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAkDTYH+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385dfb168cbso1776619f8f.1
        for <linux-input@vger.kernel.org>; Mon, 02 Dec 2024 04:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733142864; x=1733747664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwLFMhda36dQvX1H531xKM3kTIPOD8rkJEGrbxUbdrc=;
        b=AAkDTYH+dTfIRRo0ZFmJk065EywF+P75QGDAI39qDLzJHt+9OC4J4seBfoY8/XVbLV
         HRJY/tKpnVBR47/Y/QhAU7KfNovXD2Hrbu5kxqxifYF/z+eMgabYQKs69sdwxpGLtRDp
         JYHw6OWbfoIZwl5dx7PHW3b9S3ICtDohwXQWvHfo7QAZGzL3Xtf6bskX6dyMAK+yyczN
         hJE5ciOoLpY+exKGySuoJ2cWOkzV0yevcYxRdAOBD6fLhr9fl7MHqCdQn/S+m7P9Cix6
         LM8TJDmHJ+aQrhbd3KvfnsJtSw/jZldN/F+ix7sgJsflsTwNkem4UqERy2LPrXSEZ7Jk
         sifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733142864; x=1733747664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwLFMhda36dQvX1H531xKM3kTIPOD8rkJEGrbxUbdrc=;
        b=sSDgtldN12luPt1DJ1w9TuHNzDxcES0sm6emtWBo+8zP31oico8cRbxl4gWbSmnivc
         fUGvF9dnyXcYV7Vp84GyXamflSTb7OMUrMXhXaR1PmlM292BCyfSQbMR9/6l2sv9qfsT
         8veuPlka7b7Uhk3tvZlQ1BnHThivkGmH1RW1Axi/AJ4toY/RRB9jy27v7hEuD2eBLdJj
         uiI+IYSh5lTICKoLuE4o2/v0iFceu6UURGr/pDNfxIVL3lzbBvalxDKWTPCTblYqOiso
         xwEbqKdn4hqdWTW0j/bPrfwRP9+5073s/LxoXpZ1kT4ig1Dr06+MzAd00a1kr6RqbvlR
         8JIg==
X-Forwarded-Encrypted: i=1; AJvYcCWGiEggKxK8xvRl9ppb/7eqpfSqAPG+q4ZLKNkteqFcHSY5qxnrJ5UUp2+96cU4Cyaq4/N0V4VAs5emBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PAu3gmnVEZska3iRSxDng8KdhugzxEzJOjE/vfu99UvliEku
	pW0dFs9Qaf/V9A7LJ1mooKbHtSZBlOZflvy5kGkzApADgw7UmsxyHNoqEV7N
X-Gm-Gg: ASbGncvkjErp4Y0byoSclkdQvAk/GuwxwwnmW/NNvjGew0uNLwUln9pd7N+rC0xR1d4
	pUPc9gGWTb5JoWNGw/2X34xL6PhdIBpj3mlJH909FCv0OEgZzCpFj18BLEHPNdtjSNolZCi7kdh
	BW52FXbLeQIRB+tMbWecAqQXxNehNgCFgQX4aRQrqLjE0NVBj2YAUGVr37EIioTXBxU2ANOvdaW
	NDVdnzF/w6lPHRfw+SXJPaS6On/j3zdF16OFX2Pxwgh5b96+1f5yuWPDfXrpuU80A2Lc7s=
X-Google-Smtp-Source: AGHT+IFaJ/QEJJFMgSLzDhm/0BFKVI52jnvAnvMQCC9zOfF7VBlsM0KeTl/zk//ukVQL7+YKm1Os2A==
X-Received: by 2002:a5d:6daa:0:b0:385:f13c:570a with SMTP id ffacd0b85a97d-385f13c5a8bmr3539754f8f.7.1733142864148;
        Mon, 02 Dec 2024 04:34:24 -0800 (PST)
Received: from localhost.localdomain ([90.173.102.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e5b10478sm6712040f8f.73.2024.12.02.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:34:23 -0800 (PST)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: 
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 1/1] Input: evdev - fix wrong timestamp after SYN_DROPPED event
Date: Mon,  2 Dec 2024 13:33:51 +0100
Message-Id: <20241202123351.86957-2-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241202123351.86957-1-guille.rodriguez@gmail.com>
References: <20241202123351.86957-1-guille.rodriguez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reset the input device's timestamp after generating a SYN_DROPPED
event, otherwise the next real event will use the same timestamp as
the SYN_DROPPED event itself.

Fixes: 3b51c44bd693 ("Input: allow drivers specify timestamp for input events")

Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
---
 drivers/input/evdev.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index b5cbb57ee5f6..6ab38a611321 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -142,7 +142,8 @@ static void __evdev_flush_queue(struct evdev_client *client, unsigned int type)
 
 static void __evdev_queue_syn_dropped(struct evdev_client *client)
 {
-	ktime_t *ev_time = input_get_timestamp(client->evdev->handle.dev);
+	struct input_dev *input_dev = client->evdev->handle.dev;
+	ktime_t *ev_time = input_get_timestamp(input_dev);
 	struct timespec64 ts = ktime_to_timespec64(ev_time[client->clk_type]);
 	struct input_event ev;
 
@@ -160,6 +161,13 @@ static void __evdev_queue_syn_dropped(struct evdev_client *client)
 		client->tail = (client->head - 1) & (client->bufsize - 1);
 		client->packet_head = client->tail;
 	}
+
+	/*
+	 * Reset the timestamp; otherwise the next event will
+	 * have the same timestamp as this SYN_DROPPED event.
+	 * See input_handle_event.
+	 */
+	input_dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
 }
 
 static void evdev_queue_syn_dropped(struct evdev_client *client)
-- 
2.25.1


