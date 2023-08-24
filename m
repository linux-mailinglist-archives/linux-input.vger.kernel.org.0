Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B763C786756
	for <lists+linux-input@lfdr.de>; Thu, 24 Aug 2023 08:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbjHXGO2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Aug 2023 02:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240013AbjHXGON (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Aug 2023 02:14:13 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A909110F4
        for <linux-input@vger.kernel.org>; Wed, 23 Aug 2023 23:14:11 -0700 (PDT)
Date:   Thu, 24 Aug 2023 06:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1692857647; x=1693116847;
        bh=xpt42YaaVzQtXMYCA4iAxjyjIO4b2Vddiay/Z8KqYDs=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=WXNbKvQJEw4SpYjOtNiiRX37y802dXjQG88NyB6Jh7WLea5+zLV8SxLH2vaUTXOwU
         lRcy/ncRVJTkgbilEZAmXuGxFZvnq8qiqaG51LhpSrCXaujS7AhiNkNttf3dK8uAjL
         Pu3nim5vNQbQ4je0KY07D9eHxVToKJirSaJ8EYGq6AMeNCWoRmoMPJd+RMrgVBCQQ8
         CLFnD6/I2Z87/NHsAL1PaTVCbPEsbpLho3psUqKxro/tmz/Z97OSgriuudwWkL1ATn
         AgxVm+DHkFywngrtKfkWSy36Fed/VFC2RcnSzWhHLSgFq2T5jxsS+yqAi5XH678cgR
         J9U9sEl3H32nQ==
To:     linux-input@vger.kernel.org
From:   Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH HID 0/3] Fix devm references used in HID drivers when allocating input_dev name
Message-ID: <20230824061308.222021-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Maxime Ripard analyzed the following situation involving a use-after-free c=
aused
by incorrect devres management.

  1. input_dev name allocated as a resource referring to the same input_dev
     instance
  2. The input_dev is eventually unregistered
  3. Unregistering the device first involves releasing devres managed resou=
rces
     tied to the input_dev
  4. A uevent is then fired for the input_dev, referencing various members =
of
     the input_dev including the name
  5. This leads to a use-after-free in the context of the triggered uevent

Dmitry Torokhov pointed out that the correct pattern for devm usage with th=
e
input_dev would be to allocate the resource referencing the underlying devi=
ce
that was probed by the driver than referencing the input subdevice instance=
. In
the case of hid drivers, the name resource will only be freed when devres
management reclaims resources for the hid_device. This will be after the
input_dev was unregistered and the uevent referencing the name was invoked.

This patch series applies the analysis done to correct problematic HID driv=
ers.

Link: https://lore.kernel.org/linux-input/ZOZIZCND+L0P1wJc@penguin/T/#m443f=
3dce92520f74b6cf6ffa8653f9c92643d4ae

Rahul Rameshbabu (3):
  HID: uclogic: Correct devm device reference for hidinput input_dev
    name
  HID: multitouch: Correct devm device reference for hidinput input_dev
    name
  HID: nvidia-shield: Reference hid_device devm allocation of input_dev
    name

 drivers/hid/hid-multitouch.c    | 13 +++----------
 drivers/hid/hid-nvidia-shield.c |  2 +-
 drivers/hid/hid-uclogic-core.c  | 13 +++----------
 3 files changed, 7 insertions(+), 21 deletions(-)

--=20
2.40.1


