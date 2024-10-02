Return-Path: <linux-input+bounces-7031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC198E47C
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 22:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D550B1C20DC4
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 20:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4727D216A0F;
	Wed,  2 Oct 2024 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY5dliT8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FCC1D278D;
	Wed,  2 Oct 2024 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727902604; cv=none; b=PafLJ+aDojiaSPdKmcyukqEcgQwBQtgigLNyW+xhSXqLV5aJgJ6wfRcvRWUrlULheMRRToEa6mCB/oOFTJc+oaHYuyS1cf0xMA9+vacWfKyiK+uE1Yf3Dx46oRlEJF3LH5GV85OclYB1lFbc3kXzWuQ3JqKWj51fkV4claEGT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727902604; c=relaxed/simple;
	bh=YqF9rMd1L+BXcR5UzXihniLBF4EXp//SaviYKNVZFi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h5XNd3aAmPnxdWRpUqwIPAq/wEEkI49VHj+F/H+X6baCFCLT0JUFGoH8JYbn8GkduchcI1+zZikE5f4A0sV3okkP8U+0P2uVmym59hnqnWokJ35YgfLxDf5/W3RSQ5udjzArNvt5LtP8NxGGAvCWFCYMVpvv6jplNft5tNLnZ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY5dliT8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37cc4e718ecso166566f8f.0;
        Wed, 02 Oct 2024 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727902601; x=1728507401; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zLNP/LU4y62sR3wFJIraQyhfupEuiyvOMNDUoYsNWU=;
        b=WY5dliT8yPXgPD04OqOhILtcB860HRu/aDxs9io1s//8P/RXOBuBH/nqwRoFE4ddGI
         Qr11LzJRi3KRvMcicJ6FWxcZpAlJAh5HeGsAaYe4qYskDKg46uRAxTobnv6brH3Lcl8D
         XX85aGYmAkoMdV0cFu4FF4Pz/D4cj2y2K3qWX8ByMfjuKHpS1iqDiiMlbmwB5BEbYAqr
         jJdpEmFmVtT8lqOhN/C91hF2c1nR2dDkOynTbXOLA+AA9i3Z2YjhIQ18PrEgnVQqyKr+
         LpCd2QbRwwZkx3UGKPiLoZt0RjiD1QQiLu7RmlIk8xj15l+2olSVIEOesqaHbTL6Ku0v
         25KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727902601; x=1728507401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zLNP/LU4y62sR3wFJIraQyhfupEuiyvOMNDUoYsNWU=;
        b=bJSmvgG1pPdowOiLNAdHJ8AvTwCIuvpNHBtkAP+0GYlssviN6jdG+xx/dXmvq7J5Ap
         EgihnX3FcWdRXBXXdT8ysPz5efubGkodflv9bfTEVVbKmlzqk1b45klTEOoTOzKN/iaI
         ajjo9X05Bx0Llzl7XUYHTdSTRnG6EiXDEIB+XxiVQVnEkCNjbpIQHJZfM3rf5Cg1NqW2
         uirO36mTaz7zMdYIRVZh9SdwOSlFmcC0+s9aLrw3TdeORLMWcKPqzHN16msGCpG5uooO
         5eOvDXS0IuiaGaqr3arEKJmYUeaw4Ivsx73ITgdv7rJb56VuABrfVh1CaUrDq5+M5vh3
         cC1A==
X-Forwarded-Encrypted: i=1; AJvYcCXGhGU2FtPxlpzjdN82s5dUaykcyZFqNSfMpMP5yGw1RHomERDlgLN/TR3gDKCq2rSh7lTKbXi6Sw2tppQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuvUtX5JXewnkQbyBDW1KWZKDlUg+6Nz9VLzXkzHPfokDKul7
	q4X/vMYdfqXCDQkF3tPTcENNTlplNK0haPjCGV8DxTU3UPgJOtnXKF4Y0w==
X-Google-Smtp-Source: AGHT+IHICZifS2rkkFLatB9kRYnZsEXJs8+bnqaznUZImApUwEMqM0TN6C2LlkrmIZcB89t8TVnxfA==
X-Received: by 2002:a5d:4451:0:b0:37c:cbca:fd7c with SMTP id ffacd0b85a97d-37cfba0a709mr2868964f8f.41.1727902600735;
        Wed, 02 Oct 2024 13:56:40 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-28a8-6b99-3729-0965.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:28a8:6b99:3729:965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730fc6sm14664345f8f.76.2024.10.02.13.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 13:56:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 02 Oct 2024 22:56:37 +0200
Subject: [PATCH] Input: hycon-hy46xx - add missing dependency on REGMAP_I2C
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-input-hycon-hy46xx-select-remap-i2c-v1-1-08f6e83b268a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAISz/WYC/x2NwQqDMBAFf0X23IW4lVT6K6WHEJ91ocaQaEkJ/
 ntDLwNzmamUkRSZ7l2lhI9m3UKT/tKRX1x4gXVqTmJk6I0R1hCPnZev30LjYEvhjDf8zgmri6z
 i+Wqtg4zzDZNQK8WEWcv/8nie5w+ZmxiddQAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727902599; l=1104;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=YqF9rMd1L+BXcR5UzXihniLBF4EXp//SaviYKNVZFi4=;
 b=/gLDbLgiI5d9mNjstkulqMYus9LmG6wGY4oXvkK4GmQmKa5BJzFsvTSYwibjj6IWWmP0+5OKO
 r3RXRPYtDsRCrZ4HrnaBh6a2uPvoewcHUoeHLQCoR8DMO2va9J3HJ4W
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

hideep makes use of regmap_i2c, and it has to be selected within its
Kconfig entry to compile successfully.

Fixes: aa2f62cf211a ("Input: add driver for the Hycon HY46XX touchpanel series")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Building this module will fail at least with gcc-12/13 and a simple
.config that does not include REGMAP.
---
 drivers/input/touchscreen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1ac26fc2e3eb..5157aaed25c7 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -431,6 +431,7 @@ config TOUCHSCREEN_HIDEEP
 config TOUCHSCREEN_HYCON_HY46XX
 	tristate "Hycon hy46xx touchscreen support"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  Say Y here if you have a touchscreen using Hycon hy46xx
 

---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20241002-input-hycon-hy46xx-select-remap-i2c-366ae28f7ed2

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


