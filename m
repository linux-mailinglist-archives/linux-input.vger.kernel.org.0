Return-Path: <linux-input+bounces-3732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597998C8EDB
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 02:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0DE3B21EAF
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 00:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93AE1FBA;
	Sat, 18 May 2024 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lMUePSnb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AF63D
	for <linux-input@vger.kernel.org>; Sat, 18 May 2024 00:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715991443; cv=none; b=D7vGvZamSlkVZZJr3ENRbDQKoFCAcfYd8A4lmJf63xHS6qMykVl6Lyn+a2kS++1ryFT00YnRXxLYvZPnJt821c5VGHWM5ccF+usDS5saBRX9cdrNTKJoETKf9l6uLOakWxuM3TRv6gclAjt7Wc4jU7PCV+67bdGb7dFq3EyGFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715991443; c=relaxed/simple;
	bh=Ns+G8cIhe6RmVb+HVSbykTeCqAmMxrZ97rwaVohwt5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NfW5PRpWLvSMlAH2HjrfJFCYW6c9E3HEAa8es4VhJ2rGYB1/YJb3NMb/d1V0lSN8caItX8mPq6u62PcJroMZE9Msrg+V6MXHz3sFFtewRYr9i6YfAxYUV1u8X/kfbg3k5PXQsGfZMZRM1kxzr2oxwZc9Xhh+hRWIhhJw9X28pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lMUePSnb; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c99257e0cbso466040b6e.3
        for <linux-input@vger.kernel.org>; Fri, 17 May 2024 17:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715991440; x=1716596240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9uz2Ul+URJ48Z5Jx7gMVO+5xGSwUIqgOXMNbHju8Pw=;
        b=lMUePSnb4ZLjYlwcRNMrOv9l6chcHbRsetb85sTqYaY6R0uPklcW4TEvq6d4pb9UZQ
         xg/U9TPqPtDAY2edJ3GnBmcHKnK4DTIdE6OiATD1ZUI5HPozJGnJmhgq1muZ5EO4TTvg
         vmD2ADVwkiKkyYU8BFtmmiGmWqwTAvVMRuf64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715991440; x=1716596240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9uz2Ul+URJ48Z5Jx7gMVO+5xGSwUIqgOXMNbHju8Pw=;
        b=K6w8Hy+rlEGlP/otQOpupveG7hIgicIdNo47Br1CM2XpVtf21jOATZDkGDnZDBCbTi
         BIDir46QTYXsqkLqzKtqGMw6Kol+xRWlWTebDdmRfboVYhXny3A2JG8kldXeoo1nopzk
         MVeaMd1m39sb+aqxcOOTgNTyZde0nwtnFU6rzd3TSCskENFrfRYKq1Umi1lWH0kYOE8R
         MKzVYNLP3IbRyS77sYKHWNaH1prGQScO15hxjvnWj/UB0IBcb2tw6Kf/ltg4KouR9Ui6
         QmSpytJn/R1Xa93m0s+6cdBcQ5efZZy2ksU9WXS8TpJAJ9Zxg7lsk4X7FdU8C01JS5bN
         w5ng==
X-Forwarded-Encrypted: i=1; AJvYcCU8P54sSjohATO8qYKu4TfFX5yoFYR0QP/7lzGE+hGHeXJLxHvbbBiBwQx0KrzO7NMUDuvZh2PU4a06BN46FodY9XB5vmfq+TENNjA=
X-Gm-Message-State: AOJu0YwZAsTydjdIRm15VURTRvcAISK+vD8dV//gGLJBaks6I6MMvhQ9
	XFMqn6f9RK7y0pLzn87WOM/qO3E3qoVYV3liiQuD15dHfQiwb008E7dYf5LuLw==
X-Google-Smtp-Source: AGHT+IGkwd9uH0wGwcMxYF5ilve69uK7EUyk8Nm8aqaKGpupfm5tsNPxwjiWxHQwx+6ecqpoiq+xvg==
X-Received: by 2002:a05:6358:724d:b0:192:6a66:63fa with SMTP id e5c5f4694b2df-193bb3fc727mr2661027055d.5.1715991440326;
        Fri, 17 May 2024 17:17:20 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-63d9a97247fsm11586021a12.36.2024.05.17.17.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 17:17:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] selftests: hid: Do not open-code TEST_HARNESS_MAIN
Date: Fri, 17 May 2024 17:17:16 -0700
Message-Id: <20240518001715.work.698-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=keescook@chromium.org;
 h=from:subject:message-id; bh=Ns+G8cIhe6RmVb+HVSbykTeCqAmMxrZ97rwaVohwt5Y=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmR/OLA80fqaRGBX/36O8wyiGjoPwOVeOd9ptC3
 MGG6b2Ugf+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZkfziwAKCRCJcvTf3G3A
 Ju8UD/9pg/NJ7jGrKd81q/3/ZDtc2AGfZ45BLounkSac+UTpI9uCv/ndnDRxYx6emDItyNIZqKP
 LpK3xTUzPVSGcxkiq0R9SKrSF54gZfNutwM5CyFKQ9/p/0g1/4krpOBZNIgV2vszsdMY0EZqVvj
 5hzqz0n9RvOzpHYlkPAKoZ+Y/IQdXL8kh90VFqrOSkVFjPX32V7Fw2B9COoEfciPPYAAhx0PZ7O
 aONMXVAZBKSdrp4y1jjZprF6y40y2at9BP6lKtdIKMv0xoxyLSWyVT+0W/WoZK7GLWquONBO6xu
 T3kolc3gHYo5uYK09l3LD0HBEBAgiVkBcOOMdbU9zsPHkLJfX05AYI5Aj1VwXUivuC8PKZRwXP6
 zklQ8F05oLfPx0dd2RFG4AFl8P6Ls9V1NjdZjgtdAawU4+LQ3r0AJeSH+1ozbn+7VayiOOQ8xUx
 9iFf8RXtIhdmKllLOCn+SMCiklwT2+shmwcBL77HTNPLzCVcb6h+TIbJAM2FDrljEzq7DjJvXzm
 VIgKFT5HFm93snLTm9BOZGBs+Boh8+MOtRxZYLKggabV5Rxr6wI7xLnr3pmVeWpekuG5m2xhP0U
 Rjc/5ZLIG3u2KdX7ujZcPc6Cw9uqjm4Rf3tTMg2RbGOJ/0UVbjlEavS0YHtE5CQ4/r3zWBszBuN
 B4BtEWN 7x/h6wDg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Avoid open-coding TEST_HARNESS_MAIN. (It might change, for example.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/hid/hid_bpf.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/hid/hid_bpf.c b/tools/testing/selftests/hid/hid_bpf.c
index f825623e3edc..943fa62a4f78 100644
--- a/tools/testing/selftests/hid/hid_bpf.c
+++ b/tools/testing/selftests/hid/hid_bpf.c
@@ -961,17 +961,11 @@ static int libbpf_print_fn(enum libbpf_print_level level,
 	return 0;
 }
 
-static void __attribute__((constructor)) __constructor_order_last(void)
-{
-	if (!__constructor_order)
-		__constructor_order = _CONSTRUCTOR_ORDER_BACKWARD;
-}
-
-int main(int argc, char **argv)
+static void __attribute__((constructor)) __one_time_init(void)
 {
 	/* Use libbpf 1.0 API mode */
 	libbpf_set_strict_mode(LIBBPF_STRICT_ALL);
 	libbpf_set_print(libbpf_print_fn);
-
-	return test_harness_run(argc, argv);
 }
+
+TEST_HARNESS_MAIN
-- 
2.34.1


