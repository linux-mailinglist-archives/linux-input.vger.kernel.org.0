Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E36371B4A
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 18:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhECQpb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 12:45:31 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:35676 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbhECQmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 May 2021 12:42:05 -0400
Received: by mail-wr1-f52.google.com with SMTP id a4so6281618wrr.2
        for <linux-input@vger.kernel.org>; Mon, 03 May 2021 09:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovet4owPL+K3X6hnnP7r+htVPMhu5C1cscSUjmRZ0Bw=;
        b=psftVSClKPY529uJJVEaZJgmOJaoLo1cIAIPiFImqYNcU7B8edwNeMNxk19BpW9m/x
         Ep9ryepc3DJLUJj+fuv7WcywtHpN+3tkovtC6zseiWXx+jJXP0GLtWCvUb4/i4QRnKyE
         Qvk/mwkvfpIFNuY2VAUZZG9vkbnDG588EDj/Xfj6ABm8a5ddmb580heUyViYrLU6dMeO
         vayUJkrP1FwRGR9bvMZ1Z1EkX6M2Xvc1BrDwP9KyqoZYFqJtBxFiTHL6IKnr+A5mTkbq
         QTb3RX9noZesbX5XmSzssgwBNOSXEnf+URqehJ4Iwzd+K5IXuLuKB9CpvgpDs7ljuzgp
         Z+Xg==
X-Gm-Message-State: AOAM533MDqQcA1xDF6g1fP6n9PPzaQvIjX2nY/66w6gm1BvSJfGz03sK
        nMalI/26jYAoeTgqohBVuz7yB2m2NtdnBQ==
X-Google-Smtp-Source: ABdhPJxpelyu7qGghDIppwaVfxbHk4dKTSAWubA13lqUnhcwTM5TAbanagVsVBTL8pf+pLl1efz5xg==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr26163385wrr.37.1620060070230;
        Mon, 03 May 2021 09:41:10 -0700 (PDT)
Received: from localhost.lan (82-71-24-115.dsl.in-addr.zen.co.uk. [82.71.24.115])
        by smtp.gmail.com with ESMTPSA id 61sm13603829wrm.52.2021.05.03.09.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:41:09 -0700 (PDT)
From:   Mark Bolhuis <mark@bolhuis.dev>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        Mark Bolhuis <mark@bolhuis.dev>
Subject: [PATCH] hid: Add BUS_VIRTUAL to hid_connect logging
Date:   Mon,  3 May 2021 17:39:38 +0100
Message-Id: <20210503163937.34889-1-mark@bolhuis.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add BUS_VIRTUAL to hid_connect logging since it's a valid hid bus type and it should not print <UNKNOWN>

Signed-off-by: Mark Bolhuis <mark@bolhuis.dev>
---
 drivers/hid/hid-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 0ae9f6df59d1..265cbe592374 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_VIRTUAL:
+		bus = "VIRTUAL";
+		break;
 	default:
 		bus = "<UNKNOWN>";
 	}
-- 
2.31.1

