Return-Path: <linux-input+bounces-14462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A892BB426B1
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B282681022
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4112C11C8;
	Wed,  3 Sep 2025 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp8TvpYx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3372C2C0F70;
	Wed,  3 Sep 2025 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916419; cv=none; b=D1Mhg6on9XpcjNfBkmWM/BLm1tMiJUQgunCau5mEVIHJ4mCn+yHNGtpsbnE5q7YkVFj9cXqmBvwYRdxLgAK42dKpBmsyMPJhwdE+7sadbKCienOjkc4GtLn0mf2NeTcIlhSWBB1J7nd0l47eHrjkLrE8IMQjX6O9vohcZFTp6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916419; c=relaxed/simple;
	bh=dl2nOFFb/a5zMY08CZjy/I1yk+iDSbR/E+p3gxjqqoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8HWA6QSh61aO86xTgYmURxe5VaCh3q3DTkrFnLFaddtKaQ0qVcjfTA0AVIINgomZn7J7N5NlWFqLhXJxK/TNXcRthhCbxUjKwa1mI6MBzEVmyq9ukd6NjB27zYSMlgUytIbdQ2JrCoZEO5imCxYFGxCvFoURzEdGTS2ytqpqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp8TvpYx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so4465312e87.2;
        Wed, 03 Sep 2025 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916415; x=1757521215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65PJuW44p4oH/01GemiAE392cNcj7Y0gnqZODRIm1pQ=;
        b=Kp8TvpYx9wtoKOE6zGuN+KtZ93HCu73myoFWr4q8fECYmvaZAOx7lVO0qDY1iBEl+4
         uOaboK3siPZiGGsc0yGv+JICygqWiZRO9URccEh9wZui6eDHAXItw+i08HMC+oVrpi8O
         HW0fiuoAvNcbvDJlqkcPsbnsQL5DmcetzkDsJrtrtYxRF0IkEEbydHBI+11YmmRX0UQC
         hAZZQezrKu9PBNsDFcVoATlw/AFz74R4b0MiCp73e5XagXloh7P6NzYV0SeqxOoLLGXk
         KUhjTSLXjL91cP92cFSMvHpgHzbxFgq3tKW4RSpsEe33MFekJge5UPBF3dt66h12KY2J
         nO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916415; x=1757521215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65PJuW44p4oH/01GemiAE392cNcj7Y0gnqZODRIm1pQ=;
        b=NqtIX2qtb9xt+BqcN+IB8QwLKF8CjmJT0/82xaUwIDNz4MJyAmNuvyNvNWdb+JNgnN
         F7TrGTuGWWBkUFo/1oLROGnEzX4tPs+hF6kbgQ0gLoa50PGzbphFPSDoivq3qFIm4ZA3
         Yi5zm5cf3oSdEADipI1809V5J0ex7Bv2jxzF42jFDp8paIO9HxrHP1hVgszIDR1ypJS9
         KXMKitRDW77loNO/GsDu0Fwn7SGq1JXwXEbKHUewCKfN+wKucccROoaPHeDVBodaiXGk
         RoO55VnsC28RBDG0YdVzRzXnngVIZTp9qLiCGRjbIywg1pIpQpdUvcprjxnHFlzueHms
         ZnCw==
X-Forwarded-Encrypted: i=1; AJvYcCUZAr0QkA2ajFxqQpGSE1yXZ+rpl6t1P/Kbs9p06SeNL1gIGD1495O+nje8oVaQSABETwoYTWn/6nlUECQ=@vger.kernel.org, AJvYcCWOW1a7aXI3iyIZOwvYJXkN49Zk/SQz/Klz7P5tppMMRVX+mR2VKP8+pCE7/QieoRK30aw/wzZT2N93xA==@vger.kernel.org, AJvYcCXy7xfOTuWgAl8Mfl7rjLo4anGap7lVHBZRht3b9pICjXCDojdto4I8eE3ccZIJtm/pL3Q5hWv0488J9LY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAsrK8wTaC1SpjTf+i6iUhzGHdLaovAe/CGb3X1I72jmxDi7M
	LJ2kA9sPu/bCmgUOjEf/YOtznvZx7INgnE1yM6Lu749QdRSJaNw4hFI6
X-Gm-Gg: ASbGncsjoq7gu9jFKMcrkDxtvlCRv90MxDmEIOEG0hCJwNJ6DXll3VT6eesUUPeDnFr
	JEXAFEJszECqtiMEtY4v5Ydo3VL2ixaagBYKWkxu7abz94qzu+rAYQmcdC9Re99PtLaIIgOWb/M
	CfHTAlyFaOb3Byv3MDP6bXFT/ZYPOWTFv2MercD9kMCO6A+HXPIlaSz/Tr8RkmUDQ+31xZxncNN
	vQ5LNLI43m3GH23/SJ9ww4+E5v6PqlNDsjjihxZOrnZHQ7E5LqONE8OyiMk79bxgwIwQuMfgTir
	3f43HAnSo+amD0HNP9poqfUMz+adZQ+iM9C7wVNEKSALGlgu/fn1MRS7dsIwhgWdEzMEv4rmj58
	zwHDu074bTHXwKg==
X-Google-Smtp-Source: AGHT+IHNMazv63ccAFnzsT1c7SBwVuj3XBDkbAUvLPcuZAW6OSdRk3O/Yhz21yr0VJMAV1HCQyNdvg==
X-Received: by 2002:a05:6512:448e:b0:55f:492d:f768 with SMTP id 2adb3069b0e04-55f7092bac2mr3983719e87.38.1756916414907;
        Wed, 03 Sep 2025 09:20:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad525d1sm598958e87.139.2025.09.03.09.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:20:14 -0700 (PDT)
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
Subject: [PATCH v1 2/2] ARM: tegra: p880: set correct touchscreen clipping
Date: Wed,  3 Sep 2025 19:19:46 +0300
Message-ID: <20250903161947.109328-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903161947.109328-1-clamor95@gmail.com>
References: <20250903161947.109328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Schwöbel <jonasschwoebel@yahoo.de>

Existing touchscreen clipping is too small and causes problems with
touchscreen accuracy.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 2f7754fd42a1..c6ef0a20c19f 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -108,8 +108,8 @@ sub-mic-ldo {
 	i2c@7000c400 {
 		touchscreen@20 {
 			rmi4-f11@11 {
-				syna,clip-x-high = <1110>;
-				syna,clip-y-high = <1973>;
+				syna,clip-x-high = <1440>;
+				syna,clip-y-high = <2560>;
 
 				touchscreen-inverted-y;
 			};
-- 
2.48.1


