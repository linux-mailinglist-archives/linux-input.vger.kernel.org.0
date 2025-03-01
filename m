Return-Path: <linux-input+bounces-10450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755BA4AAA9
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 12:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A99BF7A57F4
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035D31D79B1;
	Sat,  1 Mar 2025 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Op7Ea8zM"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472CB1CEAC3
	for <linux-input@vger.kernel.org>; Sat,  1 Mar 2025 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740828934; cv=none; b=ioJgz+LRjYyyxdVmY1va5cVLrnPxs6csltXz22larujM08ng4xdHycQ0i/2K8U6NNn9bUKZimralaf8LUr8NBjadkfS4HarGYsg6eHUIkFkMO8Ro1AGKRpgJcsW2d5mpcfr+tuSVomYrIwI74ouHbLjpfpdFz4xdQSHuLqEwUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740828934; c=relaxed/simple;
	bh=NdMb+OZXUXE9uz+Tva5woaVoVHA57xAZe7IqJBtg2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wpv8YPLdxJh/Ta8O/q6/HB9E8VCg9e2j5Pk9//tj8M3DSbOp9lI1SmZYaDHtEriwtBnmP+6/CgZjSPtEXDjZpMkV1MvxneKCbHiVoqbkLS8o3p0sEWerqMMZHaY+34s3KzS1mcOCIPc4vUpPoGaxbijI0AUAqHEIu/L/Mw8BLvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Op7Ea8zM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740828932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hK3JbUn3BJAens735VMYCVoFPFJB9l5JCnKZqwviW5o=;
	b=Op7Ea8zMVg/+JYASd6xH5SBWYz7P9gyzMTXvsz7UWAE0dzCM6QTmTDShG5nHoeoQhcAYqL
	Qa0No1InymhA9xAq2W/mX1DgJGg5kK88Tg6+VUZLP3Lz1oXVcrUKwDmaM/vmYrnzSGDq+b
	hl2+ZKdXGUU0DPnZXH9rMDYE0W7nbT4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-1RLFvaXlOWK7XFrzcXeOKA-1; Sat,
 01 Mar 2025 06:35:30 -0500
X-MC-Unique: 1RLFvaXlOWK7XFrzcXeOKA-1
X-Mimecast-MFC-AGG-ID: 1RLFvaXlOWK7XFrzcXeOKA_1740828929
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64F1D1800873;
	Sat,  1 Mar 2025 11:35:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 71A1A180035F;
	Sat,  1 Mar 2025 11:35:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	Weikang Guo <guoweikang.kernel@gmail.com>
Subject: [PATCH] Input: goodix - add support for ACPI ID GDIX1003
Date: Sat,  1 Mar 2025 12:35:25 +0100
Message-ID: <20250301113525.6997-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Some newer devices use an ACIP hardware ID of GDIX1003 for their Goodix
touchscreen controller, instead of GDIX1001 / GDIX1002. Add GDIX1003
to the goodix_acpi_match[] table.

Reported-by: Weikang Guo <guoweikang.kernel@gmail.com>
Closes: https://lore.kernel.org/linux-input/20250225024409.1467040-1-guoweikang.kernel@gmail.com/
Tested-by: Weikang Guo <guoweikang.kernel@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a3e8a51c9144..4b497540ed2d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1519,6 +1519,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
 static const struct acpi_device_id goodix_acpi_match[] = {
 	{ "GDIX1001", 0 },
 	{ "GDIX1002", 0 },
+	{ "GDIX1003", 0 },
 	{ "GDX9110", 0 },
 	{ }
 };
-- 
2.48.1


