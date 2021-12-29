Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828D9481773
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 00:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhL2XLs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Dec 2021 18:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhL2XLs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Dec 2021 18:11:48 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB893C061574
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:47 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id o63-20020a17090a0a4500b001b1c2db8145so25963844pjo.5
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gK3QhbqsrCSB4ia/eFNGHJP5DFriGyiBNNm22UgD4nc=;
        b=J4GZCnpblUiazrPbyn8HGytYVysfnebPlVEAdvjYROIsEBTL4Uw5o/D1VxVCi2lqHt
         5JWY9aSpM3DNZdLzcZe6H+g2/5ztUV5659PrU3QXO0BHU8tWSKPcSSYl40KXiwyMruQ8
         WMqozDBXGKkA4D/JStpbn3X2My71X5Q8aFoQwoJEFvi7YQqljlP4MCNRNZucQmY0REV9
         mKuhvwjj752B9/h1cyYinu5XPPArWLqPaZOodx+lbg1Wg23J2G0UyuivjMhsTymz9bBH
         BWl/dNexr3Bm4cA4fl7jJNsSVAHrZjY+PftRzwxAHd4zUERm5qPc46fIIyc1frLdr5d3
         vLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gK3QhbqsrCSB4ia/eFNGHJP5DFriGyiBNNm22UgD4nc=;
        b=I/AfIQnGS5SUqZYGOfVdsffpA/4zv5j0kgW7AaTG62L35CgPKBGV8U6u806Z0WbnxH
         AMyTCiTnx1X+FXOtmi3M3emRCR34u0huVPQI+g7GNQlO5o89hBD7F5SuDc7518OqlV1u
         88lU28Cyk4zBdNY0IA1cldf1BUiJYAwICnV0bGnbJqEIvofuUnHBqWh1oPdpnmqgaAup
         OPGN+58K/QMGZPNMqvu46qteNNws82sgL2KTtx2RbpnKNK8Ftm26GjFPDJUgkTNkFFAI
         ozMHMAT+jWievDC2LAG3UWUKZ1o0zpyIFksbOXMAYlbfEQ6jrD8ZWBlOxfHTczrsfVrD
         OVhA==
X-Gm-Message-State: AOAM530IjnHZON1bcrku+X7UePcNW5Qb6NupDhFza9/Gy29FCVJbKxMb
        VogVMLY5LOklvIVLHpSebCQ=
X-Google-Smtp-Source: ABdhPJzHoVvBfLhkVcGvKGdzUBXa8lDOCueAbAcIMowl3uXpQV/Tjb0tJyQ3M0xsiiJjG3eeIbSPaw==
X-Received: by 2002:a17:90b:38c9:: with SMTP id nn9mr34918725pjb.153.1640819507161;
        Wed, 29 Dec 2021 15:11:47 -0800 (PST)
Received: from thelio.corp.microsoft.com ([2001:4898:80e8:36:99f0:adae:413c:2890])
        by smtp.gmail.com with ESMTPSA id k6sm26058042pff.106.2021.12.29.15.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 15:11:46 -0800 (PST)
From:   Dmitry Antipov <daantipov@gmail.com>
X-Google-Original-From: Dmitry Antipov <dmanti@microsoft.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Subject: [PATCH v1 1/5] HID: Add BUS_SPI support when printing out device info in hid_connect()
Date:   Wed, 29 Dec 2021 15:11:37 -0800
Message-Id: <20211229231141.303919-2-dmanti@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229231141.303919-1-dmanti@microsoft.com>
References: <20211229231141.303919-1-dmanti@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
---
 drivers/hid/hid-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index dbed2524fd47..65350ad985fe 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_VIRTUAL:
 		bus = "VIRTUAL";
 		break;
-- 
2.25.1

