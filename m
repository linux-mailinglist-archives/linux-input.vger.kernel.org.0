Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C05D13B8D5
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 06:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgAOFM4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jan 2020 00:12:56 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38517 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725857AbgAOFM4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jan 2020 00:12:56 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 70BE222063;
        Wed, 15 Jan 2020 00:12:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 15 Jan 2020 00:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=cCfNpcLfulKvvKIqmX9Urmpb5z
        9P3CxW2vuUSkqMzMc=; b=JtHRU5AI3xckgQuUm+7i6AD9HKNy2BOoCNUDLrFTtC
        2ztp7GvUUNdJMG3kl8Lk8s7wO3xcYd3keSN/0JOzvDdX9iDasKYNjm7gVG6lVaLu
        Idpep/hOQ3pr00fFGY4VXR/dTbX+lFcY2h+yVk+zRQhb5s7Ni9OgZmJgW+oumG0+
        dDq3IwWByP5Vzi8Jay/knfrFTx+W1CFz5M+WJHJ/vCkmlLG8mtBnKhPE4KCyMQPO
        cDDJfOmhpnmEJO9rDkMLqZnlWPnZjeT1WgwASh7FklgvcpZfBKUS6hSyWU1Dtke1
        //p/eLte8677ZHTSWZaGvOfwnToQN07gLCzMdzOK5Ebg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cCfNpcLfulKvvKIqm
        X9Urmpb5z9P3CxW2vuUSkqMzMc=; b=r8QJ1Vcics+fQayn22PFOtreHCDzn32Da
        ubBpgJNu3o42EJ9NSwYRsZTY8X+6+YN4hB3/9iZONch8hi1d5aVhDwrGnhtFH7ZO
        ZbL+tLPyQ8LKi2TICo+oT+nwble3q4NSF757+9jONIKEw+wG5UdbvOOv1Tvl5i2L
        keQWF3sRmTtYem3JW41BCJxUYAjRFq2ZU7GyUHYBzrRCYvPvqQkTIxtNSqcQnXLE
        xUb5C5edwZC8lBNhaY0F2XEmJf0eAY6Lhpfqrjk5eIKxIVi7GZ5FlcshsrSJSm+q
        1dvMzjQvmzUTPdzlVHvCZetQwPI4Bunnlos2bHJ0JTPvLSj0W8lDA==
X-ME-Sender: <xms:Vp8eXhuot-Eqv06n5ac9k2NpeMlSAmPbMK3ODFO9MaH1PZpzF2-bPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
    drudefhedrudegkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghl
    sehshhholhhlrghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Vp8eXtnXQlInpbgXOzevds2m35wwryV1akxb9agFcxvwhuxR0R73QQ>
    <xmx:Vp8eXiNvr2IjbNdNqYd2KIF2YGr4F4K8QqvXxu7vFXL4mbEpWrGeOQ>
    <xmx:Vp8eXsxC8n_JvR_O_O8kiARUhZPRnFR4bzJ40aa7p8i3Esfc__aUMA>
    <xmx:V58eXiBMYHeiZtqu6FIpRwZMkT96zuRx8rt8rrGkpXknAGLZRuL_Gg>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id D79018005C;
        Wed, 15 Jan 2020 00:12:53 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 0/2] Input: axp20x-pek wakeup enablement
Date:   Tue, 14 Jan 2020 23:12:51 -0600
Message-Id: <20200115051253.32603-1-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series allows enabling or disabling wakeup via the power button on
X-Powers PMICs, for all AXP2xx/AXP8xx variants. This v2 of the patch
series keeps the existing behavior of the AXP288 variant used on x86
platforms.

Changes since v1:
 - Drop patch 1
 - Use __maybe_unused instead of "#ifdef CONFIG_PM_SLEEP" [patch 2]
 - Add Reviewed-by [patch 3]

Samuel Holland (2):
  Input: axp20x-pek - Respect userspace wakeup configuration
  Input: axp20x-pek - Enable wakeup for all AXP variants

 drivers/input/misc/axp20x-pek.c | 38 +++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

-- 
2.23.0

