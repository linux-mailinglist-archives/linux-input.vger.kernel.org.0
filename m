Return-Path: <linux-input+bounces-12082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D008AA52BE
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 19:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347A9980560
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 17:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9882620D2;
	Wed, 30 Apr 2025 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4SRzNFE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013971DE2B4;
	Wed, 30 Apr 2025 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034852; cv=none; b=CcACg1xqv1rIXGhwyKeMkkRSarSLZ0Il8gdlchtsbdMOdwwxgXRI2Pqs4e7xAqWWpIOM7iOEsFrS+ZbAMCL1uTq6NGMJZyAjE/thamVikzmDfpue4eegmm9xrXmwUyVi0nzRx0uoI8W9epbtFQWBqK5WfZ6LNqvZexLlRaCFxPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034852; c=relaxed/simple;
	bh=U4P2tnNseozPuuy/skT7kmujiUB/sLQ43YhfGdq+IVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ssRpvXDxqJJViEKnayJeAYLXCcghEnEziR8FLY/aPHsQJJXoZqzMNizLFkfrraK8wIJXneLoHbSzMqPwyLBqq6kQK8q7MwbI/oz7VP2u4LCLOwm2sjgUdNjhk8evpYfLQ6PoFKL4B5nt1pY908KR0/KrPsIMLFZPnLxYU33nFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4SRzNFE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso121755f8f.0;
        Wed, 30 Apr 2025 10:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746034849; x=1746639649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Md9dvw0OrzD5ybuFEtQ1C4p9sLs5X9fR5lPCIeJYTOA=;
        b=Y4SRzNFEKeQxJb31ALqeNR4Xrl9UBb8ZGKMQ8Y4FS8AmrzYpAWgi+EwCYI6+7sfUmW
         X0Xk+N3cfSiBaqvF3JPw20ILB2ge0EB64eIDqnLrnt3FUn/1XC+CIKfG3EWzXvXBq2Mp
         XxRdNG6AhjXSvmkuKavdf7srPmizu6jSxN/+Bnvjhyx52uokhJRCg/+J4a9auTWyDYFV
         JxDAAbdHOPu3h5DENukqUz8r2e3zDgj807Ff9LV0wJ+FJ3QpjG6GXV3hRtRtpLZyjhps
         zB9WVUHNonJtNmIw5DkeIOnKIgkpY/8+uMXUnsODlFgn92fjZeeRo5CB0unCDurivmyw
         JZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034849; x=1746639649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md9dvw0OrzD5ybuFEtQ1C4p9sLs5X9fR5lPCIeJYTOA=;
        b=ApwxD9ARAS8Cw9eiPRGyb63Q6zgeV5ChxO5xfUHJ065HYMA8xv29pmBMXJFjv9uzgG
         wh4o0UvAojGmprB4aSiIRAc+GyQN/BRG0BKM37QTN4lfod5IpUrQZS8lbAPQkZ7qRKz2
         6qIiIp9nrMhh75IzBM9TbFy3ntDExqrNnUtJkh9k9bpMZOhMv/FVWSD1HLHlQaEKQoYu
         gAaB2uF5rXlK5l741NEMlI7UtCxZFARzw9H7tcBEyg4IZ5Gz57C0T1gao+CQ8XqIiy8Q
         amH8ArsOOKBMH+qMivjflH0o19NiOoesjYT5bKOKl5i42TS8WbVTS4wlIXLVlX2wsz2k
         aXHw==
X-Forwarded-Encrypted: i=1; AJvYcCVpd/Xo+VtJQzs+OK1QhmExpnCBHpPjvjohk29owA2g2ch/Cg0aZY8VHGWK/BoF1ymdZivgX0/2Iuipmg==@vger.kernel.org, AJvYcCXXyJRKx7Q09gG844oyrRoYNA/NcbrUzMPo6xZYT10zFcMicvrDnySh8zv1Yp9Pbu1uykpoNTJe3SbfGC45@vger.kernel.org
X-Gm-Message-State: AOJu0YzdwMMF4su8tNhhyxDSyahYmv8aPaZjssfHogXFbq3c9RgHwNSz
	/tWrS3z2xZfzAiBkM4J7B3UBuY8bNTpWqzeHkK/PSARHjzLSh+VS
X-Gm-Gg: ASbGncvCwklgUvaR5wNFCF2hR7CNbBXukDR4PFO6BI4ceBlG7U8AIuaHMigyhVtC1yW
	a9e9Jg4N5ghNssU0n2zWqpMw2biQFcojrV6sTV1TBIJSDV77A+7MCM1RXGq0f/dHjvO0noq5LxB
	nS6gM7UWtYWhxxpK2VgPe6yYCZ3RNaU8wgdI4Nrv9SDDx6ItruWV3OyfIFbhwd5RHWWJpwPV/pU
	ofoaB9n0cbFClvMaF3c8Efbgw6r7ojOxzdB7CLGvNuDFG218igvME7zGTDvf/xopZ3xT0OxnS8c
	wnlCn0p69ndmVp7n8kaMzhcuotq2bt/HxSUWBfRCV3Rgt4MyJYcx
X-Google-Smtp-Source: AGHT+IE7gEG4YDZEOWv5TkTkU5a8rxHnVddvhSHuKMmtC2j/xML135LeYoLkfkfueJoMJWIoy5rUng==
X-Received: by 2002:a5d:5a46:0:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-3a092cf7d0cmr308793f8f.13.1746034849124;
        Wed, 30 Apr 2025 10:40:49 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:7d1e:a9b9:e7a2:cc4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5473sm17765934f8f.31.2025.04.30.10.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:40:48 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>
Subject: [PATCH 0/3] HID: wacom: fix resource cleanup issues
Date: Wed, 30 Apr 2025 18:39:08 +0100
Message-Id: <20250430173911.84705-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a few resource cleanup issues.

Qasim Ijaz (3):
  fix memory leak on kobject creation failure
  fix memory leak on sysfs attribute creation failure
  fix kobject reference count leak

 drivers/hid/wacom_sys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.5


