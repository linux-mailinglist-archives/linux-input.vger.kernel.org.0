Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DA658F9DE
	for <lists+linux-input@lfdr.de>; Thu, 11 Aug 2022 11:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbiHKJRC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Aug 2022 05:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbiHKJRB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Aug 2022 05:17:01 -0400
Received: from cpd-ras.landau.ac.ru (cpd-ras.landau.ac.ru [83.149.229.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C80C3DBCD
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 02:17:00 -0700 (PDT)
Received: from asus-lashk.lashk ([128.0.135.107])
        (authenticated bits=0)
        by cpd-ras.landau.ac.ru (8.14.3/8.14.3/Debian-9.4) with ESMTP id 27B9Gv4X014287
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 12:16:58 +0300
To:     linux-input@vger.kernel.org
From:   Michael Lashkevich <lashkevi@landau.ac.ru>
Subject: a problem with synaptics touchpad
Openpgp: preference=signencrypt
Autocrypt: addr=lashkevi@landau.ac.ru; keydata=
 xsDiBFQhIL8RBACmWZYCsWRPp8s9M3GY7s/lwNGV8rCsNa2415Pwv+Uyld/F2hsbogCFWmSv
 P9YlTyukX81JA9Kk58zcdTvz0//BNDPlXqBVjVs44PSOt41nYwVjuYeVYeqnVOnLw2rzKMXn
 V+1fnj3eitRyA5zGdWQ4Da+Ia2LllCzU+yjEzS4C3wCg670l4OIQ7GOWfBdceYxOCxS0hAMD
 /0FVdE+dYFItASh9iBxv0eraPFbAjCBfFqhrJMJJXe3SFK38pmCeqp6vz12usOjdQueZXblJ
 nt+6vy/Apg5buemILQKDPM7flfUM9pJJIJsRAO0yAjrH7zvPAG+0EgxAyZ3jymQ6jQtKjboe
 kVWhk+DgahxvqoS3l8isa5uXbeTPA/42AqS/gdVW5CYfHOXmSNqafcrXz2Me+2YPZkiQLYuP
 bdUTNqgHG09N4UoLTd2DGcpnNOW1F59gIB3NvLXizzefODzlUU/f5wrOLf11gURtb30lukoz
 mbmNmK1aju2cUjp5S8tr3BLEMcO3cjZoCkoMMiowK3+8rgM4RB2x+lOOi80qTWljaGFlbCBM
 YXNoa2V2aWNoIDxsYXNoa2V2aUBsYW5kYXUuYWMucnU+wmMEExECACMFAlQhIL8CGyMHCwkI
 BwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRC6AMBHKu0wClduAKDPhoR0YrZGvsl/4jWqX3e0
 6j8bEgCfXprqHUl2Vz0yaF6tRRW9Q8bMas3OwE0EVCEgvxAEAIFF0oW02miwQvcK+K7CnhqT
 r58KAO9EMJNue4NvP2WGL7zd2MTSsG38WNZ1BY+2T6O/hM2WPbp9ZwiXzM/6+lA+XiThPV00
 HGriz7sr3Ke11a3FAG31TCsbt4yugWDN6EcavveWEGnSQ0rrXU7jKGFvHXA3fnwJoU1rJXG1
 eDgrAAMGA/9DLDJimkAKS1+mF4pnjJii5MqOv71AvAryouFRUlS3P5RzU1IoF/D2j74oEMoY
 OrbcgbVbur2aVplH8IVnToeuVd0B5xB0rbc8jVyF+TiOGiARLFg1oNidfwGLgtYILeUUHpmj
 DYePn+xdUznU3ld5kSb296k1x7J+IDijq6kgHMJJBBgRAgAJBQJUISC/AhsMAAoJELoAwEcq
 7TAK6lwAn2qDipsgYIlYhhXsnDHJScTlnQdFAJ0f2jPu8UZdWCyNKa6ij46QmyCI2g==
Message-ID: <02acb391-9a29-227d-43a1-d988a92b73b2@landau.ac.ru>
Date:   Thu, 11 Aug 2022 12:16:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: ru-RU
X-Virus-Scanned: clamav-milter 0.98.1 at cpd
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Lastly I have problems with synaptics touchpad. I set KDE Plasma to disable it, when a mouse is plugged in. But it "revives" very often.

In dmesg I have:

[218746.882290] psmouse serio4: TouchPad at isa0060/serio4/input0 lost synchronization, throwing 5 bytes away.
[218747.399298] psmouse serio4: resync failed, issuing reconnect request
[218747.704260] psmouse serio4: synaptics: device claims to have max coordinates query, but I'm not able to read it.
[218747.731036] psmouse serio4: synaptics: device claims to have min coordinates query, but I'm not able to read it.
[218747.758193] psmouse serio4: synaptics: Unable to initialize device.
[218748.198572] psmouse serio4: synaptics: queried max coordinates: x [..5088], y [..3828]
[218748.230689] psmouse serio4: synaptics: queried min coordinates: x [1024..], y [1044..]
[218748.230699] psmouse serio4: synaptics: Your touchpad (PNP: SYN0a2d SYN0a00 SYN0002 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
[218748.289450] psmouse serio4: synaptics: Touchpad model: 1, fw: 8.1, id: 0x1e2b1, caps: 0xd00323/0x840300/0x126c00/0x0, board id: 2227, fw id: 1396050
[218748.321785] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio4/input/input239

My system: OpenSUSE 15.3.
My kernel: kernel-default-5.3.18-150300.59.87.1.x86_64
