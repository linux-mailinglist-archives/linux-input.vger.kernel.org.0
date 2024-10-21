Return-Path: <linux-input+bounces-7597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D09A912A
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 22:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7162C2833C2
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 20:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5708A1FCF53;
	Mon, 21 Oct 2024 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2HoDqgB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB141C8FDB;
	Mon, 21 Oct 2024 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542510; cv=none; b=CHnqMA0ldpGWIF2rireSdFkXZlridY5EIfVztyHWmx5b3+NmACzSsvcBG1SxuZcDutr1OqMBrADuONMYV118eCNlYgX9FSCwiJQ1WZfoJeoYeR9Gnxha5JOAQY6zfnK5I6pzrXaUPBD+ni6/F2YHahnlak9gOPfHkv+7VPvseFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542510; c=relaxed/simple;
	bh=1qMfZzt/NOP0BK2K2RoHBVzgF0yz/1K6FGAfAOL2CFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CdSqLcja/1IthmJjaYh+VEbrRnM73bbkZZtCwboQfNt9zNcmbl/F67ZDxNNeWCnBmXSyqf5HmZRo7tT9UyzBPeXFxl1dficDR8fH3AOFGYysFitd0jOgsKbUuYNDjQbacwtYqxARE6iPZ0S6u+4U1ea24gy6YD/BGibUB3/lGwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2HoDqgB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d462c91a9so3547336f8f.2;
        Mon, 21 Oct 2024 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542507; x=1730147307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5o7EeCdMvEzq7yRLdAkRH1iPr5pT3dVlwDWigc6fCw=;
        b=X2HoDqgBVsFskozFdakGb6T9/cznngKWebN9x5mg1JpJLAvYDWapT9qdzwuQHXKoUS
         cuoUnZpb7+Ld3v9uPhHMAjWvcIn5mJNBkEhHQj1UtfwYBzUu/IP+uc6Q37OtULm5j9XC
         IGV7RotJvim5u97rg3s8mgUvokj5QhbkKKjkbXZG8TB6W11/karE9WkKawjj7J7KQNP1
         meiZmP+NXxFgTFxSRmn/z9m708FJDNqGYylk+fkiBoi9gO5rOvZmkb8TzUMbylho4fhH
         7+JFtgYXmKFUXMlLBqrM9LUih1T40InxuAmy6BUE3D5SjsIo7xxmuovqgVawxn4yyYYR
         3Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542507; x=1730147307;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5o7EeCdMvEzq7yRLdAkRH1iPr5pT3dVlwDWigc6fCw=;
        b=k9/w0UOU2gwfdJH8jSBxFb07kHMtqDKQNDLUykXHGhoyc9C5iKsEcLO2PJLKZ7Bur8
         0yR5hJ9MVCfAMuCMcgqENXEZJ3sEztwmi5nQysX5H6ZOAavoZ0TOX2JnqrApApU+/FyN
         LtVQNEw/HpjAHfV3KPsIXqHl4DdgB5LZYkuwg9gbLkBAFtogevfiEM1molei/ixfRqI4
         mGLc67EgEJJ8HBFdb+LMp5eBtwqBTvHQpes5YU2zQ31lr5PQtJ8GxR8kAeEPkLBYDDPZ
         b/Yo5hX3QuXbYvpzlMdkG2p23N3LFzFj4B30xgtwu5lSGBY17lagkZDnVGrEvJlj1MMw
         9YLw==
X-Forwarded-Encrypted: i=1; AJvYcCUEGCqBdsts/DFzVW8myZqOWqog4huPVj1l/+ZtDSNuie5U+xtZIYRMIqNVrO3WlQboQDkj9sRoS2Z7NNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YycnM+PVz6+O73/hjjxruvuF/0XmUALt8IXN+oILk+adncEt2MT
	IjegebyXpW8dQCPiBprNMYdxnU+EeEscF2oT1py1b5kWDk53A4Ln
X-Google-Smtp-Source: AGHT+IHrlU3klozvzeCVSF9Ythhy9wGpMdSW2YhVNiW7ShV97wNTQiTfKFg7ugD/+MD3/YZLWARfDg==
X-Received: by 2002:a05:6000:dcb:b0:37d:46f4:35 with SMTP id ffacd0b85a97d-37ef0bf74b4mr689047f8f.45.1729542506871;
        Mon, 21 Oct 2024 13:28:26 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v3 0/2] input: automate of_node_put() calls for device_node
Date: Mon, 21 Oct 2024 22:28:22 +0200
Message-Id: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGa5FmcC/33NSwqDMBSF4a1Ixk1JohbTUfdRiuRxoxeqkUSlR
 dx7o3TgyOF/Bt9ZSISAEMk9W0iAGSP6PkV+yYhpVd8ARZuaCCYKzpik2A/TWKtp9J0aofau7r2
 FOo2UawXSlYYJK0kChgAOPzv+fKVuMY4+fPevmW/rn+XsjJ05ZRS0uQmeV0676tF0Ct9X4zuys
 bM4UOKcEpRTa8GUlS60lHCk1nX9AbPbcuQPAQAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=1269;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1qMfZzt/NOP0BK2K2RoHBVzgF0yz/1K6FGAfAOL2CFA=;
 b=2bwV68x9h4TkspBN1svwKfo8p5XoTWoZFgQB3pz8uj2Wwx1r5Q4ZIAmKXsmu57guPApCKi5ro
 8cjJGS1XCxfDuiQpm4fvUGJBQfGeRsbUpsQHbxMnvD5GJ/OwC90vYRD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The first patch of the series provides device managed memory, which
simplifies bbc_bee_probe() and removes the need for the goto
instructions That also prepares the function for the second patch where
the cleanup attribute is used for 'dp'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v3:
- Add patch to use device managed memory and simplify the code by
  dropping labels in bbc_beep_probe().
- Link to v2: https://lore.kernel.org/r/20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com

Changes in v2:
- rebase onto input/next, drop applied patches.
- sparcspkr: drop goto before node declaration and return -ENOMEM.
- Link to v1: https://lore.kernel.org/r/20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com

---
Javier Carrasco (2):
      Input: sparcspkr - use device managed memory for 'state'
      Input: sparcspkr - use cleanup facility for device_node

 drivers/input/misc/sparcspkr.c | 45 ++++++++++++++----------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)
---
base-commit: d0c3a7aa814c091843ccca467c02078db9da4e1e
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


