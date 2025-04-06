Return-Path: <linux-input+bounces-11547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F6A7CE27
	for <lists+linux-input@lfdr.de>; Sun,  6 Apr 2025 15:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955E83B1E3A
	for <lists+linux-input@lfdr.de>; Sun,  6 Apr 2025 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28D11A9B2B;
	Sun,  6 Apr 2025 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5BJJhS8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E214A4F9;
	Sun,  6 Apr 2025 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743946568; cv=none; b=iPN8wVz+7xKpZE1zoFj5qI37eRc3SNDQaiZWnIQrsNUDmYwiRKklnOjaMkANz7xC+1mbNZCakLMnq5RemRSF62bQw2Ep1jLsnRlDEN8T1aDbO//uF8zRShJcjy4oSWGGb99WY9QLOidvTW9y79VpruJfyUlCny5er+lyRrajsgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743946568; c=relaxed/simple;
	bh=u53yL0a/1/RYDTw+aARftjh8UkdlgZkXzY2Gi3tTFs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OXznSwYHgZp+NMym8ssxgxPmwcwbD9goVVGJdfrzJ3RXAnXUJ+h1IJcF+/hsJrg8Ok/nXFonZYHirFAD6fbR+rzNYARU68R4vf9a/NNh/zSFRtkusAGuywFUKH7gOIvzszBFyC5HL3BpSB3BbO20hAZ22RW347TKPrFXYVrOSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5BJJhS8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so28100455e9.2;
        Sun, 06 Apr 2025 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743946565; x=1744551365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=e5BJJhS8rv+ROI5g8k0ttNpcESaV37n6VhOvmqa8Yl9W6MZ3o8nfep3jbIHbO6f2Y4
         TqdFwkuTyrbEL4xB5chgtIuWZ/bBbnkk6FIdQGCJHID/3UUZLkEcrwzO2if/D/2OCDm/
         B54qfB1GtmKRkY5enL78YasauUiGqkoEKtyuqwhZp/umdbpNepG/am39+CiRdHZKKm/8
         I9qNKM6GYI2Ds8K8PPIPewHjizm2zdiFKyLTAWsJrNV/AD0WWjNXW75iFz6zVO4uASJh
         mhIqD7v2mZUELBHmxVbNmRCuTd79fHkXHGmTSpVO1atoLRORohBcwl8UuZm3F1XTQ/0y
         qjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743946565; x=1744551365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=cYZAcfWkAICEmLyXwEb/eW+Ha6SCw/SJXEBd4FLwdGvY3/IyV0S3aGRn2K298938mt
         +DH7dgR1RTHK8vLfy9OFnrW3Bd+LiOUiY8ZrS8bkh94nU6gz4AAOpv0zvhSmQXLl+N2R
         6aT1NKG+eDnGNIzMyqYB0lU0ia0HBQ/tiHYnhJFLQ0qF0mdpdVNL99url5J1sW+Y85lT
         l88k0DLZRM6bMYlq+Gktx+P/ckad9rJtZatxOQlxwQkVhPW2orpfp4CiTyiyPBzPlr8K
         uB0xVIduBQFDDSgap21V52EbS/yPKOUpkMUYA8yHn2bGP5Yqw8hGCq640yeRXtHFLOf/
         JixA==
X-Forwarded-Encrypted: i=1; AJvYcCXEkZkeg1Q+trAVmkYQQiXskhDkDZZ0TbOUzgH6TWAzPVVk82J3TJegrNsURFerA2tvcbxZszj4nTV2Utw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5r2Z2LJ2UGQsEpYj3BhJlzP2wKj3f7YjnuDml9lzgH4v2s7sa
	Npe2C5McRdxVY3nFMrS9pHXGo6Q72wHO9qEZ0CC0GjSscVjJaZF7
X-Gm-Gg: ASbGncsNkBkuaK1uOBBYyS2ANSMMo/UzYqYa8uN6odeizWMahs0qD6mc1t1VxpLow+2
	MYtIcVvCJkn7M81WaH6d83TjFM4gFFAgWjpO2MpSj59sOpadgieOitLgar/d5xU41bn45BH6q5W
	tnAVMX1zkxYjCK3M2/7b5ISZitEjhyzUrYEgh5pCuzGoMIbN8wrq9VTOfZpEdCXQDHJUWO9kLIO
	Yfse7JQxrtipowv3IQgI221ENpdT4iJ7cy4r7N25PdJXxdSWr12icwrakb0Jlh0b3bhZJvkIiys
	HYNYem83DrZYCHa53wPjmbw15DNtYIMtGr8vsfe7aaLSGw==
X-Google-Smtp-Source: AGHT+IGaLSX5abguqVbP+J6yIKq+sGqu7t/mSZeOJdHosj/2KCuKMRBbvEKTP1d8iNP8JedYaFysdA==
X-Received: by 2002:a05:600c:3d94:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43ed0bc8d58mr87064365e9.11.1743946565281;
        Sun, 06 Apr 2025 06:36:05 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:e805:af55:cd2d:e06f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm100652575e9.35.2025.04.06.06.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 06:36:04 -0700 (PDT)
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
Date: Sun,  6 Apr 2025 14:35:51 +0100
Message-Id: <20250406133551.4576-1-qasdev00@gmail.com>
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


