Return-Path: <linux-input+bounces-5210-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C769415C4
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 17:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18450B25C74
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146081BA869;
	Tue, 30 Jul 2024 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw6lumzs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A441BA879
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354729; cv=none; b=bgobis41nTzo2G/KCF0iSCYOVTWltkInkQCA1dnXIehiYO8Y+BBSNadwQHvQcTpz2DCcezOHrK2JNbk+aaonYW5rFc2qzhtvAJr69zkK78d0iKtiX+QPtJevACX9MbhB5P7gyOxBBnDmqDJk6N9wrFAkCtpvpM+YNk+5tBZahDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354729; c=relaxed/simple;
	bh=31n1X/9lIbf+QGA+QLw85KXMy5B3Q3zT8UEtcF4M2ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdLOL37S5hXao/c53dD2wVdnECH1aZCTpWyQaBsdtzBt3YMi3/8G4HqtNoecZxNkmxjvAAZVDELaXFi+N55jH3s3WGv0TBC+xGjgpxNZKeaaD9c6X6n+TxVUK68cCUtQlxpRZvpKknYnkmFYNdFwdehjTQllzjyJPoi3Socx6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw6lumzs; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so3315273b3a.2
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722354726; x=1722959526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGjWryPa+E0i9O1vtsxMqVFVLNR1dXSU3MEx8xiuJFI=;
        b=Bw6lumzsFlUbrTAW5YH9vNK2j0/uhaodjBBbwuHUTzrhr4Com/dknI7ei7TXOvR9zw
         pvarCLVHjOp+ZWi3nEEo/4J2ASO3aykajG3D7y0e2gvFcNbqyolnubuCbZkQNa84zjEH
         AkNAwLZzmpfvMHNtFgi0Lja1pBMpWkqACuFwqepT/ntFKXZ5g47TJGyB3mbbLgWaEads
         mdMQqrvrzebgJlhFfvbH4X4YBCl0cqiyyusLltpk1AyyIS+EC1BdrTPZDOwYZcvviRJ8
         pOpQje0dN3kwInEHMQtnAbrh8eAHkVM+6vZ4FcXKFPvOS5MAWVze1sCct4m7cc4jPWqz
         BS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354726; x=1722959526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGjWryPa+E0i9O1vtsxMqVFVLNR1dXSU3MEx8xiuJFI=;
        b=LZiq3BX9uBZfnpLL/DI+ryuM2y60Zo1VB4TE/mqFA+hsY3CzeG28W3DNgpTmqpHt6X
         vTwwuIDtZpbpSnlg0yEPtGvTltXfcJX21kE9CI7YZ/x8wWaTair2XemTOEBXEFL2j1Dg
         aG8w/YB2BVjiepl0VGRVa3oYjR/xPPKpbSj0sZAp+AoG3sBoNTqYQDTQz5weIWG68wuy
         c1f9sgowRu8+aqYAM5yzij+RYh5j41AaMkzIVwg7QcMdVrE9URcAxHXzJXb0D0LSI3ae
         cjmWPnE6qSGXsMhYeiweJHnhc8j1KTw/4IXptbRsWT5d7oGpffSXtRuRS74QWDqrkMNw
         USnQ==
X-Gm-Message-State: AOJu0YxreM4JLdmz578Boy0UOtR2CiFj1XwGx5Qv1jjPIu91Uy5kEtD5
	E1bhGGaiaAPFQMWE1YDnbfI6pmxFB5bvN3Egf7TpVReXkjbAeU8oCR5gzw==
X-Google-Smtp-Source: AGHT+IE2laQGcCFLh1elKBueC5G5/T/V8Jp5tDHWnpPQHaz5yt977NdWKpobk1jAXi5Z6e63X3dspw==
X-Received: by 2002:a05:6a21:9994:b0:1c2:92a1:9320 with SMTP id adf61e73a8af0-1c4a1179205mr11364736637.7.1722354725803;
        Tue, 30 Jul 2024 08:52:05 -0700 (PDT)
Received: from localhost.localdomain (71-34-81-131.ptld.qwest.net. [71.34.81.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb7600054sm12788517a91.47.2024.07.30.08.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:52:05 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 2/5] HID: wacom: Improve warning for tablets falling back to default resolution
Date: Tue, 30 Jul 2024 08:51:56 -0700
Message-ID: <20240730155159.3156-2-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730155159.3156-1-jason.gerecke@wacom.com>
References: <20240730155159.3156-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

When we encounter a usage mapped to ABS_X or ABS_Y which has a calculated
resolution of 0, we want to warn the user of this before setting a default
value. The previous language used the word "usage" but then printed out the
value of a "code" instead. We can improve this.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 2541fa2e0fa3b..7e81c93d18229 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1906,8 +1906,8 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 		if ((code == ABS_X || code == ABS_Y) && !resolution) {
 			resolution = WACOM_INTUOS_RES;
 			hid_warn(input,
-				 "Wacom usage (%d) missing resolution \n",
-				 code);
+				 "Using default resolution for axis type 0x%x code 0x%x\n",
+				 type, code);
 		}
 		input_abs_set_res(input, code, resolution);
 		break;
-- 
2.45.2


