Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4972E2B0366
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgKLLEe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgKLLCZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:25 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2163C061A4A
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:24 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 23so5514036wrc.8
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvY9te180OdLZG/3R+1QDjkO+/n4VFTObKYg6zpyjpg=;
        b=c7s4GoHslhO/5aCEeC2U2ciigs2PdRNSMMwlCmib4jNWifhZmO1CFfJbD4xOudP/kE
         5Ws5YrVtmAruR8/ODKtauM1baSmvH8vir2NhiFzQj/Z70TRSUCxHnIec1am/9lFysr6Y
         i0/DgPPjfaXRkL6sBt2jPZkMJxNONSVlzsgiQ006DQ8KNthJqrmiPSDK7mu4KPRf6UB/
         7jScF55NzDiGUdWzutACSRrnlQNm7v80Dwgj6nctNY2LwUERaSqF41L0FXoFMwDCzT3D
         8jgIDRNxDggKa35OsNoDn2eQdIM3dQ4whwXqZBTt9Ibi6GzP+tqJfR77bBuRvUFr6oui
         2l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvY9te180OdLZG/3R+1QDjkO+/n4VFTObKYg6zpyjpg=;
        b=VVOJGKZAedDdI2EPxODzhsZxIINa1zfLe/sjlj6BsGtE2legMbu1nqnohEg3r3Iy5U
         oOOwqJ95b3VPUBqKJORyLj0w749eleT5GJVgklfddIXSZ5yysJa0JrE/0TQLO4OE0sVK
         AxO2I5B/UOyED2kyxleGrfOOEJdk5kmZhln1OBaBM3PoLgj+ZnpbJhGxMapOXnkLUaTK
         yuIw/QM0sKeiSO/lV+DokEcrKw5KmLl6Xo0cs0k+B9B8KKmagaf0Icu/x6S9W/S3f1VY
         coK7uWgI3pSTZzwzUUwzmZYJ24AfyZvFw0SekWd5z6gpnLonn2BNASdhx2q6Vk4pPjxm
         YoDg==
X-Gm-Message-State: AOAM532ec1CQX3D2VLO9/v6caAAlTLjWBtBnjl9AODqlRpae9USYjhPx
        JNildjLiwMtGj9dtpbnerGOHGQ==
X-Google-Smtp-Source: ABdhPJypb4Z4PS8wkRi6qUquNvkk/2vA3NoJBB2bf6GPSLoYbfV/3+LRiUE184gwcRldEGTcpv3jRg==
X-Received: by 2002:a5d:5686:: with SMTP id f6mr8330558wrv.329.1605178943669;
        Thu, 12 Nov 2020 03:02:23 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:23 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: [PATCH 12/15] input: mouse: synaptics: Demote non-conformant kernel-doc header
Date:   Thu, 12 Nov 2020 11:02:01 +0000
Message-Id: <20201112110204.2083435-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/mouse/synaptics.c:1781: warning: Function parameter or member 'psmouse' not described in 'synaptics_setup_intertouch'
 drivers/input/mouse/synaptics.c:1781: warning: Function parameter or member 'info' not described in 'synaptics_setup_intertouch'
 drivers/input/mouse/synaptics.c:1781: warning: Function parameter or member 'leave_breadcrumbs' not described in 'synaptics_setup_intertouch'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Peter Osterlund <petero2@telia.com>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Bruce Kalk <kall@compass.com>
Cc: this to <linux-input@vger.kernel.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/mouse/synaptics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 07835939d83b9..403d0ce0e8bd2 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1771,7 +1771,7 @@ static int synaptics_create_intertouch(struct psmouse *psmouse,
 				  leave_breadcrumbs);
 }
 
-/**
+/*
  * synaptics_setup_intertouch - called once the PS/2 devices are enumerated
  * and decides to instantiate a SMBus InterTouch device.
  */
-- 
2.25.1

