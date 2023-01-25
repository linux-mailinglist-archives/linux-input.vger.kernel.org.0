Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174F867B062
	for <lists+linux-input@lfdr.de>; Wed, 25 Jan 2023 11:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjAYKzE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 05:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbjAYKzE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 05:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69D546A6
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 02:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674644062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=o0cPEb+IPoauf2zVIHkUBiYmWIfHKFqCE/TEOad+BwQ=;
        b=cniUKFx/5kxwRpPt9o9GaWLU4zgZU4TD1JEj71eVC+jSsAWWG9rRf4XJADVTkMns2UkpaQ
        5S9MdzELLG+pBS7VOsW8n0x2ZIKkZB4oXeOG+qtAsQi8x40t9qDQ5O1H8AfWU9L8W9I7qs
        XC+sBc4xYmuuaXybWrr5Z5DIMjwwdCQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-mKn82PT4PMC8gWC1BqiNuQ-1; Wed, 25 Jan 2023 05:54:18 -0500
X-MC-Unique: mKn82PT4PMC8gWC1BqiNuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B5053C025D9;
        Wed, 25 Jan 2023 10:54:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.104])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3CD614085720;
        Wed, 25 Jan 2023 10:54:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 0/3] Input: touchscreen - settings module-param support
Date:   Wed, 25 Jan 2023 11:54:13 +0100
Message-Id: <20230125105416.17406-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, et al,

This is a resend, because the discussion surrounding this patch-set
seems to have dried up without really coming to any conclusion
(summary of previous discussion below).

Original cover-letter (edited for already merged bugfix):

"""
This series adds support for overriding various silead and
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
"""

Dmitry, you replied to the first patch of this series with:

"""
I totally understand the motivation for this, but I do not think that
having special handling for only touchscreen properties is the right
thing to do. I would very much prefer is we had a more generic approach
of adding/overriding properties (via an swnode?).
"""

To which I wrote the following long reply:

"""
I understand where you are coming from, but I suspect the devicetree
folks are going to not like any generic solution for 2 reasons:

1. Allowing overriding devicetree properties like regulator voltage is a bad idea,
granted users can already do this with a custom DTB, but that is a higher
threshold to pass for a user then just adding something on the kernel cmdline

2. Devicetree supports devicetree-overlays and I expect the devicetree folks
to steer people who want to override random devicetree  properties in that
direction (or in the direction of using a custom DTB)

So the ACPI/x86 case really is somewhat special here and especially the
silead touchscreens are special here. Normally all the settings we are
talking here come from ACPI tables (or can directly be read from the
touchscreen controller) and then messing with these settings would be
a case of using an initrd with a custom ACPI DSDT, just like how
on devicetree I think we would expect people to use a custom DTB and
or a devicetree overlay.

but because of this info lacking from the ACPI tables we have it
hardcoded per 2-in-1/tablet model in:
drivers/platform/x86/touchscreen_dmi.c

The downside of this hardcoding is that testing new settings requires
building a custom kernel, which is both not helpful for having
a quick change settings -> test -> adjust settings cycle when trying
to find the right settings for a new model as well as quite a steep
hill to climb for novice users who want to get things to work on
a new model.

So I do believe that because of this the touchscreen properties
or special in this case and a somewhat custom solution to allow
setting just the touchscreen properties from the cmdline thus
is justified.

Also:

1. Having a mechanism specific to touchscreen properties is
simpler (more KISS) then having to come up with some more
complicated generic property override mechanism.

2. A touchscreen property specific mechanism is much less
susceptible to being misused. Setting the touchscreen properties
wrong cannot really result in any harm. OTOH setting the
max / end-of charging voltage of a lipo cell to 4.6 volt
(this is a real world example) is very much harmful.

The lipo-cell max charge voltage is something which we
in the sysfs interface deliberately disallow to be set any higher
then the boot-time value (lower is allowed). Adding a generic
cmdline mechanism for setting properties would allow
overriding this.
"""
 
And then the discussion stopped.

Regards,

Hans


Hans de Goede (3):
  Input: touchscreen - Extend touchscreen_parse_properties() to allow
    overriding settings with a module option
  Input: silead - Add a settings module-parameter
  Input: goodix - Add a settings module-parameter

 drivers/input/touchscreen.c        | 103 ++++++++++++++++++++++++++---
 drivers/input/touchscreen/goodix.c |   7 +-
 drivers/input/touchscreen/silead.c |  26 +++++---
 include/linux/input/touchscreen.h  |  19 +++++-
 4 files changed, 131 insertions(+), 24 deletions(-)

-- 
2.39.0

