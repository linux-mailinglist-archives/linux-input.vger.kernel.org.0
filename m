Return-Path: <linux-input+bounces-8943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86750A01DE9
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF3817A150E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4095F126BF9;
	Mon,  6 Jan 2025 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es2BcGcb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8037AD2F;
	Mon,  6 Jan 2025 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132181; cv=none; b=RjSAExogvNu92y+KM99nJnG6QNo6GbAOk9s0itlOEKitPnhAZ061epMn5ruwDiwoXrDh8r9+31HYMVV4LkZPjKjWuJsBRt3xPkVHHUNHtcf8/8x4/vtrYTqi6EgfkreNd483fDxsXtC440as7198rsWnLGUqrnTrZLGcwvHbxN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132181; c=relaxed/simple;
	bh=rpBIeGrtFicGgEwaWhyDf6fugJWawfadMS0pOjmPLDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTsmSN10ypzQp+3QIQCSNmwFFyohdOHaRSnftHARBJqlLo+hh95ebZoNwwJ0cRTXGiLz7r34ACCGGwADVF0WkvQbiZmYowLjnYcfg8YQLMGMiBiCPM83JXmgrHrbIOv4qQUsPsFwtXUZpudK9aeKPnNZt66UxPIOJnSifsF/0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es2BcGcb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2165cb60719so200351705ad.0;
        Sun, 05 Jan 2025 18:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736132179; x=1736736979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVCZUapiDc1okM858Ba0u93GxOAikwEZjP5GSF4lm1s=;
        b=es2BcGcbw2RkYTuyqAi06kLn3GAzQg6OFw6Xf5CJn1nIM596MMHpEd1xi3rlALTEYG
         mzw38Avb0miYgNonXJkpG1l9K1yMO0wOw0T+1M9+drspbrOtp4nfCuuOEePqo7pn/Mm6
         1PPsOZSFe17sbDjYoqK/pD2uESRr9Ri333Li7IDuWtSRU0WokI500/kwWF3DM667u9UZ
         fqEDk43GhDH2gub4RSrIHE4HRRqE+43WDNxG80b+TfznIsLSra4t14KC7wT/1cKkID5O
         9XepiHgCmYdVsFqjSFoYbsaobzkMCrmN7ObU2Fw0dF5C7vdCe2L+pmfZCTjG2aNMBmCr
         SOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132179; x=1736736979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVCZUapiDc1okM858Ba0u93GxOAikwEZjP5GSF4lm1s=;
        b=GbA5ke8ICBbqBEWI+SIDDkAJPfSJ45KRypRIjp9BrmHfNAYl1NJ4z7kmcxa7IPkdzj
         T9U5JXd/CV9tsTWlLgONxLPv11IGZCWUZfWxZTSdss8b69JOTOn5cJmIcES+9qMwsyuj
         wUODAvX7wvvIxuq4YEIi+Z8urNMFSdMZnV6OCDGzpEde+n9hBpklkvLiygB6vYKzSDe4
         frzxuCTD/yNu/RUKBtfaeI2ZtNJFjb9PtnKd7oZ5rluo8kmyBFShtbqu6OQrKnejF9KF
         Ehbn8PxUoR5DfBaz6cNr339QNwA4z49YUwajk71PRdQKG2kKhFNwkDnv7JEeg89fuayx
         9k/g==
X-Forwarded-Encrypted: i=1; AJvYcCUE3MQjF2wPWXih7ZpR86VeRcFcWOJ+K6BSd8Ht5ANsxcmvi95k8zBsxXp2ArdCQXrmD1awTlN7cBeIyI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13vA737sPTobPvdyJbznTv7l/saDUL1BHFJChmR6xEvKyPPdd
	hO6ELP1Z3cx2pTymW1fm476phRkozgZDwi01/wbm790/tdQYa/9bozUnZtPK
X-Gm-Gg: ASbGnct8O/U8LcA4tf3iCUl8sskFH704RBrebwjlirat+cnprM2gaq7/cNFcd6SSsl0
	jO6AJmVttljqkQ++MF4UNJCjN5Cra4TFss1F3OcnsaAEw3goSoEYB/AipeqXbRsd2UrG1XfSAYy
	JZsonf0uz7dkHG+s07fuNM2gRYKc//fuoopS5ezl1rgaAYp88VJHOZe89W8vCRJSmtn3sBilysn
	IdwMZSeco7i5V9h8kOtJ3fUzmIz1PL2PIXCBc5fCr8j5jcr10xBv5hq
X-Google-Smtp-Source: AGHT+IGt7yu+xfeIYV1YKgnBexAD9B8shmrceh64O/3UZvcW0C4KlO9IJuRymkiJlaCdvYYNY3hnAw==
X-Received: by 2002:a17:902:ceca:b0:215:83e1:99ff with SMTP id d9443c01a7336-219e6eb3a33mr677779395ad.27.1736132179134;
        Sun, 05 Jan 2025 18:56:19 -0800 (PST)
Received: from delphinus ([2405:6584:3840:2300:559:3e75:48aa:7782])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdee0sm281688455ad.119.2025.01.05.18.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 18:56:18 -0800 (PST)
From: Tamura Dai <kirinode0@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>
Subject: [PATCH] Input: pwm-beeper - add range check for parameter.
Date: Mon,  6 Jan 2025 11:55:28 +0900
Message-ID: <20250106025542.13555-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter "beeper-hz" range is defined in pwm-beeper.yaml,
so add range check.

Signed-off-by: Tamura Dai <kirinode0@gmail.com>
---
 drivers/input/misc/pwm-beeper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index 0e19e97d98ec..455054f9aae6 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -153,7 +153,7 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 	INIT_WORK(&beeper->work, pwm_beeper_work);
 
 	error = device_property_read_u32(dev, "beeper-hz", &bell_frequency);
-	if (error) {
+	if (error || (bell_frequency < 10) || (bell_frequency > 10000)) {
 		bell_frequency = 1000;
 		dev_dbg(dev,
 			"failed to parse 'beeper-hz' property, using default: %uHz\n",
-- 
2.45.2


