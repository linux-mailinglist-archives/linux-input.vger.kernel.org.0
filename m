Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFAF1DE292
	for <lists+linux-input@lfdr.de>; Fri, 22 May 2020 11:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbgEVJGu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 May 2020 05:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgEVJGu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 May 2020 05:06:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0139DC061A0E
        for <linux-input@vger.kernel.org>; Fri, 22 May 2020 02:06:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w19so4140669ply.11
        for <linux-input@vger.kernel.org>; Fri, 22 May 2020 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uqfZ4RULmtest8H4HaSo5YeJQVat8RjBXZCj1ABzJpY=;
        b=SYaSqPGs/czWSgzDRbwSLSbadPva9n0mGvWS82VzzB83r6+h++mW0XPKr/0dczUfh8
         4NBf/S5b6gCvkn9425i7ja64Sq+oqa0/ieE/BHIs+o4js500/KaS0uW4ZcrHxDwSw1c8
         WYMWedMij8XSgc0GaxL5okvpD9SpR6xVIJaRBXX0eAKnHu1Zeoh74w3KQ1aUHg1Ll2pM
         EHkKPjxAMEOodVqlRnTOgytoJpLTiL5fEMYIim8z2QYCqSJrjcaA17gqV3WtS5Y9rmnd
         SNE4Mr0Z+G70rRXPSAmn8fhbpNh+hxmT08S4kCc1pRrY88AbHww0Pd2Y7Hm4XwtgyEok
         b+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uqfZ4RULmtest8H4HaSo5YeJQVat8RjBXZCj1ABzJpY=;
        b=NGb41Q37fXFInHx5KlDUC6P2Emm1lEaG8L1txEBDD+cLrR2+tx3tKuuaEebXHlMv0Z
         R5zRqneecUHNqhranbF198Mkx0J1qsWNUnKuuc4NXPku9wKVyC91vK+A3JzGoFKFzXOi
         thhvCivlEPO9Adx9PSuWR3ATdxiHRIKbpegfKbP94oHICNVAFHO6VH7G2vIVYf3hV3gK
         THJ95+voIQaD3qRSyvnhEqz64uUDFq6/XxVbSF/LLKuzfq7iUfmVqB+XCAsZwBKkRnEG
         aFafNdtLN1DlR8FzmNWiesY5c85eGKXJJVSabwps1BVYM6OnRBY9plE7FEOIVtcKyzgx
         H3tA==
X-Gm-Message-State: AOAM5315VEFwzUnTWL1IFd509NraBbVAXpFE5rlR2V4zgiGYzR8K1U3B
        jxDbFcCOukWLJhmIN7T/jlg=
X-Google-Smtp-Source: ABdhPJz2rs1/b9cZ6qK+TOSeQJ+3UiLfxPmOTZUWdhsIdiiCOmyEZF7BUybw9ZSB9KtPWk9084XL0A==
X-Received: by 2002:a17:902:8b86:: with SMTP id ay6mr13318859plb.338.1590138409393;
        Fri, 22 May 2020 02:06:49 -0700 (PDT)
Received: from localhost.localdomain ([128.1.231.46])
        by smtp.googlemail.com with ESMTPSA id f64sm6680289pjd.5.2020.05.22.02.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 02:06:48 -0700 (PDT)
From:   Caiyuan Xie <shirleyxcy@gmail.com>
X-Google-Original-From: Caiyuan Xie <Shirleyxcy@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Caiyuan Xie <caiyuan.xie@cn.alps.com>
Subject: [PATCH] support other device which report id is 2
Date:   Fri, 22 May 2020 05:06:10 -0400
Message-Id: <20200522090610.5856-1-Shirleyxcy@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Caiyuan Xie <caiyuan.xie@cn.alps.com>

<Change list>
-support other device which report id is 2.


Signed-off-by: Caiyuan Xie <caiyuan.xie@cn.alps.com>
---
 drivers/hid/hid-alps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index b2ad319a74b9..d33f5abc8f64 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -25,6 +25,7 @@
 
 #define U1_MOUSE_REPORT_ID			0x01 /* Mouse data ReportID */
 #define U1_ABSOLUTE_REPORT_ID		0x03 /* Absolute data ReportID */
+#define U1_ABSOLUTE_REPORT_ID_SECD  0x02 /* FW-PTP Absolute data ReportID */
 #define U1_FEATURE_REPORT_ID		0x05 /* Feature ReportID */
 #define U1_SP_ABSOLUTE_REPORT_ID	0x06 /* Feature ReportID */
 
@@ -368,6 +369,7 @@ static int u1_raw_event(struct alps_dev *hdata, u8 *data, int size)
 	case U1_FEATURE_REPORT_ID:
 		break;
 	case U1_ABSOLUTE_REPORT_ID:
+	case U1_ABSOLUTE_REPORT_ID_SECD:
 		for (i = 0; i < hdata->max_fingers; i++) {
 			u8 *contact = &data[i * 5];
 
-- 
2.17.1

