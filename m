Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F12117C43
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 01:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfLJATT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:19:19 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:19197 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727306AbfLJATT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 19:19:19 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X0wr2glqz5Y;
        Tue, 10 Dec 2019 01:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575937004; bh=t+VaC7h+fBVsqu5Z4LuLuPCdKOSJ/Kw3AhWBXb/C26I=;
        h=Date:From:Subject:To:Cc:From;
        b=lFj/1oFr1KKC/ay96w2T4qUWPCLPOXbhdqoV4ZNdiMrWPuhqDZzLkk02WhphD6jfz
         IqxIwzJXpKAYwvHtdLzK6xT0TAusBZogYdi7UHt8wRTyb8vQiMW5rNOalHDC6ec02U
         ZS1+48xlJomEGUBEz5WQCV8AkjsBYj0J21zt6Q0PAYlVtMQ6eb8ZyOQxCMSW/ybmHh
         8yeRnnWG+BPPRzTMGOUkmaUecHwZCVxWf/r6yccvxbHO0pSgNKKdi6u91YFBqtBXk1
         S65Kxy3Wd5CVTFZIJAsSO7CxvlG7N4666sRKLQkD9ej9m30JB5v5YCP3+baL/9vbQ9
         V91lFJ2rcV6qA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 01:19:15 +0100
Message-Id: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/6] input: elants: Support Asus TF300T touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series implements changes needed to support EKTF3624-based touchscreen
used in eg. Asus Transformer Pad TF300T.

Michał Mirosław (6):
  input: elants: document some registers and values
  input: elants: support old touch report format
  input: elants: support common touchscreen DT properties
  input: elants: detect max_x/y from hardware
  input: elants: refactor elants_i2c_execute_command()
  input: elants: read touchscreen size for EKTF3624

 drivers/input/touchscreen/elants_i2c.c | 365 ++++++++++++++++---------
 1 file changed, 237 insertions(+), 128 deletions(-)

-- 
2.20.1

