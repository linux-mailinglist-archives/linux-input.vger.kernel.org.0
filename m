Return-Path: <linux-input+bounces-14461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA76B426B0
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF945680F96
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1382C11C7;
	Wed,  3 Sep 2025 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M48yMNZW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413B92C029E;
	Wed,  3 Sep 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916419; cv=none; b=jd1SA8Q3cbxCo4IE0bkXUbg/ds9cP+BzBMqSOzd1Ac4PcnWxO9eLiWNhw3saswQOx33DYyViSmPPlDjYtUyvXxq8zJsmMm/taLYSZney6OgB6D7AdKSBvKt3t1oYbsWsPjjHiMTTYorX8QhBk8qlgA0CgF1u7Qww21SReWrtOlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916419; c=relaxed/simple;
	bh=IT7XX/KXkT1HqZbJmzJKpDMHwpjYUf7F3MV/udT0mms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rQGtjHiJh9V6CSDljM+OGLUPRGElT6BwLq5AlWbVHiiN2DSnQWc+PWIq/L1wkFSkP8mV8qCq+ENVPl3S8hdt+/OejgsufT5R8p5DFJaV7wrnryoBGSU1ngxMPOaTt7sJxMcuLOGzH0dCWFcCerxj6df1S7AuyR2TFn5CcE1mB7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M48yMNZW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f74c6d316so21168e87.0;
        Wed, 03 Sep 2025 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916413; x=1757521213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ia32PDYon+N7KOhiHAf697mFsMuVTlH9WwsgjZKpHc=;
        b=M48yMNZWngHpDWcyyK5Yzt53xS4Z0T/BKHdj2hozajhclf5VMQCCZitBkz4OJYsQiY
         QcaWLgPoAs2P1tv7vNg8p1kOk5lCQqpzNQWyjhsZZIGvrshLrP+v1yO1w0C70FGLOHsp
         XXwHnrr4SdBZyVSsq9/I82DDxs6NgAXIevzILfJo4lWrC9eGjg9eAw923ZMYq49deN1j
         uLCSh9WNL5U+HG/Dl+ZN443uR8lA3w9W5kALESTeFyMhwwcQ14HFHPnyo7HdWrNLdlWZ
         gEnD1xAqmpEu9CK7t7bQD4YY8zLwQ3gSxyOQHNCE6SitNT6tiP/mT68ofp+P7HqK1a0S
         DbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916413; x=1757521213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ia32PDYon+N7KOhiHAf697mFsMuVTlH9WwsgjZKpHc=;
        b=U8ZPqUGfMsfp4FYprCZA7j8DWOw1rVcy37LhTWyVPA7dooFXtkA3gbhlk9MwFmmSbC
         ZxDlL8kPJaH7BW0j0PkwMXtpzrZBvxanL4yQpVnhMTH3uNhzvSAL9azt8PT9M0xYR5xT
         j0Fjk2Jegf7RnFt5hWhSasLww91C1aY8mYDrbMt0dj4euhCrk0H8hz9cI9eSCXUwLZa7
         3wQK4+QuPWEXb7Umgc0acoDr057hdTXqYFBK+vdWSPCPFvKeagyc3MWhZ6dL3vU5+i01
         FVS7LrjOU7uYa9k3JKm+UxJ7bZSMfIPQNWiiB22/SkoP2hYdKkWOW9dvSTixgk3ue78T
         rsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4yt4ShkUdhtNiOsitZ+wU1A7+HF5GrrbVa2TjKrA4PzIAa0vzJA5y/HgNr1vxHi8Bwqy1ZgYSdNaNjaI=@vger.kernel.org, AJvYcCUGtIV+CC3r4aSDi0qdfuDVAMItlmX+ihgdNMpXDns91sHipfRs2NuXJp9/Knlvd2NhnmcMCGnAlU7fXNrX@vger.kernel.org, AJvYcCWrdOsobOQ/WPe1F55zgNbid4vPUWfV27Fyp4fJr7OPzwAtJAG07Ac2clcW5wnlKLXyftjHrSjHZSMOcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4QZh7jtBOnvOIhEYEiNWVPHYZqqOpJnPhvazteBb1o9aNnv3
	jCFFpP+n4BEM37vNxxvVTjmcj/1TDF9lGgjdrr+3yHF27dhSKb+x5QFy
X-Gm-Gg: ASbGncue+N9PSJN2dExHPWs9rEwRHUfIQL0MUx4+9e52Vpp3mbc2YfD1YBgqaNIuULt
	rqsrNDZMOjpeiwnXPCJejiUvIZ7rtDKTmBtl3LkraBXfxA6NJWnVT3nohKRfRd5lLwhnepIFmBm
	j6Icq5ezeyqOJvSLRuyH5Up1DEPHn7DvgeahQn2Viu5Tm/VVe0NCblpeySymyHQvacBV+7HFuKI
	T1VbZeb3BJZ15C85Q5A4SnXEL/h8qNOHcQsUBWCItQvfbfUMLp+ElQAf+0nM+9ThjJTYtlRNekN
	m648+jXETRixtwPwiY1jdI8+Oapy8WZFr3ttYaD5lVuzMa1yfkxDaa3VO/4IVO3UK+oXF8gLGBd
	yBFGNUxS0OHB70w==
X-Google-Smtp-Source: AGHT+IF1qqWV1HqK+5hXgget3pWBpjQppebplcsNALlA+3VzcjOfWHcIskHQ+RUKdti1t8/8MbhVgA==
X-Received: by 2002:a05:6512:3d11:b0:55f:49ab:884a with SMTP id 2adb3069b0e04-55f708b50e3mr4190622e87.21.1756916412912;
        Wed, 03 Sep 2025 09:20:12 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad525d1sm598958e87.139.2025.09.03.09.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:20:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v1 0/2] input: rmi4: fix RMI_2D clipping
Date: Wed,  3 Sep 2025 19:19:44 +0300
Message-ID: <20250903161947.109328-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The physical max_y value was overridden with a clip_y_max value. This
caused problems when inverting/flipping the screen. Further it messed up
calculation of resolution.

Jonas Schwöbel (2):
  input: rmi4: fix RMI_2D clipping
  ARM: tegra: p880: set correct touchscreen clipping

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 4 ++--
 drivers/input/rmi4/rmi_2d_sensor.c           | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.48.1


