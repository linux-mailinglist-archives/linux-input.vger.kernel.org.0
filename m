Return-Path: <linux-input+bounces-9930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9384BA302AD
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 06:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4621166BD4
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 05:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7C01D88BE;
	Tue, 11 Feb 2025 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jw0wKYPj"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EED1C5D7C
	for <linux-input@vger.kernel.org>; Tue, 11 Feb 2025 05:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739250189; cv=none; b=eGpHSvEsp3Psdlwkpl7pRPpBHVQSAjVOw8LC1zduc8KRHWh69RPx3kC2a3Wp87xuAglG+QQS8P32TsW9v/YMVIYDM5iPsuPbU9PjYXnFL4uL9VVzct87Gk5d3IOW74u2FMTI3SQ7IifEIloSohgeQ5PQvdKAhxQAwkoIdLGDLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739250189; c=relaxed/simple;
	bh=wpoHji7Hp1+FxSZ0xjsILKkhquDq8LJrzGi95lM4WUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mhe5aHfI2XKBedShwZrGZhsYao9M9ZLVHpeQ8Vq78somHfZsKKy/lS/zD7moDQQOTfCaRvhioywNlMAJC8rWuq1aFjzm/Z8Kav0npD0H53OghvXRGRaBbhM9dui3ZbZfdLBFVIldp4o/dr8Kz1HSoLM3e9ViYSYk6Rh86Wr8oxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jw0wKYPj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739250187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=65DoZCq5XCH92ZVsg3Uk5mCHl72LujG0+xd27lPRMko=;
	b=Jw0wKYPj5vrUWmC9xqX3BcGDpEOoytIgfKFXw/Pg9ISYJ1FdbeIlPg4cjHPAk40ZD0+f7P
	I6/AQ7ez9nGvBz3p5ap20ELy5OxndCeL+SPwgm4UnCBAeXbGS67/6OrqvrgtNtiAuw+rlX
	1Ry4eiCjT91jRinODP9C+jxHCAcscas=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-PcpVTjY6OB6mTomm3bHRoA-1; Tue,
 11 Feb 2025 00:03:04 -0500
X-MC-Unique: PcpVTjY6OB6mTomm3bHRoA-1
X-Mimecast-MFC-AGG-ID: PcpVTjY6OB6mTomm3bHRoA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40440180036F;
	Tue, 11 Feb 2025 05:03:03 +0000 (UTC)
Received: from kate-fedora.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBBD3195608D;
	Tue, 11 Feb 2025 05:02:57 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] hid: Kconfig: Add LEDS_CLASS_MULTICOLOR dependency to HID_LOGITECH
Date: Tue, 11 Feb 2025 13:02:40 +0800
Message-ID: <20250211050240.163015-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The test bot found an issue with building hid-lg-g15.

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g510_kbd_led_write':
>> drivers/hid/hid-lg-g15.c:241:(.text+0x768): undefined reference to `led_mc_calc_color_components'
   powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g15_register_led':
>> drivers/hid/hid-lg-g15.c:686:(.text+0xa9c): undefined reference to `devm_led_classdev_multicolor_register_ext'

Since multicolor LED APIs manage the keyboard backlight settings of
hid-lg-g15, the LEDS_CLASS_MULTICOLOR dependency was added to
HID_LOGITECH.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502110032.VZ0J024X-lkp@intel.com/
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4d2a89d65b65..d7a36c9e94c2 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -601,6 +601,7 @@ config HID_LOGITECH
 	tristate "Logitech devices"
 	depends on USB_HID
 	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR
 	default !EXPERT
 	help
 	Support for Logitech devices that are not fully compliant with HID standard.
-- 
2.48.1


