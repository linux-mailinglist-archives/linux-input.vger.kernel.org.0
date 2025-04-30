Return-Path: <linux-input+bounces-12085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA3AA52C5
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 19:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB1027B2EE1
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 17:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3407126B96E;
	Wed, 30 Apr 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCUwJAxA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB9C2676FE;
	Wed, 30 Apr 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034858; cv=none; b=idUUolNU3UYfYRjibP8olr9c8g3sgkfsNOk0Pez7zRDg+mOVdjsxIC+j2RUuBayxAJVAxJOQvjAEVn4mft7M9zZDIxRBqLPA5FiqA0I7HOkVEfRNOjt0BBQM5qf2jcvX61nQ6FACEuS2yldBRUeNAklvkPZ5DBzHs1N2xLSauQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034858; c=relaxed/simple;
	bh=BaaX9y7sdqFsQ9vMxmaduWzH/LZeXD15OZLrYVs4NWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WT9UEFwnmwGtRXR4KP922HjfhO8sKEDG7F+qNL5kpNpqoosl8CuO1VMjKAa33dOuDzEFgdliS6aYkQRylkAxEYfsuIq25pMAc8Sde8KSdBBiGXQCJEQ14J6cnLHOjtG/Ss53lNoWpzVabaBc+/ZOJ4SmFmeBD9h1stLHQQ1corM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCUwJAxA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c14016868so56762f8f.1;
        Wed, 30 Apr 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746034855; x=1746639655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcVsuF9nUCGZE3Db+V2hjbiOibndGT495jwZm7Ki9MI=;
        b=HCUwJAxAYNcMDsnROhcp+l0PjxE5X1ed+GRMR8WJVoFEyBm10e9zftpT7cgUtHAScu
         yr+vL43fjP+aMiRhp5cb498qg22cWA3v4yKb3WssufjqVNVsRDFz1Cfv7Iayq76SvMbW
         3ihwOsqvPbWFQ5JpfwJ2ScRi3NHzlIJIGg3B0D4kRinU17Ew27r/7OqAokFg09kRsabv
         hXAlO5SGbvplVoeHiWNm9MmRiLsDoGevAcX5GGANh2hmAxHy0SUgTEIP1C3HKH94taL9
         p+k2XtTieZIBe8aTgTIX/V0UXq00N00Dd1MwvEYy+D189uB+zk5lWR+dlymmI2jfcbnU
         AibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034855; x=1746639655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcVsuF9nUCGZE3Db+V2hjbiOibndGT495jwZm7Ki9MI=;
        b=GDAwJ0i4XljA4moIVZg7Pnn/0XaZ5szM1Xe01Inr7mtBEMALW1WAuLmjw65DZYEwxa
         rpIiv2g1AP3mcSYhUVqwnxiaK5gEF33DiLDNSjGQF1RIqQ0u+6MHQX6X2Fv0um7G52pj
         Gc/Gz5P38Z06TfEcH93CneNf8DJTk1p4Y578S46IU70WPyykdu/XJPmF0fvrKUA29H+m
         NjB50il4ilr/m46ICSeHealnSlINN5d0QrF4vUhS9l06/VXmO/LuSarHybpI8sBv4ZXi
         u/wXdwD648UybATWgm9vm/D5N2U66jTEwI2v9En678dD8NKrfQX3pkE0cTUzmIS+dg7u
         zl4w==
X-Forwarded-Encrypted: i=1; AJvYcCU17PHeaS2yBxDLCSr4kifO/I5LLzhHa5M5FM/iDpNO/wfb/AbIsBxxpjFCJD8/Csesg45L9EQRCnSUNQ==@vger.kernel.org, AJvYcCVOC9tU8tgbzY2iDLOtLD68u776/QcKCLPpQE+bBvbRVyehJXA14Ht5JobhMENOoUdku/8nGxDS3HbBZ9pm@vger.kernel.org, AJvYcCWC+BFJnUXvG/mzN5nEDZ2SZuMSZXRgHY05asZIvrISKyxImeRdiBs3T8rNkgf4UOAZjAuTFg5W@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ031MGp+QiebnS3xXePa/1JJyu/UuoiUfb/G/6fWezbWMT+ra
	CbN22E9A6MBVy45Vwc1iqofIDyvZSPZ6KzNMAcU6PmSQ5+8v3vz4TYTc/A==
X-Gm-Gg: ASbGncsJWcs80U33LXV8oOMeEE3GiD8FT117HiMhf7RD56AmrL8CztDAzOM7WzhMgeP
	LsL2+xwUECJROZCRsOXRTaZfJ6ljaejl8vtjlGhYUwIcmgqLS9419Ak+Ajj0mpEK+78Z65OfRcP
	JnQ1JNn+J3L5z7cL0HotvdQI+sbr98UL5UVFZrCP0HXXdpsnff5GczaDTBNiYhbwzJA4inYU1lN
	CSOSHUIvBhSheFY6aI1QHWLQ3prl2AeGUDkhvDDuDQIGD732z9TF2rkx4MLtyLg/2wdeDr5NLUh
	1ebq/9u7nl+yuTcjp+JhADuY3QKnw9Jd2ZWQ6NISPA==
X-Google-Smtp-Source: AGHT+IFq+T3yz8EYz9XMQlrpz/kFt3fq6FKTA6e9UmlyCTEfE5zJKIA3Un1ZJz2xbG0DfcSdEETVHw==
X-Received: by 2002:a5d:5f4e:0:b0:39f:91:43fd with SMTP id ffacd0b85a97d-3a08f764d88mr3277762f8f.22.1746034854713;
        Wed, 30 Apr 2025 10:40:54 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:7d1e:a9b9:e7a2:cc4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5473sm17765934f8f.31.2025.04.30.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:40:54 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] HID: wacom: fix kobject reference count leak
Date: Wed, 30 Apr 2025 18:39:11 +0100
Message-Id: <20250430173911.84705-4-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430173911.84705-1-qasdev00@gmail.com>
References: <20250430173911.84705-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When sysfs_create_files() fails in wacom_initialize_remotes() the error
is returned and the cleanup action will not have been registered yet.

As a result the kobject’s refcount is never dropped, so the
kobject can never be freed leading to a reference leak.

Fix this by calling kobject_put() before returning.

Fixes: 83e6b40e2de6 ("HID: wacom: EKR: have the wacom resources dynamically allocated")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 58cbd43a37e9..1257131b1e34 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2059,6 +2059,7 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 		hid_err(wacom->hdev,
 			"cannot create sysfs group err: %d\n", error);
 		kfifo_free(&remote->remote_fifo);
+		kobject_put(remote->remote_dir);
 		return error;
 	}
 
-- 
2.39.5


