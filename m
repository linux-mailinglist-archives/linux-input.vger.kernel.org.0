Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0CA3075A9
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhA1MOP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32702 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229885AbhA1MOK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611835960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DD/eCwEXbczpQQ9Bv1Zfv30VXydKFcvvdfV2DM1GLUY=;
        b=J14ltTEqwQ5jZKRLcBTrzsGln2clabNGwH551zpbRykNpesAY6dPc1KU+TUoelJPRzE+nQ
        XR9LD1i4bz1aziOm6HUtfIAnpGkTNNntbBkhh+XkjfE6pMcua65hKUIRSetGYASYcNgjBC
        EWxRqoM9KlElAFmXZRXBgROH+erSD+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-e7iMefS4Pxiywo6zZRhGzA-1; Thu, 28 Jan 2021 07:12:37 -0500
X-MC-Unique: e7iMefS4Pxiywo6zZRhGzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82AD1193410B;
        Thu, 28 Jan 2021 12:12:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-250.ams2.redhat.com [10.36.114.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CE1895D9F6;
        Thu, 28 Jan 2021 12:12:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/3] AMD_SFH: Allow overriding sensor-mask by module-param or DMI-quirk
Date:   Thu, 28 Jan 2021 13:12:16 +0100
Message-Id: <20210128121219.6381-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

There are several bug-reports about the new AMD_SFH driver not working
on various HP ENVY x360 Convertible models. The problem is that the
driver expects the BIOS to program which sensors are present into the
active bits of the AMD_P2C_MSG3 register; and the BIOS on these models
does not do this:

https://bugzilla.kernel.org/show_bug.cgi?id=199715
https://bugzilla.redhat.com/show_bug.cgi?id=1651886

This patch-set adds a module-parameter + DMI-quirk mechanism to override
the settings read back from the AMD_P2C_MSG3 register, to work around
this problem. The DMI-quirk table is populated with 2 HP ENVY x360
Convertible models which are know to need this workaround.

There also is a much larger refactoring patch-set pending from
Richard Neumann, who is also involved in the bugzilla.kernel.org bug.

But it looks to me like that will need a bit more more work before
it is ready for merging, where as (IMHO) this set is ready for
merging now. So IMHO it would be good to first merge this patch-set
to get this fix into the hands of end-users of these devices.

Note there still is an open issue on these devices where the
sensors stop working after a suspend/resume cycle.

I wonder if the driver should perhaps not only not use the
active bits of the AMD_P2C_MSG3 register for determining which
sensors are there, but if it should actually write to those bots
with the correct settings.

Sandeep, do you have any ideas what might be the problem here?
Should I ask the reporters to test a patch which actually
updates the active bits?

Regards,

Hans



Hans de Goede (3):
  AMD_SFH: Removed unused activecontrolstatus member from the
    amd_mp2_dev struct
  AMD_SFH: Add sensor_mask module parameter
  AMD_SFH: Add DMI quirk table for BIOS-es which don't set the
    activestatus bits

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 40 ++++++++++++++++++++++++--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  1 -
 2 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.29.2

