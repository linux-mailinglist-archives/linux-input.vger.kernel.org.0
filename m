Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9167C4550B6
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 23:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241437AbhKQWwK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 17:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241435AbhKQWwH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 17:52:07 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DAB3C061764
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 14:49:06 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so3889050pjb.1
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 14:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpv3ppQp4AdrKrqKBlCi3lv1TW7GOvkKLKXPxTB7n5Y=;
        b=CmCe9x1evLqmgJ2tkD2ei5zZtVLnugfocj/BWL7RE6407XI6b4ZrG/ZlsrU08i+PTk
         U6Xo63RXOuh7ZShFvqCihtigQwrvJUIoqc93GEZiSpBCmuFKYsC8uC+WQWJo0s7PUjfD
         6cYU9y1AbXPsd0nSfQYWeT7eD3QkH//b5Sods=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpv3ppQp4AdrKrqKBlCi3lv1TW7GOvkKLKXPxTB7n5Y=;
        b=TcSZPhlHdWmFtwENGdrfxhoxqZrLQ/SrYDpX0lGD2UUWmoRFTGl+NX83WQPABnQT89
         yjCpOLy8qkyP3lvN+zn1OowR48UQsyaEY0bvH3Ckvxu5PRJdjONQIYMt7/3Op1psTt8+
         3pybZUzx5CVD+3XTA/M4umJcmvH0CRjyQgeIpAUTuUFAJwM7DaQ+I0S0ji3fO/72EJjF
         R52YJZDH6CGy+R/5u1EBiCYuASxUTt4CSTJj9TtdykDV4NPfxJ50UIXViIilRe91FzuT
         Y/aG5Zmp492HZnPwe6lnNy1xtsYSJv0FAi5HNWG0W818Zj1bLDsplG2ZQTMz9ueZPHca
         f0ig==
X-Gm-Message-State: AOAM532K4mJwZM6LQcrNwl8emLE85MPb/cNn0xkCZG2AL0gxGaU449T4
        tfRqEKHtuRan4rFLFaKanXaDAQ==
X-Google-Smtp-Source: ABdhPJyLA0GlFJYLVXLkAb23Pd6HZXVzIX/Db1U2jnd4GET4hbncySrNQFQD8cVcGqeHii1Rq+eQxw==
X-Received: by 2002:a17:90a:2843:: with SMTP id p3mr4320482pjf.176.1637189345652;
        Wed, 17 Nov 2021 14:49:05 -0800 (PST)
Received: from localhost ([2620:15c:202:201:896b:df38:4eae:c568])
        by smtp.gmail.com with UTF8SMTPSA id w189sm620772pfd.164.2021.11.17.14.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:49:05 -0800 (PST)
From:   Brian Norris <briannorris@chromium.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 0/2] drm: Support input-boosted panel self-refresh exit
Date:   Wed, 17 Nov 2021 14:48:39 -0800
Message-Id: <20211117224841.3442482-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
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
input_handler code). The approximate consensus so far seems to be that
(a) this isn't much code; if we need it for other subsystems (like,
    cpufreq-boost), it's easy to implement similar logic
(b) input subsystem maintainers think the existing input_handler
    abstraction is good enough
So, I keep the thin input helper in drivers/gpu/drm/.

v1: https://lore.kernel.org/all/20211103234018.4009771-1-briannorris@chromium.org/

Changes in v2:
 - Honor CONFIG_INPUT dependency, via new CONFIG_DRM_INPUT_HELPER
 - Remove void*; users should use container_of()
 - Document the callback context
 - Delay PSR re-entry, when already disabled
 - Allow default configuration via Kconfig and modparam
 - really CC dri-devel@lists.freedesktop.org (oops!)

Brian Norris (2):
  drm/input_helper: Add new input-handling helper
  drm/self_refresh: Disable self-refresh on input events

 drivers/gpu/drm/Kconfig                   |  22 ++++
 drivers/gpu/drm/Makefile                  |   2 +
 drivers/gpu/drm/drm_input_helper.c        | 143 ++++++++++++++++++++++
 drivers/gpu/drm/drm_self_refresh_helper.c |  98 ++++++++++++---
 include/drm/drm_input_helper.h            |  41 +++++++
 5 files changed, 292 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_input_helper.c
 create mode 100644 include/drm/drm_input_helper.h

-- 
2.34.0.rc1.387.gb447b232ab-goog

