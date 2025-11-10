Return-Path: <linux-input+bounces-15977-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75EC48561
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 18:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4F31634A98A
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0192F2BEC3D;
	Mon, 10 Nov 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="qiuyIjfV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397822C0262
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795794; cv=none; b=JuJkcK+14i3E5RHHn4wCF3r5+19S1B5Yx91izOwI138qxbQts6odNfHnRBDywgV2PnMj+dGE7iSvkVKLW0sAnp4Q7WCok6RJDqJYXQWCcbkECsXLehFJkvTn1tqhhFbOhrL86wFn0A8OyrTkK+j9GJxJrvXoThop9P5GMeCUS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795794; c=relaxed/simple;
	bh=yivdRpurit05WrU2cZrJ+Ef2/cgeGJsEFkDdt6uHfcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezQ6GSiNcvR5ulXexcKx6iWiHlomYo9L3cnkmaer1D9NkzUdA+vx1zpMmVUj3jUR6hNgXIEkcB7oQKERLoXpbjMuFkwqeuczHmWanPgCTe14rrzsmp+dPOTVg3zmFZlqNcAQetF0PxzAqGriK2bWPRaciFzF0cLRGGbI3oZxsnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=qiuyIjfV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2540757b3a.2
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 09:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1762795792; x=1763400592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5OL3Y3kmUNvDH8rRKkSC7um10A74MfKVea7Y92HY7Fo=;
        b=qiuyIjfVaXwGW78FQF6Fb5PzPCf3XbUBqfkb3aHZUrZdF4zi3orXp9MEEhHcDOojzn
         XZrP3OUZDps9VI/UEDC5Z1cYeN7tG0h4j69FCyT+guQ2wXXLVMnJpTKjNtF4wcFPtcsn
         7+TtMxfxzM04EeN6WYdyvQTBPX/+RnwAQ15Lyn9sUveauekvP/CfllHuDeQontB0curl
         4btUTe+jLYCH5r2+lS6J0YNyJcZAl2bwXbNPn5L3Do9MvAKPkcTjoc+fbQZrszqeoY5f
         RHUBAPuIt7DrrnIjKxMrpMh3V5VW10bT/oXZAAltWHrlmM9s2pF/AiRxceppC/xkHvRl
         NGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795792; x=1763400592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OL3Y3kmUNvDH8rRKkSC7um10A74MfKVea7Y92HY7Fo=;
        b=hb/cIeINK06QIVEbYXC7wrrdoVwmWwNUDWet7oye2tu8UBzDfD/Llg3x2M3JIUqLGn
         8mZEHATB+Anfb33b7Fz9PMExAMalw0kRW+IyGb/p9MTNGc5UmwMNLgWHhHjvVHMRj68n
         C/K/JQtljFfE95zzx3P3P5o6DUgoTbTAMoUZKSE/vO4tm/W7X80JSupFVB7jltucon1E
         O/moQKRprNzqCX1NPrpxhlZIw3IXPyJN2GryRTqQuZlYYY+5l+ENre3aiq0AYRTP4xDs
         6r4KvvzCgNCbEO6GF5OKYylgzxCyZOjD5vXAVFE+nAaL2RK8GiGB9vrlNj4POYDhJhnv
         /DaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo7YJKG6RfskBg673wbTANAjlq8UjKZsm2B+qq34W3HXWhrTNeT0yPRswbrYob+V/5HxEfbcQmvHLEww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOqWv8mxVN8kegwD5X79+JpMsiH6XXJOvFhoWpI4xSAu9p1fr
	p7iJWwKsSaJ55UHmaFiwBdFVa4zK1SrjgF+Dr+ODlZfX0gjU+v+8EILCj54hAcDk22w=
X-Gm-Gg: ASbGncu321XIFdLv6fhj0mL1IlhCxAjG/LXNZyqcLqsDNWca3PiWFQjiOc3VM+OKbry
	vfqESGeRK0qbr182sYsXeBySmPr5LXbw1ls6CYJKba6Zq8SARW/Wtdg8TnnpqNfWjwGxAGejBH4
	6oQpZLzpDttXe27T1cQJi7nrnyGYYa5FLR/yKYAnGsSSsa9Wf9i7qyHai8QDEARaUQ+ReuCh+zz
	HUJuSBZ5IQ+O4rfwsL3S1fqay3mAD83Q5OL4+CVQIptnTssfFQEj2ZefWbrPbkpGN6lEjka/81a
	6AqO4Fw2FtD/r+h1WlLkXJKm8B0loY+n02lbu00cI2SQYmserjxj90P8w4StKDkVeR2faqEGFLU
	tGuMqQQLdCQ5sjNvA771vAfDNhaHj87bLgKrK3XzAFljNraVrSRA1gZ1XOF7PU9+xjN5Ev0+uH6
	PuA6HRscWc87zwsA==
X-Google-Smtp-Source: AGHT+IHBptCxQ+7XGOLeOR1X/58AtZt0orE0We0oyv3It40DgetpuVdWDUw0jLaNMWE6eOOOHMBwBg==
X-Received: by 2002:a17:902:cf42:b0:295:8da4:6404 with SMTP id d9443c01a7336-297e56f9154mr118234675ad.40.1762795792464;
        Mon, 10 Nov 2025 09:29:52 -0800 (PST)
Received: from localhost.localdomain ([49.37.219.248])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29650c5eb35sm152495085ad.38.2025.11.10.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:29:51 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: jikos@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: uclogic: Fix potential memory leak in error path
Date: Mon, 10 Nov 2025 22:59:41 +0530
Message-ID: <20251110172943.99887-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In uclogic_params_ugee_v2_init_event_hooks(), the memory allocated for
event_hook is not freed in the next error path. Fix that by freeing it.

Fixes: a251d6576d2a ("HID: uclogic: Handle wireless device reconnection")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Found using static analysis.

 drivers/hid/hid-uclogic-params.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 59ea71299438..e28176d9d9c9 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -1372,8 +1372,10 @@ static int uclogic_params_ugee_v2_init_event_hooks(struct hid_device *hdev,
 	event_hook->hdev = hdev;
 	event_hook->size = ARRAY_SIZE(reconnect_event);
 	event_hook->event = kmemdup(reconnect_event, event_hook->size, GFP_KERNEL);
-	if (!event_hook->event)
+	if (!event_hook->event) {
+		kfree(event_hook);
 		return -ENOMEM;
+	}
 
 	list_add_tail(&event_hook->list, &p->event_hooks->list);
 
-- 
2.43.0


