Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9298F194672
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 19:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgCZS1R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 14:27:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39171 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCZS1R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 14:27:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id d25so3198863pfn.6;
        Thu, 26 Mar 2020 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=F8LTRwA29y3BtOwQYRxfFD8Xx4MT6yu8bUXU9YPsEy4=;
        b=Vl5W6+baQ71vuipLENFdXPlrY8qYR2Hc2S/JEmCK85BcTvYLM6PojE9XAiDHgZeq1G
         +DckwGV1Tp7JRjufUtrMz7gtdatX3/EIUq17DVzFvYDHG7b/pYXbU/HC0N0ObR+sQfJr
         TVzaJUvTjk5s99CJAjIUJLe8foFN3UrsstNQDfyMCoPj1WjvcfmBFiLwPDSLmBLgpKvA
         003xJ6IQSYiGU+y15+TNNpaXaviAGnB9rXErnM0ZpWiEpiJJtnTGyk78Rf+CxZanzWNn
         DIyvrrx1MU3JMorkVCOBtjfx/QiLtvIbf2kpDRHhEqh3KR/zGUVXuYUayXb/LWtibh9g
         BJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=F8LTRwA29y3BtOwQYRxfFD8Xx4MT6yu8bUXU9YPsEy4=;
        b=TeT3/obi7o9aXNF9rtqky1AbzQ2Dvcza3+i5u6l0dYZlirF1QALadvBbR3s8rNl18O
         txOVEY5g45XkX5Kn07jLPjqpGaCnBjeQtEQsinfWL9ID8yRt8oOGZmNb5Wt/9gltSLX6
         96KqZxOeVZhnFtQTth8iXrst61JLSgQ4fjk6qBbm6cC9Fp48ap3fQPn5jCNYXCaI2NVj
         88ZklR4o7bFut7CvJqs5S3Gd6FXom/7QhLkV1vaafn0WGNGwr/9pRI/C5td/9+Ty9/Gh
         mLO0Usk8IWu8NfjYS5gsyzyBQ8snBhQmwxcWg0upA7XD+SsNBcDx1CvqMUhp2eVvnWC7
         cWFw==
X-Gm-Message-State: ANhLgQ3wrSTsMdpviaT4q7m6t9rRPHzp27IRj3SqOgonKxTtcwbt52CA
        X5Q2E4ccoYFIb2Kw9Jk6EMbFwi1r
X-Google-Smtp-Source: ADFU+vspeI4zcrvbm0Ljq1Q1jwR+7dUgFtJYp1FS4CCntlvNJ4Ude4apmzuG7s1t1Uo8uP9pVhqldg==
X-Received: by 2002:a63:1210:: with SMTP id h16mr9829963pgl.408.1585247234601;
        Thu, 26 Mar 2020 11:27:14 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t3sm2196744pfl.26.2020.03.26.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 11:27:13 -0700 (PDT)
Date:   Thu, 26 Mar 2020 11:27:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Rajat Jain <rajatja@google.com>, Harry Cutts <hcutts@chromium.org>,
        Mathew King <mathewk@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: move the new KEY_SELECTIVE_SCREENSHOT keycode
Message-ID: <20200326182711.GA259753@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We should try to keep keycodes sequential unless there is a reason to leave
a gap in numbering, so let's move it from 0x280 to 0x27a while we still
can.

Fixes: 3b059da9835c ("Input: allocate keycode for Selective Screenshot key")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/uapi/linux/input-event-codes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 008be2609ce1..6923dc7e0298 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -653,7 +653,7 @@
 #define KEY_PRIVACY_SCREEN_TOGGLE	0x279
 
 /* Select an area of screen to be copied */
-#define KEY_SELECTIVE_SCREENSHOT	0x280
+#define KEY_SELECTIVE_SCREENSHOT	0x27a
 
 /*
  * Some keyboards have keys which do not have a defined meaning, these keys
-- 
2.26.0.rc2.310.g2932bb562d-goog


-- 
Dmitry
