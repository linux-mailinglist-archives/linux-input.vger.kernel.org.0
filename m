Return-Path: <linux-input+bounces-1603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D5845062
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 05:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC563B25C9B
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 04:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592532B9A9;
	Thu,  1 Feb 2024 04:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqpRevVU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27E1EEF8;
	Thu,  1 Feb 2024 04:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706762482; cv=none; b=L5DSgX5cwA6+Y6kfRuYxUWrdODQd3z2ZpFIsdTd1HACmaH6obPvKOYGjsGE9YZMj+cA+IdxlIRaQFykKB5GDlcCPuBcoODR/hh47bNmz/jxQNwqBv1ZV4htUpkosNCNC68s9Vg40D7HCyFOM+DuqpEwp5/Bbe7fjgYkgZtjztsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706762482; c=relaxed/simple;
	bh=MeFsnr70vuz/PQLuXUKqCe7KhvGM+4jAF1eW6TQijrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eXVl4C+KFde6/EfSUX7NMTsVmuszjmrCXFUU5xkVwL42uXyFyOco1lZyaF30RXNN8TqUTNHKss66PCAbkTUC9MCFrFIUxKOqasmfTMAKjvd2Zhp/RY9LGNrBaOkd88CR2MtMWtzGKkgqKvWIyQyMRhxmhw5B3Iep/THX+ddtGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqpRevVU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29593a27fcaso112946a91.1;
        Wed, 31 Jan 2024 20:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706762479; x=1707367279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGzsH9un+SuLT2jBVrNgYws9bKvscinpS1YvutaGoJE=;
        b=mqpRevVU3YQvFaG0yDsH4auyRgd80yCisqTzyv3ED6DHAKCD8xkTC9hdcqtvjxeYUV
         7qSrHHvriSb2U36wC0JbwjhqMnYZHe/+ugAAQpDLZKjFwgOV1NcS91kCs/3KkNmzL4B5
         jfcC+ADWyLFiCGx4VP2kBxQiY8MRaACi3ppl94I5XMyJmu4fRuMgNXbaT6VAjsMoje9M
         PoBwOAdwvxhUsrX1mAJoP5eQJ3ItWcnlSi2XjGCBhcVneXV+FWx8irWzsMyYvZHOUg5h
         lIBLuFh9F0q0V6Gh6AixI+Rqlh+Q4kHBu7hLDyuqr0FcAD9IjHTrUYnFCQJumm0qz4F8
         g2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706762479; x=1707367279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGzsH9un+SuLT2jBVrNgYws9bKvscinpS1YvutaGoJE=;
        b=I7rdKhf2Qy7LW3njSGKNDKLOQhOuy5cxQrddvy9uqNwAxIkTRB0hqNSlVOKjadLSUB
         cK1X9ezhyZBPcNVoFg20x7DCMhbbdUnMQ7WiS1o9AYxzevCJIxbJFXHnKIYMZLFbyj7o
         sjL2+B8d/RNsl7XvSLkkqy/EFalsL9fM5D3sFS5bBjRvuQzvJfknl9VJnOuU+ylGZB3x
         P4akXRiXypINdwfcW9feIhHbTQ0TMx0IA2a0ZJN7wMTKq7dTem+HqrkTBmVwpBW7EF0S
         4/bTD8oyZk4FkGwsp/sEKNWV0DXpurMHdCRAlnXQRvQVx/l/BeAB+75Yr1V59vV8U0hv
         EIdA==
X-Forwarded-Encrypted: i=0; AJvYcCUnoIJDplvLmSN4Shd6reQZEt9i+pjhgnV1dLcxSdMOH5olxUh3zQY8QKXm4SSzj1SuMVVWhx8w1tomUsboqHtCuqK9jwUv
X-Gm-Message-State: AOJu0Yy9lm39HC4YOZX5Zm/ZFJ0CSsz+0sdErB/sgKEAUUFYNI6Axdw2
	FB/lMXJF70Xyh0uEL9Gu6tusOueIzxfxEAWIQYjqH3PYqAgap8l9v37scpI0
X-Google-Smtp-Source: AGHT+IFmV+E4ua407EExdmy+760CbcVOfFqQaqMDJ29Yqcg7UdzF08CRUJ8TzSkiXbiimRQAeeTxAw==
X-Received: by 2002:a17:902:c18b:b0:1d8:dc04:2534 with SMTP id d11-20020a170902c18b00b001d8dc042534mr1614844pld.2.1706762479073;
        Wed, 31 Jan 2024 20:41:19 -0800 (PST)
Received: from Holt.corp.onewacom.com ([153.246.18.34])
        by smtp.gmail.com with ESMTPSA id m18-20020a170902db1200b001d8accb025fsm889908plx.197.2024.01.31.20.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 20:41:18 -0800 (PST)
From: "Tobita, Tatsunosuke" <tatsunosuke.wacom@gmail.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] HID: wacom: generic: Avoid reporting a serial of '0' to userspace
Date: Thu,  1 Feb 2024 13:40:55 +0900
Message-Id: <20240201044055.23367-1-tatsunosuke.wacom@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>

The xf86-input-wacom driver does not treat '0' as a valid serial
number and will drop any input report which contains an
MSC_SERIAL = 0 event. The kernel driver already takes care to
avoid sending any MSC_SERIAL event if the value of serial[0] == 0
(which is the case for devices that don't actually report a
serial number), but this is not quite sufficient.
Only the lower 32 bits of the serial get reported to userspace,
so if this portion of the serial is zero then there can still
be problems.

This commit allows the driver to report either the lower 32 bits
if they are non-zero or the upper 32 bits otherwise.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Fixes: f85c9dc678a5 ("HID: wacom: generic: Support tool ID and additional tool types")
CC: stable@vger.kernel.org # v4.10
---
 drivers/hid/wacom_wac.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index da8a01fedd39..fbe10fbc5769 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2575,7 +2575,14 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 				wacom_wac->hid_data.tipswitch);
 		input_report_key(input, wacom_wac->tool[0], sense);
 		if (wacom_wac->serial[0]) {
-			input_event(input, EV_MSC, MSC_SERIAL, wacom_wac->serial[0]);
+			/*
+			 * xf86-input-wacom does not accept a serial number
+			 * of '0'. Report the low 32 bits if possible, but
+			 * if they are zero, report the upper ones instead.
+			 */
+			__u32 serial_lo = wacom_wac->serial[0] & 0xFFFFFFFFu;
+			__u32 serial_hi = wacom_wac->serial[0] >> 32;
+			input_event(input, EV_MSC, MSC_SERIAL, (int)(serial_lo ? serial_lo : serial_hi));
 			input_report_abs(input, ABS_MISC, sense ? id : 0);
 		}
 
-- 
2.34.1


