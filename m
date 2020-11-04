Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB1A2A698D
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731128AbgKDQZ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730976AbgKDQZD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:25:03 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8E8C0401C3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:59 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id n15so22750933wrq.2
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=msuLefrZcEgx331/KYpWGgm3TBHNpr52u7dLtV0zqps=;
        b=wfZOJTrnJLcGlYWEG9B+GhDqsHkblvuFsfWhIGXyFjshWYHWR4vtXpsCVcTSbmVkAt
         oxZ4bOxM0fIV8AbbwoIkF1EnPmnlgGZYsQS5pID2zK7Tabthi6BONKDAbjiuNUy2eYal
         NMr6y+NvM+aeRXDTHIfFQRC2JqjikLBItk8Fr9UBD/3PloBYg7qMTloSAkweE+wDx3ak
         dcl9jOKsDuFTjE5uvUBCL4HfzV+K/V0Sy1c/Peh9K060HUY3KJ85bnTI5sjEpa4sCvoq
         ovgD+NsiBwUCq3HGH7W4sKf7tsfAsOrvdrWeyN4eKNB2Ff8X7EwtQ2hjfnJuslsGgnEr
         7aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=msuLefrZcEgx331/KYpWGgm3TBHNpr52u7dLtV0zqps=;
        b=DIm5rcSiaWIwUkAITOFz3BSsBqnU7UIIS5Bc9ALmIsfY73xdGvYkXFozEo5CKR/S9j
         Eqzb5Zviyw6vlcq0IZA+qU17Zwh7gboNXxJwJI0tbUelG4XcmaphicI6QB7HKb0ipc8q
         aChShjFwFzIScfCTIkWKnutvLufYQ8VuSzRvlu7mzeoxrjeT6SaZPh+jG7qcXpp01yY0
         uEBFUzs36ao4PmazI2ZQ6ic1Ppj23GbER2nvBKPXSmeV7MzLIFbaofHBvbsUQBmLyDVl
         NWEhUiHmIwSN4muWG0yHbhNbeVaM1CBWWoLy0fpE4kFwzA6o6u9H9DOTi8Gl3dvnmhXq
         VTBQ==
X-Gm-Message-State: AOAM532dH8avseCL4HJMwqgxzbfPkPE2UTlC9ff+xfL5HWuj0YDFNlOS
        GOQP5UHeBS9vb85zrRDKZOYyOPpnGZPcRrs6
X-Google-Smtp-Source: ABdhPJyHBpgiYezebevIEOeTys2mcAT0d8aCDxyMKil5oGa56dkB4VMa0DUUUu9MiJzU6eU3OB8/Cw==
X-Received: by 2002:a5d:6ca8:: with SMTP id a8mr18741943wra.319.1604507098189;
        Wed, 04 Nov 2020 08:24:58 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:57 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 13/20] input: rmi4: rmi_f54: Provide some missing 'REPORT_TYPE' enums
Date:   Wed,  4 Nov 2020 16:24:20 +0000
Message-Id: <20201104162427.2984742-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/rmi4/rmi_f54.c:77: warning: Enum value 'F54_REPORT_NONE' not described in enum 'rmi_f54_report_type'
 drivers/input/rmi4/rmi_f54.c:77: warning: Enum value 'F54_MAX_REPORT_TYPE' not described in enum 'rmi_f54_report_type'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/rmi4/rmi_f54.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 6b23e679606ee..93b328c796c64 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -42,6 +42,8 @@
 /**
  * enum rmi_f54_report_type - RMI4 F54 report types
  *
+ * @F54_REPORT_NONE:	No Image Report.
+ *
  * @F54_8BIT_IMAGE:	Normalized 8-Bit Image Report. The capacitance variance
  *			from baseline for each pixel.
  *
@@ -64,6 +66,10 @@
  *			Report. Set Low reference to its minimum value and high
  *			references to its maximum value, then report the raw
  *			capacitance for each pixel.
+ *
+ * @F54_MAX_REPORT_TYPE:
+ *			Maximum number of Report Types.  Used for sanity
+ *			checking.
  */
 enum rmi_f54_report_type {
 	F54_REPORT_NONE = 0,
-- 
2.25.1

