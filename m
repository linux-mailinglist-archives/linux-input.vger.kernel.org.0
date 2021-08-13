Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0A53EB64A
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhHMNyR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 09:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240743AbhHMNyR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 09:54:17 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5E0C061756
        for <linux-input@vger.kernel.org>; Fri, 13 Aug 2021 06:53:50 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 3so5227333qvd.2
        for <linux-input@vger.kernel.org>; Fri, 13 Aug 2021 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=jEl2drf9omOG0yZtRE0WS6b4InK3ooX6t58ZKDi3d0E=;
        b=LvE2IdOX6Gf4bxVKLnbpqDTkfefsiGtVp7YVceehCFGG5NjgHwMxqdzaNl6lH8V1vm
         7ULcMtiI3/T8bI/akjID6Brbf0sI8bEY7xWbheEcwe47O/GP5W9Pr3QJBCVG1Xher7Cz
         ReskZ6VHALcWO/coMasdjjD8AHeCK1SlJ/HkrguizG4abO0/fD7b8IXs71Cya80danOU
         wiUrjX3+XEFVpSEt2I7B3dlWwBgxn/HNjrsID1oYLc+WLcvGeEtW3mZQG/udu+DGCcnl
         UFPcCI70wfAzt63ZtMck9oRfmK0xtUQL9SlrXa50FV4vfe1u3g/zLIJwHtMpDtIZAuab
         Rm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=jEl2drf9omOG0yZtRE0WS6b4InK3ooX6t58ZKDi3d0E=;
        b=h0PjxtkRqH2lusABzLkcprQ+C6F+94Nz75hdoLWZZ7CEs/7LPMSj2VwpP2is/Nq+BK
         jFaJhsHhpXxrXaFhvxASqT7gPhSChYk4lUU0y3ZafIUjvtW0rP7kuhpkl6swlDGi1nvV
         UTSe3oo9SKAzxXSYuuEjgS52ruXVY5YZPMDlvHvIryhYIk1Qu8TzPrreFp0VZVybk5px
         c/dRl+9O8hxfPhMftX/yUqnj3yDiFStC9m+2ehMAxiIvgx7JTPM5bS77JRmkiHIqMhtg
         k1cdeFSMalq/24ZKPPkIH/ZXXLj4zOfAuGZ6IMMcAMQNIi4vFANc7fEam9q4HlMKwhly
         23MA==
X-Gm-Message-State: AOAM5316L2x3IBJCdyzYymcOoShxBj1GEI+hp4K+GRxH6E5O5Deqso28
        TuxR6mmPZNMBSZCe0lUFHdpzLCXtiU8lhA==
X-Google-Smtp-Source: ABdhPJxXti7+FelA9/W3kkpOTAgWTNCa4Zh9y+RVaC+9cVIp9MKOCLrKgHZmiPO/MryYVYQESBayCQ==
X-Received: by 2002:a0c:a321:: with SMTP id u30mr2752620qvu.57.1628862828826;
        Fri, 13 Aug 2021 06:53:48 -0700 (PDT)
Received: from localhost (pool-173-48-168-63.bstnma.fios.verizon.net. [173.48.168.63])
        by smtp.gmail.com with ESMTPSA id z5sm958009qkj.16.2021.08.13.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 06:53:48 -0700 (PDT)
Date:   Fri, 13 Aug 2021 09:53:47 -0400
From:   Takuma Umeya <umeyatakuma@gmail.com>
To:     linux-input <linux-input@vger.kernel.org>
Subject: ASUS ZenBook Q408UG keyboard not working
Message-ID: <YRZ5a30XOKVjUWDG@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi list, 

My Asus ZenBook Q408UG's keyboard doesn't work on the coldboot, and
wanted your suggestions on how to get around it. 

During the probe, i8042_wait_read() times out. The avg reps for my
system is 13000 so below should do, but I wonder there could be a
better approach to resolve this issue.  

---
 drivers/input/serio/i8042.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.h b/drivers/input/serio/i8042.h
index 55381783dc82..591d0db73497 100644
--- a/drivers/input/serio/i8042.h
+++ b/drivers/input/serio/i8042.h
@@ -31,7 +31,7 @@
  * to a non-existent mouse.
  */

-#define I8042_CTL_TIMEOUT      10000
+#define I8042_CTL_TIMEOUT      15000

 /*
  * Return codes.
--

Appreciate your insights and suggestions, 
Takuma 
