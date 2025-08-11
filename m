Return-Path: <linux-input+bounces-13884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187CB1FEC0
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 07:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2523BBB00
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 05:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5255126FA4E;
	Mon, 11 Aug 2025 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLRVQ8kq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4926B098
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754890891; cv=none; b=Cf/OzQ+UuxGTl3Md9fJFMmbGXdULZo6qUnTtdLyD/XyfCGrHNrvV2zHtlLb7LlB8J6DkaAvSX0MIjF+Or3yxCe0S5mZk6M5le7IhEzgqq3d3bhJp2DRsD0KlTWkSikHdp0x8BYazwEYyNh6NnXXdu/IDEi/t8rV5H3IEPzlhOzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754890891; c=relaxed/simple;
	bh=kpPVwXU506qGDP2XLZpLrVkFHaAF/DmDyNKvv6kA90k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Npl0kuTX1vceeR3AB+xFfTDdulYEwfbzTQtP7S7/MWniHxfpBrNDFEkX4e/UiBQjwBPEkkiodsA/rrL7uZ21arwy3DvLHWy9S0cDz1OgOyJvs05ljOCdbi5cFAaXFAZt1BCWpG2a+d+SvigKdhaFmVg2qFZyFRC+zaEuTX3CLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLRVQ8kq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73c17c770a7so5006402b3a.2
        for <linux-input@vger.kernel.org>; Sun, 10 Aug 2025 22:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754890889; x=1755495689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cETyuE3wvamROXC4Lt1c/4pgEuTp9p/utbq8DdU1MPs=;
        b=PLRVQ8kqMbpnc3GA6MQ+jtKAMAUdHM3wZ2ueW4KKaltjSMmT5R25x1CWYMiEwwNePw
         3F00gp0XGRwNnTJXZZNijsMoHiLMmypGTqb4eymYUbx+9wf+eHs1nI0BfhHtEzSvZUVG
         3Frqv5QUweohN9aFF3AnHVCuqrO6tLVpU6knr1zNnbW2EC9NIgBUhygpT4+1osARSJGR
         RkRubm8l0K/0TJSRZdeE03atHxW74Jo9KYpoNGQSlq5tFamk8or1jmqV8jstDelMtOUz
         xObaSQrAbzbWIlyjt1QiXRUPA1p9lCBQSRipsLg87rVqrTYQBoeAZgkvtn5e4w1dUF3Y
         S49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754890889; x=1755495689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cETyuE3wvamROXC4Lt1c/4pgEuTp9p/utbq8DdU1MPs=;
        b=JOZa5WPsH5avPdkqDej2270fz8h7RYD5XDj6ATIbibgxMDD38p8KqAgaXKrm7qSo0z
         Tnhm4Gju6mOnwMOOEta043d0gS2nU3gUt61ZpJUP76msRyLqya3xsCzl/T9sBCpyHViS
         pktxzImCD5TgOrtOy8FeqbzOPsy18aIP76QstPp0SACoL2k0X3hLjqBVvMPly+EWI3XX
         ckK5pLhvl5b1PyE7SlNbb3+QkeuNd8Gy3JaZLfEL6h857+iEba0UBvSDty0ObO1TbOU4
         edmdBa+6jMnFFUNLcCQHbf8xU9k7RE8cbv00w5LObozNAUHJKwSavKgrLk5MGBVV5Q1z
         e3mA==
X-Gm-Message-State: AOJu0YyWaMjqsfV1sCOjXQ3KXPpVIjpZzXbxrjHsmORGm3+R8NBmxLDA
	2ZeVsGxLbOdiasvI2EMw+pChQXyYJ6FnKZz64BjSe/4kEH6jwdTX9mO+lEKBGNJh
X-Gm-Gg: ASbGncs7kpYslAXwaM1zR+3fhAyR7t2+s7SLKUbJzCPi42ixzcChTk+ZB5oTD9Avlwj
	I1NDc3OZYpFGVsb4FvEeCHN12x76YuJvjwkXT4lJ+AYeWXd3PCt1Zml633Df6WkeAauZP4mj0Kh
	ULvVNpIugW1Pxt8w3ejMhuBhszyax0eylP5+LjKe8bAvDuXq2g8ZLiuCShRQ8/kqQH/AoVn6ruN
	R0qp4/wzLxrfI5+dfG2DsAayIqAwoHRA+ROR6sZBADsP7739j0wjnd5JhKSS2JfSvGR2Zx08QnX
	AofTADtWmArcEbcdwXgL1+yMMB6X/Zu3E3H6fvC7sy5K2Su9/a0ypu4+iui8d1MtVZ5rq3mn3GT
	p
X-Google-Smtp-Source: AGHT+IEdwcuQtle3IVbhOu1aLu+h9gX7qIg9fFHWlOSYhJNJa5vc1r+q8FkAyqSA4gfYcZeIpdnOiw==
X-Received: by 2002:a05:6a00:2286:b0:76b:f13e:f598 with SMTP id d2e1a72fcca58-76c460aeee3mr19070492b3a.8.1754890888593;
        Sun, 10 Aug 2025 22:41:28 -0700 (PDT)
Received: from fedora ([2607:fb90:331e:245::f165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c61b958b0sm4828853b3a.44.2025.08.10.22.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 22:41:27 -0700 (PDT)
From: Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To: linux-input@vger.kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org
Cc: Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: Wacom: Add a new Art Pen
Date: Sun, 10 Aug 2025 22:40:30 -0700
Message-ID: <20250811054030.18331-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/hid/wacom_wac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 955b39d22524..9b2c710f8da1 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -684,6 +684,7 @@ static bool wacom_is_art_pen(int tool_id)
 	case 0x885:	/* Intuos3 Marker Pen */
 	case 0x804:	/* Intuos4/5 13HD/24HD Marker Pen */
 	case 0x10804:	/* Intuos4/5 13HD/24HD Art Pen */
+	case 0x204:     /* Art Pen 2 */
 		is_art_pen = true;
 		break;
 	}
-- 
2.43.0


