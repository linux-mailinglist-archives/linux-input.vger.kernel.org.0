Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFCF21E4D8
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 02:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgGNAxh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jul 2020 20:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgGNAxg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jul 2020 20:53:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229EAC061755;
        Mon, 13 Jul 2020 17:53:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 1so6802878pfn.9;
        Mon, 13 Jul 2020 17:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1WZl3SA6KMxtfbG5PMx34SOFRA0PpKVq9Dty/hOwW44=;
        b=iv8VOWzPYj+OxwIko8MRq3OMGpatZTvQ0Y5pOdmjF9HpBXZ/069lOpNv2Bmu1s/UKU
         3snl9GQSZz6SVSbqNIz4Is83acJSFZYvfJiT9g+aXOjVz+AOOSgaKBztRMzPTSAhGgDq
         3snAREEl66DIBaUNb2OdjsljkYKecksOOWtwlQhOJ12Pn0i0OeUIKOALDs5hKDk7+oBX
         AbzJo9XEHPgFa3Al9DZ0byAB4faRfWnS4xY9fPy+s91nO0IWHhSxOq9QGFCzgo5eiYeU
         ATqWVkQLcDeUx2dJkFpKV6IWKcfXNB1jGZptph8XnPg2ze00Fl0rbuxvju0xNLc7PCJY
         Topg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1WZl3SA6KMxtfbG5PMx34SOFRA0PpKVq9Dty/hOwW44=;
        b=qrzkUKqXfE2QktUUbhLsbsW2KuL4PdSmoAUdhlhzuOMZOIud7tu8akHRriBTu1VYAR
         MZCVlP7aqmp4UeqsoKtnZl80LapVS/qL2Q9d7SxD1J7yHDOVDP2R7mrRkGjrJ4qKMBIC
         +7tOxMT6+Cn3rOgFFBCkOiDPEO0GC4w1oRYqz7Oml63XNqUIzu2e1SfpOMwWSPAc0JQp
         ZcsNuP7wzwKqGJKXTXo6wkju9mrG0wNLv9NF9Bk2CUsCiHgQYLowvOfrihis+8FUEYjK
         gACSqkYkgxzCTX6sWRHmk8Sg89aEkvfBmFjLMhxMzWoWi0ays2TQqwuAVi+e5OPR1qzU
         cGRQ==
X-Gm-Message-State: AOAM531Hd8vbvn2b9vfY2lgU3loUuAc8l1+0SOr3/SKXS+Ot9TjZhoZI
        9vXu2KWpTX3s9Z/rZkNOXPYCqGUfVvM=
X-Google-Smtp-Source: ABdhPJxEL50DSzvXMc7ikYncO/bul+8bsW/aa7e+aif3CI56u0vdWc3z/J8xXNJIgaAIqJHHwlgY4g==
X-Received: by 2002:a65:6403:: with SMTP id a3mr1453280pgv.246.1594688015562;
        Mon, 13 Jul 2020 17:53:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i128sm15914850pfe.74.2020.07.13.17.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:53:34 -0700 (PDT)
Date:   Mon, 13 Jul 2020 17:53:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.8-rc5
Message-ID: <20200714002748.GA1477546@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get a few quirks
for the Elan touchpad driver, another Thinkpad is being switched over
from PS/2 to native RMI4 interface, and we gave a brand new
SW_MACHINE_COVER switch definition.

Changelog:
---------

Dave Wang (1):
      Input: elan_i2c - add more hardware ID for Lenovo laptops

David Pedersen (1):
      Input: i8042 - add Lenovo XiaoXin Air 12 to i8042 nomux list

Derek Basehore (1):
      Input: elan_i2c - only increment wakeup count on touch

Dmitry Torokhov (1):
      Revert "Input: elants_i2c - report resolution information for touch major"

Ilya Katsnelson (1):
      Input: synaptics - enable InterTouch for ThinkPad X1E 1st gen

Merlijn Wajer (2):
      Input: add `SW_MACHINE_COVER`
      ARM: dts: n900: remove mmc1 card detect gpio

Diffstat:
--------

 arch/arm/boot/dts/omap3-n900.dts       | 12 ++++++++----
 drivers/input/mouse/elan_i2c_core.c    |  9 +++++----
 drivers/input/mouse/synaptics.c        |  1 +
 drivers/input/serio/i8042-x86ia64io.h  |  7 +++++++
 drivers/input/touchscreen/elants_i2c.c |  1 -
 include/linux/input/elan-i2c-ids.h     |  7 +++++++
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/input-event-codes.h |  3 ++-
 8 files changed, 31 insertions(+), 11 deletions(-)

Thanks.


-- 
Dmitry
