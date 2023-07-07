Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2000674B898
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 23:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbjGGVNS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 17:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbjGGVNR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 17:13:17 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CD71FD8
        for <linux-input@vger.kernel.org>; Fri,  7 Jul 2023 14:12:53 -0700 (PDT)
Received: from [192.168.178.22] ([88.217.88.42]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M89XH-1qN5Pv3zc3-005EHR for <linux-input@vger.kernel.org>; Fri, 07 Jul 2023
 23:12:48 +0200
Message-ID: <e01dbcd2-3ce3-ebaf-e685-3b89601ae55a@rdorf.de>
Date:   Fri, 7 Jul 2023 23:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: de-DE, en-US
To:     linux-input@vger.kernel.org
From:   Werner Sembach <werner@rdorf.de>
Subject: Need information to implement correct handling of the GSP 370
 wireless headset
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:f4wvJIeKXZ8qJHBz7z1xzZVn61EMzbumpx0NhtvcmuZ2Bvj5F61
 SkVzH+P2PqhdcBTKFCGcZiUqcwZs6DLUjYgTE+1Rn08Ln4aRoSz8KtriwDyIKTgaYKXzUoV
 e6eyQAhvV5JE8IlftsCl8tiecHlN1wVugBp46RBf/ztU4SedNJY+/2IyreAiV0tI28vdNo7
 8GzXIkAt6Vzwae3Vlzj4g==
UI-OutboundReport: notjunk:1;M01:P0:l+qFPyAZOyc=;XCFsMr0qZhuqEKtgFAHxIFStjmK
 MWwdL07/KsppjqJ6FClbETIDA7Ol249IsO8CaSgWl49Em5xgapZklXffU0P5BzurR4MafSfie
 dSdeYvmLga8glfAaVPKTxptt6gB5BwTtIUe/J3ipDGVkuIwGAJ9SbSnc5jdUew2XvKy+mNJcK
 fIKunjniYhhu9WrenJG6r/cdyb6N/Ts5NCgMF15Vlv7NU+MP5yBztcSR95cHsc8TcVbE48zcM
 98AFp8D14ZJzbwf85WmfvvBvxcmz72ZfU/LUphk0YmmVpqzR/Ooq2++9anyjgBUngwPaLMEKX
 oFXd4yEjSY3Vzwmc+x3Gv/b2+Ni7RJkJzpuQi3P0b8RsKTqBs/XWQol7v1vermCx8JhtUL7t9
 NO1Zi0RRmorD3Pve7gYwYfn0rJfA8n9K0N/4zheDPrSPIx0CHA8Dl8qCwzjPL0rpZdaUnnN/v
 lRTfrpFPkJmthZof65th0sGFXl9yPAuA+484l7qp0EWj/w2HkXJH4FWOgoCNXjwGhIZAvOFkz
 hNLdtwhnJ0Z0o+IJ07r8tb4TSPon2WRDNCFjMEMd9NJowTMAPAt2lgsLFpLjOvLRwDDvQn8u5
 IMH9bm/52X+1WTqI1HbO4FOuX3nSihQCMNXGiDfhkvVcF4vyMF71w88Of5yi1Kcu+gNu8EumP
 xMOcdVRKPQZyPS7dA+TtGO4ZWafLw+jEUJ9Kjib8DQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

The EPOS GSP 370 wireless headset has a volume control knob on the 
headset. Turning this has 2 effects on Linux:

- The volume gets adjusted in firmware

- A volume up/down key event is sent to the OS and the volume is 
adjustet on the OS level (the dongle registers both as a audio device 
and an usb keyboard to do this)

This double volume adjust is ofc not the intended behavior and induces 
all kinds of wiredness, like the os is already displaying 100% volume 
but you can still turn it higher because the firmware has not yet 
reached max volume.

Running Wireshark on Windows and Linux I recognized that Windows is 
sending "URB_CONTROL out" events to the dongle on volume adjust, which 
Linux doesn't, these events have a paylode that seems to encode a volume 
value in 2 byte with little endianess.

I'm unsure if I can attach pcap file or if it will get blocked in the 
list so i will send them as a reply.

So my 2 questions are:

- What are these USB "URB_CONTROL out" events? (Does not seem to be HID 
reports?)

- In which subsystem would I want to implement them? Or should this be 
handled in userspace?

Bast regards,

Werner

