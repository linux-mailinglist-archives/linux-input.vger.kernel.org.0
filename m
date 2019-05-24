Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA7229947
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403844AbfEXNu7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 09:50:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54908 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403833AbfEXNu7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 09:50:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 37795C079901;
        Fri, 24 May 2019 13:50:59 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-204-178.brq.redhat.com [10.40.204.178])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1CD397BE7E;
        Fri, 24 May 2019 13:50:53 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v3 0/8] Fix Elan I2C touchpads in latest generation from Lenovo
Date:   Fri, 24 May 2019 15:50:38 +0200
Message-Id: <20190524135046.17710-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 24 May 2019 13:50:59 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Here comes the v3.

Very few changes from v2:
- dropped the last 2 patches where I tried to be smart, and it turns out
  that it was not very a good idea
- also removed the only other blacklisted model, as it has been tested with
  the v2 and it is also now working properly

Cheers,
Benjamin

Benjamin Tissoires (8):
  Input: elantech - query the min/max information beforehand too
  Input: elantech - add helper function elantech_is_buttonpad()
  Input: elantech - detect middle button based on firmware version
  dt-bindings: add more optional properties for elan_i2c touchpads
  Input: elan_i2c - do not query the info if they are provided
  Input: elantech/SMBus - export all capabilities from the PS/2 node
  Input: elan_i2c - handle physical middle button
  Input: elantech: remove P52 and P72 from SMBus blacklist

 .../devicetree/bindings/input/elan_i2c.txt    |  11 +
 drivers/input/mouse/elan_i2c_core.c           |  72 +++-
 drivers/input/mouse/elantech.c                | 320 ++++++++++--------
 drivers/input/mouse/elantech.h                |   8 +
 4 files changed, 246 insertions(+), 165 deletions(-)

-- 
2.21.0

