Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB99E25027
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfEUN1a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35176 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfEUN1a (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EDEF43082E58;
        Tue, 21 May 2019 13:27:24 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4D33E60F8D;
        Tue, 21 May 2019 13:27:20 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 00/10] Fix Elan I2C touchpads in latest generation from Lenovo
Date:   Tue, 21 May 2019 15:27:02 +0200
Message-Id: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 21 May 2019 13:27:30 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is the v2 from https://lkml.org/lkml/2018/10/12/633

So I initially thought it would be easy to integrate the suggested changes
in the v1, but it turns our that the changes to have the touchscreen-width
and height parameters were quite hard to do.

I finally postponed the issue by blacklisting the 2 laptops we knew were
not working and tried to devote more time to understand both drivers more.

But it s the time where Lenovo is preparing the new models, and guess what,
they suffer from the same symptoms.

So I took a few time to work on this and finally got my head around the
width and height problem. Once I got it, it was simple clear, but this also
means we can not really rely on a device tree property for that.

So in the elan* drivers, the "traces" are simply how many antennas there
are on each axis. Which means that if a trace of 4 is reported in the
events, it means it is simply seen by 4 antennas. So the computation of the
width/height is the following: we take how many antennas there are, we
subtract one to have the number of holes between the antennas, and we
divide the number of unit we have in the axis by the value we just
computed.
This gives a rough 4mm on the P52, in both directions.

And once you get that, you can just realize that the unit of the width and
height are just the same than the X and Y coordinates, so we can apply the
same resolution.

So, in the end, that means that elan_i2c needs the information, or it will
not be able to convert the number of crossed antennas into a size, but this
is something specific to this touchpad.

So here come, 7 months later the v2 on the subject.

Cheers,
Benjamin

Benjamin Tissoires (10):
  Input: elantech - query the min/max information beforehand too
  Input: elantech - add helper function elantech_is_buttonpad()
  Input: elantech - detect middle button based on firmware version
  dt-bindings: add more optional properties for elan_i2c touchpads
  Input: elan_i2c - do not query the info if they are provided
  Input: elantech/SMBus - export all capabilities from the PS/2 node
  Input: elan_i2c - handle physical middle button
  Input: elan_i2c - export true width/height
  Input: elan_i2c - correct the width/size base value
  Input: elantech: remove P52 from SMBus blacklist

 .../devicetree/bindings/input/elan_i2c.txt    |  11 +
 drivers/input/mouse/elan_i2c_core.c           |  85 +++--
 drivers/input/mouse/elantech.c                | 318 ++++++++++--------
 drivers/input/mouse/elantech.h                |   8 +
 4 files changed, 251 insertions(+), 171 deletions(-)

-- 
2.21.0

