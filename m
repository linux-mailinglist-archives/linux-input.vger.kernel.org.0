Return-Path: <linux-input+bounces-7803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB5A9B7A89
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 13:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF24E1F21889
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 12:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB0A19B3DD;
	Thu, 31 Oct 2024 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7r+lORv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274FEA94F;
	Thu, 31 Oct 2024 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377888; cv=none; b=ga+48xFoqTOejDPlIFUpL+78TVvF3Mm65T+RZdfeV7flitghbtg1xgTulSnGBMxeoJAKc+dvmvJo04PBFU+gx70TP/zAnUcKybUwitA/byoMRSXw4xbqmnezohNDlMsnjQJH3Kh785hVvrL/ttG5AAS+slC13DpUw0otfXie6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377888; c=relaxed/simple;
	bh=7KQLhlTZZ/idjYbtmyqThGw1b34M97RpaZQusgDjnOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IK2am2u7tHSe3zJ+lVZf+9COQI2HgPH98If/OVM8Doo8pG8xc4GaGKMfWj1f9SE6PNQ4vYX0aMUo7nks6xjZ26eOhU8piR4j3KaiffUhDbvzwsONKrfa1WVa/XW0v9Q1n14FIfV/XVxDvSOdHNhUn4MXkaQaw5l1kwQ3t9YRyzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7r+lORv; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so1503520a12.0;
        Thu, 31 Oct 2024 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730377884; x=1730982684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNZ88FaZIO7aRSNkwkfEE/oge+Y1t62q8aDtRS3m5II=;
        b=X7r+lORv00gI/GXe0gGtsKKrPibC4KyLm4b8Dq8KCrSwuYYUs4ayPT51RDzlmHXMQB
         5M2T7uury9Z1Occjqp0eI4zc7BrCvRE5velVTpAK1v0R6Z2P7cQ1gQ1kKHOrmZ2qMXTN
         BXTL0LqChGNoTlq4qYttyqGfsSH4Xg6SJaVfLWdQhH091yxAepz0su4NmjS9U9up9bMW
         pa2mt9Bvfjy90BCDVa3G7Z3LQRpwnJLId745dNzBpdRQg1ojRsbx2Kz4hojo30Igof0Z
         lKWwbLOI/YkGxEj5C+IupD+Wq0UAh7Bdpx3zxR2mBwvORSw56Ci2b1JbiCpHHWDcuXDm
         6+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377884; x=1730982684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNZ88FaZIO7aRSNkwkfEE/oge+Y1t62q8aDtRS3m5II=;
        b=KZ05k46lBVdtBUbKt1IXbWAV6w3V83YCIy6BOd4RZEQgmjeMyFsD96Wfd0nEz/thJW
         WwYA8YG3+g97SONpQETXWqA1T2LDyVQ5dOarf56Lg+bw60dFpD8BM4EYHq2GcbF4Mg1Q
         u54m1QN4ElUU+r1z0ip7/t10B26V+j+1wF3qwQBnGzfTN1oHu9tbrhSWgwsn5FdnnwJr
         swQj7TRH3EBtaUsUjWE9RGYEu8gWo2gYpdyaVOdd/cvVK76A2rjWJHIu5A8Z2r0cpHdk
         q42+3yX4x5zwv5mYHH/xVEoO1iVoUPTH5AQhZQmFE34yqaPFzi3g8ei+LZqqHlpl3ftq
         94tg==
X-Forwarded-Encrypted: i=1; AJvYcCV9wzVpyeHAp82P3dpmRqfmAp+HXHpqkWOMTaynlMMpdclRyKJ1luq1rFPQj/g6msv6KS/VnT7XnQtpRboo@vger.kernel.org, AJvYcCWOt9aM04CRh6L418cgpHnWPsJjiSrAlZvua4b9JlkFnBa8xRmt0tqDlAHZUYpfhUPi9Tt8s5K3QkFYXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4X3OBxRmxgTi1B0zmFWfUx+hIsApQ5jjdkXv3pp8yVJaIqAd
	UN3sBwpCGY6jmf7AtYpPBDeaeT/FKhn6DLmHhtGLpKgoPpefOSM6
X-Google-Smtp-Source: AGHT+IGvpY8qdTKYRVzsPSnh+ugsYpMLtNlBkGUgnrxYFMgKulxPn8c8pIFSEXn1hXruoMW95u3Zgw==
X-Received: by 2002:a05:6402:440e:b0:5cb:6715:3498 with SMTP id 4fb4d7f45d1cf-5ceabee80f2mr2795812a12.3.1730377884039;
        Thu, 31 Oct 2024 05:31:24 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac77051csm526749a12.32.2024.10.31.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:31:23 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	hbarnor@chromium.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v2 0/2] HID: hid-goodix: Improve handling of HID feature reports
Date: Thu, 31 Oct 2024 20:31:11 +0800
Message-ID: <20241031123113.18843-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset introduces the following two changes:

1) Align with the i2c-hid driver by returning 0 instead of -EINVAL when
an empty response is received, ensuring that userspace programs utilizing
the hidraw node receive consistent return values.

2) Implement the hid get/set feature report function using a separate
address, rather than sharing an address with coordinate reporting, to
prevent feature events from being overwritten by coordinate events.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v2:
- Split the commit into two patches.

---
Charles Wang (2):
  HID: hid-goodix: Return 0 when receiving an empty HID feature package
  HID: hid-goodix: Fix HID get/set feature operation overwritten problem

 drivers/hid/hid-goodix-spi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.43.0


