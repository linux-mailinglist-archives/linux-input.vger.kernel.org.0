Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CF1364E4
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 21:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfFETqF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 15:46:05 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60551 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726421AbfFETqF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 15:46:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B948522513;
        Wed,  5 Jun 2019 15:46:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 05 Jun 2019 15:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=fm3; bh=x5A4X9kps/1wo
        CZo+kGU09DojzghTluX+8UD453C1EU=; b=ObdEykcBMNgofV+n93BlMXPN8MqzB
        wsefx1NCZSOHRqcRtliTEsmKjdPDMftpIpxvLVyO6DiYUPvh2A9bF/oZZYVt/ZEs
        K3Nn7EGApw3AzAjRj9Tq+DRAFgl8MbuQR7IVF+veyamKyCoyj6K5+MC3nTu9AOLP
        IZPOErhchXXJQ9/Ww3HKZBjgSSHu5b7egni3QfH5Au2r+1YU1Ycdzoy5rm0CiYeg
        xKnwZ5gfkj7b+92Fpdkrvo83QnkYavBou1LDqSWTcB1jU29gNxOFp7YyXw16K2DF
        VQ5DfCQzbVmR6lr63POimEgEyXMYfQYQ080lyrROKJ21cTG67kO5veVNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x5A4X9kps/1woCZo+
        kGU09DojzghTluX+8UD453C1EU=; b=MScdOzldZ3M09EOmkzGXY5Y+A7hAD3Rc0
        UUix2avlzkqqLMAJ+vN2JFaOYTN6IIzY/qY/D2vuac92H3UbPmOfg3Y2wmmWuUuZ
        3JVkyIfjQ8HamxV+w6UEU2nd2nr9OH7XYXB1MImGJGbP/8flFaKLnlEbDbtxhuBo
        cXM9C8eCIriGXZeBzU2UcNTvneWiC7Dya0jbW+G7452CFPQ+axxLoByRfWZMcGiZ
        BtjH9Xlp7Olu5v37Q6ghDeFRLO08RlrmGDFnX0VoB2JgzRV67DVIbXPnCMdVYS7n
        FF7jpJNOP++v3uj+s0IiRqTtV3JgXv2aYHEKacj3/5yOTmq4cENOA==
X-ME-Sender: <xms:-xv4XOcpDVjl3C59kGkJlemOfAxqlq9KvvGFB_TcMiJ-TmmFozdtXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgvughrohcu
    gggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomheqne
    cukfhppeejtddrvdejrddvjedrudegleenucfrrghrrghmpehmrghilhhfrhhomhepphgv
    ughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dt
X-ME-Proxy: <xmx:-xv4XAYe5B6G50YUuVyUxY_MOaKawo8_81yMw3Hmd9QY4E9v9mSOPA>
    <xmx:-xv4XFYbQhHw8U5_L-7vfTSuxC00aPEKhMZcu7LjgAZY4ufeLoV7zA>
    <xmx:-xv4XFDmzif_eOQIRaVNKEbzY8fdJ1Sde-d8RTt8wZ3xnGvywclwJQ>
    <xmx:-xv4XLEhheAkNJme103pDyi_LMP9egAteDbF5yCUwBXlzO4e6xI4Zg>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0603E80063;
        Wed,  5 Jun 2019 15:46:02 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Read battery voltage from G403 and G900 mice
Date:   Wed,  5 Jun 2019 15:45:29 -0400
Message-Id: <20190605194533.18717-1-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The gaming line of Logitech devices doesn't use the old hidpp20 feature
for battery level reporting. Instead, they report the current voltage
of the battery, in millivolts.

This patch set handles this case by adding a quirk to the devices we know
to have this new feature, in both wired and wireless mode.

This version of the patch set is better split, as well as adding the
quirk to make sure we don't needlessly probe every device connected.

Pedro Vanzella (4):
  HID: hid-logitech-hidpp: add quirk to handle battery voltage
  HID: hid-logitech-hidpp: add function to query battery voltage
  HID: hid-logitech-hidpp: report battery voltage to the power supply
  HID: hid-logitech-hidpp: subscribe to battery voltage events

 drivers/hid/hid-logitech-hidpp.c | 150 ++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

-- 
2.21.0

