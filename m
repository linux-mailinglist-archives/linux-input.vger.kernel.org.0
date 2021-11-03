Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AF7444BB4
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 00:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhKCXnF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 19:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhKCXnF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Nov 2021 19:43:05 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F742C06127A
        for <linux-input@vger.kernel.org>; Wed,  3 Nov 2021 16:40:28 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id b13so4226767plg.2
        for <linux-input@vger.kernel.org>; Wed, 03 Nov 2021 16:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h29gM7Edy6vLtHykubE2EOJmPzM6wMTb8eMVyU/eFYE=;
        b=EKBq7zuZioawowrHgnbn8nDEPEgxFsN+8IzKYZ1DFSblRd9o95aQr7V3qDl6+Rvs6U
         jhur7uPRIVdgQk5dvuuZVjl+0kshlBwghkKpob4bwbfvPBHyszsWfI64Og2MKXG1n71F
         oaX41A5YNhCrqinehnJDHuuOGij5giULBMcZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h29gM7Edy6vLtHykubE2EOJmPzM6wMTb8eMVyU/eFYE=;
        b=S5FkuWBAiC/8ItaF5R8aYv6y/bVP2uPSUV6tRcYo2u4odkWUetFXgIex7csVSCPsoJ
         sygx9B8L0S2fM8eWBI3mhZjFHFWPs12DE6BHiQq0SLzBP5K3IknIfV/bHAg/s8eZ53eU
         b1vJNjes/pWz16xFRtV1E264UE7TUf/gPr0WLCU4c3z2Gmoqvzn5MvGp8Q3pvcEdMIqL
         scv/1ulUgiytqKqehZr5PEe2nQKdnbOc9oYQJc8+qbFm/soYN2ccjrDhWs39Jf5o8QbK
         YN0JsmxR04ZsRh7RCS9ChwtD1bDHu/7m7LqLJQupN6usRx/ub6bhnGQq5H2k7wxfP6Rc
         TOsA==
X-Gm-Message-State: AOAM530BpZ/L6EBEWVR2kZqir+9NUiTzH2JG8GaIwCKRn+v7iTgdpXAC
        aV0PrZyj/CcBqXdTCz959rzkhQ==
X-Google-Smtp-Source: ABdhPJzSZ0NFj4DVKnvqt8lE+Z4I+URLHTd7SEETpWfrpdOsqyzMOJMhtRZ3er6pUKkLZSku7DTQvQ==
X-Received: by 2002:a17:902:7892:b0:140:283:6683 with SMTP id q18-20020a170902789200b0014002836683mr41176310pll.19.1635982827749;
        Wed, 03 Nov 2021 16:40:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:49a7:f0ba:24b0:bc39])
        by smtp.gmail.com with UTF8SMTPSA id n126sm3391952pfn.6.2021.11.03.16.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 16:40:27 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH 0/2] drm: Support input-boosted panel self-refresh exit
Date:   Wed,  3 Nov 2021 16:40:16 -0700
Message-Id: <20211103234018.4009771-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A variety of applications have found it useful to listen to
user-initiated input events to make decisions within a DRM driver, given
that input events are often the first sign that we're going to start
doing latency-sensitive activities:

 * Panel self-refresh: software-directed self-refresh (e.g., with
   Rockchip eDP) is especially latency sensitive. In some cases, it can
   take 10s of milliseconds for a panel to exit self-refresh, which can
   be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
   with an input_handler boost, that preemptively exits self-refresh
   whenever there is input activity.

 * GPU drivers: on GPU-accelerated desktop systems, we may need to
   render new frames immediately after user activity. Powering up the
   GPU can take enough time that it is worthwhile to start this process
   as soon as there is input activity. Many Chrome OS systems also ship
   with an input_handler boost that powers up the GPU.

I implement the first bullet in this series, and I also compared with
some out-of-tree patches for the second, to ensure this could be useful
there too.

Past work on upstreaming a variety of Chromebook display patches got
held up for this particular feature, as there was some desire to make it
a bit more generic, for one. See the latest here:

  https://lore.kernel.org/all/20180405095000.9756-25-enric.balletbo@collabora.com/
  [PATCH v6 24/30] drm/rockchip: Disable PSR on input events

I significantly rewrote this to adapt it to the new common
drm_self_refresh_helpers and to add a new drm_input_helper thin library,
so I only carry my own authorship on this series.

Admittedly, this "drm_input_helper" library is barely DRM-specific at
all, except that all display- and GPU-related input-watchers are likely
to want to watch similar device behavior (unlike, say, rfkill or led
input_handler code). If we find other applications need the same
behavior outside of drivers/gpu/drm/, maybe this could find a home
elsewhere.


Brian Norris (2):
  drm/input_helper: Add new input-handling helper
  drm/self_refresh: Disable self-refresh on input events

 drivers/gpu/drm/Makefile                  |   3 +-
 drivers/gpu/drm/drm_input_helper.c        | 143 ++++++++++++++++++++++
 drivers/gpu/drm/drm_self_refresh_helper.c |  54 +++++++-
 include/drm/drm_input_helper.h            |  22 ++++
 4 files changed, 215 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_input_helper.c
 create mode 100644 include/drm/drm_input_helper.h

-- 
2.34.0.rc0.344.g81b53c2807-goog

