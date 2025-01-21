Return-Path: <linux-input+bounces-9425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C443A185E2
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 21:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6970166BC7
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365AE1F238E;
	Tue, 21 Jan 2025 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5ouvrSy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CD71AF0DB;
	Tue, 21 Jan 2025 20:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737489632; cv=none; b=CibaLqlvVwQGHACKVSgZMg0JDzDLbXqjPxXEkuy5r9VMzKtl5jbmETUp9oeLkEyZGx47kzvCJmdtQIIRVslSERvWUreVJ8pV4ovVoQ7aiTmeaqzv+FzZImjQA+J8Ynil9qo0udGEZF2Ni8MEcnZvVualA4SeKuS8I8RVQ7HqsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737489632; c=relaxed/simple;
	bh=KqEbEpba0J+BpQ+PXXVhbs0Zk2qcq6ThRjO80ierK38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRfJKvPH/CU8batl1cEaFNH9BUmlsPF18J10xRfa1+iJdk9pn7mpzjcgnGFkMiWmUmSlQJn1e848AGlXBaRvWJDujgs5pBv9KMdL3XjOPLzW/5ZZ9HDX1u7odyP6vRHwjXdh2Fuw1X9IY33WpzkLwPFbNaWm3S1l9Q+RrqFy/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5ouvrSy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3522342f8f.1;
        Tue, 21 Jan 2025 12:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737489628; x=1738094428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZALqtn5/FhzKmTOnFOtV9udrUjeeTc7aEpECsGOGBus=;
        b=U5ouvrSy/iZu+RfvOQvPMpnjTg49nyxlrvG0aWYrUnMlpMMlfhipwKFpn9dzG3knnL
         Tiveyzb1vIlByuVpg3L8zBxMzs51nFoUodIfTrLTTx9ni6owAg1D1rF3ztsLKTchwfUD
         lM14tXL7JKsj/u/EefCsHsQWGo4HHORmDa7IQUkeBIoAeiOTKT7iTxb9KvYAa09PsGl2
         QUQ8CWk4lhKugxSVSyGr/qjATs/Iaf0vVbmCvwD/y6JdfLuQD0AFlmeSfg2OWMPvAUUt
         8SbnhGxZMf+aplFS9kLrMQaJg8q0U0iCftyqirngFdUD1Lf5ehMnqGkRm0oQ2VoKPhyJ
         GARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737489628; x=1738094428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZALqtn5/FhzKmTOnFOtV9udrUjeeTc7aEpECsGOGBus=;
        b=vPljwlQdmM/NXcdH4LNSaRVj4oTABt27Amexl6PmbzwAu2otbbylzResSrHWkKmQTF
         eSRpgSctRTgck9qBGIBIlopCMP65+fdSLyM+newjjGhnUHu8fixf047qfgyDwvaLxiD+
         ilorwU84evVgOucoeNfXt9dWwyPoId2zKnLA/O+Xkp/OPtxkEimpMFMnDOS1cME6Ia8L
         o5IJGPqaNk5ZwSLdps7KQsgyS8m5rY97xkM0t0GMHFCcE7VxoM4Y4r3V2PULYAGkiwJy
         A6u6h1BL0PdEF/TTQ71M9UXps5GIEpm9MBpvSEJhUB3Lc8zocgbynhY9ZzwrIc3TJTO2
         LdFQ==
X-Gm-Message-State: AOJu0Yw9PBD8L8wir0Z3xU+gNAFdedELNy2YFYF2t+NswqGZO1RbliIL
	LgRJNArDZQmYIMNUeS1CCl7qE9o9HkFZ+sZRYrmhV7x1YFVAqWbo9f+fBwe4
X-Gm-Gg: ASbGncsOSdcrPA6bR/tckY2gML74VLe2fP+T3QUypFtQj6zNK++bVit4sjVjI6Ohc+J
	5qmaGjLuPCuLuGxxwbBtGZyvZMGuEwBrToWSAN0pyXXhmT+83PZ1hmAXxJnesjsvI3tKS/K2910
	nvpKHovX4HV0LgKTTEzA4lXNhWIFZapL8kZJO/51HJJ+fYLfKaQhfyu/uIr694C0g58fezaFK8z
	ecY5h4BViSFqKO21n/ZdTLR58E1PPxSthji+PgZZHiW7v1uFdYDLzmU1MBgxuBZ8L2cS+D2JYnT
	hFZXCCURlaYWVBh40A==
X-Google-Smtp-Source: AGHT+IEbNJ5gH5JEVYEx1VRGNM2mZRXqkfYI2MGSE4gbjIPIawPc+s4zC6Njx/pCupGu46ZKsJz9NQ==
X-Received: by 2002:a05:6000:144b:b0:385:df43:223c with SMTP id ffacd0b85a97d-38bf565c029mr15585374f8f.13.1737489627830;
        Tue, 21 Jan 2025 12:00:27 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221761sm14118153f8f.22.2025.01.21.12.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 12:00:27 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	stuart.a.hayhurst@gmail.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	kangyan91@outlook.com
Subject: [PATCH v3 0/2] HID: corsair-void: Fix various memory issues
Date: Tue, 21 Jan 2025 20:00:06 +0000
Message-ID: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a use-after-free and a struct without an initialiser

Hopefully I got it right this time, sorry to everyone
that got some extra emails

---

Stuart Hayhurst (2):
  HID: corsair-void: Add missing delayed work cancel for headset status
  HID: corsair-void: Initialise memory for psy_cfg

 drivers/hid/hid-corsair-void.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.47.1


