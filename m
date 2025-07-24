Return-Path: <linux-input+bounces-13682-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35307B108B4
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 13:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32A057A774A
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFF926C397;
	Thu, 24 Jul 2025 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZQRW4qh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4326C3A4;
	Thu, 24 Jul 2025 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355514; cv=none; b=DEBeKm9r8K1dfmVHLZftnrLq7Ar3Oct1mMD7I64s98n7ncWzLH+gl0igrtPJuQ+7xFNVC+orj8rDX6VBOPDxDP9yAUDhsuN87v/FrSNftJ2TK1wbIFV+aV2wJeknJEN6A4UBmNvzqaYjLy/s4WTh8R1BWjeqtfgR6RscGqpelXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355514; c=relaxed/simple;
	bh=rW6eweYjEhNfddmRprGQiSK1Ka0W7aGE0mUZqAQYMHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OY7l8jgE5I3oADHMotF+pVxt+gyeCp9EZWlxsCMVvZ+qKCEgJGzg2+EGcsXnDRKjfTZ3hsUBznckmF3LIXJck1TQi1h0Ixm4FA5hDqCKhYiYvG+LQ88jYZHSPqnQ3RLpfo0Eb8H1qFvc5+wAjn1A/AsaXrmuNmMt4ie/s9W3jPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZQRW4qh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455b00283a5so5258345e9.0;
        Thu, 24 Jul 2025 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355511; x=1753960311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTYbV4nxDsvnMsaeWUhKOQ7nhv5G6Dj9og0zlTLu+bM=;
        b=nZQRW4qhnSOMIOAN19ORRYMQUDmJnSw+IGVyQs7XoYfmJa61ZblGakL4QC5jNEnXvz
         M6J7+DrKOhoLSTySQC+KZzxaoXTVmCsiz459aXmYkxF65frHLMJD4lKAO15dbiGAOeE0
         NZ5NGqT+xRFmQn7X7x6b/g0t1W4wmn4Mc42W1pKAcEMQSdzVouN5SMYMORkOownsJVBN
         5+4tS7nfpxFH9nx9KXxiGu+5Wnne2tvAhaKX7myiqGORACt/sKNxxFfxXQyFy5eSWkpF
         zVvgnNhWuhx21gNMOr9HwxDIkEZydwUPIJ+HZXOPmCEhzP72BPIDUus4KL0M8pRsC5rj
         UwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355511; x=1753960311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTYbV4nxDsvnMsaeWUhKOQ7nhv5G6Dj9og0zlTLu+bM=;
        b=qBhCeS1OokrH5nBqO/9cFKx1WbGIBSGXQ+9i94cfVP5SaVTMvT5p/cPtqAwDWm1uNi
         Wp2uJTxSRNWxT6yN06xrhGg+gpsx3D9Ur5SmbtLeSodUV+cEMRMYgcqYs3aUtXr8TOjd
         xnutSdJlPis9K0G7vNwAY8bI6qcmRNFGHhd4xTJfdgNn9Xrs4NhvohcphYIrZHJcbO8h
         D0721HvZFINJgeN1F/mTJmzdUOcoQog74wtXf03p9JAeJOcDixcuwLHRcwoh8ikOWHVQ
         P/4kK9+DIwpEMFfAQAdnyUX9cIgUAF/6luT1GEbv8lr9SPRd7XU391hEYzPRI7QnB6Ga
         LtZA==
X-Forwarded-Encrypted: i=1; AJvYcCUazdnbHH48NvoNv8ReBX4d8PC2TJIvFhWbb3oMXKSdu05KKQ+IthaBuCz6SWxLO1Z6AqR+7zB6FuiCtQ==@vger.kernel.org, AJvYcCVdPW2m/Hkv32WoPX+5wG3uk+TE4zJHAng5zZ5p+r/WvC3nP8nFgnHGJX+DMKm5gRPi/nrK+6E/bnIEv7PQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjjqok0dzJewCNpdysisfUMc682tD2RsIyDbOOEasEZrwSj/a
	sfL88TIIpbssnO7WARZwk5DImeoxpJCGIeH4aD+s/48On4dXBU78/BXT
X-Gm-Gg: ASbGncsEJJuJ6S3xLh8+d0JZ/SYY+NWDoZyAmput1peHPYxZAGHD7CzT23fsQJMj1gS
	E4YLmdUofzReeFD/1X2M3da2FMbrQBWDhPOLoMU4Zc97UDHufXU1ZwLrtq1Sg+krfafupyACQs4
	BYGm4nUpa4FmEhvLNGY5aAxlrI00bmT0zmxZBuxqozvxSwImIa1v6wnpVbF+jd91QC1IOv67y3z
	dkw80Fb02Jz7R0DeSWTm21NUAqXNCfXkTShokdydFGUzMwHNz9636LIJY9JqX4VrKSxu0pn9i8D
	CpJfpOJrk0e3rkPSLsky+BR5NhjWQr4SlYeaRcViONM5nevO5eHdphM6CNCUXKhKZfbI8opsoGm
	eBLQsEbeOo0SzZeluMnkj
X-Google-Smtp-Source: AGHT+IHMwXOEmt/B+iD3qWA3UbigtYtOjMkSnVDF9plV1h01nJZP8fGi99c3B5hKHH66bYOCZTFXBw==
X-Received: by 2002:a05:600c:358c:b0:456:11db:2f1e with SMTP id 5b1f17b1804b1-45868ca7563mr60549065e9.15.1753355510864;
        Thu, 24 Jul 2025 04:11:50 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45870532b5asm16008315e9.5.2025.07.24.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:11:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: Kconfig: Fix spelling mistake "enthropy" -> "entropy"
Date: Thu, 24 Jul 2025 12:11:18 +0100
Message-ID: <20250724111118.141114-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in the HID_U2FZERO description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a57901203aeb..79997553d8f9 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1243,7 +1243,7 @@ config HID_U2FZERO
 
 	  U2F Zero supports custom commands for blinking the LED
 	  and getting data from the internal hardware RNG.
-	  The internal hardware can be used to feed the enthropy pool.
+	  The internal hardware can be used to feed the entropy pool.
 
 	  U2F Zero only supports blinking its LED, so this driver doesn't
 	  allow setting the brightness to anything but 1, which will
-- 
2.50.0


