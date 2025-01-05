Return-Path: <linux-input+bounces-8908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DCA01B96
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E48513A3217
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306071C5F21;
	Sun,  5 Jan 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz7vYiOr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA019DF5B
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105888; cv=none; b=GhfzGU+A5WCBb5yigiXa6kgpjbLY+6zoC5uAavH0DDS/3cFrwPMrsFee3Z5qt4VSlcIP4+AJIv3TGzO9okhCN+2DNFnol+ARfJ0CxXPmx4ioEpg5YtfJDacksj3j/La6OSCScqjQf1BesmLzOiuuYwBM0CzMr7ztp4LAmTAYKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105888; c=relaxed/simple;
	bh=+lLQvJps5oMf4z16C373JU40qWFN2vYrnyI+VpQHp60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDUGFhAx89u0wfskSEnC8EfYb8Sp2hX2RmdKDdT8jDMrQ+y60U/6uStxrF58WNdsEc1rXa5DARDvZi1OSv4/l9mhSoGtsxGqAnluov/c1iZuXKOEKQmwxpVTeOZwcHDLa1QuMjmGqC9BCk79GhGm4sV3k77X6ch9TWBHnEAOVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iz7vYiOr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862d6d5765so8053524f8f.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105885; x=1736710685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FZ18MjLjPJBNmz7/EHHELmBUMgyqAa0XfQis0G7OOU=;
        b=iz7vYiOrGRSnh8BA7/qBNMp600r0vKEg3jtLs3b66SKh//F560A00KjNNEc4eUo7fA
         P5c7IBAzTMVs2bMYm0SihqeGnL9Oy5w7TDgj2wBLWnXPtHa/W59HuqmD/Xz263BJWAN2
         bMj+fXuvGHfLI5NxUS63tLsrRiATWofMaTY6L9lg6OziJjc3T1NEo5v03HwM3Z7tH7Zk
         tEsX0xx+W1luM95TMdmQM+/7q/0ENR5HAjYf0rE1iQUZC/q1v36ka/+xDwweam/+gvTM
         mUjMeE3oBybwNXPsFIAywVyBEcXb5VJ8GfMK4144xWqxWxUbEzQkPv87PnpnxeB9fq7n
         5F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105885; x=1736710685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FZ18MjLjPJBNmz7/EHHELmBUMgyqAa0XfQis0G7OOU=;
        b=UT4gNfvR2CnJikfLdtkPk1rXYlA1rK2gbZphbbBGrbM6+Pk7am3lsQZszZQTzU/T2K
         l+LARwF4Xa6GxpmoFbAGEFe059N0iDw4VwJUNqM1GZhYqoPTvmpQ7rFYz9sCMBFcAQJk
         Hsfpeh/aK3XXwmjrtFm6BtMz0Ovi4Xb0veHfisaspNoQI/BbB3ZxXZnn7fjQRUSa4kVx
         oxVFL2nbFSPpI02K1o+Qi28eVOCTSEil4LLk8HF0+UCcmJUEfsaMq46mUrzF3bpIyvuU
         stxWgleE7K6tQj15w2jKA6yyTFl21YWm58qOC1syu+R3VVRz0oAGSV6GUiKTl+KbNuCF
         WSpw==
X-Gm-Message-State: AOJu0Yx5/T9ay4mbxJ01Pq0xAZDalg58nx7LNWWOM+KfTPXZurZFJC5E
	DAzkUfxPU8GSwb74KQdca3EB3dRZ+fWju5pTT9Qq2sDj6/LIXOI46OsZBXaNRmms1A==
X-Gm-Gg: ASbGncuO47D5/0HMwRORw4nQb7p3+JvM+eoit9r0JLjvbUgNbFcZ5auUMH/jhXJ0sEB
	AOcjnZqmvvVW4Al9t17G0vqxqoxmhQ/xE6o0mrsKbhZbDS+EVGFADM2eUag+2rfwB1I8DFSnRdn
	wRRbbgJNXT542ziVDsNOE7BIqHhA4fdozqjHkEad6VbxRWFL6YlAOZGgnFr0u0Fd9EV+AJPikT8
	4/e0gd8/zRWdU7uHAmja7EtYq1kF4GxbHilaTKV/s/G5XiXV0Hw3Xatqg61zPcksYSD
X-Google-Smtp-Source: AGHT+IGoZXaJlCVDNk22PYPyWkttSuSkVz4tD9jVbn292+2v2YndpM2vMkNeGW6k/BY2FaOwwMPMew==
X-Received: by 2002:a5d:6da4:0:b0:385:f5c4:b30d with SMTP id ffacd0b85a97d-38a223ffac3mr46822161f8f.39.1736105885002;
        Sun, 05 Jan 2025 11:38:05 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:04 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Jack Greiner <jack@emoss.org>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 03/13] Input: xpad - add support for wooting two he (arm)
Date: Sun,  5 Jan 2025 20:37:40 +0100
Message-ID: <20250105193750.91460-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Greiner <jack@emoss.org>

Signed-off-by: Jack Greiner <jack@emoss.org>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index f03e44c51efc..9b9ddf4aaac9 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -381,6 +381,7 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1220, "Wooting Two HE", 0, XTYPE_XBOX360 },
+	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
-- 
2.43.0


