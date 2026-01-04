Return-Path: <linux-input+bounces-16783-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92855CF1574
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 22:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057BA30433C5
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 21:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF242F25F0;
	Sun,  4 Jan 2026 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaVQGtd2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617E62F0C7F
	for <linux-input@vger.kernel.org>; Sun,  4 Jan 2026 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562307; cv=none; b=mFWGt7c9uj0E34ph4F6UZ+UQHNqEGvJgRKJezXgZUEX4BOKgRwymo/Ao8oJNMexpgl3FlOp/+cfHEAg1eu8S8yihJsHcBI5fun87Za1Aw9z+haGjQE6DZMBGvWbiocyzOjQPFbjYAuEvdefmmmM7KUrw1MC5xqubn8hImTYP/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562307; c=relaxed/simple;
	bh=HhiXa9faNhgtAxR7thDLXdlpim1uuVVNkBce7yAbcqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGJBCJdOJVL1cozXNAShSiPFW7129y/GciNAU8/bDytkMa+7xmTZCDgsXEyx3ZmfDJWTfMkkUzo8KvJ7ZJrDaNHVVW9pIRUe38CL/II9/9OoxeQgIAerK6q2KvfE+BfTFHqL3lrwFRoh+m0s5wGRIbBZNQbIJp+gKM+etNEMFSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaVQGtd2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b830b385507so137824666b.1
        for <linux-input@vger.kernel.org>; Sun, 04 Jan 2026 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562300; x=1768167100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxrdR1+2a5RaFKpyNZz55u6IOBzBhsiBktK5vLyXD6I=;
        b=WaVQGtd2BvqD7vVbyF25Y76CcgG6y7jslzI9x3WGFsFRLZYKh3nA1u9NbrkpqfXaII
         qAkkR+fDkBpXoSXUk++eSLCnO02kLKsp9OnI30jhjCohPIlMEy44qqQFQcH/U+M1o6Yj
         pQim2cRP1ybmAXfG1NdEczQVfql5FT8sTLazSuTji2GPWZvMKSZNprXfYOzC/9dWTuy1
         8wyyTus5/IZInJMNLz16QJS6M3PyvQFVx9X6PCPFwo0sJ5k6FpheL3GWfm3mCx/6uzlH
         f6Kc79KFZ6U00vDR0pENmyhFmX4AK92QJFAim5Plf5fqd8iYsYIYAQBD9ZebQP/T/loG
         wuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562300; x=1768167100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CxrdR1+2a5RaFKpyNZz55u6IOBzBhsiBktK5vLyXD6I=;
        b=K9HnUmHz9fAcY48SakqsBRyrGjfuZZ3cI4FKWah4LLI3CAjID9BCPda0ZSUXa+AYX0
         jZFecpmpQro4kUKY/8Dd6fbAUUoH7QPYuuJItWHZcjKcJEyTlb3hD5L2s5FJkDCLYV34
         KQEmcAw9GiwPyr1/9oljpKln9Itr6rB4izEAXvLnDGAh4/6ZV78Hc7ULxwvXi1eKhEP/
         rCfSXDJ2azloFviTKjBnWahYjJbsj2n25GpA0D34mAGQiN+TVRu3p2+Ay4GA1ATTp4lm
         3ZqbH00+DvGxlh/AN4WFnUDrIQI/tjpnzzyjN0Y/T3Wew7hrMlkaHuPz/keykFw3xIZF
         PDjA==
X-Gm-Message-State: AOJu0YyCnxETfAuFUXAsOJy0Me23lRiF3JrsvmwhMxmVV9S2yWB7MV5T
	i8f1hP2je6i3BYLWDZvAj7chvUbmH3MkTuZh/0UPQs6dP2qA0Ifv4t7PIN0Q9A==
X-Gm-Gg: AY/fxX5SK/gw/muxypvoRmNm1QcdiD4QknaW/4QreUobB3ImjDjoB0kapudaw/q3Gkf
	NTHDgHuyXqQE9J20q6rOYpjH4J6Wq/26JLSFsuQwAn/+YKPWSTeVZsGVPh3H0nMNJRvKK2sjm/H
	DyqbiKujP0hwJwHv7yd/eNLTHxT1NBJ1fw77GDB4jPzcVgcCOvWy2fkOK+MM7QtZpC6KkyJNcCq
	8na1b29WeO7NMFLlhTqez6FY2fqWkR9NEmFOuiKgSY3ekY+YTbpVZVMsyL6w+c2D2UVzq4hppvv
	/e7ucQnvgwglvx81wSJDOi2IVjGf3zaKqfo+ReEjSIOK9RjHbUDFLAhoBwVuzK2jru17Bf0R6cD
	3Nygivm69qoeaTG+FKh+jA7LuFK0qrO8bDF1UTWDLe/XOT+m7KN4JhWEvJaWddDxkZDCuvDCVza
	AtWZ7Xzbdp/+NgDDm3QDL6gXFTtkh/PHTFCYcQ6L+uHLQujpRdgVK44gnj+w95T34Y
X-Google-Smtp-Source: AGHT+IFbT/17drCJTiC1SUmz0pBoy23cOQaM3ejZxbDW7YxU7ng/yG/cBTgBBPjbLDpAH8oMLhdjsw==
X-Received: by 2002:a05:6402:42c8:b0:64d:26a2:56af with SMTP id 4fb4d7f45d1cf-64d26a25be1mr25379531a12.0.1767562299676;
        Sun, 04 Jan 2026 13:31:39 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:39 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 6/6] Input: Add EVIOCGBTNCNT
Date: Sun,  4 Jan 2026 22:31:32 +0100
Message-ID: <20260104213132.163904-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow userspace to get the button count of input
devices. currently only used for Joysticks which
includes Simracing and Simflight hardware. Such
devices are always defined as generic joysticks.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/input/evdev.c      | 5 +++++
 include/uapi/linux/input.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 90ff6be85cf4..b90dc035c0b3 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1134,6 +1134,11 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 
 	case EVIOCSKEYCODE_V2:
 		return evdev_handle_set_keycode_v2(dev, p);
+
+	case EVIOCGBTNCNT:
+		if (copy_to_user(p, &dev->button_count, sizeof(unsigned int)))
+			return -EFAULT;
+		return 0;
 	}
 
 	size = _IOC_SIZE(cmd);
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 6aa703fcfcfb..3d1b17ebcdfc 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -174,6 +174,7 @@ struct input_mask {
 #define EVIOCGLED(len)		_IOC(_IOC_READ, 'E', 0x19, len)		/* get all LEDs */
 #define EVIOCGSND(len)		_IOC(_IOC_READ, 'E', 0x1a, len)		/* get all sounds status */
 #define EVIOCGSW(len)		_IOC(_IOC_READ, 'E', 0x1b, len)		/* get all switch states */
+#define EVIOCGBTNCNT		_IOR('E', 0x1c, unsigned int)		/* get button count */
 
 #define EVIOCGBIT(ev,len)	_IOC(_IOC_READ, 'E', 0x20 + (ev), len)	/* get event bits */
 #define EVIOCGABS(abs)		_IOR('E', 0x40 + (abs), struct input_absinfo)	/* get abs value/limits */
-- 
2.52.0


