Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94434347F7D
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237207AbhCXReo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237260AbhCXRe1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:27 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5758C0613E8
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:23 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u21so16273792ejo.13
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KfriQXFxUvhVGCpwETjq8GWLI1DKoZwsNAe/TYwrv1c=;
        b=IuGQSm9ZOkoRlOIJfQSFYzPFECEl3x3bg7hp3Q5AREVd+EhDLiDTCzl2LNWOSMW30t
         gx1htkH4xis3A44H8pUUpnay3+rlpTBlKtCh3NE8lTwvZy7EuPtNttqsXCST9o0h9r+0
         5dC86DEnkcg1dIS8CHteR8/fT7nEKESUvlW439cTYEZ2I8GLcKsH3Mcm5k8OgKJhCYW6
         YKU/oAT7O44FCeD3Z/3QAkAMP0K7rxLecHNpg/nYyUulnOGCphHyJ4UOVCDzi1cKEp4W
         WTb5DoBfYnd6c7WDaOUJOUPZ7zNsfYOKZ5Fd5ytilNiEPZDC7tlVwXyIt4wbPMG14DIS
         GQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfriQXFxUvhVGCpwETjq8GWLI1DKoZwsNAe/TYwrv1c=;
        b=PGzRr+oVT9EIy02viQPqhVaAw4GfO5VHR0yAFyGBw7kz4ZYzsVPe4w9LF01sYpyBp9
         fe9F6DNMQsQmo+SQaL+wpOdF7+HcNim1K4eXFgXqMODPbVvM+szUqPhKf662RwTY2esX
         VN1wv+gz+c3ctTjvj4pDeNNYkaiJgpfaKnr67OeRGstqfPX3wVBLepzDpXB779iBHFT3
         /p1+ALhF4wFEeFmAkBWIH7UT9J9MpKn3AUk2qN9b1yfgw3A94Mq1UVLgR4r2/+9go/xa
         +fFreZDyVsWu4E3uwmDu7UhgaLlA88sIMI8lQY71w7uv5W/wWIqZjo9d2KhobOoN5ZCr
         emCA==
X-Gm-Message-State: AOAM533mLdZ2qwBPLXFBpEZTRWvOIKXQJHaAQxgPZ+3YFMojFwMUxpW8
        y8CDdqfDyhNYhcwJM8lVoaYsqg==
X-Google-Smtp-Source: ABdhPJzFIus/MG+W6lLos8k0at8stD86NQsJlQa6l9bHKFEG9wvE4jSPSwAB86c7XlEyc1bfasMciA==
X-Received: by 2002:a17:906:b4c:: with SMTP id v12mr4966203ejg.330.1616607262431;
        Wed, 24 Mar 2021 10:34:22 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:22 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 14/25] HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
Date:   Wed, 24 Mar 2021 17:33:53 +0000
Message-Id: <20210324173404.66340-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-kye.c:666: warning: expecting prototype for Enable fully(). Prototype was for kye_tablet_enable() instead

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-kye.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
index c8b40c07eca69..f46616390a984 100644
--- a/drivers/hid/hid-kye.c
+++ b/drivers/hid/hid-kye.c
@@ -655,7 +655,7 @@ static __u8 *kye_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 }
 
 /**
- * Enable fully-functional tablet mode by setting a special feature report.
+ * kye_tablet_enable() - Enable fully-functional tablet mode by setting a special feature report.
  *
  * @hdev:	HID device
  *
-- 
2.27.0

