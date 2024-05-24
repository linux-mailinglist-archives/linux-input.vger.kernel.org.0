Return-Path: <linux-input+bounces-3816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983D8CE4D3
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 13:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91B871C2140D
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 11:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD18E86255;
	Fri, 24 May 2024 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nz/pg54/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D7185930;
	Fri, 24 May 2024 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716549972; cv=none; b=rEsLx5+ArAztqCob+hj+JMLOsFXnVDxqf2lUasyVm9EqcWm+QWDxw70AGbhQkUkdCgtz7aZCcFy0Dp8fUZubA/URWXU+2Qaz/a0hojCVPzFrs3f6mBlmjUsNHOnWVfldWMxQYBOtTLqrDfg285+RcNdU/K70/vg8akBiu3NTPFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716549972; c=relaxed/simple;
	bh=cG6gYW6/lF5NjKoSljLUI3Q9DM/hM0vRcJ+v92dR7+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sni/zIevpv1otE6bcFtLowAoRso6nMyj/BIh5hNsIydDVC1QhTv/Ypy6Oh3MyaJE5GbDDBovKiwcbRrOkkM1LPiqdORKV/9MXhRUQ5T6uHxT9vS/LTTlYcOPjzyz7UYUWttjJrqPCc84WBlFiG9te3PrcZ2GMmASiqamaKXVmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nz/pg54/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35507fc2600so703597f8f.0;
        Fri, 24 May 2024 04:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716549969; x=1717154769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ur1UlHeEjfjcn7igZ5+i6qFXG1IXbKWH273ahEei2E=;
        b=Nz/pg54/j7MR7HKPm9yfLotiwoE7DzClg/4S2JZ6IxaCai7w5ncfjUnettzAXA4xKe
         VB+TGbDwBTTAKUFFoav8e/hc53P9vhxd1plPHXSc34zXVPiGHIefP0Aw7mdEalLpzzzC
         ipT1igA6JTOFrKQaFDk3xVdktuF9wiXdWE6NLSUdOy6EnPf9M75//yVbvHQhqZwdNyUb
         9BnoNTS2Bu69VjPRLCFtUbPhkw/trWawuXhszKULgxRduSP3M7xpiJKRYn6QDtvNQFtA
         F/RNCY4kj4itmZnmootBiCqpCygtn0TYf6rm4n/E90f+UUiMjNvsPl8RZtieJ/uXbI0y
         /38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716549969; x=1717154769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ur1UlHeEjfjcn7igZ5+i6qFXG1IXbKWH273ahEei2E=;
        b=Vbb7CD2PLrM/hFdcLpXDano924HzTvLnWDeAGJYBgL69ZgH75NkNOdynP/L9cwCkEk
         NagbGIKrMPOeVeQiGR18QLE0GVnhFvvmYcqF/pviVc5mZ+Ct1ToWr1YurepntFAX/AMS
         oLnkXa/u1wDgIUd8vxfpoUb/kwNk67UE3ucuV2vuWJCTYhQTOzH6nfamOuspwtnd1iM1
         LHfcjXx3DYIVQqS95+pdZyIxZobMAvTNZKP8EMe2g4sV39C5SGkyx39aPDYBIRzJyz3Z
         8sTLoQ592l8JpS+UMG2Zl7obU/AghI9FZH2JKIYuxuclw0UObiQ6bdKrBdXFzaDvYUoA
         u6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOsCwFwH/Q75UTgD60XFid2AS5sl2CPtvIB5CUUsPmSavEp3xF9vltziczm2LCNkZU5Lb3ngHiyZZ+k1OjUpMm80mlxO/Lnx6MvbgtSz6Q0qIkVBdzxK5xlVZmuXEuBz9IP0KP8ZCkz1E=
X-Gm-Message-State: AOJu0YzbQ6PX/lrwNWCSJevxD+0k/1NDiH/etlHM3RD+1Ga1KhK+1Jh5
	wZwC58QfnXW7J4TksDv3LjOeRfrqbTGGOQ1pQiksRpGZzIZyGmIi9V6gxw==
X-Google-Smtp-Source: AGHT+IEx0Yb3r2siwh/vlxwUaOWz2q5dnjGuxaX436ZE18SweH1MRl+QUrOn/gNL/NHwlXA1ph/hQg==
X-Received: by 2002:adf:fc44:0:b0:34d:b42d:b666 with SMTP id ffacd0b85a97d-3552fdfa4f6mr1236618f8f.56.1716549969275;
        Fri, 24 May 2024 04:26:09 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c936esm1369907f8f.83.2024.05.24.04.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:26:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] HID: uclogic: Support HUION devices with up to 20 buttons
Date: Fri, 24 May 2024 13:21:35 +0200
Message-ID: <20240524112554.166746-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524112554.166746-1-jose.exposito89@gmail.com>
References: <20240524112554.166746-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HID descriptor for HUION tablets was limited to 13 buttons. However,
there are devices with more buttons in their frames.

So far, the device with more buttons released by HUION is the Huion
Kamvas Pro 24 (GT-240, QHD) [1], with 20 buttons.

Tweak the HID descriptor to support it.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/989  [1]
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-uclogic-rdesc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index b6dfdf6356a6..7cbd673747a5 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -689,10 +689,10 @@ const size_t uclogic_rdesc_v2_pen_template_size =
 	0xA0,           /*      Collection (Physical),          */ \
 	0x05, 0x09,     /*          Usage Page (Button),        */ \
 	0x19, 0x01,     /*          Usage Minimum (01h),        */ \
-	0x29, 0x03,     /*          Usage Maximum (03h),        */ \
-	0x95, 0x03,     /*          Report Count (3),           */ \
+	0x29, 0x0A,     /*          Usage Maximum (0Ah),        */ \
+	0x95, 0x0A,     /*          Report Count (10),          */ \
 	0x81, 0x02,     /*          Input (Variable),           */ \
-	0x95, ((_size) * 8 - 45),                                  \
+	0x95, ((_size) * 8 - 52),                                  \
 			/*          Report Count (padding),     */ \
 	0x81, 0x01,     /*          Input (Constant),           */ \
 	0xC0,           /*      End Collection,                 */ \
-- 
2.45.1


