Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DF12AD20C
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 10:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJJIF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 04:08:05 -0500
Received: from david.siemens.de ([192.35.17.14]:38571 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgKJJIF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 04:08:05 -0500
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AA97pEX003269
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 10:07:51 +0100
Received: from dev.vm7.ccp.siemens.com ([167.87.134.60])
        by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 0AA97oYf018712;
        Tue, 10 Nov 2020 10:07:50 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 5E96B70BAB5;
        Tue, 10 Nov 2020 10:07:48 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v3 0/4] Firmware loading option
Date:   Tue, 10 Nov 2020 10:07:16 +0100
Message-Id: <20201110090720.6650-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-1-andrej.valek@siemens.com>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add option to prevent firmware/configuration loading during each boot.

Andrej Valek (4):
  Input: goodix - add option to disable firmware loading
  dt-bindings: touchscreen: goodix: add info about disabling FW loading
  Input: atmel_mxt_ts - add option to disable firmware loading
  Input: st1232 - add support resolution reading

 .../bindings/input/touchscreen/goodix.yaml    |  1 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 17 ++++--
 drivers/input/touchscreen/goodix.c            |  4 +-
 drivers/input/touchscreen/st1232.c            | 52 +++++++++++++------
 4 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.20.1

