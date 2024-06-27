Return-Path: <linux-input+bounces-4665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7AA91A0DD
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 09:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47303284076
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 07:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394296BFC0;
	Thu, 27 Jun 2024 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn+HxYO0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F084E1C;
	Thu, 27 Jun 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474753; cv=none; b=HEuZtV0dghueLm2KrPtZkXWGeD4gumYP7q2Ay85VEMOdWrwfWVFbzeS06IUmverXVkvfs2HrlqLYGmKAfERA8HE3mi10Jnw2bp7MSeX8vvktPpxBv8ADoQtfnE0y7JUDj95+ur7e3dxlj3R5Omb4ONo0ztY1LnCcsgMo8OVv3ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474753; c=relaxed/simple;
	bh=8d72iLVJ7jdyVKwK547+0G2nvs+gDYhuywuSycIwGNg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W3xCdjQCD+xYHV2Q3K6ZAmh2WoYpRPZFEnIP0n/qdfecr/uGk+gO8sk7UJGPw3md5KofTKIStAOEFkliMcmSLQG/FBL5HXwEN0NLuzZQnDHOShlgtG8lXCAOtyBtuwHOTuXY72xcWAkdG6HUVjrUk4WdxEeX92s8ukBuRRiW2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn+HxYO0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e7b121be30so5654330a12.1;
        Thu, 27 Jun 2024 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474751; x=1720079551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRXjuN3M2mo5M+owBGit9sxq1HhXNAki9YSn4IQ1qeQ=;
        b=fn+HxYO0VDduTOMkUQNbcTc9jVZe2FUTIxUeLC+sUFcjvZQgiK1YhcUXBonYMuka5I
         9BIERiBj4svzO5B7kAA15yYFfyRc+7J2EoQfvdRXDRdpH7rBK6JVC8c38zR/4pDJ+EtD
         RlmHCMdPNrToEaBCjBgBTo6tap1RQzvAyxhSbvDvGY5ZnvjmQ9S7TqNWpK/IaY4FEQJp
         tdkVa/iJeIKqC1JtuAXqZB5sAZPzvXKit4UMoWxZtjLQAmk7FnGhzifPGc+1wjatAChZ
         M0Hdbm1tf/Jg7pZN0y8aUm8uGsRD/ASkWY3KgXC4+KNcbJIv6QgRbxLSr1yEcNouIAZc
         +K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474751; x=1720079551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRXjuN3M2mo5M+owBGit9sxq1HhXNAki9YSn4IQ1qeQ=;
        b=bpqISXnNJ26Wjmq+c7AovfJIJOzpnlc/cOKk6tERyIv4ZynZNpVLgZmLsEcsI/0uD9
         sPbXpJPNzijnmX9kT2rN5WcbVPVuQX/i9CrPkoXEQtom21S7sExuC5M+9xk/w4qfqb63
         2qoWipP6X1uxKzo0xjwJrZo5FC5fMZ8ng/RF5/s79wM4mxOgu7EpPbW4S9VNidm9Pyl4
         inZOKbZqGg28LNm0lxp10i2a2xCalumnmHdLiPPVfW6hfoH9Wsw4CdhRL1ez7VZsE6Kd
         8zKTtJclS7ATB0R2w6lBCsJEIcIrarm0R+AZdTfGEixqSmnx2M2TzA+iQDtVinAoTiQZ
         YZbA==
X-Forwarded-Encrypted: i=1; AJvYcCVhcixrdWXIMpznT4UmUDvoAFoQHmiPRJAlb1UA+dFuGCVn0XnjbTaCx+o3jn9yMpUCCpsQgkG+qLlJiKQ49W5QWXCzWqem1HP7TULn
X-Gm-Message-State: AOJu0YxiulsggkOvRDNeu6QCn1mlepe3KYVUeo4habnyn33u8N7CT/C9
	uh+T8s6syyrtGwpUdMQkzo8fpGbvBhdHHTwNhsFIh4sDUsxuemU3KjlZZayZHik=
X-Google-Smtp-Source: AGHT+IFGQnKTPs01LiaFPRPy7gc3QvJhUEAVddRVqe1s3wJ1t6qVHeZ2sySbOgXszUXtoowP78T/Tw==
X-Received: by 2002:a05:6a20:8c24:b0:1bd:2acd:d175 with SMTP id adf61e73a8af0-1bd2acdd201mr4102002637.32.1719474750840;
        Thu, 27 Jun 2024 00:52:30 -0700 (PDT)
Received: from localhost.localdomain ([103.52.189.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac979135sm7091505ad.155.2024.06.27.00.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:52:30 -0700 (PDT)
From: Shuaidong Chen <lovejimcarreyforever@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuaidong Chen <lovejimcarreyforever@gmail.com>
Subject: [PATCH] HID: core: Remove extra spaces
Date: Thu, 27 Jun 2024 15:52:10 +0800
Message-Id: <20240627075210.3619255-1-lovejimcarreyforever@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra spaces to eliminate inconsistent indentation

Signed-off-by: Shuaidong Chen <lovejimcarreyforever@gmail.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 6e09a918c849..e0e7c7b18f0d 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2777,10 +2777,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.25.1


