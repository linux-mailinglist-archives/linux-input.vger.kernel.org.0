Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA34F9A0FA
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 22:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390489AbfHVUTB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 16:19:01 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58675 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387441AbfHVUTA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 16:19:00 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A24AC210DC;
        Thu, 22 Aug 2019 16:18:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 22 Aug 2019 16:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=fm3; bh=v74Gs0E9r7y8M
        aL4VW5da3joTsP2Xv4qSIdJw1utIeU=; b=qXK47UOGPJvozyGgKHsuJfWCy48Uv
        BMaB6keWW/2v2wdRNM3Nrm+pQrPjboeSvSZdBrcLbBTqQvDoyNAhcAh7uTSTIIIk
        jLIBnxFlRJyUtFwm0AJB8J3fyF9ouM4jS+z/QuDsgdgilzIjjhqE+Az+qwE/1QJW
        BTFbuFuaFZ+gbjRBgupg1zPoZ3LWM99fXcyHmu+eZ3fRICCpYoRw1N7RQ+sT3/bX
        FcQchaBnQVWykt09x/iFR5VFJiuPzKcqC5uJJc8SIx0Y5aZ6OF4RAIFFBXVMKZkf
        rVgIC0ZBCF0KJVH4LHqcyqlBCb3I5j475PKlojVSu1EHckDdUSHFrEwMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=v74Gs0E9r7y8MaL4V
        W5da3joTsP2Xv4qSIdJw1utIeU=; b=UAJJBaxXu1yn3dGeSRSVhdClRybAdZxHz
        Yjv7HQgP4Zfl90WSVu6Wv1nUYiHivo43yUI/voty/C4cRULvf3lcZV6hauKvwd4t
        YXzp/4iKqUcsCL6/vSbJK2ccFL0a01RmGt5DkGmnitBnjYW0P598BdlJIF56p7sI
        4dTVLQ1kP3D3k70Sha3F2rN9waf4rhvQBjuIfP4dgYMYTKS1z350SZkaX7HUEbMz
        LbMmblEqnHWrX3WA1o2D1y7bshPpnpd2YekIQtueGP8y2jy87NOPxnI92pwEkvlS
        CzHDh+4Lk+EQLblkHfCs7/QwH5dz6rALYUy3v42UtS9jHYQQyIfzw==
X-ME-Sender: <xms:s_heXSTSDR2qZMgTFCQGazbmhpvXyV9hZ5YdlEUwca3cuS1Ctcgg4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgvughrohcu
    gggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomheqne
    cukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhepphgv
    ughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dt
X-ME-Proxy: <xmx:s_heXT3aI-bMzub36CU9w25Pz6uzh8P4zYVZ3VgkS5PQES1kmCvS8A>
    <xmx:s_heXVx0MeBlQgB6GWWW_l6YXrndrfNlGnKv3yo61SqAqy5VbhhuYA>
    <xmx:s_heXe9Au-Z_b7Qg2PV3IQnx_wDBWkQoo-ye70m9fz_QOO58bZlhug>
    <xmx:s_heXdbsnXwOelpjkJiDdjhOfSk9w5BPURvpGSo0-b1RHdpetcjYaA>
Received: from localhost (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id BF3B78005A;
        Thu, 22 Aug 2019 16:18:58 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [Resubmit] Read battery voltage from Logitech Gaming mice
Date:   Thu, 22 Aug 2019 16:18:44 -0400
Message-Id: <20190822201849.28924-1-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Resumitting this after having rebased it against the latest changes.

The gaming line of Logitech devices doesn't use the old hidpp20
feature for battery level reporting. Instead, they report the 
current voltage of the battery, in millivolts.

This patch set handles this case by adding a quirk to the 
devices we know to have this new feature, in both wired 
and wireless mode.

This version of the patch set is better split, as well as adding the
quirk to make sure we don't needlessly probe every device connected.


