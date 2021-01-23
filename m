Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F233D301585
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 14:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAWNuD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 08:50:03 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:45419 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbhAWNuB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 08:50:01 -0500
Received: from envy.fritz.box ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MplHR-1lmnYA40ab-00qBul; Sat, 23 Jan 2021 14:47:20 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/8] AMD Sensor Fusion Hub driver refactored
Date:   Sat, 23 Jan 2021 14:47:08 +0100
Message-Id: <20210123134716.13414-1-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RUKlQ+79S0Ma3wPGEYyRt3mL/To018TmsD/nvA1k2V1LMXN0UR2
 jkr2uBWk2fCOCsJxMkH9YvYzc9o1krN0Wzvcif9A3+KZF1wF77mB6ZR0k9MYWUnesAsL7yp
 Ob8LJK/v2unxabvO8AwTGOH9k93DPts+BZw7ycqviwzyCbUGclkuPpYRTQnKOyb1pg1EXHV
 xHxbCX+2IHlBdfOUlMTxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QkjgghGme1A=:DAP0Shfn9sx4QZ7uADDyEh
 qHkvrKrTk73faoF3/vU7K4S8ycOF/Ksw7YFughStCf/YzfWLj59rY3tJ1kLiWzFRoDRBWu5g7
 xMrYC3vmN7146dSKGMyD31S/VWZImvLe1WGuSMXLKcg6yWtJFArl4GlkufIqjV+cgtbXLMvw/
 CetSHEMZ03cRABNvdCyd9gG1QdiDLp5Lp12JetvzWGJZ8UEk3qSKDOsVW+yscnVIQfaJxmwE0
 wKeR67h9qxaS9f+HGA0mMeFD8Bg08kgjcHUNnxzjlWBezSu2xgdDD7qP6TmVBQ84YEG2Djq7V
 KRrPg88nLQRhQFu7gdBnbTjKVvWqwLqErQKTNx93Pq3yfjp2PtV7UbZt67NJRAajOmwYvWN9A
 ytyy1KcVJPm2JkenZBUPD1HKZEsYNKHAFXKOpfUi3ZbFmIcZG0mYgcqm9YwQdUq2valHZJGqT
 R9ptdzga4g==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

This patch series contains a refactored version of AMD's Sensor Fusion Hub driver.

Core changes are:

* Flattened out source code structure.
* Strict separation of driver parts:
  - PCI device driver
  - Platform driver
  - HID low-level driver
* Implemented HID low-level driver as per API description with appropriate functions:
  - start / stop
  - open / close
  - parse
  - raw_request
* Added meta information to the respective HID devices.
  - sensor type
  - bus type
  - physical device name

Richard Neumann (8):
  Updated MAINTAINERS
  Updated documentation
  Updated Kconfig
  Updated Makefile
  Refactored HID descriptor and report generators.
  Refactored HID LL driver.
  Refactored platform driver
  Refactored PCIe driver

 Documentation/hid/amd-sfh-hid.rst             | 275 +++++++-------
 MAINTAINERS                                   |   1 +
 drivers/hid/amd-sfh-hid/Kconfig               |   4 +-
 drivers/hid/amd-sfh-hid/Makefile              |  14 +-
 ...eport_desc.h => amd-sfh-hid-descriptors.h} |  51 ++-
 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c  | 175 +++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h  |  41 ++
 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c | 354 ++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h | 102 +++++
 drivers/hid/amd-sfh-hid/amd-sfh-pci.c         | 226 +++++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-pci.h         | 112 ++++++
 drivers/hid/amd-sfh-hid/amd-sfh-plat.c        | 327 ++++++++++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-plat.h        |  38 ++
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 246 ------------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c         | 174 ---------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  67 ----
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 152 --------
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  79 ----
 .../hid_descriptor/amd_sfh_hid_desc.c         | 224 -----------
 .../hid_descriptor/amd_sfh_hid_desc.h         | 107 ------
 20 files changed, 1539 insertions(+), 1230 deletions(-)
 rename drivers/hid/amd-sfh-hid/{hid_descriptor/amd_sfh_hid_report_desc.h => amd-sfh-hid-descriptors.h} (95%)
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-pci.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-pci.h
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-plat.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-plat.h
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_client.c
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_hid.c
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_hid.h
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
 delete mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
 delete mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h

-- 
2.30.0

