Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50DB392856
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 09:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhE0HSP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 03:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhE0HSP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 03:18:15 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443C0C061574;
        Thu, 27 May 2021 00:16:42 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id p39so2952329pfw.8;
        Thu, 27 May 2021 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=aXcHzWfb/Dirh4NWw/6J1XlJd4u/1NQEUALt9W0iBEk=;
        b=qSbRV9zrYn+PgvegnTWsfEDZ28k8xMm67yCRua9V+1MOZ5QvMqhb47O9sCOr9p0o5A
         KrZ2ecEM8ZymUTshZdBjQUsSOBtr+Wm3faND6LjLBkGV2uondEP3Y5hjQWnOmeWCcvGz
         pHDQWnghbtUxMG79uYMPHUbXyRSz0gB4Yg9TuzmF66kFi91L1kEEpMlJAmLwcEVhi0QE
         XbaST/wmZ6CbXVieKiqyOyaqvddtniRSQc+AD2GIJk7TfXJa6InAQr7WrUosn6Y/iZXX
         aQk1PVvTN0NWOPEmUeM8MN/r1UiEOaBBo9Gy7eO5ml9sbC5ruXH0pWF1XNxXJ3bfesYn
         pCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=aXcHzWfb/Dirh4NWw/6J1XlJd4u/1NQEUALt9W0iBEk=;
        b=p2HQKP0Fj5zuSR1onzEhlB3EdysP0py77IpEFyC+Aq8Ee2Xenog8K3HW/Ew518uRSn
         XMMhlae8n6RP9HtsMucA4tdIus/dOl/P4O+LQoCrJ2hQN1Go7MIUS7D3f8AM6uis4YE0
         XZ/is90V2E/3QcEeOp3kf64d8d8s75EFkuCy9RxaGy/kJBdBJl4pGXgUkY8HjrfFsxUJ
         3wxh4NYAU6yzao9+e6SaNbN7akxcp9Upc4lDpjevOUFmw8/xkBwXCAu0DIQC/PBR6jJf
         V8pRuhKV2D+bkOwpGzS1bItguZyS/An5mnoZl2Ktw88/KLyD+3jGJjc2jU7VPBIh8Q/g
         6Bsg==
X-Gm-Message-State: AOAM532x2epdlF+CqBQM8DkQIZlg/nKr45Ka89+/WTPVqOjkHX+j/W0m
        DrRfcWCTN+oaF14O8WqWkdc=
X-Google-Smtp-Source: ABdhPJyW1LaQ79gYyjDvDCHvXfFan6inC3PPhCVmLhMlF2QYWSGy0bCZHbkQnBOLRVaXVN1eRuAQYg==
X-Received: by 2002:a63:ad0f:: with SMTP id g15mr2390464pgf.415.1622099801747;
        Thu, 27 May 2021 00:16:41 -0700 (PDT)
Received: from raspberrypi ([125.141.84.155])
        by smtp.gmail.com with ESMTPSA id bo10sm1210111pjb.36.2021.05.27.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 00:16:41 -0700 (PDT)
Date:   Thu, 27 May 2021 08:16:37 +0100
From:   Austin Kim <austindh.kim@gmail.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        austin.kim@lge.com, austindh.kim@gmail.com
Subject: [PATCH] HID: intel-ish-hid: Fix minor typos in comments
Message-ID: <20210527071637.GA1516@raspberrypi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change "poiner" to "pointer" in comments.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index d20d74a890e9..1b486f262747 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -456,7 +456,7 @@ static void loader_cl_event_cb(struct ishtp_cl_device *cl_device)
 /**
  * ish_query_loader_prop() -  Query ISH Shim firmware loader
  * @client_data:	Client data instance
- * @fw:			Poiner to firmware data struct in host memory
+ * @fw:			Pointer to firmware data struct in host memory
  * @fw_info:		Loader firmware properties
  *
  * This function queries the ISH Shim firmware loader for capabilities.
-- 
2.20.1

