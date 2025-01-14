Return-Path: <linux-input+bounces-9217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3BA0FDA2
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 01:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1AE4168969
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 00:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A21B1A270;
	Tue, 14 Jan 2025 00:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqdsaz+M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139550276;
	Tue, 14 Jan 2025 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736815331; cv=none; b=AVy3+Wecr5FkEeWU4On20askRulluHbLhFOV1ho6jSeWkh+wwH5kNB8KA5lqiPJjBhmhnCNJWGcyMEbkkB7EHbBANmUNOtVx3ZMLSMwM3cWjcGtvXH4YP31i2XHi4R8VrxSVfwHk0UK+Qf0mlbXjwXrXrffPeqcqhEZYKDAdlhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736815331; c=relaxed/simple;
	bh=qRvQoseZ7PsW3bUwVRfS/fVLZoJaq26wGufV2WfgjCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBk33RWK6bkpMVzsE6gKKsJUZ1yxnL2nOujig5XisyzYR3lv08SFQGVmCgVMbj3eQ4IKP2h8q7cZvmz1bu7BUvbO7G1nTUO7Sc9RRsgTsf+Gz4cNC2QDWUdvfrRbm/LUWMG8WVjeK7BQTs4Ueao/p2n/QYR7PIWGbJdBIu/iTUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqdsaz+M; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f441791e40so6505352a91.3;
        Mon, 13 Jan 2025 16:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736815328; x=1737420128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RIZDzXvHpF2z+SNh/23eHlb8nXlXRFTwQ1egqv51hI=;
        b=Kqdsaz+M/bnMQIdhwgCN6Xs9OZaKl9o+no9LnJixydG2lmG0FB2DH+a+yU1dj5Zif1
         ielmvYPCOvLMyfY+2f0t6t8wb3TaBVfqr4XZjHzKx9cCJm/V7dcw+5qhoy4fgMKX9wul
         fiMQ5l/GDxTtRitEG2ygZsWAHs1cmS/A28ng0ssDz9BWKoV2v3EoOfT4S1wLr/Aspb+x
         b5CyxLMMhWU0PCRcIgCmFi3wL/dR/2cnEzhfSC9jrHbziQZmXmqLPx3eFp4mWQ4hjuQJ
         EsB17civmzLJL4i+hqsS+bHwXTuCaDsVm+AR4jwqEbqRHs2PSlRGrlPSZgOGw5O9t7PH
         M8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736815328; x=1737420128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RIZDzXvHpF2z+SNh/23eHlb8nXlXRFTwQ1egqv51hI=;
        b=BzaS3my4YmQ52nWSr5M2PD2ddLk7OQaYJZaK7n7NcpXG0SAq3LIP4KzUrp5HCXpqwd
         PLXCpcVyfo3Q92RhFoFjRq8XOzZvsSPzkSz9WeRF6HpwUOTsWIgsxgj6DtHhDFUf7MCs
         P1ITL0aCFBUnv3CtVDTlTBi0ywk/L0QKyYPL4xYYETM4/UkCOqvrcwk4V0GdVoEybFhf
         X1vr1oF9Bj7rlrCMEo/WzsH23dNovHRfQyVMPx99P9q/vfUbpo8KC4oWwWZl4cs+eLt+
         FiFSY2F39GgVcWv7l3iv5Rm/XzVpwE/kll62GGVOtJYTtw7wLJwD8uvffC68U/KjlvbQ
         JZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCV+sjSHHPY4AiY58uBi0ihTy0pS/od9Sc81r7nfInqS1aKnU+fYkkMOR3M7yMiX91zWLOUH41N64QG+zZa/@vger.kernel.org, AJvYcCV07qX4LrLn2btIF3P3DhAVKYrk6ifhw93wneLJ0aVgFGPOoW02dxnb8tJ4omuMjOh1UmHGvRDhcmXLlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLyLjEswTjCBABN5lx2zdK+yBbox7fk9Z8BPnxNZcpQHrdpdB
	QwGzPTEJ89xV+J48UEGMsxXRwPyNKoR/3EgPYMCiMdArZMH55cQ5
X-Gm-Gg: ASbGncvavYzfA8i9vLeVoyHH5WF8qbOKT22FzqcH0j2ULDj76ZlAuOtLNDSs+vRIMvx
	Cnjzf+2FfsC6Bw+I3/qse7bH5/jVjJuuYR4P7zdTUYvLBJ4RAl8xzyMlhJNFXg4ZV/apVfF8Dby
	TSDWIqqbuCGvsJ2BqEBFUeOoZAnCetDDtYJqfosOUitkd/dxkWlLmc1qi0H2BFiFIuleDVRmkuk
	pAhR2I3CgB2CVfiko10CNL19KHtQhl6iLujLexGrafvXHzHbbXjOBOgdLtpyOjxJcp/um+UZ2dY
	MNJiU328+Ub9eMbFvi9b
X-Google-Smtp-Source: AGHT+IEk+g9F1u5vhvgd6Zy4CBluv0WJx4HrVjD4xHWFv4pkcoPOIBsyAxsck8eNrE8S1cEpcl0RAQ==
X-Received: by 2002:a17:90b:2748:b0:2f1:30c8:6e75 with SMTP id 98e67ed59e1d1-2f5490e89e0mr28067710a91.32.1736815328098;
        Mon, 13 Jan 2025 16:42:08 -0800 (PST)
Received: from hera-2-ThinkPad-X12-Detachable-Gen-2.. ([2404:7a80:b9a1:7100:ac84:a586:4350:6982])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21a032sm59430955ad.135.2025.01.13.16.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 16:42:07 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: lenovo: Fix to ensure the data as __le32 instead of u32
Date: Tue, 14 Jan 2025 09:41:58 +0900
Message-ID: <20250114004159.102555-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that data is treated as __le32 instead of u32 before
applying le32_to_cpu.
This patch fixes the sparse warning "sparse: cast to restricted __le32".

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501101635.qJrwAOwf-lkp@intel.com/
---
 drivers/hid/hid-lenovo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 4d00bc4d656e..0d9792750dcf 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -783,7 +783,7 @@ static int lenovo_raw_event(struct hid_device *hdev,
 	if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
 			|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
 			&& size >= 3 && report->id == 0x03))
-		return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(u32 *)data));
+		return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(__le32 *)data));
 
 	return 0;
 }
-- 
2.43.0


