Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8477F3060FF
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 17:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343960AbhA0Q2w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 11:28:52 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:45651 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343760AbhA0Q2n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 11:28:43 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MT9zD-1lYsr601ct-00UdtE; Wed, 27 Jan 2021 17:26:03 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 0/3] Add quirks to AMD Sensor Fusion Hub driver
Date:   Wed, 27 Jan 2021 17:25:57 +0100
Message-Id: <20210127162600.35927-1-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wqQICO0iEHYWMgo49KioXh6iVCPcIX44P8QhzZS1+sHOr0mQAfR
 j9KvfL0C1SUK2MriXLlrgvp33dttyDN5wwo/3yFVmLAilT3PqLSUsJ7i/CHQ5urEzZwWRn8
 1O9WqqF67BWxhRenuvSBcSIYmdFmb4csc4OPP6eTlMxU0Kq8itRVU+I+3bYI12tPCd49e4W
 6vidVRncYDDxbtCREl1IA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fzExLOhzMaQ=:URYh/JD0zJso0i/z5YHbuo
 cxSYdX0U9W+vnI0hFtoUC8H6hmEd+V9yQRPRArZdeptQs6PVQ0m1Jq4eahyBBz3KiCClCNSwx
 yZJ9h8CLlkluKgOvpRvYRehQwYp5GvIhWMcypkuA0xtAxo06wWkymvUWLmJUe/FY5a5zsghBE
 VMO50CqosN9+9dUiysmk3gQXzfdutvX970s78UfA3fREatd9JaX2EMo1EUh9ZH7kRenT9H3gg
 Pq92os8zXjjyTaG7oJ58mWs+0tQPQwU7IYUbH4gVVm/FKXJ6B27S504U+WmFiIGphtZzLjSOc
 jQk5uKuC10ral52C5qrhA3xPMZkuV/icSUd+KKDRMqfrKGWK7VHHwJeKgtd/jIFFD4mLk2aUk
 ypqniYnFMoC/TrEeFnZ9VC0HxOiT5xuc+rzICzgoUDXfzBTKakOWz+eOEQ8Wl6nAdDs/euryu
 v4YGP+uyPA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

This patch adds quirks to the upstream (v8) version of the
AMD Sensor Fusion Hub driver.
The quirks provide a function to detect the sensor mask for systems
that do not have it stored in the AMD_P2C_MSG3 register.
The information about the systems IDs and available sensors was
taken from: https://bugzilla.kernel.org/show_bug.cgi?id=199715

Changes since v1:
* Added missing object amd_sfh_quirks.o to amd_sfh-objs
* changed type of "system" in "amd_sfh_quirks_get_sensor_mask"
  - struct dmi_system_id -> const struct dmi_system_id

Richard Neumann (3):
  Outsourced sensor masks to PCI driver header.
  Added quirks to detect sensor masks.
  Updated MAINTAINERS

 MAINTAINERS                              |  1 +
 drivers/hid/amd-sfh-hid/Makefile         |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 16 +++----
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 15 +++++++
 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c | 55 ++++++++++++++++++++++++
 5 files changed, 79 insertions(+), 9 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c

-- 
2.30.0

