Return-Path: <linux-input+bounces-12554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DAAC30D0
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F70189CD1A
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722ED1F2BAE;
	Sat, 24 May 2025 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAM7dTER"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8B1F1315;
	Sat, 24 May 2025 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108858; cv=none; b=XvmbcegzY22OaXYX3UEg5O34vkRhBHERDpH/xFQbr894qV/7z/dlZLWblTGgE3hosBFZYidLA+RxNwz8vslFwCE8OKIStGiKKEkwBET05MLGd38Bv9k5jShbxD4HCx8eJqg3SmOO1U5rX0tIm/KrCJU7+rou83kq7n6jjR72BGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108858; c=relaxed/simple;
	bh=j1BMQHjcfhSqWMrNSBDGMw3T0MHTY3JcNOw5ASp1Aik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMyqv2fnc2HeYcm7AYIPPRJPqeLVxdAsarO7580yz+o2G+kvmer/UAjpgNKLFKVvkIM3uhwEJVvbzEjd8W0j5kqloMPZWL3m5DifN413yR06mifl4XpDyqUm+65k6noVJxDUz48duykLeAjqZ92IeAhN9+ubENM5lgQcPGluxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAM7dTER; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601df382301so116918a12.1;
        Sat, 24 May 2025 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108855; x=1748713655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDh+Scz/A/iAtqESiw80/C2QD/zEyqnzP4ky3talhiQ=;
        b=aAM7dTERy6AbUJkgDB5nUnIiIt1P6ZmPb+N06Gzzmr3IwEdMpN8+/cXIXVfCSMBRDC
         MfPWkTFQOwNtjBB67OktG55YKQ9MzUGYV1A9QDW60m8QkBIn6wEuOuCzlFYn9+YOG3SZ
         qiO4qlFSrlu8qPoUT4NW+JLsbBdSNvMyGsQOQsjcwGrqYJImSUW2fDsUmuGr58fshBA8
         HTAlQCvz2NlJFfgnuXDYVHG/xZugXDgPPcGQAqOqCGrl+r9GdU6BOQrdZGtLfKqIelWe
         G1hswPXNV3q+GA6KWxNP7uBOqvprtayRc3BL3Xw7v0k48a8DW0YJwQ1tSpkTEotvty5+
         dJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108855; x=1748713655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDh+Scz/A/iAtqESiw80/C2QD/zEyqnzP4ky3talhiQ=;
        b=A+6s+NcUeD6XxbWwyJhOrj46Mfw7RDJlAgvLKjRv8ecH20PwbRbYh/KFJzBMUZ2jE4
         +90nG+N1siJ7PsMczp/g2KZyrMfJ7Rk9lnUq5TTTJUpdtb2peaN2I9W9lKnr6H5mOrLp
         +Spbfb86nKwNlIQUX695pA4vUd78GKLMtEYm+14U4MRTXG6CmYSX0TCeXTKT6GhVQWtC
         Z/sSDA7AD4R3FttI+aRKGBEMjn3UiYz7w9Kfb0z3sYnjWDP3l17hcBww3OBCtMlSXAfW
         8MlYJodpkCMjlrnDk5c9AKX3q2WHk6nBXNs7MnovHQy5Bv8/MWdS2go3LHu0fFxUEiil
         v6nw==
X-Forwarded-Encrypted: i=1; AJvYcCUuk9MfeKNYhHqYt4wYO+bAIQQOVOTKbGiefHgqrjtGifgEIunJO4vH9wIcvuh2FipBYusCtqNn9Fih@vger.kernel.org, AJvYcCX+b6/1981PeFZVuENzscjqccN4HP/2f1XPUsiETWq7oL7kQSagrjVtYsmsDZS7hwKdLDkUaF1IDia1rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIoRbFjMP2Z/4tThNdh9p5NGwSXbXPV2Pl9Db20eyPvzLyaqI4
	O2/6zh9lERYSo1Ebwz4MZQ/s/7a0wB/MAOcFMP+eCER4ho24N/i1tE7Cj0JESw==
X-Gm-Gg: ASbGnctvwdNpiQLV3wxhuXAuLO2clFLkEz8je1QGfWeq8z9WAIa+Ug0mPvv6OD2R9BM
	O/C5+KhlG2KrzyJA93p/gv5eMsd8pFdpszeSOkKMZb2RuztOu5PpXRvErD9pNVJmHVIFXojFhHQ
	ZknvaYEauCfdAbPp6eBmG0czgS0Jsw+KIU5cZiZX0aubeRFt0GdaTcgI+FAKqmoTNTyaIW0dOiz
	KEnETz+bwVheaLyPgbd0fLGKYu4Q46N6G2Pn0FTh/XI1L/HfKupWgc1f/Xzv3Mya8LLSFjMo8zG
	NlRtOPvyQgfj50/JF5uNlXkSUCKUlj5UVabLYNU34dQPLL0QjMoFzciccc9xoZQP1A==
X-Google-Smtp-Source: AGHT+IFjAi84HTZ/A4pA+C9Uh4taswArg/OQm9/eLcxntsiK+e5pN7QhquKttk1aEoXnZwZedC5iWg==
X-Received: by 2002:a05:6402:3550:b0:602:427c:4570 with SMTP id 4fb4d7f45d1cf-602dafc7e9amr1072307a12.10.1748108854849;
        Sat, 24 May 2025 10:47:34 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:34 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 08/11] HID: pidff: Remove unneeded else in pidff_find_special_field()
Date: Sat, 24 May 2025 19:47:21 +0200
Message-ID: <20250524174724.1379440-9-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes checkpatch.pl warning

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 88eb832265a4..6f25490ce464 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1081,10 +1081,9 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 			if (!enforce_min ||
 			    report->field[i]->logical_minimum == 1)
 				return report->field[i];
-			else {
-				pr_err("logical_minimum is not 1 as it should be\n");
-				return NULL;
-			}
+
+			pr_err("logical_minimum is not 1 as it should be\n");
+			return NULL;
 		}
 	}
 	return NULL;
-- 
2.49.0


