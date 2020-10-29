Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1ED29F29E
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 18:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJ2RJj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 13:09:39 -0400
Received: from thoth.sbs.de ([192.35.17.2]:55243 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgJ2RJj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 13:09:39 -0400
X-Greylist: delayed 328 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Oct 2020 13:09:37 EDT
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09TH43Lu018294
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Oct 2020 18:04:03 +0100
Received: from dev.vm7.ccp.siemens.com ([139.22.33.215])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 09TH43e2014419;
        Thu, 29 Oct 2020 18:04:03 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id E1A6970FF87;
        Thu, 29 Oct 2020 18:04:02 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     nick@shmanahar.org, hadess@hadess.net, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH 0/3] Firmware loading option
Date:   Thu, 29 Oct 2020 18:03:10 +0100
Message-Id: <20201029170313.25529-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add option to prevent firmware/configuration loading during each boot.

Andrej Valek (3):
  Input: goodix - add option to disable firmware loading
  dt-bindings: goodix
  Input: atmel_mxt_ts - add option to disable firmware loading

 .../bindings/input/touchscreen/goodix.yaml      |  1 +
 drivers/input/touchscreen/atmel_mxt_ts.c        | 17 ++++++++++++++---
 drivers/input/touchscreen/goodix.c              |  4 +++-
 3 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.20.1

