Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6D3481774
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 00:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbhL2XLt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Dec 2021 18:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhL2XLs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Dec 2021 18:11:48 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB303C061574
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:48 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id b22so19766950pfb.5
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TU3SXYPGHkZwAGgoAUbnOzsERn3Da3EDEy4rF+dH45Y=;
        b=GRY6dq0VO7x4fit/vG117y01KZVn6yOzORJG/aKvYnOEyO+VsQgZ1rrKZVkFIjxZaV
         utAGc+AGUWe90KpKzJax73p2ZDC66WFW3r83oQ3Mvm/ExhO3DWc8regl64czaPo7VPRn
         vPGYyjKTqndTf4bQa8ZYgAcDqKHMdqpzjGN49epu0wzRKy/1dbnizaQZ25SsxhXAri9J
         Em8fMgQ43hn/sJS1b7b1ixpgfya1/3kRmyIvYXo74G13yFHNV9rQHeCrM3UActOpGeOc
         fiNgvB6lbSm71w2AhBlGsO1AqUAy1ZQTcBQIuZZf9Wi4C7a1bATzl8gRs/bSCwnRKeTN
         S+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TU3SXYPGHkZwAGgoAUbnOzsERn3Da3EDEy4rF+dH45Y=;
        b=8BROwZtoBXfUHoDQxzjDGk5SOtjPyOUbc8UlQWMnvJz/qlr+RHViHqUQDog9DM78a3
         7Un9OfgtuYDwBlraFMzdroHnLuGa8GC2gJgPdC83eSoUFDWInMU283zlYb7OcqSnJOgn
         g+sAWX8fg2gsJQq6OmDMjDtME8LzKLSx8cpqqd/zNSXMs+fLg+K9p2DBNw1Sozq4mVEx
         aRfEtIJLp+cKd3kKfTWb2wQAHcUMXnge8FSLZ7N5yy6Jm0tp/rWPFSnrW9t/Q8wNpLdk
         dYZ+m6XZrGgwgSikFnexM5YPqIFVRcfggio2J0OavhcRw3AW52SUi6gHqSkTGu8X/vDv
         2f8Q==
X-Gm-Message-State: AOAM530wunKtWQbRLL74MtrHrPg81BayBg3NsaiRwyPHUvDCP4xE1/gr
        PG6i1tQzwq+Hr14WsSVE0pI=
X-Google-Smtp-Source: ABdhPJwYu+yvnTATsaxru5KvaiewNlxdua3O6hsQ81LbMnfQLrSlip/5fD9OcuNMfIUi/h86s7y36w==
X-Received: by 2002:a63:7408:: with SMTP id p8mr20357172pgc.73.1640819508197;
        Wed, 29 Dec 2021 15:11:48 -0800 (PST)
Received: from thelio.corp.microsoft.com ([2001:4898:80e8:36:99f0:adae:413c:2890])
        by smtp.gmail.com with ESMTPSA id k6sm26058042pff.106.2021.12.29.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 15:11:47 -0800 (PST)
From:   Dmitry Antipov <daantipov@gmail.com>
X-Google-Original-From: Dmitry Antipov <dmanti@microsoft.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Subject: [PATCH v1 2/5] HID: define HID_SPI_DEVICE macro in hid.h
Date:   Wed, 29 Dec 2021 15:11:38 -0800
Message-Id: <20211229231141.303919-3-dmanti@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229231141.303919-1-dmanti@microsoft.com>
References: <20211229231141.303919-1-dmanti@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
---
 include/linux/hid.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index f453be385bd4..1f134c8f8972 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -684,6 +684,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)
-- 
2.25.1

