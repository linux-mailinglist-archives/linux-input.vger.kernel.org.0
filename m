Return-Path: <linux-input+bounces-6631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD2097DBF4
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 09:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F658B21EAC
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 07:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917E91514E4;
	Sat, 21 Sep 2024 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZG1N5Eg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40013FD72;
	Sat, 21 Sep 2024 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726902911; cv=none; b=QKbB6m0GhrOqUhsLJuOLgtat7xQIRPbpdAQNBzowEnVkTIcOhMfBL7yrKckui6tz3B7MFlrzLuQkkp49LNb2nM/MqPF0zXPaZu8PjJEU3O3dSELGpxUJG72wJFRqLwSpZ1NNDTv68MYBTwzz7bzgD26hlR34taroFMC6JmxorSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726902911; c=relaxed/simple;
	bh=A9aZ1pDEWjhrwzI1D9nok18/5M0zezf9yFSENu9vS4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qIzkTm02Emlc6yKsaqkypEP4DZzW4c50ObCIpEW84UsgckJjfA3Tmop1/4qxnl3YOJ6kwlzK5Ip/7NOMyxMbDWNAtn51WEBWH9Gx6fN5gLKDciag/TDDbxefGRwUFStonRlZsOR8ldleyWXxrM11DLIGuEG7DSW2hgTvWL4yb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZG1N5Eg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7179802b8fcso2034042b3a.1;
        Sat, 21 Sep 2024 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726902909; x=1727507709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hP15esanx4mlQdiEO0iZwAA5X6yLs6EPKvS7/dkbXEM=;
        b=XZG1N5EgzeM9whRQtAwUHJtgnUdFHA5TqokKIMgY0Q6To65+5cGm/HDdk4oWRXJGuX
         4EdazSR2C3Ns/yoJBvlXtRQTufI4oiORsuaHuYITTArkvrQXlOxTFDXQS+3/5e5DaX8U
         tgsZe6cLx/TaG2R7Jh8kxt4B4LPxGtVwGatuoCMAuqAXEiMVL+rXPtLJUeqbOa6/II8S
         x4BWc18zN9vNvGUsfplfWGka0e1R4jsUmCcziXxEPofuRu3XlC59r30LBbnf8mabjKJx
         3zK2Wd8IaeK77Orbu3hQjHTWW3o26zYzqqjj0fpX+KajmUJQ7J7vjqJ4JooRMpL2yWEn
         oeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726902909; x=1727507709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP15esanx4mlQdiEO0iZwAA5X6yLs6EPKvS7/dkbXEM=;
        b=VIM3bZEo5fGznZP+3RjD/Ae5Iras2Q/hO99Z0sKaV1okaBVUOHOAr2LHF+RaAvUcid
         ejEbhaxJWpScaRlXnehjm4zudZNN4UcYI0BZeBGGVi5vjSbywmN84iCW0CIGfRJuX5KL
         kVZEK/nYOCC9jnxxUD8VSvscFzYcQEP6DLhADnBnkcnuw1PI0Gtla+VkWZC4LoCX1/fJ
         AlcToMBS6BCf2OdBCYGgbcKqxSvvTyW7A5WocuVu1M/PHtPU89RWcMup6Ta3Y2DFL+Qh
         kKpmu8TuDUTV/e0h9WbJB+lFv/Szx9W4aa8f9fMWTGCK8YHzScwfuxF24Tgwl6UhvuhE
         uKOA==
X-Forwarded-Encrypted: i=1; AJvYcCWFlruiCzWsuWK0eKZvpOypXx/orx2o1FsrTkIyf4S02tlI/fopzEpxaRN2fDuPPtYfQXRSj6dt5tXvBQ==@vger.kernel.org, AJvYcCX24HtqsXWotdiSwxWUNOGAaDnzGclYwdmlmOzxjY1SP2a0C1rol2OBCPGOe9voPctz9vLtAqcULoTsR8vH@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvylx2fSSz7qisZwqbguvebxlYTl3K4TsfgmkXKqLLQZppCqR
	O0HQBSPdRVYCxnJTdm5x9YtfjSAfAn+qmTGFs8H/xZnXTza2BuwUIjO4DMa5
X-Google-Smtp-Source: AGHT+IFQrgulzJHVU1M90TKVydYIx6Jk636cIyoKOkkuw+KBCirTxDsIL4p1INAhzU2/MdoUMAYF4w==
X-Received: by 2002:a05:6a00:21cf:b0:718:e162:7374 with SMTP id d2e1a72fcca58-7199c97b1c2mr7212878b3a.5.1726902909186;
        Sat, 21 Sep 2024 00:15:09 -0700 (PDT)
Received: from ubuntu.localdomain ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a98087sm10765103b3a.9.2024.09.21.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 00:15:08 -0700 (PDT)
From: Donglin Peng <dolinux.peng@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: javier.carrasco.cruz@gmail.com,
	kees@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donglin Peng <dolinux.peng@gmail.com>
Subject: [PATCH] Input: ims-pcu - fix a mutex usage error
Date: Sat, 21 Sep 2024 15:15:01 +0800
Message-Id: <20240921071501.263450-1-dolinux.peng@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mutex_lock_interruptible should be switched to scoped_cond_guard(mutex_intr, ...)
instead of scoped_cond_guard(mutex, ..).

Fixes: 703f12672e1f ("Input: ims-pcu - switch to using cleanup functions")
Signed-off-by: Donglin Peng <dolinux.peng@gmail.com>
---
 drivers/input/misc/ims-pcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index c086dadb45e3..058f3470b7ae 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -1067,7 +1067,7 @@ static ssize_t ims_pcu_attribute_store(struct device *dev,
 	if (data_len > attr->field_length)
 		return -EINVAL;
 
-	scoped_cond_guard(mutex, return -EINTR, &pcu->cmd_mutex) {
+	scoped_cond_guard(mutex_intr, return -EINTR, &pcu->cmd_mutex) {
 		memset(field, 0, attr->field_length);
 		memcpy(field, buf, data_len);
 
-- 
2.25.1


