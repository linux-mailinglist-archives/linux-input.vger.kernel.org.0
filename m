Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C619725184
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 03:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240418AbjFGB2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 21:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234753AbjFGB2o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 21:28:44 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1DB199D
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 18:28:43 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id D4165A27B;
        Tue,  6 Jun 2023 18:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1686101322; bh=z/0xt8yMbbtcsefOTPQDzqHGcx+UQdKy096uNFuxUdE=;
        h=From:To:Cc:Subject:Date:From;
        b=fi/C5u0wpNs2Fj+OOxFMKKCfoj+Fqwwza1bnE8Bp1PpqgxS+PooPgeR5t1JcjxWSr
         oC5ZswNr8tqvKJcYqqsZ6edhrJeNMdJWlIWjytxLiFesdyIL9jLIDaxZOdIn7/e4Vx
         dr2CTUVISBc258srZE+EHOET7n6StaAzd2OoKm+E4iprbvfahJIDxGUhlBxdxlR43n
         tKTDDtkLsWzn31kTff/6rPKjz2SqdUXTBoaaJj4ikbpmJ5il27MF/mrCwYvtT9TC8o
         W1P+/wPV5lQNYlJoEKkJshqmgQ0QGzZucfFuyZxuNUmvp37Bjom1yikTYVbFtnoNJi
         fTQKo/0m87mSg==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 0/2] Input: xpad - Additional controller support
Date:   Tue,  6 Jun 2023 18:28:10 -0700
Message-Id: <20230607012812.379640-1-vi@endrift.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series includes two patches: one is a fixed resubmit of a previously
reverted patch (first applied as db7220c48d8d), and the other is a simple
addition to the VID table for Xbox One controllers.

Sam Lantinga (1):
  Input: xpad - Add GameSir VID for Xbox One controllers

Vicki Pfau (1):
  Input: xpad - fix support for some third-party controllers

 drivers/input/joystick/xpad.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.40.1

