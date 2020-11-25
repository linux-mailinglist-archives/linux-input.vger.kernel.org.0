Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B092C4AC8
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbgKYWXe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729679AbgKYWXe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:23:34 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E10C0617A7
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:23:34 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id q10so3702750pfn.0
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwRoSjYTx8qjVrju1TPtert3dlabIuq2tVGa6YGreUM=;
        b=uZRkDTO8PdyDQUTdfOFppUL3wG+O8hqlxr/vFW75pzkH6cwZ2ZqU87WfzXD7Y9qDBZ
         0lcoftaZsZhw/FA9v7eLfNJaOHjnE7WZLh4CBpiIh09P7A++QjPjmJWZI4QV5xUvuR9Z
         LoN1tbYlhGcyMSSnwUV8tsbi7PljlgPYi8dY8mhSF6fURZUPCNjs/6JFqaMHQ1xpRfvA
         HhYgnsGx6txotIfWytTs2FfToVTL3ecROFpY2JU1A7ADKAoZdU6h3t3xkAYdaHGozn1F
         vyy40lED8mZEGxHCIR1DFrV/Eq/XTsc9A7qIxr34QtQ8Oj8NsHyba+koeA5sSv3xxzWS
         Zd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwRoSjYTx8qjVrju1TPtert3dlabIuq2tVGa6YGreUM=;
        b=K4UhuWQKoh54Yysv67PK4EBbZOLnO5GHXn+NFilm06SFaHNPCt2NB6GetczJrdtrHz
         FC8imgdoTQ4dYCgj0oyDl37WJNXOM+54K25UlbEXZsE4HKKwRP/ainvfTlhuZcIJOVr4
         E3CoRfVfIWUFPapzSpI3Tt9LCY+AlTOhOwsZFLqhA0N9d+QuKphODxFp0p0CApKpWQAy
         URZSNpzWRmKsZMbGbJyOI/Sj0NEb8sZ7Td5zhDNS5QnFbvp1ELzXXfIdVNoabVhiB36Q
         nrAESg2GhkvTMjpVwVW0eT8WfnyWht8S9A/kYO9v4wVMe7dKv/Hluy/qsvkYdnGASwNZ
         EJ8A==
X-Gm-Message-State: AOAM532QpWQqYuIXZuTU2zPc5OdVcC6cQBh3U7/Sw2OdzwdV5bE872mW
        dxoUnFidwjdougOMTw2ergailEfR+/sXUg0j
X-Google-Smtp-Source: ABdhPJzypH4caRVk4Cbh5VKqgh41lqv8bzNEbunCZ8svYsTm2B9jG4yP/xcrn1f6H65fu1j0rgrVIA==
X-Received: by 2002:a62:d11b:0:b029:18b:b3e:95aa with SMTP id z27-20020a62d11b0000b029018b0b3e95aamr59045pfg.3.1606343013304;
        Wed, 25 Nov 2020 14:23:33 -0800 (PST)
Received: from localhost.localdomain (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.googlemail.com with ESMTPSA id m11sm2917182pfa.24.2020.11.25.14.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 14:23:32 -0800 (PST)
From:   Dean Camera <dean@fourwalledcubicle.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Dean Camera <dean@fourwalledcubicle.com>
Subject: [V2, PATCH] Increase HID maximum packet size to 16KB.
Date:   Thu, 26 Nov 2020 09:22:23 +1100
Message-Id: <20201125222223.4578-1-dean@fourwalledcubicle.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 58684657960b..2faa7aba67ed 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -494,7 +494,7 @@ struct hid_report_enum {
 };
 
 #define HID_MIN_BUFFER_SIZE	64		/* make sure there is at least a packet size of space */
-#define HID_MAX_BUFFER_SIZE	8192		/* 8kb */
+#define HID_MAX_BUFFER_SIZE	16384		/* 16kb */
 #define HID_CONTROL_FIFO_SIZE	256		/* to init devices with >100 reports */
 #define HID_OUTPUT_FIFO_SIZE	64
 
-- 
2.25.1

