Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99FD1360FE
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2020 20:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbgAITWL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 14:22:11 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34867 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgAITWL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 14:22:11 -0500
Received: by mail-pf1-f194.google.com with SMTP id i23so3832007pfo.2;
        Thu, 09 Jan 2020 11:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=usOxzl9FBY1KQPmoNdIxyN+D9mvtG1BGVaDDyHUDT0k=;
        b=PyOffPsh+6+F2CZ12XyRdf0M8/9FAkzX/cgGIwY57v22uO4dGBVgWMH4HO5E2/Z+lS
         dnBI4siD2JjfSUHenhmDl+c4b5HNhoxRroGlJbTJvWqQFydGCTHuJpmGA+qNGZ9z49rB
         HpNUPO9XLygBpjEQ//izdBLXZ4IhAb9RPc7KBai8hgnfhbvjya4c/5yEPENmfvxWPo1a
         T8sFg4zNYi6bFS+p8eZ328Px6+rBDo8ORGUX2PQhToiSXUB2M0Ex1/LkFqhtgNFgRtca
         dFATCMOeHFcEXod6pGTcCYb1X4poFIIY3EhBI69psC/zNj2b9+24NsQ5UrN9jcgxWUK/
         GSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=usOxzl9FBY1KQPmoNdIxyN+D9mvtG1BGVaDDyHUDT0k=;
        b=GqcsQRIr8qMFXbdtE9QcnBSqfqzEGFs1Tch1CgLnPDLsVjATh+PedkPOMTc2wsg/Jw
         TtaHwUSBCN4Jg8wMqntemm/pgmJU80qec/y1ARvetnkAc7Eog/oLm2bSdvcPH4BgnNbT
         5E6LTl8wYUI5uar4pyxT3QG0/HTFuPJzSuj3nrumP3R72CMEw1mcJwa/2ePTBFYU6w1Y
         KyHd4vL++fshokxA+Z5P+vNMmserz0411/YCL+acOxaHrn3Vn2rbObyU5I8SKT2sHj0Z
         ft/RdyBCkjToaDoTvhx+qEpJzVzRb1h/Rr/7e2Ri5Qx4aLVF58RY4sJM2oVq8kMqLncQ
         kBiw==
X-Gm-Message-State: APjAAAWaake0ieSk1s/2/N72jdlMQwkcFcN3AdIgttx3DUPvNTA+hG1O
        6NGOcPtbCSRMRd4Ffwov92PiGKRH
X-Google-Smtp-Source: APXvYqy6JxkUexm1ceb4kww0qJBJMkUR9v5bHfn7F5veI+sraqzpUAZT2JwrdP7mDLk6ORJtl+HtjA==
X-Received: by 2002:aa7:9296:: with SMTP id j22mr48119pfa.201.1578597730462;
        Thu, 09 Jan 2020 11:22:10 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b22sm8234092pft.110.2020.01.09.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 11:22:09 -0800 (PST)
Date:   Thu, 9 Jan 2020 11:22:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.5-rc5
Message-ID: <20200109192207.GA210536@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Just a few small fixups
here.

Changelog:
---------

Anson Huang (1):
      Input: imx_sc_key - only take the valid data from SCU firmware as key state

Arnd Bergmann (1):
      Input: input_event - fix struct padding on sparc64

Dmitry Torokhov (2):
      Input: uinput - always report EPOLLOUT
      Input: add safety guards to input_set_keycode()

Diffstat:
--------

 drivers/input/evdev.c               | 14 +++++++-------
 drivers/input/input.c               | 26 ++++++++++++++++----------
 drivers/input/keyboard/imx_sc_key.c |  8 +++++++-
 drivers/input/misc/uinput.c         | 19 ++++++++++++-------
 include/uapi/linux/input.h          |  1 +
 5 files changed, 43 insertions(+), 25 deletions(-)

Thanks.


-- 
Dmitry
