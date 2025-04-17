Return-Path: <linux-input+bounces-11828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338AA927E1
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 20:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D604319E6714
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 18:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418622586FB;
	Thu, 17 Apr 2025 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrwbfoA8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700272586E2;
	Thu, 17 Apr 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914356; cv=none; b=E9szitr098V2FLTTwt5BLzP1AyUX2lRnHB32BC5KEkPyoyEnG33FRVLvvwirvp1Mig4ugJQSMK+PLBm4+5jxUep2dv6TBuyv+7pRtrDKT6LU7aAWkw1Wuxns81jx5axdB0JwKZc4071szPBX30gbPRZW6lhN4lqNG8E4pB6ylz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914356; c=relaxed/simple;
	bh=u53yL0a/1/RYDTw+aARftjh8UkdlgZkXzY2Gi3tTFs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZnPUhvU9ydpiC5Au6x+Zx7geG9zse+eErFmNv/SVn7NMKAy0zGgsOweJRL/bY5M9JvZvxsrmQOGw/7oqhq2cgWbqpL53zd4fm+cKpTLSt1HOlffYYT2DreY1jWcxHXRxekGMDkMYp6+xFMxuyg6+wGSDAXa+ypeLn6yXBy5I3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrwbfoA8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso1105813f8f.2;
        Thu, 17 Apr 2025 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744914353; x=1745519153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=YrwbfoA8kKTJ4eFSZBZ3js0oaAboV8l5zW4hjeVLInpvkOpSafnpvonKhHe63J80e8
         tTkJWEKcg7Gc5q+2+hU0MoRMYgkBvnqLmZwu0VjV7o90CQCKMYleRFN2G1Y0rQXGsq7c
         A+rwwaAZj6K4uWkSDMk7k18sXq6CdhsE8Ut7LqlSmj+TzN23V0uOaBXaQcaoz8Ghem/G
         6u+j2qMq8HtcMDUaV4jULo1/AXFPNXD/rawL+qGxJkmu3bjHNZN2hv5EarSQvV99nVQe
         H2J3R0ZU+31UeCtT8CjRUBFacQJszPxC0BjcmzGT6KUeab9sMuIGBlQ5fGqSUXTN9R/d
         kFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744914353; x=1745519153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=vPP5qrjaAaXz9LtnSPesipqx9vuhVvCMjUuLzKeIOEO4nePaVveqLgixw4KQ4zvwzw
         mrnvKiVCg48tyjqnY3uwepkGcRuNOAsZ7j4XOmYAF9NPWLdeiTL73G8X9sT+JBDZxefW
         t2q4oMTSFfKathOxhZnjqD+s8oGWMSjB3dX+S12kbZ18SACQiF0KnPN++pIZGTCCj09K
         TgrAi1pQp+AkawNzj9nN1lckTJqzzh8vZsV4M3+SKpQAcE32zAiEYHkK+IORuDd0y89J
         54pAW2dCLq9uvLoOdvreLhjgkx3xhRjU4CzK5gaI2Spq6eahHPcO2VD+DT7KRtAL6JLy
         YuEA==
X-Forwarded-Encrypted: i=1; AJvYcCUwAP9CIc08a8TNqJVns3Ygejak01f6qLovFiTi/onjXJKSkdCJ2u/3289RDkO1NMaiBQQZzVvcAbPVZEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZw8RtMnm2JDpx3kfPzmRrWiKZuswSzU1Lq+cQCbuEv6plaaPj
	GOQMmV+ENkV/1cWFwLXoMAzTqv9wxZQdSAa4ykj52Wlci4vj3QI+
X-Gm-Gg: ASbGncuk0l6/hRaxFVyI+FcOiUFhqDLRqMZU/5hCHdOxFVDkTY47Wct1tLkP43qQYYc
	gSVyI5Rv09LtepRM1VS62/5+oLQOKBb91LSMEEsZw2T7I3txf4brsJoH/7LQyQI4E9WhlPgi62/
	cQZ48901IyoKDvDMgGzKBIzpXYWxJKcGaEH+wG5Kk/FPjTb9VKDoLPmWZKqp+P6tJ9Ny7gtJxyu
	hV3BFLcO1OkFHlJLKoWwUpSuLhHdSQN9u2pFQBGCO7QmIaZs7br5sUpDhmwwW/ZUrhHhfyUmCQE
	EItQPds380a7OGKz72dZvBpYJkXRSIvAof2NtH9Z
X-Google-Smtp-Source: AGHT+IHWFOtrF+N20ECOnSfV+42jDn6aqmV44/diJP2+K061uVC6Elbk2/PzNB0QPE9GirlcymnYfA==
X-Received: by 2002:a05:6000:2203:b0:39c:30f9:1e57 with SMTP id ffacd0b85a97d-39efba3ce78mr4300f8f.18.1744914352430;
        Thu, 17 Apr 2025 11:25:52 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:1efa:2230:869a:758])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58cc0csm64908185e9.32.2025.04.17.11.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 11:25:52 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
Date: Thu, 17 Apr 2025 19:25:49 +0100
Message-Id: <20250417182549.36268-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In thrustmaster_interrupts(), the allocated send_buf is not 
freed if the usb_check_int_endpoints() check fails, leading 
to a memory leak. 

Fix this by ensuring send_buf is freed before returning in 
the error path.

Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 3b81468a1df2..0bf70664c35e 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	u8 ep_addr[2] = {b_ep, 0};
 
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		kfree(send_buf);
 		hid_err(hdev, "Unexpected non-int endpoint\n");
 		return;
 	}
-- 
2.39.5


