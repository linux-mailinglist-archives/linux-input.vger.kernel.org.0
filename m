Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB3F7897BC
	for <lists+linux-input@lfdr.de>; Sat, 26 Aug 2023 17:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjHZPdX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 11:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjHZPcw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 11:32:52 -0400
X-Greylist: delayed 448 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Aug 2023 08:32:49 PDT
Received: from mail.enpas.org (zhong.enpas.org [IPv6:2a03:4000:2:537::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C6710C
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 08:32:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id A9C0C10071F;
        Sat, 26 Aug 2023 15:25:13 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Max Staudt <max@enpas.org>
Subject: [PATCH 0/2] xpad, hid-sony: Report analog buttons
Date:   Sun, 27 Aug 2023 00:21:09 +0900
Message-Id: <20230826152111.13525-1-max@enpas.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear input maintainers,

I would like to add support for pressure sensitive buttons on the
original Xbox gamepad, as well as the PlayStation 3 controllers.


In an attempt to maximise backwards compatibility, the attached patches
add the corresponding analog values for BTN_A..BTN_Z as ABS_MISC+0..+5,
L1/R1 as ABS_HAT1Y/HAT1X, and the D-Pad as ABS_HAT0X/Y.

All of these axes have higher indices than any axes previously exposed,
so gamepad mappings in SDL keep working. Also, where possible, I have
stuck to the Linux gamepad specification (for HAT0/HAT1).


Now, I am wondering what best to do with the action buttons, since the
Linux gamepad specification does not foresee them being analog. In the
patches, they are reported as ABS_MISC+0..+5 - do you think this is
reasonable, or would a new ABS_* range at 0x40.. be better suited to
this task?


I'd appreciate your thoughts on the patches and on how to best add
analog buttons to the drivers!


Thanks,

Max


Patches included:
  [PATCH 1/2] xpad: XTYPE_XBOX: Report analog buttons
  [PATCH 2/2] hid-sony: DS3: Report analog buttons for Sixaxis


