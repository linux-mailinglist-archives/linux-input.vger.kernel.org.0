Return-Path: <linux-input+bounces-13345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0ADAF66F2
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1BF8521077
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0E019DF60;
	Thu,  3 Jul 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHFqoove"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7D188000;
	Thu,  3 Jul 2025 00:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503793; cv=none; b=Sqi1IYoI79JuHtEj+dh29kBcnVvznF34HPm7Ilkah3UXGeZO8Gd06kx7yZNa4obMY7qrQ3FOp032G4JI2YdYE/uBWrLnRlZliv/qRVgCO70xopEiRtxgrHijw5RWZgeJ6ccn3jfoKKTj4Cv1+hxQmVRyHQhL9rIqAycO8WMb1MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503793; c=relaxed/simple;
	bh=CexwO3jjShcKKFVHS1HjLtL54JBpgiYdT0DrQYZM9hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/HTZ8KYrzbfs5DSnn1wrQrH5vqGnGq74vmAFBc7hVrQoPdKqKBoEBiTfXtnB2tmTG9XOeD394gG+OJEdGkYp8hC7qVYblLQjuezBY/MxZ0+Sc6lQPbRt4jPqIWfFKWBxjHtbVjnlE8bmGedwqKTI4YK50QQGdFl+IpJI4Xdu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHFqoove; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74af4af04fdso350210b3a.1;
        Wed, 02 Jul 2025 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503791; x=1752108591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCqciUy+8vDjRXBMfFNrkzEgOLBYRKF32qXyyNEG31w=;
        b=ZHFqooveHPIX7LCH5EtjdmYADKa46oHlspYRAS/0Grd4E5aEvHD2bpHXFTdBuFJ+BX
         VlK/34HtVmZY5K6jtPlTXs8AeCH16Gt8wHXT5NyXrTrirnZWvb/jjn9PXLfhuGRZc+8e
         RJMLa6u/DfVtrMK27k+wM5vftn90b4u7EeUXfxO5ieAV7WcUXIaZY7mVkhrnrdbdOHuC
         f6CokLmMK8weSHEJos8epnkxcAbapeGx49vjyg6KX35lL9Rn1DGvI7B3WZItSBLfwbx7
         9TGK3hHCjgxR904JDXHIbNskGwDC6K5CkzpzMJsaker0Ge1YL0SN48TAAdXi12Gwh2qk
         bkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503791; x=1752108591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCqciUy+8vDjRXBMfFNrkzEgOLBYRKF32qXyyNEG31w=;
        b=cdCM3WypDgGSTCc46615rXZ9PKfLuXXh0w2qDFKq/WrUrhhgqG1xD1gkQaGBb8eU3i
         fHhyXF3jPE0BWaQYCLRdmA3LL8L8gXpyhTXAIYuzTiOFWl2JbUWiOu6grCPTpZ7RwX3W
         hE5P7dSyeLKautiNMN6LEGILm9cl1KeEuZM4VHqotLwPHE4iD5wTyG4M3rBg+XGNh51l
         ZMOZMo0H6jX4dkgMak38jwY34lRwcDkp+2ZYxDlKtVphCSFx4+mWKMQpCJwF9EcfFKwq
         x3CXVQ57k6nRVbVHx2gi/Xt7jpX/AYPYX7LvGe5SkrxGz/fbArNLiYQM+7etl/LJEtx9
         DB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX7mIfSOlaar6z3ggpjGEIpGEd5qlYziKWb2QwXJTj+bqY0PWMtdqmC5y2vzBg9XsHGgtz2iOPUBt2MNY=@vger.kernel.org, AJvYcCX/p7yk8QWWXUIBFKmGYeySve04UhWNGKQTfLdiGgOmsdKvXEQCOdQq75UAlNA/rixHq4k7QL3nq/k=@vger.kernel.org, AJvYcCXKUCFIdFgC/NUcS7xEgVz6yy0tQMpVQSbjyrWTUdIkDOtIvNsMEmjMD9ZMbN0GNteOmh0GpBxXah7dclBz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4zgaSuwAMLLV7fXgrom6CbTOHd0MdzkJOKjMe2EBwjj8ElYY
	X0OgH1zlM8qgMZ8HJvcmV9PAxSG9gAx0g+sePc/64OLEPYYxgCg3Y9zc
X-Gm-Gg: ASbGncuov8f/Yx/z81F/GSCl1gCTwSt4VpnEipslUe1vt0TNjAhyY1iVzojIgRIVAYO
	8Jo9kxFB/yrrAScs6obxaF1cLnnCsH8RDfqWJIqiyd5RhA6lt4cQoWxeQ+dfBspKi44XBsqVZxm
	Ovqid8XVMTbepRCPS0a+recN9OhXGhq3GxHQFf/0ymQFQ6XvtNgedcrLVxnJ4aGyAg5ABsMTDuq
	I8B43e3VanurN44UXgbSfoMApM4jiEW083gfAv9vGXlkeHwfGFK3TBAn1NNV9fn7FXZXNV2IJxX
	zCLL2//4ODjKqaL3i572RtJC7Z9fXWcXVedAcRlWLYBMkwejavkytDs0mAJfl6YhMWrccI3OXaB
	mO/9R11tSCrhSwfoMxlHSvMROp8Tor2cnu69lSATKCP9l9WIdpdg0
X-Google-Smtp-Source: AGHT+IHLaWkr+G/B/OUZFhAeunc6RSIFNUA4AcdMVW1xOasTg+uXX9AzKr1Elf9r+6aThccBYr6MRA==
X-Received: by 2002:a05:6a21:6d88:b0:21f:56d0:65dc with SMTP id adf61e73a8af0-2248857876dmr309323637.13.1751503791373;
        Wed, 02 Jul 2025 17:49:51 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:51 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] HID: Add Legion Go S ID's
Date: Wed,  2 Jul 2025 17:49:40 -0700
Message-ID: <20250703004943.515919-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703004943.515919-1-derekjohn.clark@gmail.com>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds QHE vendor ID for Legion Go S Controller
Adds xinput and dinput mode Product ID for Legion Go S controller

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-ids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8cdc789fbf2b..d6c096a20eaf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -716,6 +716,10 @@
 #define USB_DEVICE_ID_ITE8595		0x8595
 #define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
 
+#define USB_VENDOR_ID_QHE		0x1a86
+#define USB_DEVICE_ID_LENOVO_LEGION_GO_S_XINPUT 0xe310
+#define USB_DEVICE_ID_LENOVO_LEGION_GO_S_DINPUT 0xe311
+
 #define USB_VENDOR_ID_JABRA		0x0b0e
 #define USB_DEVICE_ID_JABRA_SPEAK_410	0x0412
 #define USB_DEVICE_ID_JABRA_SPEAK_510	0x0420
-- 
2.50.0


