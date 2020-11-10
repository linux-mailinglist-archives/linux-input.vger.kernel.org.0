Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A042ADDF8
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 19:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731371AbgKJSQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 13:16:39 -0500
Received: from david.siemens.de ([192.35.17.14]:58909 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKJSQh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 13:16:37 -0500
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AAIGLNN019030
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 19:16:21 +0100
Received: from dev.vm7.ccp.siemens.com ([167.87.14.175])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0AAIGKKn021055;
        Tue, 10 Nov 2020 19:16:20 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 741DA70BAB5;
        Tue, 10 Nov 2020 19:16:20 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v4 0/4] Firmware loading option
Date:   Tue, 10 Nov 2020 19:15:46 +0100
Message-Id: <20201110181550.23853-1-andrej.valek@siemens.com>
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

 .../bindings/input/touchscreen/goodix.yaml    |  4 ++
 drivers/input/touchscreen/atmel_mxt_ts.c      | 17 ++++--
 drivers/input/touchscreen/goodix.c            |  4 +-
 drivers/input/touchscreen/st1232.c            | 52 +++++++++++++------
 4 files changed, 57 insertions(+), 20 deletions(-)

-- 
2.20.1

