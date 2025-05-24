Return-Path: <linux-input+bounces-12555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B455AC30CF
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5413A9E3B7C
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC31F2C58;
	Sat, 24 May 2025 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A88vs1tM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB31F1524;
	Sat, 24 May 2025 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108859; cv=none; b=ZPvdU66HKh+n0z8yXTdIu1Q82TYGnuQhcgyrQhUNvDZvLqM1rpfIrezd6u6IrrYwY7mwhUEeYPi24La6qmfPXrIgcsScqoRB7NIP470CCr1Zri6i7fp+i76BNZT1Fbl5HXOR+vfhEIq0qvdbMQ8hWDxuUW/fBAbM70CWRuiM21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108859; c=relaxed/simple;
	bh=pdMN3gqR0nCIKgprSTI96Tpw4rL9tEGYDnSQwpIkAkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3XgQp1RJkpaJyKBVXvT/ND4o31/QOnQLbxvGqzAv5gmYuw0sMUZXLrCm4HV00Vb85Uso0dNs7dxUnEH5QObP/jobSgDa5GHhvOrMf2MJvpzDL8vfCOFjrkucupcY86AuYtzVQArwWJg0GsNNRr9AAusJxLwfVUZSNMWhObhux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A88vs1tM; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-604593544aaso61306a12.3;
        Sat, 24 May 2025 10:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108856; x=1748713656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKujbtr43XBNO9BoXpBdJOV5AKCFi5xaNdnzF89noMU=;
        b=A88vs1tMAPIEKx4ysSliPkaQB4qnzVUloxXoDNMwlnnDRHyuD9RySXSLOo+VkfGqCe
         Vwssy+u3Hp58mfLmiQlC2KUfDDyA2Mtj6qWz7tqKejG/I1bW+JYO4FV3qTRMJN0dCE5I
         T6RcMmzRMIuqU6Mq1Jq82kNZUu0MCDUWIlUY/LRyV/KJi0PFmsPSmW4pGfmcpY4x8iw5
         uyOejDz6RgUbjPKpaeLGGtccoMvxRcntMKmXGl92RAeTZ7BfQWQ2SYvA6lCwaHiLfP3n
         OBFl8y83YkHkrfh1MpSKYTcs3U07lWazVExNrr6ZbW5FwPjR4pUGxlRtl9rvu/9z7vH4
         vaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108856; x=1748713656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKujbtr43XBNO9BoXpBdJOV5AKCFi5xaNdnzF89noMU=;
        b=ZewSnEsMVKibrfwx0HcExUqRdIiLIHLZGZA7xfDsiSmLUh+X/prp342o3LUGjL7s2Z
         0x7jBnjK9W/Bs6SWiDOPBi6WSAs6MCa3waA4cBhIS2N/RAiE7DgAD899VGNTKi207jNm
         RfBetghdf0JqhhGyaNCeO0d294bllW26R4Qdu3Ft8O1i8kMzIjs1I6yEg9wFvPrg6Gu0
         ZkFBPDeGOmVn7noTzCTy3f+NUzkJ5dRiT3a2ghRFrh4m1DhcM2nwKYV31AltM4arwwbz
         8srTWW1t8QhS+sEls4Zpq9T1UVp+UMfzCJTJaKzOzQKt+I6/VnukvoCWrUrR5bgtVl2l
         dCtA==
X-Forwarded-Encrypted: i=1; AJvYcCVPinuNczXsI6/g1ywpyLyjh+xQhAJlYddbVMLIWum3qszXNs0+u1yEf92SCAoQe/D1eQMDi6/e/4qN@vger.kernel.org, AJvYcCWJ3zrqb/eGzn3JKVrl2GzouvlJ/b7wh+/1SoTTIgdrxJhixEttiOl+jEyxy4MUtl/vcl3pvtdIMVW3AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgaLwQdjCIFg+SjSdWAe1XbvFSwdEacka+pTCMWP9HF5PbiRv
	1/+mpOQjjLDplMH3f4s/Lbvq+mdG8L237dzyV4lQURisnSl5kaX2Td96hqf6jA==
X-Gm-Gg: ASbGncu2NF9oukdXvY3wPZ1OyhAQrCRHEX6kq65iD00Su1N1VTk6Eea/M5HkUDGkul8
	2iutAwpTtUH3KjUnxrBrAJknnMfHbhaIcI5XmKTDYPysNyJtxH+15rxABSoc/MriaYTi1F7jWDF
	A55pRS4Mdimj4x0yXFYx7y3YCJKexHbbTc2sAJXeT8vGfU5NR2djUmcuKZHjOtYh4KGX+M5kqIQ
	PsrJHb4Jg3mqnkPsbRfEgQBfA392YxxZFmKMIY+q08+9DwPqVHD/oUAc4DA5izpElMawcf8cIFh
	dgAsyNJF7DuE+Q8j0tbY9n9j3S4k2kSjbxlXf7H2ruOHMHDrX7xT973aK6wCvGpTJw==
X-Google-Smtp-Source: AGHT+IGpa6QYVt9EWNRNfyzjpobBrZSmLOHQFNysUQM1IieI6c2Kn0jcCH9IG16WFAS+I68ohiObtg==
X-Received: by 2002:a05:6402:26c3:b0:601:abc4:1b44 with SMTP id 4fb4d7f45d1cf-602d9df6cedmr1033003a12.4.1748108855774;
        Sat, 24 May 2025 10:47:35 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:35 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 09/11] HID: pidff: Move trailing statements in pidff_rescale_signed()
Date: Sat, 24 May 2025 19:47:22 +0200
Message-ID: <20250524174724.1379440-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds newline before trailing if statements.
Fixes checkpatch.pl errors

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6f25490ce464..0e19d61f4936 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -227,8 +227,10 @@ static int pidff_rescale(int i, int max, struct hid_field *field)
  */
 static int pidff_rescale_signed(int i, struct hid_field *field)
 {
-	if (i > 0) return i * field->logical_maximum / S16_MAX;
-	if (i < 0) return i * field->logical_minimum / S16_MIN;
+	if (i > 0)
+		return i * field->logical_maximum / S16_MAX;
+	if (i < 0)
+		return i * field->logical_minimum / S16_MIN;
 	return 0;
 }
 
-- 
2.49.0


