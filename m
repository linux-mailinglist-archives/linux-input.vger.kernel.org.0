Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A311C01F8
	for <lists+linux-input@lfdr.de>; Thu, 30 Apr 2020 18:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgD3QQv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Apr 2020 12:16:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49886 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgD3QQu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Apr 2020 12:16:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 9DDF82A28E5
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 0/2] Support inhibiting input devices
Date:   Thu, 30 Apr 2020 18:16:39 +0200
Message-Id: <20200430161641.24503-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Userspace might want to implement a policy to temporarily disregard input
from certain devices, including not treating them as wakeup sources.

An example use case is a laptop, whose keyboard can be folded under the
screen to create tablet-like experience. The user then must hold the laptop
in such a way that it is difficult to avoid pressing the keyboard keys. It
is therefore desirable to temporarily disregard input from the keyboard,
until it is folded back. This obviously is a policy which should be kept
out of the kernel, but the kernel must provide suitable means to implement
such a policy.

PATCH 1/2 adds support for inhibiting input devices, while PATCH 2/2
provides an example how to convert a driver to take advantage of this
new feature.

There are 

$ git grep "input_allocate_device(" | grep -v ^Documentation | cut -f1 -d: \
							| sort | uniq | wc
    388     388   13425

many input device drivers, so it is impossible to convert all of them
in one go.

This work is inspired by:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/45c2d7bb398f74adfae0017e20b224152fde3822

and

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/4ce0e8a3697edb8fd071110b3af65014512061c7

Dmitry Torokhov (1):
  Input: elan_i2c: Support inhibiting

Patrik Fimml (1):
  Input: Add "inhibited" property

 drivers/input/input.c               | 134 ++++++++++++++++++++++++++--
 drivers/input/mouse/elan_i2c_core.c | 108 +++++++++++++++++-----
 include/linux/input.h               |   8 ++
 3 files changed, 218 insertions(+), 32 deletions(-)


base-commit: 79799562bf087b30d9dd0fddf5bed2d3b038be08
-- 
2.17.1

