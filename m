Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570042DFDDF
	for <lists+linux-input@lfdr.de>; Mon, 21 Dec 2020 17:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgLUQDC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 11:03:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38089 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725807AbgLUQDB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 11:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608566495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2LYKHmksZ4OUxTuW+GqEvu3J6NNsLg0tPod120hM9DQ=;
        b=BOor04s+9n6ulCxWEhxBvozBNir++H/kxjSes5fNr9l0qGlkx+pmk0CK80dAAM85emU6xM
        5adIdPK/z9CiFarvwADb8zitwewnbpcOdMdlc33gmjJiV0ePVJwuqI7SQGTVObUpNV/ceG
        tM+7+9AmowPWFsDTBTHygEIvTQa0O+I=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-jP5gGdzmMjmLuwSvkDvfgQ-1; Mon, 21 Dec 2020 11:01:33 -0500
X-MC-Unique: jP5gGdzmMjmLuwSvkDvfgQ-1
Received: by mail-ot1-f70.google.com with SMTP id l37so5253891ota.1
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 08:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LYKHmksZ4OUxTuW+GqEvu3J6NNsLg0tPod120hM9DQ=;
        b=ZQI2BsgBe//6anED89467mqdJCJhJU1AZ3uxC01zMMbsOgPliZc5qCsj6MmoyEu2Xs
         Ke6liFaOc3InOvdSHRAyG9yj8Y8yYAozNoMbEjDHjSCi4Z82Y2/YvsosAQV6gOLqeqMz
         1tcy/NCJp0Im19jsa/SFvqWYfgfOd2GWObHMmvB/DeBuIGzkA/kmty6hfU4kjOHCFNQM
         qyNrxEErWdpEXu2xT5WyZX2FshnsOPKy/keMPoD0wulaii/4YQQYY8rb7lnj/xRfmH4e
         tQMDQ/YQBu2ZlKzm4YdIimu3JbqD/eN0HTrBoKlfyp2sflNVLoNL0BxYSiETVrG7TsnS
         CA8w==
X-Gm-Message-State: AOAM5331Emp04M1msxGtOQcP3QHGFRwGlyioQvkY2dJIjf/096+0MQMs
        1KpFOqTfHuFCezg5uB/rczhE3On6McWLeEEmWYQH1PEr8d5rFofuxR5beAadg8LbgVxfHb6hT27
        sz31SdS4KPjA/s0XiU8r90QM=
X-Received: by 2002:a54:479a:: with SMTP id o26mr11487901oic.48.1608566492536;
        Mon, 21 Dec 2020 08:01:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1dYe/JKq38wPEPorrGJxGJSjFQLly3DC/w1ANAcNmh8suodro6w8rNwBdoB4pr/mjnn4ECA==
X-Received: by 2002:a54:479a:: with SMTP id o26mr11487892oic.48.1608566492423;
        Mon, 21 Dec 2020 08:01:32 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id n16sm3883212oop.9.2020.12.21.08.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:01:31 -0800 (PST)
From:   trix@redhat.com
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] Input: add printf attribute to log function
Date:   Mon, 21 Dec 2020 08:01:26 -0800
Message-Id: <20201221160126.3752467-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Attributing the function allows the compiler to more thoroughly
check the use of the function with -Wformat and similar flags.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/input/rmi4/rmi_bus.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/rmi4/rmi_bus.h b/drivers/input/rmi4/rmi_bus.h
index 25df6320f9f1..62a93d7d98f8 100644
--- a/drivers/input/rmi4/rmi_bus.h
+++ b/drivers/input/rmi4/rmi_bus.h
@@ -195,5 +195,6 @@ int rmi_of_property_read_u32(struct device *dev, u32 *result,
 #define RMI_DEBUG_FN			BIT(2)
 #define RMI_DEBUG_2D_SENSOR		BIT(3)
 
+__printf(3, 4)
 void rmi_dbg(int flags, struct device *dev, const char *fmt, ...);
 #endif
-- 
2.27.0

