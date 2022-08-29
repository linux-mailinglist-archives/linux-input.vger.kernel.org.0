Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53BCF5A4B57
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 14:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbiH2MQ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 08:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbiH2MPv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 08:15:51 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815BCA0610
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 04:59:35 -0700 (PDT)
Received: from valentina ([120.152.148.125]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mf0Jg-1p4SGm42B8-00gWvB for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022
 13:58:36 +0200
Date:   Mon, 29 Aug 2022 21:58:27 +1000
From:   Finn Rayment <finn@rayment.fr>
To:     linux-input@vger.kernel.org
Subject: Touchpad LEN0418 PNP0f13 works with psmouse.synaptics_intertouch=1
Message-ID: <20220829115827.3vcmbnm72mwgi6tr@valentina>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:3ALWGa1zcmauEwi/8loUMSDLIFMetsEF5VEN+OHhLXERV/xSzhO
 aekb6mpH+zGxz1ToWb4jqSu04Dw+w2QkugDBgkp+iA9EQXol/H1XqTl79B0GfsrS2pUsM8B
 015AU4wvsQbr5oYaAhLkMFKHZeAv+wzFNzSGwTiqUBXtUD8m9IsQgerwIKR5jsTjyRKGLbb
 Tc1oQUMrMuDYgyw9DB/lQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mfxgo8Hw1yA=:KMrbHcnmObYAWkbxW3VsOn
 teICl1z9ANkFsHMrkQbmgXDvgPYbJKK0ZrWg0aZPLyOdmXgRIiTk+Z8F7I8/rqjcv5pMZWudL
 uUxpNOQtxSMXhS7gx/+8SqG4H8AzPxMkeWJ/fjMhtUSoOmbbks7xPWGAGsWi/0k18WQgbKZ6Q
 x9dxhC7G3OzXK8iEfdX46x51XjLqf2Vt0CpINe4XyMWM258+7fQNPhQoeuOH/hXxmJF8/Zd+N
 4HrPYtFQZsL/neI5g9xIUUJgV40rYZ5UBPYL5SIe2T3TtWMKw9KirR4GXnF84hhi48Z/Lo2qD
 FvMFYj5T8qpCSl+8QlCoCKuEcJ2Gl5wsy8Nal6I+gSJ+fonMEWXyWLUfG0ep9/b6yMLqQPE8U
 Rjlf00LH1fGaLo1YaUazRDArin1KtMVaHUfjnty2UTc6LtWjXQjWlUFHsRcPoq4AHn7qXDDd6
 AYVYWQ/eVhrlyN83KQiqKCQMeUn0cBVk6WrVDtroUQqHh/73TYffMYq/a+Glh5qBopvqWV7Tx
 CCiA9+qIwAH8UaDZ+gFz9UIoQZS5A/gtWON4IpCLmIFu5LCIzzk74bw8i+8FlZTQbaVsAvUQ1
 XHMGpNDjyCatHmo21VTJeOqpFHJLmzx73l41yDCeYDI/sRmbuJOs1c2bgP0ZiN8N4AlydqpVe
 MukzYiTda8+NzLla/3KRyBQNNuWoRZr7AZyffPm8LaQ6NKVodtRRdZQ0liy0G66uzXFskjF81
 wBJhOyu7/frG2A1/bBgO6mbYL14kI5RnJaIT6w==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have received the following message in my kernel logs:

```
[    1.938847] psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
[    1.938858] psmouse serio1: synaptics: Your touchpad (PNP: LEN0418 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
```

I have set `psmouse.synaptics_intertouch=1` in GRUB and booted, suspended to ram
and resumed and find no issues with the touchpad. I am not running either
i2c-hid or hid-rmi.

This is on a Lenovo ThinkPad L14 Gen 2 (AMD ver.) running kernel 5.19.4.

-- 
Finn Rayment
