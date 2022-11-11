Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAF2626014
	for <lists+linux-input@lfdr.de>; Fri, 11 Nov 2022 18:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234159AbiKKRHe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Nov 2022 12:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiKKRHa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Nov 2022 12:07:30 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB6D83B94
        for <linux-input@vger.kernel.org>; Fri, 11 Nov 2022 09:07:01 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 2273A5C0121;
        Fri, 11 Nov 2022 12:06:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 11 Nov 2022 12:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        joshtriplett.org; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1668186419; x=1668272819; bh=tXQ1icX6ct
        MG9VnKVr8kAueS0xK+9gotsh/mdgpsebU=; b=x1+ANy3TmyUCxY8n43NNZF8ipd
        5k/n1cJ4q0NcRoXJlO9jU7y8rJUzkKKFfCe7mqUxUzwQSrQi2+w8euvyKgijndiB
        PztYMuUhkDEk43tylv9UdVTEMV33IC1Nch4behZALT8LEGr4UV4vv8ECkgp2z0rv
        SImFp4voucoNhR+V7oRHGS/PnXzoO5TXFYr9dHmJJnsEGcK4Ef4VFP+GB1yJRRY5
        4QtCsxnEw70X86LiAj+dvIRPk+LgdbYXi7OSRRbS1k6xeS3htaUnBhuFjlKnUVEp
        0pYUXnWHjVe2MyEu5JORaOVNmtO2wgZhdCn9u2MvbK+57oTYQcXqxvkpwyuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668186419; x=
        1668272819; bh=tXQ1icX6ctMG9VnKVr8kAueS0xK+9gotsh/mdgpsebU=; b=s
        Kld5xZrVpW38xaYbN8MGXDEUSdztVnj1ssF5kCb4i/ehMcv0pbX7C2T6ta6AfGpi
        uzD6NzMm2RIjJo19NkStn0gP853t3ebzzd6O60xp1WuCz2i1DNcP+8bdYwJuhly6
        bATj2eLpcCHi4xMECVYKI/Rc9o16pzPJPIlyoxr8ZH3fQqq2mEgm9kb89B+qQy7L
        Phck5VNsgwpNUUP1FYOrYDm3axTx2ExPCaeYistrS6Ad7GqAjo4nilQG37/zCbsf
        y2b+PglnSCB6CLTgmQrAY/RQVCu9MGCut1q5cCq+iQP2Ywg9dx2szT/8iDcf2AXc
        kW4OOZ7U9TvcSS+8zj9dA==
X-ME-Sender: <xms:MoFuY1YTjsDWz-RePC9Uyg9cRCKUT6UN4fWp_eN5uPD16xC-7nNaCQ>
    <xme:MoFuY8abG1GdKAeLi8RqkyKQEQRYb_lr1kSbT55agURSvcKNyyvnpaRavIxwby4fX
    k67Y-83jjhio8YsQSY>
X-ME-Received: <xmr:MoFuY3-PnZwDpwd6pc_x7AXpSeWEqaHUfF1Le-7LnqpNuWd4FYq86snA6oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeigdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesthdtredttd
    dtvdenucfhrhhomheplfhoshhhucfvrhhiphhlvghtthcuoehjohhshhesjhhoshhhthhr
    ihhplhgvthhtrdhorhhgqeenucggtffrrghtthgvrhhnpeduvdelheettdfgvddvleegue
    efudegudevffekjeegffefvdeikeehvdehleekhfenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhhoshhhthhrihhplhgvthhtrd
    horhhg
X-ME-Proxy: <xmx:MoFuYzqf-e2d1nZOu5gkbFocSm1NrHvBJoopap4vgDdGMYf71OVZww>
    <xmx:MoFuYwqsEurIgMpHk0emiYj0hNYNgUQDjwqLuBnyTV3d230_DO2Zxg>
    <xmx:MoFuY5TYojbaPxgw-SV1wkSOYxor3ZrxDTawQSC8BvDYSfb2UvAS5w>
    <xmx:M4FuY9CXy9vAmXbuhxNEy79PNPwYwAF34eZMTBVUhESgI8i6X4yLMQ>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Nov 2022 12:06:58 -0500 (EST)
Date:   Fri, 11 Nov 2022 09:06:57 -0800
From:   Josh Triplett <josh@joshtriplett.org>
To:     linux-input@vger.kernel.org, Jamie Lentin <jm@lentin.co.uk>
Cc:     1006251@bugs.debian.org
Subject: USB Lenovo ThinkPad Compact Keyboard has fn_lock inverted
Message-ID: <Y26BMXn15Kbt6a2u@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have an external ThinkPad USB keyboard:

$ lsusb | grep -i keyboard
Bus 003 Device 022: ID 17ef:6047 Lenovo ThinkPad Compact Keyboard with TrackPoint

The Linux kernel exposes a fn_lock attribute in sysfs for this keyboard:

$ cat
sys/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5.4/3-5.4.3/3-5.4.3:1.1/0003:17EF:6047.000F/fn_lock
1

However, this attribute appears inverted for this particular keyboard:
it seems to be 1 when FnLock is *disabled* and 0 when FnLock is
*enabled*. In order to enable FnLock, I have to write 0 to this file.

(Also, separately from that, it would be nice if the kernel could handle
fn_lock toggling *internally*, rather than expecting userspace to do it.
As far as I can tell, it does handle similar things for some keyboards,
but not this one.)
