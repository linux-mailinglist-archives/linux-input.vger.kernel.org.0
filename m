Return-Path: <linux-input+bounces-13824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C610B1BAE4
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 21:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FB993A5E4F
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 19:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3D726E70B;
	Tue,  5 Aug 2025 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKlw4x2m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7A729ACC2;
	Tue,  5 Aug 2025 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421684; cv=none; b=X7WT0e1DjfUa/ubHVgMOD9WYk//uoHA7Q/Mf3Ybvoxcxg2P04eWy8ESMvqwgpCK7aEbzxifpRXDF+IPkM0SIv0PMLBahj2WoCFsbRDkf6PpuICDGCm2+32xkIXozswD32b1/+1B/igJ724VOyruveUnhqdCwE9TnbNpcH8KOrmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421684; c=relaxed/simple;
	bh=dHwcTRSLdwMYfV+uodiBzuzbnJtX3UdI5Lfrz/H+TAE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOPqcYSkUYR8SG1M9sJD94LEh/qNAGjzDmJUAcs/qrLY8mc/Q4Y+o/nlkFO0Wq8enAil4ZujFwl0Z1j6ahAICLdDE0fUviC3UtntTcfE9MLt1SWoJ4gM5qWACp8lojIUt0myLEK6/Jm6/g8r4bO5xzvM+HsTO4c6PDJiUnCDjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKlw4x2m; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32e14ce168eso46654331fa.1;
        Tue, 05 Aug 2025 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421680; x=1755026480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sQ80esMoEHmM7lBZbtTbd0OmUR1HV3ixDauZ/q44yo=;
        b=UKlw4x2mAMi5NL16FIwSVxZnH0GPhD73GVT6j0kKX0MvBDVM4wdQHGMe4YnLebur+Z
         Fi7D5IuEWO/15TncNkALwt486Du4NJoXWLGdM/DVVc+ueaBXJfbeij6U23D1NAxjSs6h
         yN4UoB8hT+Mn5vqNGeMGp8FPpa9Kr/9aXIBXNzrnBZn9acfpYYekmYAJDaAMW2lCduop
         QFx1Fd4lQzodIqIJBzZA5afNHt5LWeqMGGWsrmPhSnlkJ/0M22D5q4WGg+ctSpgq/H5T
         s4xD0eEeIaIJAKSfiQFVxX/Q2vpR7JTBsF7yKjfzgEm8JAvmnwlfHGRxGX5EtU1Uqfoq
         5s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421680; x=1755026480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sQ80esMoEHmM7lBZbtTbd0OmUR1HV3ixDauZ/q44yo=;
        b=ItpVB3LwZ7B0muDCRo6sGRUp1L+TGq436Whpm0a7zrlxl/tM65nFrsVtn7Iv6412BI
         eno+Yl/eLlBAnniMpFJR/tKX2GTMAitZpwF9MZk5TxrA2wB2J2QLSRhVt8qf1PLR+htG
         vmNUzbe6XwvX4rwdVHhbdrmtqdPLmnxmu0FsC2rtHo0Ko/g5+3sN922eO5A5Rpwt23t2
         kn5XKSWMa3IGnnjYduRmMRqqbfXX7IrHJwbDR2dr7SQB7mkfvjRJHVku2k/eh6bMzZXT
         dJY95HaVO5/74KzOt3VARSqvSpnk09rOwfUnMLkpTphj60a0+eGIGSLCTt/fQ66U5kb5
         6haA==
X-Forwarded-Encrypted: i=1; AJvYcCU3hYM6+3D50YStKiyGL8OqN1DEx5bfbc9EfdvuXrV+5jvIep782RpcCHr8EgZbNqPu+EynYmPUTVCjlKJU@vger.kernel.org, AJvYcCUAVzTXwWBRtBjNy4aRKSlAoIFWYk4iYHrVEcI77BTz2WXJ0efnBCVlC1FFPTokaf6E8quLTB3YJ4tseQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwITfBHuRocN5Cma0bJnC/FdoCZ4PxflSzpqvoDUTPENqdQW3eg
	wzFTBIhao+Hqvd8Es/lEHx83Nx2lhC6Mfy+h+BoYGtyCggHkrS2Yluw=
