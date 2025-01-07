Return-Path: <linux-input+bounces-9011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE3A04A36
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69EC218829FF
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1140D1F5400;
	Tue,  7 Jan 2025 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZISagkg7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323F1D63EB
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278122; cv=none; b=l/HIcsfzDKBn9LA6i7hIq+FUQY/l0yCoiqHQdI/0SmdUewtMLi1AVoK33D6HCR47aJjlEVDnLDgsah+inxLfrCJ6D+oMckJ7wtUdWTsG4zBUqpLje+p8pg3AM5fsRINNalqEhjsQExPG8ZdYA5ho+rFzt9eP+Y1EoFnNtdC8SLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278122; c=relaxed/simple;
	bh=P/n75Ovtrb4ZqQdj0fq9YScZ7AJiUzrQuq74F2Rf604=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bK8G6xHyZ6+MWkgKjuh+B/SwrTLtM1J9HdLLQrtD8Oo6B3zfK1MTpEWDC5LdH4zY5dhWX8G1wLSk5AjoczewzmwXgaAKjdC7JMPcDJz5u8fFwp9XL1BxH5KhjF27enOz9aTVIPTPo8lfKj/NvLaf33okRfgrkX7zS8DyXCF11ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZISagkg7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd730so114377985e9.2
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278118; x=1736882918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/3BGgk30uTb5TCZDX8F5vfQGDCdCCFIChHmFGSFnK4=;
        b=ZISagkg71QB/w36ChB/2MaaFWcLO/ZMDB1ZbjCeRhcupYp38syJf3uapaV2oV5eROQ
         6nv7Jmj3MOwf05GWvz5P2f9/Yp7dAfC5iEkOptCgnGdL0iymUPXJFhmSdgzt+k0rbtC+
         3jyh3J7fTbj5/rK5eekIs2N32yZeAas1SirhoMPT0OpHg2okF8mqbLpuPYiz56hFjlO8
         pke4hPPVh1DetzSouYsUIx1skuNgkBpRRb/zSBw+ARCQkVPscykzNERq1IDIZKafKrdw
         7/8TFqIZT5+E9jiLQFBZ/lan/KaQzD4E+mOoJ3UK8gpJBSf8rutNY/RW/3Ow5XdnNfZQ
         C3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278118; x=1736882918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/3BGgk30uTb5TCZDX8F5vfQGDCdCCFIChHmFGSFnK4=;
        b=kknPKammsM1cSe58Ptr/I+G+97lZsd68rmSmQoBCpaLyiAK+hBAH42dq8ouWXFW7PS
         yEbmCO9fJvw0XcGgk5S8W8yc6w1XA7DDN9kuj21LAp8J/6HgrhP3aUt7D8cZ3INkMQhq
         wzy+B8HdImco3HAe2XrxbcDlWZ9HCQ26SPum1y1lon1k/1xfZC+VwljmM6HE5rRKa1w2
         xjw73AtmFuATcPL7ZOEQqky8e7svoy0QJJlNj0/AohvkGWfjq6rb1B8Khw5UfSEqur6N
         oetYBS9IkcUie0I01vuQfQOpnMMiFGtvNSL+QnZwl1lcAUI28mbZTsHN0zMIjWld3Vgv
         hylA==
X-Gm-Message-State: AOJu0YzTrg4JIGvGXk/lPUcPoxWnvZ44xQQ8F+L9+KbashIfoH3RsHxR
	MtQRnAM/hy7WI2Z7WqIeGjy/7nZ5C9xJODOaUVsvU1+GJ+GRFE5GwMUJMp1Cb3vhxw==
X-Gm-Gg: ASbGncu3UFAZk074q8CaCJY5QCicKdMd5HXClgqAV9wsP92QqBGdO/Dz3WcetDeCF8k
	aAT/RRa/xE/IXFXUcu1Zh1dlghJRkHhRzYOGKb8BVdjFjbHsF4YLXZqqSA3riDRxBvLsfQIeF0A
	F9qMZQuKqMLq1mzRRX/llI6L9ZT+nF6Y0GPDYP+O4MlLuxhD5Z819ahnuFH8Gl/ZFoL59Wks7Td
	YICknp8wbuI1AXAs3KtXF2Xo5yylPZ57ZlwNRCwTVP5FVotc6HmO9nvhWHN9TGDZet6
X-Google-Smtp-Source: AGHT+IEDI3MYdAhIMTq+Y3BMD8/hkwuMsmUnHcsysyMuWgKCnUNj4TuD91+Yr5zvFWY6PF1qwDHC8A==
X-Received: by 2002:a05:600c:3b24:b0:436:5165:f206 with SMTP id 5b1f17b1804b1-43668b78debmr578427125e9.31.1736278118142;
        Tue, 07 Jan 2025 11:28:38 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:37 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Andrei Ilyashenko <andrei.ilyashenko@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 04/11] Input: xpad - add support for Xbox ONE liquid metal controller
Date: Tue,  7 Jan 2025 20:28:23 +0100
Message-ID: <20250107192830.414709-5-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Ilyashenko <andrei.ilyashenko@gmail.com>

I found that my controller wasn't working with this driver.
The LED would light up and it could rumble but was not registering
any button presses or joystick movements. I suspected the problem might
be that it was not being sent some required init packet so I tried
sending the packets being used in xboxone_init_packets and found that
sending xboxone_pdp_auth got the controller working.
At least for my controller xboxone_pdp_led_on was not strictly
necessary but I decided to follow
the same pattern used by the other two controllers.

Signed-off-by: Andrei Ilyashenko <andrei.ilyashenko@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7985b7a5cf0e..d1b771457b51 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -687,7 +687,9 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
+	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-- 
2.43.0


