Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C127C47C75D
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241748AbhLUTRz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTRy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:54 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA96C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:54 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 203-20020a1c01d4000000b00345bf98da86so1161845wmb.3
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IEKdHvS3R1CuQNg6dXHvgBGNaaT106e2VaSGqBlDdrQ=;
        b=Zzhmtw1oYWgp24QKj8JQV+cno+Gr+7Vg++EK0uDApRWJjBxLvtBANNWWEiCxgSjlU4
         OxnI4N7HBIAYmdJQxKKjAdFth9Dy2B64tuB4aYDx1kOpmzIG6vVg8ygdUwE4pbW0d5Wc
         atCgve9lVP/6ONPNKlsP136YSMp2S7JsxhiUfvDG7nV1lTlZ7mKsC+4eoMawBpAzT5UK
         sbAY+7P+ZpEOXiCYc9AX0LOA+qmFDfS+a2HoQwAYrMcM9iIPKXuFULvNO8izCOOJ/MDw
         NlBi6h2Bz8QeiaNuM8K0RezTxj+JaHfSeqvf3px5br3/GDNHVK3ZTGExo2HaVfel0Jmo
         AGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IEKdHvS3R1CuQNg6dXHvgBGNaaT106e2VaSGqBlDdrQ=;
        b=TRRL2yek3/8FdtKs8Qlkp0twIFDdW4Bd1yVJdyUJbnxYx0kbarC2qO25n2HsBZrNfF
         exAf6mrs5/X2jYVXpxmtuLSUEYtL8seVYQmSzUh7HyBydUoATOm+T8h4K4eaEfdgOBYE
         +Dh38R8T9J8lsKoi215bOQi+Qo/56hPXYb1Ip+6dQHMMbNHpGgFdg6Xr93foYPKBail3
         WQNwOBGsHJj5wmRdFgW67gORgLN5yQs/5bZBcR3ISSik6YdjYXis+J8eJkBt4XgLV9pO
         sNhvJdu9EU/YA6bI+iBzBtTlu0kNC9fsaWMr/oD0ChMEvwLmdeyxPMO3vaVLX9Racwn6
         rA/g==
X-Gm-Message-State: AOAM532qNVzDRRy2oqaCgwrnZ82nHYp5ddsnT+pEeJTdRmBxQphi7yqW
        rXBSVWVvmGG8Wk15DklELv5X9PDa/v+N7sD9VU0=
X-Google-Smtp-Source: ABdhPJyffexhJzp2fjaOWx3XKP26SmEALIOqY9EeqsY7wSDuXc/IsGZrRUi6GDrZkNyGDmngC3y4WA==
X-Received: by 2002:a1c:f608:: with SMTP id w8mr4156435wmc.50.1640114273191;
        Tue, 21 Dec 2021 11:17:53 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:52 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 11/18] HID: input: calculate resolution for pressure
Date:   Tue, 21 Dec 2021 19:17:36 +0000
Message-Id: <20211221191743.1893185-12-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
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
index 81eb277dee91..b680641a30c0 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -257,6 +257,19 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
 		}
 		break;
 
+	case ABS_PRESSURE:
+	case ABS_MT_PRESSURE:
+		if (field->unit == 0xe111) {		/* If newtons */
+			/* Convert to grams */
+			prev = physical_extents;
+			physical_extents *= 10197;
+			if (physical_extents < prev)
+				return 0;
+			unit_exponent -= 2;
+		} else if (field->unit != 0x101) {	/* If not grams */
+			return 0;
+		}
+		break;
 	default:
 		return 0;
 	}
-- 
2.34.1.307.g9b7440fafd-goog