X-Gm-Gg: ASbGncvV+7tJ/IYm0hrevNDRO68P6w6/rytFNHQLfcdj3jFnb946ILHnkt3hytjRGZM
	3ZHOqGgFu2cQmyGS5oi+h0Rmn49blcb9JM1MQD10zyVkxWfhY4mu/eTIXUt/qiFdh5QhC8Xscmv
	q+EQ3kvUYeOcUtSbVdzdO6jHXz0Lc5fVLB8+4BbF1nzAOSdHaW9urP5AXC7zeAL9AVP+1j/qktr
	bcFfB7atkYt4UA9WDaGeHxgMbJ6oyKAV6g5chUZkx4hRsZ6KlCdt9L1btvMYs/p2KMsK6C1ubXB
	HdL+ZSZ0s3Kw6QhLNFXeIpxxIh81nj/xT+2YAQjntf5aY2rdmiV10islzsjUyPmNjOCSKQYB7oq
	7OGVtXPm4Q5k=
X-Google-Smtp-Source: AGHT+IF5KUdQe2vAe2vtxlnpo+yaIUGNR5YbZkpVp8qSymB/IbWcNaoX87JDyP1S5hc3jfXSzKZTJg==
X-Received: by 2002:a2e:b4a6:0:b0:331:ebc6:7155 with SMTP id 38308e7fff4ca-332567b4ef8mr26849901fa.19.1754421680179;
        Tue, 05 Aug 2025 12:21:20 -0700 (PDT)
Received: from frylock.hermans.pl ([2001:9b1:dfa:6c00::f02])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-33262ac17casm10258271fa.82.2025.08.05.12.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:21:19 -0700 (PDT)
From: =?UTF-8?q?P=C3=A4r=20Eriksson?= <parherman@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vicki Pfau <vi@endrift.com>,
	Pavel Rojtberg <rojtberg@gmail.com>,
	Nilton Perim Neto <niltonperimneto@gmail.com>,
	=?UTF-8?q?P=C3=A4r=20Eriksson?= <parherman@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	"Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: xpad - Implement custom axis mapping for Ferrari 458 Spider
Date: Tue,  5 Aug 2025 21:20:30 +0200
Message-ID: <20250805192036.53918-4-parherman@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805192036.53918-1-parherman@gmail.com>
References: <20250805192036.53918-1-parherman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update xpadone_process_packet to handle steering and pedal data at
non-standard offsets for devices with MAP_FERRARI_458_CUSTOM_AXES.

Signed-off-by: Pär Eriksson <parherman@gmail.com>
---
 drivers/input/joystick/xpad.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index fdd70f256be7..252290424bbd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1135,17 +1135,23 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		input_report_key(dev, BTN_THUMBR, data[5] & BIT(7));
 
 		if (!(xpad->mapping & MAP_STICKS_TO_NULL)) {
-			/* left stick */
-			input_report_abs(dev, ABS_X,
-					(__s16) le16_to_cpup((__le16 *)(data + 10)));
-			input_report_abs(dev, ABS_Y,
-					~(__s16) le16_to_cpup((__le16 *)(data + 12)));
-
-			/* right stick */
-			input_report_abs(dev, ABS_RX,
-					(__s16) le16_to_cpup((__le16 *)(data + 14)));
-			input_report_abs(dev, ABS_RY,
-					~(__s16) le16_to_cpup((__le16 *)(data + 16)));
+			if (xpad->mapping & MAP_FERRARI_458_CUSTOM_AXES) {
+				/* steering wheel */
+				input_report_abs(dev, ABS_X,
+				((__u16) le16_to_cpup((__le16 *)(data + 6))) - S16_MAX);
+			} else {
+				/* left stick */
+				input_report_abs(dev, ABS_X,
+						(__s16) le16_to_cpup((__le16 *)(data + 10)));
+				input_report_abs(dev, ABS_Y,
+						~(__s16) le16_to_cpup((__le16 *)(data + 12)));
+
+				/* right stick */
+				input_report_abs(dev, ABS_RX,
+						(__s16) le16_to_cpup((__le16 *)(data + 14)));
+				input_report_abs(dev, ABS_RY,
+						~(__s16) le16_to_cpup((__le16 *)(data + 16)));
+			}
 		}
 
 		/* triggers left/right */
@@ -1154,6 +1160,11 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 					(__u16) le16_to_cpup((__le16 *)(data + 6)));
 			input_report_key(dev, BTN_TR2,
 					(__u16) le16_to_cpup((__le16 *)(data + 8)));
+		} else if (xpad->mapping & MAP_FERRARI_458_CUSTOM_AXES) {
+			input_report_abs(dev, ABS_Z,
+					(__u16) le16_to_cpup((__le16 *)(data + 10)));
+			input_report_abs(dev, ABS_RZ,
+					(__u16) le16_to_cpup((__le16 *)(data + 8)));
 		} else {
 			input_report_abs(dev, ABS_Z,
 					(__u16) le16_to_cpup((__le16 *)(data + 6)));
-- 
2.50.1


