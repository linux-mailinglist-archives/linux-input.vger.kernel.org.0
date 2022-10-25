Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3670960CBD7
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 14:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiJYM3n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Oct 2022 08:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbiJYM3m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Oct 2022 08:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD48136402
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666700980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Ssbbcz7CEfXDSJ5FbIl7oD7FCDjaGwC8ydQNVq9TtFA=;
        b=RFPbiSxSD1DdHC15Cke5BXspvhpbylFaEobf827cpTO3iLFIjUm+t7z/nEy9FxMDgC9Q9c
        SvuATtSG2dqHb02+JKbCUAWfZ1M1LdaoP7moeQlhUzPLSrQ4Ua/vP2wixs75DLlXsZko6P
        LR9lc0QKcfNOSXvX4psnqjDVXYB+ptI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-FUdcBoo4MiSwGozp-QF1xw-1; Tue, 25 Oct 2022 08:29:33 -0400
X-MC-Unique: FUdcBoo4MiSwGozp-QF1xw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B02F62A59570;
        Tue, 25 Oct 2022 12:29:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D91464A9279;
        Tue, 25 Oct 2022 12:29:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 0/4] Input: touchscreen - Goodix bugfix + settings mod-param support
Date:   Tue, 25 Oct 2022 14:29:26 +0200
Message-Id: <20221025122930.421377-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, et al,

The first patch in this set is a bugfix for the Goodix touchscreen driver,
it really is independent of the rest, but since the 4th patch will not
apply cleanly without this I have decided to send this as 1 big series.

If there are issues with the rest of the series please apply at least 1/4.

The rest of the series adds support for overriding various silead and
goodix touchscreen related device-properties from the kernel cmdline.
This is a reposting of an earlier version which had the following
cover letter:

On x86/ACPI platforms touchscreens mostly just work without needing any
device/model specific configuration. But in some cases (mostly with Silead
and Goodix touchscreens) it is still necessary to manually specify various
touchscreen-properties on a per model basis.

This is handled by drivers/platform/x86/touchscreen_dmi.c which contains
a large list of per-model touchscreen properties which it attaches to the
(i2c)device before the touchscreen driver's probe() method gets called.
This means that ATM changing these settings requires recompiling the
kernel. This makes figuring out what settings/properties a specific
touchscreen needs very hard for normal users to do.

This new settings parameter support is especially useful for helping
users to get their Silead touchscreens to work. These need to have
all of their settings (min-x, width, min-y, height, swapping, inverting)
hardcoded in touchscreen_dmi.c. The settings mod-param allows users
to find the right setting without them needing to be capable of
building their own kernel (and without a lot of rebooting) after which
they can ask someone with some kernel-dev experience to turn this into
a touchscreen_dmi.c patch for them (and yes the way this hw works sucks,
but we cannot change that).

An example of a user who was stuck getting their touchscreen to work and
who was helped by providing a kernel with the settings mod-param added:
https://github.com/onitake/gsl-firmware/discussions/193

Regards,

Hans


Hans de Goede (4):
  Input: goodix - Try resetting the controller when no config is set
  Input: touchscreen - Extend touchscreen_parse_properties() to allow
    overriding settings with a module option
  Input: silead - Add a settings module-parameter
  Input: goodix - Add a settings module-parameter

 drivers/input/touchscreen.c        | 103 ++++++++++++++++++++++++++---
 drivers/input/touchscreen/goodix.c |  18 ++++-
 drivers/input/touchscreen/silead.c |  26 +++++---
 include/linux/input/touchscreen.h  |  19 +++++-
 4 files changed, 142 insertions(+), 24 deletions(-)

-- 
2.37.3

