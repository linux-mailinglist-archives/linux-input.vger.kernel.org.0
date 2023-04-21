Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4FE6EA1B3
	for <lists+linux-input@lfdr.de>; Fri, 21 Apr 2023 04:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbjDUCgH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Apr 2023 22:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjDUCgG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Apr 2023 22:36:06 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BE33A92
        for <linux-input@vger.kernel.org>; Thu, 20 Apr 2023 19:36:02 -0700 (PDT)
Received: from [192.168.0.22] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 780A6A269;
        Thu, 20 Apr 2023 19:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1682044561; bh=a+m0eRsBoFr2HZkm/cBaRCRA2ZGa4lexDy6d9e4s+ec=;
        h=Date:To:From:Subject:Cc:From;
        b=ukeZmxJizl98oczwS1FmBdEd6lnpYHxJ1z7CkUw6sGi4SWsrWluK/5ZhfSP0xZtI3
         U+/n+n7JOdNupU80v306yWW+H9qKU481YTVWjSdxVi/zkMNFM9RhAwzi+lPZRYv3RP
         oo1X+vWxiL3PPNUzCKonZdpknAm6z+r1o3Z6oqTL5PYgz9KQF/tihcLN8dBykqYMQb
         8uNINb97ZwWWI9qkTEn0SoXt9WqN0F2t3o8i5eal1mFFchvb5BU1QLbYqilgTh5Lkh
         RPNwkyZOcsTsqr05C5OG07OnRY0Tqzvzy9cWV1sMS/rk0oExJQ2thbLAlh+C8b1leV
         tr3KZZXaqZtVw==
Message-ID: <a3b1f768-27e9-c9d5-ad2c-c56a48522d41@endrift.com>
Date:   Thu, 20 Apr 2023 19:36:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
From:   Vicki Pfau <vi@endrift.com>
Subject: Proposal: Add a means to disable kernel driver logic when associated
 hidraw is opened
Cc:     Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Following up on a conversation from last year (cf. https://lore.kernel.or=
g/linux-input/CAO-hwJLfY+D0NyCUCncrjcXETKwOBqj1CuHtB_mtGhYfKV0Bww@mail.gm=
ail.com/) about how to approach differing opinions about how drivers shou=
ld work between userspace and kernel, we're looking for a way to effectiv=
ely stop the kernel from doing anything "smart" with a a HID device, e.g.=
 a hid-sony device, when the associated hidraw is opened. At the moment, =
we have a specialized daemon that will find the mouse evdev associated wi=
th the controller when it's created and inhibit it, but this is anything =
but ideal and only handles the mouse itself, not the kernel logic in gene=
ral. You can also see the hackish way this is implemented in the hid-stea=
m driver, which uses an intermediary hid ll_driver to intercept the open =
and close commands and stop passing data if the hidraw gets opened. I con=
sider this implementation to be very much a hack and an anti-pattern, and=
 I think other HID implementers would agree, but I'm not sure there's a c=
leaner way to detect this in the kernel at the moment.

I see a bit of a difference of opinion as to what should be happening her=
e between developers on our end and the kernel end. Our position is "we h=
ave a userspace driver that does everything we want, we'd like the kernel=
 to stop trying to be smart when our driver is active", and I expect the =
kernel developer opinion is "why should you have a userspace driver at al=
l when our kernel driver is fine, and if it's not you can upstream patche=
s?", so there's probably some need to find a middle ground if we want thi=
ngs to work well for users in the end.

We'd previously discussed an ioctl for the hidraw, or perhaps an eBPF app=
roach, though I think at the time of that discussion, eBPF wasn't mature =
for the HID subsystem. I don't know the current state of that, or if it's=
 possible to do this with just write access to the hidraw device (the ide=
al case for how we want to handle this--root is pretty much out of the qu=
estion for an "ideal case"). Since we still don't have a good answer for =
this, as far as I'm aware, I'd like to try to reach an approach that's am=
icable for both sides.

I know that the ioctl approach meant having to introduce logic for progra=
ms in userspace, but in this specific case, and possibly others, that's a=
ctually what we're looking for. Further, the reason root is out is becaus=
e Steam isn't the OS (in most cases), and we want this to only happen whe=
n Steam is running. Having to run a daemon as root underneath Steam would=
 require something like a setuid binary or custom sudo/polkit rules, whic=
h of course need root to set up anyway. So while eBPF may fit some use ca=
ses, e.g. full control over the system via DE or systemd, etc, it's not w=
hat we're looking for here.

Does anyone have opinions on how to proceed from here?

Vicki
