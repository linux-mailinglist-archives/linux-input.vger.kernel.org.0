Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47EF48EFEE
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243074AbiANSca (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243079AbiANSc2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:28 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061A2C06161C
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:28 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id d187-20020a1c1dc4000000b003474b4b7ebcso7228898wmd.5
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CC3fg4tLPbBqyg9QQ9rodaBfRAw+nKJ9yBWklaxbIJ8=;
        b=yL56HZREeP5piwVRAutc0USqp6uguNrvllYOvMvFkfw7Yx6IOdDhq3EOfUP1nDGanK
         sFh6b5+6n+09yA/xcqiZDVf6X19LeQgtK+nYG0BIlEX8uZhEex6wfIe5BhEAmDroviVW
         2uhC5kuN6EC/h/+7mLqqJkD+je7d4opNAQXTDolzWbDdnsd08BdZlo0kItYZyhW2k8Wg
         xzgYqLxqjM+Lm5kqIFdNe5/c+d9+Q1Ow4D8KAX/9IbMK8qGqoixBnWPBlOuCTmwjbmvG
         wH7STa7+5z2U46rNfJKVXyle4HInMgfM6crM2EWF/JVCMyhYjvn5YRQy6okx2bk2swSH
         GIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CC3fg4tLPbBqyg9QQ9rodaBfRAw+nKJ9yBWklaxbIJ8=;
        b=8BUVCH7MKwP76uDgb66erzmaOKZvNmB5QtWnJPHthnd7gNPLY4u3xHH2MoCXIU/E+S
         EVeETfuvywVH4Zr3N2eHh9CGzd+LW4yyOjg88UcVSYHl4z+69grTKkuOHTXoguEgGb4k
         8431ySyWu83S/OlTLtwpnBnDYIDsEBEkrzkupUnEumxio93x3O1DDchjySNg/+lg0jC8
         bk2okPqpU3PCTh8X951JvA5snlz8wAmmmNy/mnXN2C7MwsAsYt6bV6V7LYh0YXPw1nt7
         o6EkdI9fCXcvOgWUtqfK8YQL4NE8qlQteYzllpAPrVF7rHQUMFr9oyfykHEnsXPlLX9w
         8rbQ==
X-Gm-Message-State: AOAM532VXSFhIY95EzBusKMKJYpO+KBGqPrWED149tENT9cXuDW9jalg
        AtqLXwGu95QqXhMEXOWQDuza8KqGyabTQmOa60s=
X-Google-Smtp-Source: ABdhPJxORal5+LDne3fPR6Hsj8VAWGtv8FRkPOJ3SS6b9gOMj+b+hBcp1h2U5eY2VWLmB3YepAcvjA==
X-Received: by 2002:a05:600c:4f13:: with SMTP id l19mr16546258wmq.152.1642185146657;
        Fri, 14 Jan 2022 10:32:26 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:26 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 05/16] HID: input: allow mapping of haptic output
Date:   Fri, 14 Jan 2022 18:31:41 +0000
Message-Id: <20220114183152.1691659-6-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change makes it possible to parse output reports by input mapping
functions by HID drivers.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 1ce75e8b49d5..9dd4a146576a 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -600,9 +600,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (field->report_count < 1)
 		goto ignore;
 
-	/* only LED usages are supported in output fields */
+	/* only LED and HAPTIC usages are supported in output fields */
 	if (field->report_type == HID_OUTPUT_REPORT &&
-			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
 		goto ignore;
 	}
 
-- 
2.34.1.703.g22d0c6ccf7-goog

