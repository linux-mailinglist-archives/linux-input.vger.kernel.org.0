Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32996305FE2
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 16:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhA0PnD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 10:43:03 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:35141 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbhA0Pic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 10:38:32 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsrV2-1lxhr70MA4-00t9iD; Wed, 27 Jan 2021 16:35:37 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 0/3] Add quirks to AMD Sensor Fusion Hub driver
Date:   Wed, 27 Jan 2021 16:35:30 +0100
Message-Id: <20210127153533.21560-1-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CMPioaqx58GGGmL/cKH7V7Y5fCUxAj9kTdxp2cuKApCVZGtMVGm
 Hdz5Mq5CL810tc2uqwGQNzm6a82ixotDdMVmMlmBJWGlU9N0arr8WVZ5ImcdLPceLJHjrOy
 yNwvwgP/t4OUgVdoAfQvjStDtVNzx3Eg9YkKfZ8tkGngr907K80w+nrcQRVlcbOiXKm95X+
 s56+Z6p9YXofnIW8pdJmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DdsZPyuWxlw=:J7uNjQVOrfKHIlw+wNIImv
 hilKmBKHhC1PHgSzD3w6F+dOAufQvW1H8vnpcHCOBrdxDKNCZxwhwm/vthqxiwwHx2cfp7ho+
 NFSSAFLl0Au5sV0xUUDhrnOdZN8i3GbvG7V4B6YHnrft4LBGytpExT+hPVtJRzXILRqdQiDpm
 K9sj37+0Q1QtM58cQsytQMftXdFSxyMnRRKvX0a64mLrBOzSEPr5DMD6WUZa4Bi9L00jPGcMv
 Sz2JaXIxg9L8lKlYayGoAiTxDQ5EcphZ4hTaqy814RUJa9R9nZ/xx/Dd8BVL/5UdKLcIvWeRC
 VEV2a2mMQqVEEwJQ1ccWmX9jMoXmGon13vY2Zv4c8Dk1jjwxfwnf8Im8El5q6JNNIZ4Cu1VFa
 oHZXYQGEeCXTlSBKrkOHyEtPfB5a9oByDLYuDjT3qT+tPKlG4FztFI3TJ9k5P+eo8xjaXAFG1
 UdJE87tdVQ==
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

Richard Neumann (3):
  Outsourced sensor masks to PCI driver header.
  Added quirks to detect sensor masks.
  Updated MAINTAINERS

 MAINTAINERS                              |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 16 +++----
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 15 +++++++
 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c | 55 ++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 9 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c

-- 
2.30.0

