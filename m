Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE811722FA
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 17:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbgB0QQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 11:16:02 -0500
Received: from hermes.aosc.io ([199.195.250.187]:55146 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729258AbgB0QQC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 11:16:02 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 1074B4B2DD;
        Thu, 27 Feb 2020 16:08:30 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 0/3] Add support for Goodix GT917S touch controller
Date:   Fri, 28 Feb 2020 00:07:59 +0800
Message-Id: <20200227160802.7043-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1582819721;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
        bh=FpRj0r9YXZ520UOqR7tl+VuCJUkCeKC7tvRB0u7eAwI=;
        b=KvjohEZ1c4KgUwjgW1MUuLW66Wbg+BMWwEXG7FCHrhtM+IqbBIotsPCuEtEyfSbCkE2Mfs
        4rY25BOhxEf5g//KkUSpixfjR7WKwBxig16gqcRh7l8aifYUys5WZYcehuoxpBqJxYAgFz
        tpI/C8uUgz9u/C9aa+8oW8p/kyq1f1Y=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset introduces support for Goodix GT917S touch controller.

The major difference with other touch controllers from Goodix is that
the ID string is no longer number-only (it contains a 'S'), so an
additional patch is introduced for migrating the ID to a string.

Icenowy Zheng (3):
  dt-bindings: input: touchscreen: add compatible string for Goodix
    GT917S
  Input: goodix - use string-based chip ID
  Input: goodix - Add support for Goodix GT917S

 .../bindings/input/touchscreen/goodix.yaml    |  1 +
 drivers/input/touchscreen/goodix.c            | 63 +++++++++++--------
 2 files changed, 38 insertions(+), 26 deletions(-)

-- 
2.24.1

