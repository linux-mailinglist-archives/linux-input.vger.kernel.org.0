Return-Path: <linux-input+bounces-13991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0712B2545A
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3163B1C851FA
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C742FD7CC;
	Wed, 13 Aug 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUEz60cA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE02FD7D1
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115821; cv=none; b=BO8YOd88PCVidseCUF5naoqv4DC+NxV2DOqSGsEpvYeF+IjlMLpwzZI7nNE1UUlR3cEtw6P+viDnDil7vfqOwKyuINGmwWypV4gw0YOhz4Q+pDgfTfQ3KeB/tSsDdljy1iN9XBgnILDfy6rbK8xyoW0Rhh2asUi30Oa/RJMOKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115821; c=relaxed/simple;
	bh=ipb7CMfVlWDViwMXObbaiI78LBakQnjt/B5a8cgdPZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3/+1NlshgipN96SNoFE26TbV+pMQrMtk+/WUeTA/fGqM7wZJTXJ5TDkPX5DEBualk+GO+oJ27fc4F62DqECixxY6TGUEiVFjfFzEeTYQ066TgVqIj3xtJooaGnBMS/mmeRoDwJbQUX3xG+LIziiWi9F43fg2LmhzDBkzKz2qto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUEz60cA; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b5b12b5so39888a12.0
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115818; x=1755720618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5qhecK0dnT1ahGSmzHdyTH/PY5UW7ySDF2bInYw2wI=;
        b=CUEz60cAyKUmCDA6QBmUK/3nR0t8eLmUAsF3GOFmJ0Ag1YDl2z1vAZijRsGEz0wcxk
         xjfqogBBd9cBrjtjO5jE5R2TvlLuqi8J1qhcuVGid8GORm9R30cY60+PklyxYlWldlVN
         AEJtWfbo6jyawwY7At+h5Y0PTZR74qRZzUmMBFXwLIsCvJmzE6y46xz9WPylWqlsemWu
         ZkXXZnN50JOewS3iJ6tQdckl+A/r12+JffPgG0sdNam13gE6Mdtcy8AGXIdRsmX9JujO
         BUHwK5FyGC3qzzNG6AmSsMRUlERbDWxaXrtY9V2Jn9X3w3d1QekhG+8y04zh3yiCrYMc
         aljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115818; x=1755720618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5qhecK0dnT1ahGSmzHdyTH/PY5UW7ySDF2bInYw2wI=;
        b=jDQJx81p0zqSuQY7qOgcFqLQp431y0Ilr0babsAz4d8x3h5phd29IHq4Z+GfJxWLhN
         LrCGkb0hjDXzqBws7AnxfSWywUziOgDeg2MoHV2zIajOmY/dFZGT5ZmNEaj2AYMwDgts
         EbulmwR5I1AsVFsjv96imrvYMnCXBvPuk/W3COhErVxnDIqAMKBgooyy6BF1wqAkJjWC
         s3DWr8ca084k/d5NcI0mnkIZCDhsEsqkvOTft4tfFV7s2sZX7Y6aF320ZMMRpGtGfK/C
         Wws3AGDnB1wschQiZKH0ZF0lZaGdTfN1oU2nz/AgI2iizv2sfU3pVNDWCpW6VyoRlUj5
         mARg==
X-Forwarded-Encrypted: i=1; AJvYcCU7NSiRAfBU65JVv8wG3YnqVnvj+K21TLsr1+TZA8S4P0kEoBLZ6ge2qTEujdT5UVhCk8X5Ggnb2CxTMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXyIUxhBbdy/Wo+SA0x81GIDVI73wb9h3LBP64pEo2XTnYEWf
	W8uCmDGCbbR+p7xurHX5ffPkAMXM3NEUkJeGv1Ohm1UbKRndBndo0gHrpi7whQ==
X-Gm-Gg: ASbGncs3OOd4QPNNvrahKCTGGEeoZUqD8jvJ+Tb2viT2bCIgjj2l97MyIJOPB2GiBjH
	W2G5vDSE5SH7sRaph/I/DhhzG5q6D8MTAVO5CYAHQP3QLbtsxGULNLyVXvA/lyNMJTYDmWUY+ET
	ABu/Lh7uLZ4q5RoBavA7yzOP8w+f+yi7gERw6qhdVsZ/gxDLsdtlHJbhoJplBIBqXbzRj5CrdsN
	3N21ZdiU2LQL00wYmNvKqHGgo+rb67HmWS5xCN2dvHycDRQ+cyjFSzpGXxiG1KzBkbQ7/sbHGYa
	aylt0WZ3D2YjSeErQxbE7hdm2Ycktt42HQchJLfuaQONBcM3PC5fVYpweBiIjCnXrKBjxzPC75k
	QLOUdZrfP0/efMJHOzh7JBKn8tOK9UTglQXDcByWMp823zfZ2x33QA0sLWVp5TdYV/QhA8O9dTK
	E=
X-Google-Smtp-Source: AGHT+IFGK+5MIx4HMeHOpF3YYbSNiMCxqV0Nx2EUG+sEEyZsMyQMQddbSYYOM8Rv/udL5LARFbQZPA==
X-Received: by 2002:a17:907:6d07:b0:ad8:8e05:e5e9 with SMTP id a640c23a62f3a-afcb981f393mr18797466b.2.1755115818139;
        Wed, 13 Aug 2025 13:10:18 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:17 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 13/17] HID: pidff: Remove Anssi's email address from info msg
Date: Wed, 13 Aug 2025 22:10:01 +0200
Message-ID: <20250813201005.17819-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some users might try to contact him about issues and he's no longer
active when it comes to the driver development/fixes.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3fd51ad5cf56..ebebac5c4384 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1559,7 +1559,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	ff->set_autocenter = pidff_set_autocenter;
 	ff->playback = pidff_playback;
 
-	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula\n");
 	hid_dbg(dev, "Active quirks mask: 0x%08x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
-- 
2.50.1


