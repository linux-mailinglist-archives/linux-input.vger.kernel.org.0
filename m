Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5656CAD176
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2019 03:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732001AbfIIBMf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Sep 2019 21:12:35 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57293 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731993AbfIIBMf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 8 Sep 2019 21:12:35 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 40F9F635;
        Sun,  8 Sep 2019 21:12:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 08 Sep 2019 21:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outv.im; h=
        message-id:subject:from:to:cc:date:content-type:mime-version
        :content-transfer-encoding; s=fm2; bh=YOOSStNHkPbsacER2s4afhtmjs
        XjZdp1xCFvBBNRbRM=; b=yltR4m8XOJGA3U3Mk7up4Inn+G0QG9Xs/UlFmkssxk
        cbkeWoE0hNnzxGJ9jo3Sveyy+sujKyP24oJoDEAoU2k3F6XgYoN/ujkAFBJ97DVN
        58oFJDcCPDBsmwBjXX/C3m47vAHTfeAqfmL/7G6BIa7Xb8hlfHUMb1nAFY93nMyP
        1dzC9pNObe5oqgDuudnppzye4z6aZ/6WwpCgvTVxmV9qBcb0AMReftcmffx/ElVC
        Q1XfELS/nobQ6b4ekLa95ovIDh+G6DWSj3wNbjfxKRZZCfyOydXxyUyhG7liqhLd
        1+lN8Hu6agWEwhE3FnMCfc0vgmzHVlIIWV1r3rLGoh6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YOOSSt
        NHkPbsacER2s4afhtmjsXjZdp1xCFvBBNRbRM=; b=Io2AvPXs5lwdyB3zKNUvv5
        xnkpQGIkF9Lf8i1onyuLRIzlzrbpz4wkDm2k/pkuUB5CuhepN/AqbJA1KVj/C9ao
        xNC2o4mpbyYxHCzLNWk1u9O2H61v/+0deXEBtpTby2Dwo2cy2C47Cqx1evC9yUYn
        8NiXU9DFr690UKLVUKu0fvA9vuogs1/NDCIKmVp8MSzzoQ2Ul3kiGkSgGwLwZc9h
        qkxLYZEubpfccOGfOiNRGtNd6bUBk0oXno0bJXy3QJp8dA4IZXkvAJlRtHWqTuW0
        aORdHAM6Wb9V4Ksi1w55kE7d+v3fYvq6CqZLIgLo2Ie987LTPqUDxGBEFRP/uqxg
        ==
X-ME-Sender: <xms:Aad1XQ1a77ICsfh4dQEKiAw4Y1scdgULJu1Jb8qT-Ah-HTyG8v5sZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudekhedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvffftggggfesthejredttd
    dtjeenucfhrhhomhepqfhuthhvihcuggcuoehisehouhhtvhdrihhmqeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgpdgrrhgthhhlihhnuhigrdhorhhgnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehisehouhhtvhdrihhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Aad1XZmNN6R24PdZynwzRK-1Uo1R5U3r1NVu8jjvNKfkSQQzIN66Ag>
    <xmx:Aad1XUb_CKr-qesePi2BFdQdjjzbErTvy0G-jmc1tj5bJN9HBThxTg>
    <xmx:Aad1XT8oMWYs2IPx1XwXjZNUx3EDAd6mFExBOuXrh29C9oOpY9zFzg>
    <xmx:Aad1XaH9bl-1YOLo3SRnQQshn-O0sQBh8YFfGqrXAqj76wY0_gZiRg>
Message-ID: <c14d3a654dfc99ca78d548d7605407714bfc0f92.camel@outv.im>
Subject: Request reverting PID C084 and C083 from hid-logitech-hidpp
From:   Outvi V <i@outv.im>
To:     linux-input@vger.kernel.org
Cc:     benjamin.tissores@redhat.com
Date:   Mon, 09 Sep 2019 09:12:28 +0800
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello there,

I'm a user of Logitech G102 Prodigy mouse and find that it doesn't work
well with hid-logitech-hidpp currently, getting message:

> [ 34.187560] logitech-hidpp-device 0003:046D:C084.0002: Device not
connected

The problem seems like as described on commit addf3382, which partially
reverted the commit of adding some PIDs to the list of hid-logitech-
hidpp and fixed the problem. However, this revert hasn't been
backported to 5.2.x. I'm not sure of other models, but PID C084 (which
covers Logitech G102 for me) and PID C083 (someone also report on this
model [1]) have got reports of this kind of problem. Therefore, could
we backport this revert to linux 5.2.x, or at least remove C084 and
C083 on 5.2.x for now?

FYI, I've opened a bug on Bugzilla on this [2].

[1]. https://bugs.archlinux.org/task/63686
[2]. https://bugzilla.kernel.org/show_bug.cgi?id=204795

