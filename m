Return-Path: <linux-input+bounces-792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B55813878
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 18:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48BBD1C20C5A
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 17:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279DA65EC2;
	Thu, 14 Dec 2023 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezfQ/+fZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623FB99
	for <linux-input@vger.kernel.org>; Thu, 14 Dec 2023 09:26:24 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d08a924fcfso79382725ad.2
        for <linux-input@vger.kernel.org>; Thu, 14 Dec 2023 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574784; x=1703179584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+Ka8wxIsA35NAcpj2VpTkHi729lxrpm9tFastxUpXM=;
        b=ezfQ/+fZg/1YYhBgu8d8YBhxtJ1MXg0pO29LQgiEPAoK2ma7OiDnnDgdlyqKYK8Gcf
         pTIWweyHeEC+OWQbIsUX1vrY18ptdx4Dps4YdozLmEXF821UtnFaFprRpy+OJWJO0xkM
         Xn1ADUtrDlmqxjSro6EKkZiHQ04/YPnaI8xQ5W1UiFOVYy+7Rq0fWgWXtqmXAbpFsscT
         EM35ariIddwoj4iskGNA3O5A32SWsrlZNHnPXF/D8UvGWEJlMactPOCtfhCRoVDnsf+r
         MJNLrTAxV8DjtgnPXjh8RUQuCYLB6FZkk1De61on6J83A1265yEUV3tc0emZlYFeZdos
         gVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574784; x=1703179584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+Ka8wxIsA35NAcpj2VpTkHi729lxrpm9tFastxUpXM=;
        b=R1pVgsbHtBUL7p3gA4USUe+oni01qiNKkMxmtIFFJkuYP6ndcQaNFsV3AgK49TvQDc
         CCvickEgBFPCiRZKKclaXC3wQOhmYMni8EYx3pFXjmqWTKeyAdJe3TPT0V2Ei7mGBgfa
         YlxDo7ArIHmPV6Qz36oX/G1B7bHAnEEdd8P1aPXL80I8tuR80hPFVTeWoyj8A7hHCJv3
         Befy2eFBK9Zg6lsOO35uD3mOHWvHzNakBt8ME3IDwLuLMCAuftIVzjZhlOM0vX5chowF
         Y00Oty9AF2lhX7FnHblWDLv2q+fPDXv2Cr5BLcnGiPA1SXiVyKY9NSUmUQkdLDc5ZKgv
         CRCQ==
X-Gm-Message-State: AOJu0YxV2zTTWerAIDdOWiq4kp0jQtEDysVVrPMkNMSu+uQJBRXrcLHo
	1pXV2UuPaUkpSRHJzqvBiJA=
X-Google-Smtp-Source: AGHT+IHph1vaHVKrOP37Hvn4W8QinnzVQ9xW4IJ0io8VW9WP+ukmvN0XRG+NZNUtxhpdWi9wmOYmog==
X-Received: by 2002:a17:90a:f0ce:b0:286:9cc1:a10 with SMTP id fa14-20020a17090af0ce00b002869cc10a10mr8036911pjb.8.1702574783701;
        Thu, 14 Dec 2023 09:26:23 -0800 (PST)
Received: from localhost.localdomain ([50.47.187.252])
        by smtp.gmail.com with ESMTPSA id p17-20020a170903249100b001cfbe348ca5sm12688645plw.187.2023.12.14.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:26:22 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: lkp@intel.com,
	linux-input@vger.kernel.org
Cc: jkosina@suse.com,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] HID: nintendo: fix initializer element is not constant error
Date: Thu, 14 Dec 2023 09:25:41 -0800
Message-Id: <20231214172541.48370-1-rymcclel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202312141227.C2h1IzfI-lkp@intel.com>
References: <202312141227.C2h1IzfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With gcc-7 builds, an error happens with the controller button values being
defined as const. Change to a define.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@intel.com/

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/hid-nintendo.c | 44 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 47af111ef3a2..2987083785f9 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -336,28 +336,28 @@ struct joycon_imu_cal {
  * All the controller's button values are stored in a u32.
  * They can be accessed with bitwise ANDs.
  */
-static const u32 JC_BTN_Y	= BIT(0);
-static const u32 JC_BTN_X	= BIT(1);
-static const u32 JC_BTN_B	= BIT(2);
-static const u32 JC_BTN_A	= BIT(3);
-static const u32 JC_BTN_SR_R	= BIT(4);
-static const u32 JC_BTN_SL_R	= BIT(5);
-static const u32 JC_BTN_R	= BIT(6);
-static const u32 JC_BTN_ZR	= BIT(7);
-static const u32 JC_BTN_MINUS	= BIT(8);
-static const u32 JC_BTN_PLUS	= BIT(9);
-static const u32 JC_BTN_RSTICK	= BIT(10);
-static const u32 JC_BTN_LSTICK	= BIT(11);
-static const u32 JC_BTN_HOME	= BIT(12);
-static const u32 JC_BTN_CAP	= BIT(13); /* capture button */
-static const u32 JC_BTN_DOWN	= BIT(16);
-static const u32 JC_BTN_UP	= BIT(17);
-static const u32 JC_BTN_RIGHT	= BIT(18);
-static const u32 JC_BTN_LEFT	= BIT(19);
-static const u32 JC_BTN_SR_L	= BIT(20);
-static const u32 JC_BTN_SL_L	= BIT(21);
-static const u32 JC_BTN_L	= BIT(22);
-static const u32 JC_BTN_ZL	= BIT(23);
+#define JC_BTN_Y	 BIT(0)
+#define JC_BTN_X	 BIT(1)
+#define JC_BTN_B	 BIT(2)
+#define JC_BTN_A	 BIT(3)
+#define JC_BTN_SR_R	 BIT(4)
+#define JC_BTN_SL_R	 BIT(5)
+#define JC_BTN_R	 BIT(6)
+#define JC_BTN_ZR	 BIT(7)
+#define JC_BTN_MINUS	 BIT(8)
+#define JC_BTN_PLUS	 BIT(9)
+#define JC_BTN_RSTICK	 BIT(10)
+#define JC_BTN_LSTICK	 BIT(11)
+#define JC_BTN_HOME	 BIT(12)
+#define JC_BTN_CAP	 BIT(13) /* capture button */
+#define JC_BTN_DOWN	 BIT(16)
+#define JC_BTN_UP	 BIT(17)
+#define JC_BTN_RIGHT	 BIT(18)
+#define JC_BTN_LEFT	 BIT(19)
+#define JC_BTN_SR_L	 BIT(20)
+#define JC_BTN_SL_L	 BIT(21)
+#define JC_BTN_L	 BIT(22)
+#define JC_BTN_ZL	 BIT(23)
 
 struct joycon_ctlr_button_mapping {
 	u32 code;
-- 
2.25.1


