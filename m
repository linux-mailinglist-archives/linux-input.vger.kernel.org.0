Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2852194F05
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 03:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgC0Ccj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 22:32:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44409 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgC0Cci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 22:32:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id 142so3862924pgf.11;
        Thu, 26 Mar 2020 19:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XajnJwqf7IDi08ky1T7ypUpRxAJg4V4LZuWadlWU3Io=;
        b=dgk4CrDhCdQIJr63haiO9+4bf6Aaiv+yUPotOeJwjO/i2aj4/SDr+cWU3DV34QOxRh
         MCM/wFYB9/BZdN7NtHCnc9QRepwsMdn8mEvX8g9JH7ffaQtYZWqqaSY2xdxRJdyXuBLJ
         hFscshr48GoU2JW2v3YBco4J135mtYnUGQRx8mYpdoTik41ovSMIIpytjCgYLu3EwyGK
         qrkFV6RLiOoWxoEYWuDZ6WQ9h8kIkRYMgGJrVm+tFrKVoAPyWy9nDVqqo36M1bxmIHdm
         zmhUJ4OEoJQb4ZdK/kbhxJUuygMOnTRJJAhcmyqJI6++yxR1zVUsIqdwt0E+T6m/EYH8
         xJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XajnJwqf7IDi08ky1T7ypUpRxAJg4V4LZuWadlWU3Io=;
        b=RziibEw2YZHPMVLGV1Za2Sse2eiLbPQ3UPSTU2BMJn//0ateP0yRSDPYVM77yXvVko
         mhIo1uzg/K7S0XEhR3tb4NCtKWn7JzWfycmZv/whLnFjmMQUHEKlQPjqni/owCh+NDM2
         qQxZlOUZAipZOv372LiWARpQKRCo5l7avcXbL9mv2sXESFvTmLmxlbA/KW+ybtzR+0Mi
         Fh6Lu+tr74zbTiozgwIm+JPT+WWUqyyENSAFBp0aWTyo7+d/Gdh0DLAEEGNkAAw13JhL
         4mORJEpDdTJwrrDXDCw6m0SYu4KMm/6R6OZZkX6DMyHyCx0fPfurfKdN9cbTYm0uRtxQ
         daJg==
X-Gm-Message-State: ANhLgQ0bFX/SFmMy2xF9qj10mIH0/YijyU00+5PkKoKaVc2wHemLdFA7
        jL555Wevb2LBMm1b1X7u7xI=
X-Google-Smtp-Source: ADFU+vucIB45dpa6qg4/alOcqUA2N4VXWHvcTBfrTBXEclsZeOB/l4jpZTRElsrba32x/sDONvQnbw==
X-Received: by 2002:aa7:92da:: with SMTP id k26mr12034925pfa.139.1585276356172;
        Thu, 26 Mar 2020 19:32:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x15sm2743026pfq.107.2020.03.26.19.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 19:32:35 -0700 (PDT)
Date:   Thu, 26 Mar 2020 19:32:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.6-rc7
Message-ID: <20200327023233.GA180354@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- a fix to generate proper timestamps on key autorepeat events that were
  broken recently
- a fix for Synaptics driver to only activate reduced reporting mode
  when explicitly requested
- a new keycode for "selective screenshot" function
- other assorted fixes.

Changelog:
---------

Andrew Duggan (1):
      Input: synaptics-rmi4 - set reduced reporting mode only when requested

Dan Carpenter (1):
      Input: raydium_i2c_ts - fix error codes in raydium_i2c_boot_trigger()

Dmitry Torokhov (2):
      Input: move the new KEY_SELECTIVE_SCREENSHOT keycode
      Input: fix stale timestamp on key autorepeat events

Eugene Syromiatnikov (1):
      Input: avoid BIT() macro usage in the serio.h UAPI header

Nick Reitemeyer (3):
      dt-bindings: vendor-prefixes: Add Coreriver vendor prefix
      dt-bindings: input: add Coreriver TC360 binding
      Input: tm2-touchkey - add support for Coreriver TC360 variant

Rajat Jain (1):
      Input: allocate keycode for "Selective Screenshot" key

Yussuf Khalil (1):
      Input: synaptics - enable RMI on HP Envy 13-ad105ng

Diffstat:
--------

 .../devicetree/bindings/input/cypress,tm2-touchkey.txt        |  1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |  2 ++
 drivers/input/input.c                                         |  1 +
 drivers/input/keyboard/tm2-touchkey.c                         | 11 +++++++++++
 drivers/input/mouse/synaptics.c                               |  1 +
 drivers/input/rmi4/rmi_f11.c                                  |  4 ++--
 drivers/input/touchscreen/raydium_i2c_ts.c                    |  8 ++++----
 include/uapi/linux/input-event-codes.h                        |  3 +++
 include/uapi/linux/serio.h                                    | 10 +++++-----
 9 files changed, 30 insertions(+), 11 deletions(-)

Thanks.


-- 
Dmitry
