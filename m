Return-Path: <linux-input+bounces-11256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B357A708AB
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355FF188F734
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6A1264A98;
	Tue, 25 Mar 2025 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jInHB4xd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221BF264616;
	Tue, 25 Mar 2025 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925717; cv=none; b=n0g1vkyWNbC8cngHT/a3IPxXr5Xl4S0ZKMQZwABzwXAsac1HGpGFlVrr07z/L9hkl+o8c3a99UC+W5zf1MkuMQpdkEt16EUsnjaqBYMYzGje0Jhiz5wz3EozS8h41FoOlq5FY1lf5wyWgZmcpulyWsBasfPhjx1J6uURxmIl3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925717; c=relaxed/simple;
	bh=EHwPX8gegZwSG3mNJuxoqQNkqfHpQY4vkEEEeYf2Qng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsWKZmSEbm9VQtdjxLYQua9d6YdooGXPEJwlqJRR5RGZtpe8tw8SxBoiauqQ+d6Mp9EYScHVBP8eMMaSDvqsNJZvTHFFxUEGK6060ogXbQ4P2gFRQn9m/drDxHELiXnlo3L69jPK8vfh6PPfrzWPAyUmuV355JyXPmpwDFO7goU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jInHB4xd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so10499119a91.2;
        Tue, 25 Mar 2025 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742925715; x=1743530515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMVgzXdkdM6NNu0I+cV+Xrb5YDpOIFrI7g0gJwXU5UE=;
        b=jInHB4xdxznjn034si9Oq8AqpTDJnwLAOXOfDXJQo1PsUbS4KmsfxWjNjS2D/ERSRS
         hik+I8IR0GuWanVhKSYYp5n93G5B2k/wz9iWAinmIbn1RHAV1AQ/F8QH3L2/SWG7tnYq
         AOZeMjgRqnuMkwTVCVTX3dzZMXroVQ+N1N3FtWbl7FKO/oqDoUJtbjVrefEWxnUICoux
         1755vEWJiiamiInJjwNXYMy0tgRDnSZSt4si5P7YJZrrHJXuf5+zgFaPr+C9xaRmhbjQ
         Pu96j+gfITMRTi7qnDw74OKDkS6xGdxg6y6EB5JKH+s1V+eso0qGygt/mDounrqcPWxX
         j6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925715; x=1743530515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMVgzXdkdM6NNu0I+cV+Xrb5YDpOIFrI7g0gJwXU5UE=;
        b=ecPPB5YgMnoSfgt9q13H/h3+0vu3PAabgoloZW5ZT+ue6QRD+AXz8A6XifGHdJxKZQ
         BbXMHWrERAapYKIy0CESzBW+Ie65k3fzHzWrdM3tfCcTP9tqNP4TBjqr29WuZQZnXXbX
         3QSd37YpFgKHDnctiVxV9nBn2NIwk6oThqFyozBnDjrpaS0lxyI2JMdMXNywk4GcHXgh
         YGfAYCoOv2inZ1EJ2t+HfFQkfxJ4KQ6ZpM93ypolCCjnyK5zupdoTYPj624D2/b7JPmK
         chvNgPucYb3gi7MaWsoqwJKi0Ub64QWULpNv8ALRyqSziyPFv5mAJ7JzP4QNtNkiFyXc
         iwNA==
X-Forwarded-Encrypted: i=1; AJvYcCU34DfmVooH1OjtDyINpC4hcwtj0z8o1lNKSh/O0DW/CL0qL+t1HyTybJDbcM3q21I+WE6OXeW92zXktQ==@vger.kernel.org, AJvYcCUK8AtO59kaxRj0fxSSIYriv/9h+7IXKwUpOBkfhFdiL6O1fgXyHc+7s3Kim8joEGnSslCrqiNMXhwj8L8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0rWHNGOlOqaJLTRsUOrICrKeawHBEQhDKUegj7vas10O2rJo
	YKA23H+g/uADjlE8rSgtWj2nhG/EARmbuHAePp2vK+9Wka0mi+Zk
X-Gm-Gg: ASbGncvNNcqAD6krSVRZmhltRyiNC7oI2SAaqSLQOkYK38qxjIuRdSpouDLJLNCL7Yz
	F1UcM6Y8GCcZoeoDcjUYUKKcsPLaPzGL6PqVSQhaFt7IWOUPhLWnPAQUkWbdEnDvEwMFuBpGVPp
	7ZhbgQHf4f0nB+MxF/w42Osvm1Zb7LtHz/8OXW4ndB60FWhXg9QWOkljO5AkZY4NaZQRBR8nJKW
	BMeHE4Nr7Y8I89SOLpgM0Kkqc+u00bJd92i06B5MBkZJv1ky/UoaVD9yrafYT+ODIaSV9IIvrlA
	npfK5xFz5pP0yu2HVQzW0MZZp6ylJZB0fp76e+igFC2zZWm8TDalsXasoY3y1mV6Y+T5Ff7KOyv
	Ar/N+9rcMkCDZK7IDCDC5W7d8SMThsy9O4PxjOWm6VHgr6Q==
X-Google-Smtp-Source: AGHT+IFKd6Jnz6ir9nbWCJnFTHJUId/NKgWvj+hIbjPzBq1/K+ru+EOBT29Sjr8gPoNsFh6ONcsDaA==
X-Received: by 2002:a17:90a:d008:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-3030fd4f5femr35717614a91.0.1742925714821;
        Tue, 25 Mar 2025 11:01:54 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm10683796a91.15.2025.03.25.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:01:54 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: gargaditya08@live.com,
	kekrby@gmail.com,
	orlandoch.dev@gmail.com,
	admin@kodeit.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] HID: multitouch: support getting the tip state from HID_DG_TOUCH fields in Apple Touch Bar
Date: Tue, 25 Mar 2025 17:57:25 +0000
Message-ID: <20250325180138.15113-3-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325180138.15113-1-gargaditya08@live.com>
References: <20250325180138.15113-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the tip state is contained in fields with the
HID_DG_TOUCH usage. This feature is gated by a quirk in order to
prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 6e7f34a47..70fdd8cf9 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -827,6 +827,17 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * One special case here is of the Apple Touch Bars.
+			 * In these devices, the tip state is contained in
+			 * fields with the HID_DG_TOUCH usage.
+			 * Let's just ignore this field for other devices.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return -1;
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application != HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -897,10 +908,6 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
-- 
2.49.0


