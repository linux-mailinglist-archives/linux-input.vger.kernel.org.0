Return-Path: <linux-input+bounces-9643-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A640CA24892
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2321884A58
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAC2160884;
	Sat,  1 Feb 2025 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO4BcHsc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310DA148FE4;
	Sat,  1 Feb 2025 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409953; cv=none; b=iUJ07P4d9ZryQel05trxG8Soa2YGnFuZcAESp4pxbczQ244vo5W7i72qeUmQLnzp6l84CP2mXj2znTM3B/s4keIKxVUbcaw1+gvc9I3+91/yXRCxac7erKjPxShDPFVZg/MkHoEW9zxXbmhK13WS/IXBuETQJL44WGTMQhV1Igo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409953; c=relaxed/simple;
	bh=+GwR/e4rJsHH30l+t0noxqlxePCU6YqnpSq/kDR4h4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c91q0EIrLOHXJy4nLw2H9RId5FlHvNW8Yxz2PrZHZ97K3CEHiMW78eZ+EgusUXgsS2vEI5Jo5iqHMqIkgLl8Xe6Xh/sm1Zyex/CnL4HhKfBKnlU+c5y4Dx/fxDlFnUTUM5KSFfcub4dBe9BfF6vlhUz83CcDVyq0wDj9txYcCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO4BcHsc; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dbf7d45853so525557a12.1;
        Sat, 01 Feb 2025 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409949; x=1739014749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU1ijhHw0/QLTZKfCX+dlRClDFtMUmf3s7IoL+8HfDo=;
        b=AO4BcHscKheCTiLNk5utSHwidiODq1QrGP1BkuvZ4QQKH4olZpH9FBCCV5ZnNTs6YW
         IAy1GmvptCY7uhYaUECdyoNfov3jMHtWzh4OE4jIpXmrGQciusvI0/hbpNa8R4su1Yas
         3NJj4+DRdnlplFNArgQjfC0tZtPb0y6gfEeWejivsQTHT3Lwu5lPdjbdDCOZTroGVDrX
         URT2TDnwTGQF6xQlQpd+O8Ol6Go00xGDI0rLDixvEVe+e9qfLYMHciUhIo5LHPKixS1j
         PW8+ExZnfxCs6Xxk4KxNREQW0+eXMMmuN9pLuEwqIxJzrKIzEQhsehKSHseVK/ccs6pz
         woIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409949; x=1739014749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU1ijhHw0/QLTZKfCX+dlRClDFtMUmf3s7IoL+8HfDo=;
        b=jNxA3OfTKuB3q+LFA/VC2oS+IUROPCPyqa5GT8Ga1rAx/wUd5SCXsUSgpXHtkELH0M
         RQgE8FQrxhIsRFn+IPPBYUwnZkE7S6MQHtwO5SLm46pJj2SkCpjUS0siAjCvNCXmFXq7
         Hu6bvksAa/dqwfgpd52lzYEPpuD9527mP022FWIvld/bCOPBhNfeJu607yNHjJYkW9jr
         C3He+Rbx4CiVgtTqSod1NUNneelK7imBMRUd8oaenRWl02JEUd7cDGvRvEOFFfjkr/L0
         pkBsNRcJRwqKXTFB+nIgUVKF/TkKEXtbZHPIiePMCBZhdNv25IvVWCQv1Se9h/yOd7K8
         lqQA==
X-Forwarded-Encrypted: i=1; AJvYcCUeWi9sD/lvzJhd4SEIfnkFar94+kbN+45eZp+7wEToxSI4kj7htbxCaKthlKkpVC2DHx75p8/dLzWJ@vger.kernel.org, AJvYcCWOIj3EIWWov2UlPbRkiOYOEe9oMrzfnWQDIJTNHJddI/R17CNEnhL1s12uQXfMzcs9CMZkZMHC4o1t+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2aQ986I71os9blXS6eoBCo4qpnAxXQTOYEU7rKI+Uw3bDZZOZ
	u5aWrcCWXajtMneExLQs302UQmJCLpsVcS3/kEMejzRw0Q0F6u9qCSjy3Q==
X-Gm-Gg: ASbGnct2VxlYsaktp2Qva3hMQHbq8BT3qFvNMZ4FcoUpPg4JJaIXP4jyVaygajCWKNz
	wTYornnizlbLkFhs4AIrwdAlWlpqtl9jAn/pFXRR8e6VpNBuiEWFt+lBKzqj/AjusLOzzi0J16g
	esqI50BivhOpBidFKE808ya+j1LmXZjh743fgdherqRabddk/ydR2TvYgwi79V24z+0VQf/GeP+
	WfSswbCfp7UXzIgZD5wk9KjmFipZV9VeUDx5D5bfhBzVBZYzRF494vmnVghTJPMybECWv9tT6kd
	aI8EQWSHWEZifiaDlhWq0Wa+oBjuWz6Mr6inoVGgflGWwdjvn1DzIyQ4Ahn21g==
X-Google-Smtp-Source: AGHT+IE9FtbzUkgkCBo4Q/idAcPQk2VF8DrsffuGa1117aUQctj+gbBqICVO+/sdpbZOrHSXe38nJg==
X-Received: by 2002:a05:6402:2816:b0:5dc:6c1:8165 with SMTP id 4fb4d7f45d1cf-5dc5e6b10ebmr6433562a12.0.1738409949339;
        Sat, 01 Feb 2025 03:39:09 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:09 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 01/22] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Sat,  1 Feb 2025 12:38:45 +0100
Message-ID: <20250201113906.769162-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Software uses 0 as de-facto infinite lenght on Linux FF apis (SDL),
Linux doesn't actually define anythi as of now, while USB PID defines
NULL (0xffff). Most PID devices do not expect a 0-length effect and
can't interpret it as infinite. This change fixes Force Feedback for
most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..5fe4422bb5ba 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -21,6 +21,7 @@
 #include "usbhid.h"
 
 #define	PID_EFFECTS_MAX		64
+#define	PID_INFINITE		0xffff
 
 /* Report usage table used to put reports into an array */
 
@@ -301,7 +302,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	/* Convert infinite length from Linux API (0)
+	   to PID standard (NULL) if needed */
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? PID_INFINITE : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.48.1


