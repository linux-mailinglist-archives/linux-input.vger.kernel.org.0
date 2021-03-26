Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A1134A9FE
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhCZOf5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhCZOfU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F74C0613B3
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x13so5846236wrs.9
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QyPG1WEqZFTBuDaWcANV4HkcWu30kB5AaRBOC44dMcU=;
        b=SnsafZq5e1+1/iZIm3WR65o+iG0/ODTGJk/7ETvhgN7CEu5HRWnJNdVg40nfYqWfbO
         UrEREZCk+q7udUP3bSU6brrWo0DOtTSI3CB7EiYpN7gXdmEQcOckMpy98SbOeP3fhTgr
         trT8s1skyIzCkbNsKuVRNWDT7iRn2yQlM1ci7v5Os1fDRxy7vdC+plqlnzyIRaik7+RT
         4xpRSsPSu0x+pBNYHgzwq9UqGThUsue8SOorkldDqqlMvWOgRYoWeyT6Chmu5UpbBFs0
         0Zwt3zL3d5AtE3n/fveorFHLgLuj2uawCORzzBqxKqvgx5bom7hWgYbrCOUIg5c8XKih
         BU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QyPG1WEqZFTBuDaWcANV4HkcWu30kB5AaRBOC44dMcU=;
        b=UiWTU+FPvpkhaUk9BZNSR6Z889X2LDgWqFZMnCqUX3op4za3aJaKHT/TvARmgeDA05
         VOXhqw58nXvciBLgacj4CBsNYvpTODGcPpPla9DiXM/uK6gQ6XaD8bKgeXJQG/uQVYVh
         zkszRVaNaFzjkp+T2du2isVO7szxRwF/LB9jhgyAKEsm1cqRrNrUtwFTUmruWb9uUg64
         qOA/UqsOtR3xebK4ooF8/X0CggpvHvAjPsX41tEZHhT2WZiMRcTi3gw6D7h9Q1YAMSnK
         4ZMucMtoRTJnn5Rabiu9ixjo+hQsG9W0OtNs2Nvd5+g5eCuBoNeMKLr8wwwmXsYBWrxJ
         3nPA==
X-Gm-Message-State: AOAM532Z3N1Yzhx1WE7j6JEyRV4qrYb/d36fVmZUqTeWDsssBpmiXAoV
        UB1zo28LWA03pzx1RH5vdk025w==
X-Google-Smtp-Source: ABdhPJwOUj3cYauEQvI4kOqQkvYnSogsSqs1r7Xq61RvYSr9UXt0UirtesVDyK9o5Z5ECViF7WsNeg==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr15089412wrp.112.1616769318787;
        Fri, 26 Mar 2021 07:35:18 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:18 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 17/25] HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
Date:   Fri, 26 Mar 2021 14:34:50 +0000
Message-Id: <20210326143458.508959-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-uclogic-rdesc.c:645: warning: wrong kernel-doc identifier on line:

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-uclogic-rdesc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index bf5da6de7bba9..6dd6dcd09c8bc 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -641,7 +641,7 @@ const __u8 uclogic_rdesc_pen_v2_template_arr[] = {
 const size_t uclogic_rdesc_pen_v2_template_size =
 			sizeof(uclogic_rdesc_pen_v2_template_arr);
 
-/**
+/*
  * Expand to the contents of a generic buttonpad report descriptor.
  *
  * @_padding:	Padding from the end of button bits at bit 44, until
-- 
2.27.0

