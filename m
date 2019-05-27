Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F8E2B8C5
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfE0QPU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:15:20 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:19886 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfE0QPU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:15:20 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 12:15:19 EDT
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674678"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:08:10 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RG81EN028493;
        Mon, 27 May 2019 18:08:03 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:08:03 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 00/10] input: touchscreen: stmpe: ext. features
Date:   Mon, 27 May 2019 18:07:26 +0200
Message-ID: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.25.2.60]
X-KSE-ServerInfo: SUMMAIL01.UMK.KLS.zentral, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 27.05.2019 13:23:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This set of patches implements various features suppported by the STMPE811
touchscreen controller. It integrates certain properties to facilitate the
operation/integration with kernel provided interfaces/properties and userland
libraries, such as libinput.

Based on Linus' v5.2-rc2

Leif Middelschulte (10):
  dt-bindings: input: touchscreen: stmpe: add touch window configuration
  Input: stmpe-ts - implement touch window configuration support
  dt-bindings: input: touchscreen: stmpe: add resolution support
  Input: stmpe-ts - implement resolution support
  dt-bindings: input: touchscreen: stmpe: add XY mode
  Input: stmpe-ts - implement XY acquisition mode
  dt-bindings: input: touchscreen: stmpe: add axes inversion and swap
  Input: stmpe-ts - axes inversion and swapping
  dt-bindings: input: touchscreen: stmpe: add tracking index
  Input: stmpe-ts - implement tracking index

 .../bindings/input/touchscreen/stmpe.txt      |  35 ++++
 drivers/input/touchscreen/stmpe-ts.c          | 161 ++++++++++++++++--
 include/linux/mfd/stmpe.h                     |   1 +
 3 files changed, 185 insertions(+), 12 deletions(-)

-- 
2.21.0

