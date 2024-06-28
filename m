Return-Path: <linux-input+bounces-4717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E005A91C943
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB541C22284
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4324D8248C;
	Fri, 28 Jun 2024 22:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIO5DiGa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62957710F;
	Fri, 28 Jun 2024 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614860; cv=none; b=bKfgWvIv5YwcK/nhPVYQCdDuIEcrfCAt0/igWsEPTfrrWgVrnXcxIic6V3bFmFiIE+coh5H5UXwrfm062dmO2SX/Mz3BQI/5/4CaOt3fitqUhfwc9T9+0DlD2VsOoEImhCoctvqy5ebBJ3y3xtFsH0SslwkllN2z5WEYe/BTFpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614860; c=relaxed/simple;
	bh=Q4E71o09lIMNcgDY5btbMXU0Xfz4FaS1Bb48PBZdZgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aemBYvPBG1whUy0ASR4Adi6ajIRzPVTqHV3Z+QXD3lfTDLwFDDzj4ojhqfez/T8cfoo4vTTtlNFMnQ+cHNbwBeOOpezHCbJItfj3Nis5JiwursphC8Yr1yBir0aFfPuu0DD/hghxVDsb4vIzztiqidpuSPuxScWGq3D6gVGPDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIO5DiGa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c9015b075bso1644139a91.1;
        Fri, 28 Jun 2024 15:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719614858; x=1720219658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5A3XKf+a9Yvo+n5TD1I8PnKFpNkJknS2WF7vO0WiSw=;
        b=QIO5DiGauKkl46iDkO1AqP7mall1fsBP66swNrs47hZBDdXZHXhU+euaagNZnkUVGs
         NXE4UyYnPYg66s1hq8d3zie3hM9F6KdPdAAiqKysiCVdwmyzFQRfH5fcSMUKUmN/ZBCS
         HVV0Q5SjUvtoJqZk/IQPrr2w9kJkvH+Dm9C84dtGi2NMf2lXlf8KoNgOLriqFqQgcusb
         GNnIxyd4DWl8yxlntuClhm1szwcCyfZgs2g45UdTTDi01sC9hrtMUWKz83zvcYIKOSW2
         uyt++sMR3ohqNn9GB3AzbIm51KScjmuuIza260dfqjVvsBnpYEkxY/5NYwsMY3BoOsXp
         EGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614858; x=1720219658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5A3XKf+a9Yvo+n5TD1I8PnKFpNkJknS2WF7vO0WiSw=;
        b=IilIZR8fRTcwAcOdtcPazXOSu29knhISaV1bAHKwTEY0DmOUgIHFfoUfHd/VRVwGfT
         82wqAl0PTsBmzHvMoEkDkEtrE/RKj4JCHbYW/yqlY/bniW6C1Mv+mVZ8adr4gzkGdJ3a
         2Lc/PGIsi8qwYSPQIPtTPVKii52Xa1a6vWs4tQ5unF2zUUtXGqCH5UxUZ9A1NxuH6SJZ
         cKGt7TruZHp6K9QFhrO8lqqQ50ViRTQEvWD10GKltqGx9cKFLXOWIw77LNSg0DKQv3pZ
         Gi50Vq0vBsMs7HNP7DRNFNwvoKBb0HTWLuiKDwPuNXziblCf2IUnP5NvEo8J9Nqda/zF
         bVDQ==
X-Gm-Message-State: AOJu0YyEUvWzGUm4tmw09esD6DUnQXiPgdNRHgTPGQp028mzigkzwAQ+
	5mJjtQa9haHVTTH1oXXhCIhTWLpF2HpsFQg1ldfAVZ8RyKLnOQR1s7pTwQ==
X-Google-Smtp-Source: AGHT+IHOU7PhTa7Pp6yBxsRL5SMJ4peVWAbU2vg1Kj8MDnvjlz+jvWb0UrrqgPfKoz0LV4CTpQI5BQ==
X-Received: by 2002:a17:90a:9af:b0:2c8:da9e:6f63 with SMTP id 98e67ed59e1d1-2c92803af4bmr4521630a91.23.1719614857822;
        Fri, 28 Jun 2024 15:47:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce58877sm2187163a91.24.2024.06.28.15.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:47:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Input: cypress_ps2 - report timeouts when reading command status
Date: Fri, 28 Jun 2024 15:47:25 -0700
Message-ID: <20240628224728.2180126-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628224728.2180126-1-dmitry.torokhov@gmail.com>
References: <20240628224728.2180126-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report -ETIMEDOUT error code from cypress_ps2_read_cmd_status() when
device does not send enough data within the allotted time in response
to a command.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cypress_ps2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/cypress_ps2.c b/drivers/input/mouse/cypress_ps2.c
index fcc3921e49e0..8e17cd0bc437 100644
--- a/drivers/input/mouse/cypress_ps2.c
+++ b/drivers/input/mouse/cypress_ps2.c
@@ -115,9 +115,12 @@ static int cypress_ps2_read_cmd_status(struct psmouse *psmouse,
 	if (rc < 0)
 		goto out;
 
-	wait_event_timeout(ps2dev->wait,
-			(psmouse->pktcnt >= pktsize),
-			msecs_to_jiffies(CYTP_CMD_TIMEOUT));
+	if (!wait_event_timeout(ps2dev->wait,
+				psmouse->pktcnt >= pktsize,
+				msecs_to_jiffies(CYTP_CMD_TIMEOUT))) {
+		rc = -ETIMEDOUT;
+		goto out;
+	}
 
 	memcpy(param, psmouse->packet, pktsize);
 
-- 
2.45.2.803.g4e1b14247a-goog


