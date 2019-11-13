Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE684FB93C
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 20:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfKMT6P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 14:58:15 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38867 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfKMT6P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 14:58:15 -0500
Received: by mail-pl1-f193.google.com with SMTP id w8so1507970plq.5;
        Wed, 13 Nov 2019 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=gISrUJSSGENPSYg0FzwrhO2Nvy2MYNgI0VQirzmff5I=;
        b=kBSfG6I/08byu4W8xTnGVIvc3sVxIpiX37mKEksKf2EBtpAj+TPckk+eQPW86+Z1Z8
         vxs59+0DsaZ+Z+0T709ACEth4GhYdkO2Sycql0TVsbC9cA8E3Cjl+Rt9YA28OACxF11c
         fhEDdfnt7Kl52KW+gFm67OslZ9oQabc2byemD+TnAJvD3GijS79xL0GZi2pbRpCsruPg
         Q3+Vrc876YUDUK07c1AlbhkjY62Gmrj/wzYvYj69U/6ap1inSNIPyi3hFxZ+9gTiLq72
         OiTXKpiM+P8HpygOE7ZSEeXrYovhBrqAN2I8nf/t0zvAsjVrO5lOalMmeRqdKX15HNrz
         O5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=gISrUJSSGENPSYg0FzwrhO2Nvy2MYNgI0VQirzmff5I=;
        b=V+kTw9pK0wfpGqoRDQ7sx/SHKVR49iqjehGKfGfFcjXz0FbwvAiNtLkGJMZQCFp32H
         Uc+N0m+be5KHcp5jWoY+5XIh2yuUH4FdXJCgtYzLlfboj7V/voDE21SflmnVy4kQmyrO
         IyzYYJ9UaUybuViDK8pcnZu0LWCgAb70tF3dsdBI81b4uSQZgtChl4fxDbBpcWLJKasM
         TijxQOwC/iyvPrU8UgST0kBSEGbasn/XRSigo7Zu0//Qv0Cec5ky7B/HftxddnPiOc73
         RlQmQIJn4mHi7Wx6hrebPbNqULH//1EqCMNQW8Zf0hlq9H3EgbGAxxxNrEPKSlsDDras
         Rlaw==
X-Gm-Message-State: APjAAAXSpx8ZoxC0508AULlWErgfTKIQWCN/m0RsUzMXAwJXenabbyys
        oXcZsMwkiOObb5H592AS51D4GehB
X-Google-Smtp-Source: APXvYqxUcT44/H/jHCiIeSm9wjFHihUIqgWpImQgGDPRlXdWg35beSHPJUOAIMLOERSUlNeyaHXQHg==
X-Received: by 2002:a17:902:6a82:: with SMTP id n2mr5744755plk.5.1573675092580;
        Wed, 13 Nov 2019 11:58:12 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j11sm3275304pgk.3.2019.11.13.11.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 11:58:12 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:58:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.4-rc7
Message-ID: <20191113195809.GA4263@dtor-ws>
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

to receive updates for the input subsystem. You will get fixes to
Synaptics RMI4 driver and fix for use after free in error path handling
of Cypress TTSP driver.

Changelog:
---------

Andrew Duggan (3):
      Input: synaptics-rmi4 - disable the relative position IRQ in the F12 driver
      Input: synaptics-rmi4 - do not consume more data than we have (F11, F12)
      Input: synaptics-rmi4 - remove unused result_bits mask

Lucas Stach (2):
      Input: synaptics-rmi4 - fix video buffer size
      Input: synaptics-rmi4 - clear IRQ enables for F54

Pan Bian (1):
      Input: cyttsp4_core - fix use after free bug

Diffstat:
--------

 drivers/input/rmi4/rmi_f11.c             |  9 +++------
 drivers/input/rmi4/rmi_f12.c             | 32 ++++++++++++++++++++++++++++----
 drivers/input/rmi4/rmi_f54.c             |  4 ++--
 drivers/input/touchscreen/cyttsp4_core.c |  7 -------
 4 files changed, 33 insertions(+), 19 deletions(-)

Thanks.


-- 
Dmitry
