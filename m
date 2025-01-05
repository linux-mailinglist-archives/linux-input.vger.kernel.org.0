Return-Path: <linux-input+bounces-8895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C03A01B7F
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD893A2EEE
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8E61C3F1C;
	Sun,  5 Jan 2025 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaafEpj3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB951448C7;
	Sun,  5 Jan 2025 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105797; cv=none; b=iqkwqFccMJPiRSt+magfPMnaJth0Y+3IcpKERNhzY3O1Q0GRn8Toc2IhqoIUXVl/ohTB6+w2VxKiRBlm7ZK/2XICfHujwhh+aQJGwphUXvdWi/S9PiJNV3irRaOF0Ftna5pTBQEs8J2mSb5OOWghrNZhLzjqa7oFeIKGanGlFYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105797; c=relaxed/simple;
	bh=60aSOMQx14zfMVGYITpU0cwL1JQM2IC1G8kgAFjv5ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u0yq8L/ACAfX3YjsGhYDXbp1mOg5tClJ5976UEWpYTXbdlu/7N+2LnUhQKygDlNuGsqbkx/5wTEaYKHng3fCeK5sssdxdmCwKvMkR1ZQn6wvIdWQEBtLNTTwSwAYHYTY4Q95cldI+evzCAgDMBO/gYiwc1krP1ObX/YZ2y2CZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaafEpj3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3023fcface6so12675431fa.3;
        Sun, 05 Jan 2025 11:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105793; x=1736710593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMTdGnyyJWXuH6aEDEPHe6IuTncIDqPC0Rg1e/KX1X8=;
        b=TaafEpj3JPlKI3RMoytAFmwyzRFWFGHTQVUxXWelhNP5S7b24rMAPuSVCFx5FdBnie
         90XOirIxhX/qkpgvbxzlO0mAI5803kVznri374I4/cUT+nfwHV/9weISTWxIMJHkqAII
         PECd2TGGj7Z1FcgAt15Y59LjnO3IOpf8J9BguB/kOLK7KqPEn9UG1vOZpKMzscmncbrj
         7udWAkRckTW5xrGZpx0aT2zbGr1aOCVC7cjqR5WojZP5flNNoUAcjF+Iq8xzuJ/3cFad
         wuVFsdfbIQ92rkFSgaShxRhFOdGw2NfjhvGPmqzIXHpYiDPbV4LJEBeLXdOyEhIMXD2z
         C92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105793; x=1736710593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMTdGnyyJWXuH6aEDEPHe6IuTncIDqPC0Rg1e/KX1X8=;
        b=pPCWUXRpsKRVCApamFzKi84tN1LX86jeUaafLep5hyuyL8E0PmzuhZMYHyLWdr1iJR
         i8p9zdwCFlcrGffKyuK/7rnZ80F/4NdQhq+f/snZ+udP0IDtHKIL5XTm+Pp6JU+WzvJr
         dTMq+j9D9Hf0OKwflE03PaEyR3vaJAw48Bi4f1S3pZtl7iZAe+ZAje7K7pxCC611dkeZ
         4ne1YAA1JOYcgOqxCtFDaAZLw3jkRS/mtaMLd15iXNxXmuNOFC8r7zpT+7s+58rH5ss0
         6+LbU5MlZZIgkMi5yRpM24qsPj6+zuFYG+4kGi/bOJ85ekS6gNf7yYAaoJUySiBbuQRT
         jsGw==
X-Forwarded-Encrypted: i=1; AJvYcCXC9odXEQt7pkxNrpGoyPY64KDKdMdS1CRxZ2+b+x9FVx9+84aN/plpaUKvdT8aUVuAAIfYQmFcnjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygRdVD9H7SYKmxZHjDqR3O0/N5C+DfMF1e30t7oV3m6RpztIr7
	NIvfC8hgvrqviFxxawyMCfFTXJRqg4NnV4WwtlBakyhAZrxBFJTYbQ9TsLTW
X-Gm-Gg: ASbGncv11bMzGNIzJUiXnl7kPrPDsVSU8hXmY9kq5CIp+Mc51OahHoEqtPRoAE63pq+
	VEe5PyfyhSX9ojcMIUO2Mqb88h1HKDed5dQfbAuNv8liO8Qq8W0XFcSuW4CweioMGg+2H8I47Mv
	sc4/HMb9aAsarK7DbmQa3UyFjA4TMuPGkVkzExk3tViQrK40psQZMqgjb24uqYZoQVATla2yCKC
	kFxmZRd5QgIPijvbNnMDDpHWDWVUkUyjyGUOoQ5Vz09H4Zvaczub6xYgIu6kc4uabKfY60zGMIT
	+ZlqvtysUme8T230VcbcHkBZw+E=
X-Google-Smtp-Source: AGHT+IG+DVR98QmICO5mM8uucpLXQQXC9jvaOzH9WpJVnCt+8tshCXqvwp9X2OGqUM+TIwVWXnKkYg==
X-Received: by 2002:a05:651c:1149:b0:302:2af9:f355 with SMTP id 38308e7fff4ca-304685f06cemr63586041fa.12.1736105793314;
        Sun, 05 Jan 2025 11:36:33 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:32 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 01/10] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Sun,  5 Jan 2025 20:36:19 +0100
Message-ID: <20250105193628.296350-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..3899d72a0b02 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -301,7 +301,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	// Convert infinite length from Linux API (0)
+	// to PID standard (NULL) if needed
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? 0xffff : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.47.1


