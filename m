Return-Path: <linux-input+bounces-4868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFB92814E
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 06:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976792859F7
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 04:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A84596E;
	Fri,  5 Jul 2024 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="ar/FgGgJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865183D963
	for <linux-input@vger.kernel.org>; Fri,  5 Jul 2024 04:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720155352; cv=none; b=imsiAUzmYnEokk9IwU9YgNYfUqjwS7zCeHlho/ZByiVE2lzoyIW2Q9l6O+p5enIf6g7AAorKmJK8ja3NnfFlrMwlFDOs5B0fKQCVwCRIyH7KwZBw9WvrmazhYXXu/9cy/RdoQSHCjTOM6zSMzJxPqk/DEadHUT5t1FWVaNYuHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720155352; c=relaxed/simple;
	bh=h+pOKEzq21EGew2ZzreJZHhy8p7mi5YZ80UnEQBIRVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bj1HJF6LRjyd3FFKpDIX6RTE8nPxr5EpZ9yLiCpAVTMhwCAcsBcXrnIz1PJ3Sw+Xrqv5SPde/5ip2qUdlkkAzK1Sqso2s1UNvh+3zp5u11bKGdCMGlNWXccLh26dLkxH2eyHeUHNDfInap41A7nO6vLJJagrQzrtYXDUcCqDprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=ar/FgGgJ; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d566d5eda9so617097b6e.0
        for <linux-input@vger.kernel.org>; Thu, 04 Jul 2024 21:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720155349; x=1720760149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MS4jp5iaFz0GsaZtHsv+uAaVoKI5dr5okZLBYqXviZo=;
        b=ar/FgGgJUUnHti2MWR6wgPH3XQYiOHx/+CkcPBumRAOU9BV2Pp9Bn5B94D6QsVN5b4
         G/QCkvwAxzZ3jzQJ38gqZq42JPLECLjBu8slQk4GeebPF1p0/sBm2AuCFdFv17B58+3D
         wsEiZROl3sqadjjER0W3EciPD/3u9t00UboOFWxqOMBxN6VnXTIgIlisJxW7L/lRbnuQ
         Q0jN2De54S9TzSeTf+sxU1H5gmFbOsbQntFvJI3WaPVy/CoITxlJzwk+aXlXVJHU3dJS
         Cy6y4TLFIgkFkNXWHintJ1KVMODrkaT1uU0P7z94XnhqSvd62tRr/SqIrkRMvmrpHc1h
         5bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720155349; x=1720760149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MS4jp5iaFz0GsaZtHsv+uAaVoKI5dr5okZLBYqXviZo=;
        b=O0GbEe8KSt6Qm49bYeXffwD0QLnkYmByiHXWSJf/diopLgTIPpmu/12YLsZtr5453n
         BmFM4jGzvoLrsqk63/9Y4lkBzBOqhAKaIvqoOUkJSllDOXz9P3u+EGRmbRJ2DWp3utFA
         152YOgp2acsV2d6COm+I8+8KLTvIch8vn2cmg5xpdfYkXeKRTZbw7BcfyiQ3lppaeke1
         VSUypEuQUWqwSnE8Uc9sXATwGH6j6YycDN/IiaYaPONfo7LfmMXQfYuAZ3DHXDAv1tg6
         xNw4q+n7k6wcXr7nI4z5jMh0pqqGObo5yc5DACeV671plG8sYoO7i52cB+HhSgtbdquZ
         Mf4A==
X-Gm-Message-State: AOJu0Ywj42g5v6SCC8MgILwBNqq4q0nHojeQxoY6StKCKaDh97drzgeR
	l/xIMGFzAJYazlkNAx8I9WevQTXnXZzNXCG6o0Pd0gliyCqtLm9AkMvG+dzdS0w=
X-Google-Smtp-Source: AGHT+IGrdpf/l+4J/X1f/n6Zp4kaac2RRN+llj4yLgHAH2VyfMdwf0gSp9n6NKmE7givMUPxUsXs2Q==
X-Received: by 2002:a05:6870:e40e:b0:25c:c35f:e259 with SMTP id 586e51a60fabf-25e2bb89991mr3284701fac.34.1720155349515;
        Thu, 04 Jul 2024 21:55:49 -0700 (PDT)
Received: from fedora.vc.shawcable.net (S0106c09435b54ab9.vc.shawcable.net. [24.85.107.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf9d0sm13110040b3a.115.2024.07.04.21.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 21:55:49 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] HID: hid-steam: Fix typo in goto label
Date: Fri,  5 Jul 2024 06:54:59 +0200
Message-ID: <20240705045458.65108-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/stream/steam/

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/hid/hid-steam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index f166188c21ec..a765a48c0ab5 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1267,7 +1267,7 @@ static int steam_probe(struct hid_device *hdev,
 	steam->client_hdev = steam_create_client_hid(hdev);
 	if (IS_ERR(steam->client_hdev)) {
 		ret = PTR_ERR(steam->client_hdev);
-		goto err_stream_unregister;
+		goto err_steam_unregister;
 	}
 	steam->client_hdev->driver_data = steam;
 
@@ -1279,7 +1279,7 @@ static int steam_probe(struct hid_device *hdev,
 
 err_destroy:
 	hid_destroy_device(steam->client_hdev);
-err_stream_unregister:
+err_steam_unregister:
 	if (steam->connected)
 		steam_unregister(steam);
 err_hw_close:
-- 
2.45.2


