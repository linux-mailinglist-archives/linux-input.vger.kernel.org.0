Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085D44B2F61
	for <lists+linux-input@lfdr.de>; Fri, 11 Feb 2022 22:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353680AbiBKVbn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Feb 2022 16:31:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241594AbiBKVbn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Feb 2022 16:31:43 -0500
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Feb 2022 13:31:41 PST
Received: from hs01.dk-develop.de (hs01.dk-develop.de [IPv6:2a02:c207:3002:6234::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7A1C57
        for <linux-input@vger.kernel.org>; Fri, 11 Feb 2022 13:31:41 -0800 (PST)
From:   Danilo Krummrich <danilokrummrich@dk-develop.de>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
Subject: input: ps2-gpio: use ktime for IRQ timekeeping
Date:   Fri, 11 Feb 2022 22:22:55 +0100
Message-Id: <20220211212258.80345-1-danilokrummrich@dk-develop.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series implements the usage of ktime for IRQ timekeeping to
overcome:

(1) The resolution limitations of jiffies.
(2) Potential spurious IRQs generated by gpio controllers.

Besides that, based on the newly implemented timekeeping, it fixes a wrongly
suspected extra clock cycle for TX transfers and a race condition when
starting an immediate TX transfer based on data received from an RX transfer.


