Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5491C431FC9
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 16:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhJROfr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 10:35:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54852 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229833AbhJROfp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 10:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634567613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zX7HGUsCfiKjj+VA4N3UsOYAYrUUNC8LJO4AASrIqXk=;
        b=eSDtOXqOVmKC3HPA9uUPO2FmOPGY37+z1/BevuJ3dqO1cnAQ4FwmnGMqZOidG6kvA0p/tI
        /g3rIOI9ulW0OE+UjQsOn1G+uxdf0aU8ODF8XbxDTeIHpzQutlw8FUR2hfR78x3e518nbi
        9PclgIDPEYqGrvSoU3zNYyNHK35XdiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-iRruZ8zyOyCALMFvMuOiqg-1; Mon, 18 Oct 2021 10:33:30 -0400
X-MC-Unique: iRruZ8zyOyCALMFvMuOiqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0A4101B4A0;
        Mon, 18 Oct 2021 14:33:28 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7A6C100E809;
        Mon, 18 Oct 2021 14:33:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC/pdx86/input: Introduce and use soc_intel_is_*() helpers
Date:   Mon, 18 Oct 2021 16:33:21 +0200
Message-Id: <20211018143324.296961-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

We have been open-coding x86_match_cpu() checks for enabling some
SoC specific behavior in various places.

The sound/soc/intel drivers used to also open-code this but this was
cleaned up a while ago introducing a number of soc_intel_is_*() helpers.

This series moves the definition of these helpers to a more public place
and uses it in a couple of more places outside the sound tree.

Mark, I know we are a bit late in the cycle, but if you can pick up
patch 1/3 (assuming on one objects) for 5.16, then the rest can be
applied after 5.16-rc1 is out.

Regards,

Hans


Hans de Goede (3):
  ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
  platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht
    helpers
  Input: axp20x-pek - Use new soc_intel_is_cht() helper

 drivers/input/misc/axp20x-pek.c            | 26 ++-------
 drivers/platform/x86/intel/int0002_vgpio.c | 14 +----
 include/linux/platform_data/x86/soc.h      | 65 ++++++++++++++++++++++
 sound/soc/intel/common/soc-intel-quirks.h  | 51 +----------------
 4 files changed, 75 insertions(+), 81 deletions(-)
 create mode 100644 include/linux/platform_data/x86/soc.h

-- 
2.31.1

