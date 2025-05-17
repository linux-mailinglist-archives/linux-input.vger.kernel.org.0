Return-Path: <linux-input+bounces-12406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA10ABA98F
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89321B683C5
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 10:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464741F4701;
	Sat, 17 May 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6T1SZeF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC791EB5DA;
	Sat, 17 May 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479086; cv=none; b=m7l8M+b6pL0EGaC8KjxTH3oZXJGU+jj7rnp8otEdBvCLuogQenAiI8w/GsCEuR55yG8/mKcc0+O1X1fM4+RRS6DLjOUwUjUfx1pSwBXYXkHOOHE3hdmDACO1sIKZBkyrCKM1zXdFFfCAbZxCRUC1+c4iLe82+Pu7N57WgCZ3fHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479086; c=relaxed/simple;
	bh=sVTSPsIJlwCmeFjDLA+z4cC4FtUcDa7phRFH/OKZgZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKqi2X8WauCzQ7J7Dqmpt42l+LWeZ9A1cpwbcLDfzuozSPcYTP7FaSxFlo68ShkOIqk63ZZb1eRJz81xpGMLQIP2KEZaiAIRsu3lkWReRQ6ZF6UiV1xx7GH7o2DUZJTWe3EJCBIakzcDHt/pLslq5MVx1gW/Vo1lzTMxxT8rYhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6T1SZeF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742596d8b95so3926845b3a.1;
        Sat, 17 May 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747479084; x=1748083884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrH+/0zh76gWl7+bQ0KW7EveDpcmnKmu+gT90xMOik8=;
        b=V6T1SZeFJdzbl6Ot8ISBjZo749f9P/s5ELAmEPf/z9e40S3HE4Yk2aSHW3utXb8Ll0
         /HXWvPma0+Apia264CL0vRFb8Vur4EwT7j084VekiYDnJ7SjALO1xMuQBHtSzWX1DuvH
         1r/YtJUJu4McLqHRfZSp3kvt/ij4YX5N4BH2K54xlhOjjTNCHYuaJJ/afTBSzQ20H8a3
         BgNO7L/4OeOQgYh/Alh6rgkfNXiYNhJUznb23i+qshFAdUzuzCBh2kMN2tO8Heh+szko
         VFvwXC9lu4qr4WfN/V2O30dDz/6mDxMyiNbi/a3A91OSyDQU05ueyeLkkqgk04IK3TQZ
         BQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747479084; x=1748083884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrH+/0zh76gWl7+bQ0KW7EveDpcmnKmu+gT90xMOik8=;
        b=Nbh8q/4K980dvtce9gUvRQyjHaEGQZ7tLk3eOHFMUBGiXHoDJ+rnGFjXk22V/2EZmS
         MrfSsg3JZH+mjbWd8yZ7CglzydBJFmK6fmUwzEaHTvJIQZ7iPNwKN5ylnRdo0HXjvKn3
         cVVG652Z1/rVp3f8Yz7w2LyhfhKNxUj9ivmitPWKyRj7pflk1blOu22tvNw8gjkgtAhk
         Ii0iiihUiHvsS7xYTMO5HQ8KsdEDjdvLW0tlCah9ojVOCIJdtOqAHonR6CqjVbOj4Ze9
         f/c6lXOGdLZRfIQApT0o+63eIkhZXqS7xJR5nrF0m0+pY38OKV39l6/evEDVgdBYgDWP
         OrDw==
X-Forwarded-Encrypted: i=1; AJvYcCUfJihJId17Bc7tyWcTcMRpmjsY3UGadRQau9/yB8+2BuUHuMyX8a3U1jWn656BIt++C8gujIiDbOmZNLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGSe63oQQtq7AHeIQDr3ZQ8l7p3IzqQ9hYUdF8SrvufuwywbB
	nD1dTYXO0PnC0GfwnngBMD9vXpsj1fxIcDOQQCV/0FLMNL7I2jNmr04+ZmeZYg==
X-Gm-Gg: ASbGncv6ELZndraQRPj/2eAyF0hkQ7+NshaQ2+JdeQvlJlFRt4mIg9F0AuiGLh6UYFH
	eeB+ITA2Bk62d3XrmwmHXEOUQfx9VY3Ud4Lsj+lujlX3PUtUvS+Wm7KlHs53Uk2wOdoJHMIej2/
	ScgI1l+8UCaZZ4GuzpuIzdBGzCITtFfG56Ufu4r6bptuCdt5knZiY+eY8ot0YsdMvHYOm0kkyaO
	51Vx3N42fwLFAYFLM2HvURJcT8JWU7Le2IK0HNUYQbOvaTHswYngzmrK1wAX8J4sJNhB7qvgTmF
	NIbCU+twE8YvAr40u7xKbwHgQAuk7Rk4l5/4ojTw9HXNmwma6836ZZBMCyGfXi0CURFoMuEGp8T
	NsQH9+ZETPqytfTzoVJf9qPPo39RG
X-Google-Smtp-Source: AGHT+IEVvCjWbXwxbkoATZXQz1XxOgv9XLQtE3ceUhmV+zvE7DRGzD9VL3tz/5BmUyG8uqUwfiDncg==
X-Received: by 2002:a05:6a00:4606:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-742a98004abmr8502564b3a.10.1747479083865;
        Sat, 17 May 2025 03:51:23 -0700 (PDT)
Received: from aparle-thinkpad.lan (c-107-3-154-49.hsd1.ca.comcast.net. [107.3.154.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d5f0sm3051480b3a.56.2025.05.17.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 03:51:23 -0700 (PDT)
From: Apoorv Parle <apparle@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Apoorv Parle <apparle@gmail.com>
Subject: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
Date: Sat, 17 May 2025 03:50:44 -0700
Message-ID: <20250517105045.70998-1-apparle@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch adds a `disable_xboxone` module parameter to the xpad driver,
allowing users to prevent xpad from binding to Xbox One and Series X|S
devices (XTYPE_XBOXONE). This is especially useful for users who wish to
use the out-of-tree `xone` driver (https://github.com/dlundqvist/xone) .

Currently, there is no in-tree driver that supports Xbox wireless dongles;
the only option is the out-of-tree `xone` project which implements the GIP
protocol. The `xone` project itself, or similar functionality  cannot be
easily upstreamed due to the unclear legality of redistributing the
required Microsoft firmware. This patch lets users avoid device conflicts
and run both drivers side by side, without having to patch or fork xpad
(eg: https://github.com/medusalix/xpad-noone) for each kernel update.

Tested on kernel version 6.14.0 with both legacy Xbox 360 controllers
and a Microsoft Xbox Wireless Adapter Dongle + Xbox Controller Model 1914

Thanks for your consideration.

Best,
Apoorv Parle

Apoorv Parle (1):
  Input: xpad - add disable_xboxone module parameter

 drivers/input/joystick/xpad.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.48.1


