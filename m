Return-Path: <linux-input+bounces-7617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD249AA13C
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 13:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C83CBB22245
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 11:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20BE19ADA4;
	Tue, 22 Oct 2024 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBaBTpjP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD3119AD73;
	Tue, 22 Oct 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597145; cv=none; b=RO/RzML06nqy5TbhsAgTZ4bzMQguASqKW/E8FmznypGfTnvF3ccPSuZ6flXtl2K1fEqGcSsZ1MNSdziv1WB3w8raxrB+Rj9UWWlBv5I+asqb5vJsDE2PaooHRW7NPBro5LTJbnsy6hviR+0TVYA3FTKC7wbeLQFyMrLVtHvrfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597145; c=relaxed/simple;
	bh=xsLOdvTIt+hKikDGyYUAdrz3/I92fSsEZ5rZ8b7IO1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+uPVBVTsWdUSxnquawf7DN+kVi7PVjr3EV3exrTNKHoaIDIF4g6GDkRYBEdfJINOmKQYSG4ZOMokU7++BvmWWNbwUjDxQpETIgy92lZ24sSBa9aM8rb/42Fjc2Gc6wOJFBgPHk3GwLr/UBxmWBF3J8H42xQYf03BRCBeZUQerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBaBTpjP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53a0c160b94so4024341e87.2;
        Tue, 22 Oct 2024 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729597142; x=1730201942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6fP1oVfvbBEWYTyzY/rcgPKAc7qrRN1SO5D1jI8RPY=;
        b=EBaBTpjPvOq7z3f+RNXUMw8+elYQ35bhVhPR7FNr2SrBg8TXBkgzhJ9urHO6kV51k4
         6rg/PiOekpvcfbNeEJ0o/wO/28nk5NtyqZ2MhPdirCKWgiXelM6V7uFEKquZyGancIEc
         vU5Pm8ud48kyAoEaHkdoQ+zpFbyhZEeC7I96eSFi/GKYDwdTUAzouMaamENsg6o6Ca+K
         73QHYfieY4T1uUUwAavHgaYUTWAJ4jwYQgR6pEnWeT41vEHuK9j4VWxw9+IhN/qptyE6
         4o9A/Ul0537dtV/agWANBcZbhlcakPwDDPJKheWWoVDkkJPLgk2NiQ/fLPe3lY/fs0jS
         P+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597142; x=1730201942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6fP1oVfvbBEWYTyzY/rcgPKAc7qrRN1SO5D1jI8RPY=;
        b=hVxsditpo5k2OTQl7bVBEW+Zv3DtA0dFVLyeMg7QXQDY0do66lOGUNQuQMWS2jIKIS
         Bk3QnnQw2KoiTdMYcFIcP4B4ZkXDleZf8UADqWf/opPGN+Def467iI5vC6X/zSpKjDlw
         zWqTxJyJ4IWKNpAzZT+8tlkJHc9yUQkaFNuPzULmgtTJtNGuOE9Xohk6gfMOwvLLFZyX
         4aXTqU5+3r/Xp9McSU8X1j4FVx9DYzX++0OVN2Np4CUKCiwq12MUESnZMWrC99dlPXQi
         SiAryjKIrLqT2I+DkVQgu1qWwTJDlmgUWrCHfNKnmW5mJKBi0a+xyKQRX3NTpzqtbKBZ
         wScg==
X-Forwarded-Encrypted: i=1; AJvYcCUUkflXXnhSY9mHtTQFkOBd8J1vI71v8xc0+nsV1ZEGuNCr0k7eMhVQQtU0tLvhhFA6BNF+kQ69v4O8bkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMUhcgyFYU6J/7VEf53qUYSVAk41zO77cj0As5WbH16hD3cnT
	v9KIgW+Qfln5chWYABoHQtuaieubrC0HuotTmrBcej265sfn6TWin4gAoludsQ0=
X-Google-Smtp-Source: AGHT+IEk2MXOmTku98IlZ0eH4/uCPAgeWFROOJZVqG6Jf5Mh3NEdqJ5RcvoNeqHSOu0JbKwfHKFhrQ==
X-Received: by 2002:a05:6512:6d1:b0:539:a2f5:2f1d with SMTP id 2adb3069b0e04-53a154afc13mr7199216e87.61.1729597141842;
        Tue, 22 Oct 2024 04:39:01 -0700 (PDT)
Received: from gi4n-KLVL-WXX9.. ([2a01:e11:5400:7400:850c:5867:abe5:b8c9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb675eb1bdsm2991006a12.10.2024.10.22.04.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 04:39:01 -0700 (PDT)
From: Gianfranco Trad <gianf.trad@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Trad <gianf.trad@gmail.com>
Subject: [PATCH] HID: core: fix inconsistent indenting hid_add_device
Date: Tue, 22 Oct 2024 13:38:30 +0200
Message-ID: <20241022113829.1423194-2-gianf.trad@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch reports an inconsistent indenting in hid_add_device() [1]. Fix it.

[1] hid/hid-core.c:2847 hid_add_device() warn: inconsistent indenting

Signed-off-by: Gianfranco Trad <gianf.trad@gmail.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 612ee6ddfc8d..8f08ca1ba92d 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2844,10 +2844,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.43.0


