Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C12A48EFF2
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243146AbiANScg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243050AbiANScc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:32 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3788BC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:32 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l4so7656907wmq.3
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cBfTFoWrKbOrWZZ9T9FRTNRu/mK8t2sxofNFZHrCmc=;
        b=CqMso+/WKJkZW/QUimeNOXpAZ2lCmr0Uxfg1GsSab0TTW56uiqnwtHXIe1vO7UvMoE
         vdNUigvnJqDjt1mkc3Xds7BpPT0JhucXnpNro3wzhoGLH7/YYmthpGiHZshaFaIchtDH
         POx+5xMRBAEAyaYiJuYidoWB13TqBiQsUp601dPiDBRJVqJ5ih9hrIrcz3OduZ7yvBKk
         G9FbkK4MRGS+twY1u4T8fEKAvi4GwrTlOiyr7NCC2m+jDeHsCrvThV1g612Gq5XIVsqu
         fae2IFBCm2aV0ncJ7pJvOa/WDmHZ2QshMul0DdeQOJnFiGW1hQQ2hLK8aooERS4NzXbx
         glNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cBfTFoWrKbOrWZZ9T9FRTNRu/mK8t2sxofNFZHrCmc=;
        b=KCkmofyBUHib0IHWhNi3p3oNdZtkMHDDmNJIAt48V8OPMRR6t10H/eVp/tZgm67G0B
         7xG74xqcaYJwNMOZevbfs6P6/vy7AJ4eOvCSQ4K9/mzrM4bEYzXGUpuMuQlQss+6cMC0
         5haLp7Do/eVk7nsOfQL9kkzXL652IukanYAq77RrFS0ERWnmstZUvHI7yXUtcPl1eZhF
         mBlEZ6ZoJJ+zPUI+TYlTXFbwhC9DODvmvr7hMJcixO3VzC3QU/EnWy5IzFde83CQU1qn
         9hsTAiaGTtZoTW7qy+LSh2g8xW58It7CuqfN3C7kqHQwnl9xWT/ty6l8aeP0GjIVZaS3
         bEQA==
X-Gm-Message-State: AOAM532Myez63O0yg4mIXpGRj6A27ks0xf8GBxL/xEOzmgi+kATxWYg9
        eo9I5zD7Fobw6ARCRQFo+4EgoPh2fAmX9shmvw0=
X-Google-Smtp-Source: ABdhPJy7Ygo+l6lws6cw8Uo5nHSbpaobPdg6Lh0XO5bGEGqVl6rxuR8TjS0s/8EhflFH6puDVqLECw==
X-Received: by 2002:a05:600c:4caa:: with SMTP id g42mr12704671wmp.60.1642185150812;
        Fri, 14 Jan 2022 10:32:30 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:30 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 09/16] HID: input: calculate resolution for pressure
Date:   Fri, 14 Jan 2022 18:31:45 +0000
Message-Id: <20220114183152.1691659-10-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Assume that if the pressure is given in newtons it should be normalized
to grams. If the pressure has no unit do not calculate resolution.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-input.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9dd4a146576a..4917cdf5df27 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -258,6 +258,19 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
 		}
 		break;
 
+	case ABS_PRESSURE:
+	case ABS_MT_PRESSURE:
+		if (field->unit == HID_UNIT_NEWTON) {
+			/* Convert to grams, 1 newton is 101.97 grams */
+			prev = physical_extents;
+			physical_extents *= 10197;
+			if (physical_extents < prev)
+				return 0;
+			unit_exponent -= 2;
+		} else if (field->unit != HID_UNIT_GRAM) {
+			return 0;
+		}
+		break;
 	default:
 		return 0;
 	}
-- 
2.34.1.703.g22d0c6ccf7-goog

