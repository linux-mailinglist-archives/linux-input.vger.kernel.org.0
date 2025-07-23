Return-Path: <linux-input+bounces-13674-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DBB0F981
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 19:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EFB188F682
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 17:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E24022B8B6;
	Wed, 23 Jul 2025 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYa2s30/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA2227574;
	Wed, 23 Jul 2025 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292240; cv=none; b=HI06fMETzi2OuIL+alrV3DEoi6vKgrS2OdEL5TKuSU2gJZejTiZS4myFsCWzxMfz7nTThZtUpD1AuB/xcxcnlurSSjwWJQ7L3BhnBc0lfQT3JbOgfOU5c2OfhfWYBjr4HAd8IYWvCaJ8icZOH2HohBD9XI/DeR/YJUtjCzfLx8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292240; c=relaxed/simple;
	bh=rjZa4jQ92WzR1buCinsSPkKs46EphiG1VoHBWeHqJ44=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iAak2V2vyzJEp4/+dUaGq+SQ191n+RxPGWNeSS3dB1Az33rMEwQlPuw1xPZJXfkpFNiJcotdZsUhinJrAfa9x9CKDM0oYsdg+5JGekalVKK7umolxwC7SWUcLBqXXK4VxUS4xe3zSo9KS+sygNMUoMK7QgSS1hzEqPe/5n2ddVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYa2s30/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso68128f8f.1;
        Wed, 23 Jul 2025 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753292237; x=1753897037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlttEDH05prTNfq+ea0u2Drdfy6nVwhRi7cMSKNkO7o=;
        b=VYa2s30/Rw5ANj2emubxyZ8keO8oOeXO7NUgxNoFM7B9tHeuXvgs3yxzYwqrRJYYTc
         gqb65P6RAGE07uBWt2t43yZmoUpw+S/iQ/Fj62x660KjKzPLFCH/be4xRyxFkx2ZokDw
         KU1hrnBDBq4khkY87nhAVIDkKoH7T422wdsrEkI7I/PLBceVs1hcVxCvSHYKEmOanrY8
         bZbH78PkREYNBipz2WLOS6JRuVdK0QIUUOrgyIpXfpAxbar6PnSlK7PSSyHee95o6PX9
         f6umAdy2aNm/bbbm3RYGPv6GaldyjCsvsjiXh3mgd6h2UFYKdy7AiczW/R7BFHM1Sdaw
         AMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753292237; x=1753897037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlttEDH05prTNfq+ea0u2Drdfy6nVwhRi7cMSKNkO7o=;
        b=BFFQndrI9JgntwdOzR2RZsIEYCAqR66qPhGgh7wQwh/pMVHLIRdnRLH9znAuWkmuA5
         2Z5A06iEINiWJwSS9FrOrjM6LrrC1lLU4ebMUltFJ7HYqSrjjhAgPnUS+cWb+zXNEeUj
         4GudhLBQrXiM+ALCVFuztShdZD/i1vKUsbXpGWu5SeKx0XC+4eTt97daBcC9jNat0kNI
         o41Lgmu6WACbzaOnPJ8MuzFqKSmD4gYvSoT19lhHS8X4XSc51Jlnqfa5roR8dqqYyl2C
         u9gWY3ji1918aOIORoxhE73JnVZ3j81uuUW4t3XrN0PBqHz+qjcxpF2FMQWymfyUFekY
         BFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcedbS6gSRTEsHlfq6z/g02QqSxXMbkSG68BC2s/vdjI5GvduI3hh9AwT/PiN02gfB+n/zWsxat9YHCXE=@vger.kernel.org, AJvYcCVodC1j2Oi2FTDHfA3KobrlN7kvQ3hNl9MLCWSvhu5FUfe3P//OLDs6OKtRR6CWsBTC8LhU2JxS@vger.kernel.org
X-Gm-Message-State: AOJu0YyvfmfX39HlP10SFigF0Ub/JsvwWJV1U+Y8sSbIGlZyHvS3jHHE
	5xLz/F04Ce+hrXhUjsOPy2kgNNCtDVyF8dGhoMD95YcSvXP+yDpS38c0
X-Gm-Gg: ASbGnct04bODvj4OiU2AEuusMjZuq1fTvXVstmzBR4DDKhgUDIfRSXzyRAWYmZ1jgbv
	oe+EkVXRqXfp1jFNO6NQamzSyHnjxpWssVjUtCw6s9OiWewbSwExhxD3TBpl0X/Abd/G3sjcp/+
	KOgIW/dnMmCXPZxbv8Gsu9mYfhYEFUr+JgbmJ51v8LWAKbgCvCAf2OkXyWynyNbB1J75csJmT3k
	3imZszbLWVmC1BmKrhINUFQtOmSfgjLfsR/ZqzLEiVWLr8uoBmzjOGsJpPt7gEVFjuAIn8tUElB
	QKOS64nOyi7Zm3B9p01Ny7c+53U9Lh3aYixNBHpKWuCEyg4gbCbv0qQxwdhme+T+1jw5dnNR0yW
	jt9l4D/9J7lYODYCtRy0Ckg==
X-Google-Smtp-Source: AGHT+IE3KbWMQ5xYVuQes3e+Ej3tBCSlC2qdBRuaX0zaWpDwjxOX/Cd/Zs4snUJi1/joOzjnGEafCA==
X-Received: by 2002:a05:6000:1885:b0:3a4:f644:95f0 with SMTP id ffacd0b85a97d-3b768f165f7mr3434077f8f.54.1753292236917;
        Wed, 23 Jul 2025 10:37:16 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:24ed:b04c:5d6c:b1a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca487c1sm16953808f8f.41.2025.07.23.10.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 10:37:16 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: multitouch: fix integer overflow in set_abs()
Date: Wed, 23 Jul 2025 18:36:59 +0100
Message-Id: <20250723173659.59327-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible for a malicious HID device to trigger a signed integer
overflow (undefined behaviour) in set_abs() in the following expression
by supplying bogus logical maximum and minimum values:
	
	int fuzz = snratio ? (fmax - fmin) / snratio : 0;

For example, if the logical_maximum is INT_MAX and logical_minimum is -1
then (fmax - fmin) resolves to INT_MAX + 1, which does not fit in a 32-bit
signed int, so the subtraction overflows. Fix this by computing the 
difference in a 64 bit context.

Fixes: 5519cab477b6 ("HID: hid-multitouch: support for PixCir-based panels")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-multitouch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 22c6314a8843..687638ed6d0f 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -540,7 +540,8 @@ static void set_abs(struct input_dev *input, unsigned int code,
 {
 	int fmin = field->logical_minimum;
 	int fmax = field->logical_maximum;
-	int fuzz = snratio ? (fmax - fmin) / snratio : 0;
+	s64 diff = (s64)fmax - (s64)fmin;
+	int fuzz = snratio ? (int)div_s64(diff, snratio) : 0;
 	input_set_abs_params(input, code, fmin, fmax, fuzz, 0);
 	input_abs_set_res(input, code, hidinput_calc_abs_res(field, code));
 }
-- 
2.39.5


