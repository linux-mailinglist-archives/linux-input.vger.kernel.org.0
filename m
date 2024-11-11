Return-Path: <linux-input+bounces-8005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F89C3939
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 08:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5E9EB220BB
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 07:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ED3158DD8;
	Mon, 11 Nov 2024 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqScbDz2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADCF158D92;
	Mon, 11 Nov 2024 07:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311416; cv=none; b=mTS6qWx4natla2J2oUsYJmyWhe2x8zFINYP/NOUmo7gCIgNAHLwPdX9H7m748Wzan6geJwElAoGEOMr3t72Qbb/6vg+oVPQiyQItQFTVNvk8j067oIPurLA+Y09zB9bQ+odgrP6Q6/ji/vHfiF1XbZgvS/mFLiMeTG77qCpHPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311416; c=relaxed/simple;
	bh=7Cn/XdaMHS+AHzDFqT5z5iJbKfDVRAJHIJfY05cDulI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMD9jRRfqJs9ynGk/WLf7Jyc3DI/jx+9y5YM5iwfdoDsoeg+5k+cLFFocKCgOPNc7oRJUyIbbc+3zMOzpmAihtgad+B/tmi8OFCVD7HKM2N4gljUWNavAEudsFmkdjDmzx9FdB6uEY5ZEPjUmQ2y3FS2oHs/vMDaf2w4rw7AytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqScbDz2; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e31af47681so3419415a91.2;
        Sun, 10 Nov 2024 23:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731311414; x=1731916214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=joTcwleQpkQyXceG/F/JTSzVFm1DWd8QyFiijlq2Quc=;
        b=VqScbDz2amKL97zzl+EU4NSxB3crRMvn3eJUe81I6+Rt2+wqhfxO682dkeFLLHORzj
         0LVuymg5kpq0UYefvQuaHm1QzMM8VrEKjqVAq+tO03eEugkTFH+jKrvj5wkvIBg0Z7qi
         fRxzOFeJG9yCKeU+DLJj93p0PeF56/LsdqpaPoo8+O4z87w01Hdb3m85ytOrbbpVxbXM
         4hXVtj00xR7w3mwjOf8tc2obxCnSXy+1yWoGHaTbriKZQ5rm+ZsopIo4wbwOdm+IWTtx
         jXtPWF1TkoSus/szcVj8EBXspbB4rpMsJZEI1ttXO+6aHm/OhouHZPVe4mqDfwk2uOjI
         giSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311414; x=1731916214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joTcwleQpkQyXceG/F/JTSzVFm1DWd8QyFiijlq2Quc=;
        b=xBjBna5hobxiQLRaF+gnC/dSobuCEN7b4BiHmGPvf0PqWk+rcQ+etnJlrW3k19MwjR
         pn1Mkv4jy6XLlAVXgRiBQebv7puq0BPqCon1wDbT9bl9RKPT6MDsxop23z6A7AfEQ7eE
         yf/7G9ELyyhyL+W0Dp5ZQg8xDYqf0q6j4XflE13OJX8jZNDPy6EXXu39pS3SXkX6kEXX
         TOoxEY8mFdDB3o7o4e9rE0Mg1mXhmcNXjOBjaAoHbSmjytmxg5vOWptPRsnyk14ZTDxZ
         QRFzxrOqyYDCYRnisqJea5g0gSGgB/RPYh3fiUSCes/4TwJ9alS2O9mynYNekuRTA7vi
         3v8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbld3dvy5mmPVHUFJoXJXXO6vApx5buwTgBAtN2iLLII+vSDfKltOKLjATgMlvbRhtOfINgWAgWBHA9Ose@vger.kernel.org, AJvYcCUuOYNYrZx/Y6/15VT6uMWLOuWip3RwUozlzuE0YChr5OHfVvrCUf0qbOmjgagCnV2r2jZI450nnr6M1Os=@vger.kernel.org, AJvYcCVzNlKRVF2a6XraTCSGKgjx+1GfKXsmrXKur3iyjcfxadYJK0KRJvGPxiIjuJz9HWRdonMqnQLp7Zd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvMmcJr05DDU+0RJti1JdpG7qIupyOtSUrAx6y8Bq5/FvbXEd
	1MhnDQ4G+nGBo9VJ4TMdXLCZGwEDQXCqXieXKeArrgmeECPFJOTeMDpxp46FSXU=
X-Google-Smtp-Source: AGHT+IH0Y1RgC0lYdR8I8gsfbrydr1IY7PowqR4YaH1DSxfk5XLmqMyKVfv6aKa9UHLKtlyCoynPUw==
X-Received: by 2002:a17:90a:d886:b0:2e2:857e:fcfb with SMTP id 98e67ed59e1d1-2e9b16aabc9mr15674925a91.19.1731311414490;
        Sun, 10 Nov 2024 23:50:14 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb222sm8951522a91.52.2024.11.10.23.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 23:50:13 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: robh@kernel.org,
	krzk@kernel.org,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v4 0/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
Date: Mon, 11 Nov 2024 15:49:58 +0800
Message-ID: <20241111075000.111509-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Goodix GT7986U touch controller report touch data according to the
HID protocol through the SPI bus. However, it is incompatible with
Microsoft's HID-over-SPI protocol.

The patchset introduces the following two changes:
1) Add goodix,gt7986u-spifw.yaml.
2) Modify the driver to align with the device binding file.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v4:
- Fix dt build warnings.
- Modify the driver to align with the device binding file.

Changes in v3:
- Split the commit into two patches.

Changes in v2:
- Change compatible to 'goodix,gt7986u-spifw'.
- Remove 'goodix,hid-report-addr' property.
- Change additionalProperties to unevaluatedProperties.
- v1: https://lore.kernel.org/all/20241025114642.40793-2-charles.goodix@gmail.com/
---
Charles Wang (2):
  dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
  HID: hid-goodix: Add OF supports

 .../bindings/input/goodix,gt7986u-spifw.yaml  | 69 +++++++++++++++++++
 drivers/hid/hid-goodix-spi.c                  | 17 +++--
 2 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml

-- 
2.43.0


